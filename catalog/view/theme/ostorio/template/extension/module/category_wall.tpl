<div class="category-wall">
  <h3><?php echo $heading_title; ?></h3>
  <div class="row">
    <?php $i=0; foreach ($categories as $category) { ?>
    <div class="col-sm-3 col-xs-12">
      <div class="category-item">
        <a class="cat-image" href="<?php echo $category['href']; ?>">
        <img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" />
        </a>
        <div class="cat-caption">
          <a class="cat-name" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
        </div>
      </div>
    </div>
    <?php $i++; 
      if($i % 4 == 0) { ?>
    <div class="clearfix"></div>
    <?php } 
      } ?>
    <div class="clearfix"></div>
  </div>
</div>