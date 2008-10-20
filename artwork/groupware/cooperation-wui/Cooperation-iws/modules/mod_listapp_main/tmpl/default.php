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

            ?>