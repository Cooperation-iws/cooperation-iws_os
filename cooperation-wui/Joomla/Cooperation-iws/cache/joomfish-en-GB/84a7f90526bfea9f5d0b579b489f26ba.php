<?php die("Access Denied"); ?>
a:2:{s:6:"output";s:0:"";s:6:"result";a:3:{i:0;O:8:"stdClass":32:{s:2:"id";s:1:"1";s:5:"title";s:26:"Welcome to Cooperation-iws";s:5:"alias";s:26:"welcome-to-cooperation-iws";s:11:"title_alias";s:0:"";s:9:"introtext";s:10295:"<h3>Cooperation-iws is an Intranet Nomad Web Server project:</h3> <ol><li> A <strong>web</strong> <strong>server</strong>, to provide hosting services of web applications (Blog - words processor, Wiki, Forum, Electronic Documents Management, Pictures galleries - Pictures manipulation, eLearning portal, …) for collaborative work that contributes to knowledge management and/or knowledge engineering.</li><li><strong> Intranet</strong>, to provide these services where you want: at home, at association meetings, at professional meetings without requiring an internet connection or without the volonty to publish personnal items on the web .</li><li><strong> Nomad</strong>, to bring these services with you, on a cd/dvd, usb key, or usb hard drive.</li></ol><br /><h3>Cooperation-iws is distributed for free and under open source licence.</h3><p>&nbsp;</p><p> <br /><br />&lt;?php $tree = simplexml_load_file('../cooperation-wui.xml');<br />                        $count_xml_elt=0;<br />                        foreach($tree-&gt;item as $item) {    <br />                            $array_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);<br />                            $array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);<br />                            $array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);<br />                            $array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);<br />                            $array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_xml as $key =&gt; $row) {<br />                            $category[$key]  = $row['0'];<br />                            $item_name[$key] = $row['1'];<br />                            $item_desc[$key] = $row['2'];<br />                            $item_url[$key] = $row['3'];<br />                            $item_admin_url[$key] = $row['4'];<br /><br /><br /><br />                        }<br />                        array_multisort($category, SORT_ASC, $item_name, SORT_ASC, $array_xml);<br /><br />?&gt;</p><h1>Applications</h1><p>&lt;?php<br /><br />                       $prev_category = "";<br />                        for($count_boucle=0; $count_boucle &lt;= $count_xml_elt ; $count_boucle++) {<br />                            $category= $array_xml[$count_boucle][0];<br />                            if ("$prev_category" != "$category"){<br />                                echo "&lt;h3&gt;&lt;a name=\"".$count_boucle."\"&gt;&lt;/a&gt;".$category."&lt;/h3&gt;&lt;br&gt;\n";<br />                            }<br />                            $prev_category = $category;<br />                            $name = $array_xml[$count_boucle][1];<br />                            $desc = $array_xml[$count_boucle][2];<br />                            $url = $array_xml[$count_boucle][3];<br />                            $admin_url =$array_xml[$count_boucle][4];<br />                            $url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $url);<br />                            $admin_url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\n";<br />                            echo "&lt;a href=\"".$url."\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\"".$admin_url."\"&gt;admin&lt;/a&gt;\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt; <br />&lt;?php $tree_admin = simplexml_load_file('../admin/cooperation-wui.xml');<br />                        $count_xml_elt=0;<br />                        foreach($tree_admin-&gt;item as $item) {    <br />                            $array_admin_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_admin_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_admin_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_admin_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_admin_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_admin_xml[$count_xml_elt][0] = strval($array_admin_xml[$count_xml_elt][0]);<br />                            $array_admin_xml[$count_xml_elt][1] = strval($array_admin_xml[$count_xml_elt][1]);<br />                            $array_admin_xml[$count_xml_elt][2] = strval($array_admin_xml[$count_xml_elt][2]);<br />                            $array_admin_xml[$count_xml_elt][3] = strval($array_admin_xml[$count_xml_elt][3]);<br />                            $array_admin_xml[$count_xml_elt][4] = strval($array_admin_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_admin_xml as $key_admin =&gt; $row_admin) {<br />                            $item_admin_category[$key_admin]  = $row_admin['0'];<br />                            $item_admin_name[$key_admin] = $row_admin['1'];<br />                            $item_admin_desc[$key_admin] = $row_admin['2'];<br />                            $item_url[$key_admin] = $row_admin['3'];<br />                            $item_admin_admin_url[$key_admin] = $row_admin['4'];<br /><br /><br /><br />                        }<br />                        array_multisort($item_admin_category, SORT_ASC, $item_admin_name, SORT_ASC, $array_admin_xml);<br /><br />?&gt;</p><h1>Administration</h1><p>&nbsp;</p><p>&lt;?php<br /><br />                       $prev_admin_category = "";</p><p>&nbsp;</p><p>                        for($count_boucle_admin=0; $count_boucle_admin &lt;= $count_xml_elt ; $count_boucle_admin++) {<br />                            $category_admin= $array_admin_xml[$count_boucle_admin][0];<br />                            if ("$prev_admin_category" != "$category_admin"){<br />                                echo "&lt;h3&gt;&lt;a name=\"admin_".$count_boucle_admin."\"&gt;&lt;/a&gt;".$category_admin."&lt;/h3&gt;&lt;br&gt;\n";<br />                            }<br />                            $prev_admin_category = $category_admin;<br />                            $name = $array_admin_xml[$count_boucle_admin][1];<br />                            $desc = $array_admin_xml[$count_boucle_admin][2];<br />                            $url = $array_admin_xml[$count_boucle_admin][3];<br />                            $admin_url =$array_admin_xml[$count_boucle_admin][4];<br />                            $url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $url);<br />                            $admin_url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\n";<br />                            echo "&lt;a href=\"".$url."\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\"".$admin_url."\"&gt;admin&lt;/a&gt;\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt;         </p>";s:8:"fulltext";s:0:"";s:5:"state";s:1:"1";s:9:"sectionid";s:1:"1";s:4:"mask";s:1:"0";s:5:"catid";s:1:"1";s:7:"created";s:19:"2006-10-12 10:00:00";s:10:"created_by";s:2:"62";s:16:"created_by_alias";s:0:"";s:8:"modified";s:19:"2008-10-20 15:03:21";s:11:"modified_by";s:2:"62";s:11:"checked_out";s:2:"62";s:16:"checked_out_time";s:19:"2008-10-20 15:03:21";s:10:"publish_up";s:19:"2006-01-03 01:00:00";s:12:"publish_down";s:19:"0000-00-00 00:00:00";s:6:"images";s:0:"";s:4:"urls";s:0:"";s:7:"attribs";s:231:"show_title=
link_titles=
show_intro=
show_section=
link_section=
show_category=
link_category=
show_vote=
show_author=
show_create_date=
show_modify_date=
show_pdf_icon=
show_print_icon=
show_email_icon=
language=
keyref=
readmore=";s:7:"version";s:2:"41";s:8:"parentid";s:1:"0";s:8:"ordering";s:1:"1";s:7:"metakey";s:0:"";s:8:"metadesc";s:0:"";s:6:"access";s:1:"0";s:4:"hits";s:2:"93";s:8:"metadata";s:15:"robots=
author=";s:4:"slug";s:28:"1:welcome-to-cooperation-iws";s:7:"catslug";s:13:"1:latest-news";}i:1;O:8:"stdClass":32:{s:2:"id";s:1:"4";s:5:"title";s:19:"Ciws 0.5.2 released";s:5:"alias";s:11:"newsflash-3";s:11:"title_alias";s:0:"";s:9:"introtext";s:147:"Cooperation-iws 0.5.2 released ! Check the new features on <a href="http://cooperation-iws.gensys-net.eu">http://cooperation-iws.gensys-net.eu</a>.";s:8:"fulltext";s:0:"";s:5:"state";s:1:"1";s:9:"sectionid";s:1:"1";s:4:"mask";s:1:"0";s:5:"catid";s:1:"3";s:7:"created";s:19:"2004-08-10 06:30:34";s:10:"created_by";s:2:"62";s:16:"created_by_alias";s:0:"";s:8:"modified";s:19:"2008-10-20 13:07:03";s:11:"modified_by";s:2:"62";s:11:"checked_out";s:1:"0";s:16:"checked_out_time";s:19:"0000-00-00 00:00:00";s:10:"publish_up";s:19:"2004-08-09 10:00:00";s:12:"publish_down";s:19:"0000-00-00 00:00:00";s:6:"images";s:0:"";s:4:"urls";s:0:"";s:7:"attribs";s:231:"show_title=
link_titles=
show_intro=
show_section=
link_section=
show_category=
link_category=
show_vote=
show_author=
show_create_date=
show_modify_date=
show_pdf_icon=
show_print_icon=
show_email_icon=
language=
keyref=
readmore=";s:7:"version";s:2:"10";s:8:"parentid";s:1:"0";s:8:"ordering";s:1:"5";s:7:"metakey";s:0:"";s:8:"metadesc";s:0:"";s:6:"access";s:1:"0";s:4:"hits";s:1:"1";s:8:"metadata";s:15:"robots=
author=";s:4:"slug";s:13:"4:newsflash-3";s:7:"catslug";s:11:"3:newsflash";}i:2;O:8:"stdClass":32:{s:2:"id";s:2:"28";s:5:"title";s:31:"How do I install a Ciws server?";s:5:"alias";s:28:"how-do-i-install-ciws-server";s:11:"title_alias";s:0:"";s:9:"introtext";s:736:"<p>Installing of Ciws server 0.5.2 is pretty easy. <br /><br />Download the iso image of a ciws server flavour, burn it and boot it.To install on Usb device, click on the Live Usb installer icon on the desktop.</p><p>You should get the following screen: </p><p>&nbsp;</p><div style="text-align: center"><img src="http://cooperation-iws.gensys-net.eu/wiki/lib/exe/fetch.php?w=&h=&cache=cache&media=screenshots:en:capture-live-usb.png" border="0" width="514" height="450" /></div><p>&nbsp;</p><p>&nbsp;</p><p>Choose your usb device in the target device field, click on the right icon to detect it if not detected.</p><p>Choose  what kind of persistent partition you need (ciws-rw for server) and click on execute !</p><p> That's it. </p>";s:8:"fulltext";s:0:"";s:5:"state";s:1:"1";s:9:"sectionid";s:1:"3";s:4:"mask";s:1:"0";s:5:"catid";s:2:"31";s:7:"created";s:19:"2006-10-11 01:10:59";s:10:"created_by";s:2:"62";s:16:"created_by_alias";s:0:"";s:8:"modified";s:19:"2008-10-20 12:49:47";s:11:"modified_by";s:2:"62";s:11:"checked_out";s:1:"0";s:16:"checked_out_time";s:19:"0000-00-00 00:00:00";s:10:"publish_up";s:19:"2006-10-10 06:00:00";s:12:"publish_down";s:19:"0000-00-00 00:00:00";s:6:"images";s:0:"";s:4:"urls";s:0:"";s:7:"attribs";s:231:"show_title=
link_titles=
show_intro=
show_section=
link_section=
show_category=
link_category=
show_vote=
show_author=
show_create_date=
show_modify_date=
show_pdf_icon=
show_print_icon=
show_email_icon=
language=
keyref=
readmore=";s:7:"version";s:1:"8";s:8:"parentid";s:1:"0";s:8:"ordering";s:1:"5";s:7:"metakey";s:0:"";s:8:"metadesc";s:0:"";s:6:"access";s:1:"0";s:4:"hits";s:1:"8";s:8:"metadata";s:15:"robots=
author=";s:4:"slug";s:31:"28:how-do-i-install-ciws-server";s:7:"catslug";s:10:"31:general";}}}