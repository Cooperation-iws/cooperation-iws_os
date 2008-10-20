<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>
<?php $tree = simplexml_load_file('../cooperation-wui.xml');
						$count_xml_elt=0;
						foreach($tree->item as $count_xml_elttem) {	
							$array_xml[$count_xml_elt][0] = $count_xml_elttem->item_category;							
							$array_xml[$count_xml_elt][1] = $count_xml_elttem->item_name;
							$array_xml[$count_xml_elt][2] = $count_xml_elttem->item_desc;
							$array_xml[$count_xml_elt][3] = $count_xml_elttem->item_url;
							$array_xml[$count_xml_elt][4] =$count_xml_elttem->item_admin_url;
							$array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);
							$array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);
							$array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);
							$array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);
							$array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);
						$count_xml_elt++;
						}
						foreach ($array_xml as $key => $row) {
						    $category[$key]  = $row['0'];
						    $count_xml_elttem_name[$key] = $row['1'];
						    $count_xml_elttem_desc[$key] = $row['2'];
						    $count_xml_elttem_url[$key] = $row['3'];
						    $count_xml_elttem_admin_url[$key] = $row['4'];



						}
						array_multisort($category, SORT_ASC, $count_xml_elttem_name, SORT_ASC, $array_xml);
						
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