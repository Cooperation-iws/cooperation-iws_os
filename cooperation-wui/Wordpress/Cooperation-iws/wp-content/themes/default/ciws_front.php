<?php
/*
Template Name: Ciws
*/
?>

<?php get_header(); ?>

	<div id="content" class="narrowcolumn">
		<div class="post" id="post-1">
		<?php include('../Sphider/index.php'); ?>
		</div>
			
<?php if ( !isset($_GET['queries'])) {?>
	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
		<div class="post" id="post-<?php the_ID(); ?>">
		<h2><?php the_title(); ?></h2>
			<div class="entry">
				<?php the_content('<p class="serif">Read the rest of this page &raquo;</p>'); ?>

				<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>

			</div>
		
		<?php endwhile; endif; ?>
	<?php edit_post_link('Edit this entry.', '<p>', '</p>'); ?></div>
		<div class="post" id="post-3">
			
					
					<?php $tree = simplexml_load_file('../cooperation-wui.xml');

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
						echo "<br>\n";
        					}


			?></div><?php	} else {?>
<hr width="20%">
<a href="/">Home</a><br>
<?php } ?> 		
		
	</div>
<?php get_sidebar(); ?>

<?php get_footer(); ?>
