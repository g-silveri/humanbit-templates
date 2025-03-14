<?php

/**
 * @package content
 */

/**
 * Controller page for all Symphony Author related activity
 * including making new Authors, editing Authors or deleting
 * Authors from Symphony
 */

class contentSystemAuthors extends AdministrationPage
{
    public $_Author;
    public $_errors = array();

    public function sort(&$sort, &$order, $params)
    {
        if (is_null($sort) || $sort == 'name') {
            return AuthorManager::fetch("first_name $order,  last_name", $order);
        } else {
            $sort = General::sanitize($sort);
        }

        return AuthorManager::fetch($sort, $order);
    }

    public function __viewIndex()
    {
        $this->setPageType('table');
        $this->setTitle(__('%1$s &ndash; %2$s', array(__('Authors'), __('Symphony'))));

        if (Symphony::Author()->isDeveloper() || Symphony::Author()->isManager()) {
            $this->appendSubheading(__('Authors'), Widget::Anchor(__('Create New'), Administration::instance()->getCurrentPageURL().'new/', __('Create a new author'), 'create button', null, array('accesskey' => 'c')));
        } else {
            $this->appendSubheading(__('Authors'));
        }

        Sortable::initialize($this, $authors, $sort, $order);

        $columns = array(
            array(
                'label' => __('Name'),
                'sortable' => true,
                'handle' => 'name'
            ),
            array(
                'label' => __('Email Address'),
                'sortable' => true,
                'handle' => 'email'
            ),
            array(
                'label' => __('Last Seen'),
                'sortable' => true,
                'handle' => 'last_seen'
            )
        );

        if (Symphony::Author()->isDeveloper() || Symphony::Author()->isManager()) {
            $columns = array_merge($columns, array(
                array(
                    'label' => __('User Type'),
                    'sortable' => true,
                    'handle' => 'user_type'
                ),
                array(
                    'label' => __('Language'),
                    'sortable' => true,
                    'handle' => 'language'
                )
            ));
        }

        /**
         * Allows the creation of custom table columns for each author. Called
         * after all the table headers columns have been added.
         *
         * @delegate AddCustomAuthorColumn
         * @since Symphony 2.7.0
         * @param string $context
         * '/system/authors/'
         * @param array $columns
         * An array of the current columns, passed by reference
         */
        Symphony::ExtensionManager()->notifyMembers('AddCustomAuthorColumn', '/system/authors/', array(
            'columns' => &$columns,
        ));

        $aTableHead = Sortable::buildTableHeaders($columns, $sort, $order, (isset($_REQUEST['filter']) ? '&amp;filter=' . $_REQUEST['filter'] : ''));

        $aTableBody = array();

        if (!is_array($authors) || empty($authors)) {
            $aTableBody = array(
                Widget::TableRow(array(Widget::TableData(__('None found.'), 'inactive', null, count($aTableHead))), 'odd')
            );
        } else {
            foreach ($authors as $a) {
                // Setup each cell
                if (
                    (Symphony::Author()->isDeveloper() || (Symphony::Author()->isManager() && !$a->isDeveloper()))
                    || Symphony::Author()->get('id') == $a->get('id')
                ) {
                    $td1 = Widget::TableData(
                        Widget::Anchor($a->getFullName(), Administration::instance()->getCurrentPageURL() . 'edit/' . $a->get('id') . '/', $a->get('username'), 'author')
                    );
                } else {
                    $td1 = Widget::TableData($a->getFullName(), 'inactive');
                }

                // Can this Author be edited by the current Author?
                if (Symphony::Author()->isDeveloper() || Symphony::Author()->isManager()) {
                    if ($a->get('id') != Symphony::Author()->get('id')) {
                        $td1->appendChild(Widget::Label(__('Select Author %s', array($a->getFullName())), null, 'accessible', null, array(
                            'for' => 'author-' . $a->get('id')
                        )));
                        $td1->appendChild(Widget::Input('items['.$a->get('id').']', 'on', 'checkbox', array(
                            'id' => 'author-' . $a->get('id')
                        )));
                    }
                }

                $td2 = Widget::TableData(Widget::Anchor($a->get('email'), 'mailto:'.$a->get('email'), __('Email this author')));

                if (!is_null($a->get('last_seen'))) {
                    $td3 = Widget::TableData(
                        DateTimeObj::format($a->get('last_seen'), __SYM_DATETIME_FORMAT__)
                    );
                } else {
                    $td3 = Widget::TableData(__('Unknown'), 'inactive');
                }

                if ($a->isDeveloper()) {
                    $type = 'Developer';
                } elseif ($a->isManager()) {
                    $type = 'Manager';
                } else {
                    $type = 'Author';
                }

                $td4 = Widget::TableData(__($type));

                $languages = Lang::getAvailableLanguages();

                $td5 = Widget::TableData($a->get("language") == null ? __("System Default") : $languages[$a->get("language")]);

                $tableData = array();
                // Add a row to the body array, assigning each cell to the row
                if (Symphony::Author()->isDeveloper() || Symphony::Author()->isManager()) {
                    $tableData = array($td1, $td2, $td3, $td4, $td5);
                } else {
                    $tableData = array($td1, $td2, $td3);
                }

                /**
                 * Allows Extensions to inject custom table data for each Author
                 * into the Authors Index
                 *
                 * @delegate AddCustomAuthorColumnData
                 * @since Symphony 2.7.0
                 * @param string $context
                 * '/system/authors/'
                 * @param array $tableData
                 *  An array of `Widget::TableData`, passed by reference
                 * @param array $columns
                 * An array of the current columns
                 * @param Author $author
                 *  The Author object.
                 */
                Symphony::ExtensionManager()->notifyMembers('AddCustomAuthorColumnData', '/system/authors/', array(
                    'tableData' => &$tableData,
                    'columns' => $columns,
                    'author' => $a,
                ));

                $aTableBody[] = Widget::TableRow($tableData);
            }
        }

        $table = Widget::Table(
            Widget::TableHead($aTableHead),
            null,
            Widget::TableBody($aTableBody),
            'selectable',
            null,
            array('role' => 'directory', 'aria-labelledby' => 'symphony-subheading')
        );

        $this->Form->appendChild($table);

        $version = new XMLElement('p', 'Humanbit ' . Symphony::Configuration()->get('version', 'symphony'), array(
            'id' => 'version'
        ));

        $this->Form->appendChild($version);
    }

