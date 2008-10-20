<?php defined('_JEXEC') or die('Restricted access'); ?>
<script language="javascript" type="text/javascript">
  function updateResultDiv( resultInfo, type ) {
	resultDiv = document.getElementById("manage_results");
	if( type == 'div' ) {
		resultDiv.innerHTML = resultInfo.innerHTML;
	} else {
		resultDiv.innerHTML = resultInfo;
	}
  }

  function executeCopyOriginal( toLanguage, confirmCheck, copyCat  ) {
  		if( toLanguage == null || toLanguage.value == -1 ) return;

		var link = 'index3.php?option=com_joomfish&task=manage.copy&type=original_language&phase=2';
  		if( confirmCheck.checked == true ) {
			if( !window.confirm( '<?php echo JText::_('CONFIRM_COPY_TO', true);?>' ) ) return;
			link += '&overwrite=1';
  		} else {
  			link += '&overwrite=0';
  		}
		link += '&language_id=' +toLanguage.value;

		// adding all requested catids to one string
		var catString = '';
		for(var i=0; i<copyCat.length; i++) {
			if( copyCat[i].value != null && copyCat[i].checked == true ) {
				if(catString != '') {
					catString += ',';
				}
				catString += copyCat[i].value;
			}
		}
		link += '&state_catid=' + catString;

		ajaxFrame = document.getElementById("ajaxFrame");
		ajaxFrame.contentDocument.location.href = link;
  }
</script>
<form action="index.php" method="post" name="adminForm">
<table class="adminform">
	<tr>
		<td width="45%" valign="top">
			<div id="cpanel">
				<?php
				$link = 'index3.php?option=com_joomfish&amp;task=manage.copy&amp;type=original_language';
				$this->_quickiconButton( $link, 'icon-48-manage-translations.png', JText::_('Copy Original to Language'), '/administrator/components/com_joomfish/assets/images/', 'ajaxFrame', "updateResultDiv('" .JText::_('Processing', 'text'). "');" );
/*
				echo '<div style="clear: both;" />';
				$link = 'index3.php?option=com_joomfish&amp;task=copy&amp;act=manage&amp;type=translation_language';
				HTML_joomfish::_quickiconButton( $link, 'dbrestore.png', JText::_('Copy Translation to Langage'), '/administrator/images/', 'ajaxFrame', "updateResultDiv('" .JText::_('Processing', 'text'). "');" );
				$link = 'index3.php?option=com_joomfish&amp;task=update&amp;act=manage&amp;type=original_value';
				HTML_joomfish::_quickiconButton( $link, 'query.png', JText::_('Update original values'), '/administrator/images/', 'ajaxFrame', "updateResultDiv('" .JText::_('Processing'). "', 'text');" );
*/
				?>
			</div>
		</td>
		<td width="55%" valign="top">
			<div style="width: 98%; height: 100%;">
				<h3><?php echo JText::_('Management info');?></h3>
				<div id="manage_results"><?php echo JText::_('MANAGEMENT_INTRO');?></div>
			</div>
			<iframe style="display: none;" id="ajaxFrame" name="ajaxFrame" ></iframe>
		</td>
	</tr>
</table>

<input type="hidden" name="option" value="com_joomfish" />
<input type="hidden" name="task" value="cpanel.show" />
<input type="hidden" name="boxchecked" value="0" />
<input type="hidden" name="<?php echo JUtility::getToken(); ?>" value="1" />
</form>