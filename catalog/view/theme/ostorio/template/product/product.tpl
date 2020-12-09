<?php echo $header; ?>
<div class="container">
  <div class="product-breadcrumb">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <div class="product-container">
    <div class="row">
      <?php echo $column_left; ?>	
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6 col-60'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9 col-80'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div id="content" class="<?php echo $class; ?>">
        <?php echo $content_top; ?>      
        <div id="product">
          <div class="card-row">
            <div class="row">
              <div class="col-sm-6">
                <?php if ($thumb || $images) { ?>
                <ul class="thumbnails clearfix">
                  <?php if ($thumb) { ?>
                  <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                  <?php } ?>
                  <?php if ($images) { ?>
                  <?php foreach ($images as $image) { ?>
                  <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
                  <?php } ?>
                  <?php } ?>
                </ul>
                <?php } ?>            
              </div>
              <div class="col-sm-6">
                <div class="product-block">
                  <div class="goods-header">
                    <h1 class="h1-product--name main-title"><?php echo $heading_title; ?></h1>
                  </div>
                  <?php if ($review_status) { ?>
                  <div class="rating">
                    <div class="product-rating">
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($rating < $i) { ?>
                      <span class="star-empty"></span>
                      <?php } else { ?>
                      <span class="star"></span>
                      <?php } ?>
                      <?php } ?>
                    </div>
                    <a class="scroll-review"><?php echo $reviews; ?></a>
                    <a class="scroll-review write-review"><?php echo $text_write; ?></a>               
                  </div>
                  <?php } ?>              
                  <div class="product-points add-wishlist add-compare">
                    <?php if ($reward) { ?>
                    <div class="text-points">
                      + <?php echo $reward; ?> <?php echo $text_bonus; ?>
                    </div>
                    <?php } ?>
                    <span class="wishlist-btn" onclick="wishlist.add('<?php echo $product_id; ?>');"><i></i><?php echo $text_product_wishlist; ?></span>
                    <span class="compare-btn" onclick="compare.add('<?php echo $product_id; ?>');"><i></i><?php echo $button_compare; ?></span>
                  </div>
                  <div class="card-order order-price">
                    <?php if ($price) { ?>
                    <div class="price">
                      <?php if (!$special) { ?>
                      <div class="main-price"><?php echo $price; ?></div>
                      <?php } else { ?>
                      <div class="old-price"><?php echo $price; ?></div>
                      <?php if ($action_percent) { ?>
                      <div class="price-percent"><?php echo "-". $action_percent . "%"; ?></div>
                      <?php }?>
                      <div class="special-price"><?php echo $special; ?></div>
                      <div class="price-economy"><?php echo $text_economy; ?> <?php echo $economy; ?></div>
                      <?php }?>
                    </div>
                    <?php } ?>
                    <?php if ($discounts) { ?>			                      
                    <div class="discount-price-block">
                      <?php foreach ($discounts as $discount) { ?>
                      <div class="discount-price-item">
                        <span class="discount-quantity"><?php echo $discount['quantity']; ?></span>
                        <span class="discount-text"><?php echo $text_discount; ?></span>
                        <span class="discount-price"><?php echo $discount['price']; ?></span>
                      </div>
                      <?php } ?>
                    </div>
                    <?php } ?>	
                    <?php if ($tax) { ?>
                    <div class="price-tax"><?php echo $text_tax; ?> <span class="text-tax"><?php echo $tax; ?></span></div>
                    <?php } ?>
                  </div>
                  <div class="product-button">
                    <div class="product-quantity form-group">
                      <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                      <div class="plus-minus">
                        <button class="btn btn-default wdth-45" data-dir="dwn">-</button>
                        <input type="text" name="quantity" value="<?php echo $minimum; ?>" id="input-quantity" class="product-form-quantity" />
                        <button class="btn btn-default wdth-45" data-dir="up">+</button>
                      </div>
                    </div>
                    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />                  
                    <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary add-to-cart"><?php echo $button_cart; ?></button>                                       
                  </div>
                </div>
                <div class="options-block">
                  <?php if ($options) { ?>
                  <hr>
                  <h3><?php echo $text_option; ?></h3>
                  <?php foreach ($options as $option) { ?>
                  <?php if ($option['type'] == 'select') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
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
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label"><?php echo $option['name']; ?></label>
                    <div id="input-option<?php echo $option['product_option_id']; ?>">
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                      <div class="radio">
                        <label>
                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                        <?php if ($option_value['image']) { ?>
                        <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                        <?php } ?>                    
                        <?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'checkbox') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label"><?php echo $option['name']; ?></label>
                    <div id="input-option<?php echo $option['product_option_id']; ?>">
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                      <div class="checkbox">
                        <label>
                        <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                        <?php if ($option_value['image']) { ?>
                        <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                        <?php } ?>
                        <?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'text') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'textarea') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'file') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label"><?php echo $option['name']; ?></label>
                    <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                    <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'date') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="input-group date">
                      <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                      </span>
                    </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'datetime') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="input-group datetime">
                      <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span>
                    </div>
                  </div>
                  <?php } ?>
                  <?php if ($option['type'] == 'time') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="input-group time">
                      <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span>
                    </div>
                  </div>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($recurrings) { ?>
                  <h3><?php echo $text_payment_recurring; ?></h3>
                  <div class="form-group required">
                    <select name="recurring_id" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($recurrings as $recurring) { ?>
                      <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                      <?php } ?>
                    </select>
                    <div class="help-block" id="recurring-description"></div>
                  </div>
                  <?php } ?>
                  <div class="form-group">
                    <div class="card-add-info card-cond">
                      <div class="card-cond-item">
                        <?php if ($manufacturer) { ?>
                        <p>					
                          <span class="cond-list"><?php echo $text_manufacturer; ?></span>
                          <span><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></span>                    
                        </p>
                        <?php } ?>
                        <p>
                          <span class="cond-list"><?php echo $text_model; ?></span>
                          <span><?php echo $model; ?></span>
                        </p>
                        <?php if ($points) { ?>
                        <p>
                          <span class="cond-list"><?php echo $text_points; ?></span>
                          <span><?php echo $points; ?></span>
                        </p>
                        <?php } ?>
                        <p>
                          <span class="cond-list"><?php echo $text_stock; ?></span>
                          <span>
                          <?php if ($quantity) { ?>
                          <span class="text-success"><?php echo $stock; ?></span>
                          <?php } else { ?>
                          <span class="text-danger"><?php echo $stock; ?></span>
                          <?php } ?>
                          </span>							
                        </p>
                      </div>
                    </div>
                  </div>
                  <?php if ($minimum > 1) { ?>
                  <div class="alert alert-info animated fadeInRight"><i></i><?php echo $text_minimum; ?></div>
                  <?php } ?>
                </div>
				<!-- AddThis Button BEGIN -->
                <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
                <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                <!-- AddThis Button END -->
              </div>
            </div>
          </div>
        </div>
        <div class="card-row">
          <div class="row">
            <div class="col-sm-12">
              <div class="nav-container">
                <div class="nav-block">
                  <div class="nav-content">
                    <div class="row">
                      <?php if ($description) { ?>
                      <div class="col-sm-12">
                        <div class="description-text nav-form">
                          <h4><?php echo $tab_description; ?></h4>
                          <?php echo $description; ?>
                        </div>
                      </div>
                      <?php } ?>                      
                      <?php if ($attribute_groups) { ?>
                      <div class="col-sm-12">
                        <!-- attribute -->
                        <div class="params-block nav-form">
                          <h4><?php echo $tab_attribute; ?></h4>
                          <div class="params-content">
                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                            <div class="params-title"><?php echo $attribute_group['name']; ?></div>
                            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                            <div class="card-params">
                              <span><b><?php echo $attribute['name']; ?></b></span>
                              <span><?php echo $attribute['text']; ?></span>
                            </div>
                            <?php } ?>
                            <?php } ?>
                          </div>
                        </div>
                        <!-- END attribute -->
                      </div>
                      <?php } ?>						                                       
                      <?php if ($review_status) { ?>
                      <div class="col-sm-12">
                        <div class="review-header nav-form">
                          <h4><?php echo $tab_review; ?></h4>
                          <h5><?php echo $heading_title; ?></h5>
                          <div class="product-review-block">
                            <form id="form-review">
                              <div id="review"></div>
                              <h3><?php echo $text_write; ?></h3>
                              <?php if ($review_guest) { ?>
                              <div class="form-group required">                         
                                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                              </div>
                              <div class="form-group required">                          
                                <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                              </div>
                              <div class="form-group required">                          
                                <label class="control-label"><?php echo $entry_rating; ?></label>
                                &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                <input type="radio" name="rating" value="1" />
                                &nbsp;
                                <input type="radio" name="rating" value="2" />
                                &nbsp;
                                <input type="radio" name="rating" value="3" />
                                &nbsp;
                                <input type="radio" name="rating" value="4" />
                                &nbsp;
                                <input type="radio" name="rating" value="5" />
                                &nbsp;<?php echo $entry_good; ?>
                              </div>
                              <?php echo $captcha; ?>
                              <div class="buttons clearfix">
                                <div class="pull-right">
                                  <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                                </div>
                              </div>
                              <?php } else { ?>
                              <?php echo $text_login; ?>
                              <?php } ?>
                            </form>
                          </div>
                        </div>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if ($tags) { ?>
                    <!-- Блок тегов -->
                    <div class="tags-group">
                      <h3><?php echo $text_tags; ?></h3>
                      <ul class="tags-list">
                        <?php for ($i = 0; $i < count($tags); $i++) { ?>
                        <?php if ($i < (count($tags) - 1)) { ?>
                        <li class="tags-item"><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
                        <?php } else { ?>
                        <li class="tags-item"><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a></li>
                        <?php } ?>
                        <?php } ?>
                      </ul>
                    </div>
                    <!-- // Блок тегов  -->
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php echo $content_bottom; ?>
      </div>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<div class="container">
  <?php if ($products) { ?>
  <!-- Рекомендуемые товары -->
  <h3><?php echo $text_related; ?></h3>
  <div class="related">
    <?php foreach ($products as $product) { ?>
    <div class="product-layout">
      <div class="product-thumb">
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
        <div class="caption">
          <div class="caption-content">
            <div class="pr-name">
              <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            </div>
            <div class="rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($product['rating'] < $i) { ?>
              <span class="star-empty"></span>
              <?php } else { ?>
              <span class="star"></span>
              <?php } ?>
              <?php } ?>
            </div>
            <?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
              <span class="main-price"><?php echo $product['price']; ?></span>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['price']; ?></span>
              <span class="price-new main-price"><?php echo $product['special']; ?></span>                                   
              <?php } ?>
              <?php if ($product['tax']) { ?>
              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
              <?php } ?>		  
            </div>
            <?php } ?>                                                              
          </div>
          <div class="button-group">
            <button type="button" class="btn btn-primary btn-sm" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><?php echo $button_cart; ?></button>
          </div>
        </div>
      </div>
    </div>
    <?php } ?>
  </div>
  <!-- // Рекомендуемые товары -->
  <?php } ?>
