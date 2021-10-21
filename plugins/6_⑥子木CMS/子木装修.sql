-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2020-04-22 16:51:29
-- 服务器版本： 5.6.47-log
-- PHP Version: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zzb7demo`
--

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_activitylist`
--

CREATE TABLE `pre_zimucms_zhuangxiu_activitylist` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL,
  `thumb` char(200) NOT NULL,
  `typeid` smallint(3) UNSIGNED NOT NULL,
  `stime` int(10) UNSIGNED NOT NULL,
  `etime` int(10) UNSIGNED NOT NULL,
  `hstime` int(10) UNSIGNED NOT NULL,
  `hetime` int(10) UNSIGNED NOT NULL,
  `address` char(100) NOT NULL,
  `tel` char(20) NOT NULL,
  `content` text NOT NULL,
  `sort` smallint(3) UNSIGNED NOT NULL DEFAULT '100',
  `addtime` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `bbsurl` char(250) NOT NULL,
  `shoptext` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_activityuser`
--

CREATE TABLE `pre_zimucms_zhuangxiu_activityuser` (
  `id` int(10) UNSIGNED NOT NULL,
  `aid` int(10) UNSIGNED NOT NULL,
  `aidtitle` char(100) NOT NULL,
  `name` char(100) NOT NULL,
  `phone` char(20) NOT NULL,
  `addtime` int(10) UNSIGNED NOT NULL,
  `beizhu` varchar(2000) NOT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_building`
--

CREATE TABLE `pre_zimucms_zhuangxiu_building` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `name` char(30) NOT NULL,
  `pic` char(255) NOT NULL,
  `address` char(100) NOT NULL,
  `tel` char(20) NOT NULL,
  `quyu` tinyint(2) UNSIGNED NOT NULL,
  `desc` varchar(5000) NOT NULL,
  `contentname1` char(255) NOT NULL,
  `contentval1` varchar(5000) NOT NULL,
  `contentname2` char(255) NOT NULL,
  `contentval2` varchar(5000) NOT NULL,
  `contentname3` char(255) NOT NULL,
  `contentval3` varchar(5000) NOT NULL,
  `contentname4` char(255) NOT NULL,
  `contentval4` varchar(5000) NOT NULL,
  `fuwu` varchar(1000) NOT NULL,
  `buildingtype` smallint(2) UNSIGNED NOT NULL,
  `bbsurl` char(100) NOT NULL,
  `click` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `istop` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `casenums` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `gongdinums` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `designernums` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `indexsort` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `openid` varchar(2000) NOT NULL,
  `coupon` char(100) NOT NULL,
  `tosms` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `pre_zimucms_zhuangxiu_building`
--