    // Both the Edit and New pages need the same form
    public function __viewNew()
    {
        $this->__form();
    }

    public function __viewEdit()
    {
        $this->__form();
    }

    public function __form()
    {
        // Handle unknown context
        if (!in_array($this->_context[0], array('new', 'edit'))) {
            Administration::instance()->errorPageNotFound();
        }

        if ($this->_context[0] == 'new' && !Symphony::Author()->isDeveloper() && !Symphony::Author()->isManager()) {
            Administration::instance()->throwCustomError(
                __('You are not authorised to access this page.'),
                __('Access Denied'),
                Page::HTTP_STATUS_UNAUTHORIZED
            );
        }

        if (isset($this->_context[2])) {
            $time = Widget::Time();

            switch ($this->_context[2]) {
                case 'saved':
                    $message = __('Author updated at %s.', array($time->generate()));
                    break;
                case 'created':
                    $message = __('Author created at %s.', array($time->generate()));
            }

            $this->pageAlert(
                $message
                . ' <a href="' . SYMPHONY_URL . '/system/authors/new/" accesskey="c">'
                . __('Create another?')
                . '</a> <a href="' . SYMPHONY_URL . '/system/authors/" accesskey="a">'
                . __('View all Authors')
                . '</a>',
                Alert::SUCCESS
            );
        }

        $this->setPageType('form');
        $isOwner = false;
        $isEditing = ($this->_context[0] == 'edit');
        $canonical_link = null;

        if (isset($_POST['fields'])) {
            $author = $this->_Author;
        } elseif ($this->_context[0] == 'edit') {
            if (!$author_id = (int)$this->_context[1]) {
                redirect(SYMPHONY_URL . '/system/authors/');
            }

            if (!$author = AuthorManager::fetchByID($author_id)) {
                Administration::instance()->throwCustomError(
                    __('The author profile you requested does not exist.'),
                    __('Author not found'),
                    Page::HTTP_STATUS_NOT_FOUND
                );
            }
            $canonical_link = '/system/authors/edit/' . $author_id . '/';
        } else {
            $author = new Author();
        }

        if ($isEditing && $author->get('id') == Symphony::Author()->get('id')) {
            $isOwner = true;
        }

        if ($isEditing && !$isOwner && !Symphony::Author()->isDeveloper() && !Symphony::Author()->isManager()) {
            Administration::instance()->throwCustomError(
                __('You are not authorised to edit other authors.'),
                __('Access Denied'),
                Page::HTTP_STATUS_FORBIDDEN
            );
        }

        $this->setTitle(__(($this->_context[0] == 'new' ? '%2$s &ndash; %3$s' : '%1$s &ndash; %2$s &ndash; %3$s'), array($author->getFullName(), __('Authors'), __('Symphony'))));
        if ($canonical_link) {
            $this->addElementToHead(new XMLElement('link', null, array(
                'rel' => 'canonical',
                'href' => SYMPHONY_URL . $canonical_link,
            )));
        }
        $this->appendSubheading(($this->_context[0] == 'new' ? __('Untitled') : $author->getFullName()));
        $this->insertBreadcrumbs(array(
            Widget::Anchor(__('Authors'), SYMPHONY_URL . '/system/authors/'),
        ));

        // Essentials
        $group = new XMLElement('fieldset');
        $group->setAttribute('class', 'settings');
        $group->appendChild(new XMLElement('legend', __('Essentials')));

        $div = new XMLElement('div');
        $div->setAttribute('class', 'two columns');

        $label = Widget::Label(__('First Name'), null, 'column');
        $label->appendChild(Widget::Input('fields[first_name]', $author->get('first_name')));
        $div->appendChild((isset($this->_errors['first_name']) ? Widget::Error($label, $this->_errors['first_name']) : $label));


        $label = Widget::Label(__('Last Name'), null, 'column');
        $label->appendChild(Widget::Input('fields[last_name]', $author->get('last_name')));
        $div->appendChild((isset($this->_errors['last_name']) ? Widget::Error($label, $this->_errors['last_name']) : $label));

        $group->appendChild($div);

        $label = Widget::Label(__('Email Address'));
        $label->appendChild(Widget::Input('fields[email]', $author->get('email'), 'text', array('autocomplete' => 'off')));
        $group->appendChild((isset($this->_errors['email']) ? Widget::Error($label, $this->_errors['email']) : $label));

        $this->Form->appendChild($group);

        // Login Details
        $group = new XMLElement('fieldset');
        $group->setAttribute('class', 'settings');
        $group->appendChild(new XMLElement('legend', __('Login Details')));

        $div = new XMLElement('div');

        $label = Widget::Label(__('Username'));
        $label->appendChild(Widget::Input('fields[username]', $author->get('username'), 'text', array('autocomplete' => 'off')));
        $div->appendChild((isset($this->_errors['username']) ? Widget::Error($label, $this->_errors['username']) : $label));

        // Only developers can change the user type. Primary account should NOT be able to change this
        if ((Symphony::Author()->isDeveloper() || Symphony::Author()->isManager()) && !$author->isPrimaryAccount()) {

            // Create columns
            $div->setAttribute('class', 'two columns');
            $label->setAttribute('class', 'column');

            // User type
            $label = Widget::Label(__('User Type'), null, 'column');

            $options = array(
                array('author', false, __('Author')),
                array('manager', $author->isManager(), __('Manager'))
            );

            if (Symphony::Author()->isDeveloper()) {
                $options[] = array('developer', $author->isDeveloper(), __('Developer'));
            }

            $label->appendChild(Widget::Select('fields[user_type]', $options));
            if (isset($this->_errors['user_type'])) {
                $div->appendChild(Widget::Error($label, $this->_errors['user_type']));
            } else {
                $div->appendChild($label);
            }
        }

        $group->appendChild($div);

        // Password
        $fieldset = new XMLElement('fieldset', null, array('class' => 'two columns', 'id' => 'password'));
        $legend = new XMLElement('legend', __('Password'));
        $help = new XMLElement('i', __('Leave password fields blank to keep the current password'));
        $fieldset->appendChild($legend);
        $fieldset->appendChild($help);

        /*
            Password reset rules:
            - Primary account can edit all accounts.
            - Developers can edit all developers, managers and authors, and their own.
            - Managers can edit all Authors, and their own.
            - Authors can edit their own.
        */
        if ($isEditing && !(
            // All accounts can edit their own
            $isOwner
            // Managers can edit all Authors, and their own.
            || (Symphony::Author()->isManager() && $author->isAuthor())
            // Primary account can edit all accounts.
            || Symphony::Author()->isPrimaryAccount()
            // Developers can edit all developers, managers and authors, and their own.
            || Symphony::Author()->isDeveloper() && $author->isPrimaryAccount() === false
        )) {
            $fieldset->setAttribute('class', 'three columns');

            $label = Widget::Label(null, null, 'column');
            $label->appendChild(Widget::Input('fields[old-password]', null, 'password', array('placeholder' => __('Old Password'), 'autocomplete' => 'off')));
            $fieldset->appendChild((isset($this->_errors['old-password']) ? Widget::Error($label, $this->_errors['old-password']) : $label));
        }

        // New password
        $placeholder = ($isEditing ? __('New Password') : __('Password'));
        $label = Widget::Label(null, null, 'column');
        $label->appendChild(Widget::Input('fields[password]', null, 'password', array('placeholder' => $placeholder, 'autocomplete' => 'off')));
        $fieldset->appendChild((isset($this->_errors['password']) ? Widget::Error($label, $this->_errors['password']) : $label));

        // Confirm password
        $label = Widget::Label(null, null, 'column');
        $label->appendChild(Widget::Input('fields[password-confirmation]', null, 'password', array('placeholder' => __('Confirm Password'), 'autocomplete' => 'off')));
        $fieldset->appendChild((isset($this->_errors['password-confirmation']) ? Widget::Error($label, $this->_errors['password']) : $label));

        $group->appendChild($fieldset);

        // Auth token
        if (Symphony::Author()->isDeveloper() || Symphony::Author()->isManager()) {
            $label = Widget::Label();
            $group->appendChild(Widget::Input('fields[auth_token_active]', 'no', 'hidden'));
            $input = Widget::Input('fields[auth_token_active]', 'yes', 'checkbox');

            if ($author->isTokenActive()) {
                $input->setAttribute('checked', 'checked');
            }

            $temp = SYMPHONY_URL . '/login/' . $author->createAuthToken() . '/';
            $label->setValue(__('%s Allow remote login via', array($input->generate())) . ' <a href="' . $temp . '">' . $temp . '</a>');
            $group->appendChild($label);
        }

        $label = Widget::Label(__('Default Area'));

        $sections = SectionManager::fetch(null, 'ASC', 'sortorder');

        $options = array();

        // If the Author is the Developer, allow them to set the Default Area to
        // be the Sections Index.
        if ($author->isDeveloper()) {
            $options[] = array(
                '/blueprints/sections/',
                $author->get('default_area') == '/blueprints/sections/',
                __('Sections Index')
            );
        }

        if (is_array($sections) && !empty($sections)) {
            foreach ($sections as $s) {
                $options[] = array(
                    $s->get('id'),
                    $author->get('default_area') == $s->get('id'),
                    General::sanitize($s->get('name'))
                );
            }
        }

        /**
        * Allows injection or manipulation of the Default Area dropdown for an Author.
        * Take care with adding in options that are only valid for Developers, as if a
        * normal Author is set to that option, they will be redirected to their own
        * Author record.
        *
        *
        * @delegate AddDefaultAuthorAreas
        * @since Symphony 2.2
        * @param string $context
        * '/system/authors/'
        * @param array $options
        * An associative array of options, suitable for use for the Widget::Select
        * function. By default this will be an array of the Sections in the current
        * installation. New options should be the path to the page after the `SYMPHONY_URL`
        * constant.
        * @param string $default_area
        * The current `default_area` for this Author.
        * @param Author $author
        *  The Author object.
        *  This parameter is available @since Symphony 2.7.0
        */
        Symphony::ExtensionManager()->notifyMembers('AddDefaultAuthorAreas', '/system/authors/', array(
            'options' => &$options,
            'default_area' => $author->get('default_area'),
            'author' => $author,
        ));

        $label->appendChild(Widget::Select('fields[default_area]', $options));
        $group->appendChild($label);

        $this->Form->appendChild($group);

        // Custom Language Selection
        $languages = Lang::getAvailableLanguages();
        if (count($languages) > 1) {
            // Get language names
            asort($languages);

            $group = new XMLElement('fieldset');
            $group->setAttribute('class', 'settings');
            $group->appendChild(new XMLElement('legend', __('Custom Preferences')));

            $label = Widget::Label(__('Language'));

            $options = array(
                array(null, is_null($author->get('language')), __('System Default'))
            );

            foreach ($languages as $code => $name) {
                $options[] = array($code, $code == $author->get('language'), $name);
            }
            $select = Widget::Select('fields[language]', $options);
            $label->appendChild($select);
            $group->appendChild($label);

            $this->Form->appendChild($group);
        }

        // Administration password double check
        if ($isEditing && !$isOwner) {
            $group = new XMLElement('fieldset');
            $group->setAttribute('class', 'settings');
            $group->setAttribute('id', 'confirmation');
            $group->appendChild(new XMLElement('legend', __('Confirmation')));
            $group->appendChild(new XMLELement('p', __('Please confirm changes to this author with your password.'), array('class' => 'help')));

            $label = Widget::Label(__('Password'));
            $label->appendChild(Widget::Input('fields[confirm-change-password]', null, 'password', array(
                'autocomplete' => 'off',
                'placeholder' => __('Your Password')
            )));
            $group->appendChild(
                isset($this->_errors['confirm-change-password']) ? Widget::Error($label, $this->_errors['confirm-change-password']) : $label
            );

            $this->Form->appendChild($group);
        }

        // Actions
        $div = new XMLElement('div');
        $div->setAttribute('class', 'actions');

        $div->appendChild(Widget::Input('action[save]', ($this->_context[0] == 'edit' ? __('Save Changes') : __('Create Author')), 'submit', array('accesskey' => 's')));

        if ($isEditing && !$isOwner && !$author->isPrimaryAccount()) {
            $button = new XMLElement('button', __('Delete'));
            $button->setAttributeArray(array('name' => 'action[delete]', 'class' => 'button confirm delete', 'title' => __('Delete this author'), 'type' => 'submit', 'accesskey' => 'd', 'data-message' => __('Are you sure you want to delete this author?')));
            $div->appendChild($button);
        }

        $this->Form->appendChild($div);

        /**
        * Allows the injection of custom form fields given the current `$this->Form`
        * object. Please note that this custom data should be saved in own extension
        * tables and that modifying `tbl_authors` to house your data is highly discouraged.
        *
        * @delegate AddElementstoAuthorForm
        * @since Symphony 2.2
        * @param string $context
        * '/system/authors/'
        * @param XMLElement $form
        * The contents of `$this->Form` after all the default form elements have been appended.
        * @param Author $author
        * The current Author object that is being edited
        * @param array $fields
        *  The POST fields
        *  This parameter is available @since Symphony 2.7.0
        * @param array $errors
        *  The error array used to validate the Author.
        *  Extension should register their own errors elsewhere and used the value
        *  to modify the UI accordingly.
        *  This parameter is available @since Symphony 2.7.0
        */
        Symphony::ExtensionManager()->notifyMembers('AddElementstoAuthorForm', '/system/authors/', array(
            'form' => &$this->Form,
            'author' => $author,
            'fields' => isset($_POST['fields']) ? $_POST['fields'] : null,
            'errors' => $this->_errors,
        ));
    }

