// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require scrollreveal/scrollreveal.min
//= require magnific-popup/jquery.magnific-popup.min
//= require creative.min
//= require_tree .

$(document).ready(function() {
	$(".btn-pref .btn").click(function () {
	    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
	    // $(".tab").addClass("active"); // instead of this do the below 
	    $(this).removeClass("btn-default").addClass("btn-primary");   
	});

	(function($) {
	    "use strict"; // Start of use strict

	    // jQuery for page scrolling feature - requires jQuery Easing plugin
	    $('a.page-scroll').bind('click', function(event) {
	        var $anchor = $(this);
	        $('html, body').stop().animate({
	            scrollTop: ($($anchor.attr('href')).offset().top - 50)
	        }, 1250, 'easeInOutExpo');
	        event.preventDefault();
	    });

	    // Highlight the top nav as scrolling occurs
	    $('body').scrollspy({
	        target: '.navbar-fixed-top',
	        offset: 51
	    });

	    // Closes the Responsive Menu on Menu Item Click
	    $('.navbar-collapse ul li a').click(function() {
	        $('.navbar-toggle:visible').click();
	    });

	    // Offset for Main Navigation
	    $('#mainNav').affix({
	        offset: {
	            top: 100
	        }
	    })

	    // Initialize and Configure Scroll Reveal Animation
	    window.sr = ScrollReveal();
	    sr.reveal('.sr-icons', {
	        duration: 600,
	        scale: 0.3,
	        distance: '0px'
	    }, 200);
	    sr.reveal('.sr-button', {
	        duration: 1000,
	        delay: 200
	    });
	    sr.reveal('.sr-contact', {
	        duration: 600,
	        scale: 0.3,
	        distance: '0px'
	    }, 300);

	    // Initialize and Configure Magnific Popup Lightbox Plugin
	    $('.popup-gallery').magnificPopup({
	        delegate: 'a',
	        type: 'image',
	        tLoading: 'Loading image #%curr%...',
	        mainClass: 'mfp-img-mobile',
	        gallery: {
	            enabled: true,
	            navigateByImgClick: true,
	            preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
	        },
	        image: {
	            tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
	        }
	    });

	})(jQuery); // End of use strict
});