INSERT INTO `pre_zimucms_zhuangxiu_building` (`id`, `uid`, `name`, `pic`, `address`, `tel`, `quyu`, `desc`, `contentname1`, `contentval1`, `contentname2`, `contentval2`, `contentname3`, `contentval3`, `contentname4`, `contentval4`, `fuwu`, `buildingtype`, `bbsurl`, `click`, `istop`, `casenums`, `gongdinums`, `designernums`, `status`, `indexsort`, `openid`, `coupon`, `tosms`) VALUES
(1, 1, 'A家家居惠州厂家直营店', 'https://demo.zzb7.net/source/plugin/zimucms_zhuangxiu/uploadzimucms/201712/05/213613ybzsbm8s7pb2ytsb.png', '子木CMS家居装修门户系统', '13888888888', 1, 'A家家居惠州厂家直营店', '测试', '测试&lt;span style=&quot;color:#555555;font-family:\'Lucida Grande\', Verdana, Lucida, Helvetica, Arial, Simsun, sans-serif;font-weight:bold;line-height:normal;white-space:normal;background-color:#FFFFFF;&quot;&gt;栏目一内容&lt;/span&gt;', '栏目二名称', '&lt;span style=&quot;color:#555555;font-family:\'Lucida Grande\', Verdana, Lucida, Helvetica, Arial, Simsun, sans-serif;font-weight:bold;line-height:normal;white-space:normal;background-color:#FFFFFF;&quot;&gt;栏目二内容&lt;/span&gt;', '栏目三名称', '&lt;span style=&quot;color:#555555;font-family:\'Lucida Grande\', Verdana, Lucida, Helvetica, Arial, Simsun, sans-serif;font-weight:bold;line-height:normal;white-space:normal;background-color:#FFFFFF;&quot;&gt;栏目三内容&lt;/span&gt;', '栏目四名称', '&lt;span style=&quot;color:#555555;font-family:\'Lucida Grande\', Verdana, Lucida, Helvetica, Arial, Simsun, sans-serif;font-weight:bold;line-height:normal;white-space:normal;background-color:#FFFFFF;&quot;&gt;栏目四内容&lt;/span&gt;', '', 0, 'https://demo.zzb7.net', 78, 0, 0, 0, 0, 1, 1, 'o_7iWs-xdbaqegF7QD2QxOjBauuY', '', ''),
(2, 1, '建材商家2', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 9, 0, 0, 0, 0, 1, 0, '', '', ''),
(3, 1, '建材商家3', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 8, 0, 0, 0, 0, 1, 0, '', '', ''),
(4, 1, '建材商家4', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 8, 0, 0, 0, 0, 1, 0, '', '', ''),
(5, 1, '建材商家5', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 9, 0, 0, 0, 0, 1, 0, '', '', ''),
(6, 0, '建材商家6', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 8, 0, 0, 0, 0, 1, 0, '', '', ''),
(7, 0, '建材商家7', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 7, 0, 0, 0, 0, 1, 0, '', '', ''),
(8, 0, '建材商家8', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 10, 0, 0, 0, 0, 1, 0, '', '', ''),
(9, 0, '建材商家9', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 13, 0, 0, 0, 0, 1, 0, '', '', ''),
(10, 0, '建材商家10', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 8, 0, 0, 0, 0, 1, 0, '', '', ''),
(11, 1, '建材商家11', '', '', '', 1, '', '', '', '', '', '', '', '', '', '', 1, '', 5, 0, 0, 0, 0, 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_buildingcase`
--

CREATE TABLE `pre_zimucms_zhuangxiu_buildingcase` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(255) NOT NULL,
  `thumb` char(255) NOT NULL,
  `con` mediumtext NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL,
  `addtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_daily`
--

CREATE TABLE `pre_zimucms_zhuangxiu_daily` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL,
  `thumb` varchar(1000) NOT NULL,
  `thumb2` varchar(1000) NOT NULL,
  `thumb3` varchar(1000) NOT NULL,
  `thumb4` varchar(1000) NOT NULL,
  `desc` char(255) NOT NULL,
  `fengge` smallint(2) UNSIGNED NOT NULL,
  `huxing` smallint(2) UNSIGNED NOT NULL,
  `fangshi` smallint(2) UNSIGNED NOT NULL,
  `xiaoqu` smallint(2) UNSIGNED NOT NULL,
  `xiaoquname` char(100) NOT NULL,
  `sid` int(10) UNSIGNED NOT NULL,
  `sname` char(30) NOT NULL,
  `yusuan` smallint(2) UNSIGNED NOT NULL,
  `mianji` smallint(3) UNSIGNED NOT NULL,
  `posturl` varchar(1000) NOT NULL,
  `addtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_designer`
--

CREATE TABLE `pre_zimucms_zhuangxiu_designer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(20) NOT NULL,
  `touxiang` char(255) NOT NULL,
  `zhicheng` char(20) NOT NULL,
  `linian` char(50) NOT NULL,
  `jianjie` varchar(1000) NOT NULL,
  `sid` smallint(3) UNSIGNED NOT NULL,
  `indexsort` smallint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `pre_zimucms_zhuangxiu_designer`
--

INSERT INTO `pre_zimucms_zhuangxiu_designer` (`id`, `name`, `touxiang`, `zhicheng`, `linian`, `jianjie`, `sid`, `indexsort`) VALUES
(1, '李小菡', 'https://demo.zzb7.net/source/plugin/zimucms_zhuangxiu/uploadzimucms/201711/22/090952cht6rcam3markd3l.jpg', '主案设计师', '持之以恒的学习是设计的来源，责任感是设计的原则，而灵感是设计的升华。', '工作年限：4年，毕业于湖南工程科技学院环境艺术设计专业。 学历：本科，曾就职于业之峰装饰邵阳分公司担任设计师一职、苹果装饰公司担任设计师一职、点石装饰公司担任主任设计师一职、北京圣点常州分公司担任主任设计师一职。 擅长风格：美式、Loft、现代简约、欧式新古典、地中海、新中式等 代表作品：彩虹城、凯旋城、莱蒙时代、龙湖香醍漫步、世茂香槟湖、大名城、嘉禾尚郡、绿地世纪城、香溢俊园、云山诗意、龙湖龙誉城等', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_gongdi`
--

CREATE TABLE `pre_zimucms_zhuangxiu_gongdi` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(50) NOT NULL,
  `thumb` char(255) NOT NULL,
  `sid` int(10) UNSIGNED NOT NULL,
  `qid` int(10) UNSIGNED NOT NULL,
  `huxing` tinyint(1) UNSIGNED NOT NULL,
  `fengge` tinyint(1) UNSIGNED NOT NULL,
  `yusuan` tinyint(1) UNSIGNED NOT NULL,
  `islook` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `uptime` int(10) UNSIGNED NOT NULL,
  `fangan` varchar(500) NOT NULL,
  `content1` text NOT NULL,
  `content2` text NOT NULL,
  `content3` text NOT NULL,
  `content4` text NOT NULL,
  `content5` text NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '3',
  `xiaoqu` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_news`
--

CREATE TABLE `pre_zimucms_zhuangxiu_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `sid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `typeid` int(10) UNSIGNED NOT NULL,
  `typeurl` varchar(10) NOT NULL,
  `istop` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `keywords` varchar(100) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `click` int(10) NOT NULL DEFAULT '0',
  `addtime` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `pre_zimucms_zhuangxiu_news`
--

INSERT INTO `pre_zimucms_zhuangxiu_news` (`id`, `sid`, `typeid`, `typeurl`, `istop`, `title`, `keywords`, `desc`, `thumb`, `content`, `click`, `addtime`, `status`) VALUES
(1, 0, 1, 'xuetang', 1, '子木CMS家居装修门户系统文章效果展示', '子木CMS,家居,装修,门户,系统,文章,效果,展示', '子木CMS家居装修门户系统文章效果展示', 'https://demo.zzb7.net/source/plugin/zimucms_zhuangxiu/uploadzimucms/201711/29/101828z8d9ezjp2e188jy0.png', '子木CMS家居装修门户系统文章效果展示', 0, 1511921863, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_news_type`
--

CREATE TABLE `pre_zimucms_zhuangxiu_news_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `typename` varchar(50) NOT NULL,
  `typeurl` varchar(10) NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '100',
  `isindex` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `pre_zimucms_zhuangxiu_news_type`
--

INSERT INTO `pre_zimucms_zhuangxiu_news_type` (`id`, `typename`, `typeurl`, `sort`, `isindex`) VALUES
(1, '装修学堂', 'xuetang', 100, 0);

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_parameter`
--

CREATE TABLE `pre_zimucms_zhuangxiu_parameter` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(100) NOT NULL,
  `ename` char(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `pre_zimucms_zhuangxiu_parameter`
--

INSERT INTO `pre_zimucms_zhuangxiu_parameter` (`id`, `name`, `ename`, `value`) VALUES
(1, '户型', 'huxing', '小户型,二室,三室,四室,公寓,别墅,复式,自建,排屋,公共空间'),
(2, '风格', 'fengge', '地中海,中式,美式,欧式,混搭,田园,现代,新古典,东南亚,日式,宜家,北欧,简欧,简约,韩式,法式'),
(3, '预算', 'yusuan', '5万以下,5万-8万,8万-12万,12万-18万,18万-30万,30万以上'),
(4, '局部', 'jubu', '橱柜,榻榻米,衣帽间,衣柜,背景墙,隔断,飘窗,博古架,阁楼,隐形门,吧台,书柜,酒柜,鞋柜,照片墙,灯具,过道,吊顶,窗帘,摆件,洗手台,楼梯'),
(5, '空间', 'kongjian', '厨房,客厅,卧室,书房,餐厅,卫生间,阳台,儿童房,玄关,花园'),
(6, '方式', 'fangshi', '半包,全包,清包'),
(7, '分类', 'buildingtype', '建材,家具,家电,软装,家居服务,大卖场'),
(8, '工种', 'workmen1', '木工,瓦工,水电,电工,地板,油漆工,力工,保洁工,大白工,管工');

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_quyu`
--

CREATE TABLE `pre_zimucms_zhuangxiu_quyu` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `name` char(30) NOT NULL,
  `sort` tinyint(2) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `pre_zimucms_zhuangxiu_quyu`
--

INSERT INTO `pre_zimucms_zhuangxiu_quyu` (`id`, `name`, `sort`) VALUES
(1, '广州', 100);

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_shop`
--

CREATE TABLE `pre_zimucms_zhuangxiu_shop` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `name` char(30) NOT NULL,
  `pic` char(255) NOT NULL,
  `address` char(100) NOT NULL,
  `tel` char(20) NOT NULL,
  `quyu` tinyint(2) UNSIGNED NOT NULL,
  `desc` varchar(5000) NOT NULL,
  `fuwu` char(100) NOT NULL,
  `bbsurl` char(100) NOT NULL,
  `click` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `istop` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `casenums` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `gongdinums` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `designernums` smallint(4) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `indexsort` smallint(3) UNSIGNED NOT NULL DEFAULT '0',
  `openid` varchar(2000) NOT NULL,
  `coupon` char(100) NOT NULL,
  `map_lng` char(50) NOT NULL,
  `map_lat` char(50) NOT NULL,
  `tosms` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `pre_zimucms_zhuangxiu_shop`
--

INSERT INTO `pre_zimucms_zhuangxiu_shop` (`id`, `uid`, `name`, `pic`, `address`, `tel`, `quyu`, `desc`, `fuwu`, `bbsurl`, `click`, `istop`, `casenums`, `gongdinums`, `designernums`, `status`, `indexsort`, `openid`, `coupon`, `map_lng`, `map_lat`, `tosms`) VALUES
(1, 1, '子木CMS家居装修公司', 'https://demo.zzb7.net/source/plugin/zimucms_zhuangxiu/uploadzimucms/201711/22/085945y0kzr1ki882ud5ds.jpg', 'https://demo.zzb7.net/', '13666666666', 1, '子木CMS家居装修门户系统', '子木CMS家居装修门户系统', 'https://demo.zzb7.net/', 649, 0, 1, 2, 1, 1, 1, '', '优惠活动', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_tuce`
--

CREATE TABLE `pre_zimucms_zhuangxiu_tuce` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `sid` int(10) UNSIGNED NOT NULL,
  `did` int(10) UNSIGNED NOT NULL,
  `dname` char(50) NOT NULL,
  `huxing` tinyint(1) UNSIGNED NOT NULL,
  `fengge` tinyint(1) UNSIGNED NOT NULL,
  `yusuan` tinyint(1) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `vrurl` char(255) NOT NULL,
  `click` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `tuijian` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `xiaoqu` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `pre_zimucms_zhuangxiu_tuce`
--

INSERT INTO `pre_zimucms_zhuangxiu_tuce` (`id`, `title`, `keywords`, `desc`, `sid`, `did`, `dname`, `huxing`, `fengge`, `yusuan`, `content`, `thumb`, `vrurl`, `click`, `status`, `tuijian`, `xiaoqu`) VALUES
(1, '子木CMS家居装修门户系统幻灯片效果展示', '子木CMS,家居装修,门户系统,幻灯片,效果,展示', '子木CMS家居装修门户系统幻灯片效果展示', 1, 1, '', 1, 1, 1, '子木CMS家居装修门户系统幻灯片效果展示', 'https://demo.zzb7.net//source/plugin/zimucms_zhuangxiu/uploadzimucms/201711/29/101536slor0soom688k86k.png', 'https://yun.kujiale.com/design/3FO454ICK5DF/airoaming?from=singlemessage&isappinstalled=0', 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_workmen`
--

CREATE TABLE `pre_zimucms_zhuangxiu_workmen` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `name` char(100) NOT NULL,
  `thumb` varchar(300) NOT NULL,
  `age` smallint(3) UNSIGNED NOT NULL,
  `intro` varchar(500) NOT NULL,
  `con` mediumtext NOT NULL,
  `tel` char(11) NOT NULL,
  `quyu` int(10) UNSIGNED NOT NULL,
  `wid` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `sort` tinyint(3) UNSIGNED NOT NULL,
  `views` int(10) UNSIGNED NOT NULL,
  `addtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_xiaoqu`
--

CREATE TABLE `pre_zimucms_zhuangxiu_xiaoqu` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(100) NOT NULL,
  `thumb` char(255) NOT NULL,
  `intro` varchar(1000) NOT NULL,
  `address` char(255) NOT NULL,
  `views` int(10) UNSIGNED NOT NULL,
  `sort` smallint(3) UNSIGNED NOT NULL,
  `quyu` smallint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `pre_zimucms_zhuangxiu_yuyue`
--

CREATE TABLE `pre_zimucms_zhuangxiu_yuyue` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(20) NOT NULL,
  `phone` char(20) NOT NULL,
  `sid` int(10) UNSIGNED DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `beizhu` varchar(2000) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `addtime` int(10) UNSIGNED NOT NULL,
  `status` smallint(2) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `pre_zimucms_zhuangxiu_yuyue`
--

INSERT INTO `pre_zimucms_zhuangxiu_yuyue` (`id`, `name`, `phone`, `sid`, `content`, `beizhu`, `type`, `addtime`, `status`) VALUES
(1, '恶趣味', '13810787788', 0, '来源页面：首页<br>类型：免费设计<br>', '', 1, 1512006896, 1),
(2, '聚品楼装', '17770022554', 0, '来源页面：首页<br>类型：免费设计<br>', '', 1, 1512040778, 1),
(3, '朱海', '15519145018', 0, '来源页面：免费量房设计页WAP<br>类型：免费量房设计<br>小区名称：花溪大学城<br>', '', 1, 1522427107, 1),
(4, '545', '13854000000', 0, '来源页面：免费量房设计页<br>类型：免费量房设计<br><br>房屋面积：455<br>装修预算：12万-18万<br>是否婚房：是<br>其它需求：565<br>', '', 1, 1528689837, 1),
(5, '111', '13111111111', 1, '来源页面：找装修公司列表<br>类型：免费设计<br>', '', 1, 1529819690, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pre_zimucms_zhuangxiu_activitylist`
--
ALTER TABLE `pre_zimucms_zhuangxiu_activitylist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_activityuser`
--
ALTER TABLE `pre_zimucms_zhuangxiu_activityuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_building`
--
ALTER TABLE `pre_zimucms_zhuangxiu_building`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_buildingcase`
--
ALTER TABLE `pre_zimucms_zhuangxiu_buildingcase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_daily`
--
ALTER TABLE `pre_zimucms_zhuangxiu_daily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_designer`
--
ALTER TABLE `pre_zimucms_zhuangxiu_designer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_gongdi`
--
ALTER TABLE `pre_zimucms_zhuangxiu_gongdi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_news`
--
ALTER TABLE `pre_zimucms_zhuangxiu_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_news_type`
--
ALTER TABLE `pre_zimucms_zhuangxiu_news_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_parameter`
--
ALTER TABLE `pre_zimucms_zhuangxiu_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_quyu`
--
ALTER TABLE `pre_zimucms_zhuangxiu_quyu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_shop`
--
ALTER TABLE `pre_zimucms_zhuangxiu_shop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_tuce`
--
ALTER TABLE `pre_zimucms_zhuangxiu_tuce`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_workmen`
--
ALTER TABLE `pre_zimucms_zhuangxiu_workmen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_xiaoqu`
--
ALTER TABLE `pre_zimucms_zhuangxiu_xiaoqu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_zimucms_zhuangxiu_yuyue`
--
ALTER TABLE `pre_zimucms_zhuangxiu_yuyue`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_activitylist`
--
ALTER TABLE `pre_zimucms_zhuangxiu_activitylist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_activityuser`
--
ALTER TABLE `pre_zimucms_zhuangxiu_activityuser`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_building`
--
ALTER TABLE `pre_zimucms_zhuangxiu_building`
  MODIFY `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_buildingcase`
--
ALTER TABLE `pre_zimucms_zhuangxiu_buildingcase`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_daily`
--
ALTER TABLE `pre_zimucms_zhuangxiu_daily`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_designer`
--
ALTER TABLE `pre_zimucms_zhuangxiu_designer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_gongdi`
--
ALTER TABLE `pre_zimucms_zhuangxiu_gongdi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_news`
--
ALTER TABLE `pre_zimucms_zhuangxiu_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_news_type`
--
ALTER TABLE `pre_zimucms_zhuangxiu_news_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_parameter`
--
ALTER TABLE `pre_zimucms_zhuangxiu_parameter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_quyu`
--
ALTER TABLE `pre_zimucms_zhuangxiu_quyu`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_shop`
--
ALTER TABLE `pre_zimucms_zhuangxiu_shop`
  MODIFY `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_tuce`
--
ALTER TABLE `pre_zimucms_zhuangxiu_tuce`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_workmen`
--
ALTER TABLE `pre_zimucms_zhuangxiu_workmen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_xiaoqu`
--
ALTER TABLE `pre_zimucms_zhuangxiu_xiaoqu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `pre_zimucms_zhuangxiu_yuyue`
--
ALTER TABLE `pre_zimucms_zhuangxiu_yuyue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
