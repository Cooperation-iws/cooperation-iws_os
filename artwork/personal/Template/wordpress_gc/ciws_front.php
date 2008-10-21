<?php
/*
Template Name: Ciws
*/
?>

<?php get_header(); ?>

	<div class='content span-16'>
	Search the all domain <?php echo $HTTP_SERVER_VARS["SERVER_NAME"] ?>:
		<?php include('../Sphider/index.php'); ?>
		<?php $tree = simplexml_load_file('../cooperation-wui.xml');
						$count_xml_elt=0;
						foreach($tree->item as $item) {	
							$array_xml[$count_xml_elt][0] = $item->item_category;							
							$array_xml[$count_xml_elt][1] = $item->item_name;
							$array_xml[$count_xml_elt][2] = $item->item_desc;
							$array_xml[$count_xml_elt][3] = $item->item_url;
							$array_xml[$count_xml_elt][4] = $item->item_admin_url;
							$array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);
							$array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);
							$array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);
							$array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);
							$array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);
						$count_xml_elt++;
						}
						foreach ($array_xml as $key => $row) {
						    $category[$key]  = $row['0'];
						    $item_name[$key] = $row['1'];
						    $item_desc[$key] = $row['2'];
						    $item_url[$key] = $row['3'];
						    $item_admin_url[$key] = $row['4'];



						}
						array_multisort($category, SORT_ASC, $item_name, SORT_ASC, $array_xml);
						
?>
			
<?php if ( !isset($_GET['queries'])) {?>
	
        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
			<h1><?php the_time('d M y'); ?> <a id="post-<?php the_ID(); ?>" href="<?php the_permalink(); ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h1>       
			<?php the_content(); ?>
			<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
			<?php if (function_exists('the_tags')) { ?>
			<?php the_tags('<p>Tags: ', ', ', '</p>'); ?>
			<?php } ?>
            
			<div class="postmeta"><?php edit_post_link('Edit this page'); ?></div>
            
		

		<?php endwhile; ?>

		
		<?php endif; 						
					
						$prev_category = "";
						for($count_boucle=0; $count_boucle <= $count_xml_elt ; $count_boucle++) {
							$category= $array_xml[$count_boucle][0];
							if ("$prev_category" != "$category"){
								echo "<h3><a name=\"".$count_boucle."\"></a>".$category."</h3><br>\n";
							}
							$prev_category = $category;
							$name = $array_xml[$count_boucle][1];
							$desc = $array_xml[$count_boucle][2];
							$url = $array_xml[$count_boucle][3];
							$admin_url =$array_xml[$count_boucle][4];
							$url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $url);
							$admin_url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $admin_url);

							echo "<b>".$name."</b><br>\n";
							echo "<a href=\"".$url."\">".$url."</a>";
							if ($admin_url) {
								echo " | <a href=\"".$admin_url."\">admin</a>\n";
							}
							echo "<br><br><br>\n";
							
        					}

			?></div><?php	} else {?>

<hr width="20%">
<a href="/">Home</a><br></div>
<?php } ?> 		
		
	
<div class='sidebar span-8 last'>

			
        <div class='sidebarboxtop'><img src="<?php bloginfo('template_url') ?>/images/sidebartop.gif" alt="sidebartop" /></div>
        <div class='sidebarbox'>
            <h3>Applications</h3>
            <ul>	
                <?php $prev_category = "";
						
						for($count_boucle=0; $count_boucle < $count_xml_elt ; $count_boucle++) {
							$category= $array_xml[$count_boucle][0];
							if ("$prev_category" != "$category"){
								echo "<li><a href=\"/#".$count_boucle."\">".$category."</a></li>\n";
								
							}
							$prev_category = $category;
						} ?>				
            </ul>
        </div>
       
        <div class='sidebarboxtop'><img src="<?php bloginfo('template_url') ?>/images/sidebartop.gif" alt="sidebartop" /></div>
        <div class='sidebarbox'>
                <?php wp_list_bookmarks(array('title_before' => '<h3>', 'title_after' => '</h3>',	'category_before' => '', 'category_after' => '')); ?>
        </div>
        <div class='sidebarboxbottom'><img src="<?php bloginfo('template_url') ?>/images/sidebarbottom.gif" alt="sidebarbottom" /></div>
        
        <div class='sidebarboxtop'><img src="<?php bloginfo('template_url') ?>/images/sidebartop.gif" alt="sidebartop" /></div>
        <div class='sidebarbox'>
			<?php if (function_exists('wp_tag_cloud')) { ?>
            <h3>Tag Cloud</h3>
            <? wp_tag_cloud(); ?>
            <?php } ?>
        </div>
        <div class='sidebarboxbottom'><img src="<?php bloginfo('template_url') ?>/images/sidebarbottom.gif" alt="sidebarbottom" /></div>
		
    </div>

<?php get_footer(); ?>
