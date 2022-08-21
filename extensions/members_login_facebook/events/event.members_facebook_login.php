<?php

require_once(TOOLKIT . '/class.event.php');
require_once(TOOLKIT . '/class.cryptography.php');
require_once(EXTENSIONS . '/members_login_facebook/extension.driver.php');

class eventmembers_facebook_login extends Event
{
    public static function about()
    {
        return array(
            'name' => extension_members_login_facebook::EXT_NAME,
            'author' => array(
                'name' => 'Deux Huit Huit',
                'website' => 'https://deuxhuithuit.com/',
                'email' => 'open-source@deuxhuithuit.com',
            ),
            'version' => '1.0.0',
            'release-date' => '2017-10-20T20:44:57+00:00',
            'trigger-condition' => 'member-facebook-action[login]'
        );
    }

    public function priority()
    {
        return self::kHIGH;
    }

    public static function getSource()
    {
        return extension_members_login_facebook::EXT_NAME;
    }

    public static function allowEditorToParse()
    {
        return false;
    }

    public function load()
    {
        try {
            $this->trigger();
        } catch (Exception $ex) {
            if (Symphony::Log()) {
                Symphony::Log()->pushExceptionToLog($ex, true);
            }
        }
    }

    public function trigger()
    {
        $FB_APP_ID = Symphony::Configuration()->get('fb-app-id', 'members_facebook_login');
        $FB_APP_SECRET = Symphony::Configuration()->get('fb-app-secret', 'members_facebook_login');
        $FB_APP_REDIRECT_URL = Symphony::Configuration()->get('fb-app-redirect-url', 'members_facebook_login');
        $MEMBERS_SECTION_ID = Symphony::Configuration()->get('members-section-id', 'members_facebook_login');
        
        if (is_array($_POST['member-facebook-action']) && isset($_POST['member-facebook-action']['login'])) {
            echo '<script>console.log("primo if")</script>';
            $_SESSION['OAUTH_SERVICE'] = 'facebook';
            $_SESSION['OAUTH_START_URL'] = $_REQUEST['redirect'];
            $_SESSION['OAUTH_CALLBACK_URL'] = $FB_APP_REDIRECT_URL;
            $_SESSION['OAUTH_MEMBERS_SECTION_ID'] = $MEMBERS_SECTION_ID;
            $_SESSION['OAUTH_TOKEN'] = null;

            $url = "https://www.facebook.com/dialog/oauth?client_id=$FB_APP_ID&scope=email&response_type=code&redirect_uri=$FB_APP_REDIRECT_URL";

            redirect($url);

        } elseif (isset($_POST['code'])) {
            $g = new Gateway();
            $url = "https://graph.facebook.com/oauth/access_token?client_id=$FB_APP_ID&client_secret=$FB_APP_SECRET&code=" .$_REQUEST['code'] ."&redirect_uri=$FB_APP_REDIRECT_URL";
            $g->init($url);
            $response = @$g->exec();
            if ($response !== false) {
                $response = @json_decode($response);
            }
            if (!$response) {
                throw new Exception('Failed to get the access token');
            }
            
            if (is_object($response) && isset($response->access_token)) {
                $_SESSION['ACCESS_TOKEN'] = $response->access_token;
                $appsecret_proof= hash_hmac('sha256', $response->access_token, $FB_APP_SECRET); 
                $g = new Gateway();
                $url = "https://graph.facebook.com/me?fields=id,name,email&access_token=" .$response->access_token .'&appsecret_proof=' .$appsecret_proof;
                $g->init($url);
                $response = @$g->exec();
                
                if ($response !== false) {
                    $response = json_decode($response);
                }

                if (!$response) {
                    throw new Exception('Failed to get the access token url');
                }
                
                if (is_object($response) && isset($response->name)) {
                    $_SESSION['OAUTH_TIMESTAMP'] = time();
                    $_SESSION['OAUTH_SERVICE'] = 'facebook';
                    $_SESSION['ACCESS_TOKEN_SECRET'] = null;
                    $_SESSION['OAUTH_USER_ID'] = $response->id;
                    $_SESSION['OAUTH_USER_NAME'] = $response->name;
                    $_SESSION['OAUTH_USER_IMG'] = 'https://graph.facebook.com/' . $response->id . '/picture';
                    $_SESSION['OAUTH_USER_EMAIL'] = $response->email;
                    if (empty($response->email)) {
                        throw new Exception('User did not gave email permission');
                    }

                    $member_id = $_POST['member'];
                    $username_id = substr($response->id, 0, 5);
                    $password = Cryptography::hash($response->id);

                    $edriver = Symphony::ExtensionManager()->create('members');
                    $edriver->setMembersSection($_SESSION['OAUTH_MEMBERS_SECTION_ID']);
                    $femail = $edriver->getField('email');
                    $mdriver = $edriver->getMemberDriver();
                    $email = $response->email;
                    $m = $femail->fetchMemberIDBy($email);
                        
                    if (!$m) {

                        $m = new Entry();
                        $m->set('section_id', $_SESSION['OAUTH_MEMBERS_SECTION_ID']);
                        $m->setData($femail->get('id'), array('value' => $email));

                        $memberFirstName = Symphony::Configuration()->get('member-firstname-field', 'members_facebook_login');
                        $memberLastName = Symphony::Configuration()->get('member-lastname-field', 'members_facebook_login');
                        $memberUsername = Symphony::Configuration()->get('member-username-field', 'members_facebook_login');
                        $memberPassword = Symphony::Configuration()->get('member-password-field', 'members_facebook_login');
                        $memberSince = Symphony::Configuration()->get('member-registered-since', 'members_facebook_login');
                        $memberThumb = Symphony::Configuration()->get('member-profile-thumbnail', 'members_facebook_login');
                        $memberLoginType = Symphony::Configuration()->get('member-login-type', 'members_facebook_login');
                        if ($memberFirstName and $memberLastName and !empty($response->name)) {
                            $name = explode(" ", $response->name, 2);
                            $m->setData(General::intval($memberFirstName), array(
                                'value' => $name[0],
                            ));
                            $m->setData(General::intval($memberLastName), array(
                                'value' => $name[1],
                            ));
                        }
                        if ($memberUsername and !empty($response->name)) {
                            $name = explode(" ", $response->name, 2);
                            $m->setData(General::intval($memberUsername), array(
                                'value' => strtolower($name[0] . $username_id),
                            ));
                        }
                        if ($memberPassword) {
                            $m->setData(General::intval($memberPassword), array(
                                'password' => $password,
                            ));
                        }
                        if ($memberSince) {
                            $today = $this->_env['param']['today'];
                            $time = $this->_env['param']['current-time'];
                            $m->setData(General::intval($memberSince), array(
                                'activated' => 'yes',
                                'timestamp' => $today . ' ' . $time,
                            ));
                        }
                        if ($memberThumb) {
                            $link = 'https://graph.facebook.com/' . $response->id . '/picture';
                            $m->setData(General::intval($memberThumb), array(
                                'value' => $link,
                            ));
                        }
                        if ($memberLoginType) {
                            $m->setData(General::intval($memberLoginType), array(
                                'value' => 'facebook',
                            ));
                        }

                        $m->commit();

                    }
                    $_SESSION['OAUTH_MEMBER_ID'] = $m;
                    $login = $mdriver->login(array(
                        'email' => $email,
                        'password' => $response->id,
                    ));
                    if ($login) {
                        redirect($_SESSION['OAUTH_START_URL']);
                        return $result; 
                    } else {
                        throw new Exception('Facebook login failed');
                    }
                } else {
                    $_SESSION['OAUTH_SERVICE'] = null;
                    $_SESSION['ACCESS_TOKEN'] = null;
                    $_SESSION['OAUTH_TIMESTAMP'] = 0;
                    session_destroy();
                }
            } else {
                $_SESSION['OAUTH_SERVICE'] = null;
                $_SESSION['OAUTH_START_URL'] = null;
                $_SESSION['OAUTH_MEMBERS_SECTION_ID'] = null;
                $_SESSION['OAUTH_TOKEN'] = null;
                session_destroy();
            }
        } elseif (is_array($_POST['member-facebook-action']) && isset($_POST['member-facebook-action']['logout']) ||
                  is_array($_POST['member-action']) && isset($_POST['member-action']['logout'])) {
            $_SESSION['OAUTH_SERVICE'] = null;
            $_SESSION['OAUTH_START_URL'] = null;
            $_SESSION['OAUTH_MEMBERS_SECTION_ID'] = null;
            $_SESSION['OAUTH_TOKEN'] = null;
            session_destroy();
            
        }
    }
}
