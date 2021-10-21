<?php
if (!defined('IN_DISCUZ')) {
    exit('Access Denied');
}

include_once "invite.fun.php";
include_once "public.inc.php";


$invite_aboc = $_G['cache']['plugin']['invite_aboc'];
$invite_aboc['ban_group_id'] = @unserialize($invite_aboc['ban_group_id']);


$share_url = $_G['siteurl'] . 'forum.php?register=1&fromuid=' . $_G['uid'];
if($invite_aboc['use_short_url'] == "1"){
//    echo "http://suo.im/api.htm?key=5d1637a191d2c45cff18b41e@6a0f41d00278bce6e347f86c76093097&&expireDate=".date("Y-m-d","+3m")."&url=".urlencode($share_url);exit;
    $url = _short_url( $share_url );

    if($url && $url !=""){
        $_G['setting']['share_short_url']  = $url;
        $share_url = $_G['setting']['share_short_url'];
    }
}
$str = '';
$copy = lang("home/template", "copy");

for ($i = 1; $i <= 3; $i++) {
    if ($invite_aboc['explain_' . $i] != "") {
        $invite_aboc['explain_' . $i] = str_ireplace(array('{url}','{uid}'), array($share_url,$_G['uid']), $invite_aboc['explain_' . $i]);
        if(defined("IN_MOBILE") && IN_MOBILE==2){
            $str .= <<<BBB
<div class="am-btn-toolbar" style="margin:20px 0px;">
<a id="id_{$i}"  data-clipboard-text="{$invite_aboc['explain_' . $i]}" href="#" class="am-form-field am-radius btncopy">{$invite_aboc['explain_' . $i]}</a>
</div>
BBB;
        } else {
            $str .= <<<BBB
<div class="am-btn-toolbar" style="margin:20px 0px;"><input type="text" class="am-form-field am-radius" id="id_{$i}" value="{$invite_aboc['explain_' . $i]}" style="width:80%;display:inline-block;"/><button type="button" data-clipboard-target="#id_{$i}" class="am-btn am-btn-warning btncopy"  style="margin-left:30px;">{$copy}</button></div>
BBB;
        }
    }
}

$str .= "<p style=\"font-size:15px;color:#fb2018;\">". lang('plugin/invite_aboc', 'this')."</p>";

echo $str;