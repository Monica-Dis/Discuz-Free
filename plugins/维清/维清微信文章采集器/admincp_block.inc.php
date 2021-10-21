<?php

/**
 * 维清工作室 [ 专业开发各种Discuz!插件 ]
 *
 * Copyright (c) 2011-2012 http://www.weiqing.org All rights reserved.
 *
 * Author: wuchunuan <wuchunuan@163.com>
 *
 * $Id: import_ariable_ariable.inc.php 2013-5-18 下午02:38:10Z wuchunuan $
 */
if (!defined('IN_DISCUZ') || !defined('IN_ADMINCP')) {
    exit('Access Denied');
}
include DISCUZ_ROOT . './source/plugin/wq_wechatcollecting/config/config.php';

include_once DISCUZ_ROOT . './source/plugin/wq_wechatcollecting/config/admincpjs.php';

if (!submitcheck('add_submit')) {
    showtips('<li>' . $Plang['7f98df56efe8991d'] . '</li>');
    showtableheader();
    showformheader('plugins&operation=config&do=' . $pluginid . '&identifier=wq_wechatcollecting&pmod=admincp_block', 'add_submit');
    showsubmit('add_submit', 'submit');
    showformfooter();
    showtablefooter();
    check_diy_perm();
} else {
    $tplarr = array(
        array('wq_wechatcollecting', 'wechatcollecting_index'),
    );

    if (file_exists(DISCUZ_ROOT . "./data/cache/wq_wechat_import_log.txt")) {

        $content = file_get_contents(DISCUZ_ROOT . "./data/cache/wq_wechat_import_log.txt");
        $arr = unserialize($content);

        foreach ($arr as $key => $value) {
            $search[] = '<!--{block/' . $key . '}-->';
            $replaces[] = '<!--{block/' . $value . '}-->';
            $keys[] = $key;
        }

        foreach ($tplarr as $pluginname => $tplname) {
            $tplurl = DISCUZ_ROOT . "./source/plugin/" . $tplname[0] . "/template/touch/" . $tplname[1] . ".php";
            $content = file_get_contents($tplurl);
            $content = str_replace($search, $replaces, $content);
            file_put_contents($tplurl, $content);
        }
        C::t('#wq_wechatcollecting#common_block')->delete($keys);
    }

    if (CHARSET == 'gbk') {
        $list = file_get_contents(DISCUZ_ROOT . "./source/plugin/wq_wechatcollecting/install/block.gbk.php");
    } else {
        $list = file_get_contents(DISCUZ_ROOT . "./source/plugin/wq_wechatcollecting/install/block.utf8.php");
    }

    $list = str_replace("<?php exit(\"wikin.cn\"); ?>", "", $list);

    if (!empty($list)) {
        runquery($list);
        $search = $replaces = $logs = array();
        for ($i = 1; $i <= 1; $i ++) {
            $name = $Plang['5fb93847d4f1a40e'];
            $bid = C::t('#wq_wechatcollecting#common_block')->fetch_first_by_name(1, $Plang['5fb93847d4f1a40e']);
            $search[] = "<!--{block/" . $i . "n}-->";
            $replaces[] = "<!--{block/" . $bid['bid'] . "}-->";
            $logs[$bid['bid']] = $i . "n";
        }

        foreach ($tplarr as $pluginname => $tplname) {
            unlink(DISCUZ_ROOT . "./source/plugin/" . $tplname[0] . "/template/touch/" . $tplname[1] . ".htm");
            $tplurl = DISCUZ_ROOT . "./source/plugin/" . $tplname[0] . "/template/touch/" . $tplname[1] . ".php";
            $content = file_get_contents($tplurl);
            $content = str_replace($search, $replaces, $content);
            file_put_contents($tplurl, $content);

            unlink(DISCUZ_ROOT . "./source/plugin/" . $tplname[0] . "/template/mobile/" . $tplname[1] . ".htm");
            $tplurl_mobile = DISCUZ_ROOT . "./source/plugin/" . $tplname[0] . "/template/mobile/" . $tplname[1] . ".php";
            $content_mobile = file_get_contents($tplurl_mobile);
            $content_mobile = str_replace($search, $replaces, $content_mobile);
            file_put_contents($tplurl_mobile, $content_mobile);
        }
        file_put_contents(DISCUZ_ROOT . "./data/cache/wq_wechat_import_log.txt", serialize($logs));

        $durl = 'action=block&operation=jscall';
        cpmsg($Plang['6357bddfa1918985'], $durl, 'succeed');
    }
}
?>