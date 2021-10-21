<?php

/*
   This is NOT a freeware, use is subject to license terms
   版权所有：TOM微信 www.tomwx.cn
*/

$url = get_url();

$oauth_back_url = urldecode($_GET['oauth_back_url']);

preg_match("#((http|https)://[^?]*/)tom_oauth.php#", $url, $urlmatches);
if(is_array($urlmatches) && !empty($urlmatches['0'])){
    $url = str_replace($urlmatches['0'], $oauth_back_url, $url);
}

header('Location: ' . $url);


function get_url(){
   $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
   $url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
   return $url;
}
