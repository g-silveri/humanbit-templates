<div align="center">
  <a href="https://humanbit.com/" target="_blank">
    <img src="https://humanbit.com/github/shared-assets/images/logos/logo-humanbit-rounded.png" alt="Humanbit logo" width="300">
  </a>
</div>

# Humanbit Templates

Web development templates created for streamlining the production process (while still matching each project's particular needs) of the Milan-based digital agency [Humanbit](https://humanbit.com/) — in operation since the early 2000s.

## Contents

* [Installing](https://github.com/g-silveri/humanbit-templates#installing-1)
* [Server Requirements](https://github.com/g-silveri/humanbit-templates#server-requirements-1)
* [Status](https://github.com/g-silveri/humanbit-templates#status-1)
* [Features](https://github.com/g-silveri/humanbit-templates#features-1)
* [Screenshots](https://github.com/g-silveri/humanbit-templates#screenshots-1)
* [Documentation](https://github.com/g-silveri/humanbit-templates#documentation-1)
* [Acknowledgements](https://github.com/g-silveri/humanbit-templates#acknowledgements-1)
* [Licence](https://github.com/g-silveri/humanbit-templates#licence-1)

## [Installing](https://github.com/g-silveri/humanbit-templates#installing)

### Via Git

1. Clone the [Humanbit Templates](https://github.com/g-silveri/humanbit-templates) Git repository to the desired location:

		git clone git://github.com/g-silveri/humanbit-templates.git target-directory
		cd target-directory

	(Replace `target-directory` with your chosen new directory name.)

### Via the old-fashioned way

1. This step assumes you downloaded a zip file from the our [repository](https://github.com/g-silveri/humanbit-templates/archive/refs/heads/master.zip). Upload the following files and directories to the root directory of your website:

	- `index.php`
	- `/extensions`
	- `/install`
	- `/symphony`
	- `/workspace` (leave out if you don’t require the example workspace)
	- `/vendor`

## [Server Requirements](https://github.com/g-silveri/humanbit-templates#server-requirements)

- PHP 5.6 or 7.0-7.3
- PHP’s LibXML module, with the XSLT extension enabled (`--with-xsl`)
- MySQL 5.7 or above is recommended
- A webserver (known to be used with Apache, Litespeed, Nginx and Hiawatha)
- Apache’s `mod_rewrite` module or equivalent
- PHP’s built in `json` functions, which are enabled by default in PHP 5.2 and above; if they are missing, ensure PHP wasn’t compiled with `--disable-json`
- PHP’s `zlib` module
- PHP’s `pdo_mysql` module

## [Status](https://github.com/g-silveri/humanbit-templates#status)

**_Permanently in progress and constant revision._**

Beta version is now online.

## [Features](https://github.com/g-silveri/humanbit-templates#features)

- Out-of-the-box responsive starting templates.
- Powerful SCSS mixins for agile and comprehensive components customization.
- Detail-focused scripts.

## [Screenshots](https://github.com/g-silveri/humanbit-templates#screenshots)

<details>
  <summary>Templates</summary>
  <br />

  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/navbar_basic.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/navbar_modules)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/navbar_basic_cart.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/navbar_modules)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/navbar_sections_cart.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/navbar_modules)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/navbar_sections_cart.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/navbar_modules)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/card_horiz_module.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/modules/card_horiz_module.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/card_vert_module.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/modules/card_vert_module.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/text_img_row_module.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/modules/text_img_row_module.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/slide_card_imgs_module.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/modules/slide_card_imgs_module.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/slide_selection_img1_module.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/modules/slide_selection_img1_module.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/slide_selection_img2_module.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/modules/slide_selection_img2_module.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/slide_selection_noimg_module.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/modules/slide_selection_noimg_module.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/credits_modal.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/modal_credits_module.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/modal_example.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/modules/registration.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/form_example.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/registration.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/form_input_active.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/registration.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/form_select_active.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/registration.xsl)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/footer_left_right.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/footer_modules)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/footer_simple.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/footer_modules)
  [![Example screenshot](https://humanbit.com/github/humanbit-templates/images/screenshots/footer_single.png)](https://github.com/g-silveri/humanbit-templates/tree/master/utilities/footer_modules)
</details>

## [Documentation](https://github.com/g-silveri/humanbit-templates#documentation)

For more detailed instructions, head over to our [wiki](https://github.com/g-silveri/humanbit-templates/wiki) section, [Symphony](https://symphonycms.github.io/docs.getsymphony.com/)'s and [Bootstrap](https://getbootstrap.com/docs/)'s docs.

## [Acknowledgements](https://github.com/g-silveri/humanbit-templates#acknowledgements)

- The initial draft was made by [me](https://github.com/g-silveri) and it was inspired in [Andrea Ponzano](https://github.com/a-ponzano)'s Bootstrap's extended spacing features concept that later on grew into a [full-stack template structure](https://github.com/g-silveri/humanbit-templates) with the help of the other members of [Humanbit](https://humanbit.com/)'s team ([Christian Solia](https://github.com/csolia) and [Andrea Borreca](https://github.com/iosonopino)).
- This project is based on [Symphony CMS](https://github.com/symphonycms/symphonycms) and contains a minified compiled version of the [Bootstrap](https://github.com/twbs/bootstrap)'s fork [bEssEx](https://github.com/g-silveri/bEssEx).
- A special mention must be made of [Humanbit](https://humanbit.com/) for having entrusted me with the opportunity to develop my knowledge through the creation process which made this tool possible.

## [Licence](https://github.com/g-silveri/humanbit-templates#licence)

This is an open source project made available under the [MIT Licence](https://github.com/g-silveri/humanbit-templates/blob/master/LICENCE).