    public function checkPassword($password){
        
        if ($errors) {
            return $errors;
        }
        return true;
    }

    public function __actionNew()
    {
        if (@array_key_exists('save', $_POST['action']) || @array_key_exists('done', $_POST['action'])) {
            $fields = $_POST['fields'];

            $canCreate = Symphony::Author()->isDeveloper() || Symphony::Author()->isManager();

            if (!$canCreate) {
                Administration::instance()->throwCustomError(
                    __('You are not authorised to create authors.'),
                    __('Access Denied'),
                    Page::HTTP_STATUS_UNAUTHORIZED
                );
            }

            if (Symphony::Author()->isManager() && $fields['user_type'] !== 'author') {
                $this->_errors['user_type'] = __('The user type is invalid. You can only create Authors.');
            }

            $this->_Author = new Author();
            $this->_Author->set('user_type', $fields['user_type']);
            $this->_Author->set('primary', 'no');
            $this->_Author->set('email', $fields['email']);
            $this->_Author->set('username', General::sanitize($fields['username']));
            $this->_Author->set('first_name', General::sanitize($fields['first_name']));
            $this->_Author->set('last_name', General::sanitize($fields['last_name']));
            $this->_Author->set('last_seen', null);
            $this->_Author->set('password', (trim($fields['password']) == '' ? '' : Cryptography::hash(Symphony::Database()->cleanValue($fields['password']))));
            $this->_Author->set('default_area', $fields['default_area']);
            $this->_Author->set('auth_token_active', ($fields['auth_token_active'] ? $fields['auth_token_active'] : 'no'));
            $this->_Author->set('language', isset($fields['language']) ? $fields['language'] : null);

            /**
             * Creation of a new Author. The Author object is provided as read
             * only through this delegate.
             *
             * @delegate AuthorPreCreate
             * @since Symphony 2.7.0
             * @param string $context
             * '/system/authors/'
             * @param Author $author
             *  The Author object that has just been created, but not yet committed, nor validated
             * @param array $fields
             *  The POST fields
             * @param array $errors
             *  The error array used to validate the Author, passed by reference.
             *  Extension should append to this array if they detect validation problems.
             */
            Symphony::ExtensionManager()->notifyMembers('AuthorPreCreate', '/system/authors/', array(
                'author' => $this->_Author,
                'field' => $fields,
                'errors' => &$this->_errors,
            ));

            if (empty($this->_errors) && $this->_Author->validate($this->_errors)) {
                if ($fields['password'] != $fields['password-confirmation']) {
                    $this->_errors['password'] = $this->_errors['password-confirmation'] = __('Passwords did not match');
                } else if (strlen($fields['password']) < 8) {
                    $this->_errors['password'] = __('Password is too short. It should be min 8 characters');
                } else if (!preg_match("/[a-z]/", $fields['password'])) {
                    $this->_errors['password'] = __('Password should contain at least one small letter');
                } else if (!preg_match("/[0-9]/", $fields['password'])) {
                    $this->_errors['password'] = __('Password should contain at least one number');
                } else if ((!preg_match("/[A-Z]/", $fields['password'])) and (!preg_match("/\W/", $fields['password']))) { 
                    $this->_errors['password'] = __('Password should contain at least one Capital Letter and one special character');
                } else if (!preg_match("/[A-Z]/", $fields['password'])){
                    $this->_errors['password'] = __('Password should contain at least one Capital Letter');
                } else if (!preg_match("/\W/", $fields['password'])){
                    $this->_errors['password'] = __('Password should contain at least one special character');
                } else if (preg_match("/\s/", $fields['password'])) {
                    $this->_errors['password'] = __('Password should not contain any white space');
                } else if ($author_id = $this->_Author->commit()) {
                    /**
                     * Creation of a new Author. The Author object is provided as read
                     * only through this delegate.
                     *
                     * @delegate AuthorPostCreate
                     * @since Symphony 2.2
                     * @param string $context
                     * '/system/authors/'
                     * @param Author $author
                     *  The Author object that has just been created
                     * @param integer $author_id
                     *  The ID of Author ID that was just created
                     * @param array $fields
                     *  The POST fields
                     *  This parameter is available @since Symphony 2.7.0
                     * @param array $errors
                     *  The error array used to validate the Author, passed by reference.
                     *  Extension should append to this array if they detect saving problems.
                     *  This parameter is available @since Symphony 2.7.0
                     */
                    Symphony::ExtensionManager()->notifyMembers('AuthorPostCreate', '/system/authors/', array(
                        'author' => $this->_Author,
                        'author_id' => $author_id,
                        'field' => $fields,
                        'errors' => &$this->_errors,
                    ));

                    if (empty($this->_errors)) {
                        redirect(SYMPHONY_URL . "/system/authors/edit/$author_id/created/");
                    }
                }
            }

            if (is_array($this->_errors) && !empty($this->_errors)) {
                $this->pageAlert(__('There were some problems while attempting to save. Please check below for problem fields.'), Alert::ERROR);
            } else {
                $this->pageAlert(
                    __('Unknown errors occurred while attempting to save.')
                    . '<a href="' . SYMPHONY_URL . '/system/log/">'
                    . __('Check your activity log')
                    . '</a>.',
                    Alert::ERROR
                );
            }
        }
    }

