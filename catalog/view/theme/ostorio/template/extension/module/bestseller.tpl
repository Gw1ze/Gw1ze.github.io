<div class="catalog-content">
  <h3><?php echo $heading_title; ?></h3>
  <div class="row">
    <?php foreach ($products as $product) { ?>
    <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
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
            <button type="button" class="btn btn-primary btn-sm" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></button>
          </div>
        </div>
      </div>
    </div>
    <?php } ?>
  </div>
</div>