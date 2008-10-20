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

						$prev_category = "";
						foreach($tree->item as $item) {
						$category= $item->item_category;
						if ("$prev_category" != "$category"){
							echo "<h3>".$category."</h3><br>\n";
						}
						$prev_category = $category;
						$name = $item->item_name;
						$desc = $item->item_desc;
						$url = $item->item_url;
						$admin_url =$item->item_admin_url;

						echo "<b>".$name."</b><br>\n";
						echo "<a href=\"".$url."\">".$url."</a>";
						if ($admin_url) {
							echo " | <a href=\"".$admin_url."\">admin</a>\n";
						}
						echo "<br><br><br>\n";
        					}


			?></div>
		
	
<?php get_sidebar(); ?>

<?php get_footer(); ?>
