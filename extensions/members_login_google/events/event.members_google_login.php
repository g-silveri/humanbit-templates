<?php

require_once(TOOLKIT . '/class.event.php');
require_once(TOOLKIT . '/class.cryptography.php');
require_once(EXTENSIONS . '/members_login_google/extension.driver.php');

class eventmembers_google_login extends Event
{
    public static function about()
    {
        return array(
            'name' => extension_members_login_google::EXT_NAME,
            'author' => array(
                'name' => 'Tilo Schröder',
                'website' => 'https://bluesky-systems.de',
                'email' => 'info@bluesky-systems.de',
            ),
            'version' => '1.0.0',
            'release-date' => '2019-06-12T12:15:00+00:00',
            'trigger-condition' => 'member-google-action[login]',
        );
    }

    public function priority()
    {
        return self::kHIGH;
    }

    public static function getSource()
    {
        return extension_members_login_google::EXT_NAME;
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
        $CLIENT_ID = Symphony::Configuration()->get('client-id', 'members_google_login');
        $CLIENT_SECRET = Symphony::Configuration()->get('client-secret', 'members_google_login');
        $CLIENT_REDIRECT_URL = Symphony::Configuration()->get('client-redirect-url', 'members_google_login');
        $MEMBERS_SECTION_ID = Symphony::Configuration()->get('members-section-id', 'members_google_login');

        if(is_array($_POST['member-google-action']) && isset($_POST['member-google-action']['login'])) {
            $USER_INFO = urlencode('https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email');
            $_SESSION['OAUTH_SERVICE'] = 'google';
            $_SESSION['OAUTH_START_URL'] = $_REQUEST['redirect'];
            $_SESSION['OAUTH_CALLBACK_URL'] = $CLIENT_REDIRECT_URL;
            $_SESSION['OAUTH_MEMBERS_SECTION_ID'] = $MEMBERS_SECTION_ID;
            $_SESSION['OAUTH_TOKEN'] = null;

            $url = "https://accounts.google.com/o/oauth2/auth?scope=$USER_INFO&redirect_uri=$CLIENT_REDIRECT_URL&response_type=code&client_id=$CLIENT_ID&access_type=online";
            redirect($url);

        } elseif (isset($_POST['code'])) {
            $gdata = $this->getAccessToken($CLIENT_ID, $CLIENT_REDIRECT_URL, $CLIENT_SECRET, $_POST['code']);

            if (isset($gdata) && is_array($gdata) === true) {
                $_SESSION['ACCESS_TOKEN'] = $gdata['access_token'];
                $user_info = $this->getUserProfileInfo($gdata['access_token']);

                if (is_array($user_info) && isset($user_info['email'])) {
                    $_SESSION['OAUTH_TIMESTAMP'] = time();
                    $_SESSION['OAUTH_SERVICE'] = 'google';
                    $_SESSION['ACCESS_TOKEN_SECRET'] = null;
                    $_SESSION['OAUTH_USER_ID'] = $user_info['id'];
                    $_SESSION['OAUTH_USER_NAME'] = $user_info['name'];
                    $_SESSION['OAUTH_USER_IMG'] =  $user_info['picture'];
                    $_SESSION['OAUTH_USER_CITY'] = $user_info['locale'];
                    $_SESSION['OAUTH_USER_EMAIL'] = $user_info['email'];

                    $edriver = Symphony::ExtensionManager()->create('members');
                    $edriver->setMembersSection($_SESSION['OAUTH_MEMBERS_SECTION_ID']);
                    $femail = $edriver->getField('email');
                    $mdriver = $edriver->getMemberDriver();
                    $email = $user_info['email'];
                    $m = $femail->fetchMemberIDBy($email);

                    $username_id = substr($user_info['id'], 0, 5);
                    $password = Cryptography::hash($user_info['id']);

                    if (!$m) {
                        $m = new Entry();
                        $m->set('section_id', $_SESSION['OAUTH_MEMBERS_SECTION_ID']);
                        $m->setData($femail->get('id'), array('value' => $email));
                        $memberFirstname = Symphony::Configuration()->get('member-firstname-field', 'members_google_login');
                        if ($memberFirstname and !empty($user_info['given_name'])) {
                            $m->setData(General::intval($memberFirstname), array(
                                'value' => $user_info['given_name'],
                            ));
                        }
                        $memberLastname = Symphony::Configuration()->get('member-lastname-field', 'members_google_login');
                        if ($memberLastname and !empty($user_info['family_name'])) {
                            $m->setData(General::intval($memberLastname), array(
                                'value' => $user_info['family_name'],
                            ));
                        }
                        $memberUsername = Symphony::Configuration()->get('member-username-field', 'members_google_login');
                        if ($memberFirstname and !empty($user_info['family_name'])) {
                            $m->setData(General::intval($memberUsername), array(
                                'value' => strtolower($user_info['given_name'] . $username_id),
                            ));
                        }
                        $memberPassword = Symphony::Configuration()->get('member-password-field', 'members_google_login');
                        if ($memberPassword) {
                            $m->setData(General::intval($memberPassword), array(
                                'password' => $password,
                            ));
                        }
                        $memberSince = Symphony::Configuration()->get('member-registered-since', 'members_google_login');
                        if ($memberSince) {
                            $today = $this->_env['param']['today'];
                            $time = $this->_env['param']['current-time'];
                            $m->setData(General::intval($memberSince), array(
                                'activated' => 'yes',
                                'timestamp' => $today . ' ' . $time,
                            ));
                        }
                        $memberThumb = Symphony::Configuration()->get('member-profile-thumbnail', 'members_google_login');
                        if ($memberThumb) {
                            $link = $user_info['picture'];
                            $m->setData(General::intval($memberThumb), array(
                                'value' => $link,
                            ));
                        }
                        $memberLoginType = Symphony::Configuration()->get('member-login-type', 'members_google_login');
                        if ($memberLoginType) {
                            $m->setData(General::intval($memberLoginType), array(
                                'value' => 'google',
                            ));
                        }
                        $m->commit();
                        $m = $m->get('id');
                    }

                    $_SESSION['OAUTH_MEMBER_ID'] = $m;
                    $login = $mdriver->login(array(
                        'email' => $email,
                        'password' => $user_info['id'],
                    ));

                    if ($login) {
                        redirect($_SESSION['OAUTH_START_URL']);
                    } else  {
                        throw new Exception('Google login failed');
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
        } elseif (is_array($_POST['member-google-action']) && isset($_POST['member-google-action']['logout']) ||
                  is_array($_POST['member-action']) && isset($_POST['member-action']['logout'])) {
            $_SESSION['OAUTH_SERVICE'] = null;
            $_SESSION['OAUTH_START_URL'] = null;
            $_SESSION['OAUTH_MEMBERS_SECTION_ID'] = null;
            $_SESSION['OAUTH_TOKEN'] = null;
            session_destroy();
        }
    }

    private function getAccessToken($client_id, $redirect_uri, $client_secret, $code)
    {
        $url = 'https://www.googleapis.com/oauth2/v4/token';

        $curlPost = 'client_id=' . $client_id . '&redirect_uri=' . $redirect_uri . '&client_secret=' . $client_secret . '&code='. $code . '&grant_type=authorization_code';

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
        $data = json_decode(curl_exec($ch), true);
        $http_code = curl_getinfo($ch,CURLINFO_HTTP_CODE);

        if($http_code !== 200) {
            throw new Exception('Error : Failed to recieve access token');
        }

        return $data;
    }

    private function getUserProfileInfo($access_token) 
    {
        // See: https://any-api.com/googleapis_com/oauth2/docs/userinfo/oauth2_userinfo_get
        $url = 'https://www.googleapis.com/oauth2/v2/userinfo?fields=name,given_name,family_name,email,id,locale,picture,verified_email';

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Authorization: Bearer '. $access_token));
        $data = json_decode(curl_exec($ch), true);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        if($http_code !== 200) {
            throw new Exception('Error : Failed to get user information');
        }

        return $data;
    }

}
