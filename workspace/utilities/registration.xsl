<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Login modal -->
    <xsl:template name="login">

        <div class="reg_modal login_modal modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">

            <div class="reg_wrapper modal-dialog modal-dialog-centered">

                <div class="reg_content modal-content bg_color_gray border_color_third px-4 px-sm-5 py-5">
                    <!-- Modal header -->
                    <div class="reg_header modal-header d-flex align-items-center col-12 border-bottom mb-4 pb-2">
                        <h3 class="reg_title modal-title h4 color_black" id="loginModalLabel">
                            Sei già registrato?
                            <xsl:value-of select="/data/translate/entry[code='already_registered']/*[local-name() = $lanextended]" />
                        </h3>

                        <button class="reg_close btn-close h4" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                            <i class="icon_close h4 color_black align-top fa-regular fa-xmark" />
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="reg_body modal-body">
                        <!-- Sign in header -->
                        <div class="sign_in_wrapper d-flex justify-content-between align-items-center col-12 mx-auto border border_color_third my-3 px-3 py-2">
                            <p class="sign_in_txt h5 color_black">
                                Inserisci le tue credenziali di accesso
                                <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]"/>
                            </p>

                            <figure class="figure_sign_in col-auto ms-auto">
                                <img class="img_sign_in img-fluid mx-auto w-100" src="{$workspace}/static/images/icons/icon-glass.png" alt="Sign in icon" />
                            </figure>
                        </div>

                        <!-- Main form -->
                        <div class="form_wrapper row justify-content-center mb-2 py-4">
                            <form class="reg_form" id="formLogin" action="" method="post">
                                <div class="reg_floating form-floating mb-4">
                                    <input class="reg_control form-control" id="loginModalEmail" name="fields[email]" type="email" placeholder="Email" required="required" />

                                    <label class="reg_label" for="loginModalEmail">
                                        Email
                                        <xsl:value-of select="/data/translate/entry[code='email']/*[local-name() = $lanextended]" />
                                    </label>
                                </div>

                                <div class="reg_floating form-floating mb-4 pb-2">
                                    <input class="reg_control form-control" id="loginModalPassword" name="fields[password]" type="password" placeholder="Password" required="required" />

                                    <label class="reg_label" for="loginModalPassword">
                                        Password
                                        <xsl:value-of select="/data/translate/entry[code='pw']/*[local-name() = $lanextended]" />
                                    </label>
                                </div>

                                <input name="member-action[login]" type="hidden" value="submit" />

                                <button class="btn_submit small text-uppercase color_white btn_color_sixth p-0 border w-100 p-3" name="member-action[login]" type="submit" value="Submit">
                                    Sign in
                                    <xsl:value-of select="/data/translate/entry[code='sign_in']/*[local-name() = $lanextended]" />
                                </button>
                            </form>

                            <!-- Login socials -->
                            <div class="social_wrapper d-flex flex-wrap justify-content-center my-4">
                                <!-- Login Google -->
                                <form class="reg_form col-2 me-2" id="formLoginSocialGoogle" action="{$root}/google/" method="POST">
                                    <input name="redirect" type="hidden" value="{$root}" />
                                    <input name="member-google-action[login]" type="hidden" value="Login" />

                                    <button class="btn_sign_in h4 btn_color_third btn_reverse p-2 w-100" type="submit">
                                        <i class="icon_sign_in h4 color_black fa-brands fa-google" />
                                    </button>
                                </form>

                                <!-- Login Facebook -->
                                <form class="reg_form col-2 ms-2" id="formLoginSocialFb" action="{$root}/facebook/" method="POST">
                                    <input name="redirect" type="hidden" value="{$root}" />
                                    <input name="member-facebook-action[login]" type="hidden" value="Login" />

                                    <button class="btn_sign_in h4 btn_color_third btn_reverse p-2 w-100" type="submit">
                                        <i class="icon_sign_in h4 color_black fa-brands fa-facebook-f" />
                                    </button>
                                </form>
                            </div>

                            <!-- Recover password -->
                            <div class="reg_forgot text-center row m-0">
                                <p class="forgot_title small fw_500 mb-2">
                                    Hai dimenticato la password?
                                    <xsl:value-of select="/data/translate/entry[code='forgot_pw']/*[local-name() = $lanextended]"/>
                                </p>

                                <div class="forgot_wrapper small fw_500">
                                    <span class="pw_rec">
                                        Clicca
                                        <xsl:value-of select="/data/translate/entry[code='click']/*[local-name() = $lanextended]"/>
                                    </span>

                                    <button class="forgot_cta reg_fill fw_600 bg_color_white border-0 px-0" data-bs-target="#forgotModal" data-bs-toggle="modal" data-bs-dismiss="modal">
                                        qui
                                        <xsl:value-of select="/data/translate/entry[code='here']/*[local-name() = $lanextended]"/>
                                    </button>

                                    <span class="pw_rec">
                                        per recuperarla
                                        <xsl:value-of select="/data/translate/entry[code='to_recover']/*[local-name() = $lanextended]"/>
                                    </span>
                                </div>

                                <!-- <a href="{$root}/join/?forgot=yes/{$lanurl}">
                                    <xsl:value-of select="/data/translate/entry[code='forgot']/*[local-name() = $lanextended]" />
                                </a> -->

                                <!-- <div class="row m-0 align-items-start justify-content-right">
                                    <input name="connessione" type="radio" value="connesso" />

                                    <span class="pl-2">Resta connesso</span>
                                </div> -->

                                <!-- <a href="{$root}/join/?forgot=yes">
                                    <xsl:value-of select="/data/translate/entry[code='forgot']/*[local-name() = $lanextended]"/>
                                </a> -->

                                <!-- <a class="btn small navbar-btn fb_btn text-uppercase pt-2" href="#registerModal" data-bs-toggle="modal">
                                    <xsl:value-of select="/data/translate/entry[code='login_facebook']/*[local-name() = $lanextended]"/>

                                    <xsl:value-of select="/data/translate/entry[code='siteregistration']/*[local-name() = $lanextended]"/>
                                </a> -->
                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="reg_footer modal-footer row justify-content-between align-items-center border-top pt-4">
                        <!-- Not registered yet? -->
                        <h4 class="footer_title h4 color_black mb-4">
                            Non sei ancora registrato?
                            <xsl:value-of select="/data/translate/entry[code='not_registered']/*[local-name() = $lanextended]"/>
                        </h4>

                        <div class="toggle_wrapper">
                            <button class="modal_toggle small text-uppercase color_white btn_color_sixth p-0 border w-100 p-3" data-bs-target="#registerModal" data-bs-toggle="modal" data-bs-dismiss="modal">
                                Clicca qui
                            </button>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </xsl:template>


    <!-- Password recovery modals -->
    <xsl:template name="forgot_pw">

        <!-- Password recovery -->
        <div class="reg_modal forgot_modal modal fade" id="forgotModal" tabindex="-1" aria-labelledby="forgotModalLabel" aria-hidden="true">

            <div class="reg_wrapper modal-dialog modal-dialog-centered">

                <div class="reg_content modal-content bg_color_gray border_color_third px-4 px-sm-5 py-5">
                    <!-- Modal header -->
                    <div class="reg_header modal-header d-flex align-items-center col-12 p-0 border-bottom mb-4 pb-2">
                        <h3 class="reg_title h4 color_black modal-title" id="loginModalLabel">
                            Recover password
                            <xsl:value-of select="/data/translate/entry[code='rec_pw']/*[local-name() = $lanextended]" />
                        </h3>

                        <button class="reg_close h4 btn-close" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                            <i class="icon_close h4 color_black align-top fa-regular fa-xmark" />
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="reg_body modal-body">
                        <p class="forgot_txt p color_black my-3">
                            Enter your email and we'll send you a link to reset your password:
                            <xsl:value-of select="/data/translate/entry[code='reset_pw']/*[local-name() = $lanextended]" />
                        </p>

                        <form class="reg_form" id="formchangepass1" action="" method="post" autocomplete='off'>
                            <div class="floating_wrapper form-floating mb-4 pb-2">
                                <input name="fields[lan]" type="hidden" value="{$lanextended}" />

                                <input class="reg_control form-control" id="recoverModalmail" name="fields[email]" type="text" placeholder="Email*" required="required" />

                                <label class="reg_label" for="recoverModalEmail">
                                    Email*
                                </label>
                            </div>

                            <button class="btn_submit small text-uppercase color_white btn_color_sixth p-0 border w-100 p-3" id="submit" name="action[members-generate-recovery-code]" value="Submit">
                                Confirm
                                <xsl:value-of select="/data/translate/entry[code='confirm']/*[local-name() = $lanextended]" />
                            </button>
                        </form>
                    </div>
                </div>

            </div>

        </div>

        <!-- Password recovery (SUCCESS) -->
        <div class="reg_modal forgot_success_modal modal fade" id="forgotSuccessModal" tabindex="-1" aria-labelledby="forgotSuccessModalLabel" aria-hidden="true">

            <div class="reg_wrapper modal-dialog modal-dialog-centered">

                <div class="modal-content bg_color_gray border_color_third px-4 px-sm-5 py-5">
                    <!-- Modal header -->
                    <div class="reg_header modal-header d-flex align-items-center col-12 border-bottom mb-4 pb-2">
                        <h3 class="reg_title h4 color_black modal-title" id="loginModalLabel">
                            Email found!
                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                        </h3>

                        <button class="reg_close h4 btn-close" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                            <i class="icon_close h4 color_black align-top fa-regular fa-xmark" />
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="reg_body modal-body">
                        <!-- Success message -->
                        <p class="forgot_txt p color_black mb-4">
                            Click OK to proceed.
                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]"/>
                        </p>

                        <form class="reg_form" id="formgorsucc" action="" method="post" autocomplete="off">
                            <input id="user-name" name="fields[email]" type="hidden" value="{/data/events/members-generate-recovery-code/post-values/email}" />
                            <input name="fields[lan]" type="hidden" value="{$lan}" />
                            <input id="user-name" name="fields[recovery-code]" type="hidden" value="{/data/events/members-generate-recovery-code/recovery-code}" />
                            <input name="redirect" type="hidden" value="{$current-url}/?send=yes" />

                            <div class="btn_wrapper">
                                <button class="btn_submit small text-uppercase color_white btn_color_sixth p-0 border w-100 p-3" name="action[send-forgot]" value="Submit" alt="Submit">
                                    OK
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>

        </div>

        <!-- Password recovery (ERROR) -->
        <div class="reg_modal forgot_error_modal modal fade" id="forgotErrorModal" tabindex="-1" aria-labelledby="forgotErrorModalLabel" aria-hidden="true">

            <div class="reg_wrapper modal-dialog modal-dialog-centered">

                <div class="reg_content modal-content bg_color_gray border_color_third px-4 px-sm-5 py-5">
                    <!-- Modal header -->
                    <div class="reg_header modal-header d-flex align-items-center col-12 p-0 border-bottom mb-4 pb-2">
                        <h3 class="reg_title h4 color_black modal-title" id="forgotErrorModalLabel">
                            Email not registered
                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                        </h3>

                        <button class="reg_close h4 btn-close" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                            <i class="icon_close h4 color_black align-top fa-regular fa-xmark" />
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="reg_body modal-body">
                        <!-- Error message -->
                        <p class="forgot_txt p color_black">
                            Entry not found in our database.
                            <xsl:value-of select="/data/translate/entry[code='not_found']/*[local-name() = $lanextended]"/>
                        </p>
                    </div>
                </div>

            </div>

        </div>

    </xsl:template>


    <!-- Registration modal -->
    <xsl:template name="register_modal">

        <div class="reg_modal register_modal modal fade scroll_registration" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">

            <div class="reg_wrapper modal-dialog modal-dialog-centered">

                <div class="reg_content modal-content bg_color_gray border_color_third px-4 px-sm-5 py-5">
                    <!-- Modal header -->
                    <div class="reg_header modal-header d-flex align-items-center col-12 border-bottom mb-4 pb-2">
                        <h3 class="reg_title h4 color_black modal-title" id="registerModalLabel">
                            Non sei ancora registrato?
                            <xsl:value-of select="/data/translate/entry[code='not_yet_registered']/*[local-name() = $lanextended]" />
                        </h3>

                        <button class="reg_close h4 btn-close" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                            <i class="icon_close h4 color_black align-top fa-regular fa-xmark" />
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="reg_body modal-body">
                        <!-- Sign up header -->
                        <div class="sign_up_wrapper d-flex justify-content-between align-items-center col-12 col-sm-7 mx-auto border border_color_third my-3 px-3 py-2">
                            <p class="sign_up_txt h5 color_black">
                                Registrati subito!
                                <xsl:value-of select="/data/translate/entry[code='access_details']/*[local-name() = $lanextended]"/>
                            </p>

                            <figure class="sign_up_figure col-auto ms-auto">
                                <img class="sign_up_img img-fluid mx-auto w-100" src="{$workspace}/static/images/icons/icon-glass.png" alt="Sign up icon" />
                            </figure>
                        </div>

                        <!-- <div class="col-12 col-md-11 mx-auto mb-4">
                            <a class="btn navbar-btn text-white fb_btn text-uppercase" data-bs-toggle="modal" data-bs-target="#registerModal">
                                <xsl:value-of select="/data/translate/entry[code='login_facebook']/*[local-name() = $lanextended]" />
                            </a>
                        </div>

                        <p class="separator p_login p-0 mb-3">
                            <xsl:value-of select="/data/translate/entry[code='or']/*[local-name() = $lanextended]" />
                        </p> -->

                        <!-- Data to be filled in -->
                        <form class="reg_form row justify-content-center mb-3 py-4" id="formRegisterModal" action="" method="post" enctype="multipart/form-data">
                            <fieldset>
                                <!-- Name -->
                                <div class="reg_floating form-floating mb-4">
                                    <input class="reg_control form-control" id="registerModalName" name="fields[name]" type="text" value="{/data/events/add-member/post-values/name}{/data/login-info/entry/name}" placeholder="{/data/translate/entry[code='name']/*[local-name() = $lanextended]}*" required="required" />

                                    <label class="reg_label" for="registerModalName">
                                        Name
                                        <xsl:value-of select="/data/translate/entry[code='name']/*[local-name() = $lanextended]" />
                                    </label>
                                </div>

                                <!-- Surname -->
                                <div class="reg_floating form-floating mb-4">
                                    <input class="reg_control form-control" id="registerModalSurname" name="fields[surname]" type="text" value="{/data/events/add-member/post-values/surname}{/data/login-info/entry/surname}" placeholder="{/data/translate/entry[code='surname']/*[local-name() = $lanextended]}*" required="required" />

                                    <label class="reg_label" for="registerModalSurname">
                                        Surname
                                        <!-- <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" /> -->
                                    </label>
                                </div>

                                <!-- Email -->
                                <div class="reg_floating form-floating mb-4">
                                    <input class="reg_control form-control" id="registerModalEmail" name="fields[email]" type="email" placeholder="email*" required="required" />

                                    <label class="reg_label" for="registerModalEmail">
                                        Email
                                        <!-- <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" /> -->
                                    </label>
                                </div>

                                <!-- Email? -->
                                <!-- <div class="reg_floating form-floating mb-4">
                                    <input class="reg_control form-control" id="registerModalEmail" name="fields[email]" type="text" placeholder="info@example.com*" value="{/data/events/add-member/post-values/email}{/data/login-info/entry/email}" required="required" />

                                    <label class="reg_label" for="registerModalEmail">
                                        Email
                                        <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                    </label>
                                </div> -->

                                <!-- Password -->
                                <div class="reg_floating form-floating mb-4">
                                    <input class="reg_control form-control" id="registerModalPwType" name="fields[password][password]" type="Password" placeholder="{/data/translate/entry[code='at_least_6']/*[local-name() = $lanextended]}*" minlength="6" required="required" />

                                    <label class="reg_label" for="registerModalPwType">
                                        Password
                                        <xsl:value-of select="/data/translate/entry[code='pw']/*[local-name() = $lanextended]" />
                                    </label>
                                </div>

                                <!-- Confirm password -->
                                <div class="reg_floating form-floating mb-4">
                                    <input class="reg_control form-control" id="registerModalPwRetype" name="fields[password][confirm]" type="password" placeholder="{/data/translate/entry[code='retype_pw']/*[local-name() = $lanextended]}*" required="required" />

                                    <label class="reg_label" for="registerModalPwRetype">
                                        Confirm password
                                        <!-- <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" /> -->
                                    </label>
                                </div>

                                <!-- Town -->
                                <div class="reg_floating form-floating mb-4">
                                    <input class="reg_control form-control" id="registerModalCity" name="fields[town]" type="text" value="{/data/events/add-member/post-values/town}" placeholder="{/data/translate/entry[code='town']/*[local-name() = $lanextended]}*" required="required" />

                                    <label class="reg_label" for="registerModalCity">
                                        Town
                                        <!-- <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" /> -->
                                    </label>
                                </div>

                                <!-- Phone number -->
                                <!-- <div class="reg_floating form-floating mb-4">
                                    <input class="reg_control form-control" id="registerModalPhone" name="fields[phone]" type="tel" minlength="6" placeholder="+55 xxx xxxxxxxxxxx*" required="required" />

                                    <label class="reg_label" for="registerModalPhone">
                                        Email
                                        <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                                    </label>
                                </div> -->

                                <input type="hidden" name="fields[language]" value="{$lanextended}" />
                                <input type="hidden" name="fields[activation]" value="yes" />
                                <input type="hidden" name="fields[subjemail]" value="{/data/translate/entry[code='welcometo']/*[local-name() = $lanextended]}" />

                                <!-- <div class="py-2 pl-0">
                                    <div class="text-left col-sm-12 col-md-12 col-lg-12 mb-2 p-0">
                                        <div class="custom-control custom-checkbox">
                                            <input id="privacyTerms" name="fields[terms]" type="checkbox" required="required" />
                                        </div>
                                    </div>
                                </div> -->

                                <input type="hidden" name="fields[role]" value="2" />

                                <!-- Button -->
                                <!-- <div class="col-sm-12 col-md-12 col-lg-12 mb-4 mt-2 p-0">
                                    <button class="btn text-white right button-italent" name="action[add-member]" type="submit" value="Submit">
                                        STAY TUNED <span class="glyphicon glyphicon-send"></span>
                                    </button>
                                </div> -->
                            </fieldset>

                            <fieldset class="priv_and_terms_wrapper pb-4">
                                <!-- <div class="form-check mb-2">
                                    <input class="form-check-input" id="check_register" name="connessione" type="checkbox" required="required">

                                    <label class="form-check-label" for="exampleCheck1">
                                        <xsl:value-of select="/data/translate/entry[code='privacy1']/*[local-name() = $lanextended]" />
                                    </label />
                                </div> -->

                                <!-- Privacy & Terms -->
                                <div class="reg_check form-check mb-3">
                                    <input class="reg_check_input form-check-input privacy_newsletter" id="registerModalPrivAndTerms" type="checkbox" required="required" />

                                    <label class="reg_check_label form-check-label color_black align-middle me-1" for="registerModalPrivAndTerms">Ho letto e sono d’accordo con i</label>
                                    <a class="priv_and_terms reg_fill label fw_600 align-bottom" href="{$root}/article/{/data/privacy/entry/@id}/{/data/privacy/entry/title/@handle}" target="_blank">termini d’uso</a>
                                    <span class="label align-bottom mx-1">e la</span>
                                    <a class="priv_and_terms reg_fill label fw_600 align-bottom" href="{$root}/article/{/data/privacy/entry/@id}/{/data/privacy/entry/title/@handle}" target="_blank">privacy policy</a>
                                    <span class="label align-bottom">*</span>
                                </div>

                                <!-- Newsletter -->
                                <div class="reg_check form-check mb-2">
                                    <input class="reg_check_input privacy_newsletter form-check-input" id="registerModalNewsletter" type="checkbox" />

                                    <label class="reg_check_label form-check-label color_black align-middle me-1" for="registerModalNewsletter">
                                        Sign up to our
                                        <xsl:value-of select="/data/translate/entry[code='agree_newsletter']/*[local-name() = $lanextended]" />
                                    </label>

                                    <a class="priv_and_terms reg_fill label fw_600 align-bottom" href="{$root}/istitutional/43/privacy/{$lanurl}" target="_blank">newsletter</a>
                                </div>

                                <!-- <div class="text-center">
                                    <a class="priv_and_terms" href="{$root}/istitutional/43/privacy/?lan=it" target="_blank">
                                        <strong class="text-center">
                                            Terms &amp; Conditions / Privacy policy
                                        </strong>
                                    </a>
                                </div> -->
                            </fieldset>

                            <button class="btn_sign_up small text-uppercase color_white btn_color_sixth p-0 border w-100 p-3" name="action[add-member]" type="submit" value="Submit">
                                <!-- Sign up -->
                                <xsl:value-of select="/data/translate/entry[code='sign_up']/*[local-name() = $lanextended]" />
                            </button>
                        </form>

                        <!-- Footer -->
                        <div class="reg_footer modal-footer row justify-content-between align-items-center border-top pt-4">
                            <h4 class="footer_title h4 color_black mb-4">
                                Sei già registrato?
                                <xsl:value-of select="/data/translate/entry[code='already_registered']/*[local-name() = $lanextended]"/>
                            </h4>

                            <div class="toggle_wrapper">
                                <button class="modal_toggle small text-uppercase color_white btn_color_sixth p-0 border w-100 p-3" data-bs-target="#loginModal" data-bs-toggle="modal" data-bs-dismiss="modal">
                                    Clicca qui
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </xsl:template>


    <!-- Registration template -->
    <xsl:template name="register">

        <form class="reg_form" id="formRegister" action="" method="post" enctype="multipart/form-data">

            <fieldset class="row">
                <!-- Form Name -->
                <!-- <legend>
                    <h2 class="text-secondary">
                        <xsl:value-of select="/data/translate/entry[code='siteregistration']/*[local-name() = $lanextended]" />
                    </h2>
                </legend> -->

                <!-- Text input-->

                <!-- Name -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerName" name="fields[name]" type="text" value="{/data/events/add-user/post-values/name}{/data/login-info/entry/name}" placeholder="{/data/translate/entry[code='name']/*[local-name() = $lanextended]}*" required="required" />

                        <label class="reg_label" for="registerName">
                            Name
                            <xsl:value-of select="/data/translate/entry[code='name']/*[local-name() = $lanextended]" />*
                        </label>
                    </div>
                </div>

                <!-- Surname -->
                <div class="floating_wrapper col-12 col-lg-6 ps-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerSurname" name="fields[surname]" type="text" value="{/data/events/add-user/post-values/surname}{/data/login-info/entry/surname}" placeholder="{/data/translate/entry[code='surname']/*[local-name() = $lanextended]}*" required="required" />

                        <label class="reg_label" for="registerSurname">
                            Surname
                            <xsl:value-of select="/data/translate/entry[code='surname']/*[local-name() = $lanextended]" />*
                        </label>
                    </div>
                </div>

                <!-- Country -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4">
                    <div class="reg_floating form-floating select-chevron">
                        <select class="reg_select form-select" id="registerCountry" name="fields[country]" required="required">
                            <!-- <option>
                                Country
                                <xsl:value-of select="/data/translate/entry[code='country']/*[local-name() = $lanextended]" />
                            </option> -->

                            <option>Afghanistan</option>
                            <option>Albania</option>
                            <option>Algeria</option>
                            <option>American Samoa</option>
                            <option>Andorra</option>
                            <option>Angola</option>
                            <option>Anguilla</option>
                            <option>Antarctica</option>
                            <option>Antigua and Barbuda</option>
                            <option>Argentina</option>
                            <option>Armenia</option>
                            <option>Aruba</option>
                            <option>Australia</option>
                            <option>Austria</option>
                            <option>Azerbaijan</option>
                            <option>Bahamas</option>
                            <option>Bahrain</option>
                            <option>Bangladesh</option>
                            <option>Barbados</option>
                            <option>Belarus</option>
                            <option>Belgium</option>
                            <option>Belize</option>
                            <option>Benin</option>
                            <option>Bermuda</option>
                            <option>Bhutan</option>
                            <option>Bolivia</option>
                            <option>Bosnia and Herzegovina</option>
                            <option>Botswana</option>
                            <option>Bouvet Island</option>
                            <option>Brazil</option>
                            <option>British Indian Ocean Territory</option>
                            <option>Brunei Darussalam</option>
                            <option>Bulgaria</option>
                            <option>Burkina Faso</option>
                            <option>Burundi</option>
                            <option>Cambodia</option>
                            <option>Cameroon</option>
                            <option>Canada</option>
                            <option>Cape Verde</option>
                            <option>Cayman Islands</option>
                            <option>Central African Republic</option>
                            <option>Chad</option>
                            <option>Chile</option>
                            <option>China</option>
                            <option>Christmas Island</option>
                            <option>Cocos Islands</option>
                            <option>Colombia</option>
                            <option>Comoros</option>
                            <option>Congo</option>
                            <option>Congo, Democratic Republic of the</option>
                            <option>Cook Islands</option>
                            <option>Costa Rica</option>
                            <option>Cote d'Ivoire</option>
                            <option>Croatia</option>
                            <option>Cuba</option>
                            <option>Cyprus</option>
                            <option>Czech Republic</option>
                            <option>Denmark</option>
                            <option>Djibouti</option>
                            <option>Dominica</option>
                            <option>Dominican Republic</option>
                            <option>Ecuador</option>
                            <option>Egypt</option>
                            <option>El Salvador</option>
                            <option>Equatorial Guinea</option>
                            <option>Eritrea</option>
                            <option>Estonia</option>
                            <option>Ethiopia</option>
                            <option>Falkland Islands</option>
                            <option>Faroe Islands</option>
                            <option>Fiji</option>
                            <option>Finland</option>
                            <option>France</option>
                            <option>French Guiana</option>
                            <option>French Polynesia</option>
                            <option>Gabon</option>
                            <option>Gambia</option>
                            <option>Georgia</option>
                            <option>Germany</option>
                            <option>Ghana</option>
                            <option>Gibraltar</option>
                            <option>Greece</option>
                            <option>Greenland</option>
                            <option>Grenada</option>
                            <option>Guadeloupe</option>
                            <option>Guam</option>
                            <option>Guatemala</option>
                            <option>Guinea</option>
                            <option>Guinea-Bissau</option>
                            <option>Guyana</option>
                            <option>Haiti</option>
                            <option>Heard Island and McDonald Islands</option>
                            <option>Honduras</option>
                            <option>Hong Kong</option>
                            <option>Hungary</option>
                            <option>Iceland</option>
                            <option>India</option>
                            <option>Indonesia</option>
                            <option>Iran</option>
                            <option>Iraq</option>
                            <option>Ireland</option>
                            <option>Israel</option>
                            <option>Italy</option>
                            <option>Jamaica</option>
                            <option>Japan</option>
                            <option>Jordan</option>
                            <option>Kazakhstan</option>
                            <option>Kenya</option>
                            <option>Kiribati</option>
                            <option>Kuwait</option>
                            <option>Kyrgyzstan</option>
                            <option>Laos</option>
                            <option>Latvia</option>
                            <option>Lebanon</option>
                            <option>Lesotho</option>
                            <option>Liberia</option>
                            <option>Libya</option>
                            <option>Liechtenstein</option>
                            <option>Lithuania</option>
                            <option>Luxembourg</option>
                            <option>Macao</option>
                            <option>Madagascar</option>
                            <option>Malawi</option>
                            <option>Malaysia</option>
                            <option>Maldives</option>
                            <option>Mali</option>
                            <option>Malta</option>
                            <option>Marshall Islands</option>
                            <option>Martinique</option>
                            <option>Mauritania</option>
                            <option>Mauritius</option>
                            <option>Mayotte</option>
                            <option>Mexico</option>
                            <option>Micronesia</option>
                            <option>Moldova</option>
                            <option>Monaco</option>
                            <option>Mongolia</option>
                            <option>Montenegro</option>
                            <option>Montserrat</option>
                            <option>Morocco</option>
                            <option>Mozambique</option>
                            <option>Myanmar</option>
                            <option>Namibia</option>
                            <option>Nauru</option>
                            <option>Nepal</option>
                            <option>Netherlands</option>
                            <option>Netherlands Antilles</option>
                            <option>New Caledonia</option>
                            <option>New Zealand</option>
                            <option>Nicaragua</option>
                            <option>Niger</option>
                            <option>Nigeria</option>
                            <option>Norfolk Island</option>
                            <option>North Korea</option>
                            <option>Norway</option>
                            <option>Oman</option>
                            <option>Pakistan</option>
                            <option>Palau</option>
                            <option>Palestinian Territory</option>
                            <option>Panama</option>
                            <option>Papua New Guinea</option>
                            <option>Paraguay</option>
                            <option>Peru</option>
                            <option>Philippines</option>
                            <option>Pitcairn</option>
                            <option>Poland</option>
                            <option>Portugal</option>
                            <option>Puerto Rico</option>
                            <option>Qatar</option>
                            <option>Romania</option>
                            <option>Russian Federation</option>
                            <option>Rwanda</option>
                            <option>Saint Helena</option>
                            <option>Saint Kitts and Nevis</option>
                            <option>Saint Lucia</option>
                            <option>Saint Pierre and Miquelon</option>
                            <option>Saint Vincent and the Grenadines</option>
                            <option>Samoa</option>
                            <option>San Marino</option>
                            <option>Sao Tome and Principe</option>
                            <option>Saudi Arabia</option>
                            <option>Senegal</option>
                            <option>Serbia</option>
                            <option>Seychelles</option>
                            <option>Sierra Leone</option>
                            <option>Singapore</option>
                            <option>Slovakia</option>
                            <option>Slovenia</option>
                            <option>Solomon Islands</option>
                            <option>Somalia</option>
                            <option>South Africa</option>
                            <option>South Georgia</option>
                            <option>South Korea</option>
                            <option>Spain</option>
                            <option>Sri Lanka</option>
                            <option>Sudan</option>
                            <option>Suriname</option>
                            <option>Svalbard and Jan Mayen</option>
                            <option>Swaziland</option>
                            <option>Sweden</option>
                            <option>Switzerland</option>
                            <option>Syrian Arab Republic</option>
                            <option>Taiwan</option>
                            <option>Tajikistan</option>
                            <option>Tanzania</option>
                            <option>Thailand</option>
                            <option>The Former Yugoslav Republic of Macedonia</option>
                            <option>Timor-Leste</option>
                            <option>Togo</option>
                            <option>Tokelau</option>
                            <option>Tonga</option>
                            <option>Trinidad and Tobago</option>
                            <option>Tunisia</option>
                            <option>Turkey</option>
                            <option>Turkmenistan</option>
                            <option>Tuvalu</option>
                            <option>Uganda</option>
                            <option>Ukraine</option>
                            <option>United Arab Emirates</option>
                            <option>United Kingdom</option>
                            <option>United States</option>
                            <option>United States Minor Outlying Islands</option>
                            <option>Uruguay</option>
                            <option>Uzbekistan</option>
                            <option>Vanuatu</option>
                            <option>Vatican City</option>
                            <option>Venezuela</option>
                            <option>Vietnam</option>
                            <option>Virgin Islands, British</option>
                            <option>Virgin Islands, U.S.</option>
                            <option>Wallis and Futuna</option>
                            <option>Western Sahara</option>
                            <option>Yemen</option>
                            <option>Zambia</option>
                            <option>Zimbabwe</option>
                        </select>

                        <label class="reg_label" for="registerCountry">
                            Country
                            <xsl:value-of select="/data/translate/entry[code='country']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Town -->
                <div class="floating_wrapper col-12 col-lg-6 ps-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerCity" name="fields[city]" type="text" placeholder="{/data/translate/entry[code='town']/*[local-name() = $lanextended]}*" value="{/data/events/add-user/post-values/city}" required="required" />

                        <label class="reg_label" for="registerCity">
                            Town
                            <xsl:value-of select="/data/translate/entry[code='town']/*[local-name() = $lanextended]" />*
                        </label>
                    </div>
                </div>

                <!-- Address -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerAddress" name="fields[address]" type="text" value="{/data/events/add-user/post-values/address}" placeholder="{/data/translate/entry[code='address']/*[local-name() = $lanextended]}*" required="required" />

                        <label class="reg_label" for="registerAddress">
                            Address
                            <xsl:value-of select="/data/translate/entry[code='address']/*[local-name() = $lanextended]" />*
                        </label>
                    </div>
                </div>

                <!-- ZIP code -->
                <div class="floating_wrapper col-12 col-lg-6 ps-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerZipCode" name="fields[postal-code]" type="text" value="{/data/events/add-user/post-values/postal-code}" placeholder="{/data/translate/entry[code='zip']/*[local-name() = $lanextended]}*" required="required" />

                        <label class="reg_label" for="registerZipCode">
                            ZIP code
                            <xsl:value-of select="/data/translate/entry[code='zip']/*[local-name() = $lanextended]" />*
                        </label>
                    </div>
                </div>

                <!-- Company -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerCompany" name="fields[company]" type="text" value="{/data/events/add-user/post-values/company}" placeholder="{/data/translate/entry[code='company']/*[local-name() = $lanextended]}*" required="required" />

                        <label class="reg_label" for="registerCompany">
                            Company
                            <xsl:value-of select="/data/translate/entry[code='company']/*[local-name() = $lanextended]" />*
                        </label>
                    </div>
                </div>

                <!-- Role -->
                <div class="floating_wrapper col-12 col-lg-6 ps-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerRole" name="fields[ruolo]" type="text" value="{/data/events/add-user/post-values/ruolo}" placeholder="{/data/translate/entry[code='role']/*[local-name() = $lanextended]}*" required="required" />

                        <label class="reg_label" for="registerRole">
                            Role
                            <xsl:value-of select="/data/translate/entry[code='role']/*[local-name() = $lanextended]" />*
                        </label>
                    </div>
                </div>

                <!-- Website -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerWebsite" name="fields[website]" type="text" value="{/data/events/add-user/post-values/website}" placeholder="website" />

                        <label class="reg_label" for="registerWebsite">
                            Website
                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Email -->
                <div class="floating_wrapper col-12 col-lg-6 ps-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerEmail" name="fields[email]" type="email" value="{/data/events/add-user/post-values/email}{/data/login-info/entry/email}" placeholder="Email*" required="required" />

                        <label class="reg_label" for="registerEmail">
                            Email*
                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Password -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4 mb-lg-0">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerPwType" name="fields[password][password]" type="password" minlength="6" placeholder="{/data/translate/entry[code='least6']/*[local-name() = $lanextended]}*" required="required" />

                        <label class="reg_label" for="registerPwType">
                            At least 6 characters long
                            <xsl:value-of select="/data/translate/entry[code='at_least_6']/*[local-name() = $lanextended]" />*
                        </label>
                    </div>
                </div>

                <!-- Retype password -->
                <div class="floating_wrapper col-12 col-lg-6 ps-lg-3">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="registerpwRetype" name="fields[password][confirm]" type="password" placeholder="{/data/translate/entry[code='retype_pw']/*[local-name() = $lanextended]}*" required="required" />

                        <label class="reg_label" for="registerpwRetype">
                            Confirm password
                            <xsl:value-of select="/data/translate/entry[code='retype_pw']/*[local-name() = $lanextended]" />*
                        </label>
                    </div>
                </div>

                <!-- <div class="reg_floating form-floating mb-4">
                    <textarea class="reg_control form-control" id="registerMessage" name="fields[message]" placeholder="{/data/translate/entry[code='message']/*[local-name() = $lanextended]}*" required="required"></textarea>

                    <label class="reg_label" for="registerMessage">
                        Message
                        <xsl:value-of select="/data/translate/entry[code='msg']/*[local-name() = $lanextended]" />
                    </label>
                </div> -->

                <input type="hidden" name="fields[language]" value="{$lanextended}" />
                <input name="id" type="hidden" value="{/data/login-info/entry/@id}" />

                <!-- Privacy & Terms | Communications -->
                <fieldset class="priv_and_terms_wrapper color_black col-12 my-5">
                    <!-- Privacy & Terms -->
                    <div class="reg_check form-check mb-3 mb-lg-2">
                        <input class="reg_check_input form-check-input me-2" id="registerPrivAndTerms" name="fields[terms]" type="checkbox" required="required" />

                        <label class="reg_check_label form-check-label color_black align-middle me-1" for="registerPrivAndTerms">Ho letto e sono d’accordo con i</label>
                        <a class="priv_and_terms label fw_600 align-bottom reg_fill" href="{$root}/article/{/data/privacy/entry/@id}/{/data/privacy/entry/title/@handle}" target="_blank">termini d’uso</a>
                        <span class="label align-bottom mx-1">e la</span>
                        <a class="priv_and_terms label fw_600 align-bottom reg_fill" href="{$root}/article/{/data/privacy/entry/@id}/{/data/privacy/entry/title/@handle}" target="_blank">privacy policy</a>
                        <span class="label align-bottom">*</span>
                    </div>

                    <!-- Communications -->
                    <div class="reg_check form-check mb-3 mb-lg-2">
                        <input class="reg_check_input form-check-input me-2" id="registerComms" name="fields[invio-comunicazioni]" type="checkbox" />

                        <label class="reg_check_label form-check-label color_black align-middle" for="registerComms">Acconsento all’invio di comunicazioni relative a contenuti e a eventi via posta e/o via email e/o via telefonica</label>
                    </div>

                    <div class="reg_check form-check">
                        <input class="reg_check_input form-check-input me-2" id="registerTransfer" name="fields[cessione-dati]" type="checkbox" />

                        <label class="reg_check_label form-check-label color_black align-middle" for="registerTransfer">Acconsento alla cessione dei dati inseriti per la registrazione al Convegno agli Sponsor Partner per l’invio della loro comunicazioni di marketing</label>
                    </div>
                </fieldset>

                <input type="hidden" name="fields[role]" value="2" />
                <!-- <input name="id" type="hidden" value="{/data/login-info/entry/@id}" /> -->
                <!-- <input name="redirect" type="hidden" value="{$root}/welcome-reg/" /> -->

                <!-- Submit button -->
                <div class="btn_wrapper col-12">
                    <!-- Register -->
                    <button class="btn_submit small fw-500 text-uppercase btn_bg_sixth w-100" id="submit" name="action[add-user]" type="submit" value="Submit">
                        Registrati
                        <!-- <i class="icon_submit glyphicon glyphicon-send" /> -->
                    </button>

                    <!-- Modify -->
                    <!-- <button class="btn btn-warning text-white w-100" name="action[add-member]" type="submit" value="Submit">
                        Modifica <span class="glyphicon glyphicon-send"></span>
                    </button> -->
                </div>
            </fieldset>

        </form>

    </xsl:template>


    <!-- Password change modal -->
    <xsl:template name="change_pw_modal">

        <div class="reg_modal pw_change_modal modal fade" id="pwChangeModal" tabindex="-1" aria-labelledby="pwChangeModalLabel" aria-hidden="true">

            <div class="reg_wrapper modal-dialog modal-dialog-centered">

                <div class="reg_content modal-content bg_color_gray border_color_third px-4 px-sm-5 py-5">
                    <!-- Modal header -->
                    <div class="reg_header modal-header d-flex align-items-center col-12 border-bottom mb-4 pb-2">
                        <h3 class="reg_title h4 color_black modal-title" id="pwChangeModalLabel">
                            Choose new password
                            <xsl:value-of select="/data/translate/entry[code='nu_pw']/*[local-name() = $lanextended]" />
                        </h3>

                        <button class="reg_close h4 btn-close" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                            <i class="icon_close h4 color_black align-top fa-regular fa-xmark" />
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="reg_body modal-body mt-3">

                        <form class="reg_form row" action="" method="post" id="formnew">
                            <input class="fields" id="Email" name="fields[email]" type="hidden" value="{$url-emailchange}" />
                            <input name="fields[password][recovery-code]" type="hidden" value="{$url-recovery}" />

                            <!-- Password -->
                            <div class="reg_floating form-floating mb-4">
                                <input class="reg_control form-control" id="changeModalPwType" name="fields[password][password]" type="Password" placeholder="{/data/translate/entry[code='least6']/*[local-name() = $lanextended]}*" minlength="6" required="required" />

                                <label class="reg_label" for="changeModalPwType">
                                    Password
                                </label>
                            </div>

                            <!-- Confirm password -->
                            <div class="reg_floating form-floating mb-4 pb-2">
                                <input class="reg_control form-control" id="changeModalPwRetype" name="fields[password][confirm]" type="password" placeholder="{/data/translate/entry[code='retypepswd']/*[local-name() = $lanextended]}*" required="required" />

                                <label class="reg_label" for="changeModalPwRetype">
                                    Retype password
                                </label>
                            </div>

                            <input name="action[members-reset-password]" type="hidden" value="Submit" />
                            <input name="redirect" type="hidden" value="{$root}/?change=yes" />

                            <!-- Confirm -->
                            <button class="btn_submit small text-uppercase color_white btn_color_sixth p-0 border w-100 p-3" id="submit" name="action[members-reset-password]" value="Submit" alt="Submit">OK</button>
                        </form>

                    </div>
                </div>

            </div>

        </div>

    </xsl:template>


    <!-- Password change template -->
    <xsl:template name="change_pw">

        <form class="reg_form" method="post" action="" id="formPwChange">
            <input class="fields" id="Email" name="fields[email]" type="hidden" value="{$url-emailchange}" />
            <input name="fields[password][recovery-code]" type="hidden" value="{$url-recovery}" />

            <fieldset class="reg_wrapper row">
                <!-- <legend class="h2 color_second mb-3">
                    New password
                    <xsl:value-of select="/data/translate/entry[code='newpass']/*[local-name() = $lanextended]" />
                </legend> -->

                <!-- Password -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="changePwType" name="fields[password][password]" type="password" placeholder="{/data/translate/entry[code='least6']/*[local-name() = $lanextended]}*" minlength="6" required="required" />

                        <label class="reg_label" for="changePwType">
                            Password
                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Retype password -->
                <div class="floating_wrapper col-12 col-lg-6 ps-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="changePwRetype" name="fields[password][confirm]" type="password" placeholder="{/data/translate/entry[code='retype_pw']/*[local-name() = $lanextended]}*" required="required" />

                        <label class="reg_label" for="changePwRetype">
                            Confirm password
                            <xsl:value-of select="/data/translate/entry[code='example']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <input name="action[members-reset-password]" type="hidden" value="Submit" />
                <input name="redirect" type="hidden" value="{$root}/?change=yes" />

                <!-- Close -->
                <button class="btn_submit small fw-500 text-uppercase btn_bg_sixth mt-4 w-100" id="submit" name="action[members-reset-password]" type="submit" value="Submit">OK</button>
            </fieldset>
        </form>

    </xsl:template>


    <!-- Address template -->
    <xsl:template name="address">

        <xsl:param name="idaddress" />
        <xsl:param name="display" />

        <form class="reg_form {$idaddress}" id="formAddress{$idaddress}" action="" method="post" enctype="multipart/form-data" style="display: {$display};">

            <fieldset class="row">
                <!-- Name and surname of the recipient -->
                <div class="floating_wrapper col-12 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="addressName" name="fields[name]" type="text" value="{/data/member-adresses/entry[@id = $idaddress]/name}" placeholder="Name and surname of the recipient" required="required" />

                        <label class="reg_label" for="addressName">
                            Name and surname of the recipient
                            <xsl:value-of select="/data/translate/entry[code='name_surname_recipient']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Address of the recipient -->
                <div class="floating_wrapper col-12 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="addressAddress" name="fields[address]" type="text" value="{/data/member-adresses/entry[@id = $idaddress]/address}" placeholder="Address of the recipient" required="required" />

                        <label class="reg_label" for="addressAddress">
                            Address of the recipient
                            <xsl:value-of select="/data/translate/entry[code='recipient_address']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Municipality -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="addressCity" name="fields[town]" type="text" value="{/data/member-adresses/entry[@id = $idaddress]/town}" placeholder="Municipality" required="required" />

                        <label class="reg_label" for="addressCity">
                            Municipality
                            <xsl:value-of select="/data/translate/entry[code='municipality']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- ZIP code -->
                <div class="floating_wrapper col-12 col-lg-6 ps-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="addressZipCode" name="fields[zip]" type="text" value="{/data/member-adresses/entry[@id = $idaddress]/zip}" placeholder="ZIP code" required="required" />

                        <label class="reg_label" for="addressZipCode">
                            ZIP code
                            <xsl:value-of select="/data/translate/entry[code='cap']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Province -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="addressProvince" name="fields[prov]" type="text" value="{/data/member-adresses/entry[@id = $idaddress]/prov}" placeholder="Province" required="required" />

                        <label class="reg_label" for="addressProvince">
                            Province
                            <xsl:value-of select="/data/translate/entry[code='provincia']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Country -->
                <div class="floating_wrapper col-12 col-lg-6 ps-lg-3 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="addressCountry" name="fields[country]" type="text" value="{/data/member-adresses/entry[@id = $idaddress]/country}" placeholder="Country" required="required" />

                        <label class="reg_label" for="addressCountry">
                            Country
                            <xsl:value-of select="/data/translate/entry[code='country']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Spedition area -->
                <div class="floating_wrapper col-12 col-lg-6 pe-lg-3 mb-4">
                    <div class="reg_floating form-floating select-chevron">
                        <select class="reg_select form-select" id="addressArea" name="fields[spedition-area]" required="required">
                            <option>
                                Spedition area
                                <xsl:value-of select="/data/translate/entry[code='sped_area']/*[local-name() = $lanextended]" />
                            </option>

                            <xsl:for-each select="/data/spedition-areas/entry">
                                <xsl:variable name="spedid" select="@id" />

                                <option value="{@id}">
                                    <xsl:if test="/data/member-adresses/entry[@id = $idaddress]/spedition-area/item/@id = $spedid">
                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>

                                    <xsl:value-of select="name" />
                                </option>
                            </xsl:for-each>
                        </select>

                        <label class="reg_label" for="addressArea">
                            Spedition area
                            <xsl:value-of select="/data/translate/entry[code='spedarea']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <div class="floating_wrapper d-flex flex wrap col-12 col-lg-6 ps-lg-3 mb-4">
                    <!-- Phone code selector -->
                    <div class="reg_floating form-floating pe-3 w-50 w-md-25">
                        <select class="vodiapicker reg_select form-select" id="addressCountryCode">
                            <option value="+39" data-thumbnail="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/LetterA.svg/2000px-LetterA.svg.png">+39</option>
                            <option value="+49" data-thumbnail="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/NYCS-bull-trans-B.svg/480px-NYCS-bull-trans-B.svg.png">+49</option>
                        </select>

                        <label class="reg_label" for="addressCountryCode">
                            Country code
                            <xsl:value-of select="/data/translate/entry[code='dial_code']/*[local-name() = $lanextended]" />
                        </label>

                        <!-- <div class="lang-select m-0">
                            <div class="btn-select m-0" value=""></div>

                            <div class="b">
                                <ul id="a"></ul>
                            </div>
                        </div> -->
                    </div>

                    <!-- Phone number -->
                    <div class="reg_floating form-floating ms-auto w-50 w-md-75">
                        <input class="reg_control form-control" id="addressMobile" name="fields[phone]" type="text" value="{/data/member-adresses/entry[@id = $idaddress]/phone}" placeholder="Phone number" />

                        <label class="reg_label" for="addressMobile">
                            Phone number
                            <xsl:value-of select="/data/translate/entry[code='mobile']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Info for courier -->
                <div class="floating_wrapper col-12 mb-4">
                    <div class="reg_floating form-floating">
                        <input class="reg_control form-control" id="addressInfo" name="fields[info]" type="text" value="{/data/member-adresses/entry[@id = $idaddress]/info}" placeholder="Info for courier" />

                        <label class="reg_label" for="addressInfo">
                            Info for courier
                            <xsl:value-of select="/data/translate/entry[code='info_for_courier']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <!-- Default address -->
                <div class="color_black col-12 mb-5">
                    <div class="reg_check form-check">
                        <input class="reg_check_input form-check-input" id="addressDefaultAddress" name="fields[default]" type="checkbox">
                            <xsl:if test="/data/member-adresses/entry[@id = $idaddress]/default = 'on'">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                        </input>

                        <label class="reg_check_label form-check-label color_black align-middle" for="addressDefaultAddress">
                            Default address
                            <xsl:value-of select="/data/translate/entry[code='default_address']/*[local-name() = $lanextended]" />
                        </label>
                    </div>
                </div>

                <input name="id" type="hidden" value="{$idaddress}" />
                <input name="fields[member]" type="hidden" value="{$member-id}" />
                <input type="hidden" value="submit" name="action[add-member-address]" />

                <button class="btn_submit small fw-500 text-uppercase btn_bg_sixth w-100 serializeandhtml" type="submit" value="submit" name="action[add-member-address]" data-form="{$idaddress}" data-ref="v-pills-spedizione" data-urlaction="{$root}/checkout-detail/?type=adresses&amp;lan={$lanextended}" data-url="{$root}/action/" data-msg1="no" data-msg2="net error">
                    Save
                    <xsl:value-of select="/data/translate/entry[code='save']/*[local-name() = $lanextended]" />
                </button>
            </fieldset>

        </form>

    </xsl:template>


    <!-- Service messages modals -->
    <xsl:template name="service_messages">

        <!-- Messages. <<IN>> -->
        <!-- MODAL MESSAGGIO DI SERVIZIO: POSITIVE -->
        <!-- Positive messages -->
        <div class="reg_modal msg_success_modal modal fade" id="msgSuccessModal" tabindex="-1" role="dialog" aria-labelledby="msgSuccessModalLabel" aria-hidden="true">
            <xsl:variable name="messageText">
                <xsl:choose>
                    <xsl:when test="(/data/events/members-reset-password/@result = 'success')">
                        SUCCESSFULLY UPDATED, YOU ARE LOGGED IN
                    </xsl:when>
                    <xsl:when test="/data/events/members-activate-account/@result = 'success'">
                        Your account is active! Please refresh the page to manage your account.
                    </xsl:when>
                    <xsl:when test="/data/events/add-member/@result = 'success'">
                        Il tuo account è stato creato!
                    </xsl:when>
                    <xsl:when test="/data/events/add-newsletter/@result = 'success'">
                        <xsl:choose>
                            <xsl:when test="$current-page='erstklassige-italienische-produkte'">
                                Vielen Dank. Dein E-Mail wurde erfolgreich versendet. Wir werden uns bald melden!
                            </xsl:when>
                            <xsl:otherwise>
                                Grazie, ti terremo aggiornato. A presto!
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="/data/params/url-log = 'yes'">
                        WELCOME <xsl:value-of select="/data/login-info/entry/name" />
                    </xsl:when>
                    <xsl:when test="/data/params/url-change = 'yes'">
                        <xsl:value-of select="/data/translate/entry[code='changepass']/*[local-name() = $lanextended]" />
                    </xsl:when>
                    <xsl:otherwise>
                        Successfully updated
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <!-- MODAL MESSAGGIO DI SERVIZIO: THANKS -->
            <div class="reg_wrapper modal-dialog modal-dialog-centered">

                <div class="reg_content modal-content text-center bg_color_gray row flex-wrap flex-row justify-content-center align-items-center align-content-center px-4 px-sm-5 py-5">
                    <!-- Modal header -->
                    <div class="reg_header modal-header">
                        <h5 class="reg_title big fw_500 text-success modal-title mx-auto mt-4 mb-2" id="msgSuccessModalLabel">
                            THANKS
                        </h5>
                    </div>

                    <!-- Modal body -->
                    <div class="reg_body modal-body">
                        <p class="msg_success_txt h5 fw_400 text-uppercase color_black mb-0 mb-4 mt-2" id="positiveText">
                            <xsl:value-of select="$messageText" />
                        </p>
                    </div>

                    <!-- Close -->
                    <div class="reg_footer modal-footer position-absolute top-0 end-0">
                        <button class="reg_close h4 btn-close btn-close-dark p-0 p-3" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                            <i class="icon_close h4 color_black align-top fa-solid fa-xmark" />
                        </button>
                    </div>
                </div>

            </div>
        </div>

        <!-- MODAL MESSAGGIO DI SERVIZIO: NEGATIVE -->
        <!-- Negative messages -->
        <div class="reg_modal msg_error_modal modal fade" id="msgErrorModal" tabindex="-1" role="dialog" aria-labelledby="msgErrorModalLabel" aria-hidden="true">
            <xsl:variable name="messageText">
                <xsl:choose>
                    <xsl:when test="(/data/events/add-member/@result = 'error') or (/data/events/add-newsletter/@result = 'error')">
                        <xsl:choose>
                            <xsl:when test="(/data/events/*/email/@message = 'email is already taken.') or (/data/events/*/email/@message = 'Value must be unique.')">
                                <xsl:value-of select="/data/translate/entry[code='erroremail']/*[local-name() = $lanextended]" />
                            </xsl:when>
                            <xsl:when test="/data/events/*/email/@message = 'email contains invalid characters.'">
                                Email, illegal characters!
                            </xsl:when>
                            <xsl:when test="contains(/data/events/*/*/@message, 'required field')">
                                You have not entered all the required fields!
                            </xsl:when>
                            <xsl:when test="contains(/data/events/*/*/@message, 'password confirmation does not match.')">
                                <xsl:value-of select="/data/translate/entry[code='passnomatch']/*[local-name() = $lanextended]" />
                            </xsl:when>
                            <xsl:otherwise>
                                There are errors in the registration form, please retry!
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="/data/events/member-login-info/activation/@message" />
                        <xsl:value-of select="/data/events/member-login-info/password/@message" />
                        <xsl:value-of select="/data/events/members-activate-account/message" />
                        <xsl:value-of select="/data/events/add-member/message" />
                        <xsl:value-of select="/data/events/add-newsletter/message" />
                        <xsl:value-of select="/data/events/send-invitation/message" />
                        <xsl:value-of select="/data/events/members-activate-account/error/@message" />
                        <xsl:choose>
                            <xsl:when test="/data/events/members-generate-recovery-code/@result='error'">
                                Email address does not exist, try again with a correct address.
                            </xsl:when>
                            <xsl:when test="/data/events/members-regenerate-recovery-code/@result='error'">
                                Wrong password!
                            </xsl:when>
                            <xsl:otherwise>
                                Something went wrong
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <!-- MODAL MESSAGGIO DI SERVIZIO: ERROR -->
            <div class="reg_wrapper modal-dialog modal-dialog-centered">

                <div class="reg_content modal-content text-center bg_color_gray row flex-wrap flex-row justify-content-center align-items-center align-content-center px-4 px-sm-5 py-5">
                    <!-- Modal header -->
                    <div class="reg_header modal-header">
                        <h5 class="reg_title big fw_500 text-danger modal-title mx-auto mt-4 mb-2" id="msgErrorModalLabel">
                            ERROR
                            <xsl:value-of select="/data/translate/entry[code='error']/*[local-name() = $lanextended]" />
                        </h5>
                    </div>

                    <!-- Modal body -->
                    <div class="reg_body modal-body">
                        <p class="msg_error_txt h5 fw_400 text-uppercase color_black mb-0 mb-4 mt-2" id="alertText">
                            <xsl:value-of select="$messageText" />
                        </p>
                    </div>

                    <!-- Close -->
                    <div class="reg_footer modal-footer position-absolute top-0 end-0">
                        <button class="footer_close h4 btn-close p-3" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                            <i class="icon_close h4 color_black align-top fa-solid fa-xmark" />
                        </button>
                    </div>
                </div>

            </div>
        </div>

        <div role="alert">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="/data/params/url-log = 'yes'">
                        alert alert-success alert-dismissible d-block mb-0
                    </xsl:when>
                    <xsl:when test="/data/params/url-change = 'yes'">
                        alert alert-success alert-dismissible d-block mb-0
                    </xsl:when>
                    <xsl:otherwise>d-none</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

            <div class="message">
                <xsl:choose>
                    <xsl:when test="/data/params/url-log = 'yes'">
                        WELCOME <xsl:value-of select="/data/login-info/entry/name" />
                    </xsl:when>
                    <xsl:when test="/data/params/url-change = 'yes'">
                        <xsl:value-of select="/data/translate/entry[code='changepass']/*[local-name() = $lanextended]" />
                    </xsl:when>
                    <xsl:otherwise>SUCCESSFULLY UPDATED</xsl:otherwise>
                </xsl:choose>
            </div>

            <!-- Close -->
            <div class="reg_footer modal-footer position-absolute top-0 end-0">
                <button class="reg_close h4 btn-close btn-close-dark p-0 p-3" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                    <i class="icon_close h4 color_black align-top fa-solid fa-xmark" />
                </button>
            </div>
        </div>
        <!-- Messages. <<OUT>> -->

    </xsl:template>


    <!-- Newsletter modal -->
    <xsl:template name="newsletter_b2c_modal">

        <div class="reg_modal newsletter_b2c_modal modal fade" id="newsletterB2cModal" tabindex="-1" aria-labelledby="newsletterB2cModalLabel" aria-hidden="true">

            <div class="reg_wrapper modal-dialog modal-dialog-centered">

                <div class="reg_content modal-content bg_color_gray border_color_third px-4 px-sm-5 py-5">
                    <!-- Modal header -->
                    <div class="reg_header modal-header d-flex align-items-center col-12 p-0 border-bottom mb-4 pb-2">
                        <h3 class="reg_title h4 color_black modal-title" id="newsletterB2cModalLabel">
                            <!-- Sign up -->
                            <xsl:value-of select="/data/translate/entry[code='sign_up']/*[local-name() = $lanextended]" />
                        </h3>

                        <!-- Close -->
                        <button class="reg_close h4 btn-close" type="button" data-bs-dismiss="modal" aria-label="Close" style="background-image: none;">
                            <i class="icon_close h4 color_black align-top fa-regular fa-xmark" />
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="reg_body body_b2c modal-body mt-3">

                        <form class="reg_form row" id="formNewsletterB2c" action="" method="post" enctype="multipart/form-data">
                            <input name="fields[language]" type="hidden" value="{$lanextended}" />
                            <input name="fields[role]" type="hidden" value="2" />

                            <!-- Name -->
                            <div class="reg_floating form-floating mb-4">
                                <input class="reg_control form-control" id="newsletterB2cModalName" name="fields[name]" type="text" value="{/data/events/add-newsletter/post-values/name}" placeholder="{/data/translate/entry[code='name']/*[local-name() = $lanextended]}*" required="required" />

                                <label class="reg_label" for="newsletterB2cModalName">
                                    Name
                                    <xsl:value-of select="/data/translate/entry[code='name']/*[local-name() = $lanextended]" />
                                </label>
                            </div>

                            <!-- Surname -->
                            <div class="reg_floating form-floating mb-4">
                                <input class="reg_control form-control" id="newsletterB2cModalSurname" name="fields[surname]" type="text" value="{/data/events/add-newsletter/post-values/name}" placeholder="{/data/translate/entry[code='surname']/*[local-name() = $lanextended]}*" required="required" />

                                <label class="reg_label" for="newsletterB2cModalSurname">
                                    Surname
                                    <xsl:value-of select="/data/translate/entry[code='surname']/*[local-name() = $lanextended]" />
                                </label>
                            </div>

                            <!-- Email -->
                            <div class="reg_floating form-floating mb-4">
                                <input class="reg_control form-control" id="newsletterB2cModalEmail" name="fields[email]" type="email" value="{/data/events/add-newsletter/post-values/email}" placeholder="deinemail@mail.com" required="required" />

                                <label class="reg_label" for="newsletterB2cModalEmail">
                                    Email
                                    <xsl:value-of select="/data/translate/entry[code='email']/*[local-name() = $lanextended]" />
                                </label>
                            </div>

                            <!-- Gender -->
                            <div class="reg_floating form-floating select-chevron mb-4">
                                <select class="reg_select form-select" id="newsletterB2cModalGender" name="fields[gender]">
                                    <option value="male">
                                        Male
                                        <xsl:value-of select="/data/translate/entry[code='male']/*[local-name() = $lanextended]" />
                                    </option>

                                    <option value="female">
                                        Female
                                        <xsl:value-of select="/data/translate/entry[code='female']/*[local-name() = $lanextended]" />
                                    </option>

                                    <option value="female">
                                        Rather not say
                                        <xsl:value-of select="/data/translate/entry[code='not_declared']/*[local-name() = $lanextended]" />
                                    </option>
                                </select>

                                <label class="reg_label" for="newsletterB2cModalGender">
                                    Gender
                                    <xsl:value-of select="/data/translate/entry[code='gender']/*[local-name() = $lanextended]" />
                                </label>
                            </div>

                            <!-- Phone number -->
                            <div class="reg_floating form-floating mb-4">
                                <input class="reg_control form-control" id="newsletterB2cModalPhoneNumber" name="fields[phone]" type="text" value="{/data/events/add-newsletter/post-values/phone}" placeholder="+39 012-345-6789 (Optional)" required="required" />

                                <label class="reg_label" for="newsletterB2cModalPhoneNumber">
                                    Phone number
                                    <xsl:value-of select="/data/translate/entry[code='phone']/*[local-name() = $lanextended]" />
                                </label>
                            </div>

                            <!-- Privacy & Terms -->
                            <div class="form-check mb-4 pb-2">
                                <input type="checkbox" class="form-check-input privacy_newsletter" id="newsletterB2cModalPrivAndTerms" required="required" />

                                <label class="form-check-label label color_black align-middle me-1" for="newsletterB2cModalPrivAndTerms">Ho letto e sono d’accordo con i</label>
                                <a class="priv_and_terms label fw_600 align-middle reg_fill" href="{$root}/article/{/data/privacy/entry/@id}/{/data/privacy/entry/title/@handle}" target="_blank">termini d’uso</a>
                                <span class="label align-bottom mx-1">e la</span>
                                <a class="priv_and_terms label fw_600 align-middle reg_fill" href="{$root}/article/{/data/privacy/entry/@id}/{/data/privacy/entry/title/@handle}" target="_blank">privacy policy</a>
                                <span class="label align-bottom">*</span>
                            </div>

                            <input name="fields[language]" type="hidden" value="{$url-lan}" />
                            <input name="fields[date]" type="hidden" value="{$today}" />
                            <input name="fields[from-page]" type="hidden" value="landing-b2c" />

                            <!-- Submit -->
                            <button class="btn_sign_in small text-uppercase color_white btn_color_sixth p-0 border w-100 p-3" name="action[add-newsletter]" type="submit" value="Submit">
                                Stay tuned
                                <xsl:value-of select="/data/translate/entry[code='stay_tuned']/*[local-name() = $lanextended]" />
                            </button>
                        </form>

                    </div>
                </div>

            </div>

        </div>

    </xsl:template>


    <!-- Magazine newsletter -->
    <xsl:template name="newsletter_magazine">

        <form class="reg_form col-12 col-lg-7" id="formNewsletterMag" action="" method="post" enctype="multipart/form-data">
            <input name="fields[language]" type="hidden" value="{$lanextended}" />
            <input name="fields[role]" type="hidden" value="2" />

            <fieldset class="floating_wrapper row col-12 mb-3">
                <div class="reg_floating form-floating col-10 pe-1">
                    <input class="reg_control form-control compila_magazine" id="newsletterMagEmail" name="fields[email]" type="email" value="{/data/events/add-member/post-values/email}{/data/login-info/entry/email}" placeholder="{/data/translate/entry[code='enter_email']/*[local-name() = $lanextended]}*" required="required" />

                    <label class="reg_label" for="newsletterMagEmail">
                        Email*
                        <xsl:value-of select="/data/translate/entry[code='enter_email']/*[local-name() = $lanextended]" />
                    </label>
                </div>

                <!-- Submit -->
                <button class="btn_submit small fw-500 text-uppercase btn_bg_sixth col-2 h-auto" type="submit" value="Submit" alt="Submit" name="action[add-newsletter]">
                    <i class="icon_submit fas fa-chevron-right" />
                </button>
            </fieldset>

            <!-- Privacy & Terms -->
            <fieldset class="priv_and_terms_wrapper color_black col-12">
                <div class="reg_check form-check mb-3 mb-lg-2">
                    <input class="reg_check_input form-check-input me-2" id="newsletterMagPrivAndTerms" type="checkbox" name="fields[terms]" required="required" />

                    <label class="reg_check_label form-check-label color_black align-middle me-1" for="newsletterMagPrivAndTerms">Ho letto e sono d’accordo con i</label>
                    <a class="priv_and_terms reg_fill label fw_600 align-bottom" href="{$root}/article/{/data/privacy/entry/@id}/{/data/privacy/entry/title/@handle}" target="_blank">termini d’uso</a>
                    <span class="label align-bottom mx-1">e la</span>
                    <a class="priv_and_terms reg_fill label fw_600 align-bottom" href="{$root}/article/{/data/privacy/entry/@id}/{/data/privacy/entry/title/@handle}" target="_blank">privacy policy</a>
                    <span class="label align-bottom">*</span>
                </div>
            </fieldset>

            <input name="fields[language]" type="hidden" value="{$url-lan}" />
            <input name="fields[date]" type="hidden" value="{$today}" />
            <input name="fields[from-page]" type="hidden" value="footer" />
        </form>

    </xsl:template>

</xsl:stylesheet>