    public function __actionEdit()
    {
        if (!$author_id = (int)$this->_context[1]) {
            redirect(SYMPHONY_URL . '/system/authors/');
        }

        $isOwner = ($author_id == Symphony::Author()->get('id'));
        $fields = $_POST['fields'];
        $this->_Author = AuthorManager::fetchByID($author_id);

        $canEdit = // Managers can edit all Authors, and their own.
                (Symphony::Author()->isManager() && $this->_Author->isAuthor())
                // Primary account can edit all accounts.
                || Symphony::Author()->isPrimaryAccount()
                // Developers can edit all developers, managers and authors, and their own,
                // but not the primary account
                || (Symphony::Author()->isDeveloper() && $this->_Author->isPrimaryAccount() === false);

        if (@array_key_exists('save', $_POST['action']) || @array_key_exists('done', $_POST['action'])) {
            $authenticated = false;

            if (!$isOwner && !$canEdit) {
                Administration::instance()->throwCustomError(
                    __('You are not authorised to modify this author.'),
                    __('Access Denied'),
                    Page::HTTP_STATUS_UNAUTHORIZED
                );
            }

            if ($fields['email'] != $this->_Author->get('email')) {
                $changing_email = true;
            }

            // Check the old password was correct
            if (isset($fields['old-password']) && strlen(trim($fields['old-password'])) > 0 && Cryptography::compare(Symphony::Database()->cleanValue(trim($fields['old-password'])), $this->_Author->get('password'))) {
                $authenticated = true;

                // Developers don't need to specify the old password, unless it's their own account
            } elseif (
                // All accounts can edit their own
                $isOwner ||
                // Is allowed to edit?
                $canEdit
            ) {
                $authenticated = true;
            }

            $this->_Author->set('id', $author_id);

            if ($this->_Author->isPrimaryAccount() || ($isOwner && Symphony::Author()->isDeveloper())) {
                $this->_Author->set('user_type', 'developer'); // Primary accounts are always developer, Developers can't lower their level
            } elseif (Symphony::Author()->isManager() && isset($fields['user_type'])) { // Manager can only change user type for author and managers
                if ($fields['user_type'] !== 'author' && $fields['user_type'] !== 'manager') {
                    $this->_errors['user_type'] = __('The user type is invalid. You can only create Authors.');
                } else {
                    $this->_Author->set('user_type', $fields['user_type']);
                }
            } elseif (Symphony::Author()->isDeveloper() && isset($fields['user_type'])) {
                $this->_Author->set('user_type', $fields['user_type']); // Only developer can change user type
            }

            $this->_Author->set('email', $fields['email']);
            $this->_Author->set('username', General::sanitize($fields['username']));
            $this->_Author->set('first_name', General::sanitize($fields['first_name']));
            $this->_Author->set('last_name', General::sanitize($fields['last_name']));
            $this->_Author->set('language', isset($fields['language']) ? $fields['language'] : null);

            if (trim($fields['password']) != '') {
                $this->_Author->set('password', Cryptography::hash(Symphony::Database()->cleanValue($fields['password'])));
                $changing_password = true;
            }

            // Don't allow authors to set the Section Index as a default area
            // If they had it previously set, just save `null` which will redirect
            // the Author (when logging in) to their own Author record
            if (
                $this->_Author->get('user_type') == 'author'
                && $fields['default_area'] == '/blueprints/sections/'
            ) {
                $this->_Author->set('default_area', null);
            } else {
                $this->_Author->set('default_area', $fields['default_area']);
            }

            $this->_Author->set('auth_token_active', ($fields['auth_token_active'] ? $fields['auth_token_active'] : 'no'));

            /**
             * Before editing an author, provided with the Author object
             *
             * @delegate AuthorPreEdit
             * @since Symphony 2.7.0
             * @param string $context
             * '/system/authors/'
             * @param Author $author
             * An Author object not yet committed, nor validated
             * @param array $fields
             *  The POST fields
             * @param array $errors
             *  The error array used to validate the Author, passed by reference.
             *  Extension should append to this array if they detect validation problems.
             */
            Symphony::ExtensionManager()->notifyMembers('AuthorPreEdit', '/system/authors/', array(
                'author' => $this->_Author,
                'field' => $fields,
                'errors' => &$this->_errors,
            ));

            if (empty($this->_errors) && $this->_Author->validate($this->_errors)) {
                // Admin changing another profile
                if (!$isOwner) {
                    $entered_password = Symphony::Database()->cleanValue($fields['confirm-change-password']);

                    if (!isset($fields['confirm-change-password']) || empty($fields['confirm-change-password'])) {
                        $this->_errors['confirm-change-password'] = __('Please provide your own password to make changes to this author.');
                    } elseif (Cryptography::compare($entered_password, Symphony::Author()->get('password')) !== true) {
                        $this->_errors['confirm-change-password'] = __('Wrong password, please enter your own password to make changes to this author.');
                    }
                }

                // Author is changing their password
                if (!$authenticated && ($changing_password || $changing_email)) {
                    if ($changing_password) {
                        $this->_errors['old-password'] = __('Wrong password. Enter old password to change it.');
                    } elseif ($changing_email) {
                        $this->_errors['old-password'] = __('Wrong password. Enter old one to change email address.');
                    }

                    // Passwords provided, but doesn't match.
                } else if (($fields['password'] != '' || $fields['password-confirmation'] != '') && $fields['password'] != $fields['password-confirmation']) {
                    $this->_errors['password'] = $this->_errors['password-confirmation'] = __('Passwords did not match');
                } else if (strlen($fields['password']) < 8) {
                    $this->_errors['password'] = __('Password is too short. It should be min 8 characters');
                } else if (!preg_match("/[a-z]/", $fields['password'])) {
                    $this->_errors['password'] = __('Password should contain at least one small letter');
                } else if (!preg_match("/[0-9]/", $fields['password'])) {
                    $this->_errors['password'] = __('Password should contain at least one number');
                } else if ((!preg_match("/[A-Z]/", $fields['password'])) and (!preg_match("/\W/", $fields['password']))) { 
                    $this->_errors['password'] = __('Password should contain at least one Capital Letter and one special character');
                } else if (!preg_match("/[A-Z]/", $fields['password'])){
                    $this->_errors['password'] = __('Password should contain at least one Capital Letter');
                } else if (!preg_match("/\W/", $fields['password'])){
                    $this->_errors['password'] = __('Password should contain at least one special character');
                } else if (preg_match("/\s/", $fields['password'])) {
                    $this->_errors['password'] = __('Password should not contain any white space');
                }

                // All good, let's save the Author
                if (is_array($this->_errors) && empty($this->_errors) && $this->_Author->commit()) {
                    Symphony::Database()->delete('tbl_forgotpass', sprintf("
                        `expiry` < '%s' OR `author_id` = %d",
                        DateTimeObj::getGMT('c'),
                        $author_id
                    ));

                    if ($isOwner) {
                        Administration::instance()->login($this->_Author->get('username'), $this->_Author->get('password'), true);
                    }

                    /**
                     * After editing an author, provided with the Author object
                     *
                     * @delegate AuthorPostEdit
                     * @since Symphony 2.2
                     * @param string $context
                     * '/system/authors/'
                     * @param Author $author
                     * An Author object
                     * @param array $fields
                     *  The POST fields
                     *  This parameter is available @since Symphony 2.7.0
                     * @param array $errors
                     *  The error array used to validate the Author, passed by reference.
                     *  Extension should append to this array if they detect saving problems.
                     *  This parameter is available @since Symphony 2.7.0
                     */
                    Symphony::ExtensionManager()->notifyMembers('AuthorPostEdit', '/system/authors/', array(
                        'author' => $this->_Author,
                        'field' => $fields,
                        'errors' => &$this->_errors,
                    ));

                    if (empty($this->_errors)) {
                        redirect(SYMPHONY_URL . '/system/authors/edit/' . $author_id . '/saved/');
                    }

                    // Problems.
                } else {
                    $this->pageAlert(
                        __('Unknown errors occurred while attempting to save.')
                        . '<a href="' . SYMPHONY_URL . '/system/log/">'
                        . __('Check your activity log')
                        . '</a>.',
                        Alert::ERROR
                    );
                }
            }

            // Author doesn't have valid data, throw back.
            if (is_array($this->_errors) && !empty($this->_errors)) {
                $this->pageAlert(__('There were some problems while attempting to save. Please check below for problem fields.'), Alert::ERROR);
            }
        } elseif (@array_key_exists('delete', $_POST['action'])) {
            // Validate rights
            if (!$canEdit) {
                $this->pageAlert(__('You are not allowed to delete this author.'), Alert::ERROR);
                return;
            }
            // Admin changing another profile
            if (!$isOwner) {
                $entered_password = Symphony::Database()->cleanValue($fields['confirm-change-password']);

                if (!isset($fields['confirm-change-password']) || empty($fields['confirm-change-password'])) {
                    $this->_errors['confirm-change-password'] = __('Please provide your own password to make changes to this author.');
                } elseif (Cryptography::compare($entered_password, Symphony::Author()->get('password')) !== true) {
                    $this->_errors['confirm-change-password'] = __('Wrong password, please enter your own password to make changes to this author.');
                }
            }
            if (is_array($this->_errors) && !empty($this->_errors)) {
                $this->pageAlert(__('There were some problems while attempting to save. Please check below for problem fields.'), Alert::ERROR);
                return;
            }

            $this->_Author = AuthorManager::fetchByID($author_id);

            /**
             * Prior to deleting an author, provided with the Author ID.
             *
             * @delegate AuthorPreDelete
             * @since Symphony 2.2
             * @param string $context
             * '/system/authors/'
             * @param integer $author_id
             *  The ID of Author ID that is about to be deleted
             * @param Author $author
             *  The Author object.
             *  This parameter is available @since Symphony 2.7.0
             */
            Symphony::ExtensionManager()->notifyMembers('AuthorPreDelete', '/system/authors/', array(
                'author_id' => $author_id,
                'author' => $this->_Author,
            ));

            if (!$isOwner) {
                $result = AuthorManager::delete($author_id);

                /**
                 * After deleting an author, provided with the Author ID.
                 *
                 * @delegate AuthorPostDelete
                 * @since Symphony 2.7.0
                 * @param string $context
                 * '/system/authors/'
                 * @param integer $author_id
                 *  The ID of Author ID that is about to be deleted
                 * @param Author $author
                 *  The Author object.
                 * @param integer $result
                 *  The result of the delete statement
                 */
                Symphony::ExtensionManager()->notifyMembers('AuthorPostDelete', '/system/authors/', array(
                    'author_id' => $author_id,
                    'author' => $this->_Author,
                    'result' => $result
                ));

                redirect(SYMPHONY_URL . '/system/authors/');
            } else {
                $this->pageAlert(__('You cannot remove yourself as you are the active Author.'), Alert::ERROR);
            }
        }
    }
}
