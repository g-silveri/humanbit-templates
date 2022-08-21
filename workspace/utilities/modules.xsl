<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- Import dei moduli -->

	<xsl:import href="modules/slide_hero_home_module.xsl"/>
	<xsl:import href="modules/hero_large_module.xsl"/>
	<xsl:import href="modules/card_horiz_module.xsl"/>
	<xsl:import href="modules/calendar_module.xsl"/>
	<xsl:import href="modules/card_vert_module.xsl"/>
	<xsl:import href="modules/text_img_row_module.xsl"/>
	<xsl:import href="modules/slide_selection_module.xsl"/>
	<xsl:import href="modules/slide_imgs_inside_card_module.xsl"/>
	<xsl:import href="modules/modal_credits_module.xsl"/>
	<xsl:import href="modules/hero_html5_module.xsl"/>

    <!-- ####################################################################################################################################### -->

    <!-- Formattazione della data corretta -->

    <xsl:template name="format-date">
        <xsl:param name="date"/>
        <xsl:value-of select="substring-after(substring-after($date,'-'),'-')"/>-<xsl:value-of select="substring-before(substring-after($date,'-'),'-')"/>-<xsl:value-of select="substring-before($date,'-')"/>
    </xsl:template>

    <!-- Calcolo del timestamp da una certa data -->

    <xsl:template name="timestamp">
        <xsl:param name="date"/>
        <xsl:variable name="year" select="substring($date, 1, 4)"/>
        <xsl:variable name="month" select="substring($date, 6, 2)"/>
        <xsl:variable name="day" select="substring($date, 9, 2)"/>
        <xsl:variable name="a" select="floor((14 - $month) div 12)"/>
        <xsl:variable name="y" select="$year + 4800 - $a"/>
        <xsl:variable name="m" select="$month + 12*$a - 3"/>
        <xsl:variable name="d" select="$day + floor((153*$m + 2) div 5) + 365*$y + floor($y div 4) - floor($y div 100) + floor($y div 400) - 2472633"/>
        <xsl:value-of select="86400*$d" />
    </xsl:template>

    <!-- Mesi dinamici dal mese corrente ai 12 mesi successivi -->

    <xsl:template name="calendar_month">
        <xsl:param name="index"/>
        <xsl:param name="month"/>
        <xsl:param name="year"/>
        <xsl:call-template name="monthLabel">
            <xsl:with-param name="month" select="$month"/>
            <xsl:with-param name="year" select="$year"/>
        </xsl:call-template>
        <xsl:if test="$index &lt; 12">
            <xsl:call-template name="calendar_month">
                <xsl:with-param name="index" select="$index + 1"/>
                <xsl:with-param name="year">
                    <xsl:choose>
                        <xsl:when test="$month = 12">
                            <xsl:value-of select="$year + 1"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$year"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:with-param>
                <xsl:with-param name="month">
                    <xsl:choose>
                        <xsl:when test="$month = 12">
                            <xsl:value-of select="01"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$month + 1"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="monthLabel">
        <xsl:param name="month"/>
        <xsl:param name="year"/>
        <xsl:choose>
            <xsl:when test="($month = '1') or ($month = '01')">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='january']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="($month = '2') or ($month = '02')">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='february']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="($month = '3') or ($month = '03')">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='march']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="($month = '4') or ($month = '04')">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='april']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="($month = '5') or ($month = '05')">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='may']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="($month = '6') or ($month = '06')">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='june']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="($month = '7') or ($month = '07')">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='july']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="($month = '8') or ($month = '08')">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='august']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="($month = '9') or ($month = '09')">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='september']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="$month = '10'">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='october']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:when test="$month = '11'">
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='november']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <a class="searchMonth calendar_Item list-group-item list-group-item-action d-flex mb-4" style="cursor:pointer;">
                    <span class="calendar_Month">
                        <xsl:value-of select="/data/translate/entry[code='december']/*[local-name() = $lanextended]" />
                    </span>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Giorno partendo da una data -->

    <xsl:template name="day">
		<xsl:param name="date"/>
		<xsl:value-of select="substring($date, 9, 2)"/>
	</xsl:template>

    <!-- Mese partendo da una data -->

    <xsl:template name="month">
		<xsl:param name="date"/>
		<xsl:value-of select="substring($date, 6, 2)"/>
	</xsl:template>

    <!-- Etichetta con il nome mese del partendo da una data -->

	<xsl:template name="month_label">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month = '01'">
				<xsl:value-of select="/data/translate/entry[code='january']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '02'">
				<xsl:value-of select="/data/translate/entry[code='february']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '03'">
				<xsl:value-of select="/data/translate/entry[code='march']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '04'">
				<xsl:value-of select="/data/translate/entry[code='april']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '05'">
				<xsl:value-of select="/data/translate/entry[code='may']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '06'">
				<xsl:value-of select="/data/translate/entry[code='june']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '07'">
				<xsl:value-of select="/data/translate/entry[code='july']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '08'">
				<xsl:value-of select="/data/translate/entry[code='august']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '09'">
				<xsl:value-of select="/data/translate/entry[code='september']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '10'">
				<xsl:value-of select="/data/translate/entry[code='october']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:when test="$month = '11'">
				<xsl:value-of select="/data/translate/entry[code='november']/*[local-name() = $lanextended]" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="/data/translate/entry[code='december']/*[local-name() = $lanextended]" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

    <!-- Anno partendo da una data -->

	<xsl:template name="year">
		<xsl:param name="date"/>
		<xsl:value-of select="substring($date, 1, 4)"/>
	</xsl:template>

    <!-- Notifiche push -->

    <xsl:template name="push_notifications">
        <div class="notifications">
            <form id="notification_form{@id}" method="POST" action="{$current-url}/" enctype="multipart/form-data">
                <input name="xsrf" type="hidden" value="{$cookie-xsrf-token}" />
                <input name="id" type="hidden" value="{@id}" />
                <p><xsl:value-of select="title"/></p>
                <input name="fields[title]" type="hidden" value="{title}"/>
                <p><xsl:value-of select="body"/></p>
                <input name="fields[body]" type="hidden" value="{body}"/>
                <xsl:if test="icon != '' ">
                    <input name="fields[icon]" type="hidden" value="{icon/filename}"/>
                </xsl:if>
                <input name="fields[sent]" type="hidden" value="yes"/>
                <input name="action[push-notifications]" type="hidden" value="submit"/>
                <button data-ref="#notification_form{@id}" class="btn_push_notification buttonPreview">Pubblica</button>
            </form>
        </div>
	</xsl:template>

</xsl:stylesheet>
