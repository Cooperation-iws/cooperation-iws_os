<?php // no direct access
defined('_JEXEC') or die('Restricted access'); ?>

 
<?php
 $option= $_GET['option'];

if ($option!= "com_search" ) {
?> Search the all domain <?php echo $HTTP_SERVER_VARS["SERVER_NAME"]; ?>:<?
 include('../Sphider/index-form.php');} ?>