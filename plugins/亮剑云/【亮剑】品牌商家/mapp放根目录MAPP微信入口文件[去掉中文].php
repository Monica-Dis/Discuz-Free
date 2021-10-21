<?php

/*
 * 作者: Discuz!亮剑工作室
 * 技术支持: http://www.dzx30.com
 * 联系QQ: 578933760
 * 功能说明:MAPP微信盒子入口文件
 */

define('IN_MAPP_API', 1);
define('DISABLEXSSCHECK', true);
require './source/class/class_core.php';

$discuz = C::app();

$cachelist = array('plugin');

$discuz->cachelist = $cachelist;
$discuz->init();
require_once DISCUZ_ROOT . './source/plugin/aljwsq/mapp.lib.class.php';
?>