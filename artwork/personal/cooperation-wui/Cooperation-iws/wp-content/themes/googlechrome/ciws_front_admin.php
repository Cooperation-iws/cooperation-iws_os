<?php
/*
Template Name: CiwsAdmin
*/
?>

<?php get_header(); ?>

	
	<div class='content span-16'>
        <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
			<h1><?php the_time('d M y'); ?> <a id="post-<?php the_ID(); ?>" href="<?php the_permalink(); ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h1>       
			<?php the_content(); ?>
			<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
			<?php if (function_exists('the_tags')) { ?>
			<?php the_tags('<p>Tags: ', ', ', '</p>'); ?>
			<?php } ?>
            <div style="clear:both;"></div>
			<div class="postmeta"><?php edit_post_link('Edit this page'); ?></div>
            
		

		<?php endwhile; ?>

		
		<?php endif; ?>
			<div style="clear:both"></div>
			<div class="navigation">
			</div>
  
			
					
					<?php $tree = simplexml_load_file('../admin/cooperation-wui.xml');

							
					
					
						$i=0;
						foreach($tree->item as $item) {	
							$array[$i][0] = $item->item_category;							
							$array[$i][1] = $item->item_name;
							$array[$i][2] = $item->item_desc;
							$array[$i][3] = $item->item_url;
							$array[$i][4] = $item->item_admin_url;
							$array[$i][0] = strval($array[$i][0]);
							$array[$i][1] = strval($array[$i][1]);
							$array[$i][2] = strval($array[$i][2]);
							$array[$i][3] = strval($array[$i][3]);
							$array[$i][4] = strval($array[$i][4]);
						$i++;
						}
						foreach ($array as $key => $row) {
						    $category[$key]  = $row['0'];
						    $item_name[$key] = $row['1'];
						    $item_desc[$key] = $row['2'];
						    $item_url[$key] = $row['3'];
						    $item_admin_url[$key] = $row['4'];



						}
						array_multisort($category, SORT_ASC, $item_name, SORT_ASC, $array);
						
						
					
						$prev_category = "";
						for($j=0; $j <= $i ; $j++) {
							$category= $array[$j][0];
							if ("$prev_category" != "$category"){
								echo "<h3><a name=\"".$j."\"></a>".$category."</h3><br>\n";
							}
							$prev_category = $category;
							$name = $array[$j][1];
							$desc = $array[$j][2];
							$url = $array[$j][3];
							$admin_url =$array[$j][4];
							$url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $url);
							$admin_url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $admin_url);

							echo "<b>".$name."</b><br>\n";
							echo "<a href=\"".$url."\">".$url."</a>";
							if ($admin_url) {
								echo " | <a href=\"".$admin_url."\">admin</a>\n";
							}
							echo "<br><br><br>\n";
							
        					}

			?></div>


			
		
	
<div class='sidebar span-8 last'>

			
        <div class='sidebarboxtop'><img src="<?php bloginfo('template_url') ?>/images/sidebartop.gif" alt="sidebartop" /></div>
        <div class='sidebarbox'>
            <h3>Applications</h3>
            <ul>	
                <?php $prev_category = "";
						
						for($j=0; $j < $i ; $j++) {
							$category= $array[$j][0];
							if ("$prev_category" != "$category"){
								echo "<li><a href=\"/#".$j."\">".$category."</a></li>\n";
								
							}
							$prev_category = $category;
							

							
							
							
							
							
        					} ?>				
            </ul>
        </div>
        <div class='sidebarboxbottom'><img src="<?php bloginfo('template_url') ?>/images/sidebarbottom.gif" alt="sidebarbottom" /></div>
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
