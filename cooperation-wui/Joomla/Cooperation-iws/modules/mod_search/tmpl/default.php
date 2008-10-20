<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>

 
<?php
 $option= $_GET['option'];

if ($option!= "com_search" ) {
?>

<?
 include('../Sphider/index-form.php');} ?>
<center> Search the all domain <?php echo $_SERVER["SERVER_NAME"]; ?></center>