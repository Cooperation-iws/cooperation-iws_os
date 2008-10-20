<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

<title><?php bloginfo('name'); ?> <?php if ( is_single() ) { ?> &raquo; Blog Archive <?php } ?> <?php wp_title(); ?></title>

<link rel="stylesheet" href="<?php bloginfo('template_url') ?>/blueprint/screen.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="<?php bloginfo('template_url') ?>/style.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="<?php bloginfo('template_url') ?>/blueprint/print.css" type="text/css" media="print" />
<!--[if IE]><link rel="stylesheet" href="<?php bloginfo('template_url') ?>/blueprint/ie.css" type="text/css" media="screen, projection" /><![endif]-->
  
<link rel="alternate" type="application/rss+xml" title="<?php bloginfo('name'); ?> RSS Feed" href="<?php bloginfo('rss2_url'); ?>" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

<?php wp_head(); ?>
</head>
<body>
<div class="wrapper">
<div class='container'>
  
	<div class='headermenu span-24'>
        <ul>
        <li class="first"<?php if (!is_page()) { echo ' id="firstcurrent"'; } ?>><a href="<?php bloginfo('url') ?>" title="Home">Home</a></li>
		<?php 
        $menupages = $wpdb->get_results("SELECT ID, post_title FROM $wpdb->posts WHERE post_type = 'page' AND post_status = 'publish' AND post_parent = 0 ORDER BY menu_order ASC");
        $menupagesnumber = count($menupages);
		$menupagescount = 1;
		foreach ($menupages as $menupage) :
        ?>
	        <li
			<?php 
			if (is_page($menupage->ID) && $menupagescount!=$menupagesnumber ) { 
				echo ' id="current"'; 
			}
			if ($menupagescount==$menupagesnumber) {
				echo ' class="last"';
			}
			if (is_page($menupage->ID) && $menupagescount==$menupagesnumber) {
				echo ' id="lastcurrent"';
			}
			$menupagescount++;
			?>>
            <a href="<?php echo get_permalink($menupage->ID); ?>" title="<?php echo $menupage->post_title; ?>"><?php echo $menupage->post_title; ?></a></li>

		<?php endforeach; ?>
        </ul>
	</div>
  
    <div class='header span-24'>
        <div class="alignright" style="width:310px">
			
	       
            <a class="menufeed" href="<?php bloginfo('rss2_url'); ?>" title="Subscribe Feed"></a>&nbsp; 
        </div>
        <a class="menuhome" href="<?php bloginfo('url') ?>" title="Home"></a>&nbsp;
        <span class="blogtitle"><a href="<?php bloginfo('url') ?>" title="Home"><?php bloginfo('name') ?></a></span>
    </div>
    
    <div class='msgbartop span-24'><img src="<?php bloginfo('template_url') ?>/images/msgbartop.gif" alt="msgbartop" /></div>
    <div class='msgbar span-24'>
		<?php bloginfo('description') ?>
    </div>
    <div class='msgbarbottom span-24'><img src="<?php bloginfo('template_url') ?>/images/msgbarbottom.gif" alt="msgbarbottom" /></div>
