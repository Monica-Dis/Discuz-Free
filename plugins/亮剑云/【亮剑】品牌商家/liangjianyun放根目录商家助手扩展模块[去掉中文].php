<?php

/*
 * ����: ������
 * ����֧��: http://www.liangjianyun.com
 * ��ϵQQ: 1919080885
 * ����˵��:�������̳ǹ����̨����ļ�
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