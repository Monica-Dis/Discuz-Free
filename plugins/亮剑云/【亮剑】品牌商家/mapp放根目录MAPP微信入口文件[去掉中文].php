<?php

/*
 * ����: Discuz!����������
 * ����֧��: http://www.dzx30.com
 * ��ϵQQ: 578933760
 * ����˵��:MAPP΢�ź�������ļ�
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