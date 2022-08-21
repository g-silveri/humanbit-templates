// copy script in the default template to call the right function according to the desired slick slide template. ex: call sliderForHome funcition for the home page:

// <xsl:if test="($current-page = 'home')">
// 	<script>
// 		sliderForHome();
// 	</script>
// </xsl:if>

// slide hero home

var itemLength = $('.slide_hero_home').attr('data-count') - 1;

console.log(itemLength);

$('.slide_hero_home').slick(
	{
		dots: false,
		infinite: false,
		speed: 1200,
		slidesToShow: 1,
		fade: true,
		autoplay: true,
		arrows: true
		// prevArrow: $('.prev'),
		// nextArrow: $('.next')
		// loop: false
	}
);

// take off "prev" and "next" text from pre next buttons
$(".slick-next, .slick-prev").text("");










// pause slick slider on last img (itemLength)


$('.slide_hero_home').on('afterChange', function(event, slick, currentSlide, nextSlide){
	if (itemLength === currentSlide) {
    	$('.slide_hero_home').slick('slickPause');
	}
});


// Slide Hero
function sliderForLarge() {
	$('.slider-for-large').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: true,
		dots: true,
		// fade: true,
		rtl: true,
		cssEase: 'ease-in-out',
		accessibility: true
	});
}

// Slide Contact
function sliderFor() {
	$('.slider-for').each(function (key, item) {
		let sliderIdName = 'slider' + key;
		let sliderNavIdName = 'sliderNav' + key;
		let slickPrevIdName = 'slickPrev' + key;
		let slickNextIdName = 'slickNext' + key;

		this.id = sliderIdName;
		$('.slider-nav')[key].id = sliderNavIdName;
		$('.slick-prev')[key].id = slickPrevIdName;
		$('.slick-next')[key].id = slickNextIdName;

		let sliderId = '#' + sliderIdName;
		let sliderNavId = '#' + sliderNavIdName;
		let slickPrevId = '#' + slickPrevIdName;
		let slickNextId = '#' + slickNextIdName;

		$(sliderId).slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: true,
			dots: false,
			// fade: true,
			rtl: true,
			cssEase: 'ease-in-out',
			asNavFor: sliderNavId,
			prevArrow: slickPrevId,
			nextArrow: slickNextId,
			accessibility: true
		});

		// script to make slidesToShow dynamic
		let sliderNav = $('.slider-nav');
		let maxItems = Math.round(sliderNav.parent('div').width() / 201);
		if (sliderNav.children('div').length < maxItems) {
			maxItems = sliderNav.children('div').length - 1;
		}
		//////////////////////////////////////

		// $('.slider-nav').slick({
		$(sliderNavId).slick({
			slidesToShow: maxItems,
			slidesToScroll: 1,
			asNavFor: sliderId,
			arrows: false,
			dots: false,
			centerMode: true,
			centerPadding: '0px',
			focusOnSelect: true,
			cssEase: 'ease-in-out',
			variableWidth: true,
			respondTo: 'min',
			// adaptiveHeight: true,

			// infinite: true,
			// autoplay: false,
			// autoplaySpeed: 6000,
			responsive: [
				{
					breakpoint: 1024,
					settings: {
						slidesToShow: maxItems,
						slidesToScroll: 3
					}
				},

				{
					breakpoint: 600,
					settings: {
						slidesToShow: maxItems,
						slidesToScroll: 2
					}
				}
			]
		});
	});
}

// Soggiorni Slide
function sliderForSogg() {
	$('.slider-for-sogg').each(function (key, item) {
		let sliderIdName = 'slider' + key;
		let slickPrevIdName = 'slickPrev' + key;
		let slickNextIdName = 'slickNext' + key;

		this.id = sliderIdName;
		$('.slick-prev-sogg')[key].id = slickPrevIdName;
		$('.slick-next-sogg')[key].id = slickNextIdName;

		let sliderId = '#' + sliderIdName;
		let slickPrevId = '#' + slickPrevIdName;
		let slickNextId = '#' + slickNextIdName;

		let numslide=3;
	if( ($(window).width() <= 768) && ($(window).width() >= 576) ){
		numslide=2;
	}
	if($(window).width() < 576){
		numslide=1;
	}

		$(sliderId).slick({
			slidesToShow: 3,
			slidesToScroll: 1,
			arrows: true,
			dots: false,
			// centerMode: true,
			// centerPadding: '20px',
			cssEase: 'ease-in-out',
			prevArrow: slickPrevId,
			nextArrow: slickNextId,
			accessibility: true,

			responsive: [
				{
					breakpoint: 767,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1,
					}
				}
			]
		});
	});
}

// Slide Selection
function sliderForHome() {
	let numslide=3;
	if( ($(window).width() > 768) && ($(window).width() <= 991.98) ){
		numslide=2;
	}
	if($(window).width() <= 768){
		numslide=1;
	}
	$('.slider-for-home').each(function () {
		$(this).find('.slider').slick({
			slidesToShow: numslide,
			slidesToScroll: 1,
			arrows: true,
			dots: false,
			// fade: true,
			cssEase: 'ease-in-out',
			// asNavFor: sliderNavId,
			prevArrow: $(this).find('.slickdsi-prev'),
			nextArrow: $(this).find('.slickdsi-next'),
			accessibility: true
		});
	});
}

// Slide Dimore
function sliderForDimo(page) {
	var div = $('#cards_container_' + page).find('.slider-for-dimore');
	$(div).each(function () {
		slider = $(this).find('.slider');
		$(slider).slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: true,
			dots: false,
			// fade: true,
			cssEase: 'ease-in-out',
			// asNavFor: sliderNavId,
			prevArrow: $(this).find('.slick-prev-dimore'),
			nextArrow: $(this).find('.slick-next-dimore'),
			accessibility: true
		});
	});
}

// function sliderForDimoOld() {
// 	$('.slider-for-dimore').each(function (key, item) {
// 		let sliderIdName = 'slider' + key;
// 		// let sliderNavIdName = 'sliderNav' + key;
// 		let slickPrevIdName = 'slickPrev' + key;
// 		let slickNextIdName = 'slickNext' + key;

// 		this.id = sliderIdName;
// 		// $('.slider-nav')[key].id = sliderNavIdName;
// 		$('.slick-prev-dimore')[key].id = slickPrevIdName;
// 		$('.slick-next-dimore')[key].id = slickNextIdName;

// 		let sliderId = '#' + sliderIdName;
// 		// let sliderNavId = '#' + sliderNavIdName;
// 		let slickPrevId = '#' + slickPrevIdName;
// 		let slickNextId = '#' + slickNextIdName;

// 		$(sliderId).slick({
// 			slidesToShow: 1,
// 			slidesToScroll: 1,
// 			arrows: true,
// 			dots: false,
// 			// fade: true,
// 			cssEase: 'ease-in-out',
// 			// asNavFor: sliderNavId,
// 			prevArrow: slickPrevId,
// 			nextArrow: slickNextId,
// 			accessibility: true
// 		});
// 	});
// }


// lazy load
$(function () {
    $('.lazy').lazy();
});
