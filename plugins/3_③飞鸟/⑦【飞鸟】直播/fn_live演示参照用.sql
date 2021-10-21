-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-12-07 22:47:49
-- 服务器版本： 5.7.31-log
-- PHP 版本： 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `fn`
--

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live`
--

CREATE TABLE `pre_fn_live` (
  `id` int(11) UNSIGNED NOT NULL,
  `class_id` int(11) UNSIGNED NOT NULL,
  `number_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `param` mediumtext NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL,
  `display` tinyint(1) UNSIGNED NOT NULL,
  `start_dateline` int(11) UNSIGNED NOT NULL,
  `end_dateline` int(11) UNSIGNED NOT NULL,
  `dateline` int(11) UNSIGNED NOT NULL,
  `updateline` int(11) UNSIGNED NOT NULL,
  `topdateline` int(11) UNSIGNED NOT NULL,
  `click` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `pre_fn_live`
--

INSERT INTO `pre_fn_live` (`id`, `class_id`, `number_id`, `title`, `content`, `thumb`, `param`, `state`, `display`, `start_dateline`, `end_dateline`, `dateline`, `updateline`, `topdateline`, `click`) VALUES
(1, 0, 1, '飞鸟直播测试频道', '飞鸟直播测试频道', 'http://dev.yili6.com/source/plugin/fn_assembly/attachment/fn_admin/fn_15676907455d710ff925270.jpg', 'a:121:{s:8:\"jump_url\";s:0:\"\";s:4:\"gift\";i:1;s:9:\"gift_list\";a:8:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";}s:8:\"gift_img\";s:67:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/gift.png\";s:12:\"gift_list_bg\";s:70:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/gift_bg.jpg\";s:15:\"gift_list_money\";s:73:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/gift_money.jpg\";s:10:\"gift_title\";s:12:\"赠送礼物\";s:15:\"gift_list_title\";s:12:\"礼物列表\";s:12:\"gift_comment\";s:122:\"{username}送出了<span class=ColorRed>{gift_title}</span>礼物{gift_ico}，价值<span class=ColorRed>{money}</span>元\";s:24:\"participant_gift_comment\";s:128:\"{username}送给了{name}<span class=ColorRed>{gift_title}</span>礼物{gift_ico}，价值<span class=ColorRed>{money}</span>元\";s:16:\"gift_log_content\";s:68:\"{username}增送了<span class=Color>[{gift_title}]</span>{gift_ico}\";s:9:\"pedpacket\";i:1;s:13:\"pedpacket_img\";s:72:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/redpacket.png\";s:13:\"pedpacket_app\";i:0;s:18:\"pedpacket_app_tips\";s:24:\"App才可以领红包哦\";s:11:\"visit_limit\";i:1;s:14:\"no_pay_comment\";i:0;s:19:\"no_pay_comment_tips\";s:48:\"您还没有付费观看，暂时不能评论哦\";s:5:\"money\";s:0:\"\";s:9:\"money_app\";s:0:\"\";s:10:\"money_time\";s:0:\"\";s:10:\"money_tips\";s:62:\"查看直播需要付费<span class=ColorRed>{money}</span>元\";s:14:\"money_app_tips\";s:95:\"查看直播需要付费{money}元{br}下载APP只需<span class=ColorRed>{money_app}</span>元\";s:11:\"money_title\";s:12:\"付费观看\";s:9:\"money_btn\";s:12:\"马上付费\";s:13:\"money_app_btn\";s:9:\"下载APP\";s:4:\"pass\";s:0:\"\";s:9:\"pass_time\";i:0;s:8:\"password\";s:0:\"\";s:4:\"navs\";s:85:\"1=评论\r\n2=直播介绍\r\n3=商家介绍\r\n4=图文直播\r\n5=排行榜\r\n6=打赏选手\";s:10:\"navs_array\";a:6:{i:1;s:6:\"评论\";i:2;s:12:\"直播介绍\";i:3;s:12:\"商家介绍\";i:4;s:12:\"图文直播\";i:5;s:9:\"排行榜\";i:6;s:12:\"打赏选手\";}s:10:\"nav_follow\";i:0;s:16:\"follow_pop_title\";s:39:\"添加在线客服，专属为您服务\";s:21:\"follow_pop_wx_content\";s:42:\"长按识别二维码，咨询专属客服\";s:18:\"follow_pop_content\";s:64:\"长按保存二维码<br>打开微信识别二维码添加客服\";s:9:\"follow_qr\";s:0:\"\";s:15:\"follow_bg_color\";s:7:\"#20a0ff\";s:12:\"live_name_id\";s:139:\"1=飞鸟直播员1号|source/plugin/fn_live/static/images/gift.png\r\n2=飞鸟直播员2号|source/plugin/fn_live/static/images/redpacket.png\";s:18:\"live_name_id_array\";a:2:{i:1;a:2:{s:4:\"name\";s:19:\"飞鸟直播员1号\";s:4:\"face\";s:44:\"source/plugin/fn_live/static/images/gift.png\";}i:2;a:2:{s:4:\"name\";s:19:\"飞鸟直播员2号\";s:4:\"face\";s:49:\"source/plugin/fn_live/static/images/redpacket.png\";}}s:14:\"info_auto_time\";i:120000;s:10:\"info_limit\";i:15;s:8:\"content2\";s:31:\"<p>飞鸟直播测试频道</p>\";s:8:\"content3\";s:31:\"<p>飞鸟直播测试频道</p>\";s:16:\"comment_prohibit\";i:0;s:21:\"comment_prohibit_tips\";s:21:\"该直播禁止评论\";s:15:\"comment_display\";i:0;s:17:\"comment_auto_time\";i:60000;s:12:\"comment_time\";i:0;s:17:\"comment_time_tips\";s:51:\"您评论太快了，休息{TIME}秒在来评论吧\";s:17:\"comment_input_btn\";s:6:\"发送\";s:18:\"comment_input_tips\";s:15:\"说点什么...\";s:23:\"comment_input_null_tips\";s:15:\"请输入评论\";s:13:\"comment_limit\";i:30;s:23:\"comment_forbidden_words\";s:0:\"\";s:29:\"comment_forbidden_words_array\";a:0:{}s:28:\"comment_forbidden_words_tips\";s:15:\"您已被禁言\";s:12:\"comment_roll\";s:27:\"飞鸟直播测试频道！\";s:10:\"comment_bg\";s:0:\"\";s:11:\"ranking_nav\";s:43:\"1=礼物榜\r\n2=发红包榜\r\n3=领红包榜\";s:17:\"ranking_nav_array\";a:3:{i:1;s:9:\"礼物榜\";i:2;s:12:\"发红包榜\";i:3;s:12:\"领红包榜\";}s:13:\"ranking_limit\";i:30;s:29:\"participant_reward_percentage\";i:0;s:21:\"participant_reward_bg\";s:84:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/participant_reward_bg.jpg\";s:22:\"participant_reward_top\";i:0;s:18:\"participant_mobile\";i:0;s:21:\"participant_mobile_bg\";s:7:\"#20a0ff\";s:27:\"participant_mobile_btn_text\";s:8:\"联系Ta\";s:9:\"bumber_bg\";s:7:\"#20a0ff\";s:19:\"reward_btn_bg_color\";s:7:\"#20a0ff\";s:15:\"reward_btn_text\";s:11:\"给Ta打赏\";s:6:\"poster\";i:1;s:10:\"poster_ico\";s:73:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/poster_ico.png\";s:9:\"poster_bg\";s:72:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/poster_bg.jpg\";s:18:\"poster_title_color\";s:7:\"#A62417\";s:13:\"poster_invite\";i:0;s:14:\"qr_code_switch\";i:0;s:12:\"player_cover\";s:68:\"https://cdn.dz-x.net/fn_admin/20201207/fn16073497985fce36269edc5.jpg\";s:13:\"player_weight\";i:0;s:13:\"player_height\";i:0;s:11:\"player_type\";s:2:\"yy\";s:4:\"rtmp\";s:0:\"\";s:4:\"m3u8\";s:0:\"\";s:8:\"app_m3u8\";s:0:\"\";s:13:\"app_m3u8_tips\";s:24:\"下载APP可观看高清\";s:16:\"player_bottom_ad\";s:0:\"\";s:14:\"ad_roll_switch\";i:0;s:7:\"ad_roll\";s:0:\"\";s:11:\"ad_roll_url\";s:0:\"\";s:13:\"ad_roll_color\";s:7:\"#ffffff\";s:16:\"ad_roll_bg_color\";s:7:\"#000000\";s:16:\"ad_roll_bg_cover\";s:0:\"\";s:10:\"iframe_url\";s:0:\"\";s:19:\"analysis_url_switch\";i:0;s:7:\"room_id\";s:0:\"\";s:3:\"sid\";s:8:\"16777217\";s:4:\"ssid\";s:8:\"16777217\";s:7:\"temp_id\";s:8:\"16777217\";s:10:\"qq_room_id\";s:0:\"\";s:13:\"douyu_room_id\";s:0:\"\";s:13:\"fixed_nav_app\";i:0;s:11:\"app_comment\";i:0;s:15:\"app_commen_tips\";s:27:\"评论只能在APP评论哦\";s:13:\"app_play_back\";i:0;s:18:\"app_play_back_tips\";s:27:\"直播只能在APP观看哦\";s:11:\"full_screen\";i:0;s:17:\"full_screen_cover\";s:0:\"\";s:15:\"full_screen_url\";s:0:\"\";s:16:\"full_screen_time\";i:5;s:29:\"admin_participant_reward_uids\";s:1:\"1\";s:15:\"admin_info_uids\";s:1:\"1\";s:10:\"admin_uids\";s:1:\"1\";s:11:\"share_title\";s:24:\"飞鸟直播测试分享\";s:10:\"share_desc\";s:24:\"飞鸟直播测试分享\";s:9:\"share_img\";s:68:\"https://cdn.dz-x.net/fn_admin/20201207/fn16073499405fce36b41cd3d.png\";s:5:\"color\";s:7:\"#20a0ff\";s:6:\"fcolor\";s:7:\"#ff0000\";s:5:\"visit\";i:0;s:10:\"PcQrSwitch\";i:0;s:8:\"PcQrText\";s:39:\"扫一扫，手机观看直播更方便\";s:10:\"click_rand\";s:3:\"1-1\";s:7:\"app_ico\";s:0:\"\";}', 1, 1, 1607270400, 0, 1607349750, 1607349720, 0, 3),
(2, 0, 1, '【高清】北京卫视直播现场观看', '【高清】北京卫视直播现场观看', 'http://dev.yili6.com/source/plugin/fn_assembly/attachment/fn_admin/fn_15676883065d710672d53e4.jpg', 'a:120:{s:8:\"jump_url\";s:0:\"\";s:4:\"gift\";i:0;s:9:\"gift_list\";s:0:\"\";s:8:\"gift_img\";s:67:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/gift.png\";s:12:\"gift_list_bg\";s:70:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/gift_bg.jpg\";s:15:\"gift_list_money\";s:73:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/gift_money.jpg\";s:10:\"gift_title\";s:12:\"赠送礼物\";s:15:\"gift_list_title\";s:12:\"礼物列表\";s:12:\"gift_comment\";s:122:\"{username}送出了<span class=ColorRed>{gift_title}</span>礼物{gift_ico}，价值<span class=ColorRed>{money}</span>元\";s:24:\"participant_gift_comment\";s:128:\"{username}送给了{name}<span class=ColorRed>{gift_title}</span>礼物{gift_ico}，价值<span class=ColorRed>{money}</span>元\";s:16:\"gift_log_content\";s:68:\"{username}增送了<span class=Color>[{gift_title}]</span>{gift_ico}\";s:9:\"pedpacket\";i:0;s:13:\"pedpacket_img\";s:72:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/redpacket.png\";s:13:\"pedpacket_app\";i:0;s:18:\"pedpacket_app_tips\";s:24:\"App才可以领红包哦\";s:11:\"visit_limit\";i:1;s:14:\"no_pay_comment\";i:0;s:19:\"no_pay_comment_tips\";s:48:\"您还没有付费观看，暂时不能评论哦\";s:5:\"money\";s:0:\"\";s:9:\"money_app\";s:0:\"\";s:10:\"money_time\";s:0:\"\";s:10:\"money_tips\";s:62:\"查看直播需要付费<span class=ColorRed>{money}</span>元\";s:14:\"money_app_tips\";s:95:\"查看直播需要付费{money}元{br}下载APP只需<span class=ColorRed>{money_app}</span>元\";s:11:\"money_title\";s:12:\"付费观看\";s:9:\"money_btn\";s:12:\"马上付费\";s:13:\"money_app_btn\";s:9:\"下载APP\";s:4:\"pass\";s:0:\"\";s:9:\"pass_time\";i:0;s:8:\"password\";s:0:\"\";s:4:\"navs\";s:85:\"1=评论\r\n2=直播介绍\r\n3=商家介绍\r\n4=图文直播\r\n5=排行榜\r\n6=打赏选手\";s:10:\"navs_array\";a:6:{i:1;s:6:\"评论\";i:2;s:12:\"直播介绍\";i:3;s:12:\"商家介绍\";i:4;s:12:\"图文直播\";i:5;s:9:\"排行榜\";i:6;s:12:\"打赏选手\";}s:10:\"nav_follow\";i:0;s:16:\"follow_pop_title\";s:39:\"添加在线客服，专属为您服务\";s:21:\"follow_pop_wx_content\";s:42:\"长按识别二维码，咨询专属客服\";s:18:\"follow_pop_content\";s:64:\"长按保存二维码<br>打开微信识别二维码添加客服\";s:9:\"follow_qr\";s:0:\"\";s:15:\"follow_bg_color\";s:7:\"#20a0ff\";s:12:\"live_name_id\";s:0:\"\";s:14:\"info_auto_time\";i:120000;s:10:\"info_limit\";i:15;s:8:\"content2\";s:49:\"<p>【高清】北京卫视直播现场观看</p>\";s:8:\"content3\";s:49:\"<p>【高清】北京卫视直播现场观看</p>\";s:16:\"comment_prohibit\";i:0;s:21:\"comment_prohibit_tips\";s:21:\"该直播禁止评论\";s:15:\"comment_display\";i:0;s:17:\"comment_auto_time\";i:60000;s:12:\"comment_time\";i:0;s:17:\"comment_time_tips\";s:51:\"您评论太快了，休息{TIME}秒在来评论吧\";s:17:\"comment_input_btn\";s:6:\"发送\";s:18:\"comment_input_tips\";s:15:\"说点什么...\";s:23:\"comment_input_null_tips\";s:15:\"请输入评论\";s:13:\"comment_limit\";i:30;s:23:\"comment_forbidden_words\";s:0:\"\";s:29:\"comment_forbidden_words_array\";a:0:{}s:28:\"comment_forbidden_words_tips\";s:15:\"您已被禁言\";s:12:\"comment_roll\";s:0:\"\";s:10:\"comment_bg\";s:0:\"\";s:11:\"ranking_nav\";s:43:\"1=礼物榜\r\n2=发红包榜\r\n3=领红包榜\";s:17:\"ranking_nav_array\";a:3:{i:1;s:9:\"礼物榜\";i:2;s:12:\"发红包榜\";i:3;s:12:\"领红包榜\";}s:13:\"ranking_limit\";i:30;s:29:\"participant_reward_percentage\";i:0;s:21:\"participant_reward_bg\";s:84:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/participant_reward_bg.jpg\";s:22:\"participant_reward_top\";i:0;s:18:\"participant_mobile\";i:0;s:21:\"participant_mobile_bg\";s:7:\"#20a0ff\";s:27:\"participant_mobile_btn_text\";s:8:\"联系Ta\";s:9:\"bumber_bg\";s:7:\"#20a0ff\";s:19:\"reward_btn_bg_color\";s:7:\"#20a0ff\";s:15:\"reward_btn_text\";s:11:\"给Ta打赏\";s:6:\"poster\";i:0;s:10:\"poster_ico\";s:73:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/poster_ico.png\";s:9:\"poster_bg\";s:72:\"https://demo.dz-x.net//source/plugin/fn_live/static/images/poster_bg.jpg\";s:18:\"poster_title_color\";s:7:\"#A62417\";s:13:\"poster_invite\";i:0;s:14:\"qr_code_switch\";i:0;s:12:\"player_cover\";s:0:\"\";s:13:\"player_weight\";i:0;s:13:\"player_height\";i:0;s:11:\"player_type\";s:4:\"m3u8\";s:4:\"rtmp\";s:0:\"\";s:4:\"m3u8\";s:0:\"\";s:8:\"app_m3u8\";s:0:\"\";s:13:\"app_m3u8_tips\";s:24:\"下载APP可观看高清\";s:16:\"player_bottom_ad\";s:0:\"\";s:14:\"ad_roll_switch\";i:0;s:7:\"ad_roll\";s:0:\"\";s:11:\"ad_roll_url\";s:0:\"\";s:13:\"ad_roll_color\";s:7:\"#ffffff\";s:16:\"ad_roll_bg_color\";s:7:\"#000000\";s:16:\"ad_roll_bg_cover\";s:0:\"\";s:10:\"iframe_url\";s:0:\"\";s:19:\"analysis_url_switch\";i:0;s:7:\"room_id\";s:0:\"\";s:3:\"sid\";s:0:\"\";s:4:\"ssid\";s:0:\"\";s:7:\"temp_id\";s:0:\"\";s:10:\"qq_room_id\";s:0:\"\";s:13:\"douyu_room_id\";s:0:\"\";s:13:\"fixed_nav_app\";i:0;s:11:\"app_comment\";i:0;s:15:\"app_commen_tips\";s:27:\"评论只能在APP评论哦\";s:13:\"app_play_back\";i:0;s:18:\"app_play_back_tips\";s:27:\"直播只能在APP观看哦\";s:11:\"full_screen\";i:0;s:17:\"full_screen_cover\";s:0:\"\";s:15:\"full_screen_url\";s:0:\"\";s:16:\"full_screen_time\";i:5;s:29:\"admin_participant_reward_uids\";s:0:\"\";s:15:\"admin_info_uids\";s:0:\"\";s:10:\"admin_uids\";s:0:\"\";s:11:\"share_title\";s:0:\"\";s:10:\"share_desc\";s:0:\"\";s:9:\"share_img\";s:0:\"\";s:5:\"color\";s:7:\"#20a0ff\";s:6:\"fcolor\";s:7:\"#ff0000\";s:5:\"visit\";i:0;s:10:\"PcQrSwitch\";i:0;s:8:\"PcQrText\";s:39:\"扫一扫，手机观看直播更方便\";s:10:\"click_rand\";s:3:\"1-1\";s:7:\"app_ico\";s:0:\"\";}', 1, 1, 1607270400, 0, 1607352385, 1607352385, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_comment`
--

CREATE TABLE `pre_fn_live_comment` (
  `id` int(11) UNSIGNED NOT NULL,
  `rid` int(11) UNSIGNED NOT NULL,
  `lid` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `redpacket_number` int(11) UNSIGNED NOT NULL,
  `redpacket_type` tinyint(1) UNSIGNED NOT NULL,
  `redpacket_list` mediumtext NOT NULL,
  `money` decimal(11,2) UNSIGNED NOT NULL,
  `count_money` decimal(11,2) UNSIGNED NOT NULL,
  `param` mediumtext NOT NULL,
  `display` tinyint(1) UNSIGNED NOT NULL,
  `dateline` int(11) UNSIGNED NOT NULL,
  `updateline` int(11) UNSIGNED NOT NULL,
  `topdateline` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_gift`
--

CREATE TABLE `pre_fn_live_gift` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `ico` varchar(255) NOT NULL,
  `money` decimal(11,2) UNSIGNED NOT NULL,
  `display` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `displayorder` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `pre_fn_live_gift`
--

INSERT INTO `pre_fn_live_gift` (`id`, `title`, `ico`, `money`, `display`, `displayorder`) VALUES
(1, '加油', 'http://dev.yili6.com/data/attachment/forum/201909/30/122920s8iii6939isq59qt.png', '0.01', 0, 1),
(2, '笔', 'http://dev.yili6.com/data/attachment/forum/201909/30/122932ezs0ypdla0lfy00p.png', '0.02', 0, 2),
(3, '本子', 'http://dev.yili6.com/data/attachment/forum/201909/30/122945npej00v0jj96ui80.png', '0.03', 0, 3),
(4, '书包', 'http://dev.yili6.com/data/attachment/forum/201909/30/123001m664bn6a5zp5717f.png', '0.04', 0, 4),
(5, '火箭', 'http://dev.yili6.com/data/attachment/forum/201909/30/124703cjrmzj912rsrmapm.png', '0.05', 0, 5),
(6, '跑车', 'http://dev.yili6.com/data/attachment/forum/201909/30/124302teequq1gg11vbfml.png', '0.06', 0, 6),
(7, '轮船', 'http://dev.yili6.com/data/attachment/forum/201909/30/124315gq8vavgaqvdbwdwa.png', '0.07', 0, 7),
(8, '洋酒', 'http://dev.yili6.com/data/attachment/forum/201909/30/124327knkjiwmjoje4ngon.png', '0.08', 0, 8);

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_gift_log`
--

CREATE TABLE `pre_fn_live_gift_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `be_reward_id` int(11) UNSIGNED NOT NULL,
  `lid` int(11) UNSIGNED NOT NULL,
  `gift_id` int(11) UNSIGNED NOT NULL,
  `father_cid` int(11) UNSIGNED NOT NULL,
  `money` decimal(11,2) NOT NULL,
  `branch_money` decimal(11,2) UNSIGNED NOT NULL,
  `branch_state` tinyint(1) UNSIGNED NOT NULL,
  `dateline` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_info`
--

CREATE TABLE `pre_fn_live_info` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `lid` int(11) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `live_name_id` int(11) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `param` mediumtext NOT NULL,
  `display` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `dateline` int(11) UNSIGNED NOT NULL,
  `updateline` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_invite_log`
--

CREATE TABLE `pre_fn_live_invite_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `lid` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `invite_uid` int(11) UNSIGNED NOT NULL,
  `invite_ip` varchar(20) NOT NULL,
  `count` int(10) UNSIGNED NOT NULL,
  `dateline` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_number`
--

CREATE TABLE `pre_fn_live_number` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `param` mediumtext NOT NULL,
  `click` int(11) UNSIGNED NOT NULL,
  `display` tinyint(1) UNSIGNED NOT NULL,
  `dateline` int(11) UNSIGNED NOT NULL,
  `updateline` int(11) UNSIGNED NOT NULL,
  `topdateline` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `pre_fn_live_number`
--

INSERT INTO `pre_fn_live_number` (`id`, `title`, `logo`, `content`, `param`, `click`, `display`, `dateline`, `updateline`, `topdateline`) VALUES
(1, '电视直播频道', 'http://dev.yili6.com/source/plugin/fn_assembly/attachment/fn_admin/fn_15676881705d7105eadf54a.jpg', '电视直播频道电视直播频道电视直播频道电视直播频道电视直播频道电视直播频道\r\n', 'a:5:{s:6:\"banner\";a:1:{i:0;a:2:{s:3:\"img\";s:68:\"https://cdn.dz-x.net/fn_admin/20201207/fn16073493315fce3453dd7ab.jpg\";s:4:\"link\";s:0:\"\";}}s:5:\"state\";s:30:\"1=正在直播\r\n2=历史直播\";s:4:\"navs\";s:3:\"1,2\";s:10:\"navs_array\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:5:\"color\";s:7:\"#20a0ff\";}', 115, 1, 1607349356, 1607349356, 0);

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_participant`
--

CREATE TABLE `pre_fn_live_participant` (
  `id` int(11) UNSIGNED NOT NULL,
  `lid` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `param` mediumtext NOT NULL,
  `ticket` int(11) UNSIGNED NOT NULL,
  `display` tinyint(1) UNSIGNED NOT NULL,
  `dateline` int(11) UNSIGNED NOT NULL,
  `updateline` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `pre_fn_live_participant`
--

INSERT INTO `pre_fn_live_participant` (`id`, `lid`, `uid`, `username`, `name`, `number`, `thumbnail`, `mobile`, `param`, `ticket`, `display`, `dateline`, `updateline`) VALUES
(1, 1, 1, 'admin', '测试选手', '1', 'https://uc.discuz.net/data/avatar/002/75/92/80_avatar_middle.jpg', '13012345678', '', 0, 1, 1607349668, 1607349668);

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_pass_log`
--

CREATE TABLE `pre_fn_live_pass_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `lid` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `pass` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `dateline` int(11) UNSIGNED NOT NULL,
  `updateline` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_pay_log`
--

CREATE TABLE `pre_fn_live_pay_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `class_id` int(11) UNSIGNED NOT NULL,
  `number_id` int(11) UNSIGNED NOT NULL,
  `lid` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `money` decimal(11,2) UNSIGNED NOT NULL,
  `dateline` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_redpacket_log`
--

CREATE TABLE `pre_fn_live_redpacket_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `lid` int(11) UNSIGNED NOT NULL,
  `cid` int(11) UNSIGNED NOT NULL,
  `father_cid` int(11) UNSIGNED NOT NULL,
  `money` decimal(11,2) NOT NULL,
  `redpacket_type` tinyint(2) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL,
  `dateline` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_fn_live_visit_log`
--

CREATE TABLE `pre_fn_live_visit_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `lid` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `ip` varchar(20) NOT NULL,
  `count` int(10) UNSIGNED NOT NULL,
  `dateline` int(11) UNSIGNED NOT NULL,
  `updateline` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 转储表的索引
--

--
-- 表的索引 `pre_fn_live`
--
ALTER TABLE `pre_fn_live`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_comment`
--
ALTER TABLE `pre_fn_live_comment`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_gift`
--
ALTER TABLE `pre_fn_live_gift`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_gift_log`
--
ALTER TABLE `pre_fn_live_gift_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_info`
--
ALTER TABLE `pre_fn_live_info`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_invite_log`
--
ALTER TABLE `pre_fn_live_invite_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_number`
--
ALTER TABLE `pre_fn_live_number`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_participant`
--
ALTER TABLE `pre_fn_live_participant`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_pass_log`
--
ALTER TABLE `pre_fn_live_pass_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_pay_log`
--
ALTER TABLE `pre_fn_live_pay_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_redpacket_log`
--
ALTER TABLE `pre_fn_live_redpacket_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `pre_fn_live_visit_log`
--
ALTER TABLE `pre_fn_live_visit_log`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `pre_fn_live`
--
ALTER TABLE `pre_fn_live`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_comment`
--
ALTER TABLE `pre_fn_live_comment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_gift`
--
ALTER TABLE `pre_fn_live_gift`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_gift_log`
--
ALTER TABLE `pre_fn_live_gift_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_info`
--
ALTER TABLE `pre_fn_live_info`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_invite_log`
--
ALTER TABLE `pre_fn_live_invite_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_number`
--
ALTER TABLE `pre_fn_live_number`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_participant`
--
ALTER TABLE `pre_fn_live_participant`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_pass_log`
--
ALTER TABLE `pre_fn_live_pass_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_pay_log`
--
ALTER TABLE `pre_fn_live_pay_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_redpacket_log`
--
ALTER TABLE `pre_fn_live_redpacket_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_fn_live_visit_log`
--
ALTER TABLE `pre_fn_live_visit_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
