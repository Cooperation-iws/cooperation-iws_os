<?php
/*
Template Name: CiwsAdmin
*/
?>

<?php get_header(); ?>

	<div id="content" class="narrowcolumn">
			

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
			
					
					<?php $xml_file="cooperation-wui.xml";
 		$tree_admin = simplexml_load_file('../admin/'.$xml_file);
                        $count_xml_elt=0;
                        foreach($tree_admin->item as $item) {   
                            $array_admin_xml[$count_xml_elt][0] = $item->item_category;
                            $array_admin_xml[$count_xml_elt][1] = $item->item_name;
                            $array_admin_xml[$count_xml_elt][2] = $item->item_desc;
                            $array_admin_xml[$count_xml_elt][3] = $item->item_url;
                            $array_admin_xml[$count_xml_elt][4] = $item->item_admin_url;
                            $array_admin_xml[$count_xml_elt][0] = strval($array_admin_xml[$count_xml_elt][0]);
                            $array_admin_xml[$count_xml_elt][1] = strval($array_admin_xml[$count_xml_elt][1]);
                            $array_admin_xml[$count_xml_elt][2] = strval($array_admin_xml[$count_xml_elt][2]);
                            $array_admin_xml[$count_xml_elt][3] = strval($array_admin_xml[$count_xml_elt][3]);
                            $array_admin_xml[$count_xml_elt][4] = strval($array_admin_xml[$count_xml_elt][4]);
                        $count_xml_elt++;
                        }
                        foreach ($array_admin_xml as $key_admin => $row_admin) {
                            $item_admin_category[$key_admin]  = $row_admin['0'];
                            $item_admin_name[$key_admin] = $row_admin['1'];
                            $item_admin_desc[$key_admin] = $row_admin['2'];
                            $item_url[$key_admin] = $row_admin['3'];
                            $item_admin_admin_url[$key_admin] = $row_admin['4'];



                        }
                        array_multisort($item_admin_category, SORT_ASC, $item_admin_name, SORT_ASC, $array_admin_xml);

?>
Administration

 

<?php

                       $prev_admin_category = "";

 

                        for($count_boucle_admin=0; $count_boucle_admin <= $count_xml_elt ; $count_boucle_admin++) {
                            $category_admin= $array_admin_xml[$count_boucle_admin][0];
                            if ("$prev_admin_category" != "$category_admin"){
                                echo "<hr><br>\n<h3><a name=\"admin_".$count_boucle_admin."\"></a>".$category_admin."</h3><br>\n";
                            }
                            $prev_admin_category = $category_admin;
                            $name = $array_admin_xml[$count_boucle_admin][1];
                            $desc = $array_admin_xml[$count_boucle_admin][2];
                            $url = $array_admin_xml[$count_boucle_admin][3];
                            $admin_url =$array_admin_xml[$count_boucle_admin][4];
                            $url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $url);
                            $admin_url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $admin_url);

                            echo "<b>".$name."</b><br>\n";
                            echo $desc."<br><br>\n";
                            echo "<a href=\"".$url."\">".$url."</a>";
                            if ($admin_url) {
                                echo " | <a href=\"".$admin_url."\">admin</a>\n";
                            }
                            echo "<br><br><br>\n";

                            }

       


 ?>         
</div>
		
	</div>
<div id="sidebar">
		
<li><h2>Applications</h2>			
<ul>	
                <?php $prev_category = "";
						
						for( $j=0;$j < $count_xml_elt ; $j++) {
							$category= $array_admin_xml[$j][0];
							if ("$prev_category" != "$category"){
								echo "<li><a href=\"/#admin_".$j."\">".$category."</a></li>\n";
								
							}
							$prev_category = $category;
						} ?>						
            </ul>
</li>		

			<?php wp_list_pages('title_li=<h2>Pages</h2>' ); ?>

			

			<?php wp_list_categories('show_count=1&title_li=<h2>Categories</h2>'); ?>

			

			
		</ul>
	</div>

<?php get_footer(); ?>
