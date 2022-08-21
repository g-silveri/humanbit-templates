# Members: Facebook Login

> Logs in users using Facebook Log in

### SPECS ###

Automatically creates account and logs in the user.

### REQUIREMENTS ###

- Symphony CMS version 2.7.x and up (as of the day of the last release of this extension)
- Members extension version 1.9.0

### INSTALLATION ###

- `git clone` / download and unpack the tarball file
- Put into the extension directory
- Enable/install just like any other extension

You can also install it using the [extension downloader](http://symphonyextensions.com/extensions/extension_downloader/).

For more information, see <http://getsymphony.com/learn/tasks/view/install-an-extension/>

### HOW TO USE ###

- Enable the extension
- Create a new Member section with only a email field (no password)
- Set the required configuration values:

```php
###### MEMBERS_FACEBOOK_LOGIN ######
'members_facebook_login' => array(
    'fb-app-id' => 'REPLACE ME',
    'fb-app-secret' => 'REPLACE ME',
),
########
```

- Create a page and attach the "Members: Facebook login" event on it
- Create the login form:

```html
<form action="/facebook/" method="POST">
    <input type="hidden" name="redirect" value="/facebook/" />
    <input type="hidden" name="callback" value="/facebook/" />
    <input type="hidden" name="members-section-id" value="<Your section id>" />
    <input type="hidden" name="member-facebook-action[login]" value="Login" />
    <button>Log in with Facebook</button>
</form>
```

This form will redirect the user to facebook and then facebook will redirect the user to the 'callback' value.

- Add another form to handle the actual log in process when the user comes back from facebook. This form can be auto-submitted

```xslt
<xsl:if test="string-length(/data/params/url-code) != 0">
    <form id="facebookform" method="POST" action="{$current-url}/">
        <input type="hidden" name="code" value="{/data/params/url-code}" />
        <button>Validate</button>
    </form>
    <script>if (window.facebookform) facebookform.submit();</script>
</xsl:if>
```

- If everything works, the user will be redirected to the 'redirect' value, just like the standard Members login.

### LICENSE ###

MIT <http://deuxhuithuit.mit-license.org>

*Voila !*

Come say hi! -> <https://deuxhuithuit.com/>
