<?php
if(!defined('IN_DISCUZ')) {
    exit('Access Denied');
}
$m = diconv('糖果说', 'UTF-8', CHARSET);
$lang1 = diconv('内容营销淘宝客导购', 'UTF-8', CHARSET);
$lang2 = diconv('内容营销淘宝客推广', 'UTF-8', CHARSET);
$lang3 = diconv('关键词匹配植入商品', 'UTF-8', CHARSET);
$lang4 = diconv('淘宝客商品过期检测', 'UTF-8', CHARSET);
$lang5 = diconv('【糖果说】', 'UTF-8', CHARSET);
$lang6 = diconv('阿里云短信手机登录', 'UTF-8', CHARSET);
$lang7 = diconv('手机验证修改用户名', 'UTF-8', CHARSET);
$lang8 = diconv('强制用户实名认证', 'UTF-8', CHARSET);
$lang9 = diconv('阿里云短信接口调用', 'UTF-8', CHARSET);
$lang10 = diconv('手机验证账号注销', 'UTF-8', CHARSET);
$lang11 = diconv('阿里腾讯云国际短信', 'UTF-8', CHARSET);
$lang12 = diconv('内容电商微信小程序', 'UTF-8', CHARSET);
$lang13 = diconv('搜索引擎友好的图片', 'UTF-8', CHARSET);
$lang14 = diconv('全站弹出层通知', 'UTF-8', CHARSET);
$lang15 = diconv('帖子段落标题格式化', 'UTF-8', CHARSET);
$lang16 = diconv('微信小程序商品植入', 'UTF-8', CHARSET);
$lang17 = diconv('阿里云号码认证服务', 'UTF-8', CHARSET);
$lang18 = diconv('发帖时上传封面图', 'UTF-8', CHARSET);
$lang19 = diconv('实时数据可视化大屏', 'UTF-8', CHARSET);

$topmenu[$m] = '';

loadcache('adminmenu');

foreach ($_G['cache']['adminmenu'] as $k => $v) {
    if(strpos($v['name'], $lang1) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang2) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang3) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang4) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang5) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang6) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang7) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang8) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang9) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang10) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang11) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang12) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang13) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang14) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang15) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang16) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang17) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang18) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
    if(strpos($v['name'], $lang19) !== false ){
        //unset($_G['cache']['adminmenu'][$k]);
        $menu[$m][] = array($v['name'], $v['action']);
    }
}

if(empty($menu[$m])){
    unset($topmenu[$m] );
}