<?php die("Access Denied"); ?>
a:2:{s:6:"output";s:0:"";s:6:"result";a:3:{i:0;O:8:"stdClass":35:{s:2:"id";s:2:"47";s:5:"title";s:17:"Applications list";s:11:"title_alias";s:0:"";s:9:"introtext";s:2622:"<pre><br />&lt;?php</pre><pre><br /></pre><pre><br /></pre><pre><br /></pre><pre>                                                $tree = simplexml_load_file('../cooperation-wui.xml');<br />						$count_xml_elt=0;<br />						foreach($tree-&gt;item as $count_xml_elttem) {	<br />							$array_xml[$count_xml_elt][0] = $count_xml_elttem-&gt;item_category;							<br />							$array_xml[$count_xml_elt][1] = $count_xml_elttem-&gt;item_name;<br />							$array_xml[$count_xml_elt][2] = $count_xml_elttem-&gt;item_desc;<br />							$array_xml[$count_xml_elt][3] = $count_xml_elttem-&gt;item_url;<br />							$array_xml[$count_xml_elt][4] =$count_xml_elttem-&gt;item_admin_url;<br />							$array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);<br />							$array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);<br />							$array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);<br />							$array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);<br />							$array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);<br />						$count_xml_elt++;<br />						}<br />						foreach ($array_xml as $key =&gt; $row) {<br />						    $category[$key]  = $row['0'];<br />						    $count_xml_elttem_name[$key] = $row['1'];<br />						    $count_xml_elttem_desc[$key] = $row['2'];<br />						    $count_xml_elttem_url[$key] = $row['3'];<br />						    $count_xml_elttem_admin_url[$key] = $row['4'];<br />						}<br />						array_multisort($category, SORT_ASC, $count_xml_elttem_name, SORT_ASC, $array_xml);</pre><pre><br />						$prev_category = "";<br />						for($j=0; $j &lt;= $count_xml_elt ; $j++) {<br />							$category= $array_xml[$j][0];<br />							if ("$prev_category" != "$category"){<br />								echo "&lt;h3&gt;&lt;a name=\"".$j."\"&gt;&lt;/a&gt;".$category."&lt;/h3&gt;\n";<br />							}<br />							$prev_category = $category;<br />							$name = $array_xml[$j][1];<br />							$desc = $array_xml[$j][2];<br />							$url = $array_xml[$j][3];<br />							$admin_url =$array_xml[$j][4];<br />							$url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $url);<br />							$admin_url = str_replace ('localhost', $HTTP_SERVER_VARS["SERVER_NAME"], $admin_url);<br /><br />							echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\n";<br />							echo "&lt;a href=\"".$url."\"&gt;".$url."&lt;/a&gt;";<br />							if ($admin_url) {<br />								echo " | &lt;a href=\"".$admin_url."\"&gt;admin&lt;/a&gt;\n";<br />							}<br />							echo "&lt;br&gt;\n";<br />							<br />        					}</pre><pre><br />?&gt;<br /><br /></pre><br /><pre> </pre>";s:8:"fulltext";s:0:"";s:9:"sectionid";s:1:"0";s:5:"state";s:1:"1";s:5:"catid";s:1:"0";s:7:"created";s:19:"2008-10-19 16:49:11";s:10:"created_by";s:2:"62";s:16:"created_by_alias";s:0:"";s:8:"modified";s:19:"2008-10-19 19:11:43";s:11:"modified_by";s:2:"62";s:11:"checked_out";s:2:"62";s:16:"checked_out_time";s:19:"2008-10-19 19:11:43";s:10:"publish_up";s:19:"2008-10-19 16:49:11";s:12:"publish_down";s:19:"0000-00-00 00:00:00";s:6:"images";s:0:"";s:7:"attribs";s:231:"show_title=
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
readmore=";s:4:"urls";s:0:"";s:7:"metakey";s:0:"";s:8:"metadesc";s:0:"";s:6:"access";s:1:"0";s:4:"slug";s:20:"47:applications-list";s:7:"catslug";N;s:8:"readmore";s:1:"0";s:6:"author";s:13:"Administrator";s:8:"usertype";s:19:"Super Administrator";s:6:"groups";s:6:"Public";s:8:"category";N;s:7:"section";N;s:10:"s_ordering";N;s:11:"cc_ordering";N;s:10:"a_ordering";s:1:"1";s:10:"f_ordering";s:1:"1";}i:1;O:8:"stdClass":35:{s:2:"id";s:1:"1";s:5:"title";s:18:"Welcome to Joomla!";s:11:"title_alias";s:0:"";s:9:"introtext";s:770:"<div align="left"><strong>Joomla! is a free open source framework and content publishing system designed for quickly creating highly interactive multi-language Web sites, online communities, media portals, blogs and eCommerce applications. <br /></strong></div><p><strong><br /></strong><img src="images/stories/powered_by.png" border="0" alt="Joomla! Logo" title="Example Caption" hspace="6" vspace="0" width="165" height="68" align="left" />Joomla! provides an easy-to-use graphical user interface that simplifies the management and publishing of large volumes of content including HTML, documents, and rich media.  Joomla! is used by organisations of all sizes for Public Web sites, Intranets, and Extranets and is supported by a community of thousands of users. </p>";s:8:"fulltext";s:1140:"With a fully documented library of developer resources, Joomla! allows the customisation of every aspect of a Web site including presentation, layout, administration, and the rapid integration with third-party applications.<p>Joomla! has a rich heritage and has been crowned CMS king many times over.  Now with more power under the hood, Joomla! is shifting gear and provides developer power while making the user experience all the more friendly.  For those who always wanted increased extensibility, Joomla! 1.5 can make this happen.</p><p>A new framework, ground-up refactoring, and a highly-active development team brings the excitement of 'the next generation CMS' to your fingertips.  Whether you are a systems architect or a complete 'noob' Joomla! can take you to the next level of content delivery. 'More than a CMS' is something we have been playing with as a catchcry because the new Joomla! API has such incredible power and flexibility, you are free to take whatever direction your creative mind takes you and Joomla! can help you get there so much more easily than ever before.</p><p>Thinking Web publishing? Think Joomla!</p>";s:9:"sectionid";s:1:"1";s:5:"state";s:1:"1";s:5:"catid";s:1:"1";s:7:"created";s:19:"2006-10-12 10:00:00";s:10:"created_by";s:2:"62";s:16:"created_by_alias";s:0:"";s:8:"modified";s:19:"2007-11-08 12:06:35";s:11:"modified_by";s:2:"62";s:11:"checked_out";s:2:"62";s:16:"checked_out_time";s:19:"2008-10-19 15:20:50";s:10:"publish_up";s:19:"2006-01-03 01:00:00";s:12:"publish_down";s:19:"0000-00-00 00:00:00";s:6:"images";s:0:"";s:7:"attribs";s:231:"show_title=
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
readmore=";s:4:"urls";s:0:"";s:7:"metakey";s:0:"";s:8:"metadesc";s:0:"";s:6:"access";s:1:"0";s:4:"slug";s:19:"1:welcome-to-joomla";s:7:"catslug";s:13:"1:latest-news";s:8:"readmore";s:4:"1140";s:6:"author";s:13:"Administrator";s:8:"usertype";s:19:"Super Administrator";s:6:"groups";s:6:"Public";s:8:"category";s:6:"Latest";s:7:"section";s:4:"News";s:10:"s_ordering";s:1:"3";s:11:"cc_ordering";s:1:"1";s:10:"a_ordering";s:1:"1";s:10:"f_ordering";s:1:"2";}i:2;O:8:"stdClass":35:{s:2:"id";s:2:"45";s:5:"title";s:30:"Joomla Community Portal Online";s:11:"title_alias";s:0:"";s:9:"introtext";s:687:"<p>The new <a href="http://community.joomla.org/">Joomla Community Portal</a> is now online. The Joomla Community Portal is a new web site for the Joomla community. There you will find a constant source of information about the activities powering the Joomla Project, learn about <a href="http://community.joomla.org/events.html">Joomla Events</a> worldwide, and see if there is a <a href="http://community.joomla.org/joomla-user-groups.html">Joomla User Group</a> nearby. A new, monthly <a href="http://community.joomla.org/magazine.html">Joomla Community Magazine</a> promises an interesting overview of project activities, community accomplishments, and learning material.</p>";s:8:"fulltext";s:582:"<p>The <a href="http://community.joomla.org/magazine.html">Joomla Community Magazine</a> promises to be a must read each month. Community members will take turns sharing cool Joomla 1.5 Web sites, Joomla 1.5 GPL extensions, event information, involvement opportunities, and articles about local communities.</p> <p>The new <a href="http://community.joomla.org/connect.html">JoomlaConnect™</a> brings together tons of Joomla news from all over the world in your language. Get the latest and greatest by clicking <a href="http://community.joomla.org/connect.html">here</a>.</p>";s:9:"sectionid";s:1:"1";s:5:"state";s:1:"1";s:5:"catid";s:1:"1";s:7:"created";s:19:"2004-07-07 09:54:06";s:10:"created_by";s:2:"62";s:16:"created_by_alias";s:0:"";s:8:"modified";s:19:"2008-08-31 04:21:50";s:11:"modified_by";s:2:"62";s:11:"checked_out";s:2:"62";s:16:"checked_out_time";s:19:"2008-10-19 08:36:08";s:10:"publish_up";s:19:"2004-07-06 22:00:00";s:12:"publish_down";s:19:"0000-00-00 00:00:00";s:6:"images";s:0:"";s:7:"attribs";s:231:"show_title=
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
readmore=";s:4:"urls";s:0:"";s:7:"metakey";s:0:"";s:8:"metadesc";s:0:"";s:6:"access";s:1:"0";s:4:"slug";s:33:"45:joomla-community-portal-online";s:7:"catslug";s:13:"1:latest-news";s:8:"readmore";s:3:"575";s:6:"author";s:13:"Administrator";s:8:"usertype";s:19:"Super Administrator";s:6:"groups";s:6:"Public";s:8:"category";s:6:"Latest";s:7:"section";s:4:"News";s:10:"s_ordering";s:1:"3";s:11:"cc_ordering";s:1:"1";s:10:"a_ordering";s:1:"2";s:10:"f_ordering";s:1:"3";}}}