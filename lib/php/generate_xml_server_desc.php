#!/usr/bin/php5
<?php
#
#
# USAGE: . generate_xml_server_desc.php "Destination folder" "Module name Module Version" "Main url" "Admin url"
#


global $lang;
$dir=dirname(__FILE__) ;
$server_content_xml="content-data-server.xml";
$dir_output=$argv[1];
$app_name=$argv[2];
$main_url=$argv[3];
$admin_url=$argv[4];

$lang="en";

#-------------Translate function --------------------#

function _Lang($content, $lang) {

$language_file="ciws-lang-".$lang.".xml";

$return=strval($content);
if (strval($content) != "") {

	if (preg_match("/".strval($lang).".xml/", $language_file)) {
		
		$array_language=parse_xml_language_file($language_file);
		
		for ($count_elt=0; $count_elt < sizeof($array_language[0][0]); $count_elt++)
			{
			

			if (strval($array_language[0][0][$count_elt][0]) == strval($content))
				{
				$return=$array_language[0][0][$count_elt][1];
			
				$find="ok";
				break;
	
				}
			}
	

}
}


return $return;
}


#-------------xml localization file parser function --------------------#

function parse_xml_language_file($xml_file) {
$tree = simplexml_load_file($xml_file);
                
			foreach ($tree->params as $params_item) {			
				$count_xml_param=0; 
				foreach ($params_item->param as $param_item) {
					$array_xml[0][0][$count_xml_param][0] = $param_item->param_id;
					$array_xml[0][0][$count_xml_param][1] = $param_item->param_translation;
					$count_xml_param++;
				}  
			} 

return $array_xml;
}


#-------------Verify file is valid xml content function --------------------#

function is_xml_content($template_file) {
global $message;
global $lang;
	$xml_parser = xml_parser_create();
	$fp = fopen($template_file,"r");
	$xml_error=0;
	while ($data = fread($fp, 20480))
	try {
		if ( ! ( xml_parse($xml_parser, $data, feof($fp)))) {
			$xml_error=1;
		       throw new Exception (_Lang("This file is not xml file", $lang));
		} else {
			$message=$message._Lang("This file is valid xml", $lang)."<br>\n";}
		}
	catch (Exception $e)
		{
		$message=$message._Lang("ERROR:", $lang).' ' . $e->getMessage() ."<br>\n";
				}
	fclose($fp);

return $xml_error;
}


#-------------Parse the xml server description file function --------------------#

function parse_xml_app_file($xml_file) {
		$tree = simplexml_load_file($xml_file);
                
		foreach($tree->item as $item) {   
			$array_xml[$count_xml_elt][0] = $item->item_category;
			$array_xml[$count_xml_elt][1] = $item->item_name;
			$array_xml[$count_xml_elt][2] = $item->item_desc;
			$array_xml[$count_xml_elt][3] = $item->item_web;
			$array_xml[$count_xml_elt][4] = $item->item_version;
			$array_xml[$count_xml_elt][5] = $item->item_verbose;
			$array_xml[$count_xml_elt][6] = $item->item_type;
			$array_xml[$count_xml_elt][7] = $item->item_license;
			$array_xml[$count_xml_elt][8] = $item->field_quantity;
			$array_xml[$count_xml_elt][9] = $item->field_default_login;
			$array_xml[$count_xml_elt][10] = $item->field_default_pwd;
			$array_xml[$count_xml_elt][11] = $item->field_exclude;
			$array_xml[$count_xml_elt][12] = $item->field_include;
			$array_xml[$count_xml_elt][13] = $item->field_OS;
			$count_xml_param=0;
			foreach($item->param as $item_param) {
			    $array_xml[$count_xml_elt][30][$count_xml_param][0] = $item_param->field_1_id;
			    $array_xml[$count_xml_elt][30][$count_xml_param][1]  = $item_param->field_1_name;
			    $array_xml[$count_xml_elt][30][$count_xml_param][2]  = $item_param->field_1_value;
			    $array_xml[$count_xml_elt][30][$count_xml_param][3]  = $item_param->field_1_def_content;
			    $array_xml[$count_xml_elt][30][$count_xml_param][4]  = $item_param->field_1_content_check;
			    $count_xml_param ++ ;
			}
			$array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);
			$array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);
			$array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);
			$array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);
			$array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);
			$array_xml[$count_xml_elt][5] = strval($array_xml[$count_xml_elt][5]);
			$array_xml[$count_xml_elt][6] = strval($array_xml[$count_xml_elt][6]);
			$array_xml[$count_xml_elt][7] = strval($array_xml[$count_xml_elt][7]);
			$array_xml[$count_xml_elt][8] = strval($array_xml[$count_xml_elt][8]);
			$array_xml[$count_xml_elt][9] = strval($array_xml[$count_xml_elt][9]);
			$array_xml[$count_xml_elt][10] = strval($array_xml[$count_xml_elt][10]);
			$array_xml[$count_xml_elt][11] = strval($array_xml[$count_xml_elt][11]);
			$array_xml[$count_xml_elt][12] = strval($array_xml[$count_xml_elt][12]);
			$array_xml[$count_xml_elt][13] = strval($array_xml[$count_xml_elt][13]);
			$count_xml_param=0;
			foreach($item->param as $item_param) {                                              
			$array_xml[$count_xml_elt][30][$count_xml_param][0]= strval($array_xml[$count_xml_elt][30][$count_xml_param][0]);
			$array_xml[$count_xml_elt][30][$count_xml_param][1]= strval($array_xml[$count_xml_elt][30][$count_xml_param][1]);
			$array_xml[$count_xml_elt][30][$count_xml_param][2]= strval($array_xml[$count_xml_elt][30][$count_xml_param][2]);
			$array_xml[$count_xml_elt][30][$count_xml_param][3]= strval($array_xml[$count_xml_elt][30][$count_xml_param][3]);
			$array_xml[$count_xml_elt][30][$count_xml_param][4]= strval($array_xml[$count_xml_elt][30][$count_xml_param][4]);
			$count_xml_param ++ ;
			}


			$count_xml_elt++;
		
	
}
                        foreach ($array_xml as $key => $row) {
                            $item_category[$key]  = $row['0'];
                            $item_name[$key] = $row['1'];
                            $item_desc[$key] = $row['2'];
                            $item_web[$key] = $row['3'];
                            $item_version[$key] = $row['4'];
                            $item_verbose[$key] = $row['5'];
                            $item_type[$key]  = $row['6'];
                            $field_license[$key] = $row['7'];
                            $field_number[$key] = $row['8'];
			    $field_default_login[$key]  = $row['9'];
                            $field_default_pwd[$key] = $row['10'];
                            $field_exclude[$key]  = $row['11'];
                            $field_include[$key]  = $row['12'];
                            $field_OS[$key] = $row['13'];
                            $field_params[$key] = $row['30'];
                                               
                          
                        }
                        array_multisort($item_category, SORT_ASC, $item_name, SORT_ASC, $item_version, SORT_ASC, $array_xml);


