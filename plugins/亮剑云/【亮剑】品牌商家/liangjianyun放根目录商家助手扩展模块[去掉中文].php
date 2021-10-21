<?php

/*
 * 作者: 亮剑云
 * 技术支持: http://www.liangjianyun.com
 * 联系QQ: 1919080885
 * 功能说明:亮剑云商城管理后台入口文件
 */

define('IN_ADMINCP', 1);
define('LIANGJIANYUN', 1);
require './source/class/class_core.php';

$discuz = C::app();

$cachelist = array('plugin');

$discuz->cachelist = $cachelist;
$discuz->init();

if(strpos($_SERVER["REQUEST_URI"], '?') === false){
    header('Location: ' . $_SERVER["REQUEST_URI"] . '?');
    exit;
}

require_once DISCUZ_ROOT . './source/plugin/aljhtx/aljhtx.inc.php';