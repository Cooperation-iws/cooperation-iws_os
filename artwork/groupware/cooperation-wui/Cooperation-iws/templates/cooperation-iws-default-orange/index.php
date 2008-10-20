<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">

<head>
<jdoc:include type="head" />

<link rel="stylesheet" href="templates/<?=$this->template?>/css/template.css" type="text/css" media="screen" />
</head>

<body style="margin:0;" class="bg_image">
<div width="1000" height="100%" align="center">
<table cellspacing="2" cellpadding="0" style="text-align: left;">
	<tr>
		<td style="padding-top:20px;" colspan="2" align="right">
			<jdoc:include type="modules" name="user4" style="xhtml" />
		</td>
	</tr>
	<tr height="190">
		<td class="bg_head" style="padding-top:50px;">
			<img src="templates/<?=$this->template?>/heading.php?text=<?php echo $mainframe->getCfg('sitename');?>&font=<?=$this->params->get('titleFont')?>&fontcolor=<?=$this->params->get('fontColor')?>&fontsize=<?=$this->params->get('fontSize')?>">
		</td>
		<td>
		<?php
		if($this->countModules('top')){
		?>			
		<table height="140" cellspacing="0" cellpadding="0" width="500" align="right">
			<tr>
				<td><img src="templates/<?=$this->template?>/images/newsflash_l.png"></td>
				<?php
				//echo strtolower($_SERVER['HTTP_USER_AGENT']);
				$navigator_user_agent = strtolower( $_SERVER['HTTP_USER_AGENT'] );
				if(stristr($navigator_user_agent, "mozilla/4.0")){
					$padding_top = 'style="padding-top:10px;"';
				}else{
					$padding_top = "";
				}
				?>				
				<td class="newsflash" <?=$padding_top?>>
					<jdoc:include type="modules" name="top" style="xhtml" />
				</td>
				<td><img src="templates/<?=$this->template?>/images/newsflash_r.png"></td>
			</tr>
		</table>
		<?php
		}
		?>
		</td>
	</tr>
	<tr>
		<td id="top_menu" style="padding-top:0px;" colspan="2">
		<table cellspacing="0" cellpadding="0">
			<tr>
				<td><img src="templates/<?=$this->template?>/images/menu_l.png"></td>
				<td width="100%" class="bg_top" style="padding-top:20px;"><jdoc:include type="modules" name="user3" style="xhtml" /></td>
				<td><img src="templates/<?=$this->template?>/images/menu_r.png"></td>
			</tr>
		</table> 
		</td>
	</tr>
	<tr>
		<td colspan="2" width="1000">
		<table>
			<tr>
				<td width="208" id="leftcol">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td><img src="templates/<?=$this->template?>/images/left_t.png"></td>
					</tr>
					<tr>
						<td class="bg_left"><jdoc:include type="modules" name="left" style="xhtml" /></td>
					</tr>
					<tr>
						<td><img src="templates/<?=$this->template?>/images/left_b.png"></td>
					</tr>
				</table>
				</td>
				<td>
				<table width="580">
					<?php
					if($this->countModules('user1') && $this->countModules('user2')){
					?>	
					<tr>
						<td style="padding-left:20px;">
						<table height="140" cellspacing="0" cellpadding="0">
							<tr>
								<td><img src="templates/<?=$this->template?>/images/newsflash_l.png"></td>
								<?php
								//echo strtolower($_SERVER['HTTP_USER_AGENT']);
								$navigator_user_agent = strtolower( $_SERVER['HTTP_USER_AGENT'] );
								if(stristr($navigator_user_agent, "mozilla/4.0")){
									$padding_top = 'style="padding-top:10px;"';
								}else{
									$padding_top = "";
								}
								?>				
								<td class="newsflash" <?=$padding_top?>>
									<jdoc:include type="modules" name="user1" style="xhtml" />
								</td>
								<td><img src="templates/<?=$this->template?>/images/newsflash_r.png"></td>
							</tr>
						</table>						
						</td>
						<td width="50%">
						<table height="140" cellspacing="0" cellpadding="0" align="right">
							<tr>
								<td><img src="templates/<?=$this->template?>/images/newsflash_l.png"></td>
								<?php
								//echo strtolower($_SERVER['HTTP_USER_AGENT']);
								$navigator_user_agent = strtolower( $_SERVER['HTTP_USER_AGENT'] );
								if(stristr($navigator_user_agent, "mozilla/4.0")){
									$padding_top = 'style="padding-top:10px;"';
								}else{
									$padding_top = "";
								}
								?>				
								<td class="newsflash" <?=$padding_top?>>
									<jdoc:include type="modules" name="user2" style="xhtml" />
								</td>
								<td><img src="templates/<?=$this->template?>/images/newsflash_r.png"></td>
							</tr>
						</table>						
						</td>
					</tr>
					<?php
					}
					if($this->countModules('right')){
						$width = 640;
					}else{
						$width = 820;
					}
					?>					
					<tr>
						<td colspan="2">
							<jdoc:include type="module" name="breadcrumbs" />
						</td>
					</tr>
					<tr>
						<td colspan="2" width="<?=$width?>" class="main">
							<jdoc:include type="component" style="xhtml" />
						</td>
					</tr>
				</table>
				</td>
				<?php
				if($this->countModules('right')){
				?>					
				<td width="208" id="rightcol">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td><img src="templates/<?=$this->template?>/images/left_t.png"></td>
					</tr>
					<tr>
						<td class="bg_left">
							<jdoc:include type="modules" name="right" style="xhtml" />
						</td>
					</tr>
					<tr>
						<td><img src="templates/<?=$this->template?>/images/left_b.png"></td>
					</tr>
				</table>				
				</td>
				<?php
				}
				?>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<br /><jdoc:include type="modules" name="footer" /><br />
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
				<a href="http://www.skulltheme.com" target="_blank" title="SkullTheme" style="text-decoration:none;color:#a1a1a1;font-size:8pt;font-family:sans-serif,verdana,helvetica;">
				Template created by SkullTheme
			</a>
		</td>
	</tr>
</table>
</div>
</body>

</html>