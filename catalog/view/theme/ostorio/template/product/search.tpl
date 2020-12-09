<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
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
      <h1><?php echo $heading_title; ?></h1>
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
          <?php if ($sub_category) { ?>
          <input type="checkbox" name="sub_category" value="1" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="sub_category" value="1" />
          <?php } ?>
          <?php echo $text_sub_category; ?></label>
        </div>
      </div>
      <p>
        <label class="checkbox-inline">
        <?php if ($description) { ?>
        <input type="checkbox" name="description" value="1" id="description" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="description" value="1" id="description" />
        <?php } ?>
        <?php echo $entry_description; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />      
      <?php if ($products) { ?>
      <h2><?php echo $text_search; ?></h2>
      <div class="form-indent">
        <div class="row">
          <div class="col-md-7 col-sm-6">
            <div class="form-compare">
              <a href="<?php echo $compare; ?>" id="compare-total" class="compare-link"><?php echo $text_compare; ?></a>
            </div>
          </div>
          <div class="col-md-3 col-xs-6">
            <div class="form-sort text-right">
              <select id="input-sort" class="input-form" data-toggle="tooltip" title="<?php echo $text_sort; ?>" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="col-md-1 col-xs-6">
            <div class="form-limit text-right">
              <select id="input-limit" class="input-form" data-toggle="tooltip" title="<?php echo $text_limit; ?>" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="col-md-1 col-sm-6 hidden-xs">
            <div class="toolbar-action text-right">
              <span id="list-view" class="toolbar-list" data-toggle="tooltip" title="<?php echo $button_list; ?>"></span>
              <span id="grid-view" class="toolbar-list" data-toggle="tooltip" title="<?php echo $button_grid; ?>"></span>
            </div>
          </div>
        </div>
      </div>
      <hr>
      <div class="catalog-content">
        <div class="row">
          <?php foreach ($products as $product) { ?>
          <div class="product-layout product-list col-xs-12">
            <div class="product-thumb transition">
              <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
              <div class="caption">
                <div class="caption-content">
                  <div class="pr-name">
                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  </div>
                  <div class="flex-caption">
                    <?php if ($product['price']) { ?>
                    <div class="price">
                      <?php if (!$product['special']) { ?>
                      <span class="main-price"><?php echo $product['price']; ?></span>
                      <?php } else { ?>
                      <span class="price-old"><?php echo $product['price']; ?></span>
                      <?php if ($product['action_percent'] > 0) { ?>
                      <span class="price-percent"><?php echo "-" . $product['action_percent'] . "%"; ?></span>
                      <?php } ?>
                      <span class="price-new main-price"><?php echo $product['special']; ?></span>                     
                      <span class="price-economy"><?php echo $text_economy; ?> <?php echo $product['economy']; ?></span>
                      <?php } ?>
                      <?php if ($product['tax']) { ?>
                      <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                      <?php } ?>							
                    </div>
                    <?php } ?>
                    <div class="rating">
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                      <?php if ($product['rating'] < $i) { ?>
                      <span class="star-empty"></span>
                      <?php } else { ?>
                      <span class="star"></span>
                      <?php } ?>
                      <?php } ?>
                      <a href="<?php echo $product['href']; ?>" class="reviews-count"><?php echo $product['reviews']; ?></a>
                    </div>
                  </div>
                  <div class="descr">
                    <?php echo $product['description']; ?>
                  </div>
                </div>
                <div class="button-group">
                  <button type="button" class="btn btn-primary btn-sm" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><?php echo $button_cart; ?></button>
                </div>
              </div>
              <?php if ($product['attribute_groups']) { ?>
              <div class="short-attribute">
                <div class="short-attribute__list">
                  <?php $i = 0; ?>                      
                  <?php foreach($product['attribute_groups'] as $attribute_group) { ?>                      
                  <?php if ($i < 8) { ?>
                  <?php foreach($attribute_group['attribute'] as $attribute) { ?>                   
                  <?php if ($i < 6) { ?>
                  <div class="short-item">
                    <span class="attr-left text-muted"><?php echo $attribute['name']; ?>:</span>
                    <span class="attr-right text-muted"><?php echo $attribute['text']; ?></span>
                  </div>
                  <?php } ?>
                  <?php $i++ ?>                     		  
                  <?php } ?>					  
                  <?php } ?>					  
                  <?php } ?>	
                </div>
              </div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <div class="text-empty"><?php echo $text_empty; ?></div>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<script type="text/javascript"><!--
  $('#button-search').bind('click', function() {
  	url = 'index.php?route=product/search';
  
  	var search = $('#content input[name=\'search\']').prop('value');
  
  	if (search) {
  		url += '&search=' + encodeURIComponent(search);
  	}
  
  	var category_id = $('#content select[name=\'category_id\']').prop('value');
  
  	if (category_id > 0) {
  		url += '&category_id=' + encodeURIComponent(category_id);
  	}
  
  	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
  
  	if (sub_category) {
  		url += '&sub_category=true';
  	}
  
  	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
  
  	if (filter_description) {
  		url += '&description=true';
  	}
  
  	location = url;
  });
  
  $('#content input[name=\'search\']').bind('keydown', function(e) {
  	if (e.keyCode == 13) {
  		$('#button-search').trigger('click');
  	}
  });
  
  $('select[name=\'category_id\']').on('change', function() {
  	if (this.value == '0') {
  		$('input[name=\'sub_category\']').prop('disabled', true);
  	} else {
  		$('input[name=\'sub_category\']').prop('disabled', false);
  	}
  });
  
  $('select[name=\'category_id\']').trigger('change');
  -->
</script>
<?php echo $footer; ?>