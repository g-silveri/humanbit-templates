<?php

class eventpush_notifications extends SectionEvent
{
    public $ROOTELEMENT = 'push-notifications';

    public $eParamFILTERS = array(
        'admin-only',
        'xss-fail',
        'validate-xsrf'
    );

    public static function about()
    {
        return array(
            'name' => 'push-notifications',
            'author' => array(
                'name' => 'Andrea Borreca',
                'website' => 'https://ecom1.humanbit.com',
                'email' => 'borreca@humanbit.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2022-02-07T12:31:34+00:00',
            'trigger-condition' => 'action[push-notifications]'
        );
    }

    public static function getSource()
    {
        return '8';
    }

    public static function allowEditorToParse()
    {
        return true;
    }

    public static function documentation()
    {
        return '
                <h3>Success and Failure XML Examples</h3>
                <p>When saved successfully, the following XML will be returned:</p>
                <pre class="XML"><code>&lt;push-notifications result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/push-notifications></code></pre>
                <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned.</p>
                <pre class="XML"><code>&lt;push-notifications result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;field-name type="invalid | missing" />
...&lt;/push-notifications></code></pre>
                <p>The following is an example of what is returned if any options return an error:</p>
                <pre class="XML"><code>&lt;push-notifications result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;filter name="admin-only" status="failed" />
    &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
...&lt;/push-notifications></code></pre>
                <h3>Example Front-end Form Markup</h3>
                <p>This is an example of the form markup you can use on your frontend:</p>
                <pre class="XML"><code>&lt;form method="post" action="{$current-url}/" enctype="multipart/form-data">
    &lt;input name="MAX_FILE_SIZE" type="hidden" value="2097152" />
    &lt;label>title
        &lt;input name="fields[title]" type="text" />
    &lt;/label>
    &lt;label>subtitle
        &lt;input name="fields[subtitle]" type="text" />
    &lt;/label>
    &lt;label>body
        &lt;textarea name="fields[body]" rows="15" cols="50">&lt;/textarea>
    &lt;/label>
    &lt;label>image
        &lt;input name="fields[image]" type="file" />
    &lt;/label>
    &lt;label>fonte
        &lt;input name="fields[fonte]" type="text" />
    &lt;/label>
    &lt;input name="fields[category]" type="hidden" value="..." />
    &lt;label>order
        &lt;input name="fields[order]" type="text" />
    &lt;/label>
    &lt;input name="action[push-notifications]" type="submit" value="Submit" />
&lt;/form></code></pre>
                <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
                <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
                <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
                <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="https://ecom1.humanbit.com/success/" /></code></pre>
                <p>To validate a XSRF token, ensure it is passed in the form.</p>
                <pre class="XML"><code>&lt;input name="xsrf" type="hidden" value="{$cookie-xsrf-token}" /></code></pre>';
    }

    public function load()
    {
        if (isset($_POST['action']['push-notifications'])) {
            return $this->__trigger();
        }
    }

}