return $array_xml;
}


#-------------Write I/O file on disk function --------------------#

function write_file($file_path, $file_content) {
	$fh = @fopen($file_path,'wb');
	fwrite($fh, $file_content);
	fclose($fh);
}


#-------------Generate the xml file and write it to disk --------------------#

function generate_xml_server_desc($array_xml_desc, $app_name, $main_url, $admin_url, $dir, $dir_output) {
$xml_files = scandir($dir);

$count_lang=0;

foreach ($xml_files  as $xml_file) {
if (preg_match("/ciws-lang/", $xml_file)) {

$array_file_1=explode("-", $xml_file);
$array_file_2=explode(".", $array_file_1[2]);
$array_lang[$count_lang]=$array_file_2[0];
$count_lang++;
}
}

for ($count_elt_lang=0; $count_elt_lang < sizeof($array_lang); $count_elt_lang++)
{
for ($count_elt=0; $count_elt < sizeof($array_xml_desc); $count_elt++)
			{
			

			if (strval($array_xml_desc[$count_elt][1]." ".$array_xml_desc[$count_elt][4]) == strval($app_name))
				{


				$return="<item>\n";
				$return=$return."<item_category>"._Lang($array_xml_desc[$count_elt][2], $array_lang[$count_elt_lang])."</item_category>\n";
				$return=$return."<item_url>".$main_url."</item_url>\n";
				$return=$return."<item_name>".$array_xml_desc[$count_elt][1]." ".$array_xml_desc[$count_elt][4]."</item_name>\n";
				$return=$return."<item_desc>"._Lang($array_xml_desc[$count_elt][5], $array_lang[$count_elt_lang])."</item_desc>\n";
				$return=$return."<item_admin_url>".$admin_url."</item_admin_url>\n";
				$return=$return."</item>\n";

				
				$find="ok";
				break;
	
				}
			}


$file_content=file_get_contents($dir_output.'/cooperation-wui-'.$array_lang[$count_elt_lang].'.xml');


$file_content=$file_content.$return;

write_file($dir_output.'/cooperation-wui-'.$array_lang[$count_elt_lang].'.xml', $file_content) ;
//write_file('test2-'.$array_lang[$count_elt_lang].'.xml', $file_content) ;

}
return $find;
}

#-------------MAIN --------------------#

if (! is_xml_content($server_content_xml)) 
{

$array_xml_desc=parse_xml_app_file($server_content_xml);

$xml_desc=generate_xml_server_desc($array_xml_desc, $app_name, $main_url, $admin_url, $dir,  $dir_output);

}


?>
