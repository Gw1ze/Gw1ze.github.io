<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8">
  <![endif]-->
  <!--[if IE 9 ]>
  <html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9">
    <![endif]-->
    <!--[if (gt IE 9)|!(IE)]><!-->
    <html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
      <!--<![endif]-->
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $title;  ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
        <meta property="og:title" content="<?php echo $title; ?>" />
        <meta property="og:type" content="website" />
        <meta property="og:url" content="<?php echo $og_url; ?>" />
        <?php if ($og_image) { ?>
        <meta property="og:image" content="<?php echo $og_image; ?>" />
        <?php } else { ?>
        <meta property="og:image" content="<?php echo $logo; ?>" />
        <?php } ?>
        <meta property="og:site_name" content="<?php echo $name; ?>" />
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
        <link href="catalog/view/theme/ostorio/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <script src="catalog/view/theme/ostorio/js/bootstrap/js/bootstrap.min.js"></script>
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="catalog/view/theme/ostorio/stylesheet/stylesheet.css" rel="stylesheet">
		<link href="catalog/view/theme/ostorio/stylesheet/animate.min.css" rel="stylesheet">
		<link href="catalog/view/theme/ostorio/stylesheet/category-wall.css" rel="stylesheet">
        <link href="catalog/view/theme/ostorio/js/slick/slick.css" rel="stylesheet" type="text/css" />
        <link href="catalog/view/theme/ostorio/js/slick/slick-theme.css" rel="stylesheet" type="text/css" />
        <link href="catalog/view/theme/ostorio/js/slinky/slinky.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Fira+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
		<?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <script src="catalog/view/theme/ostorio/js/common.js"></script>
        <script src="catalog/view/theme/ostorio/js/slinky/slinky.min.js"></script>
        <script src="catalog/view/theme/ostorio/js/slick/slick.min.js"></script>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>"></script>
        <?php } ?>
        <?php foreach ($analytics as $analytic) { ?>
        <?php echo $analytic; ?>
        <?php } ?>
      </head>
      <body class="<?php echo $class; ?>">
        <div class="menu-shadow"></div>
        <header class="main-header">
          <div id="mmenu" class="mobile-block hidden-md hidden-lg">
            <div id="mob-menu" class="mobile-menu hidden-md hidden-lg">
              <div class="menu-control menu-header-control">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
              </div>
              <div class="menu-mobile-list">
                <!-- Start Mobile Catalog Products -->
                <?php if ($categories) { ?>
                <div class="menu-wrapper">
                  <div class="js-menu">
                    <ul class="active">
                      <li class="mobile-category-title"><a href="#"><span><?php echo $text_product_catalog; ?></span></a></li>
                      <?php foreach ($categories as $category) { ?>
                      <?php if ($category['children']) { ?>
                      <li>
                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                        <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                        <ul>
                          <?php foreach ($children as $child) { ?>
                          <?php if ($child['children']) { ?>
                          <li>
                            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                            <ul>
                              <?php foreach ($child['children'] as $child) { ?>
                              <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                              <?php } ?>													
                            </ul>
                          </li>
                          <?php } else { ?>
                          <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                          <?php } ?>
                          <?php } ?>
                        </ul>
                        <?php } ?>
                      </li>
                      <?php } else { ?>
                      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                      <?php } ?>
                      <?php } ?>
                    </ul>
                  </div>
                  <script>
                    var slinky = $('.js-menu').slinky({
                    	title: true,
                    });
                  </script>
                </div>
                <?php } ?>
                <!-- END Start Mobile Catalog Products -->
                <ul>
                  <li class="menu-mobile-item menu-mobile-item-title">
                    <span class="menu-mobile-item-link mobile-menu-user-account">
                    <span class="user-registration">
                    <span> 
                    <a href="<?php echo $login; ?>" class="mobile-menu-user-login">Вход</a> | <a href="<?php echo $register; ?>" class="menu-mobile-registration">Регистрация</a>
                    </span>
                    </span>  
                    </span>
                  </li>
                  <li class="menu-mobile-item"><a href="<?php echo $contact; ?>" class="menu-mobile-item-link menu-mobile-phone"><span><?php echo $telephone; ?></span></a></li>                 
				  <li class="menu-mobile-item">
                    <a class="menu-mobile-item-link" href="<?php echo $shopping_cart; ?>">
                    <span><?php echo $text_shopping_cart; ?></span>
                    </a>
                  </li>
                  <li class="menu-mobile-item">
                    <a class="menu-mobile-item-link" href="<?php echo $checkout; ?>">
                    <span><?php echo $text_checkout; ?></span>
                    </a>
                  </li>
				  <?php foreach ($informations as $information) { ?>
				  <!-- Вывод статей  -->
				  <li class="menu-mobile-item">
				    <a href="<?php echo $information['href']; ?>" class="menu-mobile-item-link" rel="nofollow">
					  <span><?php echo $information['title']; ?></span>
					</a>
				  </li>
                  <!-- // Вывод статей -->
				  <?php } ?>
                </ul>
              </div>
            </div>
            <div class="mobile-logo hidden-md hidden-lg">
              <?php if ($logo) { ?>
              <?php if ($home == $og_url) { ?>
              <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
              <?php } else { ?>
              <a href="<?php echo $home; ?>" class="mobile-header-logo"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
              <?php } ?>
              <?php } else { ?>
              <a href="<?php echo $home; ?>" class="mobile-header-logo"><?php echo $name; ?></a>
              <?php } ?>
            </div>
            <div class="mobile-search mobile-search-icon-toggle hidden-md hidden-lg"></div>
          </div>
          <nav class="header-top hidden-xs hidden-sm">
            <div class="container">
              <ul class="header-top-content header-top-content-left">
                <li class="header-top-item"><a href="<?php echo $shopping_cart; ?>" class="header-top-links" title="<?php echo $text_shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
                <li class="header-top-item"><a href="<?php echo $checkout; ?>" class="header-top-links" title="<?php echo $text_checkout; ?>"><?php echo $text_checkout; ?></a></li>                
		        <?php foreach ($informations as $information) { ?>
                <!-- Вывод статей  -->
				<li class="header-top-item"><a href="<?php echo $information['href']; ?>" class="header-top-links" rel="nofollow"><?php echo $information['title']; ?></a></li>
                <!-- // Вывод статей -->
				<?php } ?>		        
			  </ul>			  
              <ul class="header-top-content header-top-content-right">
                <li class="header-top-item"><a href="<?php echo $contact; ?>" class="header-top-links header-top-phone"><?php echo $telephone; ?></a></li>
                <?php echo $currency; ?>
				<?php echo $language; ?>
			  </ul>
            </div>
          </nav>
          <div class="container">
            <div class="header-middle">
              <div class="main-logo hidden-xs hidden-sm">
                <?php if ($logo) { ?>
                <?php if ($home == $og_url) { ?>
                <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                <?php } else { ?>
                <a href="<?php echo $home; ?>" class="header-logo"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                <?php } ?>
                <?php } else { ?>
                <h1><a href="<?php echo $home; ?>" class="header-logo"><?php echo $name; ?></a></h1>
                <?php } ?>
              </div>
              <?php echo $search; ?>
              <div class="header-user-menu">
                <div class="header-basket">
                  <div class="header-wishlist user-menu-item hidden-xs hidden-sm">
                    <a href="<?php echo $wishlist; ?>" id="wishlist-total" class="user-menu-wishlist"><?php echo $text_wishlist; ?><span class="user-menu-icon"></span></a>
                  </div>
                  <div class="user-menu-item hidden-xs hidden-sm">
                    <?php if ($logged) { ?>
                    <a href="<?php echo $login; ?>" class="user-menu-link user-menu-login"><?php echo $text_account; ?><span class="user-menu-icon"></span></a>
                    <?php } else { ?>
                    <a href="<?php echo $login; ?>" class="user-menu-link user-menu-login"><?php echo $text_login_user; ?><span class="user-menu-icon"></span></a>
                    <?php } ?>
                  </div>
                  <?php echo $cart; ?>
                </div>
              </div>
            </div>
          </div>
          <?php if ($categories) { ?>
          <div class="header-menu hidden-xs hidden-sm">
            <div class="container">
              <ul class="header-menu-block">
                <li class="header-menu-item goods-action">
                  <a class="nav-item-link" href="<?php echo $special; ?>"><span class="header-item-text">Акции</span></a>
                </li>
                <?php foreach ($categories as $category) { ?>
                <?php if ($category['children']) { ?>
                <li class="header-menu-item sub">
                  <a class="nav-item-link" href="<?php echo $category['href']; ?>"><span class="header-item-text"><?php echo $category['name']; ?></span></a>                  
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                  <div class="nav-dropdown">
                    <div class="dropdown-holder">
                      <div class="container">
						<!-- Изображения выводятся на 6 колонок -->
                        <ul class="dropdown-image">
                          <?php foreach ($children as $child) { ?>
                          <?php if ($child['children']) { ?>
                          <li class="navigation-menu-image">
                            <img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" />
                          </li>
                          <?php } else { ?>
                          <li class="navigation-menu-image">
                            <img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>" />
                          </li>
                          <?php } ?>
                          <?php } ?>
                        </ul>
						<ul class="dropdown-menu-item">
                          <?php foreach ($children as $child) { ?>
                          <?php if ($child['children']) { ?>
                          <li class="header-menu-column">
                            <strong class="nav-dropdown-title">
                            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>						    
                            </strong>
                            <ul>
                              <?php foreach ($child['children'] as $child) { ?>
                              <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                              <?php } ?>													
                            </ul>
                          </li>
                          <?php } else { ?>
                          <li class="header-menu-column">
                            <strong class="nav-dropdown-title">
                            <a class="nav-item-link" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                            </strong>
                          </li>
                          <?php } ?>
                          <?php } ?>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <?php } ?>				  
                </li>
                <?php } else { ?>
                <li class="header-menu-item"><a href="<?php echo $category['href']; ?>"><span class="header-item-text"><?php echo $category['name']; ?></span></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
            </div>
          </div>
          <?php } ?>            
        </header>        