<?php defined('_JEXEC') or die('Restricted access'); ?>

<?php if ( $this->params->get( 'show_page_title', 1 ) ) : ?>
<div class="componentheading<?php echo $this->params->get( 'pageclass_sfx' ); ?>">
	<?php echo $this->params->get( 'page_title' ); ?>
</div>
<?php endif; ?>

<?php 
global $lang_file;
$lang_file= $_GET['res_lang'];

include('../Sphider/index.php'); ?>