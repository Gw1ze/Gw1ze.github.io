<?php echo $header; ?>
<div class="catalog-page">
  <div class="container">
    <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
    </ul>
    <h1><?php echo $heading_title; ?></h1>
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
        <?php if ($categories) { ?>
        <div class="subcat-block">
          <div class="subcat more-subcategory">
            <?php foreach ($categories as $category) { ?>
            <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            <?php } ?>
          </div>
        </div>
        <?php } ?>
        <?php echo $content_top; ?>      
        <?php if ($thumb || $description) { ?>
        <div class="des-thumb-form">
          <div class="row">
            <?php if ($thumb) { ?>
            <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
            <?php } ?>
            <?php if ($description) { ?>
            <div class="col-sm-10"><?php echo $description; ?></div>
            <?php } ?>
          </div>
        </div>
        <?php } ?>      
        <?php if ($products) { ?>
        <div class="form-indent">
          <div class="toolbar-form">
            <div class="row">
              <div class="col-md-6 col-sm-5">
                <div class="form-compare">
                  <a href="<?php echo $compare; ?>" id="compare-total" class="compare-link"><?php echo $text_compare; ?></a>
                </div>
              </div>
              <div class="col-md-3 col-sm-3">
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
              <div class="col-md-1 col-sm-2">
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
              <div class="col-md-2 col-sm-2 hidden-xs">
                <div class="toolbar-action text-right">
                  <span id="list-view" class="toolbar-list" data-toggle="tooltip" title="<?php echo $button_list; ?>"></span>
                  <span id="grid-view" class="toolbar-list" data-toggle="tooltip" title="<?php echo $button_grid; ?>"></span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="catalog-content">
          <div class="row">
            <?php foreach ($products as $product) { ?>
            <div class="product-layout product-list col-xs-12">
              <div class="product-thumb transition">
                <div class="button-form">
				  <button class="wishlist" type="button" data-placement="right" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
				  <button class="compare" type="button" data-placement="right" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-balance-scale"></i></button>
				</div>
				<div class="image">
				  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>				  
				</div>
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
						<?php if ($product['action_percent']) { ?>
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
        <?php } ?>
        <?php if (!$categories && !$products) { ?>
        <div class="text-empty"><?php echo $text_empty; ?></div>
        <div class="buttons">
          <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
        <?php } ?>
        <?php echo $content_bottom; ?>	  
      </div>
      <?php echo $column_right; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>