</div>
<section class="attention">
  <div class="container">
    <div class="row">
      <div class="col">
        <div class="att">
		  <img src="/image/catalog/icon-png/attention.png" class="attention-img"> 
		  Уважаемые покупатели, обратите внимание, что цены, указанные на сайте, могут отличаться от фактических. Производитель оставляет за собой право менять описания, характеристики, изображения продукции без предварительного уведомления. Пожалуйста, уточняйте подробности у менеджеров. Информация о товарах на сайте не является публичной офертой, определяемой положениями Статьи 437 Гражданского кодекса Российской Федерации. 
	    </div>
	  </div>
    </div>
  </div>    
</section>
<script><!--
  $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
  	$.ajax({
  		url: 'index.php?route=product/product/getRecurringDescription',
  		type: 'post',
  		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
  		dataType: 'json',
  		beforeSend: function() {
  			$('#recurring-description').html('');
  		},
  		success: function(json) {
  			$('.alert, .text-danger').remove();
  
  			if (json['success']) {
  				$('#recurring-description').html(json['success']);
  			}
  		}
  	});
  });
  //-->
</script>
<script><!--
  $('#button-cart').on('click', function() {
  	$.ajax({
  		url: 'index.php?route=checkout/cart/add',
  		type: 'post',
  		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
  		dataType: 'json',
  		beforeSend: function() {
  			$('#button-cart').button('loading');
  		},
  		complete: function() {
  			$('#button-cart').button('reset');
  		},
  		success: function(json) {
  			$('.alert, .text-danger').remove();
  			$('.form-group').removeClass('has-error');
  
  			if (json['error']) {
  				if (json['error']['option']) {
  					for (i in json['error']['option']) {
  						var element = $('#input-option' + i.replace('_', '-'));
  
  						if (element.parent().hasClass('input-group')) {
  							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
  						} else {
  							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
  						}
  					}
  				}
  
  				if (json['error']['recurring']) {
  					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
  				}
  
  				// Highlight any found errors
  				$('.text-danger').parent().addClass('has-error');
  			}
  
  			if (json['success']) {
  				$("body").append('<div class="alert alert-success animated fadeInRight"><i></i>' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
  		$(".alert").delay(6000).slideUp(100);
  
  				$('#cart > button').html('' + json['total'] + '<span class="user-menu-icon"></span>');
  
  				$('html, body').animate({ scrollTop: 0 }, 'slow');
  		$('#cart > ul').load('index.php?route=common/cart/info ul li');
  			}
  		},
          error: function(xhr, ajaxOptions, thrownError) {
              alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
  	});
  });
  //-->
</script>
<script><!--
  $('.date').datetimepicker({
  	pickTime: false
  });
  
  $('.datetime').datetimepicker({
  	pickDate: true,
  	pickTime: true
  });
  
  $('.time').datetimepicker({
  	pickDate: false
  });
  
  $('button[id^=\'button-upload\']').on('click', function() {
  	var node = this;
  
  	$('#form-upload').remove();
  
  	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
  
  	$('#form-upload input[name=\'file\']').trigger('click');
  
  	if (typeof timer != 'undefined') {
      	clearInterval(timer);
  	}
  
  	timer = setInterval(function() {
  		if ($('#form-upload input[name=\'file\']').val() != '') {
  			clearInterval(timer);
  
  			$.ajax({
  				url: 'index.php?route=tool/upload',
  				type: 'post',
  				dataType: 'json',
  				data: new FormData($('#form-upload')[0]),
  				cache: false,
  				contentType: false,
  				processData: false,
  				beforeSend: function() {
  					$(node).button('loading');
  				},
  				complete: function() {
  					$(node).button('reset');
  				},
  				success: function(json) {
  					$('.text-danger').remove();
  
  					if (json['error']) {
  						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
  					}
  
  					if (json['success']) {
  						alert(json['success']);
  
  						$(node).parent().find('input').val(json['code']);
  					}
  				},
  				error: function(xhr, ajaxOptions, thrownError) {
  					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
  				}
  			});
  		}
  	}, 500);
  });
  //-->
</script>
<script><!--
  $('#review').delegate('.pagination a', 'click', function(e) {
      e.preventDefault();
  
      $('#review').fadeOut('slow');
  
      $('#review').load(this.href);
  
      $('#review').fadeIn('slow');
  });
  
  $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
  
  $('#button-review').on('click', function() {
  	$.ajax({
  		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
  		type: 'post',
  		dataType: 'json',
  		data: $("#form-review").serialize(),
  		beforeSend: function() {
  			$('#button-review').button('loading');
  		},
  		complete: function() {
  			$('#button-review').button('reset');
  		},
  		success: function(json) {
  			$('.alert-success, .alert-danger').remove();
  
  			if (json['error']) {
  				$('#review').after('<div class="alert alert-danger"><i></i>' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
  			}
  
  			if (json['success']) {
  				$('#review').after('<div class="alert alert-success"><i></i>' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
  
  				$('input[name=\'name\']').val('');
  				$('textarea[name=\'text\']').val('');
  				$('input[name=\'rating\']:checked').prop('checked', false);
  			}
  		}
  	});
      grecaptcha.reset();
  });
  
  $(document).ready(function() {
  	$('.thumbnails').magnificPopup({
  		type:'image',
  		delegate: 'a',
  		gallery: {
  			enabled:true
  		}
  	});
  });
  
  $(document).ready(function() {
  	var hash = window.location.hash;
  	if (hash) {
  		var hashpart = hash.split('#');
  		var  vals = hashpart[1].split('-');
  		for (i=0; i<vals.length; i++) {
  			$('#product').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
  			$('#product').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
  			$('#product').find('input[type="checkbox"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
  		}
  	}
  })
  //-->
</script>
<?php echo $footer; ?>