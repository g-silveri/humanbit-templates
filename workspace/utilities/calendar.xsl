<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exslt="http://exslt.org/common"
    xmlns:date="http://exslt.org/dates-and-times"
    exclude-result-prefixes="exslt date"
>

    <!--
        XSL Calender for Symphony, powered by some EXSLT functions
        Based on code from Neil Ang: http://neilang.com/entries/generating-a-calendar-using-xslt/

        Just call the template to show the calendar in the current month.

        Parameters:
            month               - the month to show
            year                - the year to show
            displayCaption      - display the caption (month name and (optional) navigation)
            displayNavigation   - display the navigation. Works only if displayCaption is true() (default)
            displayDays         - display the names of the days.

        To make it work in a real-life environment, override the 'calender-day'-template to fit your needs.
        For example:

        <xsl:template name="calendar-day">
            <xsl:param name="day" />
            <xsl:param name="month" />
            <xsl:param name="year" />
            <xsl:param name="date" />
            <xsl:choose>
                <xsl:when test="$month = 12 and $day = 25">
                    <a href="/christmas/">25</a>
                </xsl:when>
                <xsl:when test="/data/agenda/entry/date[. = $date]">
                    <xsl:variable name="entry" select="/data/agenda/entry[date = $date]" />
                    <a href="/agenda/{$entry/title/@handle}/" title="{$entry/title}">
                        <xsl:value-of select="$day"/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$day"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>


    -->

    <!-- Month names: -->
    <xsl:template name="GetMonthName">
        <xsl:param name="month" />
        <xsl:choose>
            <xsl:when test="$month = 1"><xsl:value-of select="/data/translate/entry[code='january']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 2"><xsl:value-of select="/data/translate/entry[code='february']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 3"><xsl:value-of select="/data/translate/entry[code='march']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 4"><xsl:value-of select="/data/translate/entry[code='april']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 5"><xsl:value-of select="/data/translate/entry[code='may']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 6"><xsl:value-of select="/data/translate/entry[code='june']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 7"><xsl:value-of select="/data/translate/entry[code='july']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 8"><xsl:value-of select="/data/translate/entry[code='august']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 9"><xsl:value-of select="/data/translate/entry[code='september']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 10"><xsl:value-of select="/data/translate/entry[code='october']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 11"><xsl:value-of select="/data/translate/entry[code='november']/*[local-name() = $lanextended]"/></xsl:when>
            <xsl:when test="$month = 12"><xsl:value-of select="/data/translate/entry[code='december']/*[local-name() = $lanextended]"/></xsl:when>
        </xsl:choose>
    </xsl:template>



    <!-- You can override this template to fit your needs: -->
    <xsl:template name="calendar-day">
        <xsl:param name="day" />
        <xsl:param name="month" />
        <xsl:param name="year" />
        <xsl:param name="date" />
		<xsl:choose>
			<xsl:when test="/data/benefit-events/entry[substring-before(substring-after(date/@handle,'-'),'-') = $month][substring-before(date/@handle,'-') = $day]/quantity &gt; 0">
				<a class="disponibility" data-qta="{/data/benefit-events/entry[substring-before(substring-after(date/@handle,'-'),'-') = $month][substring-before(date/@handle,'-') = $day]/quantity}" href="#"><xsl:value-of select="$day"/></a>
			</xsl:when>
			<xsl:when test="/data/benefit-events/entry[substring-before(substring-after(date/@handle,'-'),'-') = $month][substring-before(date/@handle,'-') = $day]/quantity = 0">
				<a class="notdisponibility" href="#"><xsl:value-of select="$day"/></a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$day"/>
				<hr class="m-0" />
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>


    <xsl:template name="DaysInMonth">
        <xsl:param name="month" />
        <xsl:param name="year" />
        <xsl:choose>
            <xsl:when test="$month = 1 or $month = 3 or $month = 5 or $month = 7 or $month = 8 or $month = 10 or $month = 12">31</xsl:when>
            <xsl:when test="$month=2">
                <xsl:choose>
                    <xsl:when test="$year mod 4 = 0">29</xsl:when>
                    <xsl:otherwise>28</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>30</xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="calendar">
		<xsl:param name="month"/>
		<xsl:param name="year"/>

        <!-- Set the number of days in a month: -->
        <xsl:variable name="NumberOfDaysInMonth">
            <xsl:call-template name="DaysInMonth">
                <xsl:with-param name="month" select="$month"/>
                <xsl:with-param name="year" select="$year"/>
            </xsl:call-template>
        </xsl:variable>

        <!-- Set the first day in the week: -->
        <xsl:variable name="FirstDayInWeekForMonth">
            <xsl:choose>
                <xsl:when test="$month &lt; 10">
                    <xsl:value-of select="date:day-in-week(date:date(concat($year,'-0', $month, '-01')))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="date:day-in-week(date:date(concat($year,'-', $month, '-01')))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- Set the number of weeks in this month: -->
        <xsl:variable name="WeeksInMonth">
            <xsl:value-of select="($NumberOfDaysInMonth + $FirstDayInWeekForMonth - 1) div 7"/>
        </xsl:variable>

		<xsl:call-template name="CalendarWeek">
			<xsl:with-param name="WeeksInMonth" select="$WeeksInMonth"/>
			<xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
			<xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
			<xsl:with-param name="year" select="$year" />
			<xsl:with-param name="month" select="$month" />
		</xsl:call-template>

    </xsl:template>

    <xsl:template name="CalendarWeek">

        <xsl:param name="WeeksInMonth"/>
        <xsl:param name="FirstDayInWeekForMonth"/>
        <xsl:param name="NumberOfDaysInMonth" />
        <xsl:param name="year" />
        <xsl:param name="month" />

        <xsl:param name="week">1</xsl:param>
        <xsl:param name="day">1</xsl:param>
		<xsl:call-template name="CalendarDay">
			<xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
			<xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
			<xsl:with-param name="day" select="$day"/>
			<xsl:with-param name="year" select="$year" />
			<xsl:with-param name="month" select="$month" />
		</xsl:call-template>
        <xsl:if test="$WeeksInMonth &gt; $week">
            <xsl:call-template name="CalendarWeek">
                <xsl:with-param name="WeeksInMonth" select="$WeeksInMonth"/>
                <xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
                <xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
                <xsl:with-param name="year" select="$year" />
                <xsl:with-param name="month" select="$month" />
                <xsl:with-param name="week" select="$week + 1"/>
                <xsl:with-param name="day" select="$week * 7 - ($FirstDayInWeekForMonth - 2)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="CalendarDay">
        <xsl:param name="FirstDayInWeekForMonth" />
        <xsl:param name="NumberOfDaysInMonth" />
        <xsl:param name="count">1</xsl:param>
        <xsl:param name="day"/>
        <xsl:param name="year" />
        <xsl:param name="month" />
        <xsl:choose>
            <xsl:when test="($day = 1 and $count != $FirstDayInWeekForMonth) or $day &gt; $NumberOfDaysInMonth">
                <xsl:if test="$count &lt; 7">
                    <xsl:call-template name="CalendarDay">
                        <xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
                        <xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
                        <xsl:with-param name="year" select="$year" />
                        <xsl:with-param name="month" select="$month" />
                        <xsl:with-param name="count" select="$count + 1"/>
                        <xsl:with-param name="day" select="$day"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
				 <xsl:variable name="date-day">
					<xsl:choose>
						<xsl:when test="$day &lt; 10">
							<xsl:value-of select="concat('0', $day)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$day" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="date-month">
					<xsl:choose>
						<xsl:when test="$month &lt; 10">
							<xsl:value-of select="concat('0', $month)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$month" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="date" select="concat($year, '-', $date-month, '-', $date-day)" />
				<xsl:variable name="dateunix">
					<xsl:call-template name="date-to-UnixTime">
						<xsl:with-param name="date" select="$date" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="datenum" select="concat($year, $date-month, $date-day)" />
				<xsl:variable name="day_formatted">
					<xsl:choose>
						<xsl:when test="$day &lt; 10">
							<xsl:text>0</xsl:text><xsl:value-of select="$day"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$day"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
                <button type="button" class="btn_date_day btn_date gotham small color_white bg_color_first btn_bg_first p-0" data-button="#btn_step_1" data-month-name="#month_button" data-month-label=".btn_calendar_month" data-ref-day="#input_day" data-ref-month="#input_month" data-val-month="{$month}" data-ref-year="#input_year" data-val-year="{$year}" data-ref-date="#input_date" style="grid-column: {$count - 1}" data-url="{$root}/action/?action=calendar_booking" data-elem="#hour_div">
					<!-- <xsl:if test="count(/data/calendar-book-day/day[@handle = $day_formatted]/entry) = 40">
						<xsl:attribute name="style">pointer-events: none; opacity: 0.5;grid-column: <xsl:value-of select="$count - 1"/>;</xsl:attribute>
					</xsl:if> -->
					<xsl:if test="(($day &lt; $this-day) and ($month = $this-month) and ($year = $this-year)) or (($month &lt; $this-month) and ($year = $this-year)) or (($year &lt; $this-year))">
						<xsl:attribute name="style">opacity: 0.5;grid-column: <xsl:value-of select="$count - 1"/>;</xsl:attribute>
					</xsl:if>
					<time><xsl:value-of select="$day_formatted"/></time>
				</button>
                <xsl:if test="$count &lt; 7">
                    <xsl:call-template name="CalendarDay">
                        <xsl:with-param name="FirstDayInWeekForMonth" select="$FirstDayInWeekForMonth"/>
                        <xsl:with-param name="NumberOfDaysInMonth" select="$NumberOfDaysInMonth" />
                        <xsl:with-param name="year" select="$year" />
                        <xsl:with-param name="month" select="$month" />
                        <xsl:with-param name="count" select="$count + 1"/>
                        <xsl:with-param name="day" select="$day + 1"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

	<xsl:template name="nav_events">
		<div class="header_section_events_cal container_events_2 w-100 text-center headersection header_section_events_home  row align-items-top justify-content-between m-0 py-4 mt_6">
			<a href="{$root}/events-calendar/{$lanurl}" class="goto_arch col-3 p-0 text-left"><xsl:if test="$current-page = 'events-calendar'"><xsl:attribute name="class">goto_arch col-3 p-0 text-left event_cal_page_current</xsl:attribute></xsl:if><h3 class="title_header_section text-uppercase"><xsl:value-of select="/data/translate/entry[code='calendar']/*[local-name()=$lan]"/></h3></a>
			<a href="{$root}/events-search/{$lanurl}" class="goto_cal col-3 p-0"><xsl:if test="$current-page = 'events-search'"><xsl:attribute name="class">goto_cal col-3 p-0 event_cal_page_current</xsl:attribute></xsl:if><h3 class="title_header_section text-uppercase"><xsl:value-of select="/data/translate/entry[code='search']/*[local-name()=$lan]"/></h3></a>
			<a href="{$root}/events-archive/?start=2021-01-01&amp;lan={$lan}" class="goto_arch  text-right  col-3 p-0"><xsl:if test="$current-page = 'events-archive'"><xsl:attribute name="class">goto_arch  text-right  col-3 p-0 event_cal_page_current</xsl:attribute></xsl:if><h3 class="title_header_section text-uppercase"><xsl:value-of select="/data/translate/entry[code='archive']/*[local-name()=$lan]"/></h3></a>
		</div>
	</xsl:template>

	<xsl:template name="date-to-UnixTime">
		<xsl:param name="date"/>

		<xsl:variable name="year" select="substring($date, 1, 4)"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		<xsl:variable name="day" select="substring($date, 9, 2)"/>

		<xsl:variable name="a" select="floor((14 - $month) div 12)"/>
		<xsl:variable name="y" select="$year + 4800 - $a"/>
		<xsl:variable name="m" select="$month + 12*$a - 3"/>

		<xsl:variable name="d" select="$day + floor((153*$m + 2) div 5) + 365*$y + floor($y div 4) - floor($y div 100) + floor($y div 400) - 2472632"/>
		<xsl:value-of select="(86400*$d) - 30000" />
	</xsl:template>

	<xsl:template name="event-list">

		<xsl:variable name="date-month">
			<xsl:choose>
				<xsl:when test="$url-m &lt; 10">
					<xsl:value-of select="concat('0', $url-m)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$url-m" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="datestart" select="concat($url-y, '-', $date-month, '-01')" />
		<xsl:variable name="dateunixstart">
			<xsl:call-template name="date-to-UnixTime">
				<xsl:with-param name="date" select="$datestart" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="NumberOfDaysInMonth">
            <xsl:call-template name="DaysInMonth">
                <xsl:with-param name="month" select="$date-month"/>
                <xsl:with-param name="year" select="$url-y"/>
            </xsl:call-template>
        </xsl:variable>
		<xsl:variable name="dateend" select="concat($url-y, '-', $date-month, '-', $NumberOfDaysInMonth)" />
		<xsl:variable name="dateunixend">
			<xsl:call-template name="date-to-UnixTime">
				<xsl:with-param name="date" select="$dateend" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="monthfirst">
			<xsl:choose>
				<xsl:when test="$url-m = ''">
					<xsl:value-of select="$this-month" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$url-m" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="year-first">
			<xsl:choose>
				<xsl:when test="$url-y = ''">
					<xsl:value-of select="$this-year" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$url-y" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="monthnow">
			<xsl:choose>
				<xsl:when test="substring($monthfirst,2,1) = ''">
					<xsl:value-of select="concat($year-first,'-0', $monthfirst)" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($year-first,'-', $monthfirst)" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="monthex" select="concat($monthnow,'-')"/>
		<div class="accordion accordion_event_calendar col-12 col-lg-4 p-0 mb_6 mb-lg-0 pl_lg_6 pl_xl_8 pb_lg_9" id="accordionEventtype">
			<!-- <xsl:if test="(count(/data/events-list-bytopic/entry[(contains(start/date/start,$monthex)) or (contains(end/date/start,$monthex))]) &gt;0) or (count(/data/events-list-bytopic-category/entry[(contains(start-date/date/start,$monthex)) or (contains(end-date/date/start,$monthex))]) &gt;0)">
				<h3 class="headerlist-h3"><xsl:value-of select="/data/translate/entry[code='browseev']/*[local-name()=$lan]"/></h3>
			</xsl:if> -->


			<xsl:for-each select="/data/events-type/entry">
				<xsl:variable name="idtype" select="@id"/>

				<xsl:choose>
					<xsl:when test="(count(/data/events-list-bytopic/entry[event-type/item/@id = $idtype][((start/date/start/@timestamp &lt;= $dateunixend) and (end/date/start/@timestamp &gt;= $dateunixstart))]) &gt;0)">
						<div class="headerlist collapsed px-3" data-toggle="collapse" data-target="#typelist{position()}">
							<h4><i class="fas fa-circle mr-3" style="color:{color}"></i><xsl:value-of select="name-italian"/><xsl:text> </xsl:text>(<xsl:value-of select="count(/data/events-list-bytopic/entry[event-type/item/@id = $idtype][((start/date/start/@timestamp &lt;= $dateunixend) and (end/date/start/@timestamp &gt;= $dateunixstart))])"/>)<i class="ml-3 arrow up arrowup float-right fal fa-chevron-up"></i><i class="ml-3 fal fa-chevron-down float-right arrow down arrowdown"></i></h4>
						</div>
						<div id="typelist{position()}" class="w-100 collapse headerlist-detail">
							<xsl:for-each select="/data/events-list-bytopic/entry[event-type/item/@id = $idtype][((start/date/start/@timestamp &lt;= $dateunixend) and (end/date/start/@timestamp &gt;= $dateunixstart))]">
								<xsl:variable name="eventid" select="@id"/>
								<xsl:variable name="link">
									<xsl:choose>
										<xsl:when test="count(/data/events-list-bytopic-istitutional/entry[event/item/@id = $eventid]) &gt; 0"><xsl:value-of select="$root"/>/event-forum/<xsl:value-of select="/data/events-list-bytopic-istitutional/entry[event/item/@id = $eventid]/@id"/>/<xsl:value-of select="/data/events-list-bytopic-istitutional/entry[event/item/@id = $eventid]/title-italian/@handle"/>/</xsl:when>
										<xsl:otherwise><xsl:value-of select="$root"/>/dna-event/<xsl:value-of select="@id"/>/<xsl:value-of select="title-italian/@handle"/>/</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

								<p class="date_type lora mt-3 mb-1"><xsl:call-template name="italian-date"><xsl:with-param name="date" select="start"/></xsl:call-template><xsl:if test="start != end"> -
								<!-- <i class="mx-2 fal fa-long-arrow-right"></i> -->
								<xsl:call-template name="italian-date"><xsl:with-param name="date" select="end"/></xsl:call-template></xsl:if>
								<!-- <span class="float-right"><xsl:choose><xsl:when test="vie-selection = 'Yes'"><i class="fas fa-sparkles mr-2"></i>5vie selection</xsl:when><xsl:otherwise><i class="mr-2 fal fa-circle"></i>5vie event</xsl:otherwise></xsl:choose></span> -->
								<span class="float-right">
									<!-- <xsl:value-of select="topics/item"/> -->
									<xsl:if test="event-sub-type/item != ''"> <xsl:value-of select="event-sub-type/item"/></xsl:if></span></p>
								<h4 class="mt-0 mb-3"><a href="{$link}{$urllan2}"><xsl:value-of select="title-italian"/></a></h4>

								<xsl:if test="position() != last()"><hr class="m-0"/></xsl:if>
							</xsl:for-each>
						</div>
					</xsl:when>

					<xsl:otherwise>
						<xsl:if test="$idtype != 32458">
							<div class="headerlist collapsed px-3" data-target="#typelist{position()}">
								<h4><i class="fas fa-circle mr-3" style="color:{color}"></i><xsl:value-of select="name-italian"/><xsl:text> </xsl:text>(0)</h4>
							</div>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:if test="count(/data/events-list-bytopic-category/entry[((start/date/start/@timestamp &lt;= $dateunixend) and (end/date/start/@timestamp &gt;= $dateunixstart))]) &gt;0">
				<div class="headerlist collapsed px-3" data-toggle="collapse" data-target="#typelistcat">
					<h4><i class="fas fa-circle mr-3" style="color:#E6764E"></i><xsl:value-of select="/data/translate/entry[code='wideev']/*[local-name()=$lan]"/><xsl:text> </xsl:text>(<xsl:value-of select="count(/data/events-list-bytopic-category/entry[event-type/item/@id = $idtype][((start/date/start/@timestamp &lt;= $dateunixend) and (end/date/start/@timestamp &gt;= $dateunixstart))])"/>)<i class="ml-3 arrow up arrowup float-right fal fa-chevron-up"></i><i class="ml-3 fal fa-chevron-down float-right arrow down arrowdown"></i></h4>
				</div>
				<div id="typelistcat" class="w-100 collapse headerlist-detail">
					<xsl:for-each select="/data/events-list-bytopic-category/entry[event-type/item/@id = $idtype][((start/date/start/@timestamp &lt;= $dateunixend) and (end/date/start/@timestamp &gt;= $dateunixstart))]">
						<xsl:variable name="eventid" select="@id"/>
						<xsl:variable name="link">
							<xsl:choose>
								<xsl:when test="count(/data/events-list-bytopic-category-istitutional/entry[event-category/item/@id = $eventid]) &gt; 0"><xsl:value-of select="$root"/>/istitutional/<xsl:value-of select="/data/events-list-bytopic-category-istitutional/entry[event-category/item/@id = $eventid]/@id"/>/<xsl:value-of select="/data/events-list-bytopic-category-istitutional/entry[event-category/item/@id = $eventid]/title-italian/@handle"/>/</xsl:when>
								<xsl:otherwise><xsl:value-of select="$root"/>/dna-home/<xsl:value-of select="@id"/>/<xsl:value-of select="name/@handle"/>/</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<xsl:if test="position() != last()"><hr class="m-0"/></xsl:if>
						<p class="date_type_spread lora mt-3 mb-1"><xsl:call-template name="italian-date"><xsl:with-param name="date" select="start-date"/></xsl:call-template> -
						<!-- <i class="mx-2 fal fa-long-arrow-right"></i> -->
						<xsl:call-template name="italian-date"><xsl:with-param name="date" select="end-date"/></xsl:call-template>
						<!-- <span class="float-right"><xsl:choose><xsl:when test="vie-selection = 'Yes'"><i class="fas fa-sparkles mr-2"></i>5vie selection</xsl:when><xsl:otherwise><i class="mr-2 fal fa-circle"></i>5vie event</xsl:otherwise></xsl:choose></span> -->
						</p>
						<h4 class=""><a href="{$link}{$urllan2}"><xsl:value-of select="name"/></a></h4>

					</xsl:for-each>
				</div>
			</xsl:if>
			<xsl:if test="count(/data/events-list-bytopic-category/entry[(contains(start-date/date/start,$monthex)) or (contains(end-date/date/start,$monthex))]) = 0">
				<div class="headerlist collapsed px-3" data-target="#typelist{position()}">
					<h4><i class="fas fa-circle mr-3" style="color:{/data/events-type/entry[@id=32458]/color}"></i><xsl:value-of select="/data/events-type/entry[@id=32458]/name-italian"/><xsl:text> </xsl:text>(0)</h4>
				</div>
			</xsl:if>

		</div>
	</xsl:template>

</xsl:stylesheet>
