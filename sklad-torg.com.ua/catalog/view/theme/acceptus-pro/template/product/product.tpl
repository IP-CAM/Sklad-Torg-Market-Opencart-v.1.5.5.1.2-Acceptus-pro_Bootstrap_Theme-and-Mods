<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
	<div class="box">
		<div class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		</div>
		<div class="product-info">
			<?php $block = $this->config->get('blocks'); ?>
			<?php if ($thumb || $images) { ?>
			<div class="right" style="width: <?php echo $this->config->get('config_image_thumb_width') + 20 ?>px;">
				<style type="text/css">
				/*#image{
					width:400px;
					height: 400px;
					margin-left: -70px;
				}*/
				@media only screen and (max-width: 400px)
				{
					.primary-define .product-info .image img{
						width: 350px;
						margin-left: -25px;
					}

					.primary-define .product-info .thumblist img{
						width:74px;
						height: 74px;
					}

				}
				@media only screen and (min-width: 401px) and (max-width: 900px)
				{
					.primary-define .product-info .image img{
						width: 550px;
						margin-left: -20px;
						margin-top:-40px;
						margin-bottom: -20px;
						padding-top: -90px;
					}
					.primary-define .product-info .thumblist img{
						width:74px;
						height: 74px;
					}
				
				}
				@media only screen and (max-width: 362px)
				{
					.primary-define .box-product .image a img{
						width: 400px;
					}
					.primary-define .product-info .thumblist img{
						width:74px;
						height: 74px;
					}
					.primary-define .product-grid .compare a{
	opacity: 0;
}
				.details{
					margin-bottom: -22px;
					margin-top: 0px;
				}
				}

				
				.primary-define .product-grid .cart{
					display:none;
					
				}
				</style>
				<?php if ($thumb) { ?>
				<?php if ($block && isset($block['zoom_effect']) && $block['zoom_effect']['status']) { ?>
				<?php $zoom_effect = true; ?>
				<?php $original = ($this->config->get('color')) ? $this->getChild('module/kulercp/getProductImage', $product_id) : $popup; ?>
				<div class="image clearafter"> <a href="<?php echo $original; ?>" class="jqzoom colorbox" rel='gal1' title="<?php echo $heading_title; ?>" > <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" width="<?php echo $this->config->get('config_image_thumb_width'); ?>" height="<?php echo $this->config->get('config_image_thumb_height'); ?>" /> </a> </div>
				<?php } else { ?>
				<div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
				<?php } ?>
				<?php } else { ?>
				<div class="image"><span class="no-image"><img src="image/no_image.jpg" alt="<?php echo $heading_title; ?>" id="image" /></span></div>
				<?php } ?>
				<?php if ($block && isset($block['zoom_effect']) && $block['zoom_effect']['status']) { ?>
				<?php $zoom_effect = true; ?>
				<ul class="thumblist clearafter">
					<li> <a class="zoomThumbActive" href="<?php echo $popup; ?>" rel="{gallery: 'gal1', smallimage: '<?php echo $thumb; ?>',largeimage: '<?php echo $original; ?>'}"> <img src="<?php echo $thumb; ?>" width="<?php echo $this->config->get('config_image_additional_width'); ?>" height="<?php echo $this->config->get('config_image_additional_height'); ?>" /> </a> </li>
					<?php $images = ($this->config->get('color')) ? $this->getChild('module/kulercp/getChildProductImages', $product_id) : $images; ?>
					<?php if ($images) { ?>
					<?php foreach ($images as $image) { ?>
					<li> <a href="<?php echo $image['popup']; ?>" class="colorbox" rel="{gallery: 'gal1', smallimage: '<?php echo $image['popup']; ?>',largeimage: '<?php echo $image['original']; ?>'}"> <img src='<?php echo $image['thumb']; ?>' /> </a> </li>
					<?php } ?>
					<?php } ?>
				</ul>
				<?php } else { ?>
				<?php if ($images) { ?>
				<ul class="thumblist clearafter">
					<?php foreach ($images as $image) { ?>
					<li> <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a> </li>
					<?php } ?>
				</ul>
				<?php } ?>
				<?php } ?>
			</div>
			<?php } ?>
			<div class="left" style="margin-right: <?php echo $this->config->get('config_image_thumb_width') + 75 ?>px; ">
				<h1 style="font-style: italic; font-family: David;"><?php echo $heading_title; ?></h1>
				
				<style type="text/css">
					.price_null{
						font-family: Arial;
						font-size: 23px;
						font-style: italic;
						color:#000;
					}
				</style>
				<?php if ($price == 0) { ?>
				<div class="price_null">
					<div><span class="price-fixed"><?php echo "(цену уточняйте у менеджера)"; ?></span></div>
				</div>
				<?php } else { ?>

				<div class="price">
					<?php if (!$special) { ?>
					
					
					<div><span class="price-fixed"><?php echo $price; ?></span></div>
					<?php } else { ?>

					<div class="special-price"><span class="price-fixed"><?php echo $special; ?></span><span class="price-old"><?php echo $price; ?></span></div>
					<?php } ?>
					<?php if ($tax) { ?>
					<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
					<?php } ?>
					<?php if ($points) { ?>
					<span class="reward"><?php echo $text_points; ?> <?php echo $points; ?></span>
					<?php } ?>
					<?php if ($discounts) { ?>
					<p class="discount">
						<?php foreach ($discounts as $discount) { ?>
						<?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
						<?php } ?>
					</p>
					<?php } ?>
				</div>
				<?php } ?>
				<?php if ($review_status) { ?>
				<div class="review"> <img src="catalog/view/theme/acceptus-pro/image/icons/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /><a class="show-review" href="#tabs"><?php echo $reviews; ?></a> <a class="new-review" href="#tabs"><?php echo $text_write; ?></a> </div>
				<?php } ?>
				<div class="description">
					<?php if ($manufacturer) { ?>
					<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
					<?php } ?>
					<span><!--<?php echo $text_model; ?>--> <?php echo "Код товара:"; ?></span> <?php echo $model; ?><br />
					
					<?php if ($location) { ?>
					<span><?php echo $text_location; ?></span> <?php echo $location; ?><br />
					<?php } ?>
					
					<?php if ($reward) { ?>
					<span><?php echo $text_reward; ?></span> <?php echo $reward; ?> <br />
					<?php } ?>
					

					 <span><?php echo $text_stock; ?></span>
        				<?php if (($stock == $this->language->get('text_instock')) || ($stock >= 1) ) { ?>
        				<span style="color: #228B22;"><?php echo $stock; ?></span>
        				<?php }    else { ?>
        				<span style="color: #FF0000;"><?php echo $stock; ?></span>
        			<?php } ?> <br>

					<!--
					<span><?php echo $text_stock; ?></span> <?php echo $stock; ?><br />
					-->

					<span><?php echo $text_qty; ?></span>
					<input type="text" name="quantity" size="4" value="<?php echo $minimum; ?>" />
					<input type="hidden" name="product_id" size="4" value="<?php echo $product_id; ?>" />
					<?php if ($minimum > 1) { ?>
					<div class="minimum"><?php echo $text_minimum; ?></div>
					<?php } ?>
				</div>
				<?php if ($options) { ?>
				<h2><?php echo $text_option; ?></h2>
				<div class="options">
					<?php foreach ($options as $option) { ?>
					<?php if ($option['type'] == 'select') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<select name="option[<?php echo $option['product_option_id']; ?>]">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($option['option_value'] as $option_value) { ?>
							<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
							<?php if ($option_value['price']) { ?>
							(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
							<?php } ?>
							</option>
							<?php } ?>
						</select>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'radio') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option multi">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<div>
							<?php foreach ($option['option_value'] as $option_value) { ?>
							<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
							<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
								<?php if ($option_value['price']) { ?>
								(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
								<?php } ?>
							</label>
							<br />
							<?php } ?>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'checkbox') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option multi">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<div>
							<?php foreach ($option['option_value'] as $option_value) { ?>
							<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
							<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
								<?php if ($option_value['price']) { ?>
								(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
								<?php } ?>
							</label>
							<br />
							<?php } ?>
						</div>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'image') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<table class="option-image">
							<?php foreach ($option['option_value'] as $option_value) { ?>
							<tr>
								<td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
								<td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
								<td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
										<?php if ($option_value['price']) { ?>
										(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
										<?php } ?>
									</label></td>
							</tr>
							<?php } ?>
						</table>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'text') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'textarea') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option multi">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'file') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>">
						<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'date') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'datetime') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
					</div>
					<?php } ?>
					<?php if ($option['type'] == 'time') { ?>
					<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
						<?php if ($option['required']) { ?>
						<span class="required">*</span>
						<?php } ?>
						<strong><?php echo $option['name']; ?>:</strong>
						<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
					</div>
					<?php } ?>
					<?php } ?>
				</div>
				<?php } ?>
				<div class="cart">
					<div>
						<button class="button highlight" id="button-cart"><span><?php echo $button_cart; ?></span></button>
					</div>
					<div> <a class="icon-wishlist-grey" onclick="addToWishList('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></a> <a class="icon-compare-grey" onclick="addToCompare('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a>
						
					</div>
				</div>
			</div>
		</div>
		<div id="tabs" class="htabs clearafter"><a href="#tab-description" style="font-style: italic; font-family: FrankRuehl; font-size: 23px; border-bottom: 1px dashed black;"><?php echo $tab_description; ?></a>
			
			
		</div>
		<div id="tab-description" class="tab-content" style="font-size: 15px; color:black; font-family: Arial;"><?php echo $description; ?>
		<!--<hr style="color:#DDDDDD; background-color:#DDDDDD; height:1px; border:none;">-->
		<br>
		<table class="attribute" >
				<?php foreach ($attribute_groups as $attribute_group) { ?>
				<thead>
					<tr>
						<td colspan="2" style="text-align: center;"><?php echo $attribute_group['name']; ?></td>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
					<tr>
						<td><?php echo $attribute['name']; ?></td>
						<td><?php echo $attribute['text']; ?></td>
					</tr>
					<?php } ?>
				</tbody>
				<?php } ?>
			</table>
		
		</div>
		
		<?php if ($review_status) { ?>
		<div id="tab-review" class="tab-content">
			<div id="review"></div>
			<h2 id="review-title"><?php echo $text_write; ?></h2>
			<p class="clearafter"> <strong><?php echo $entry_name; ?></strong>
				<input type="text" name="name" value="" />
			</p>
			<p class="clearafter"> <strong><?php echo $entry_review; ?></strong>
				<textarea name="text" cols="40" rows="8"></textarea>
			</p>
			<p><?php echo $text_note; ?></p>
			<p> <strong><?php echo $entry_rating; ?></strong> <span><?php echo $entry_bad; ?></span>
				<input type="radio" name="rating" value="1" />
				<input type="radio" name="rating" value="2" />
				<input type="radio" name="rating" value="3" />
				<input type="radio" name="rating" value="4" />
				<input type="radio" name="rating" value="5" />
				<span><?php echo $entry_good; ?></span> </p>
			<div class="captcha-field clearafter">
				<div class="left"><strong><?php echo $entry_captcha; ?></strong></div>
				<div class="right">
					<input type="text" name="captcha" value="" />
					<p><img src="index.php?route=product/product/captcha" alt="" id="captcha" /></p>
				</div>
			</div>
			<div class="buttons">
				<div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
			</div>
		</div>
		<?php } ?>
		<?php if ($products) { ?>
		<div class="box-heading"><span><?php echo $tab_related; ?></span></div>
		<div class="box-content">
			<div class="box-product product-grid">
				<?php foreach ($products as $product) { ?>
				<?php
        $thumb_width = $this->config->get('config_image_related_width');
        $thumb_height = $this->config->get('config_image_related_height');
      ?>
				<div>
					<?php if ($product['thumb']) { ?>
					<div class="image" ><a href="<?php echo $product['href']; ?>" ><img  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
					<?php } else { ?>
					<div class="image"><span class="no-image"><img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" /></span></div>
					<?php } ?>
					<?php if ($product['price']) { ?>
					<div class="price-label">
						<?php if (!$product['special']) { ?>
						<div ><span class="price-fixed"><?php echo $product['price']; ?></span></div>
						<?php } else { ?>
						<div class="special-price"><span class="price-old"><?php echo $product['price']; ?></span><span class="price-fixed"><?php echo $product['special']; ?></span></div>
						<?php } ?>
					</div>
					<?php } ?>
					<?php if ($product['rating']) { ?>
					<div class="rating"><img src="catalog/view/theme/acceptus-pro/image/icons/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
					<?php } ?>
					<div class="name" style="width: <?php echo $thumb_width; ?>px"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
					<?php if ($product['price']) { ?>
					<div class="price">
						<?php if (!$product['special']) { ?>
						<div><span class="price-fixed"><?php echo $product['price']; ?></span></div>
						<?php } else { ?>
						<div class="special-price"><span class="price-old"><?php echo $product['price']; ?></span><span class="price-fixed"><?php echo $product['special']; ?></span></div>
						<?php } ?>
					</div>
					<?php } ?>
					<div class="details" >                                               
						<div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');"><span ><?php echo $button_cart; ?></span></a></div>
						<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></a></div>
						<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></a></div>
					</div>
				</div>
				<?php } ?>
			</div>
		</div>
		<?php } ?>
		<?php if ($tags) { ?>
		<div class="tags"><strong><?php echo $text_tags; ?></strong>
			<?php for ($i = 0; $i < count($tags); $i++) { ?>
			<?php if ($i < (count($tags) - 1)) { ?>
			<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
			<?php } else { ?>
			<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
			<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div> 
	<?php echo $content_bottom; ?></div>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/acceptus-pro/stylesheet/popup.css" />
<script type="text/javascript" src="catalog/view/theme/acceptus-pro/js/popup.js"></script> 
<script type="text/javascript"><!--
$('.colorbox').magnificPopup({
	type: 'image',
	removalDelay: 300,
	mainClass: 'lightbox-fade',
	gallery : {
		enabled : true
	}
});
//--></script>
<?php if (isset($zoom_effect)) { ?>
<?php
$zoom_window_width = isset($block['zoom_effect']['zoom_window_width']) ? intval($block['zoom_effect']['zoom_window_width']) : 300;
$zoom_window_height = isset($block['zoom_effect']['zoom_window_height']) ? intval($block['zoom_effect']['zoom_window_height']) : 300;
?>
<link rel="stylesheet" href="catalog/view/theme/acceptus-pro/stylesheet/jqzoom.css" />
<script type="text/javascript" src="catalog/view/theme/acceptus-pro/js/jqzoom.js"></script> 
<script type="text/javascript">
	$(document).ready(function() {
		$('.jqzoom').jqzoom({
				zoomType	: 'standard',
				alwaysOn	: false,
				lens		: true,
				zoomWidth	: <?php echo $zoom_window_width; ?>,
           		zoomHeight	: <?php echo $zoom_window_height; ?>,
				showEffect	: 'fadein',
				hideEffect	: 'fadeout'
			});
		
	});
</script>
<?php } ?>
<script type="text/javascript"><!--
var _productCartTimer;
$('#button-cart').bind('click', function() {
    clearTimeout(_productCartTimer);

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#notification')
                    .html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>')
                    .addClass('active');
					
				$('.success').fadeIn('slow', function () {
                    _productCartTimer = setTimeout(function () {
                        $('#notification').removeClass('active');
                    }, 2500);
                });
					
				$('#cart-total').html(json['total']);
			}
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<?php echo $footer; ?>
