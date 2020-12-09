<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="review-user-block">
  <div class="review-user-author"><?php echo $review['author']; ?></div>
  <div class="review-date-added"><?php echo $review['date_added']; ?></div>
  <div class="review-user-text"><?php echo $review['text']; ?></div>
  <div class="rating">
	<?php for ($i = 1; $i <= 5; $i++) { ?>
    <?php if ($review['rating'] < $i) { ?>
    <span class="star-empty"></span>
    <?php } else { ?>
    <span class="star"></span>
    <?php } ?>
    <?php } ?>
  </div>
</div>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="text-empty"><?php echo $text_no_reviews; ?></div>
<?php } ?>
