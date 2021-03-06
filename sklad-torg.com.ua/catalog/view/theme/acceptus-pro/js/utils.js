/*--------------------------------------------------------------------------/
* @Author		KulerThemes.com http://www.kulerthemes.com
* @Copyright	Copyright (C) 2012 - 2013 KulerThemes.com. All rights reserved.
* @License		KulerThemes.com Proprietary License
/---------------------------------------------------------------------------*/

var _cartTimer;
function addToCart(product_id, quantity) {
    quantity = typeof(quantity) != 'undefined' ? quantity : 1;

    clearTimeout(_cartTimer);

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
                location = json['redirect'];
            }

            if (json['success']) {
                $('#notification')
                    .html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>')
                    .addClass('active');

                $('.success').fadeIn('slow', function () {
                    _cartTimer = setTimeout(function () {
                        $('#notification').removeClass('active');
                    }, 2500);
                });

                $('#cart-total').html(json['total']);
            }
        }
    });
}

var _wishListTimer;
function addToWishList(product_id) {
    clearTimeout(_wishListTimer);

    $.ajax({
        url: 'index.php?route=account/wishlist/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {
                $('#notification')
                    .html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>')
                    .addClass('active');

                $('.success').fadeIn('slow', function () {
                    _wishListTimer = setTimeout(function () {
                        $('#notification').removeClass('active');
                    }, 2500);
                });

                $('#wishlist-total').html(json['total']);
            }
        }
    });
}

var _compareTimer;
function addToCompare(product_id) {
    clearTimeout(_compareTimer);

    $.ajax({
        url: 'index.php?route=product/compare/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {
                $('#notification')
                    .html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>')
                    .addClass('active');

                $('.success').fadeIn('slow', function () {
                    _compareTimer = setTimeout(function () {
                        $('#notification').removeClass('active');
                    }, 2500);
                });

                $('#compare-total').html(json['total']);
            }
        }
    });
}

$(document).ready(function () {

	// Hide Add To Cart
	$('.primary-define .product-grid .details').each(function() {
		$(this).css('margin-top', - $(this).height());
	});

	// Product hover
	$('#container .box .product-grid > div').hover(function () {
		$(this).find('.details').css('margin-top', '0');
		$(this).css('margin-bottom', - $(this).find('.details').height());

	}, function () {
		$(this).css('margin-bottom', '0');
		$(this).find('.details').css('margin-top', - $(this).find('.details').height());
	});

	// Product hover in Mega Menu
	$('.megamenu .product-grid > div').hover(function () {
		$(this).find('.details').css('margin-top', '0');
		$(this).css('margin-bottom', - $(this).find('.details').height());

	}, function () {
		$(this).css('margin-bottom', '0');
		$(this).find('.details').css('margin-top', - $(this).find('.details').height());
	});

	// Setup mobile main menu
	$('#btn-mobile-toggle').toggle(
		function() {
			$(this).removeClass('expand').next().slideUp();
		},
		function() {
			$(this).addClass('expand').next().slideDown();
		}
	);

	$('.btn-expand-menu').toggle(
		function() {
			$(this).next().slideUp().parent().removeClass('expand');
		},
		function() {
			$(this).next().slideDown().parent().addClass('expand');
		}
	);

	var innerWidth = $(window).innerWidth();

	if (innerWidth < 768) {
		$('#btn-mobile-toggle').trigger('click');
		$('.btn-expand-menu').trigger('click');
	}

	// Setup mobile tabs
	$('#btn-tabs-toggle').toggle(
		function() {
			$(this).parent().removeClass('collapse').addClass('expand').find('.ui-state-default').slideDown();
		},
		function() {
			$(this).parent().removeClass('expand').addClass('collapse').find('.ui-state-default:not(.ui-state-active)').slideUp();
		}
	);

	//Smooth scroll to on page element
	$(".review a").click(function(event){
		event.preventDefault();
		//calculate destination place
		var dest=0;
		if($(this.hash).offset().top > $(document).height()-$(window).height()){
			dest=$(document).height()-$(window).height();
		} else {
			dest=$(this.hash).offset().top;
		}
		//go to destination
		$('html,body').animate({scrollTop:dest}, 500,'swing');
     });

	// Smooth drop down for IE
	if ($.browser.msie) {
		
		// Main menu
		$('.primary-define .mainmenu li').hover(
			function() {
				$(this).find('.dropdown').slideDown(200);
			},
			function() {
				$(this).find('.dropdown').slideUp(200);
			}
		);

		// Mini cart
		$('.primary-define #header #cart').hover(
			function() {
				$(this).find('.inner').slideDown(200);
			},
			function() {
				$(this).find('.inner').slideUp(200);
			}
		);
	}

	$('.custom-select').chosen({
		disable_search_threshold: 10
	});
});