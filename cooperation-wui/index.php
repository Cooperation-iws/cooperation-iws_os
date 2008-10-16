<?php include('cooperation-wui.header.php'); ?>

<center>
<img src="cooperation.header.jpg"></center><br><br>
<?php include('Sphider/index.php'); ?>
<?php if ( !isset($_GET['query'])) {?>
<center>
<?php
$tree = simplexml_load_file('cooperation-wui.xml');

$prev_category = "";
foreach($tree->item as $item) {
$category= $item->item_category;
if ($category != $prev_category){
echo "<h1>".$category."</h1><br>";
}
$name = $item->item_name;
$desc = $item->item_desc;
$url = $item->item_url;
$admin_url =$item->item_admin_url;

echo "<h3>".$name."</h3><br>";
echo "<a href=\"".$url."\">".$url."</a>";
if ($admin_url) {
echo "<a href=\"".$admin_url."\">admin</a>";}
echo "<br>";
$prev_category = $category;
}
?> 

<hr width="20%">
<a href="/admin">Admin</a><br>
</center>
<?php } else {?>
<hr width="20%">
<center><h1><a href="/">Home</a></h1></center><br>
<?php } ?>


<?php include('cooperation-wui.footer.php'); ?> 
