# Members: Google Login 

> Logs in users using Google Log in

## Specs

This extension creates a user account with the data from a Google user account and automatically logs in the user.

The following user information are supported:

- users email
- users firstname
- users lastname
- username (build from the users name)
- registered since

## Requirements

- Symphony CMS version 2.7.x
- Members extension version 1.9.0

## Installation

- `git clone` or download and unpack
- Upload the extension into the extension directory
- Enable/install it just like any other extension

## How to use in 3 steps

### 1. Create a new Member section

Create a new Member section with the following fields:

- Member: Email (required) <br /><em>make sure, the handle of the field is `email`</em>
- Text Input for username (optional)
- Text Input for firstname (optional)
- Text Input for lastname (optional)
- Date Field for 'registered since' (optional)

Go to 'System' -> 'Preferences' and add the Member section to the 'Active Members Section'.

After this open the `config.php` and add the required configuration values:

```php
###### MEMBERS_GOOGLE_LOGIN ######
'members_google_login' => array(
    'client-id' => 'REPLACE ME',
    'client-secret' => 'REPLACE ME',
    'client-redirect-url' => 'https://example.org/google/', // The redirect URI (see next step)
    'members-section-id' => 5,         // ID of the above created Member section
    'member-username-field' => '10',   // Field ID (optional)
    'member-firstname-field' => '11',  // Field ID (optional)
    'member-lastname-field' => '12',   // Field ID (optional)
    'member-registered-since' => '13', // Field ID (optional)
),
########
```

### 2. Create a new page (Redirect URI)

Create a new page (e.g. "Google") and attach the event __Members: Google Login__ on it.

Add the following form to the new page to handle the log in process when the user will successfully redirected from Google:

```xslt
<xsl:if test="string-length(/data/params/url-code) != 0">
    <form id="googleform" method="POST" action="{$current-url}/">
        <input type="hidden" name="code" value="{/data/params/url-code}" />
        <button>Validate</button>
    </form>
    <script>if (window.googleform) googleform.submit();</script>
</xsl:if>
```

Add the following login form to a desired page (e.g. the home page):

```xslt
<form action="{$root}/google/" method="POST">
    <input type="hidden" name="redirect" value="{$root}" />
    <input type="hidden" name="member-google-action[login]" value="Login" />
    <button>Log in with Google</button>
</form>
```

This form will redirect to the new page /google/ and the user will see the Google dialog and then Google will redirect the user to the 'Redirect URI' value.

If everything works, the user will be redirected to the 'redirect' value, just like the standard Members login (e.g. Log in via form).

### 3. Create a Google API Console Project

Go to the [Google API Console](https://console.developers.google.com/).

Create a __New Project__:

- Enter the __Project Name__
- Click the __Create__ button

Select __Credentials__ under the __APIs & Services__ section in the left side navigation panel.

Select the __OAuth consent screen__ tab:

- Enter the name of your Application
- Choose an email address for user support
- Enter in __Authorized domains__ the domain(s), which will be allowed to authenticate using OAuth
- Click the __Save__ button

Select the __Credentials__ tab, click the __Create credentials__ drop-down menu and select __OAuth client ID__:

- Select __Web application__
- Enter the above created page in __Authorized redirect URIs__ field (e.g. https://example.org/google/)
- Click the __Create__ button

## See a working demo [here](https://login.bluesky-systems.eu)
