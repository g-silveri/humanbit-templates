<?php
    $settings = array(


        ###### ADMIN ######
        'admin' => array(
            'max_upload_size' => '10242880',
            'upload_blacklist' => '/\\.(?:php[34567s]?|phtml)$/i',
        ),
        ########


        ###### SYMPHONY ######
        'symphony' => array(
            'admin-path' => 'humanbit',
            'pagination_maximum_rows' => '20',
            'association_maximum_rows' => '5',
            'lang' => 'en',
            'pages_table_nest_children' => 'no',
            'version' => '2.7.10',
            'cookie_prefix' => 'sym-',
            'session_gc_divisor' => '10',
            'cell_truncation_length' => '75',
            'enable_xsrf' => 'yes',
            'error_reporting_all' => 'yes',
        ),
        ########


        ###### LOG ######
        'log' => array(
            'archive' => '1',
            'maxsize' => '102400',
            'filter' => 24575,
        ),
        ########


        ###### DATABASE ######
        'database' => array(
            'host' => 'localhost',
            'port' => '3306',
            'user' => 'webuser',
            'password' => 'webuser',
            'db' => 'humanbit_template_v2',
            'tbl_prefix' => 'sym_',
            'query_caching' => 'on',
            'query_logging' => 'on',
        ),
        ########


        ###### PUBLIC ######
        'public' => array(
            'display_event_xml_in_source' => 'no',
        ),
        ########


        ###### GENERAL ######
        'general' => array(
            'sitename' => 'Humanbit Template',
            'useragent' => 'Symphony/2.7.10',
        ),
        ########


        ###### FILE ######
        'file' => array(
            'write_mode' => '0644',
        ),
        ########


        ###### DIRECTORY ######
        'directory' => array(
            'write_mode' => '0755',
        ),
        ########


        ###### REGION ######
        'region' => array(
            'time_format' => 'H:i:s',
            'date_format' => 'm/d/Y',
            'datetime_separator' => ' ',
            'timezone' => 'Europe/Rome',
        ),
        ########


        ###### CACHE_DRIVER ######
        'cache_driver' => array(
            'default' => 'database',
        ),
        ########


        ###### MAINTENANCE_MODE ######
        'maintenance_mode' => array(
            'enabled' => 'no',
            'ip_whitelist' => null,
            'useragent_whitelist' => null,
        ),
        ########


        ###### IMAGE ######
        'image' => array(
            'cache' => '1',
            'quality' => '90',
            'allow_origin' => null,
            'disable_regular_rules' => 'no',
            'disable_upscaling' => 'no',
            'disable_proxy_transform' => 'no',
        ),
        ########


        ###### ANTI-BRUTE-FORCE ######
        'anti-brute-force' => array(
            'restrict-access' => 'off',
            'remote-addr-key' => 'REMOTE_ADDR',
            'length' => '60',
            'failed-count' => '5',
            'gl-duration' => '30',
            'gl-threshold' => '5',
            'auto-unban' => 'off',
        ),
        ########


        ###### TINYMCE ######
        'tinymce' => array(
            'imagepath' => '/var/www/humanbit-bessex-template-v1/workspace/tinymce/images/',
        ),
        ########


        ###### MEMBERS ######
        'members' => array(
            'cookie-prefix' => 'sym-members',
            'section' => '7',
        ),
        ########


        ###### MEMBERS_GOOGLE_LOGIN ######
        'members_google_login' => array(
            'client-id' => '284489183604-emhqfv1rl58hiqqs2ude4c1je9s7jtc6.apps.googleusercontent.com',
            'client-secret' => 'A9cAniy-R9JkwYeL2KVm7pIo',
            'client-redirect-url' => 'https://linetobe.com/google/',
            'members-section-id' => '3',
            'member-firstname-field' => '76',
            'member-lastname-field' => '77',
            'member-password-field' => '15',
            'member-registered-since' => '13',
            'member-profile-thumbnail' => '293',
        ),
        ########


        ###### MEMBERS_FACEBOOK_LOGIN ######
        'members_facebook_login' => array(
            'fb-app-id' => '2077030142455169',
            'fb-app-secret' => 'a4b61e1f44a8efc63d28225c18958b03',
            'fb-app-redirect-url' => 'https://linetobe.com/facebook/',
            'members-section-id' => '3',
            'member-firstname-field' => '76',
            'member-lastname-field' => '77',
            'member-password-field' => '15',
            'member-registered-since' => '13',
            'member-profile-thumbnail' => '293',
        ),
        ########


        ###### MEMBERS_TWITTER_LOGIN ######
        'members_twitter_login' => array(
            'key' => 'PPsx6VUCGydr7VGcjzdWqbRbP',
            'secret' => '8JcFtBifqFXpUuk6htQcWYnT4rTQBhL3RZNlDzwVxzAcvxsDgf',
            'client-redirect-url' => 'https://linetobe.com/twitter/',
            'members-section-id' => '3',
            'twitter-handle-field' => '76',
            'member-username-field' => '337',
            'member-password-field' => '15',
            'member-registered-since' => '13',
            'member-profile-thumbnail' => '293',
        ),
        ########


        ###### MEMBERS_LINKEDIN_LOGIN ######
        'members_linkedin_login' => array(
            'client-id' => '77dnjshkdl66mu',
            'secret' => 'A9OE7UsO66X6Cbd4',
            'client-redirect-url' => 'https://linetobe.com/linkedin/',
            'members-section-id' => '3',
            'member-firstname-field' => '76',
            'member-lastname-field' => '77',
            'member-password-field' => '15',
            'member-registered-since' => '13',
            'member-profile-thumbnail' => '293',
        ),
        ########


        ###### MEMBER_LAST_VISIT ######
        'member_last_visit' => array(
            'interval' => '5',
        ),
        ########


        ###### EMAIL ######
        'email' => array(
            'default_gateway' => 'sendmail',
        ),
        ########


        ###### EMAIL_SENDMAIL ######
        'email_sendmail' => array(
            'from_name' => null,
            'from_address' => null,
        ),
        ########


        ###### EMAIL_SMTP ######
        'email_smtp' => array(
            'helo_hostname' => null,
            'from_name' => null,
            'from_address' => null,
            'host' => '127.0.0.1',
            'port' => '25',
            'secure' => 'no',
            'auth' => '0',
            'username' => null,
            'password' => null,
        ),
        ########


        ###### REMOTE_DATASOURCE ######
        'remote_datasource' => array(
            'csv-delimiter' => ',',
            'csv-enclosure' => '"',
            'csv-escape' => '\\',
        ),
        ########


        ###### SORTING ######
        'sorting' => array(
            'section_documentazione-category_sortby' => '53',
            'section_documentazione_sortby' => '54',
            'section_moduli_sortby' => '56',
            'data_sources_index_sortby' => 'author',
            'data_sources_index_order' => 'asc',
            'section_translate_sortby' => 84,
            'section_moduli-category_sortby' => 87,
        ),
        ########


        ###### DATETIME ######
        'datetime' => array(
            'italian' => 'it, it_IT.UTF8, it_IT',
        ),
        ########
    );
