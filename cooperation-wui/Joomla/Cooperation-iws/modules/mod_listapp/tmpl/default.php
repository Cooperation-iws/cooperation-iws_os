<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>
<?php $xml_file = strval($params->get('xml_file'));

?>


<?php $tree = simplexml_load_file('../'.$xml_file);
						$count_xml_elt=0;
						foreach($tree->item as $item) {	
							$array_xml[$count_xml_elt][0] = $item->item_category;							
							$array_xml[$count_xml_elt][1] = $item->item_name;
							$array_xml[$count_xml_elt][2] = $item->item_desc;
							$array_xml[$count_xml_elt][3] = $item->item_url;
							$array_xml[$count_xml_elt][4] =$item->item_admin_url;
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

            <ul>	
                <?php $prev_category = "";
						
						for($j=0; $j < $count_xml_elt ; $j++) {
							$category= $array_xml[$j][0];
							if ("$prev_category" != "$category"){
								echo "<li><a href=\"/#".$j."\">".$category."</a></li>\n";
								
							}
							$prev_category = $category;
						} ?>				
            </ul>
<center><b>Administration</b></center>
<?php $tree_admin = simplexml_load_file('../admin/'.$xml_file);
						$count_xml_elt=0;
						foreach($tree_admin->item as $item) {	
							$array_admin_xml[$count_xml_elt][0] = $item->item_category;							
							$array_admin_xml[$count_xml_elt][1] = $item->item_name;
							$array_admin_xml[$count_xml_elt][2] = $item->item_desc;
							$array_admin_xml[$count_xml_elt][3] = $item->item_url;
							$array_admin_xml[$count_xml_elt][4] =$item->item_admin_url;
							$array_admin_xml[$count_xml_elt][0] = strval($array_admin_xml[$count_xml_elt][0]);
							$array_admin_xml[$count_xml_elt][1] = strval($array_admin_xml[$count_xml_elt][1]);
							$array_admin_xml[$count_xml_elt][2] = strval($array_admin_xml[$count_xml_elt][2]);
							$array_admin_xml[$count_xml_elt][3] = strval($array_admin_xml[$count_xml_elt][3]);
							$array_admin_xml[$count_xml_elt][4] = strval($array_admin_xml[$count_xml_elt][4]);
						$count_xml_elt++;
						}
						foreach ($array_admin_xml as $key_admin => $row) {
						    $category_admin[$key_admin]  = $row['0'];
						    $item_admin_name[$key_admin] = $row['1'];
						    $item_admin_desc[$key_admin] = $row['2'];
						    $item_admin_url[$key_admin] = $row['3'];
						    $item_admin_admin_url[$key_admin] = $row['4'];



						}
						array_multisort($category_admin, SORT_ASC, $item_admin_name, SORT_ASC, $array_admin_xml);
						
?>

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
