<?php
 /**
 *	开发团队：IT618
 *	it618_copyright 插件设计：<a href="http://www.cnit618.com" target="_blank" title="专业Discuz!应用及周边提供商">IT618</a>
 */
(!defined('IN_DISCUZ') || !defined('IN_ADMINCP')) && exit('Access Denied');

loadcache('plugin');
$it618_wxmini = $_G['cache']['plugin']['it618_wxmini'];
$ppp = $it618_wxmini['pagecount'];
$page = max(1, intval($_GET['page']));
$startlimit = ($page - 1) * $ppp;

require_once DISCUZ_ROOT.'./source/plugin/it618_wxmini/function.func.php';

function showsubmenus($title, $menus = array(), $right = '', $replace = array()) {
	$tempabc=$_GET['identifier'];$reabc=array();
	for($i=0;$i<strlen($tempabc);$i++){$reabc[]=substr($tempabc,$i,1);}
	if(count($reabc)!=12)return;
	if(empty($menus)) {
		$s = '<div class="itemtitle">'.$right.'<h3>'.cplang($title, $replace).'</h3></div>';
	} elseif(is_array($menus)) {
		$s = '<div class="itemtitle">'.$right.'<h3>'.cplang($title, $replace).'</h3><ul class="tab1">';
		foreach($menus as $k => $menu) {
			if(is_array($menu[0])) {
				$s .= '<li id="addjs'.$k.'" class="'.($menu[1] ? 'current' : 'hasdropmenu').'" onmouseover="dropmenu(this);"><a href="#"><span>'.cplang($menu[0]['menu']).'<em>&nbsp;&nbsp;</em></span></a><div id="addjs'.$k.'child" class="dropmenu" style="display:none;" style="margin-top:-20px">';
				if(is_array($menu[0]['submenu'])) {
					foreach($menu[0]['submenu'] as $submenu) {
						$s .= $submenu[1] ? '<a href="'.ADMINSCRIPT.'?action='.$submenu[1].'" class="'.($submenu[2] ? 'current' : '').'" onclick="'.$submenu[3].'">'.cplang($submenu[0]).'</a>' : '<a><b>'.cplang($submenu[0]).'</b></a>';
					}
				}
				$s .= '</div></li>';
			} else {
				$s .= '<li'.($menu[2] ? ' class="current"' : '').'><a href="'.(!$menu[4] ? ADMINSCRIPT.'?action='.$menu[1] : $menu[1]).'"'.(!empty($menu[3]) ? ' target="_blank"' : '').'><span>'.cplang($menu[0]).'</span></a></li>';
			}
		}
		$s .= '</ul></div>';
	}
	echo !empty($menus) ? '<div class="floattop" style="top:27px;height:10px;padding:0px;_top:5px">'.$s.'</div>' : $s;
}

function showtipss($tips, $id = 'tips', $display = TRUE, $title = '') {
	$tempabc=$_GET['identifier'];$reabc=array();
	for($i=0;$i<strlen($tempabc);$i++){$reabc[]=substr($tempabc,$i,1);}
	if(count($reabc)!=12)return;
	$tips = cplang($tips);
	$tips = preg_replace('#</li>\s*<li>#i', '</li><li>', $tips);
	$tmp = explode('</li><li>', substr($tips, 4, -5));
	if(!count($tmp) > 4) {
		$tips = '<li>'.$tmp[0].'</li><li>'.$tmp[1].'</li><li id="'.$id.'_more" style="border: none; background: none; margin-bottom: 6px;"><a href="###" onclick="var tiplis = $(\''.$id.'lis\').getElementsByTagName(\'li\');for(var i = 0; i < tiplis.length; i++){tiplis[i].style.display=\'\'}$(\''.$id.'_more\').style.display=\'none\';">'.cplang('tips_all').'...</a></li>';
		foreach($tmp AS $k => $v) {
			if($k > 1) {
				$tips .= '<li style="display: none">'.$v.'</li>';
			}
		}
	}
	unset($tmp);
	$title = $title ? $title : 'tips';
	showtableheaders($title, '', 'id="'.$id.'"'.(!$display ? ' style="display: none;"' : ''), 0);
	showtablerow('', 'class="tipsblock" s="1"', '<ul id="'.$id.'lis">'.$tips.'</ul>');
	if(count($reabc)!=12)return;
showtablefooter();
}
function showtableheaders($title = '', $classname = '', $extra = '', $titlespan = 15) {
	global $_G;
	$tempabc=$_GET['identifier'];$reabc=array();
	for($i=0;$i<strlen($tempabc);$i++){$reabc[]=substr($tempabc,$i,1);}
	if(count($reabc)!=12)return;
	$classname = str_replace(array('nobottom', 'notop'), array('nobdb', 'nobdt'), $classname);
	if(isset($_G['showsetting_multi'])) {
		if($_G['showsetting_multi'] == 0) {
			$extra .= ' style="width:'.($_G['showsetting_multicount'] * 270 + 20).'px"';
		} else {
			return;
		}
	}
	echo "\n".'<table class="tb tb2 '.$classname.'"'.($extra ? " $extra" : '').' style="clear: both;margin-top: 5px;width: 100%">';
	if($title) {
		$span = $titlespan ? 'colspan="'.$titlespan.'"' : '';
		echo "\n".'<tr><th '.$span.' class="partition">'.cplang($title).'</th></tr>';
		showmultititle(1);
	}
}

?>