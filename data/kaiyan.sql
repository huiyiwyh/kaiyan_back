-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-05-08 04:38:51
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Database: `kaiyan`
--
CREATE DATABASE IF NOT EXISTS `kaiyan` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `kaiyan`;


DELIMITER $$
--
-- 存储过程
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRecommendAuthor` ()  BEGIN
	SELECT * FROM view_subject;
    SELECT * FROM view_subject ORDER BY date DESC;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `cmessfocus`
--

CREATE TABLE `cmessfocus` (
  `Ufid` int(11) NOT NULL COMMENT '关注号',
  `Xsender` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '发送者账号',
  `Greceiver` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '接收者账号',
  `Qdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '关注日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `cmessfocus`
--

INSERT INTO `cmessfocus` (`Ufid`, `Xsender`, `Greceiver`, `Qdate`) VALUES
(1, '879646527', '879646529', '2018-03-21 14:05'),
(2, '879646528', '879646529', '2017-11-07 08:24');

-- --------------------------------------------------------

--
-- 表的结构 `dmesscomment`
--

CREATE TABLE `dmesscomment` (
  `Ecid` int(11) NOT NULL COMMENT '评论号',
  `Vsender` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '发送者账号',
  `Dreceiver` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '接收者账号',
  `Odate` char(16) COLLATE utf8_bin NOT NULL COMMENT '评论日期',
  `Scontent` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `Particle` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '评论文章',
  `Rtype` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '评论类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `dmesscomment`
--

INSERT INTO `dmesscomment` (`Ecid`, `Vsender`, `Dreceiver`, `Odate`, `Scontent`, `Particle`, `Rtype`) VALUES
(1, '879646528', '879646529', '2017-07-13 14：25', '好的，谢谢雷锋', '879646529180325140728', '0');

-- --------------------------------------------------------

--
-- 表的结构 `fuserlike`
--

CREATE TABLE `fuserlike` (
  `Hulid` int(11) NOT NULL COMMENT '用户喜欢号',
  `Taid` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Rautaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '作者账号',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Idate` char(16) COLLATE utf8_bin NOT NULL COMMENT '喜欢日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `hautfocus`
--

CREATE TABLE `hautfocus` (
  `Yafid` int(11) NOT NULL COMMENT '作者关注号',
  `Tautaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '作者账号',
  `Daccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `hautfocus`
--

INSERT INTO `hautfocus` (`Yafid`, `Tautaccount`, `Daccount`) VALUES
(1, '879646528', '879646529');

-- --------------------------------------------------------

--
-- 表的结构 `hmesslike`
--

CREATE TABLE `hmesslike` (
  `Tlid` int(11) NOT NULL COMMENT '喜欢号',
  `Ssender` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '发送者账号',
  `Ireceiver` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '接收者账号',
  `Wdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '喜欢日期',
  `Varticle` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '喜欢文章'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `hsubject`
--

CREATE TABLE `hsubject` (
  `Usid` int(11) NOT NULL COMMENT '专题号',
  `Yname` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '专题名称',
  `Kbrief` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '专题介绍',
  `Uthumbnail` varchar(150) COLLATE utf8_bin DEFAULT '' COMMENT '缩略图',
  `Ebelong` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '所属用户',
  `Hcountarticle` int(11) NOT NULL COMMENT '文章数',
  `Scountfocus` int(11) NOT NULL COMMENT '关注数',
  `Ydate` char(16) COLLATE utf8_bin NOT NULL COMMENT '创建日期',
  `Blabel` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '专题标签'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `hsubject`
--

INSERT INTO `hsubject` (`Usid`, `Yname`, `Kbrief`, `Uthumbnail`, `Ebelong`, `Hcountarticle`, `Scountfocus`, `Ydate`, `Blabel`) VALUES
(1, '旅游', '“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。所以，旅行偏重于行，旅游不但有“行”，且有观光、娱乐含义。', 'kaiyan/subject/1.jpg', '879646528', 2, 127, '', ''),
(2, '移动端开发', 'https://www.cnblogs.com/qijunj...  - 百度快照\r\n移动开发_百度百科\r\n移动开发也称为手机开发，或叫做移动互联网开发。是指以手机、PDA、UMPC等便携终端为基础，进行相应的开发工作。', 'kaiyan/subject/2.jpg', '879646529', 3, 84, '', ''),
(3, '前端开发', '扬我大前端！', 'kaiyan/subject/3.jpg', '879646529', 2, 1041, '', ''),
(2946981, '想法', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'deeea9e09cbc', 0, 67, '2018-04-16 16:02', ''),
(4094691, '一张褪色的相片', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', '9019674f5808', 0, 27, '2018-04-17 17:28', ''),
(4306614, '日记本', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', '6e176873807c', 0, 6, '2018-04-16 16:02', ''),
(4492068, '日记本', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', '61d710a4a0ce', 0, 3, '2018-04-16 16:02', ''),
(4607718, '羊小屋', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'ce94d617e045', 0, 13, '2018-04-16 16:02', ''),
(5185065, '日记本', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', '12532d36e4da', 0, 14, '2018-04-17 17:28', ''),
(7168960, '大萌专属', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', '21a7a893f4b7', 0, 71, '2018-04-16 16:02', ''),
(7319751, '每日一文', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', '51995510ee0a', 0, 18, '2018-04-16 16:02', ''),
(8573569, '磊少杂谈\n       ', '\n          所谓正确的坚持，在我看来，它不一定是最有希望取得成功的，但一定是我们所喜欢的。正如写作。\n\n\n\n          \n            \n              互联网\n              评论\n          ', '//upload.jianshu.io/book/image/8732a263-2b3a-4402-a232-eb714eb84005.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', '27e866de5623', 0, 55, '2018-04-17 17:28', ''),
(8747457, '个人成长\n       ', '\n          暂无简介\n\n          \n            \n              成长\n          \n      ', '//upload.jianshu.io/book/image/57592c95-2d41-4aea-a3f2-5ae09df626ef.png?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', 'fee4b4b0b89e', 0, 4150, '2018-04-17 17:28', ''),
(9984068, '秋水集\n        ', '\n          一位理工男的精神家园，一位伪文人的深情咏叹，一位色影师的风光大片。三原则：图原创，文原创，诗原创。\n\n          \n            \n              旅行\n              摄影\n        ', '//upload.jianshu.io/book/image/e7ce01c7-1d50-471a-9d46-0e21dcba1335?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', 'a7f876850fa6', 0, 209, '2018-04-16 16:02', ''),
(10212711, '日记本', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'f79de69d59e3', 0, 3, '2018-04-17 17:28', ''),
(10418656, '那些年看过的影视作品', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', '384c2f242cdb', 0, 0, '2018-04-16 16:02', ''),
(10499034, '人生感悟', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'd607c9779545', 0, 1, '2018-04-16 16:02', ''),
(12270173, '静录\n         ', '\n          静静地记录生活。\n\n          \n            \n              散文随笔\n              生活\n          \n      ', '//upload.jianshu.io/book/image/7040b275-5454-4c43-8e11-55bf2d6da7c8?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', '778731a5f6fc', 0, 65, '2018-04-16 16:02', ''),
(12320117, '走在路上的蔡小卿\n   ', '\n          暂无简介\n\n          \n            \n              旅行\n          \n      ', '//upload.jianshu.io/book/image/489d748b-ecad-41b1-8ed4-fc523bddd3d3?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', '8c55431ed909', 0, 384, '2018-04-16 16:02', ''),
(12362519, '日记本', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'd6875d11fafd', 0, 1, '2018-04-16 16:02', ''),
(12831617, '读书留痕\n       ', '\n          一个人的阅读史，就是他的精神成长史。对于一位写作者来说，阅读史，就是语言风格逐渐形成的足迹。每每用心读一本书，必定留���自己思考的辙痕……\n\n          \n            \n              影评\n    ', '//upload.jianshu.io/book/image/f3c20df3-7b47-4b0b-92de-c552d8c319b6?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', '81310278129d', 0, 70, '2018-04-16 16:02', ''),
(12987778, '纪年＊感怀集', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'dbb14da93531', 0, 0, '2018-04-16 16:02', ''),
(14364349, '甜甜的白开水\n     ', '\n          你别难过，风筝有风，海豚有海，而你，还有我\n\n\n\n\n\n          \n            \n              青春\n              校园\n              小说精选\n          \n  ', '//upload.jianshu.io/book/image/a8092cfc-a64c-46ee-8a12-6095bd660925?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', 'd3fd05d71dec', 0, 375, '2018-04-17 17:28', ''),
(15176780, '人生正清欢『预计更新XX', '\n          写人生思考，谈生命的意义，用最温暖又扎心的文字说说那一段一段时间的过往，蓝胖说说，一个70后中年大叔人生的回忆，与你一起清欢\n\n          \n            \n              散文随笔\n          ', '//upload.jianshu.io/book/image/f3c49aee-09c9-41f9-8714-6eb710396dd1?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', '604159f29174', 0, 591, '2018-04-16 16:02', ''),
(15688612, '山青青美食故事文集\n  ', '\n          与友友们分享山青青原创的美食，分享山青青原创的故事，分享山青青原创的图片！\n\n          \n            \n              故事\n              生活\n          \n      ', '//upload.jianshu.io/book/image/16e8a90e-6d5e-4511-bd33-f93a3e615899?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', '9617ac822dc6', 0, 671, '2018-04-17 17:28', ''),
(17889974, '娱乐志\n        ', '\n          暂无简介\n\n          \n            \n              明星\n              人物传\n          \n      ', '//upload.jianshu.io/book/image/686bf667-1a6f-4d35-b04a-8616da037e6a?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', '2b3ad4f2a058', 0, 1128, '2018-04-16 16:02', ''),
(18480875, '日记本', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'd8c6bb6cbe0c', 0, 3, '2018-04-17 17:28', ''),
(18630507, '繁杂观点', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'd0be5ae77914', 0, 5, '2018-04-16 16:02', ''),
(18630512, '缤纷故事', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'd0be5ae77914', 0, 1, '2018-04-17 17:28', ''),
(19542500, '人物专访', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', '14ea11f850f3', 0, 0, '2018-04-16 16:02', ''),
(20834335, '巴西哥爱旅行\n     ', '\n          暂无简介\n\n          \n            \n              旅行\n              海外\n          \n      ', '//upload.jianshu.io/book/image/bfeb2085-2c63-4cf2-aabf-6bb58635c169?imageMogr2/auto-orient/strip|imageView2/1/w/214/h/286', 'cab027d5878e', 0, 26, '2018-04-16 16:02', ''),
(21551276, '日记本', '', '//cdn2.jianshu.io/assets/default_avatar/avatar-notebook-default-640f7dde88592bdf6417d8ce1902636e.png', 'c0df9f7c15fa', 0, 1, '2018-04-17 17:28', '');

-- --------------------------------------------------------

--
-- 表的结构 `jexamine`
--

CREATE TABLE `jexamine` (
  `Rid` int(11) NOT NULL COMMENT '审核号',
  `Caid` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Usid` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '专题号',
  `Gaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Edate` char(16) COLLATE utf8_bin NOT NULL COMMENT '申请日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `larticle`
--

CREATE TABLE `larticle` (
  `Xaid` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Psid` int(11) DEFAULT '0' COMMENT '专题号',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Dtitle` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '文章标题',
  `Tcontent` varchar(8192) COLLATE utf8_bin NOT NULL COMMENT '文章内容',
  `Rdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '文章日期',
  `Klike` int(11) DEFAULT '0' COMMENT '喜欢数',
  `Wcomment` int(11) DEFAULT '0' COMMENT '评论数',
  `Oread` int(11) DEFAULT '0' COMMENT '阅读数',
  `Kpicture` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图',
  `Vlabel` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '文章标签'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `larticle`
--

INSERT INTO `larticle` (`Xaid`, `Psid`, `Vaccount`, `Dtitle`, `Tcontent`, `Rdate`, `Klike`, `Wcomment`, `Oread`, `Kpicture`, `Vlabel`) VALUES
('027d0d25a7a7', 17889974, '2b3ad4f2a058', '48岁古天乐封帝：25年后 ，我终于等到你', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 630px; max-height: 403px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 63.970000000000006%;\"></div>\n<div class=\"image-view\" data-width=\"630\" data-height=\"403\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-10689ab268420806.png\" data-original-width=\"630\" data-original-height=\"403\" data-original-format=\"image/png\" data-original-filesize=\"369315\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>文/麦大人</p><p></p><h2>01</h2><blockquote><p><b>终于等到你，还好我没放弃</b></p></blockquote><p>1994年，当时已红透半边天的哥哥张国荣，正在上吴君如和黄伟文的电台节目，主持人要他说几个自己比较看好的新人。</p><p><b>哥哥便点名力捧了当时的两位新人，他说唱歌方面看好古巨基，电影方面看好古天乐。</b></p><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 648px; max-height: 798px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 114.04%;\"></div>\n<div class=\"image-view\" data-width=\"648\" data-height=\"739\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-1a3d09b029fd6a6d\" data-original-width=\"648\" data-original-height=\"739\" data-original-format=\"image/jpeg\" data-original-filesize=\"68260\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>彼时的古仔，刚刚签约TVB，还是跑龙套的角色。但因为哥哥这几句话，使得他备受关注。</p><p>但命运却似跟他开了天大的玩笑。</p><p>出道25年，拍了100多部电影，三次陪跑的他，第四次不负所望，今天终于摘下了梦寐以求的金像奖影帝。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 535px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 76.44999999999999%;\"></div>\n<div class=\"image-view\" data-width=\"981\" data-height=\"750\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-ffc6fe4bbe836d7d\" data-original-width=\"981\" data-original-height=\"750\" data-original-format=\"image/jpeg\" data-original-filesize=\"74271\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>今年有60，70两代“杨过”华仔，古仔角逐影帝桂冠。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 379px; max-height: 195px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 51.449999999999996%;\"></div>\n<div class=\"image-view\" data-width=\"379\" data-height=\"195\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-2569b272445a31f7\" data-original-width=\"379\" data-original-height=\"195\" data-original-format=\"image/gif\" data-original-filesize=\"1561897\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>更有被哥哥深爱过的一代女神毛舜筠，凭借一部《黄金花》终于拿影后。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 491px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 70.28%;\"></div>\n<div class=\"image-view\" data-width=\"1080\" data-height=\"759\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-3bd392b86a20f38d\" data-original-width=\"1080\" data-original-height=\"759\" data-original-format=\"image/jpeg\" data-original-filesize=\"95819\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>视帝加影帝，哥哥说过那个“未来会影响香港影坛”的年轻人，终于在自己的48岁得到了承认。</p><p>古仔在获奖感言里说：</p><blockquote><p>从台下到颁奖台，距离这么短，对很多人来说可能很近，但是对我来说，好像走了几个世纪那么远。</p></blockquote><p><br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 341px; max-height: 209px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 61.29%;\"></div>\n<div class=\"image-view\" data-width=\"341\" data-height=\"209\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-726527f62b842f5a\" data-original-width=\"341\" data-original-height=\"209\" data-original-format=\"image/gif\" data-original-filesize=\"571495\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>人生没有白走的路，成功有很多因素，不乏有际遇方面，但归根结底还是实力说了算。</b></p><p><br></p><h2>02</h2><blockquote><p><b>一见杨过误终身</b></p></blockquote><p>其实古仔进入演艺圈，纯属巧合。</p><p>他生在香港一个四口之家，从小母亲管得严，初中毕业就进入社会。期间做过搬运工，当过麦当劳服务员，卖过衣服，也做过保安等。</p><p>20岁时，因为卷入一场海港城厕所抢劫案，而被判决在教导所服役22个月。出狱后，没有人愿意雇用他，他以为自己一辈子也就这样了，前途一片茫然。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 987px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 141.09%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"903\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-f77899272490aff4\" data-original-width=\"640\" data-original-height=\"903\" data-original-format=\"image/jpeg\" data-original-filesize=\"84715\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>却万万没想到，在他做业余星探时，意外被广告公司老板看中，拍了一些跑龙套的广告。后来，广告公司倒闭，他进入了TVB。</p><p>24岁，他出演了《餐餐有宋家》里的小配角：戏份虽然不多，但360无死角的帅气，瞬间引起了无数人的关注。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 630px; max-height: 357px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.67%;\"></div>\n<div class=\"image-view\" data-width=\"630\" data-height=\"357\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-5a0c0fa00cc79855\" data-original-width=\"630\" data-original-height=\"357\" data-original-format=\"image/jpeg\" data-original-filesize=\"29669\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>这为他赢来了人生中第一个男主角——95版《神雕侠侣》里的杨过，麦叔觉得古天乐和李若彤版的《神雕》是经典中的经典，至今无法超越。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 522px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 65.25%;\"></div>\n<div class=\"image-view\" data-width=\"800\" data-height=\"522\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-2005d2cf4a9edf5c\" data-original-width=\"800\" data-original-height=\"522\" data-original-format=\"image/jpeg\" data-original-filesize=\"89183\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>古仔饰演的杨过，剑眉入鬓、英气逼人，狂放深又亦正亦邪，桀骜不驯又侠骨柔情。电视剧播出后，再加上他的盛世美颜，一夜成名。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 240px; max-height: 120px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 50.0%;\"></div>\n<div class=\"image-view\" data-width=\"240\" data-height=\"120\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-6569781076e9c4f7\" data-original-width=\"240\" data-original-height=\"120\" data-original-format=\"image/gif\" data-original-filesize=\"503627\"></div>\n</div>\n<div class=\"image-caption\">风陵渡口初相遇，一见杨过误终身</div>\n</div><p>江湖更是流传着一句话：一见杨过误终身。</p><p>自从拍完那部戏后，古仔和李若彤就没有再见面，直到16年后的2011年3月，两人在飞往云南的飞机上偶遇。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 742px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 106.04%;\"></div>\n<div class=\"image-view\" data-width=\"960\" data-height=\"1018\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-208750b426428024\" data-original-width=\"960\" data-original-height=\"1018\" data-original-format=\"image/jpeg\" data-original-filesize=\"76963\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>巧合的是，古仔竟脱口而出<b>：</b><b>姑姑。</b></p><p><b>他笑言道：姑姑还是那样，过儿却已经老了。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 755px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 107.87%;\"></div>\n<div class=\"image-view\" data-width=\"801\" data-height=\"864\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-b3ccb8929b71da9a\" data-original-width=\"801\" data-original-height=\"864\" data-original-format=\"image/jpeg\" data-original-filesize=\"79541\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>相信不少人已经泪流满面，递纸巾…</p><p>次年，他带着《圆月弯刀》里的丁鹏横空出世，一时间，古仔成了万千少女的梦中情人。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 480px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.0%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"480\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-0caa593cffa8ba4b\" data-original-width=\"640\" data-original-height=\"480\" data-original-format=\"image/jpeg\" data-original-filesize=\"24163\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>从无名小卒到TVB一线小生，他只用了三年时间。后来，为了摆脱“奶油小生”的头衔，也方便化妆，古仔在自黑的路上越走越远，成了今天的古铜色中年帅大叔。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 603px; max-height: 649px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 107.63000000000001%;\"></div>\n<div class=\"image-view\" data-width=\"603\" data', '2018/04/16 14:13', 193607, 1789, 273513, 'https://upload-images.jianshu.io/upload_images/2259045-10689ab268420806.png', ''),
('065aa43a272d', 2946981, 'deeea9e09cbc', '印度高分电影《起跑线》：“穷人是没有资格大喜大悲的！”', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 600px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"900\" data-height=\"600\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1442902-93158b75e323f2e5\" data-original-width=\"900\" data-original-height=\"600\" data-original-format=\"image/jpeg\" data-original-filesize=\"119623\"></div>\n</div>\n<div class=\"image-caption\">图 | 网络</div>\n</div><p><b>01</b></p><p>脱口秀主持人王自健讲过一个段子，现在很多家长逼着孩子学习，怕孩子输在起跑线上了。我就纳闷了，<b>王思聪不去上补习班、兴趣班，他就输在起跑线上了？人家一出生就在终点线上了</b>。</p><p>北京高考状元熊轩昂说，农村地区的孩子，越来越难考上好学校。像我这种属于中产阶级家庭的孩子，衣食无忧，家长也都是知识分子，在北京这种大���市能享受到的教育资源，决定了我在学习时能走很多捷径。<b>能看到现在很多状元都是家里厉害，又有能力的人。</b></p><p>《围炉夜话》有一言，“富家惯习骄奢，最难教子；寒士欲谋生活，还是读书”。可是，<b>当“寒门再难出贵子”成为社会的主论调，读书之路也被封死，真正刺破现实真相的，反而是那些毒鸡汤。</b></p><p>条条大路通罗马，有的人却生在罗马。</p><p>有时你拼尽全力，还不如人家随便搞搞。</p><p>你努力的天花板，竟然只是人家的起点。</p><p><b>02</b></p><p>豆瓣评分8.1的印度电影《起跑线》，讲的就是一对夫妇为了让孩子能够从小就获得最好的教育、走上人生巅峰而绞尽脑汁择校的故事。</p><p>拉吉和米塔是一对刚进入中产阶级的夫妻，虽然积累了一定的财富，知识文化却达不到上流人士该有的水平。<b>他们不希望女儿皮娅重蹈自己的覆辙，便决定将她送进全印度最好的私立幼儿园，然后再考进名校实现阶层跃迁。</b></p><p>他们先是买���一套学区房，再伪装成上层阶级，参加各种高级派对，说一口蹩脚的英语。为了给孩子拿到申请名额，半夜12点就在学校门口排队，不惜斥巨资找入学顾问培训。</p><p>可即使他们费尽心力，孩子的申请还是被学校拒绝了，因为<b>学校不愿接收服装店老板的孩子，担心拉吉夫妇的家庭教育跟不上。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 560px; max-height: 314px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.07%;\"></div>\n<div class=\"image-view\" data-width=\"560\" data-height=\"314\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1442902-f3ab825004702535\" data-original-width=\"560\" data-original-height=\"314\" data-original-format=\"image/gif\" data-original-filesize=\"1264862\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>在皮娅四次落榜后，送来喜饼的店员点醒了这对心灰意冷的夫妇。按照教育部规定，每个学校都会留出极少数的名额给贫困生，他们可以伪造材料去争取贫困名额。</p><p>拉吉夫妇又花了一笔钱，把所有的贫困材料都搞到了手，但由于有人举报暗箱操作，迫于舆论压力，学校决定派出专人核实贫困生的家庭情况。</p><p>为了不让事情败露，拉吉夫妇只能举家搬进贫民区。贫民区的生活泪中带笑，房间里的老鼠乱窜，上完厕所没有水冲，坐外挂式公交车上班，领政府补给粮……</p><p><b>这一切，都赤裸裸地展现了穷人生活的不易。</b></p><p></p><p><b>03</b></p><p>想要搞清楚拉吉夫妇为什么会削尖脑袋想要把女儿送进一等幼儿园，得先了解印度的选拔制度。</p><p>和中国的高考类似，印度的人生大考JEE以其难度之高及录取率之低而闻名遐迩，考题以主观题为主，基本上都是原创，不会出现过往考过的题型。备考的过程中，考生必须大段大段地背诵数理化的原文。</p><p>印度最好的大学叫印度理工学院，是由印度政府出资在印度各地建成的七所工程技术学院的总称，是印度最顶尖的工程教育与研究机构，被称为印度“科学皇冠上的瑰宝”。</p><p>美国脱口秀主持人曾这样调侃说，把哈佛、麻省理工和普林斯顿三所大学加在一块儿，就是印度理工学院在印度的地位。</p><p>老师们也会鼓励即将参加JEE考试的拔尖学生，<b>如果你不好好努力，考不上印度理工，就只能去麻省理工。</b></p><p>每年，在印度的学习圣地科塔，共有60万人在准备JEE，最后只有不到5000人可以升入印度理工，录取率0.8%。</p><p>为了能踏上这条真正千军万马通过的独木桥，JEE考试50%以上的学生是复读生，每天坚持学习12个小时。</p><p>因为，<b>对于很多人来说，印度理工学院的毕业证，是他们唯一能够摆脱贫穷和出身的希望。</b>进入这所大学，他们就有机会成为美国硅谷的创业者和NASA的职员。</p><p>全球最难的大学入学考与涉及阶层跃升的顶级名校诱惑，无疑犹如整个印度教育的指挥棒，<b>以致于有的家长怀孕初期就开始为孩子作准备了。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 560px; max-height: 314px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.07%;\"></div>\n<div class=\"image-view\" data-width=\"560\" data-height=\"314\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1442902-5249afff3a1f5f7a\" data-original-width=\"560\" data-original-height=\"314\" data-original-format=\"image/gif\" data-original-filesize=\"412752\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p></p><p><b>04</b></p><p>《起跑线》的英文名是《Hindi Medium》，直译为“印度中产”，电影刺破了印度社会面临的两大敏感问题，优质教育资源稀缺和阶级固化。</p><p>在西方发达国家，社会阶层早已固化，中产阶级希冀的精英教育不过是为了自保。而在印度这样新兴的市场大国，<b>虽然艰难，努力了还能考进名校，反倒是教育给了大家最公平的机会。</b></p><p>拉吉夫妇属于“新中产”，他们接受的文化教育不多，虽然有了足够的财力支撑他们中产的地位，却还是为了下一代是否能保持中产的位置充满焦虑。</p><p>更重要的是，他们虽然看起来衣食无忧，却没有比穷人更多的安全感。<b>过去的贫困还历历在目，他们没有办法放宽心态，从焦虑的困境中脱离出来。</b></p><p>由于知识的更新换代加剧，富人的孩子因为得天独厚的条件，既是应试教育中的成功人士，也是素质教育中的佼佼者；穷人的孩子由于从小就没有知识触感，无论是应试还是素质都已经处于劣势。</p><p><b>事实上，应试教育和素质教育这样的二分法已经终结。个人、家庭、学校、社会，各种教育形式的相互影响和支撑，背后闪烁着的是父母的社会位置所能提供的红利。</b></p><p>教育越来越像是一场战争，从幼儿园入学到出国留学，到处硝烟弥漫。</p><p><b>05</b></p><p>电影最震撼人心的一个片段，是贫民区的希亚姆安慰儿子说：“学校不录取你，不是你不幸运，是学校的不幸。”</p><p>彼时，他在他妻儿和拉吉一家面前，因为情绪失控哭得像个孩子。然后又立即收起眼泪说：“<b>穷人就是这样，没资格大喜大悲。</b>”</p><p>仿佛一贫如洗的他，片刻的悲伤都是���可原谅的错，<b>生活于他而言，真的太艰难了。</b></p><p>然而讽刺的是，喝不起瓶装矿泉水的他，却有着腰缠万贯的人比不上的善心。为了帮助拉吉筹集学费，他甚至冒着被撞死的生命危险去碰瓷。<b>当他把钱交给拉吉的时候，观众的心也跟着一起碎了。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 560px; max-height: 314px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.07%;\"></div>\n<div class=\"image-view\" data-width=\"560\" data-height=\"314\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1442902-0c3f5cb1a92f9ea9\" data-original-width=\"560\" data-original-height=\"314\" data-original-format=\"image/gif\" data-original-filesize=\"588041\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>最后，拉吉在开学典礼上揭露学校的各种潜规则，试图用演讲把一切都挑破，却像一记重拳打在了棉花上。</p><p>几乎所有的家长都无动于衷，<b>就算有少数几个感性的家长被打动，也会在旁边人的制止下继续保持冷酷与无情。</b></p><p>拉吉选择把女儿转到公立学校，完成灵魂的救赎，同时教会妻女善良与正义，但是<b>作为一个打破规则的人，会不会因为动了既得利益者的奶酪而成为众矢之的���</b></p><p>就像校长说的那样，政客的孩子在我这里，富商的孩子在我这里，有能力有力量的人都在我这里，你又能怎么样？</p><p><b>06</b></p><p><b>有阶级不可怕，可怕的是阶级固化，更可怕的是，寒门学子连教育这张入场券的资格都要被剥夺。</b></p><p>人性的阴暗往往多过光芒，平民百姓希望法则公平公正，自己的孩子能占有一份教育资源。富家子弟希望有后门可以走，以便牢牢掌控教育资源。</p><p>社会精英或权力阶层通过传承，顺利地完成了权力和财富的交接，而使它们继续固化下去。</p><p>一个人身居高位，其家族会顺其自然地晋升为既得利益者，占据上升渠道的有利位置，而寒门学子可能需要花费更大更多的努力，才能完成阶层的跨越和进化。</p><p><b>人和人终究是有高低差别的，承认上帝本来就是不公平的，然后利用他施舍给你的一切去获得更多，才是寒门学子应该清楚认识的东西。</b></p><p>值得庆幸的是，我们生活在一个伟大的国度，可以全民一起奔小康，当然不必过度焦虑。<b>就算没有起跑线，只要你不认输，也能靠着个人的奋斗，过上理想的生活。</b></p><p>穷且益坚，不坠青云之志，<b>有些人陨落，有些人挣扎，愿你脱颖而出。</b></p><p><b>-----------------------</b></p><p><b>我的新书正在销售中，点击<a href=\"https://link.jianshu.com?t=https%3A%2F%2Fweidian.com%2Fitem.html%3FitemID%3D2127055052%26ifr%3Ditemdetail%26wfr%3Dc\" target=\"_blank\" rel=\"nofollow\">《梦想不会辜负努力的你》</a>可购买签名版。</b></p>\n          ', '2018/04/08 08:46', 1975, 1188, 2952, 'https://upload-images.jianshu.io/upload_images/1442902-93158b75e323f2e5', ''),
('06869f16b748', 8573569, '27e866de5623', '2018，微商呈现出哪些趋势？', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 613px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 59.86%;\"></div>\n<div class=\"image-view\" data-width=\"1024\" data-height=\"613\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4135353-297f993c0fb8b2e1.jpg\" data-original-width=\"1024\" data-original-height=\"613\" data-original-format=\"image/jpeg\" data-original-filesize=\"21226\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p>文/磊少<br></p><p><b>01.</b></p><p>2018年即将过完1/3，回看微商市场，用两个字即可概括：平淡。</p><p>与去年同期相比，微商热度确实下降了不少。至少到目前为止，没出现过刷屏级的产品，更没出现过瞬间火爆微商界的品牌。</p><blockquote><b>不得不说，现在能在微商生存下来的，不管是品牌、团队还是个人，已经完全是靠能力，而非时机和运气了。</b></blockquote><p><b>所以从这个角度来说，任何行业最后能存活下来，并且取得发展的，绝非滥竽充数之辈，而是经过大浪淘沙，最后留下来的精英。</b></p><p>当然是不是现在就不存在微商市场所谓的“劣币”？也不非如此。毕竟，他们的生存能力也不容小觑。</p><p><br></p><p><b>02.</b></p><blockquote><b>微商，已经不是产品和产品的竞争，而是实力与实力的较量。</b></blockquote><p>不知道大家有没有发现一个现象，即：微商产品，基本上很难再进行品类创新，多数只是改良。</p><p>一个品类，一家微商公司做了，做不好，没人去模仿，但如果做好了，一定会有后续的模仿者在做一遍。与此同时也存在另外一种现象，一家微商公司没做起来的产品，也会有其他微商公司捡起来做。</p><p><b>但不管是哪一种，基本上都不再是产品与产品的竞争，而是实力与实力的较量。</b></p><p>换言之，很多微商公司就是想把别人走不下去的路，再走一遍，以此检验和证明自己的“不一样”。</p><p><br></p><p><b>03.</b></p><blockquote><b>实体➕微商，更具效率。</b></blockquote><p>其实这得益于“新零售”的提出。很多微商开始在线下开设实体店，这样有几个优点，<b>首先更有信任度，让���户所见即所得。其次，做区域型微商，更容易打开市场，树立品牌知名度。再者线上和线下相结合，在保持原成本不变的情况下，多了一条营销渠道，可以一定程度上增加营收。</b></p><p>而兼具线上和线下的微商，其名声是要好于只做线下市场的微商的。</p><p>很多人对于微商的误解，在某种意义上可能会因为微商有了实体店而得到纠正。<b>也就是说，当你可以真实的呈现自己的事业的时候，可信度就会不自觉地得到提升。</b></p><p><br></p><p><b>04.</b></p><blockquote><b>平台型分销商城，纷至沓来。</b></blockquote><p><b>时间倒回两三年前，人们对于分销商城可以说敬而远之。</b>但现在随着传统微商之路越走月不顺的情况下，给予了分销商城一定的生存空间。</p><p><b>众所周知，分销商城，不压货，不囤货，也不用发货。</b>简单来说，分享平台上的产品即可获得返利。而且现在平台商城的门槛越来越低，这对于很多传统微商来说，是很有诱惑力的。</p><p>并且随着平台商城的不断优化和改进，很多平台已经日臻完美，<b>不管是客户体验还是本身的制度模式，产品品控，发货物流等都有了很好的保障，这无疑是很具备吸引力的</b>。</p><p>所以我们能看到很多传统微商，都开始纷纷涉足分销商城，两条腿走路。</p><p><br></p><p><b>05.</b></p><blockquote><b>传统企业，应具备微商思维。</b></blockquote><p>如果说现在还有传统企业（行业）完全和互联网不相关的话，很难想象会是一种什么样的境地。</p><p>之前我有文章说过，<b>微商不是微信上的商人，更不是朋友圈卖产品的，而是通过移动穿戴设备销售自己产品和服务的人。就此而言，微商更是一种营销思维。</b></p><p>而传统企业更应该借助互联网的力量，缩小甚至是砍掉不必要的资源浪费，提高单位时间内的所创造的效益。</p><p>因为相较而言，<b>互联网，特别是移动互联网，不受时间和空间限制，并且在任何时间和地点都可以解决非上班时间所不能解决的问题。</b></p><p>但遗憾的是，传统企业（行业）想凭借互联网思维，或者说微商思维大行其道的任务，还很艰巨。</p><p><br></p><p><b>06.</b></p><blockquote><b>最后，微商是趋势，但朋友圈微商不是。</b></blockquote><p>我一直都在强调一个观点，朋友圈微商只是一种销售渠道，换句话说，卖产品在那卖都可以，所以在朋友圈卖，毫无问题。</p><p><b>但容易被我们忽略的是，卖产品的人并不能很好的意识到品牌自建设的问题。</b></p><p>至少现在看来，如果说微信对微商全部封杀，那么就将是微商的末日。<b>因为能做到不依靠朋友圈，但又能做微商的人，少之又少。</b></p><blockquote><b>所以我还是奉劝一句微商，做好自品牌，不依附任何平台，才是真正的意义上的微商人。</b></blockquote><hr><p><a href=\"https://link.jianshu.com?t=https%3A%2F%2F101705170006313.bqy.mobi\" target=\"_blank\" rel=\"nofollow\">授权获取</a><br></p><p>          <b>（原创不易，若觉可读，欢迎分享）</b></p>\n          ', '2018/04/15 22:56', 2, 136, 271, 'https://upload-images.jianshu.io/upload_images/4135353-297f993c0fb8b2e1.jpg', ''),
('0b39ca56fec1', 4607718, 'ce94d617e045', '父亲欲性侵女儿，中国学生都缺少一堂关于性教育的课', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 540px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 57.08%;\"></div>\n<div class=\"image-view\" data-width=\"946\" data-height=\"540\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2233434-f2b7dbda640d4a46.jpg\" data-original-width=\"946\" data-original-height=\"540\" data-original-format=\"image/jpeg\" data-original-filesize=\"49305\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>性教育首先就是社会人格的文化教育。</p><p>——马卡连柯</p><p>这是我很喜欢的一句话，性教育和所有的教育一样，是构成一个完全社会人的组成部分。人不仅需要智商培养、情操训练，更需要知道两性关系和最基本的两性知识。</p><p>然而，在大环境中，性教育仍旧是一项相对避讳的问题，避而不谈的话题。</p><p><br></p><p>01</p><p>性教育的匮乏，产生诸多心理屏障。</p><p>我依稀记得，在初一的生物课上，第一次接触了人体结构这门课。当时，十二三岁的我们，看到赤裸裸的人体结构图被老师挂在了黑板上，男生女生都捂上了眼睛，从指缝间偷偷观���。</p><p>我们是害羞的，这些在我们看来是成年人世界里的东西，真实地出现在我们的眼前，我们无法接受，更不知道如何接纳。</p><p>老师从男女不同的生理结构，向我们讲述着两性关系，何为精子、何为卵子、何为月经、何为遗精。我们听着，看着，这些陌生的知识进入我们的世界里。</p><p>带着好奇的心理，我们闯入了一个未知的领域，那是一个从未碰触的地方，新鲜而忐忑。</p><p>这是我的第一次所谓的性教育课，现在回想起来，并没有谈及所谓的性知识。</p><p>还记得，小时候，经常会问妈妈一个问题：“我是从哪出来的。”从本质上，我想得到一个满意且真实的答案，但每次收到的答案都是：垃圾桶里捡来的。</p><p>这种回答，我相信在中国，有很多人都有过类似的经历。</p><p>这样的回答和教育，出现了一个问题：直至大学，我都不清楚何为性关系，仍旧停留在浅显的认知范围内。</p><p><b>这样的现象出于性教育知识的匮乏，更出于羞涩的心理，不敢问，不敢查。最可怕的不是收集不到相关信息，而是从内心我便排斥这样的话题。</b></p><p>我觉得这和我太遥远，是结婚后的事情，是极其隐晦的，如果被人知道，是很丢人的。</p><p>这些问题，不仅仅是我所面临的，是当今时代下，很多中国学生的实际问题。</p><p><b>越来越多的性关系，男生不知道避孕套，女生去吃避孕药；</b></p><p><b>越来越多的性侵犯，不知道后果的严重性，羞于颜面，不去报警；</b></p><p><b>越来越多的妇科人流广告，却没有人告诉她们如何保护自己；</b></p><p><b>越来越多的早熟现象，建立在互相取悦的基础上；</b></p><p><b>越来越多的家长们谈性色变，学校进行性教育还要被埋怨。</b></p><p><br></p><p>02</p><p>最近几年，我们常常听到一个字眼：性骚扰。</p><p>这个在很多人看来，是一件无所谓的事情，公交车上的咸猪手，碰了也就碰了，并没有造成实际的伤害，何必计较，被别人知道了太丢人。</p><p>的确，咸猪手的存在，是性侵中后果不严重的一类，但这种现象的存在，不仅仅是犯罪成本太低，更多的是受害人自身的自保意识不强。</p><p>这是传统观念的作祟，第一反应便是丢人，是不光彩的事情。</p><p>但性侵中，还有一项最高等级的犯罪活动，那就是强奸。</p><p>曾经���过一部电视剧叫《孽缘》，其中有一位被闺蜜的未婚夫强奸的女大学生。事后，被父母嫌弃，闺蜜的背叛，自己意外怀孕，种种因素，在老家已经成了件丢人的事情。</p><p>为此，她退了学，生下了孩子，很多年间，她从未想过去告发，因为害怕，怕家人承受压力，怕孩子被人指指点点，更害怕自己陷入被人耻笑的生活中。</p><p>孩子渐渐长大，她也鼓足了勇气，在社会的帮助下，提起了诉讼，多年前的强奸案重新浮出水面。当然，结局是胜诉的，但在官司期间，由于间隔数年，证据匮乏，资料不齐，一波三折。</p><p>这个故事，让我最震惊的不是强奸犯多年的逍遥法外，而是犯罪事实成立后，受害者成为了矛盾的焦点，成为了最该被控诉的事情。她没有受到应有的保护，反而成为了最大的攻击对象。</p><p>家人的嫌弃、社会的议论、自我的自卑。</p><p>这些，难道是受害者的错？我想，它与我们从小的教育、传统的观念、法律意识的淡薄都有关系。</p><p>出了事情，除了躲避，掩盖真相，我们不会做其他的事情。</p><p>这样的选择，势必会造成一种结果，犯罪越来越频发。</p><p>在上周的《奇葩大会》上，科学家种太阳讲述了这样一个故事。</p><p>主人公是他的一位粉丝，给他发来私信，说自己的父亲对自己好像很感兴趣，想要和自己发生关系。</p><p>当时小姑娘放假在家，父亲走进她的房间，准备实施性侵行为，正巧接了一个电话，阻止了行为的发生。女生很害怕，发私信给种太阳，向他诉说了这件事。</p><p>但令种太阳没想到的是，在自己得知事情真相，在为这个女生担忧并为她想办法解决时，这位女生正躺在床上挨个向自己的同学诉说这件事。在她的内心，丝毫没有危机感，她的父亲接完电话，是否会返回继续实施犯罪，或者对她进行其他的性骚扰行为。</p><p>种太阳很焦虑，她告诉女生，赶紧收拾东西离开家，去同学家住，开学回校再说。</p><p>好在最后没有发生悲剧，但这件事，足以让听到的人唏嘘不已。</p><p>强奸、性侵，可以发生在自己的父亲身上，这是想都不敢想的事情。</p><p>种太阳在演讲中说到了这样一句话：每个男人都是潜在的强奸犯。在很多人的潜意识中，我们都是有犯罪心理的，或浅或深，有些人表现，有些人控制。</p><p>但这样的心理，一旦表现出来，势必会造成很严重的后果。</p><p>不得不承认，在两性关系面前，大多数的受害者仍旧是女性，当然不排除部分男性的事实存在。</p><p><b>如何保护自己，如何让性教育真正地走入我们的生活，我想才是最核心的问题。</b></p><p><br></p><p>03</p><p>提及保护，我们需要法律的健全，需要社会的监督，需要教育的普及，但在这些机制尚未成熟之前，我们需要做的是，自我保护和家庭的教育。</p><p>无论是男生女生，在小时候，我们都要知道基本的生理知识，而不是到了初中的生物课上还在害羞，到了大学才知道什么是性关系。</p><p>这些的教育，来自于父母，有意识，科学地和孩子普及这类知识，比如孩子的出生问题，男生为什么会有小鸡鸡，女生为什么要蹲着上厕所。</p><p>这些都是在启蒙阶段，孩子需要了解的知识，开放式的学习，更有助于让孩子从小树立两性健康的观念，他们也不必长大后羞涩地聊这个话题，看一些不健康的视频以及避免不必要的事情发生。</p><p>在青少年阶段，需要了解的是更具体的、细致的生理知识，包括了性行为和自我保护的措施。</p><p>曾经在一个视频中，看到一对台湾夫妇，在和儿子聊到性关系话题上时，父亲说：“作为男生，成年之后，你可以发生性行为，这是正常的生理需求。但前提是，一定是出于对方自愿的前提下，要戴上避孕套，要保护好女生。你爱她，就要尊重她。如果没有结婚，不要让女生意外怀孕，对女生不公平。”</p><p>从父亲的角度来看，他并不阻拦儿子发生性关系，这是成年人的正常诉求。但作为负责任的人，一定要做好该做的事情，对自己的行为负责任。</p><p>而作为女生，尽量不要发生性行为。一旦发生，要保护好自己，不要吃避孕药，如果发生意外，最先求助的应该是自己的母亲，不要隐瞒，也不要避讳。如果在非自愿的情况下发生性关系，一定要寻求法律援助。</p><p>不希望看到《素媛》中的女孩出现在我们的生活中，无良的媒体和法律的缺失；更不希望看到《嘉年华》中孟小文事件的发生，无人愿意作证和丧失良心的执法人员。</p><p>如果可以，从源头做起，把所有罪恶杀死在摇篮里。少一些性侵强奸，少一些意外怀孕，少一些歧视不公。</p><p>我们要做的还有很多。让性教育真正走进我们的生活，去了解，去普及。</p><p>这是社会责任，不仅是自己的，而是全社会的。</p><p><br></p><p><b>你好呀，我是羊达令，一个会唱会画会写的轻度女神经！</b></p>\n          ', '2018/04/11 07:54', 13720, 160, 14863, 'https://upload-images.jianshu.io/upload_images/2233434-f2b7dbda640d4a46.jpg', ''),
('0bbc80b583e7', 7168960, '21a7a893f4b7', '以文艺的情怀，寻觅有故事的上海弄堂', '\n            <p>魔都除了光怪陆离，灯红酒绿，</p><p>还有老上海平凡的弄堂故事。<br></p><p>上海弄堂，浮华城市的平静梦，</p><p>就连当初那么风起云涌的历史也都归为尘土，</p><p>消散在弄堂午后的阳光里了。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 469px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 67.09%;\"></div>\n<div class=\"image-view\" data-width=\"3637\" data-height=\"2440\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-e79f25bd11163560.jpeg\" data-original-width=\"3637\" data-original-height=\"2440\" data-original-format=\"image/jpeg\" data-original-filesize=\"2785158\"></div>\n</div>\n<div class=\"image-caption\">大萌本人照，舒心</div>\n</div><p>我刚来上海的时候，朋友月月（上海人）就对我说:其实，上海还是一个可以行走的城市，楼与楼之间有小路，只留给行人。小路，巷子，人的脚步但凡踩在地上，就有生活的烟火气在蜿蜒。<br></p><p>我信了她的话，利用周末空���时间，到市中心的弄堂里瞎逛，走完之后我才知道，<b>不管是上海弄堂，还是北京胡同，只要愿意在市井里举起相机的，都深爱着那份烟火气。</b></p><p>我就是其中比较痴迷的一个。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-745a9b8d9b8cb55f.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"4971180\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p>穿越一条条繁华的马路，走进弄堂，矮破而窄小的房屋横竖交错，在繁华市中心区域，执著的保存着老上海早先的影子，默默续写着上海市井人家的平常生活。</p><p>有的门口或者窗户上晾着洗好的衣服，衣服是鲜艳而摩登的。</p><p>有的屋开着门，门里有一个穿扮时髦、袅���婷婷的女孩子，像春光一样，充满了这破旧的房子。</p><p>而有的老大爷蜷缩在躺椅上，看着弄堂里孩子们嬉戏玩闹的身影，乐开了嘴。</p><p>很多人不喜欢陈旧色彩的街道。<br></p><p>但是泛黄的，待着岁月的东西经过打磨的</p><p>就会更加富有美感，让人一眼觉得那才是生活。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-0fe55b85a99bf8aa.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"6062816\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p>有句话说，没有弄堂，就没有上海，更没有上海人。也许有点夸张，但不得不承认，弄堂这一上海特有的民居形式，烙印着千千万万上海人的生活。我们可以说，没有弄堂，上海是不完整的。</p><p>这一次拍摄主题是在弄堂里漂浮的各类衣服。</p><p>我也不知道下一次我要拍的主题是什么，既然这样，那就随性而行，随心而遇，随遇而拍好了。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-0626cc04fdc470c7.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"4791303\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 474px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 67.80000000000001%;\"></div>\n<div class=\"image-view\" data-width=\"4903\" data-height=\"3324\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-7695717f0a470f90.jpeg\" data-original-width=\"4903\" data-original-height=\"3324\" data-original-format=\"image/jpeg\" data-original-filesize=\"5758966\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-42942ba8198a640b.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"6832347\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-cf7dbc0c69c55bc4.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"5539295\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5157\" data-height=\"3438\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-45f527ee55e3e5bc.jpeg\" data-original-width=\"5157\" data-original-height=\"3438\" data-original-format=\"image/jpeg\" data-original-filesize=\"6365978\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-91f13c7901a79e85.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"4219282\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-59dfde85df43af85.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"6146367\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-7b2f5712fd8a2476.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"3724076\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-9c70db142916c951.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"3511164\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-2eec17f50588cbfa.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"3121873\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"5184\" data-height=\"3456\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3459828-0757710c72006359.jpeg\" data-original-width=\"5184\" data-original-height=\"3456\" data-original-format=\"image/jpeg\" data-original-filesize=\"3353632\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-widt', '2018/04/13 11:10', 19136, 1257, 30738, 'https://upload-images.jianshu.io/upload_images/3459828-e79f25bd11163560.jpeg', ''),
('0c16d1ed2a06', 731650, 'd769c1e1ae16', '偷拍500张照片，我从世界上最魔幻的国家穿越归来', '\n            <p>一周前，我去了也许是世界上最魔幻的国家。</p><p>极度封闭与世隔绝，甚至隔一段时间就要从搜索引擎中消失一阵子。对这个国家的传闻成千上万，或许没有一个是真的。</p><p>造访这里的短短几天，我看到满眼未曾想象到的东西。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 697px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 99.58%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"717\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-4ce0a0d1e874b197.jpg\" data-original-width=\"720\" data-original-height=\"717\" data-original-format=\"image/jpeg\" data-original-filesize=\"63263\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>这里是朝鲜。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 478px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.39%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"478\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-40f69bedabad360c.jpg\" data-original-width=\"720\" data-original-height=\"478\" data-original-format=\"image/jpeg\" data-original-filesize=\"60417\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 574px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 79.72%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"574\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-53dda9c9bf043302.jpg\" data-original-width=\"720\" data-original-height=\"574\" data-original-format=\"image/jpeg\" data-original-filesize=\"85202\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 480px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"480\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-623ae8a0f70104ce.jpg\" data-original-width=\"720\" data-original-height=\"480\" data-original-format=\"image/jpeg\" data-original-filesize=\"57589\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 480px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"480\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-389daf9ac19eb7bc.jpg\" data-original-width=\"720\" data-original-height=\"480\" data-original-format=\"image/jpeg\" data-original-filesize=\"96591\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 424px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 58.89%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"424\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-665a8bc8763523e3.jpg\" data-original-width=\"720\" data-original-height=\"424\" data-original-format=\"image/jpeg\" data-original-filesize=\"68812\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>我赴朝时间点特别特殊。三月底发生了什么不作多提，我坐的那班北京到丹东的k27遇到临时停车，据说就是在给重要人物让路。之后一天朝韩高层在板门店会谈，与我们前后脚擦肩而过。熟悉的面孔出现在酒店电视的朝语新闻里，又从凤凰卫视看了很久的朝核会谈分析。真是一个神奇的体验。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 478px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.39%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"478\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-d57daac43abfb22f.jpg\" data-original-width=\"720\" data-original-height=\"478\" data-original-format=\"image/jpeg\" data-original-filesize=\"61027\"></div>\n</div>\n<div class=\"image-caption\">平壤地铁站读报的市民，放大看报纸有亮点</div>\n</div><p>据说几年前的朝鲜，游客的一举一动都受到监视，只准在特定的区域内活动，拍摄特定的景象。如今稍微放松了一些，但出行依旧需要时刻在导游的视线之内，不能去行程之外的点，不能试图与当地人交流，擅自脱团活动更是大忌。传言两位随行导游一位是真导游，另一位是国安的监视人员，不知真假。</p><p>拍照依旧无法随心所欲，尤其是在新义州板门店等边境区域。所有的电子产品需要登记。如果被发现疑似拍摄人像的举动，便会强硬要求你交出手机打开相册查看所有照片视频，所谓不妥的内容会直接删除。他们也会熟练地打开微信划对话框，并检查收藏栏有无电影或「反动」信息，连全面屏的操作手势都驾轻就熟，也不知道是从哪里学的……</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 574px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 79.72%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"574\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-2e96aa0dd2205363.jpg\" data-original-width=\"720\" data-original-height=\"574\" data-original-format=\"image/jpeg\" data-original-filesize=\"139871\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 574px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 79.72%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"574\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-745a88bacd6e80c8.jpg\" data-original-width=\"720\" data-original-height=\"574\" data-original-format=\"image/jpeg\" data-original-filesize=\"55625\"></div>\n</div>\n<div class=\"image-caption\">被删除的照片的其中两张，我意外留了底，之后有了教训，每一天的影像都像做贼一样备份好几处</div>\n</div><p>���宁的丹东穿过鸭绿江便是朝鲜。在这之后，手机就完全与外界断了联系。其他国家好歹有当地通信的漫游标志，而这里，屏幕上该有信号与网络图标的地方都是一片虚无。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 574px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 79.72%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"574\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-3eaa0d17d41df7e4.jpg\" data-original-width=\"720\" data-original-height=\"574\" data-original-format=\"image/jpeg\" data-original-filesize=\"26903\"></div>\n</div>\n<div class=\"image-caption\">丹东的著名景点鸭绿江断桥，在朝鲜战争（抗美援朝）中被美军炸掉一半</div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 478px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.39%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"478\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-e82b079c8977e755.jpg\" data-original-width=\"720\" data-original-height=\"478\" data-original-format=\"image/jpeg\" data-original-filesize=\"70009\"></div>\n</div>\n<div class=\"image-caption\">沿途火车站墙面都挂着金氏二代，之后这两幅肖像在朝鲜随处可见</div>\n</div><p>在边境耗了两个小时后，到平壤要再开五个多小时，距离其实不太远，奈何绿皮火车速度实在捉急。青黄不接的三月底，窗外几个小时都是农田与沟壑，除了一些粉刷成灰暗的黄的绿的筒子楼，就是成片瓦房，贫瘠而缺乏美感。午睡一场起来风景也没有太大变化。天空并不蓝，最直观的感受，就是一种说不出的压抑。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 478px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.39%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"478\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-8182d746b9c9b654.jpg\" data-original-width=\"720\" data-original-height=\"478\" data-original-format=\"image/jpeg\" data-original-filesize=\"98875\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 285px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 39.58%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"285\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-f7d7601a9fe08d65.jpg\" data-original-width=\"720\" data-original-height=\"285\" data-original-format=\"image/jpeg\" data-original-filesize=\"53981\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 478px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.39%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"478\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/70854-79015159b3271aa1.jpg\" data-original-width=\"720\" data-original-height=\"478\" data-original-format=\"image/jpeg\" data-original-filesize=\"78128\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>车窗外人们在河里挖沙再用背的扛的走。火车顶三两坐着押车员，而车皮车头都是几十年前退休的中国制造，破败不堪。路边的警戒线由鹅卵石铺就——所以人们可以轻易地走到铁轨旁边来。有人在水沟洗衣服。路面洒的是灰而非水泥沥青，小孩子在上面玩滚铁环，反正也没有什么车跑。二八大杠似的自行车倒是几乎人人都在骑，而偶尔看到的摩托车可以说是土豪级别了。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: ', '2018/04/13 16:00', 1014, 162, 1606, 'https://upload-images.jianshu.io/upload_images/70854-4ce0a0d1e874b197.jpg', ''),
('173d09bfdbe1', 21551276, 'c0df9f7c15fa', '阿里架构师：​程序员必须掌握的几项技术能力', '\n            <h2>一、源码分析</h2><p>源码分析是一种临界知识，掌握了这种临界知识，能不变应万变，源码分析对于很多人来说很枯燥，生涩难懂。</p><p>源码阅读，我觉得最核心有三点：技术基础+强烈的求知欲+耐心。</p><p>我认为是阅读源码的最核心驱动力。我见到绝大多数程序员，对学习的态度，基本上就是这几个层次(很偏激哦)：</p><p>只关注项目本身，不懂就baidu一下。</p><p>除了做好项目，还会阅读和项目有关的技术书籍，看wikipedia。</p><p>除了阅读和项目相关的书外，还会阅读IT行业的书，比如学Java时，还会去了解函数语言，如LISP。</p><p>找一些开源项目看看，大量试用第三方框架，还会写写demo。</p><p>阅读基础框架、J2EE规范、Debug服务器内核。</p><p>大多数程序都是第1种，到第5种不光需要浓厚的兴趣，还需要勇气：我能读懂吗？其实，你能够读懂的。</p><p>耐心，真的很重要。因为你极少看到阅读源码的指导性文章或书籍，也没有人要求或建议你读。你读的过程中经常会卡住，而一卡主可能就陷进了迷宫。这时，你需要做的，可能是暂时中断一下，再从外围看看它：如API结构、框架的���计图。</p><p><b>下图是我总结出目前最应该学习的源码知识点：</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 501px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 78.28%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"501\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/10299630-7d187f7eb5a3a795\" data-original-width=\"640\" data-original-height=\"501\" data-original-format=\"image/jpeg\" data-original-filesize=\"43924\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><h2>二、分布式架构</h2><p>分布式系统是一个古老而宽泛的话题，而近几年因为 “大数据” 概念的兴起，又焕发出了新的青春与活力。除此之外，分布式系统也是一门理论模型与工程技法并重的学科内容。相比于机器学习这样的研究方向，学习分布式系统的同学往往会感觉：“入门容易，深入难”。的确，学习分布式系统几乎不需要太多数学知识。</p><p>分布式系统是一个复杂且宽泛的研究领域，学习一两门在线���程，看一两本书可能都是不能完全覆盖其所有内容的。</p><p>总的来说，分布式系统要做的任务就是把多台机器有机的组合、连接起来，让其协同完成一件任务，可以是计算任务，也可以是存储任务。如果一定要给近些年的分布式系统研究做一个分类的话，我个人认为大概可以包括三大部分：</p><p>分布式存储系统</p><p>分布式计算系统</p><p>分布式管理系统</p><p><b>下图是我总结近几年目前分布式最主流的技术：</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 423px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.09%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"423\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/10299630-1b817a617f751a5f\" data-original-width=\"640\" data-original-height=\"423\" data-original-format=\"image/jpeg\" data-original-filesize=\"37655\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><h2>三、微服务</h2><p>当前微服务很热，大家都号称在使用微服务架构，但究竟什么是微服务架构？微服务架构是不是发展趋势？对于这些问题，我们都缺乏清楚的认识。</p><p>为解决单体架构下的各种问题，微服务架构应运而生。与其构建一个臃肿庞大、难以驯服的怪兽，还不如及早将服务拆分。微服务的核心思想便是服务拆分与解耦，降低复杂性。微服务强调将功能合理拆解，尽可能保证每个服务的功能单一，按照单一责任原则（Single Responsibility Principle）明确角色。 将各个服务做轻，从而做到灵活、可复用，亦可根据各个服务自身资源需求，单独布署，单独作横向扩展。</p><p><b>下图是我总结出微服务需要学习的知识点：</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 360px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"360\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/10299630-e51b4b7b4019c8e1\" data-original-width=\"640\" data-original-height=\"360\" data-original-format=\"image/jpeg\" data-original-filesize=\"31240\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><h2>四、性能优化</h2><p>不管是应付前端面试还是改进产品体验，性能优化都是躲不开的话题。</p><p>优化的目的是让用户有“快”的感受，那如何让用户感受到快呢？</p><p>加载速度真的很快，用户打开输入网址按下回车立即看到了页面</p><p>加载速度并没有变快，但用户感觉你的网站很快</p><p>性能优化取决于多个因素，包括垃圾收集、虚拟机和底层操作系统（OS）设置。有多个工具可供开发人员进行分析和优化时使用，你可以通���阅读 Java Tools for Source Code Optimization and Analysis 来学习和使用它们。</p><p>必须要明白的是，没有两个应用程序可以使用相同的优化方式，也没有完美的优化 java 应用程序的参考路径。使用最佳实践并且坚持采用适当的方式处理性能优化。想要达到真正最高的性能优化，你作为一个 Java 开发人员，需要对 Java 虚拟机（JVM）和底层操作系统有正确的理解。</p><p>以上五大知识体系是我从业多年总结出来的经验，都是当前最主流的技术。</p><p><b>下图是我总结性能优化应该学习理解的几大知识体系：</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 325px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 50.78%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"325\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/10299630-9a19bc67487c748c\" data-original-width=\"640\" data-original-height=\"325\" data-original-format=\"image/jpeg\" data-original-filesize=\"31268\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><h2>五、Java工程化</h2><p>工欲善其事，必先利其器，不管是小白，还是资深开发，都需要先选择好的工具。提升开发效率何团队协作效率。让自己有更多时间来思考。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 436px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 68.13%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"436\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/10299630-fa4d7d84171f5c6b\" data-original-width=\"640\" data-original-height=\"436\" data-original-format=\"image/jpeg\" data-original-filesize=\"47774\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>是否看了这五张图片，觉得自己还有很多没有接触的吗？</p><p>1、具有1-5工作经验的，面对目前流行的技术不知从何下手，需要突破技术瓶颈的可以加群。</p><p>2、在公司待久了，过得很安逸，但跳槽时面试碰壁。需要在短时间内进修、跳槽拿高薪的可以加群。</p><p>3、如果没有工作经验，但基础非常扎实，对java工作机制，常用设计思想，常用java开发框架掌握熟练的，可以加群。</p><p>4、觉得自己很牛B，一般需求都能搞定。但是所学的知识点没有系统化，很难在技术领域继续突破的可以加群。</p><p>5. 群号：Java架构群 <b>650385180</b>备注好信息！</p><p>6.阿里Java高级大牛直播讲解知识点，分享知识，上面五大专题都是各位老师多年工作经验的梳理和总结，带着大家全面、科学地建立自己的技术体系和技术认知！</p>\n          ', '2018/04/14 22:02', 147989, 194, 281471, 'https://upload-images.jianshu.io/upload_images/10299630-7d187f7eb5a3a795', '');
INSERT INTO `larticle` (`Xaid`, `Psid`, `Vaccount`, `Dtitle`, `Tcontent`, `Rdate`, `Klike`, `Wcomment`, `Oread`, `Kpicture`, `Vlabel`) VALUES
('19878aab9f1f', 5185065, '12532d36e4da', '佛系程序员的月薪五万指南', '\n            <p><i>摘要：</i> 大师：很简单，我这里有一份佛系月薪 5 万指南，我看你骨骼清奇、脑门光亮，一看就是将要大富大贵之人，这份指南可以助你快速实现小目标！</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 683px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.7%;\"></div>\n<div class=\"image-view\" data-width=\"1024\" data-height=\"683\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2509688-743a18ef5700e1b2.png\" data-original-width=\"1024\" data-original-height=\"683\" data-original-format=\"image/png\" data-original-filesize=\"982584\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>程序员问大师……</p><p>青年：大师，你看咪蒙的助理都月薪 5 万了，我也想月薪 5 万！</p><p>大师：很简单，我这里有一份佛系月薪 5 万指南，我看你骨骼清奇、脑门光亮，一看就是将要大富大贵之人，这份指南可以助你快速实现小目标！</p><p>青年：太好了，要多少钱，三年无效能退款么？</p><p>大师：免费���只要你能够按照指南去做，包你月薪 5 万，如果还没达到，那就继续按照指南去做！</p><p>青年：太好了，大师快告诉我，我已经迫不及待了！</p><p>大师：很简单，你只要坚持 1 年读 50 本以上的书，不要管记不记得住就可以了！</p><p>青年：这也太简单了吧？太平淡无奇了吧？我还以为你会传授千百年来秘不外宣的佛门绝学呢！</p><p>大师：看起来很简单，真正做到的人很少，你去年读了多少本书？</p><p>青年：这。。。。。。不超过 5 本，还有两本是言情小说：）</p><p>大师：你认为读书无用？</p><p>青年：不不不，我觉得非常有用，大学学到的东西远远不够，工作后还有很多知识和技能要学习！</p><p>大师：看来你并不是不知道持续学习的重要性，而是做不到持续学习！</p><p>青年：是的，作为一个钱不多话不多加班多的苦逼代码狗，每天朝九晚九，找女朋友的时间都没有，哪里还有时间学习？</p><p>大师：你希望工作后也能像学生时一样学习？</p><p>青年：肯定的啊，学习又不是玩，必须要保证大段时间投入，专注才行！</p><p>大师：错，<b>这是你的第一个误区：学习一定要大段时间！</b></p><p>青年：难道不是吗？上学的时候都是这么学的啊！</p><p>大师：上学和工作完全是两种不同的环境，上学的时候我们的主要任务是学习，学习的目的是学习知识和通过考试；工作后我们的主要任务是工作，学习的目的是提升技能；工作后还期望能够和上学时一样有那么多时间学习，当然不可能！</p><p>青年：我也知道不可能啊，但不这样学习能学到东西么？</p><p>大师：学习不一定要一大段时间， 学生时代我们的学习是以考试为目标，关键在于短时间内掌握大量的知识来应对考试；工作后的学习并没有考试这个约束，更多的���为了针对工作中需要的技能来进行学习，关键在于不断的积累。形象的说，学生时代的学习目标是半年内拿到 90 分，而工作后的学习目标可以是半年从 0 分提升到 40 分，再过半年从 40 分提升到 60 分，再过半年从 60 分提升到 80 分，再花 1 年时间从 80 分提升到 90 分，那么从此以后你就具备了一个 90 分的技能。</p><p>青年：原来是这样，我有点懂了，工作后的学习以积累为主要目标。</p><p>大师：是的，你不需要短时间内花费大量时间来掌握大量知识或者技能，关键在于不断的积累和提升。</p><p>青年：道理我懂了，但是还是没有时间啊！</p><p>大师：这里教你<b>佛系学习第一法：挤时间！</b> 时间就像海绵里的水，挤挤总会有的；时间就像美女的胸，挤挤都会有的！</p><p>青年：大师也调皮啊，你是说我要凿壁借光、头悬梁锥刺股，牺牲自己的休息时间来学习？</p><p>大师：不需要，这样做你就很难坚持！我们需要既不影响我们生活节奏，又能挤出时间！</p><p>青年：愿闻其详！</p><p>大师：很简单，从大段时间里面挤出小段时间，比如说：你打游戏么？</p><p>青年：玩啊，玩游戏是我放松的方式，要是没有游戏放松，我估计早就扛不住了，我一般都会玩到晚上 12 点才睡，我的《王者荣耀》都到钻石了！</p><p>大师：没问题，你可以继续玩游戏，但每天只玩到晚上 11：30，这样就挤出 30 分钟了，这样你的游戏还是可以玩，只是少玩 30 分钟，对你游戏影响不大，但多出来的 30 分钟用于你学习，长期积累下去，受益非常大！</p><p>青年：大师点醒了我，这样做确实可以多出 30 分钟，反正王者荣耀多玩一把基本上也是被坑的！</p><p>大师：这只是一个举例，只要你留心去观察，很多场景都可以挤出时间来，例如：</p><p>你习惯了早上 8 点起床，不需要改为早上 6 点起床，只需要改为 7���30 起床就可以了，这样又不影响睡眠，又挤出了 30 分钟；</p><p>你习惯了打游戏到 0 点，不需要戒掉打游戏，只需要改为打游戏到 23：30，这样游戏也可以玩，又挤出了 30 分钟；</p><p>地铁上 1 个小时，可以听听英语或者有声书，相当于多了 1 个小时；</p><p>带小孩出去玩，不需要安排一整天的活动，可以挤出 1~2 个小时；</p><p>每周都要去电影院看电影，改为每两周去一次，每周又多了 4 个小时。</p><p>青年：我懂了，关键在于自己要有意识的去挤出时间！</p><p>大师：是的，如果你认为睡觉的时间也不能少，打游戏的时间也不能少，看电影的时间更不能少，但却天天抱怨没有时间学习和提升，那不管什么方法都无能为力，因为再好的方法都需要时间去落实到具体行动上去！</p><p>青年：怎么挤时间我懂了，但是挤出来的时间都是 10 分钟、20 分钟、最多 30 分钟，这么短的时间怎么学习呢？我觉得基本上就只够刷刷知乎或者朋友圈文章了。</p><p>大师：错，这是你的<b>第二个误区：碎片时间碎片学习！</b></p><p>青年：这有什么问题吗？知乎、朋友圈、头条很多文章我看起来都很有道理啊，而且学的很快！</p><p>大师：标题党、震惊党、鸡汤文、养生文、我有一个朋友文。。。。。。这些我就不多说了，考虑到你是一个程序员，相信你不会傻到被忽悠！</p><p>青年：多谢大师夸奖，我一般只看技术相关的，比如说今天看看微服务的文章，明天看看机器学习的文章，后天看看比特币的文章！</p><p>大师：即使你学的是专业技能，碎片化的学习效果也不好，其主要问题在于不够“系统化”，例如：要想完整的掌握微服务，微服务的背景、发展历史、优势劣势、适用场景、相关技术等全面掌握才算���正掌握，否则这个月看一个服务注册、下个月看个微服务和 SOA 对比，明年看一下阿里的微服务实践，貌似知道了一堆微服务名词，但真正要你去实施一个项目的微服务改造，你就会发现无从下手！青年：原来如此，难怪设计评审的时候，虽然我看过微服务的很多文章，但在设计的时候就是不知道怎么做！</p><p>大师：这里教你<b>佛系学习第二法：碎片化时间系统化学习！</b></p><p>青年：愿闻其详！</p><p>大师：将碎片化的时间用来系统的学习某项知识或者技术，例如如果你想真正掌握微服务，就需要系统的学习，最方便的方式就是买几本微服务的书去啃！</p><p>青年：但是每次啃 10 分钟会有用么？</p><p>大师：非常有用，这就是佛系学习的精华所在，你只管去啃，不用担心是否有用，10 分钟能看 10 页看 10 页，看不了 10 页就看 5 页，这样下去，一本书再慢，一天 10 分钟一个月也能啃完！</p><p>青年：但这样 1 年就只能读 12 本，读不了 50 本了！</p><p>大师：实际上你一天可以挤出 1 个小时，而且绝大部分知识和技术，都是随着你读的越来越多，速度会越来越快！只要你坚持，1 周 1 本书是没有问题的。</p><p>青年：书越读越快是什么意思？我看书总是看完就忘记了，所以我觉得还不如不看！</p><p>大师：错，这是你的**第三个误区：看书就是要背住！</p><p>**</p><p>青年：难道不是吗？ 看书如果记不住有什么用呢？</p><p>大师：你看过《神奇女侠》么？</p><p>青年：看过，很好看的电影，神奇女侠身材很好，很性感！</p><p>大师：你能给我讲讲每分钟的情节和演员的动作、台词么？</p><p>青年：这怎么可能？我只记得神奇女侠挡子弹和神奇女侠大战战神的情节了。</p><p>大师：但是让你重新看一遍，你是不是觉得每个地方都看过？</p><p>青年：那肯定，只要是看过的电影，看第二遍肯定知道。</p><p>大师：看书也是这样的，书中一些精彩的内容你会清晰的记得，就像神奇女侠挡子弹的镜头一样；但还有很多内容你无法清晰的记住，但会潜移默化的影响你的隐性记忆，所以当你重新看同一本书、或者看另外一本类似的书，如果看到一些关键内容，你会有一种似曾相识的感觉！</p><p>青年：原来如此，我当年看《UNIX 网络编程》，看完就忘记了，但当我看到代码中的 epoll 这些用法的时候，看起来就轻松很多，原来是已经隐性记忆已经有了相关技能储备了。</p><p>大师：这就是<b>佛系学习第三法：不管记不记得住，坚持看！</b> 对于一项新知识或者新技能，一般情况下你坚持看 3~5 本相关的书，就会发现整个知识或者技能体系已经基本涵盖完毕，同样的内容会反复的在不同的书中出现，越看到后面，看书的速度越快。</p><p>青年：多谢大师！我这就回去开始看，前年双十一买的 Kindle 都吃了好多灰了，正好用来看书。</p><p>大师：且慢，<b>佛系学习还有最后一法：好书需要读三遍，要读只读纸质书！</b></p><p>青年：此话怎讲，电子书可是科技进步的结晶哦？</p><p>大师：要想真正掌握一本书的核心内容，需要读三遍。第一遍：细读，目的在于完整阅读全书，并且划出重点，写上读书笔记；一个月后读第二遍：扫读，主要快速翻阅第一遍阅读时做的笔记和划的重点，目的在于加深记忆；半年后第三遍：忆读，读的时候只看目录，然后去回想内容，如果回想不起来，再去进行扫读。这样三遍下来，基本上一本书的核心内容就能够很好的吸收。</p><p>青年：醍醐灌顶，原来读书还有这种讲究，以前我都是读完一本书就扔到床底了！</p><p>大师：所以，不要用 Kindle 之类的阅读器来看书���第一是做笔记不方便；第二是翻阅不方便；第三是不像纸质书那样可以随时提醒你！</p><p>青年：但是纸质书买多了好重，搬家很麻烦啊！</p><p>大师：当锻炼身体也可以，请个人搬也可以，总之不要为了芝麻丢了西瓜！再说了，月薪 5 万后你就不用搬了！</p><p>青年：我感觉仿佛已经学到了九阳真经了，我已经要迫不及待的要回去开始实现月薪 5 万的小目标了，大师，还有吗？没有我就要赶快回去了！</p><p>大师：最后提醒几点，第一：不要看闲书，不要修仙、不要穿越、不要盗墓！</p><p>青年：我的眼里只有技术！</p><p>大师：第二：少打游戏多锻炼身体！</p><p>青年：大师所言极是，身体是革命的本钱！</p><p>大师：第三：少看片！</p><p>青年：。。。。。。</p><p>青年：多谢大师，我对大师的的感激之情犹如滔滔江水，连绵不绝，又如黄河泛滥，一发而不可收拾，听大师一言，胜读十年寒窗！</p><p>大师：别废话，先点赞再转发！</p><p><b>作者介绍：</b>李运华，阿里游戏资深软件工程师，带领多个研发团队，承担架构设计、架构重构、技术团队管理、技术培训等职责；专注于开源技术、系统分析、架构设计，对互联网技术的特点和发展趋势有较深入的研究，对系统解耦、高性能、高可用架构有丰富的经验。</p><p><a href=\"https://link.jianshu.com?t=http%3A%2F%2Fclick.aliyun.com%2Fm%2F45816%2F\" target=\"_blank\" rel=\"nofollow\">阅读原文</a></p>\n          ', '2018/04/12 10:18', 1790, 16, 3505, 'https://upload-images.jianshu.io/upload_images/2509688-743a18ef5700e1b2.png', ''),
('1fd89311ba9b', 24441099, 'ab993c12faa7', '书有清香 | 爱情之上，一无所有', '\n            <blockquote><p><b>嗨，欢迎来到小兜的《书有清香》系列，今天，我们来聊一聊世界经典名著中的绝色女子——茶花女。</b></p></blockquote><p>总觉得，这世界上的每一个女子都是应该被疼惜的，尤其是那些文学作品中的女子。</p><p>翻开泛黄、浓墨的书页，她们翩跹而来：她们的容颜，姣好如明月；她们的神情，孤独而倔强。她们有着这个大大世界里自己小小的愿望，她们有着盛大绝望里太多的无可奈何。</p><p><b>名花倾世有谁怜。</b></p><p>我曾想，在一个女子将风花雪月当作生存的工具时，她看尽世态炎凉，让虚情假意一点一点吞食自己纯良的情感之后，又有谁会用一颗真心来给予这个女子现世的温暖，而又是谁会让这个女子心甘情愿交付自己千疮百孔的心。</p><p><b>这些女子，都有一个不被世人所认可的名字——妓女。</b></p><p><b>小仲马笔下的茶花女，亦是其中的一个。</b></p><p>出身贫寒的她，无奈成为了最下贱的妓女，却又因为她的姿色，而成为了上流社会人士垂涎欲滴的尤物。在这种生活的差异中，她迷失了自我，开始惯于挥霍，出入舞会，狂喝滥饮，性情也变得轻浮而近乎放荡。</p><p>或许，没有遇见阿尔芒，她的生活也就一直这样了吧。在觥筹交触间，在一个个不同的男人身边，纸醉金迷。就这样，挥霍掉自己的青春，在繁华落尽之后，黯然逝去。</p><p>然，所谓的红颜，终不会有这样日复一日的人生。她终是遇到了她生命中的劫，也使得这几个世纪以来，无数人为她唏嘘落泪。</p><p>一开始，玛格丽特虽感动于这个为她落泪在她生病时默默守候的男子，可她还是不愿意放弃她眼前的奢华生活。为了应付每年十万法郎的巨额花费，她仍然继续接待其他情人。因为在她心底始终认为，阿尔芒的感情不过是一时的，等他玩够了以后，又会和其他的男人一样。</p><p>但是阿尔芒的爱情太过热切，就算得知玛格丽特欺骗她而与伯爵过夜的时候，他���愤然离去，但还是因为割舍不下而相互谅解。也正因为如此，玛格丽塔才真正为他打开了心门。</p><p>所谓的妓女，并不轻易情动。然而一旦情动，便是全身心地投入，矢志不渝。中国有秦淮八艳如此。而茶花女，亦如此。</p><p>她开始想尽一切办法争取与阿尔芒在一起，对于伯爵，她选了彻底的决裂。她开始慢慢改变那种花天酒地的生活，学会适应安静健康的生活方式，甘愿搬到乡下居住，过起最清贫的日子：一定会很幸福。</p><p><b>在爱情的最初，每个女子都对未来怀有自己最美好的期待和憧憬，以为可以相濡以沫，琴瑟静好，直到天荒地老。</b></p><p>可是自古妓女，就注定被人不齿。男人很可笑，离不开她们却又轻视她们。阿尔芒的父亲，以道义的力量，又哭诉阿尔芒的妹妹因为自己有一个身为妓女的嫂嫂而被体面的未婚夫嫌弃。</p><p>以爱之名，为了所爱之人不被世俗的眼光所唾弃，她离开自己想要托付终生的男子。</p><p>以爱之名，她甘愿承受心爱之人最恶毒话语的攻击，而自己独自咽下最心酸的泪水，继续做着她看似风光靓丽实则行尸走肉的交际花。</p><p>以爱之名，她已明了生不可能再与阿尔芒相伴余生，她选择慢性自杀的方式，任由自己的病情发展，寻求早日的解脱，在另一个世界里，去追寻今生爱情的宁静。</p><p>私心地以为，其实阿尔芒这样的男子，是不应该得到玛格丽特之爱的。</p><p>纵使一开始，他可以摒弃一切与她在一起，我还是无法原谅他之后表现出来的无情和尖锐。对于爱过的女子，纵使她有千般错万般错，这样的践踏人格与尊严，是万万不能容忍的。</p><p>他可曾想过，在他们同居的日子里，是玛格丽特独自承担了生活的窘迫压力，变卖着她的首饰与马车。为了能和阿尔芒在一起，她更是不惜反抗有权有势的伯爵，并为了他的妹妹而担上莫须有的骂名。</p><p><b>爱，让她如此勇敢，爱，让她放下所有。她的生命，仿佛因爱阿尔芒开始，到阿尔芒唾弃她结束。</b></p><p>冥冥中总是有缘，古今中外都是相通。同样身为名妓的杜十娘，为了李甲的爱情而甘愿从良，在李甲背信弃义之后，结束自己的生命。</p><p>她们，自是被穷困生活压迫的女子，看惯人间冷暖后端着一颗死了的心。只有爱情，仿佛是她们生活里的一盏明灯，照亮了她们了无生趣的生命。为爱付出，为爱勇敢，却不曾想，到头来最伤的使自己。</p><p>她们谋生，亦谋爱。</p><p>或许���只有玛格丽特坟头，那开满的白茶花，才能弥补一点阿尔芒心中的愧疚和悔恨。</p><p>若有来生，她还是那一抹无瑕的白茶花。</p><p><b>爱情之上，一无所有。</b></p><p><b>连生命都可以放弃。</b></p><p><b>烈性女子，应当如此。</b></p><p><br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 484px; max-height: 300px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 61.980000000000004%;\"></div>\n<div class=\"image-view\" data-width=\"484\" data-height=\"300\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/10289143-30af8868c8f2b7b1.jpg\" data-original-width=\"484\" data-original-height=\"300\" data-original-format=\"image/jpeg\" data-original-filesize=\"25657\"></div>\n</div>\n<div class=\"image-caption\">爱情之上，一无所有</div>\n</div>\n          ', '2018/04/16 13:36', 16, 12, 31, 'https://upload-images.jianshu.io/upload_images/10289143-30af8868c8f2b7b1.jpg', ''),
('28aa670c822e', 12831617, '81310278129d', '[读书40]一旦爱上，就是一生——《时光回去，只愿未曾遇到你》读', '\n            <p>文/涅阳三水</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\n<div class=\"image-view\" data-width=\"1560\" data-height=\"2080\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3966735-1aa849ba68cf04fc.jpg\" data-original-width=\"1560\" data-original-height=\"2080\" data-original-format=\"image/jpeg\" data-original-filesize=\"108548\"></div>\n</div>\n<div class=\"image-caption\">365/174</div>\n</div><p>1、缘起</p><p>简书官方活动，赠书写书评的事情，参与了很多次，直到今日，才有了一次得到赠书的机会。</p><p>这次活动的书，就是唐妈的作品：《时光回去，只愿未曾遇到你》，在清明放假前夕，拿到了这本书。</p><p>书本的外包装是一个红色的塑料袋，很是热情洋溢的那种颜色，回到家来拆开了外包装，露出了里边的封面，居然是浅粉色的。</p><p>小声把书本的题目默读了两遍，直觉告诉我，这是一部很疼痛的作品，是一部很青春的作品。</p><p>想起来，在申请赠书的时候，���曾经承诺过，要写出了2000字的书评。</p><p>唐妈的这部作品40万字，在这个假期，用两天的时间把它读完，在整个阅读的过程当中，有过两三次，眼睛潮湿，心跳加速。</p><p>一部作品能够达到如此的效果，在我看来就是一种成功。</p><p>2、作者</p><p>在唐妈的文章里，我看到了她的简介。</p><blockquote>少女心不灭的孩儿他妈，简书连载专题优秀作者，擅长从女性角度讲述爱情故事，感情细腻，文风平实。生活可以平淡，对爱永远执着。参与出版短篇故事合集《终有人住进你心里》《越勇敢的女人越幸运》，在简书上已发布五部长篇小说，连载字数近150万字。读者赠语：暖心文字暖心人，落笔有物渡凡尘。</blockquote><p>这些文字刚进来简书的时候，他的主页上刚超过100万，此刻已经接近150万。</p><p>之所以选择唐妈的书来读，是因为她的一句话：生活可以平淡，对爱永远执着。</p><p>因为这一份执着，我走进了唐妈，走进了这部作品。</p><p>3、作品结构</p><p>���我读完这部上下两本四十万字的作品之后，为它的首尾呼应性叫好。</p><p>作品的开头是宋瑶琴被判刑，结尾是许岩被判刑。</p><p>无论是他们中的哪一个，在被判刑的背后，都蕴藏着对对方最深沉的爱。</p><p>这样一种结构，在很多小说中都是常见的，但是也只有唐妈的这种结构带给我一种冲击，那就是付出，爱对方，怎么样的付出都可以。</p><p>结合全文来想，就会明白，是有存在的理由的。在长达20年的相处中，彼此已经深深相融，你中有我，我中有你，这不是岁月可以分割的，这也不是灾难和痛苦可以分开的。</p><p>两人最初的相遇，一个九岁，一个十二岁，一直相处了20年之久，穿越了一个人一生的三分之一，20年之久的情谊，怎么可以轻易被打断，怎么可以轻易言说放弃呢？</p><p>4、人物之宋瑶琴印象</p><p>闭上眼睛，眼前晃动的就是那个胖胖的，圆滚滚的宋瑶琴，嘴巴里不断地在咀嚼着，我就叹息，这是一位好吃的姑娘。</p><p>幸好，她有着一个幸福的童年，有着一个美满的家庭，爸爸妈妈对她的疼爱无以复加。</p><p>正因为爸爸妈妈的爱，她有恃无恐，每天每天都把家里的好吃的带给许岩，就带过了自己的中学，甚至大学时代。</p><p>从小的时候，宋瑶琴就是一个花痴，看见长得帅的人，路都走不动，以至于许岩的出现，对他来说就是满足了这种颜控，一颗心完完全全地扑了上去。</p><p>这一扑就是扑了一辈子，虽然这中间又伤心又失望，但更多的是对那个人的牵挂。</p><p>有付出就会有收获，这句话在宋瑶琴的身上，有着最大的回响。</p><p>宋瑶琴最后被绑架，许岩的表现可圈可点，守得云开见月明的胖妹妹，终于守候到了自己的爱情。</p><p>5、人物之许岩</p><p>许岩从小的时候跟妈妈相依为命，生活在老家。而他的爸爸，是一名同性恋者，再加上一个酒鬼的习惯，无形中给许岩的生活带来无法抹去的阴影。</p><p>因为这样的生活环境，让许岩的性格偏执而孤独，沉默内敛。一个少年的心，敏感又脆弱，如果周围的人一旦触及他父亲的行为，一旦涉及他自身的尊严，他必定雷霆爆发。</p><p>因为这种底线暗礁，终于误了一生。他高考前夕，被学校开除，一辈子的生活毁于这一旦。</p><p>在许岩被学校开除以前，六年中学生涯中，宋瑶琴一只尾巴一样跟在他的身侧，每天等他放学，给他送好吃的。甚至于在考大学的时候，宋瑶琴也选择了在许岩的身侧，大学毕业之后，不惜与父母决裂，也要守在许岩的身边。</p><p>数年的时光，潜移默化的影响和陪伴，这份情谊，这一份付出的习惯，已经深邃到瑶琴的骨髓当中，再也无法舍弃。</p><p>6、人物之方易安</p><p>相对于许岩和宋瑶琴来说，方易安是配角，这个配角在我看来却是相当的完美。</p><p>在宋瑶琴从监狱里出来的时候，和方易安隔窗而居。宋瑶琴第一次开窗，看到方易安在小便，从此两人便开始了不眠不休的口头战。</p><p>可是在方易安陪着宋瑶琴回了一趟家之后，两人的关系发生了天翻地覆的变化。</p><p>宋瑶琴因为生活的关系，拜托方易安寻找工作。寻找了工作之后，两个人有了更深层次的接触，再加上两个人住的比较近，宋瑶琴下班之后，经常给方易安做饭吃。</p><p>从这个时候开始，方易安的一颗心就悬挂在了宋瑶琴的身上，从生活到工作，事无巨细，点点滴滴全部渗透。</p><p>为了宋瑶琴，方易安什么活儿都做，什么话儿都说，目的只有一个，那就是让宋瑶琴开心。</p><p>两人在一起相处了很多年，宋瑶琴也因为自己的心动了，可是在许岩出现意外的时候，还是绕了回去。</p><p>最后宋瑶琴和许岩���婚，方易安才断了最终的念头。</p><p>很多年之后，方易安回忆着点点滴滴，曾经感慨万千：“后来我自己炒了很多次方便面，先放青椒，然后是西红柿，再然后是过了水的方便面，熟能生巧，味道越来越好，却始终不是你炒出来的那个味道。”</p><p>曾经走过爱情道路的人，需要很多年，很多年才能够放下。对此，方易安说：“瑶琴，我也不知道多久才能忘掉你，也许是方便面停产的时候吧。”</p><p>这个答案也是遥遥无期，但是方易安的一颗心，却让我们感动不已，他爱上了宋瑶琴，却是一生的朱砂。</p><p>7、作品题目为谁而设</p><p>这是一篇情感的作品，重点就是围绕着许岩、宋瑶琴和方易安展开。</p><p>许岩和宋瑶琴两小无猜，青梅竹马的长大，彼此互相熟悉，互相依赖，都成为一种习惯。</p><p>他们两个怎么样曾经伤害，怎么样曾经关怀，怎么样曾经搁置，怎么样曾经牵挂，在很多人看来都是很正常的。</p><p>青春年少的他们，在读者眼里也许就是老夫老妻，最近发生什么都是很正常的，因为一个相处的习惯在。</p><p>而方易安呢？中间半道出现，一出现就对宋瑶琴死缠烂打，展开追求，有一种不达目的誓不罢休的执着。</p><p>可是，方易安数年的付出，到最后却是独自伤情离开。</p><p>读完整部作品的时候，我忽然间想，这篇作品的题目《时光回去，只愿未曾遇到你》，应该就是针对方易安来设置的。</p><p>在整部作品当中，只有方易安才是作者唯一的戕害着，一腔深情出现，却是徒手空返。</p><p>如果生命能够再来一遍，方易安还会不会在渴求遇到宋瑶琴呢？</p><p>8、爱情到底是什么</p><p>爱情到底是什么样的一种情感呢？</p><p>在许岩身上，我们看到了一种后知后觉，当年的习惯冷置，到最后离开时，才发觉已经深入骨髓。</p><p>在宋瑶琴的身上给我们的只是一种习惯的接受，从小就对人好，默默地付出，一直付出到生命尽头。</p><p>而在方易安身上，我们只看到了一种无怨无悔的付出，只要爱，就深爱。</p><p>这三个人兜兜转转，到最后依旧是先来后到的安排。</p><p>这在告诉我们什么呢？</p><p>9、这样的爱情你想拥有吗</p><p>我忽然间想到，作者名片里所言的暖，暖心人写暖心的字，讲暖心的故事。</p><p>她说的暖，原来是这种味道的暖，根植在残酷之上，伤害之上，等待之上，付出之上的一种暖。</p><p>这种暖背后的爱情，如同一杯陈年佳酿，初次品尝，辣口辣心，喝到最后，身心俱暖。</p><p>但是这种暖有多少人愿意品尝呢？要付出身心俱创的代价，有付出青春年华的岁月，要付出一腔柔情，一份执着。</p><p>这样的爱情因为投入得多，所以回收得多；这样的爱情，一旦拥有，便是一生。</p><p>试问，有多少人，渴望拥有这样的爱情呢？</p>\n          ', '2018/04/14 06:32', 1815, 2, 2028, 'https://upload-images.jianshu.io/upload_images/3966735-1aa849ba68cf04fc.jpg', ''),
('31c572af5cf5', 4094691, '9019674f5808', '如果你也生于1995年', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.58%;\"></div>\n<div class=\"image-view\" data-width=\"1200\" data-height=\"799\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1988937-5f5fd4312f7a99ed.jpeg\" data-original-width=\"1200\" data-original-height=\"799\" data-original-format=\"image/jpeg\" data-original-filesize=\"51202\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p>2018年的春天可真是像一个多变的孩子，一会哭，一会笑。前几天大街上都是穿裙子，衣袂飘飘的小仙女，现在就都是穿着大衣的似乎已经步入更年期的阿姨。</p><p>这个春天见过大雪纷飞的北京，也见过艳阳高照的北京。帝都总是跟别人不一样，帝都终究是帝都，就连天气也与众不同。年前整个中国都在下大雪，可是北京却是艳阳天。</p><p>年后的四月，万物生长的四月，北京却又下起了大雪，满天纷飞的大雪让人一瞬间就把记忆拉回了冰天雪地的十二月。</p><p>我生于1995年，仔细算算今年都23岁了。突然发现一下子都特么长这么大了，我还以为我还是那个少不更事的跟着那些大孩子在月光下看瓜田的少年。</p><p>时光如梭，我第一次体会到这个词语神奇的魔力。有些事情明明感觉就像在昨天发生，可是仔细算算，已经过去了好几年。</p><p>我记得，我第一次渴望长大。是在我15岁的时候，那个时候，姐姐不想上学了，就跟着表姐去北京学习做手工艺品。</p><p>我跟妈妈把姐姐送到车站的时候，看着姐姐哭的像一个孩子。我就渴望长大，我想我长大了，我就挣钱了，就不用离开妈妈姐姐。</p><p>那一刻，我最渴望的事情就是长大。</p><p>今年，我23岁，一眨眼已经过去了8年了。曾经那个离开妈妈就想哭的姐姐也已经结婚生子做了别人的妈妈，曾经那个15岁就想为家人遮风挡雨的少年也已经23岁了。</p><p>看到简书交友都是一些98年的孩子，我突然感觉我老了。我有一种感觉现在的世界是00后的了，90后已经可以退居二线了。</p><p>这个世界变换真的特别快，我记得我小时候一毛钱我就开心一天。两毛钱，可以买一包辣条跟一个冰袋（就是用水加色冻成一个冰疙瘩的东西。）</p><p>我从来不敢奢望，妈妈给我一块钱。就算妈妈给我一块钱，我也不敢花出去，因为太大了，我不知道怎么去花这巨款。</p><p>我第一次有手机是“长虹”手机，那个手机三百块钱。是我在二手市场买的，是那种带键盘的，打起字来就噼里啪啦响的那种。只要电话来了，就会闪七彩灯的手机。</p><p>可惜的是，我用了三个月就黑屏了。我第一知道我被人家骗了，很生气。</p><p>第二个手机就是翻盖的手机，我挺喜欢这个手机的。这个手机是我在深圳买的，五百块钱，是我自己挣的。</p><p>喜欢故意打开合上，啪啪的声音很好听。就这样我又用了三个月，然后排线又坏掉了，我又给扔了。</p><p>然后就是我第一个智能手机了，我妈给我买的联想p700，一千五百块钱。这部手机陪伴我度过整个高中，现在还安安静静的躺在我的家里。</p><p>这是我的青春。</p><p>现在这个手机是我自己挣钱买的荣耀8，现在它哥，它哥的哥都出来了，真是让我感觉跟不上时代了。</p><blockquote>长到这么大，<br>我说不出来我最爱的一部电影，<br>说不出来我最爱的一首歌，<br>说不出来我最爱的一个人。<br>时常觉得人生其实没那么有趣，<br>偶尔也会质疑活着的意义，<br>所有来自于书上和别人口中的意义<br>都不曾说服过我。<br>但今天突然觉得，<br>大概人生最大的意义就是<br>用余生去找到那些最爱吧</blockquote><p>看到这段话的时候，我有一种恍惚的感觉。我感觉说的就是我。我既没有什么特别想做的事情，也没有特别喜欢或者讨厌的的人。</p><p>我明明想谈恋爱可是我没有喜欢的人。我明明害怕孤单，可我总是找不到能让我不孤单的人。</p><p>有段时间，我四处聊天。我以为不停的说话会让我摆脱这个孤独，可是我却更加孤单。我问我自己，我从小就孤傲，我怎么变成这般不堪？</p><p>我从小就开始过住宿生活了，算算已经十年了。这个十年在我短暂的生命了，已经是无比漫长了，漫长到我都记不得了。</p><p>小学同学已经结婚了，初中同学我不记得了。高中同学联系的也没有几个了。大学同学就跟宿舍的玩的最熟悉。</p><p>我的朋友圈不算大，你会发现你的爱人会在你身边七个人里。</p><p>郑州还在下雨，灰暗的天空下着淅淅沥沥的雨。这样的天空总会给人一种压抑的感觉，穹苍挤满乌云，就像一张白净的纸上染上了黑墨水。</p><p>给人一种冲击心房的压抑感。</p><p>昨天深夜同学问我：“我最珍视的友情，怎么到别人���里就变得一文不值了呢？我把她当做为最好的朋友，可是因为一个小事就跟我划分界限了呢？这到底为什么？”</p><p>我不知道说什么，感觉像是胸口堵了一团棉花让我喘不过气来。我犹豫再三还是说了一句：“<b>这个世界上很多人都戴着面具，你总要付出一些代价去看清一些人，看清了，也就看轻了。</b></p><p>也是昨天，我最好的朋友宣布今年年底结婚。昨天领的结婚证，照片上的她微笑似天边炸开的一朵红霞。</p><p>她曾经为了一段所谓的爱情，跑了几千公里，坐车到广东去寻找她真命天子。谁知道那个男生就见了她七分钟就回家了。</p><p>朋友心中失望万分，自己跑了几千公里的爱情，喜欢的男人就见了自己十分钟就跑了。走了不到十分钟就发了一个信息：“谢谢你来找我，我马上就要结婚了，你别来了。好好生活吧。”</p><p>朋友失魂落魄，她自己的爱情信仰瞬间崩塌了。</p><p>从此以后她再也没有谈过恋爱，看到她就要结婚了。我猜这个男生肯定是一个非常爱她的人，只有最炽热的心才可以解封最冰冻的心。</p><p>祝她幸福。</p><p>今天早上突然想起一句话：<b>能让你忘掉过去的人，就是你的未来，</b><b>你的未来。</b></p><hr><p><b>终、</b></p>\n          ', '2018/04/13 11:24', 14232, 16, 24422, 'https://upload-images.jianshu.io/upload_images/1988937-5f5fd4312f7a99ed.jpeg', ''),
('3264af62268b', 18630507, 'd0be5ae77914', '王小波：我一生的黄金时代', '\n            <h3><b>01</b></h3><p></p><p>当代诗人臧克家在纪念鲁迅先生逝世十三周年时写过一首抒情诗《有的人》：</p><p>“有的人活着，他已经死了；有的人死了，他还活着。”</p><p>1997年4月11日，一个再平常不过的日子，远在英国剑桥大学做访问学者的李银河怎么也不会想到，去年10月的机场一别，竟然会是她和爱人王小波的永别。</p><p>凌晨时分北京郊外的一个小写作间里，45岁的王小波因心脏病突发，一个人悄悄地离开了人世。</p><p>《时代三部曲》的编辑钟洁玲后来写道：</p><p>“据说，他被人发现的时候，他头抵着墙壁，墙上有牙齿刮过的痕迹，地上有墙灰，他是挣扎了一段时间，再孤独地离去的。”</p><p>至此，一个有趣的灵魂在尘世间烟消云散，一个天才的作家让中国文坛留下无限遗憾。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 620px; max-height: 344px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 55.48%;\"></div>\n<div class=\"image-view\" data-width=\"620\" data-height=\"344\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4800119-988b7119d113cea0\" data-original-width=\"620\" data-original-height=\"344\" data-original-format=\"image/jpeg\" data-original-filesize=\"31371\"></div>\n</div>\n<div class=\"image-caption\">王小波</div>\n</div><p>就像上个月霍金和李敖去世时，很多人都是先去了解他们的生前贡献，然后才开始在网上发起对他们的悼念。</p><p>这并不奇怪，因为这个世界，大部分人总是后知后觉的。</p><p>在媒体不发达的1997年，王小波的离世不足以让当时人为之颤动。</p><p>很大程度上，当人们开始熟知王小波，开始读王小波的作品，开始怀念他的风趣幽默时，早已经是21世纪的事情了。</p><p>值得欣慰的是，这个世界上有才华的人，无论是生前没有发表什么作品的卡夫卡，还是被人认为是疯子的梵高，总能从满是黄沙的队伍中淘出，露出原本属于他们的黄金本色。</p><p>王小波去世后，华夏出版社出版了他的《时代三部曲》。</p><p>不同于此前《黄金时代》单行本出版时的历经波折和销量冷清，《时代三部曲》一时洛阳纸贵。</p><p>编辑钟洁玲回忆，在2001年底合约到期前，《时代三部曲》加印约十多次，印数约20万册，盗版更是难以统计。</p><p>这个生前因为没有被主流文学圈和读者所接纳的作家，身后声名鹊起。</p><h3><b>02</b></h3><p></p><p>王小波是一个被后世人所公认的天才，关于这一点，高晓松就有谈到过。</p><p>高晓松说：</p><p><b>“说他，我有千言万语，但是真到了要讲他的时候，又不知从何说起。以我有限的阅读量，王小波在我读过的白话文作家中绝对排第一，并且甩开第二名非常远，他在我心里是神一样的存在。</b></p><p></p><p><b>我个人热爱写作，热爱做音乐，也热爱拍电影。每当看到伟大的作品，我经常扪心自问自己能不能做到那样。大部分音乐如果努力，我是能做到的；有些电影我做不到，但我能感觉到差距有多大；唯独读王小波的时候，我完全没办法拿自己去做比较。</b></p><p></p><p><b>很多人说他是中国的卡夫卡，我看不懂卡夫卡原版，但从翻译作品中还是能感觉到卡夫卡头脑中具有很多突破性的臆想。王小波是可以和卡夫卡媲美的。”</b></p><p>能够受到这样评价的人生前一定是充满传奇色彩吧？实际上，王小波的一生并没有被人神话了的传奇故事，他只是走在那个年代知识分子正在走的大路时，突然发现了一条他更喜欢的小道。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 480px; max-height: 300px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 62.5%;\"></div>\n<div class=\"image-view\" data-width=\"480\" data-height=\"300\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4800119-2ebd7d572c5c51f7\" data-original-width=\"480\" data-original-height=\"300\" data-original-format=\"image/jpeg\" data-original-filesize=\"27956\"></div>\n</div>\n<div class=\"image-caption\">王小波</div>\n</div><p>他既上山下乡做过知青，也当过民办老师和工人。</p><p>高考恢复后，初中没毕业的他顺利考上了中国人民大学，紧接着又去了美国匹兹堡大学读了研究生，然后回国执教北大、人大6年时间。</p><p>王小波的前半生是那个时代中国众多知识分子的缩影。</p><p>可王小波是王小波呀，如果他遵循着最初的学者路线，他可能会是一个出色的大学老师，但不会再有那个后来受到万千读者喜爱的王小波。</p><p>如果他的前半生是世俗上的成功，那他后面的选择就是精神上的图腾。</p><p>1992年9月，王小波正式辞去教职，开始做起了自由撰稿人。</p><p>在他生命最后的五年时光里，他变成了一只可以自由飞翔的鸟。</p><p>王小波选择的这一切，可能就是因为他“遇到了那只特立独行的猪”吧：</p><p><b>“我已���四十岁了，除了这只���，还没见过谁敢于如此无视对生活的设置。相反，我倒见过很多想要设置别人生活的人，还有对被设置的生活安之若素的人。因为这个原故，我一直怀念这只特立独行的猪。”</b></p><h3><b>03</b></h3><p></p><p>现在的读者都已经知道，王小波的作品除了思想深刻，语言幽默外，他本人还是一个很浪漫的人。</p><p>可是在他没有出名前，他的浪漫只有妻子李银河一个人知道。</p><p>当时李银河大学毕业，王小波初中没毕业；李银河在报社当编辑，王小波在一个全都是大妈和残疾人的街道工厂当工人；李银河的父母已经“平反”恢复工作，王小波的父亲还没平反；李银河当时已经因为发表了文章小有名气，而王小波还没发表过任何东西，默默无闻。</p><p>如果按照现在的爱情故事，白富美是一定要嫁给高富帅的。</p><p>一个相貌丑陋没有钱的初中毕业生追求一个大学毕在报社工作的年轻姑娘，简直是癞蛤蟆想吃天鹅肉。</p><p>可是，李银河和王小波的爱情就是这般纯粹。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 638px; max-height: 451px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 70.69%;\"></div>\n<div class=\"image-view\" data-width=\"638\" data-height=\"451\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4800119-e068d87d13ff3c0d\" data-original-width=\"638\" data-original-height=\"451\" data-original-format=\"image/jpeg\" data-original-filesize=\"41624\"></div>\n</div>\n<div class=\"image-caption\">王小波与李银河</div>\n</div><p>1977年，已经是报社编辑的李银河看到了王小波的手抄本小说《绿毛水怪》，她被王小波的文字所深深吸引。</p><p>李银河说：</p><p>“严格来说，《绿毛水怪》这本手抄本小说是我和小波的媒人。小说中显现出来一个美好的灵魂，对我的灵魂产生了极大的吸引力。记得我当时心中暗想：这是一个和我心灵相通的人，我和这个人之间早晚会发生点什么事情。”</p><p>在王小波写给李银河的信得开头，他写道：</p><p><b>“你好哇李银河，我发誓，你不回来我再也不给你写信了。”</b></p><p>可是第二天，李银河又收到王小波的信，他在开头写道：</p><p><b>“李银河，你好！我自食其言，又来给你写信。”</b></p><p>这就是王小波，一个恋爱中的赤子模样。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 300px; max-height: 404px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 134.67%;\"></div>\n<div class=\"image-view\" data-width=\"300\" data-height=\"404\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4800119-97909738ba0ce7e0\" data-original-width=\"300\" data-original-height=\"404\" data-original-format=\"image/jpeg\" data-original-filesize=\"10239\"></div>\n</div>\n<div class=\"image-caption\">小波送给李银河的定情礼物：一张他自己最喜欢的小时候的照片  </div>\n</div><p><br></p><p>在《爱你就像爱生命》中，他���道：</p><p><b>“我喜欢你的热情，你可以温暖我。我很讨厌自己不温不凉的思虑过度，也许我是个坏人，不过我只要你吻我一下就会变好呢。”</b></p><p>纯真、坦率、真诚，王小波用他的文字承载着那个有趣的灵魂，赢得了李银河的芳心。</p><p>李银河说：</p><p><b>“ 我起初怀疑,一对不美的人的恋爱能是美的吗?后来的事证明，两颗相爱的心在一起可以是美的。”</b></p><h3><b>04</b></h3><p>王小波最受人推崇的地方，除了他行文字里行间的幽默，更是文字背后那颗思想独立的大脑。</p><p>他在上学期间读到了乔治-奥威尔的《1984》，这本书对他影响深刻，他在后来写下那段著名的话：</p><p><b> “我看到一个无智的世界，但是智慧在混沌中存在；我看到一个无性的世界，但是性爱在混沌中存在；我看到一个无趣的世界，但是有趣在混沌中存在。我要做的，就是把这些讲出来。”</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 600px; max-height: 404px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 67.33%;\"></div>\n<div class=\"image-view\" data-width=\"600\" data-height=\"404\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4800119-88bdb0232d1bda01\" data-original-width=\"600\" data-original-height=\"404\" data-original-format=\"image/jpeg\" data-original-filesize=\"32916\"></div>\n</div>\n<div class=\"image-caption\">王小波在这台电脑前写下了他的世界</div>\n</div><p><br></p><p>他是一个活得明白的人，在《黄金时代.》里，他写出生活艰辛的本质：</p><p><b>“那一天我二十一岁，在我一生的黄金时代，我有好多奢望。我想爱，想吃，还想在一瞬间变成天上半明半暗的云，后来我才知道，生活就是个缓慢受锤的过程，人一天天老下去，奢望也一天天消逝，最后变得像挨了锤的牛一样。可是我过二十一岁生日时没有预见到这一点。我觉得自己会永远生猛下去，什么也锤不了我。”</b></p><p>他从不把自己的价值观强加于他人身上，在《沉默的大多数》里，他直叙自己的想法：</p><p><b>“口沫飞溅，对别人大做价值评判，层次很低。”</b></p><p>他乐观豁达，总是能从苦闷的生活中解脱出来寻找慰藉：</p><p><b>“我十七岁时在插队，晚上走到野外去，看到夜空像一片紫水潭，星星是些不动的大亮点，夜风是些浅蓝色的流线，云端传来喧嚣的声音。那一瞬间我很幸福，这说明我可以做个诗人，照我看来凡是能在这个无休无止的烦恼、仇恨、互相监视的尘世之上感到片刻欢欣的人。都可以算是个诗人。”</b></p><p>他始终追求有趣的生活态度，追求简单质朴的人生目标：</p><p><b>“ 我对自己的要求很低：我活在世上，无非想要明白些道理，遇见些有趣的事。倘能如我愿，我的一生就算成功。 ”</b></p><p>英国作家王尔德说过：</p><p>“这世界上漂亮的脸蛋有很多，有趣的灵魂却很少。”</p><p>如王小波这般长得丑还有趣的人，少之又少。</p><h3><b>05</b></h3><p>王小波已经离开我们很多年了，可我们依然怀念他；王小波在特殊年代成长起来的精神，我们依然需要他。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 400px; max-height: 527px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 131.75%;\"></div>\n<div class=\"image-view\" data-width=\"400\" data-height=\"527\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4800119-bc168c397e2e4be3\" data-original-width=\"400\" data-original-height=\"527\" data-original-format=\"image/jpeg\" data-original-filesize=\"21222\"></div>\n</div>\n<div class=\"image-caption\">王小波</div>\n</div><p>虽然他的书早已经印刷了一遍又一遍，虽然他的读者群不断扩大，从70后延伸到了00后，虽然有无数曾经像他一样热血的年轻���把他当做偶像，可王小波对人生与社会的思考，对生活得感悟，在当下娱乐至死的年代，早已经渐行渐远。</p><p>年轻时的王小波拥有一个属于他自己的完整世界，年轻时的我们呢？房？车？还是生活？</p><p>回答不置可否，但至少王小波是幸运的，在短暂的一生中，他把自己的才华与思想写成了令人称赞的作品，也把那个21岁的生猛的自己永远留在了读者的脑海里。</p><p>浪漫骑士，行吟诗人，自由思想家，一个人能在身后得到这么多的赞誉，是件荣耀的事情。</p><p><b>21岁的王小波，永远年轻；年轻的我们，面对生活，也要像小波一样生猛得不行。</b></p>\n          ', '2018/04/11 15:36', 139, 1, 182, 'https://upload-images.jianshu.io/upload_images/4800119-988b7119d113cea0', ''),
('3cca3212007b', 15688612, '9617ac822dc6', '开心一刻‖我和你没完', '\n            <p>     2018年4月16号   星期一    晴</p><p>(一)</p><p>我和货货风风雨雨三十年，生意场上经历过辉煌也曾经跌到谷底。还好两人的性格都比较开朗，也比较逗逼，这样一路相扶着走过了许多坎坷。</p><p>我们两人的性格都是对朋友，家人都相当大方，但自己却比较节俭。平时买衣裤，鞋袜，我从来不去赶时髦，但也不会买地摊货。一般都是在商场换季，打折的时候买。所以一家人都能花不多的钱，穿得都还体面。</p><p>而且我自己也比较恋旧，一些好一点的衣服和鞋子，穿了十几二十来年都还舍不得扔，鞋子鞋底磨穿了，打个鞋掌换个鞋跟继续穿。</p><p>我现在还留着两件十五年前做的羊绒大衣，一双近二十年的皮靴。</p><p>这双皮靴是康莉的牌子，当时还是我们这里一个商场倒闭的时候，很低的折扣买的，是用小牛皮做的。</p><p>不知道是以前的东西质量好，还是因为康莉的东西确实不错，由于款式喜欢，我每年都穿，鞋掌穿得透底了，鞋面依然很好，所以我拿到鞋匠那里换了鞋跟，打了个鞋���继续穿，一直舍不得扔。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\n<div class=\"image-view\" data-width=\"1560\" data-height=\"2080\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/7523860-8b9f72cab9662098.jpg\" data-original-width=\"1560\" data-original-height=\"2080\" data-original-format=\"image/jpeg\" data-original-filesize=\"156946\"></div>\n</div>\n<div class=\"image-caption\">这是我穿了二十年的皮靴</div>\n</div><br><p>这不，那天我和货货出门办事，我又拿了这双靴子穿。我坐在靠近门口的凳子上，一边穿鞋一边和货货说：</p><p>“看看你老婆多节约，穿了二十来年的靴子还在穿。”</p><p>货货正打开门往外面走，听了我的话，他不假思索地接口道：</p><p>“哈，我比你节约多了。”</p><p>“你怎么节约了？”我没好气地白了他一眼</p><p>“我呀——，用了三十年的老婆都还在用，可不比你节约吗？嘿嘿……”他贼贼地笑着说���然后还没等我反应过来，就“哧溜”窜了出去。</p><p>“什么，你给我再说一遍。”等我反应过来，操起鞋子砸过去的时候，他已“噔噔噔”地跑下楼梯去了。</p><p>等我气急败坏地赶下去的时候，他已跑得无影无踪……</p><p>(二)</p><p>我有几个很要好的闺蜜，因为几个老公都爱喝酒的缘故，所以常常一起聚餐。</p><p>谁家夫妻闹点矛盾，吵架或者呕气了，比如说：老公酗酒了，赌博了，或者对老婆发脾气了，我们几家都会聚在一起开个“批斗会”。因为几个女的都比较贤惠，所以批斗的对象，基本上是几个老公。</p><p>这不，货货居然说出这种话，这场“批斗会”在所难免。</p><p>大家一落座，闺蜜老公甲就开腔了：</p><p>“货货，仙仙跟了你三十年，为了这个家奉献了青春年华，现在你居然说，三十年了还没换老婆，觉得委屈？”</p><p>“对的，仙仙这么能干，里里外外一把手，兢兢业业操持这个家，你居然想换了她，你这是什么行为？”闺蜜老公乙也不甘示弱。</p><p>“我不是这么说的，我是说老婆好，三十年了都舍不得换。”货货辩解道。</p><p>“诡辩。”我连忙截住他的话，“你们知道他用的是什么词？他说他比我还节约，重点在节约这两个字，他是因为节约才没换了我。”我气愤地说。</p><p>闺蜜老公丙连忙接过话：</p><p>“对的，你怎么可以用节约这个词？老婆是拿来节约的吗？老婆节约起来不用，你想用谁？”大家哄堂大笑，闺蜜连忙捶了她老公一拳。</p><p>“是的，你的出发点就不对，你是不是想以节约老婆为名，到外面找小三？”</p><p>“罚酒，犯这么严重的错误。”</p><p>“对的，罚酒，罚酒……”大家七嘴八舌，纷纷给货货灌酒。</p><p>这就是我们这个“批斗会”的特点，大家批斗是假，劝和是真。谁家夫妻俩有点矛盾，都能在这样连批斗带搞笑的气氛中和解了。</p><p>最后，大家看着喝得醉醺醺的货货，一边劝说着：“好了，好了，过去了……”一边纷纷站起来，准备撤退。</p><p>我仍然不依不饶对着货货说：“反正2018年，你的最主要任务就是把用了三十年的老婆给我换掉。”</p><p>货货醉眼迷离地抬头看了看上面，大着舌头说：“天空飘来五个字，那都不是事。”</p><p>大家再次笑趴，我气急败坏地指着他：“这次，我和你没完……”</p>\n          ', '2018/04/16 07:27', 17, 1116, 1379, 'https://upload-images.jianshu.io/upload_images/7523860-8b9f72cab9662098.jpg', ''),
('46979f537c29', 2946981, 'deeea9e09cbc', '霍思燕：多少孩子被害了一辈子，都是因为父母不会这样做', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 628px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 61.33%;\"></div>\n<div class=\"image-view\" data-width=\"1024\" data-height=\"628\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1442902-2dffaa7acf809740\" data-original-width=\"1024\" data-original-height=\"628\" data-original-format=\"image/jpeg\" data-original-filesize=\"105791\"></div>\n</div>\n<div class=\"image-caption\">图 | 网络</div>\n</div><p><b>01</b></p><p>霍思燕上微博热搜了，不是因为什么让人惊掉下巴的绯闻，而是<b>她给儿子的教育方式。</b></p><p>我身边有很多单身女青年，像着了魔一样都在看《妈妈是超人3》，纷纷扬言想要结婚生子了，最好是生一个像嗯哼这样的暖男。</p><p>嗯哼真是妥妥的情话小王子，看到妈妈16岁的照片，不仅认出妈妈，还夸妈妈化妆好看，不化妆更好看，还说要给妈妈买花、钻石、项链、口红、漂亮鞋子。</p><p>被问到妈妈什么时候会对你发火？</p><p>嗯哼说：“妈妈从来不对我发火。”</p><p>被问到妈妈有什么缺点？</p><p>嗯哼斩钉截铁地说：“没有。”</p><p><b>在嗯哼心里，爸爸是王子，自己是小王子，而妈妈则是小公主。</b></p><p>试问，谁不想要这么一个儿子，不会耍赖撒泼、无法无天，也不会过分捣蛋、无端怄气，而是分分钟把妈妈宠成小公主？</p><p>还记得央视纪录片《镜子》中有句话说，<b>每个孩子生下来都是一张白纸，父母就是作画的人，白纸变成什么样，关键在父母。</b></p><p><b>高情商的孩子背后，必然站着高格局的父母。</b></p><p><b>02</b></p><p>有人质疑霍思燕是不是把儿子当成捞钱工具，不然怎么会频频出镜，过度曝光呢？</p><p><b>其实，参加这样的节目，和带他去游乐场是一样的，也是一种陪伴的方式，一种成长的记录。</b></p><p>3岁，是孩子跟父母培养感情最佳的一个时间段，所以，<b>霍思燕愿意让儿子呆在她身边，晚一年再上幼儿园，这是她送给儿子最好的礼物。</b></p><p>就像毕淑敏说的那样：“你必得一个人和日月星辰对话，和江河湖海晤谈，和每一棵树握手，和每一株草耳鬓厮磨，你才会顿悟宇宙之大、生命之微、时间之贵、死亡之近。”</p><p><b>在和父母的朝夕相处之下，孩子的童年才是真正意义上的美好。</b></p><p>同样是上综艺节目，黄圣依母子二人的同框，几乎是满屏大写的尴尬。</p><p>尽管有富丽堂皇的住宅，一人独享的游乐场，衣食无忧的家境和百依百顺的宠爱，但是儿子安迪显得并没有那么快乐。</p><p>当主持人问：“如果没有爸爸妈妈的陪伴，你会不会孤单？”</p><p>安迪云淡风轻的一句“<b>不会，因为习惯了</b>”，真的特别扎心。</p><p>可想而知，黄圣依陪伴儿子的时间是多么少。所以，儿子的入学考试成绩只有28分，也不足为奇了。一心想营造良好的妈妈形象，黄圣依万般准备、百般讨好，可儿子最喜欢的人却是奶奶。</p><p><b>很多父母一生都在追求成功，其实所谓成功，就是有时间陪伴自己的孩子 ，陪伴才是父母给孩子的最珍贵的礼物。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 445px; max-height: 248px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 55.730000000000004%;\"></div>\n<div class=\"image-view\" data-width=\"445\" data-height=\"248\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1442902-f9ef240ae8b8f261\" data-original-width=\"445\" data-original-height=\"248\" data-original-format=\"image/gif\" data-original-filesize=\"2927055\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>03</b></p><p><b>除了陪伴，孩子还需要来自父母的尊重。</b></p><p>之前和杜江参加《爸爸去哪儿》，四岁的嗯哼就展现了强大的词汇量和无比清奇的脑回路。</p><p>那时候，不少观众觉得嗯哼有点娇气，总是爱哭，情绪就像龙卷风。</p><p>确实，用大人的思维来看，嗯哼这个孩子实在是“不乖”。他不会以大局为重，也不会克制和隐瞒自己的小心思。但这样不好吗？</p><p><b>有多少父母，打着“为你好”的旗号，干涉孩子的选择，无视孩子的内心。</b>稍有不顺从，孩子就要背负“不听话”、“不懂事”的骂名。而那些太懂事的孩子，少了应有的童真，多了几分世故，仿佛没有灵魂的提线木偶。</p><p>心爱的玩具被父母送给别人，还说要学什么孔融让梨，常常被父母拿来和别人家的孩子作对比，仿佛自己一无是处。</p><p>霍思燕夫妇在这方面做的非常好。<b>他们很尊重儿子的天性，只要不过分，都鼓励儿子按自己的想法去做。</b></p><p>杜江曾在采访中坦言，<b>我���在引导孩子学习优良品质的同时，也要让他们学会如何爱自己，敢于向违背自己意愿的事情说“不”。</b></p><p>最近有一个特别火的视频，让大家对这两口子的教育方式大为赞叹。</p><p>杜江怕嗯哼看到爸爸穿女装，心里会不舒服，专门进行的性别教育，强调这只是在演戏——“<b>你要做一个真正的男子汉</b>”。</p><p>又教会他两性关系里，要懂得适度为喜欢的人妥协——“为了自己心爱的女人才干这种事”。</p><p>然后霍思燕打断他：“我觉得你不应该这样说，也可以为了心爱的男生或女生。”</p><p>听到这，杜江还有些吃惊，倒是霍思燕很淡定：“<b>挺好的，高兴就好了。</b>”</p><p>从小到大，我们听到最多的是“你要有出息”，而不是“你要高兴”。从小到大，我们被赋予厚望，成为人中龙凤，但很少有人问过我们，你真正想要的是什么，你真正喜欢什么。</p><p>我们对成功的定义太单一，比如月薪几万、有车有房、当上CEO、迎娶白富美。我们也太渴望成功，太着急成功，却没有人敢在成长中活成自己想要的样子。</p><p><b>霍思燕的一句“高兴就好”，瞬间让人热泪盈眶。</b></p><p><b>04</b></p><p>就在前段时间，在美国交换的台湾大学生孙安佐被曝因为涉嫌预谋抢劫被捕，他的另一个身份是台湾影星狄莺的儿子。</p><p>有些料事如神的网友说，狄莺的教育方式，这么快就显示出恶果了。</p><p>狄莺对儿子的教育基本是严密监控，严格控制，连吃饭也要监管。</p><p>小时候，狄莺规定儿子每顿饭一定要吃多少碗，功课一定要考多少分，儿子连摔一跤都害怕到要死。可万万没想到被圈养的金丝雀没有成为人中龙凤，却在亲生母亲近乎变态的看管之下，走向了犯罪道路。</p><p>这让我不禁想起武志红在《奇葩大会》分享的一个观点，<b>听话，是一场代代相传的骗局。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 445px; max-height: 241px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 54.16%;\"></div>\n<div class=\"image-view\" data-width=\"445\" data-height=\"241\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1442902-29555a39811d1353\" data-original-width=\"445\" data-original-height=\"241\" data-original-format=\"image/gif\" data-original-filesize=\"260089\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>父母为了满足自己高高在上的控制欲，强加给孩子“听话”的紧箍咒。一旦孩子想要突破父母的禁锢时，很有可能走向极端，要么疯狂、要么死亡。</p><p>回到霍思燕夫妇这里，当被问到“在嗯哼眼中妈妈对他说的最多的话”，母子俩毫不犹豫的回答都是“我爱你”。</p><p>所以你看，<b>恰到好处的教育，不是以高人一等的身份将孩子驯化成自己想要的样子，而是让他可以恣意奔跑嬉戏，你只需要在危险边缘守着拉他一把。</b></p><p><b>给孩子应有的尊重和自由，孩子也自然地报以真爱。</b></p><p><b>05</b></p><p>如果你细心观察，不难发现，在婚姻不幸的家庭中成长的孩子，很少会有和同龄人一样的灿烂笑容。</p><p>原生家庭对一个人的影响最大，绝大部分成年人的心理问题都可以归究于童年的遭遇，尤其是父母在他们的面前吵架。</p><p>所以，<b>给孩子最好的教育，就是爸爸爱妈妈。</b></p><p>1980年出生的霍思燕，如今已经38岁了，仍然有着满满的“少女感”。她不惧表达对老公和儿子的爱，会当着孩子的面和老公亲吻，也会一字一句告诉儿子自己有多爱他。</p><p>其实，<b>孩子接受爱、付出爱的能力，就是在和父母经年累月的相处中获得的，日复一日，潜移默化。</b></p><p>最后，用杜江朗读过的一首诗《给我的孩子》作为文章的结尾，���你有朝一日为人父母，别让孩子终生误。</p><blockquote>\n<p>你不是我的希望，不是的</p>\n<p>你是你自己的希望</p>\n<p>我那些没能实现的梦想还是我的</p>\n<p>与你无关，就让它们与你无关吧</p>\n<p>你何妨做一个全新的梦</p>\n<p>那梦里，不必有我</p>\n<p>我是一件正在老去的事物</p>\n<p>却仍不准备献给你我的一生</p>\n<p>这是我的固执</p>\n<p><b>然而我爱你，我的孩子</b></p>\n<p><b>我爱你，仅此而已</b></p>\n</blockquote><p><b>----------------------</b></p><p><b>我的新书正在销售中，点击<a href=\"https://link.jianshu.com?t=https%3A%2F%2Fweidian.com%2Fitem.html%3FitemID%3D2127055052%26ifr%3Ditemdetail%26wfr%3Dc\" target=\"_blank\" rel=\"nofollow\">《梦想不会辜负努力的你》</a>可购买签名版。</b></p>\n          ', '2018/04/15 08:49', 17235, 182, 24417, 'https://upload-images.jianshu.io/upload_images/1442902-2dffaa7acf809740', ''),
('4e4c84cd754b', 15176780, '604159f29174', '暴裂无声：你能看明白这8个隐喻吗？', '\n            <p>尼采曾说：当你在凝视深渊的时候，深渊也正在凝视着你。</p><p>忻钰坤导演的《暴裂无声》正如一个深渊，令人欲罢不能。作为一个小成本的悬疑片：演员不是大牌、场景不算特别烧钱、特效仍是五毛特效，为什么豆瓣上豆友给予高度评价？</p><p>看完后闭上眼睛，从头至尾回顾下，这部电影的留白、这部电影用了大量的隐喻和符号，编织一个现世的故事和警世恒言。</p><p>本文有高能剧透，慎入。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 671px; max-height: 801px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 114.46000000000001%;\"></div>\n<div class=\"image-view\" data-width=\"671\" data-height=\"768\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-d3314c14447d9c36.png\" data-original-width=\"671\" data-original-height=\"768\" data-original-format=\"image/png\" data-original-filesize=\"1023694\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>01</p><p>这部电影讲了什么故事？</p><p>导演说：看到那些底层人，或者说在乡村生活条件很差的人的那种困境，<b>让我有了想为他们发声的欲望。</b><b>所以，这部叫做《暴裂无声》的电影出炉了。</b></p><p><b>电影中要讲述的故事并不复杂，主线有三条：</b></p><p><b>一个底层矿工张保民寻找失踪的儿子。</b></p><p><b>一个中层阶级律师徐文杰做伪证、找寻被绑架的女儿。</b></p><p><b>一个高层阶层昌万年作为矿主的贪婪、残暴、独断与可怖。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 993px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 141.86%;\"></div>\n<div class=\"image-view\" data-width=\"700\" data-height=\"993\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-c4e33b4781f981ca.png\" data-original-width=\"700\" data-original-height=\"993\" data-original-format=\"image/png\" data-original-filesize=\"1359420\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>02</p><p><b>在奉县煤矿打工的张保民接到妻子电话，说儿子张磊放羊走丢了，张保民回到村子，开始了寻子之路。</b></p><p><b>张保民走进羊肉店找孩子：</b>这家羊肉店老板，与他有仇，因为一家矿业公司来村里开矿，唯独张保民一个人没有签字，这样大家伙都没有办法拿到奖励，村民们都劝说他，这家羊肉店的店主为了逼张保民签字，揍了他一顿，张保民用羊骨头戳瞎了店主的一只眼睛。这样的仇足以让自己的儿子失踪，张保民听到店内孩子的哭声，他以为是自己儿子，可是冲进去之后，揭开孩子的奥特曼面具，却发现那孩子其实是店主的儿子。这里是一个隐喻，后面详细说。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 476px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 64.5%;\"></div>\n<div class=\"image-view\" data-width=\"738\" data-height=\"476\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-468a186438a828a7.png\" data-original-width=\"738\" data-original-height=\"476\" data-original-format=\"image/png\" data-original-filesize=\"652729\"></div>\n</div>\n<div class=\"image-caption\">羊肉店</div>\n</div><p>张保民沿着儿子可能走的山路一路找了下去，找到了一个正在开采的矿山，在这里遇见了<b>昌万年的走狗在这里和矿工干架，张保民因为一个矿工给自己馒头吃，帮这个矿工打架，把昌万年的车玻璃砸碎。与第三条主线在这里有了交集，后面就有了见到了昌万年以及后来发生的事。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 670px; max-height: 445px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.42%;\"></div>\n<div class=\"image-view\" data-width=\"670\" data-height=\"445\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-d1cff4a5b49bb966.png\" data-original-width=\"670\" data-original-height=\"445\" data-original-format=\"image/png\" data-original-filesize=\"429431\"></div>\n</div>\n<div class=\"image-caption\">剧照：在矿场帮架</div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 553px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 67.52%;\"></div>\n<div class=\"image-view\" data-width=\"819\" data-height=\"553\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-c3efaa4f50ec3fa3.png\" data-original-width=\"819\" data-original-height=\"553\" data-original-format=\"image/png\" data-original-filesize=\"619241\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>03</p><p>交错到一起的情节就是张保民等底层人，受到伤害后在寻找真相，保护自己；中层阶级的徐文杰看似风光、其实过着焦虑的生活，帮忙能给自己利益的上层阶级掩埋真相���而上层阶级为所欲为以为隐瞒真相，围绕真相两个字，电影中用了大量的隐喻，说了一个道理：</p><p>真相是瞒不住的，即便真相残酷，无声也会暴裂。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 618px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 63.129999999999995%;\"></div>\n<div class=\"image-view\" data-width=\"979\" data-height=\"618\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-b37861954fb54ce9.png\" data-original-width=\"979\" data-original-height=\"618\" data-original-format=\"image/png\" data-original-filesize=\"768590\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>04</p><p>隐喻1：羊</p><p>电影中羊贯穿始终，张磊放羊爱羊、张保民家养羊卖羊养家糊口、屠夫宰羊开店养家糊口、昌万年吃羊享受，这是一个完整的食物链。</p><p>底层的人，只能是任人宰割的羊。</p><p>比如，张保民的儿子是在放羊时被杀的。</p><p>比如，屠夫的眼睛就是羊骨捅瞎的。这寓意可能就是底层之间的愚昧，相互伤害。</p><p>比如，当寻找儿子无望时，张保民的妻子翠霞则抱着一只羊羔，在门前失声痛哭，人与羊一样，多么的无助。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 488px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 63.21%;\"></div>\n<div class=\"image-view\" data-width=\"772\" data-height=\"488\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-6756735356df091f.png\" data-original-width=\"772\" data-original-height=\"488\" data-original-format=\"image/png\" data-original-filesize=\"770436\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>比如，昌万年一边吃羊肉一边与要吃素的另外一个采矿公司的老板说了一句意味深长的话：“羊也吃素。”隐喻，你也吃素，你就是羊，在食物链的底层，你只能被宰割，于是这家采矿公司的老板，只能在转让协议上签字，不然跟饭桌上的羊结果一样，只有死路一条。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 629px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 72.63%;\"></div>\n<div class=\"image-view\" data-width=\"866\" data-height=\"629\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-d095dac0df46dc62.png\" data-original-width=\"866\" data-original-height=\"629\" data-original-format=\"image/png\" data-original-filesize=\"888135\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 422px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.269999999999996%;\"></div>\n<div class=\"image-view\" data-width=\"750\" data-height=\"422\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-ec2ceb0be5a23950.png\" data-original-width=\"750\" data-original-height=\"422\" data-original-format=\"image/png\" data-original-filesize=\"262521\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>05</p><p>隐喻2：车牌</p><p>如果细心一点可以看到，这部电影中的车牌归属地，都是“豢”。因为拍摄地是在内蒙古，“豢”与蒙有点类似，这不是重点，重点，“豢”是收买和利用的意思，“豢”者任人宰割，暗示底层人民的现状、更是这个村子大部分人的郁闷的现状。</p><p>比如用补偿款作为诱惑让村民签合同，除了张保民外的其他村民都签了，然后受到污染、得病、水不能喝。</p><p>比如昌万年50万收买徐文杰作伪证、高薪聘请下属，这些都是“豢”。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 545px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 61.79%;\"></div>\n<div class=\"image-view\" data-width=\"882\" data-height=\"545\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-4c7758e39c24d705.png\" data-original-width=\"882\" data-original-height=\"545\" data-original-format=\"image/png\" data-original-filesize=\"612580\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>而车牌号也有另外一层的隐喻关系。昌万年、徐文杰、张保民的车牌，分别是豢A、豢B、豢C，代表了三个阶层，车号也不一样，意思差异较大。</p><p>第一个是昌万年的：豢AS8888，完全只有暴发户才会这样，任性；</p><p>第二个是徐文杰的：豢BX9174，虽然是中层阶级，但是离不开一个“4”，还可能有谐音，。“9174”→谐音“就一起死”。最终的结果两个人都进监狱了。</p><p>第三个是张保民的：豢C1984，这个导演给出了答案，因为他喜欢《1984》这本书的缘故吧。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 512px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 47.410000000000004%;\"></div>\n<div class=\"image-view\" data-width=\"1080\" data-height=\"512\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-c854c80928aaaa27.png\" data-original-width=\"1080\" data-original-height=\"512\" data-original-format=\"image/png\" data-original-filesize=\"691650\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>06</p><p>隐喻3：弓箭</p><p>在电影中多次出现弓箭，上层阶级如同猎人一般。</p><p>而箭头的丢失，让昌万年认为肯定是徐文杰要挟自己，矿场的事不至于致命，但是杀人是要偿命的，昌万年第一个想到徐文杰，于是把徐文杰女儿给绑架了。</p><p>他没有想到，自己的箭头是丢在车后座上，张保民在后座上发现了这个箭头，并藏在身上，在与昌万年搏斗中，把这个箭头插入昌万年腿上，然后得以逃脱。</p><p>昌万年从腿上拔下箭头，然后望着肩头上的鲜血，这鲜血有他的、也有被他杀害的小孩的血，他把它深埋，希望掩埋真相。</p><p>只是，真相无法掩埋。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 549px; max-height: 672px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 122.39999999999999%;\"></div>\n<div class=\"image-view\" data-width=\"549\" data-height=\"672\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6101338-8416f96fae7dec9c.png\" data-original-width=\"549\" data-original-height=\"672\" data-original-format=\"image/png\" data-origin', '2018/04/13 23:10', 14586, 199, 25599, 'https://upload-images.jianshu.io/upload_images/6101338-d3314c14447d9c36.png', ''),
('691b455ec9c1', 18480875, 'd8c6bb6cbe0c', '从项羽看中国父母教育孩子', '\n            <p>                             导语 </p><p>项羽是历史充满悲剧式英雄，仔细细想，其实项羽的失败是注定的，这从打小所受教育就能看出，从后来的行为，就能摸索出其中的脉络。</p><p>生当做人杰，死亦为鬼雄，曾是我多年前的座右铭，伴随我的前半生，我对悲剧英雄的酷爱，让我对项羽充满了崇拜，体格弱小的我，对孔武有力充满了深深的幻想，项羽满足我的一切幻想。</p><p>经过社会历练和自己可以理智的思考，我终于可以正确认识这个人物，这是个低智商且无思考能力的人物，情绪化，残忍，我对项羽开始充满深深的鄙夷。我从项羽身上，看到很多人的缩影，我想把我思考的东西讲出来，供大家参考。个人之言，且当娱乐吧！</p><p>于是我多方搜集资料，我想诉说一些故事，讲述一下项羽的成长历程，对我们教育孩子，能产生一些有益的思考，那么此文就达到了目的。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 521px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 72.36%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"521\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8857037-bf37942549659853.png\" data-original-width=\"720\" data-original-height=\"521\" data-original-format=\"image/jpeg\" data-original-filesize=\"46574\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><br><p>一年轻的项羽</p><p>项羽（公元前232年―公元前202年），名籍，字羽，秦末下相（今江苏宿迁）人，楚国名将项燕之孙，他是中国军事思想“兵形势”代表人物（兵家四势：兵形势、兵权谋、兵阴阳、兵技巧），堪称中国历史上最强的武将之一，古人对其有“羽之神勇，千古无二”的评价。</p><p>项羽有俩句非常有名的名言，一句是取而代之，项羽的对手刘邦也说过这么一句话，大丈夫当如是。另一句话是要学就学万人敌。从这俩句话看，项羽是个有志向的人物，但他最后功亏一篑，都是他当初所受的教育，给自己带来认知的局限，以至于最后被逼“乌江自刎”。</p><p>项羽小时候，可聪明，但不热爱和用心学习，学的五花八门，最后一样都没学通，使得自己无法可以正确的分析的思考，���知道使用智慧去解决，唯有依靠自己的勇猛，去解决问题，这种可以冲锋陷阵，但终究只是一员猛将，既不是帅才，也无法做稳最高领导的位置。所有的事都是半途而废，这是多数人，共通的行为。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"1200\" data-height=\"800\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8857037-7c2ac3bf37d1cac2.jpg\" data-original-width=\"1200\" data-original-height=\"800\" data-original-format=\"image/jpeg\" data-original-filesize=\"127626\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><br><p>二项羽与宋义的争夺战</p><p>项羽的成名之战，是巨鹿之战，是历史著名的以少胜多的案例。在这场战役以前，有个非常值得关注的插曲，那就是项羽夺了宋义的“上将军之职”，杀了宋义，逼迫楚淮王熊心授予自己为上将军。</p><p>现在我们回顾一下，当时的历史故事。宋义是个有智谋的人物，讲究用智，宋义的崛起，是因为他预示了项梁的失败，他说打了胜仗，将领就骄傲，况且秦军主力还未出动，他说项梁会失败的，果然最后项梁战死了。楚怀王熊心因此事召见了宋义，跟他商计军中大事，非常欣赏他，因而任命他为上将军。</p><p>宋义曾对项羽说过这么一句话，宋义说若论披坚甲执锐兵，勇战前线，我宋义比不上您；若论坐于军帐，运筹决策，您比不上我宋义。</p><p>当时秦将章邯打败项梁，然后自己就开始骄傲了，认为楚军也不咋地，很轻而易举就战胜了，然后章邯做了另外一个决定，就是决定攻赵。后来章邯就把赵军等人围困在巨鹿城，楚怀王熊心让宋义带领军队去救援。</p><p>等到了目的地，宋义坚持按兵不动，让赵军消耗秦军的实力，等到秦军疲软的时候，在进攻，这样能赢得胜利的有利时机，可以减少胜利的阻力。</p><p>项羽却不这么认为，项羽认为理应外合，可以打垮秦军的。然而宋义坚持自己的策略，项羽决定除掉宋义。</p><p>宋义决定把自己的儿子，送到齐国为相，亲自送到无盐，置备酒筵，大会宾客。当时天气又不好，下着大雨，士兵又冷又饿。项羽觉得这是个机会，于是项羽就开始煽动众人的情绪。</p><p>（1）项羽说士兵们都吃芋艿掺豆子，说宋义尽然大摆宴席，军队也没有存粮，不率领军队，去赵国取粮，不与赵合力攻秦，却说利用秦军的疲惫。</p><p>（2）最近刚打了败仗，楚怀王非常担心，让宋义统领军队，宋义却不体恤士卒。</p><p>（3）利用职权，派儿子为齐国相，谋取私利，不���贤良之臣。之后项羽就杀了宋义，说宋义叛国，又杀了宋义的儿子，最后自立上将军。</p><p>士兵们不知道，项羽用他们的生命在赌博，来成就自己的功名，而宋义却用智慧来降低成本，来取得终极胜利。</p><p>项羽永远停留在，浅层次思维目标阶段，项羽的目标是打垮秦军，而是宋义的目标是全部歼灭秦军。项羽的思维和宋义的智慧，差了不只一个等级，所以项羽无法理解宋义。</p><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 482px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.94%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"482\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8857037-4b533489408cae12.png\" data-original-width=\"720\" data-original-height=\"482\" data-original-format=\"image/jpeg\" data-original-filesize=\"44501\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><br><p>三项羽的巨鹿之战</p><p>故事后来就发生了有名的巨鹿之战，巨���之战的胜利离不开项羽的勇猛，但赢取胜利的决定性因素，不在项羽。</p><p>首先，秦将章邯的骄傲轻敌的心理，造成了失败因素，大部分失败都源于骄傲轻敌。其次，秦军是双线作战，本身就围困赵军时间久了，就会疲惫，把自己逼入了腹背受敌的境界。再者其他诸侯的军队，也聚集于此，给秦军带来极大的压力。最后秦将章邯惧祸心理，不抵抗投降的政策，让项羽赢得了胜利。</p><p>巨鹿之战，项羽真是赢得侥幸，是存在巨大风险的，有智谋的人，是不会这么干的。当然“破釜沉舟”的故事，人们津津乐道，可是历史上这样的成功，是极少有的。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 492px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 68.33%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"492\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8857037-10bce57e62e20f7e.png\" data-original-width=\"720\" data-original-height=\"492\" data-original-format=\"image/jpeg\" data-original-filesize=\"42047\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p><br></p><p>四项羽的鸿门宴</p><p>”鸿门宴“其中有一个非常小的细节，当初刘邦的手下曹无伤，把刘邦的心思告诉了项羽，于是项羽打算攻打刘邦。因为刘邦实力弱于项羽，打不过项羽，就来向项羽表忠心，于是就有鸿门宴这一出戏。</p><p>刘邦问项羽，是谁告密的，项羽不假思索的说，是曹无伤，等到刘邦回到军营，立即就杀了曹无伤，然后项羽就在无途径，来关注获取刘邦的动态信息。项羽这一行为，无异于砍了自己的手臂，来帮助敌人来打击自己。</p><p>项羽这个行为很白痴，说明他永远处于浅层次的思维阶段，反观刘邦，你就知道差距在哪里了。</p><p>当项伯把消息传递刘邦，刘邦马上就干三件事，一是对待项伯以兄事之，放低自己的身份，行为就像项伯的小弟。二结为儿女亲家，拉进与项伯的关系，巩固联盟，以此来影响项伯的行为。三然后让项伯陈述自己行为的理由，并且表示自己没有贪图之心。然后项伯就成了刘邦的神助攻，让刘邦躲过了一劫，让刘邦有了日后夺天下的机会。</p><p>从这个故事，你就可以看出，项羽是个有勇无谋的莽夫，他和刘邦的思维方式，差了不只一个等级，日后败在刘邦手下，一点也不冤枉。</p><p>项羽之所以会输，因为他始终停留在思维层次的表面，他无法进行长远的思考，他始终只依赖自己的勇猛来做事，很多时候，项羽说话是不经过大脑思考的，完全是直言直语，就拿曹无伤事件来说，有多么的蠢货，才会这样做。牌还没打，就直接暴露了底牌。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 480px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"720\" data-height=\"480\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8857037-3defc2fbc4931849.png\" data-original-width=\"720\" data-original-height=\"480\" data-original-format=\"image/jpeg\" data-original-filesize=\"45109\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p>五项羽对于今天教育的启示和思考</p><p>今天的我们还有多少人，停留在项羽的思维程度上，一直止步不前，却希望自己有所成就，这不是很“扯淡”的理想么？</p><p>走了前半生，遇见过很多事，大部分人碰到事情会手足无措，除了抱怨和责难别人，一点用处都没有。还有很多人，碰到事情，就会说一句，老子烂命一条，拼命了。大部人始终停留在浅层次的思维表面，难以进步，也不愿意进步，这和我们的教育方式息息相关。</p><p>现在���子在填鸭式的教育之下，背负着沉重的课业负担，每天都在比拼的分数的多少，在父母的责骂中，痛苦学习，孩子渐渐变成了学习机器，成了父母虚荣的工具，而不是一个人，更不是一个有思考能力的人，父母从小管大，管吃管喝管娶媳妇，还管儿子儿媳之间的事。最后孩子都不知道会干啥？想干啥？怎么干？脑袋里有的只是糊涂。</p><p>今天精英教育的流行，孩子在学校学习之外，还需要再课外补习，连周末都进行特长补习，五花八门的学习，孩子越来越疲惫，后来，本来有益的学习，变成敷衍大人们的行为，孩子的思维开始固化，以至于长大后，大学毕业后，就进入了失业的状态，今天有多少人在负债累累的生活，又有多少人，赋闲在家的啃老。这都是干啥啥不成，学啥学不透的原因所致。</p><p>所谓教育，就是让孩子学会独立思考和独立认知，成功的教育可以让孩子成功一生，孩子可以学会深度思考，可以做正确的行为选择，可以规避未来存在的祸患。</p><p>教育既生存，让孩子在未来的社会竞争中，可以求的生存，求的胜利，这是教育的根本目的，让孩子可以快乐的生活一生并且能实现自我价值。</p><p>不要让孩子像项羽般思考，否则孩子以后只能是处处被动，处处碰壁的生活。</p>\n          ', '2018/04/15 00:38', 13355, 1804, 23639, 'https://upload-images.jianshu.io/upload_images/8857037-bf37942549659853.png', '');
INSERT INTO `larticle` (`Xaid`, `Psid`, `Vaccount`, `Dtitle`, `Tcontent`, `Rdate`, `Klike`, `Wcomment`, `Oread`, `Kpicture`, `Vlabel`) VALUES
('7660e8566e7b', 7319751, '51995510ee0a', '你努力走过的路，每一步都算数', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 925px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 132.19%;\"></div>\n<div class=\"image-view\" data-width=\"817\" data-height=\"1080\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3532486-c618f09db89f0baa.jpg\" data-original-width=\"817\" data-original-height=\"1080\" data-original-format=\"image/jpeg\" data-original-filesize=\"61665\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p>文|与君成悦</p><p> 01</p><p>今天读书时，再次看到：“你努力走过的路，每一步都算数”这句话，深有感悟，于是有了以下的文字。</p><p>4月10日，<b>与君成悦第一期写作新生班</b>在不舍之中圆满落幕。当我由心底而发说出的那句：“时光不老，我们不散”时，所有的学员列队站齐，一起重复着那句话。</p><p>我向来泪点不算低，写文的时候感性，但在人际关系上却相反，总能轻易想通很多的事情，包括生离死别。也许是自己的那颗心，要比别人多几分善解人意吧。</p><p>然而，那一刻，我却隔着手机屏幕，背着怀抱里还在嗷嗷待哺的二宝偷偷地哭了。</p><p>为了第一期学员66个���学对我的深情厚谊（再次感恩各位同学信任我，成为了我的开山大将），也为了自己付出的那一份心酸。</p><p>是的，这一路很心酸。</p><p>从2月28日，我发布出去的课程招生文案起，从此写作不仅仅停留在信仰上，它已然成为我人生中的另一个事业，而且是值得我用一生去追求的事业。</p><p>在很多人眼里都知道，当爱好成为另一份事业是一件很幸福的事情，但很少人能够了解这其中的辛酸。是的，这其中的辛酸真的只有自己才知道。</p><p>招生一发布出去，因为大家对我的信任，没有几天就全部招满了。所以，招生不算辛苦。最辛苦的是备课和改作业。</p><p>也许是一直以来自己对自己的要求太高，天生就好为人师，出生于教师家庭，从小就有个教师梦的我，长大之后，“教师”没有成为主业，但却曾两次间接地实现了这个梦想。</p><p>一次是在北大求学的时候，那时候一边求学，一边给留学生当汉语老师。另一次就是现在开写作培训班了。</p><p>虽然���式不同，并非是如同传统的人民教师那样，站在七尺讲台上，拿着粉笔在黑板写字，但教书育人的结果是一样的，都是为了传授价值观念，为了传播更有价值的知识，接着就是桃李满天下，受到学生的无比尊重。</p><p>如此说来，我也算是实现了自己的教师梦想了。</p><p></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 422px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.19%;\"></div>\n<div class=\"image-view\" data-width=\"751\" data-height=\"422\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3532486-e05b107e9576a04b.jpg\" data-original-width=\"751\" data-original-height=\"422\" data-original-format=\"image/jpeg\" data-original-filesize=\"93424\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p>02<br></p><p>开培训班，备课和改作业是网络课程里最大的挑战，和传统的授课方式不一样，课程都是在网络直播间进行的。除了做讲稿外，还要做ppt，还要现场录音。</p><p>我声音向来不行，因为不太会发声，不懂掌控声腔力度，加上每节课都是将近1个半小时的干货，讲完下来只觉得喉咙像喷火似的，火辣辣的，接着就是声音嘶哑，疲惫得人根本就不想说话。</p><p>而声音还算是外在的，备课才是重头戏。看过这么一段话：会写的人，不一定会教，会教的人，不一定真的会写。如果遇到一个既会教，又会写的人那便是十足的运气了。</p><p>就好像我读中文系的时候，现当代文学的老师，很会教，但是他一篇纯文学的文章都没有写过，除了评职称的理论文章之外，其他的他真不行，但他懂得去钻研相关的写作技巧的书，如此，他倒是教出了不少的写作很好的学生，比如我。</p><p>讲明清小说史的老师则相反，这个老师是社科院的博士，不太会教，但是她写起文章来，一部又一部，签约了许多平台，靠写作在一线的大城市买了四套房子，而且都是楼中楼的。</p><p>有时候我会想，如果这两个老师能够把各自的本领结合起来，那真是了不得。所以说，这世道里，既能教又能写的老师实在太少。</p><p>而我，就是要去努力挑战这个极限，因为，我想要成为这为数不多，能担起写作重任的人，写作这条路里，我想和路遥、莫言那样，成为一个时代的标杆。</p><p>未来的许多年后，我或人老珠黄，或撒手归西，但只要人们提起这个年代，就会有人知道有一个叫与君成悦的女子，她创办了成悦阁，开创了与君成悦新生班、精进班（成悦读书会），还写了不少可以流传千古的作品。</p><p>这，真是件极好的事情。</p><p>所以，从我萌生开创写作培训班的念头开始，我就一直在边写，边总结着，把这个过程中所有有价值的写作干货都收集起来，结合自己的实际，再去有针对性地将给大家听。希望能够帮助大家在写作上有所进步。</p><p>人生最有意义的事情大体如此：让自己进步是极小的境界，让他人进步是小境界，让一群人跟着你进步才是最大的境界。</p><p>所以，我一直在追求着这种极大的境界，这种境界应该能称作“利益众生”。</p><p>03</p><p>有了这种利益众生的思想后，你才会内心有大爱，才能够毫无保留地把自己的写作经验告诉大家。</p><p>而要做个写作老师，你自己肯定要有足够扎实的语言文字功底，这是必不可少的。这样一来，为了给学员做好榜样，我又不断地倒逼自己去坚持输出。</p><p>每日三千字，每天百页书。如几度师兄曾经跟我说过的那样：<b>读书要诚，唯有诚心，你才能静心，否则就会天马行空，对着书却不知所云。</b></p><p>而我，真真正正践行了自己对写作的承诺。写作这条路，我就是要以身作则���就像出家人一样诚心、静心、善心。</p><p><b>心诚方能静，心静方能学，学后方能布施，而布施积德之心实则是善心。</b></p><p>也正是这样一种心态，让我在最辛苦的改文阶段，面对学员们一开始糟糕的表述，甚至不成文的碎碎念，都能一直耐心下去，上到谋篇布局，下到标点符号，一点一滴地结合写作干货，给大家指出来，熬了无数个夜晚也乐此不疲。</p><p>孩子抱在手里讲课，备课，手机从不离手，随时随刻在线改作业，随时随地解决大家的问题。</p><p>写作这条路，我自认为我不是最有天赋的那个。但是，我足够努力。我始终相信：“天道酬勤”。</p><p>这条路上，充满着荆棘坎坷，但是我有一颗披巾斩棘的决心，见招拆招，兵来将挡水来土掩。</p><p>此外，我不怕这艰辛路途中的寂寞。因为，我深知写作的三种境界。</p><p>这三种境界就是王国维在《人间词话》说的那样：“古今之成大事业、大学问者，必经过三种之境界：‘昨夜西风凋碧树。独上高楼，望尽天涯路’。此第一境也。‘衣带渐宽终不悔，为伊消得人憔悴。’此第二境也。‘众里寻他千百度，蓦然回首，那人却在，灯火阑珊处’。此第三境也。” </p><p>04</p><p>写作这条路，我大体上是最幸运的那个吧。但与其说幸运，不如说努力。孕期和哺乳期，在女人一生身心最脆弱的时候，我创下了自己人生的小小辉煌。</p><p>从怀二宝到现在，一年出头，发表的和还没有发表的，我写下了将近一百万字，拿到了出版社的出书邀请，创建了简书高质量的写作群<a href=\"https://www.jianshu.com/c/04e711fe7702\" target=\"_blank\">成悦阁</a>，以及成悦写作工作室，有了自己的小团队，同时开设了三个写作培训班，所接的文案不少于1000块一篇，所挣的钱是我产假工资的好几倍。</p><p>而这里面每一个字都是我一手抱着孩子一手用手机一个字一个字地打出来的，没有在夜里一点前入睡过，就像此时，写完此篇文章已经凌晨三点了。</p><p>同时，这里面的真情，是我一点一滴，用心去结交出来的，将心比心，不怨其烦地去帮助别人，方换来大家的认可。</p><p>末了，感谢这一路上对我支持和帮助的人。你们很多人都比我优秀，却不怨其烦地帮助我，被你们爱着，我很幸福。</p><p>籍此厚爱，感恩不尽，只有不断前行，希望凭着真诚，似水流年中，相互成就最美的彼此。</p><p><b>最后，深知：人生漫长，没有人能够随随便便成功，你所努力走过的路，每一步都算数。</b></p><p>（ps:一口气写完三千字，洋洋洒洒，都是发心里话，你们都懂我的实在。如果可以，请举手之劳，帮忙点赞评论，感恩！）</p>\n          ', '2018/04/12 02:54', 1618, 12, 2731, 'https://upload-images.jianshu.io/upload_images/3532486-c618f09db89f0baa.jpg', ''),
('879646528180306145424', 1, '879646528', '来一场说走就走的旅行', '测试使用', '2018-03-06 14:54', 2541, 7154, 15340, 'kaiyan/thumbnail/879646528180306145424.jpg', ''),
('879646528180323130437', 1, '879646528', '面朝大海，春暖花开', '测试使用', '2018-03-23 13:04', 5221, 8154, 25340, 'kaiyan/thumbnail/879646528180323130437.jpg', ''),
('879646529180325140728', 2, '879646529', 'Andorid：这是一份Handler消息传递机制的使用教程', '测试使用', '2018-03-25 18:18', 57, 10, 1456, 'kaiyan/thumbnail/879646529180325140728.jpg', ''),
('879646529180327182534', 3, '879646529', '浅谈JavaScript中的闭包以及模块机制', '测试使用', '2018-03-27 19:24', 15, 23, 1024, 'kaiyan/thumbnail/879646529180327182534.jpg', ''),
('8b5cda88d1c6', 14364349, 'd3fd05d71dec', '‹我不认识你，但我愿意尽我所能帮助你›', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 1050px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 150.04999999999998%;\"></div>\n<div class=\"image-view\" data-width=\"1079\" data-height=\"1619\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4989275-a18918b3139c1fd0.png\" data-original-width=\"1079\" data-original-height=\"1619\" data-original-format=\"image/png\" data-original-filesize=\"2830032\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><blockquote><p><b> </b><b>“</b><b>猴神哈奴曼传说是孙悟空的前世，猴神</b><b>大叔</b><b>也像孙悟空一样</b><b>。</b><b>经历磨难</b><b>，</b><b>一步步将“爱”放在了坚持多年的信仰之前</b><b>。</b><b>真正从狭隘的印度教徒变成了博爱的“猴神”，从“人性”转变成了“神性”。</b><b>”</b></p></blockquote><p><b> </b><b>在出电影院的电梯里，女孩：刚才你哭了吗？男孩：没，没有。就是眼里酸酸的。</b></p><p>伴随着猴神把沙希达抛举到空中，画面静止，歌声响起。显然影片是结束了，可身后的姑娘却哭的泣不成声，久久未能离去。</p><p>河谷的两岸，一边是印度，一边是巴基斯坦。白茫茫的雪山下聚集了无数的群众，他们用行动帮助着猴神跟沙希达。</p><p>猴神渐渐走远，沙希达拼尽全力喊出了她从出生以来的第一句话，不是爸爸妈妈，而是他的猴神大叔。</p><p>我承认看到这里，我非常不争气的哭了。可这种不争气我真的好喜欢啊。</p><p>成年以后，能让自己哭的东西掰着手指就能数出来。真的好久没有这种鼻子酸酸，眼角挂泪，久久不能平静的感动了。</p><p>寒假在家把神秘巨星看完之后，我就试着在网上搜了一下。没想到看见这部电影要在元宵节上映。然后我转眼就把这件事忘在脑后。</p><p>不知道是不是冥冥之中的契合，元宵节的中午我突然想了起来，在电影还有几分钟的时候，我鬼使神差的坐进了电影院。</p><p>在印度的《罗摩衍那》里，神猴哈奴曼一路帮助阿逾陀国王子罗摩从魔王罗波那手中放出解救王妃悉多。</p><p>在中国的《西游记》里，孙悟空护送唐三藏经历九九八十一难西行取得真经。</p><p>而在《小萝莉的猴神大叔》里，虔诚迂腐的印度教教徒帕万突破重重险阻，亲自互送走丢有语言有障碍的巴基斯坦小女孩沙希达回家。</p><h4><b>* 01 善良 or 冷漠</b></h4><p><b>“有一种善良，是我不认识你，但我愿意尽我所能帮助你。”</b></p><p>一个走失在异国他乡的聋哑小女孩，一个自身难保的流浪汉。很多时候，奇妙的安排就是这样产生的。</p><p>在一场盛大的歌舞表演中，风光无限的猴神帕万被躲在远处人群中的一个小女孩默默注视着。就是这一眼，就注定了两个毫不相干的人要开启一段有关爱的冒险。</p><p>猴神大叔被称为“猴神”，是当地人对他最高的赞赏。说明他的善良和义勇得到了他人的承认。</p><p>而当他手足无措的面对这个陌生的小女孩时，他的信仰告诉了他答案，决不允许扔下沙希达不管，一定要帮助她找到父母。</p><p>不得不说，有时候爱真的是具有感染力和传播力的。</p><p>从一开始小范围的感动巡守边界的士兵，到感动记者和乘客，再到感动了全国甚至跨越国境的巴基斯坦人民。</p><p>每一次的感动都在告诉你，不是我们习惯了冷漠，而是我们藏起了善良。</p><p>善良影响利益，于是大家渐渐都变得冷漠。面对利益的抉择，再善良的人都会变得犹豫。</p><p>可到底是利益重要，还是善良更有意义呢？</p><p>我不知道，但帕万给了我们一个很好的角度。我们可以隐藏善良，维护自己的利益，但愿我们都能不再冷漠。</p><h4>\n<b> </b><b>* 02   正直 or 固执</b>\n</h4><p><b>“</b><b>你要么是个勇士，要么就是个傻瓜。</b><b>”</b></p><p>一个永远在做着选择题的印度小男人，小时候在“信哈奴曼神不挂科”和“作弊”之间选择，遇到沙希达后在“管”和“不管”之间选择；</p><p>接受岳父考验的时候在用钱“买房”还是“送女孩偷渡回家”之间选择；进入清真寺时在“迈进”和“不迈进”之间选择，跨入边境线时在“偷偷进”还是“得到允许再进”之间选择；</p><p>他的本真的纯善和迂腐的信仰一次次支配了它的选择，也注定了它是宿命里那个护送小女孩回家的“真神”。</p><p>我的宗教信仰不许我说谎。我是哈奴曼神的信徒，绝不会偷偷摸摸做事。朋友们都叫我作弊，可我毕竟是哈奴曼神的信徒。我跟他们说，我宁肯挂科也不要作弊。</p><p>是吧，看起来多傻。多不符合我们眼中一个拥有高情商跟智慧的人。但就是这样一个固执不会���弯的人，实实在在的告诉了我们。</p><p>有些事情真的可以不用那么圆滑，那么世故，那么八面玲珑。</p><p>即便我们没有宗教信仰，那我���也该信仰善良。不管多么纷繁复杂，善良的固执下去，这也许才是我们应该学的‘低情商’。</p><p>帕万不顾世俗和家庭的反对，带着这个被印度家庭厌弃的穆斯林小女孩穿越沙漠和国境线，冲过重重险阻。</p><p>不是他有多伟大多善良，而是在他的想法里，这就是一件对的事，一件再正常不过的事。</p><p>就像他对那个长官说的话：我答应过哈奴曼神，不把穆妮送回家和家人团聚，我是不会善罢甘休的。</p><p>他做到了，他没有食言。尽管他大可不必这样做，尽管他吃遍了苦头，尽管他可能会失去所爱的人。他还是一往无前的走了下去。</p><p><b>多傻就有多坚强，多傻就有多固执，多傻就有多善良……</b></p><h4>\n<b> </b><b>* 03  梦想 or 现实</b>\n</h4><p><b>“</b><b>你知道我为什么爱上你吗？因为你有一颗纯洁的心。</b><b>”</b></p><p>作为一个虔诚的宗教教徒，帕万要的真的不多。有一份工作，有一份收入，可以攒够钱买一套房子，然后娶自己心爱的女人。</p><p>可就是这样一个普普通通的梦想，帕万可能要用尽他所有的力气才能去一点点的获得。</p><p>在他的逐梦路上，真的不允许任何特殊情况出现。不然他就要与自己心爱的人分离。</p><p>可那个特殊还是毫无预兆的落到了他的头上。</p><p>该继续还是放弃？这是他要慎重再慎重思考的问题。</p><p>一边是来自岳父强大的压力，一边是来自现实的残酷与无力。他必须要做一个抉择。</p><p>我们每个人又何尝不是这样，一边艰辛生活，一边顶住压力追求属于自己的幸福。在路上我们一次又一次的选择再选择。</p><p>不管最后结果怎样，我们都选择了那个我们曾经深信不疑的选项。</p><p>帕万也是，他一路护送那个让他离幸福越来越远的陌生小女孩。在两种爱之间，他选择了那种更能让他心安的。</p><p>他用掉自己所用的钱去帮助小萝莉，他不惜撒谎来帮助小萝莉，他冒着生命危险去帮助小萝莉。</p><p>既然已经知道梦想离自己越来越远，何不让自己更加疯狂一点。只管走好了，梦想可以换，但善良不行。</p><p>在现实里，我们总爱询问它的意义，殊不知，梦想本来就是一件很没有意义的事，只是我们赋予了它意义，才会这样让我们去努力。</p><p>但如果每件事都去赋予它意义，那不就是没有善良了？</p><p><b>与其说没意义，不如说我们被现实裹挟着扔进了假象的牢笼。</b></p><h4>\n<b> </b><b>* 04   信仰or 仇恨</b>\n</h4><p><b>“你是愿意你的孩子在仇恨中长大，还是愿意他们在爱中长大？”</b></p><p>其实猴神一开始也是狭隘的，因此在他发现沙希达是个穆斯林之后激动地说“她骗了我们！”甚至产生了扔下她不管的念头。</p><p>好在这时，他的天使女友拉希卡出现了。拉希卡在这时简直散发着母性的光芒，在她内心沙希达不是什么异教徒，只是一个六岁的和父母走丢的孩子。</p><p>如果说这时的猴神还是一只莽撞的小猴子，那女友耶更像普世大爱的菩萨。她的话引导猴神从狭隘的爱转向了大义的爱。</p><p>当女友说出“你最吸引我的地方就是你的纯洁”时，也让他瞬间看清了内心。</p><p>此时为了善良和爱，必需将宗教冲突暂时放在一边。但这时他的善良，也是基于他的信仰。他的爱仍是狭隘的爱和信仰所要求他做到的善良。</p><p><b>宗教是信仰内的善良，爱却是无国界无歧视的宽容。</b></p><p>帕万也从一开始的为了信仰帮助沙希达，也会为了爱而做出与信仰冲突之事。踏进清真寺和穆斯林神庙祈福，���记者之口撒谎以摆脱麻烦。这些看似是违背了哈奴曼教徒的准则，实则是另一种进化。</p><p>就像神父说的跟做的那样：<b>“这里欢迎所有人，因此我们的清真寺从不锁门”</b><b>。</b></p><p>临别时也毫不在意地用印度教的礼节对他们告别，这都无疑感染了猴神，让他不再为表面的条条框框所局限，真正领悟哈奴曼的大爱和义勇。</p><p>他以身试法挑战两国长久以来根深蒂固的矛盾偏见，用暖心宽容每一个怀有敌意的人。</p><p>没有人敢于在敏感时期试图跨越的那道冰冷铁丝网，但这道网却被一个冥顽不化的大叔硬生生的凿出了一个口子。</p><p><i> </i><b>凿开了冰川，流出的却是热气</b>……</p><h4>\n<b>* </b><b>05</b>\n</h4><p>我很喜欢莎士比亚的一句话：<b>一颗好心抵得过黄金。</b></p><p>获得别人尊重的方法不胜枚举，但唯独只有你付出了真心与善意，别人才会真正的对你产生尊重。</p><p>帕万觉得自己不伟大，因为他只是做了一件对的小事；但同时他又是伟大的，因为没有单纯、善良和真实,就没有伟大。</p><p>就像这部影片的宣传语一样，用爱震撼心灵。我想它绝对做到了。</p><p>但似乎还有一个更为重要的意义。</p><p>那就是用爱感化心灵。</p><blockquote><p><b>我是你的声音，而你是我的语言，我能听到你无法言说的话语。</b></p></blockquote><p><br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 288px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 40.56%;\"></div>\n<div class=\"image-view\" data-width=\"710\" data-height=\"288\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4989275-347aa9e4c29f14f0.jpg\" data-original-width=\"710\" data-original-height=\"288\" data-original-format=\"image/gif\" data-original-filesize=\"4728289\"></div>\n</div>\n<div class=\"image-caption\">善</div>\n</div>\n          ', '2018/04/15 22:54', 10379, 15, 14777, 'https://upload-images.jianshu.io/upload_images/4989275-a18918b3139c1fd0.png', ''),
('949d2165b291', 19542500, '14ea11f850f3', '蒋坤元｜在平凡中奔跑，在智慧下发光', '\n            <p>亲爱的蒋总：</p><p>自那日苏州一别后就想特意为你执笔一封，写下只属于你的文字。可能是因为你对我的恩情、真诚感动了我，总是顾虑自己写你时不能把真实的情感涌露出来。你说在一紫的声音下，听着她的声音，你哭了，泪流满面的哭。所以我是那么想让你在我的文字下也尽情的哭一次啊！</p><p>一向不善写散文、写情感的我今天终于用涌向心头的勇气写起了你，我怕让你等太久，以至于你都累了。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 1244px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 177.78%;\"></div>\n<div class=\"image-view\" data-width=\"1080\" data-height=\"1920\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6207850-30d67633afee07ab.jpg\" data-original-width=\"1080\" data-original-height=\"1920\" data-original-format=\"image/jpeg\" data-original-filesize=\"341740\"></div>\n</div>\n<div class=\"image-caption\">\n\n我与蒋总合影\n\n</div>\n</div><p><b>蒋总：见字如面</b></p><p>4月8日，那个临别的黄昏，原本低着头开车的你突然转过头来对着正在副驾驶的我说：邹治老师，我有个要求要跟你提提啊！</p><p>看着你亲切的面孔我认真的回答道“蒋总，您说，我听着呢！”</p><p>你的个人问题啊，什么时候解决啊？男人成家立业，成家成家才可以立业嘛！哪怕事业再重要你也要照顾父母的感受嘛，他们都这么大年纪了，你不能这么自私。</p><p><b>是啊！这一番话却说到我心理去了啊，大学毕业几年一个人去了那么多的城市到处闯荡只为出人头回去光宗耀祖，让父母好好光彩一番。</b></p><p><b>可到头来却发现不管我如何努力总是在过年回去的那一刹那超越不了村里村外的孩子，就算去年我终于算是取得小有成就，可是回去后依然是没房没车，而那些跟我同年龄的伙伴们一个个不是开着车就是有着自己的一套房子。</b></p><p><b>都说穷人的孩子早当家，我想过了去年我们家也总算是要打个翻身仗可以过的好一些吧！直到这次���昆山看父母，看着父亲喝醉酒趴在桌子上难受地痛着吐酒的画面，看着父亲拉着表哥喝酒迟迟不肯让母亲撤走已经凉了菜的场景，我知道父亲是真的老了，这颗大树已然退却了遮风挡雨的力量，有的只是苦苦硬撑着去庇护的信念。</b></p><p><b>其实父亲不说我也知道他一直想我给他找个儿媳妇，只是害怕给我太大的压力不去开口而已，对于他的身体状况也总是逼着母亲不给我透露，我知道他怕我担心他而分心自己的事业压力太大，倒是母亲多次催促着我找一个。</b></p><p><br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 393px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"1920\" data-height=\"1080\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6207850-c7165fa056f96f53.jpg\" data-original-width=\"1920\" data-original-height=\"1080\" data-original-format=\"image/jpeg\" data-original-filesize=\"720666\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>你的这句话我知道是作为过来人给年轻人的忠告，我知道是站在我父母的层面将心比心的作为长者的关心。</p><p>虽然我们平时鲜少联系，但因为文字与善良造就了我们的相遇，对我说的话我想亦是把我当作自己的儿子一样只希望我更好吧！</p><p>也许你在别人耳中听到，也许你在我身上看到了那个曾经骑着那个嘎嘎想弄得满脚是血却不忘心里默念着“迟早有一天我也会拥有自己的小汽车进出这高档会所”的男孩。</p><p>那一年，正是你立志要去改变这家族命运的一年，那一年也正是造就你与她注定相遇的一年。因为自己知道自己想要什么，因为要让自己变得不一样，随后的日子里你毅然选择了创业！</p><p>当所有人都以为你疯了的时候，当所有人都不理解你的时候，甚至你妻子为此都跟你大吵了一番最后拗不过你只得陪着你向娘家挨个借钱。</p><p>任何人的成功都不是随随便便，有着只是受尽委屈和泪水与汗水的交叉，有的只是晚上一睡着就害怕第二天迷茫的醒不过来。你也不例外，一下子几百万的外债把你压得喘不过气来，甚至你都在想，天呐，这么大的数额我该怎么办？你说，在那段时间每天晚上躺在 床上辗转反侧彻夜难眠。</p><p>因为工厂的初建，什么事都要亲历亲为，不懂技术的你为了省下雇人的成本自己亲自上机操作，也因为这样，那一夜由于自己的一个不小心把跌了下去把牙齿磕到地上，那血啊，直流流的流了出来，蒋夫人看到了你着急地赶紧拿出家里的医药包边给你擦拭着周边的淤血边问你痛不痛？</p><p>你笑呵呵的说道：“没事，我不痛，就是流出了点血而已”</p><p><br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 394px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.3%;\"></div>\n<div class=\"image-view\" data-width=\"1277\" data-height=\"719\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6207850-7eafdbb770f70316.png\" data-original-width=\"1277\" data-original-height=\"719\" data-original-format=\"image/png\" data-original-filesize=\"2064588\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>直到后来你在你的新书《我想拥抱太阳》中才写道：哪会不痛啊，当时整个块门牙都松了！</p><p>终究是黄天不负有心人，那时你买的地到现在只有向京东那样大的上市公司才能够有的权益，所以你一下子发了起来。</p><p>富贵不能移淫，贫贱不能移，一日同床百日恩。也许是苦时的陪伴，也许是抛弃荣华富贵追随穷小子一生并为其开枝散叶的感恩，你总是在变得格外的珍惜你的这位蒋夫人。可能在一般人看来，他们只看到了你懂得感恩的这一���画面，而在我眼里却看到了你那智慧的一面。</p><p>都说女人最擅长的是一哭二闹三上吊，其实我教别人做这样做法的人心得是要不得的，是想别人家里不得安宁。若爱，不用你闹，对方也会把你捧在手心；若不爱，你闹得再凶也只是徒增枉然，最后闹得俩人都互相伤害。</p><p>而你却智慧的懂得了“一个好女人旺三代”的道理，所以你总是陪伴蒋夫人，时不时给她一个惊喜，见面的那天你对我说道：在家吵架不管怎样，我都觉得是我没有道理，并且你也是跟你儿子这样说的。这让我想起了著名主持人马丁老师在演说家节目里面的“跟老婆吵架，男人总是输”的道理。</p><p><br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 393px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"1920\" data-height=\"1080\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6207850-71e623f3f187a3bb.jpg\" data-original-width=\"1920\" data-original-height=\"1080\" data-original-format=\"image/jpeg\" data-original-filesize=\"220409\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>其实不是你吵不赢，也不是你不愿意去吵，而是你直到，在女人面前，吵赢了那又如何？输掉的是男人的尊严，输掉的是家庭的幸福，输掉的更是一个从少女跟随你变老付出了美好年华的心。所以你悄悄的跟我透露着这次聚会前夕好好陪着蒋夫人上九华山吃斋念佛，回头她是如何支持你盛情款待我们的夫妻相处法则。</p><p>因为在你的努力下，渐渐的有了一定的成就，蒋夫人也变得慢慢理解你当初那么苦顶着压力创业是为了让自己的儿子可以不用像你一样为了小小的资金而变得卑微。上天总是眷顾那些善良又努力的人儿的，你们的儿子在你的呵护下主动担起了正翔厂的责任，对你，现在也显得格外的尊重，对这个家也是很努力的去经营。</p><p>就算这样，你也要在出门接我们时去厂里报个到告诉儿子一声。你说：不是请示，是起码的尊重，这样以后儿子有事不在了也会告诉你一声。啊，听着你的阐述，我才发现原来你是多么智慧的人儿呀，虽然书读的不多却被称为智慧的长者一点都不为过。</p><p>未完，待续……</p><hr>\n          ', '2018/04/13 21:57', 18460, 113, 23708, 'https://upload-images.jianshu.io/upload_images/6207850-30d67633afee07ab.jpg', ''),
('98db5d501702', 9984068, 'a7f876850fa6', '乡愁', '\n            <p>三原则：图原创，文原创，诗原创。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 1050px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 150.0%;\"></div>\n<div class=\"image-view\" data-width=\"1280\" data-height=\"1920\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4810847-52b6c310faac738d.jpeg\" data-original-width=\"1280\" data-original-height=\"1920\" data-original-format=\"image/jpeg\" data-original-filesize=\"1446243\"></div>\n</div>\n<div class=\"image-caption\">图片拍摄于丹巴</div>\n</div><p>小时候<br></p><p>我住在一个小小的村子</p><p>山前有树</p><p>溪边有牛</p><p><br></p><p>后来</p><p>我去了一座大大的城市</p><p>心头有梦</p><p>眉间有愁</p><p><br></p><p>然后</p><p>我买了一套挤挤的房子</p><p>屋下有家</p><p>肩上有责<br></p><p><br></p><p>现在啊</p><p>我回到一个花开的村子</p><p>眼里有泪</p><p>杯中有酒</p>\n          ', '2018/04/15 07:29', 2, 156, 248, 'https://upload-images.jianshu.io/upload_images/4810847-52b6c310faac738d.jpeg', ''),
('a1181fefade2', 20834335, 'cab027d5878e', '这是我在巴西见过最美的海！', '\n            <p><b>2018年4月12日，星期四，巴西晴</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 504px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 55.63%;\"></div>\n<div class=\"image-view\" data-width=\"906\" data-height=\"504\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9943361-f10f7fe5e48bfb16.jpg\" data-original-width=\"906\" data-original-height=\"504\" data-original-format=\"image/jpeg\" data-original-filesize=\"212278\"></div>\n</div>\n<div class=\"image-caption\">封面</div>\n</div><p><b>01</b></p><p>以前说过，里约有很多美丽的海滩，我之前去过著名的<a href=\"https://www.jianshu.com/p/537255eb526b\" target=\"_blank\">Capacobana海滩</a>，感觉很不错。不过，城市周围的海滩往往不是最美好，正如我当初去<a href=\"https://www.jianshu.com/p/3c91965e8882\" target=\"_blank\">萨尔瓦多</a>时，远离城市的弗朗西斯海滩更美。</p><p>我之前去过秦皇岛，市区的海滩上比较脏，嗨水也很浑浊；而到了偏僻一些的南戴河，船少了，人少了，水也清澈多了。</p><p><b>所以，如果你要去���滩，一定要去人少的地方哦。</b></p><p>圣保罗的巴西同事告诉我们，在距离里约170多公里的地方，有一个小城市叫做Arraial de Cabo，有特别美的海滩，强烈推荐我们去玩！查了地图，预计驾车时间大约三小时。</p><p>我们这次只有三天。第一天上午到了之后，下午去糖面包山。第三天去基督山。这样第二天就留给了Arraial de Cabo。</p><p>巴西同事觉得一天时间太紧张，因为那里值得去好几天。不过，想想我已归日无多，加上圣保罗的小伙伴对海滩情有独钟，那就去吧！</p><p>事实证明，这个决定也是绝对正确的！</p><p><b>02</b></p><p>去Arraial de Cabo的行程是我负责联系的，主要内容是坐船去几个不同的海滩玩。最开始租船公司只有早上8点的行程，这意味着早上5点就要从里约出发，实在太早啦，而且海水会很凉。</p><p>旅行社说，可能会有中午12点的行程，但需要等。</p><p><b>都说美好的东西需要等待，那就等吧。</b></p><p>距离出发时间前一周，终于等来了好消息，中午12点的行程可以预定啦！</p><p>为了去海滩，我们专门联系了一个Uber司机，说好早上7点从里约出发。但是距离出发只有三天时，司机忽然建议我们早上4点半出发，说临近放假，晚了会堵车。</p><p>为了保险，我们提议提前到早上6点出发，这样距离船出发还有6个小时，无论如何都应该足够。于是乎，和他讨价还价，好说歹说，他就是坚持4点半出发。他号称会英语，但我打电话过去才知道他是依靠Google翻译和我沟通，那就继续打字吧。</p><p>我们心里也在犯嘀咕，这里面会不会有什么猫腻？</p><p>不得已，我使出了杀手锏，截了一张大巴的时刻表给他。司机有些生气：“你这是什么意思？”我想想有点不合适，于是撤回了。</p><p>司机最后很无奈地说了句，“听你们的，让顾客满意最重要！你们说六点就六点吧。”虽然隔着屏幕，也能感觉到一丝幽怨。</p><p>当天实际出发时间6点半，前面两小时路程非常顺利，以至于我也开始怀疑这个司机了。但快到那个城市时，开始堵车了，这一堵就是两个多小时！</p><p>看着导航地图上的红色，距离终点只有不到6公里，预计时间需要1小时，确实让人很无语。</p><p><b>难怪有句话叫，不听老人言，吃亏在眼前呐。</b></p><p>经过这两年的接触，其实巴西人要比我们要简单得多。如果国内的旅游从业人员也能这样，大家也就不必跑到国外了。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 1244px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 177.78%;\"></div>\n<div class=\"image-view\" data-width=\"1080\" data-height=\"1920\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9943361-366e9193491f5537.png\" data-original-width=\"1080\" data-original-height=\"1920\" data-original-format=\"image/png\" data-original-filesize=\"250420\"></div>\n</div>\n<div class=\"image-caption\">堵车好厉害！</div>\n</div><p><b>03</b></p><p>还记得我的<a href=\"https://www.jianshu.com/p/f9596744362c\" target=\"_blank\">美丽岛之行</a>吗？堵车时，最怕的就是——尿急！</p><p>以前关于国庆堵车，有这样一个段子。一个女的担心被人看到，犹豫要不要去上厕所。后来一个朋友给了她一个塑料袋，在她耳边说了一句，她就开心地去了。</p><p><b>塑料袋用在哪里？当然是套头上啦！</b></p><p>我们几个人也有些忍不住了，于是和司机商量停了车，去旁边的草丛里解决了一下。</p><p>不过，我们真的没有用塑料袋，信不信由你。</p><p>清空了库存，一下子就轻松了。而且因为人多，大家你一言我一语的，再吃点小零食，时间很快就过去了。这也是人多的一大好处！</p><p><b>04</b></p><p>千辛万苦，终于到了旅行社，换了衣服、抹上防晒霜，准备出发啦！</p><p>我们的第一个目的地叫做Prainhas do Pontal do Atalaia，下面这张图是去之前网上找的，看起来就很有吸引力吧！实际身临其境，景色更美！</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 550px; max-height: 366px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.55%;\"></div>\n<div class=\"image-view\" data-width=\"550\" data-height=\"366\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9943361-1344c9cec9f2713a.jpg\" data-original-width=\"550\" data-original-height=\"366\" data-original-format=\"image/jpeg\" data-original-filesize=\"42274\"></div>\n</div>\n<div class=\"image-caption\">来自网络</div>\n</div><p>时间已到中午，海风吹在身上很舒服，大家有说有笑的，坐着船迎风破浪出发了。</p><p>天气很给力，天蓝蓝的，万里无云，不像我当初去<a href=\"https://www.jianshu.com/p/fe11651ac0d2\" target=\"_blank\">大洋路</a>遇到了阴天。</p><p><b>所以，出去旅行，提前查天气还是很有必要的，有备无患嘛。</b></p><p>这里的海，碧蓝碧蓝的，像是一块巨大的蓝宝石，随手一拍，张张都是大片。在这样美好的景色面前，语言都有些苍白无力。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 464px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.36999999999999%;\"></div>\n<div class=\"image-view\" data-width=\"3116\" data-height=\"2068\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9943361-746af608746af81a.jpg\" data-original-width=\"3116\" data-original-height=\"2068\" data-original-format=\"image/jpeg\" data-original-filesize=\"2069835\"></div>\n</div>\n<div class=\"image-caption\">迎面而来的船</div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 464px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.42%;\"></div>\n<div class=\"image-view\" data-width=\"3216\" data-height=\"2136\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9943361-a324385c344a87fd.JPG\" data-original-width=\"3216\" data-original-height=\"2136\" data-original-format=\"image/jpeg\" data-original-filesize=\"3862798\"></div>\n</div>\n<div class=\"image-caption\">住在山上太幸福</div>\n</div><p>快到目的地时，水忽然变了颜色，从深蓝变成浅蓝，能够一眼看到水底。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 464px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.42%;\"></div>\n<div class=\"image-view\" data-width=\"3216\" data-height=\"2136\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9943361-2de6cc739f42940d.JPG\" data-original-width=\"3216\" data-original-height=\"2136\" data-original-format=\"image/jpeg\" data-original-filesize=\"4167719\"></div>\n</div>\n<div class=\"image-caption\">清澈见底</div>\n</div><p>小时候学过一首诗，“远看山有色，近听水无声。春去花还在，人来鸟不惊。”</p><p>随着时代进步，我们有了相机，可以记录更多的美景，除了画面，还有了声音，有了视频；我们也有了手机，可以随时随地记录；我们还有了运动相机，可以在更多极限条件下记录；我们还有了全景相机，可以拍出让人感觉身临其境的全景视频。</p><p><b>感谢这个时代，带给我们无与伦比的新体验！</b></p><p>感谢这个时代，大家足不出户可以看到巴西的美景！戳下面的视频大饱眼福吧！</p><div class=\"video-package \" data-video-id=\"57886\" data-video-url=\"http://v.qq.com/iframe/player.html?vid=g0628mq0eg4&tiny=0&auto=0\" data-flash-url=\"http://static.video.qq.com/TPout.swf?vid=g0628mq0eg4&auto=0\" data-provider=\"qq\" data-cover-uuid=\"null\">\n<br><div class=\"video-description\">里约，蓝蓝的海_腾讯视频</div>\n</div><div class=\"video-package \" data-video-id=\"57887\" data-video-url=\"http://v.qq.com/iframe/player.html?vid=s0628bwwtbk&tiny=0&auto=0\" data-flash-url=\"http://static.video.qq.com/TPout.swf?vid=s0628bwwtbk&auto=0\" data-provider=\"qq\" data-cover-uuid=\"null\">\n<br><div class=\"video-description\">里约，最清澈的海水_腾讯视频</div>\n</div><p>到了海边，当然还要下水一游，这时单反只好放在船上了。相比单反，运动相机显得不够给力，不过玩得尽兴更重要！</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 525px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.03999999999999%;\"></div>\n<div class=\"image-view\" data-width=\"2540\" data-height=\"1906\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9943361-07e0c998878eb6d1.jpg\" data-original-width=\"2540\" data-original-height=\"1906\" data-original-format=\"image/jpeg\" data-original-filesize=\"1020831\"></div>\n</div>\n<div class=\"image-caption\">清澈见底的海滩</div>\n</div><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 525px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.0%;\"></div>\n<div class=\"image-view\" data-width=\"2592\" data-height=\"1944\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9943361-9dd4e2b4efdb7e9d.jpg\" data-original-width=\"2592\" data-original-height=\"1944\" data-original-format=\"image/jpeg\" data-original-filesize=\"1007887\"></div>\n</div>\n<div class=\"image-caption\">青山、绿水、白沙、红衣</div>\n</div><p>青山、绿水、白沙，还有红衣。</p><p>相比周围清一色的比基尼，那件红色的连体泳衣显得有些与众不同。以至于我们开玩笑地说，我们同事是从朝鲜来的。</p><p>关于海滩，小伙伴们继续看视频吧。</p><div class=\"video-package \" data-video-id=\"57888\" data-video-url=\"http://v.qq.com/iframe/player.html?vid=c06280m303l&tiny=0&auto=0\" data-flash-url=\"http://static.video.qq.com/TPout.swf?vid=c06280m303l&auto=0\" data-provider=\"qq\" data-cover-uuid=\"null\">\n<br><div class=\"video-description\">里约附近最美海滩，没有之一！_腾讯视频</div>\n</div><p>人多了，可以玩的内容更丰富了，比如下面这个。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 525px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.0%;\"></div>\n<div class=\"image-view\" data-width=\"2592\" data-height=\"1944\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9943361-ebe4ac93cd44c809.JPG\" data-original-width=\"2592\" data-original-height=\"1944\" data-original-format=\"image/jpeg\" data-original-filesize=\"1680417\"></div>\n</div>\n<div class=\"image-', '2018/04/13 09:07', 18, 2, 24, 'https://upload-images.jianshu.io/upload_images/9943361-f10f7fe5e48bfb16.jpg', ''),
('a20f9171a994', 4492068, '61d710a4a0ce', '读《世界是心的倒影》有感', '\n            <p>雪漠的作品以传统佛教智慧观照当代生活，以佛教精神超越苦难，洞穿人性，拯救灵魂，回答了现代人的精神困惑和灵魂焦虑等问题，影响了一大批年轻人。好友发起了一个读书会，准备明天早上在一初空间开展第一次读书活动。就是要谈谈读了雪漠老师的《世界是心的倒影》的心得体会。</p><p>其实，我早已读完这本书，甚至在我的文章中的许多观点都有雪漠老师的影子，只是没有专门因为老师的这本书而写心得体会，今晚，却因为明天的读书会而需作的一篇应试作文，所以再次又重温了一下这本书。</p><p>在这本书中有一段话深深地打动了我，雪漠老师是这样写的:夜深人静又无法成眠的时候，你是否曾经叩问心灵这样一个问题：“人为什么活着？”生、老、病、死，爱别离，恨相聚，求不得，贪嗔痴慢妒五毒炽盛，人生有太多的苦，唯一的归宿又是死亡，就连地球���也难免面临陨灭的一���。那么人为什么要经历这一切，苦苦地活下去？</p><p>如果要把这个问题说清楚，那么就一定要先明白什么是死，就首先要对死亡有一个清醒、正确的认识。因为我们很多平凡人总是看不透死亡，总是对死亡怀着深深的恐惧。对于死亡没有一颗平常心，又如何能够好好活着呢？</p><p>雪漠老师受老庄思想的影响很深，我们看庄子哲学的时候，会发现庄子真的是个很洒脱、很浪漫的人，在他所在的那个年代，他对死亡的认识简直是超凡脱俗、标新立异。他的妻子死了之后，惠子去吊唁他的妻子，然后庄子正在那里击缶高歌。这种反常的举动让惠子非常不能理解，你不是深爱你的妻子么，怎么可能没有丝毫地伤心的神色啊！难道是男人的人生三大幸事（升官、发财、死老婆）之一吗？都不是啊！</p><p>因为庄子认为他的妻子其实是回家了。生命从大地来，也返回到大自然去，从哪里来的就到哪里去，其实，生死只不过是一场轮回。换言之，那就是对于庄子来说，他妻子的死亡只不过是身体这幅皮囊回归了大自然，而精气神也由凝聚变为弥散而已，从有形到无形的转变而已。<br></p><p> </p><p>记得有部国外的电影是讨论一个死亡的问题，这个电影的情节是一个父亲，他有一种特异功能，他能够预知即将要死的人，有天他发现自己的妻子将要离开这个世界了，而他们的女儿很小，十岁不到，所以在妻子离开这个世界之前，他决定对女儿来一场生命和死亡的教育。<br></p><p> </p><p>父亲问女儿对于死亡的看法，女儿非常自信的回答：“我知道很多，我们死了之后，我们被埋到泥土下面。那里有很多的鼻涕虫，然后那些鼻涕虫一点一点把我们吃掉，然后我们就不存在了。”父亲说：“是啊！亲爱的，科学上确实是这样说的，但是你知道我们有一个看不见的世界吗？”</p><p> </p><p>接着父亲说，“我想我们虽然死了，但我们并不会完全消失。我常常带你到海边，看到一艘船渐渐消失于海面上的时候，当我们看不见它了，我们能够说它就不存在了吗？”女儿说：“不能，我知道船还在。”</p><p> </p><p>然后父亲跟她说：“是的，我觉得人的死亡也是同样的道理，就像生命出于某些原因，要渐渐地远离我们，虽然我们的眼睛看不见它了，但是它很可能就像与远方的船一样，依然存在着。”</p><p> </p><p>我相信我们当中很多人对于死亡的看法就跟那个小女孩儿差不多，死了，被掩埋，被吃掉，腐败、消失。但是也可以这样理解:死亡是生命进入了另一种存在状态，虽然我们看不见了，但他用一种我们看不见的方式存在着，就像这位父亲说的大海上的航船。</p><p>无论是花谢花开，还是人来人往，这个浩瀚无垠而深邃古老的宇宙以一种隐秘而玄妙的方式守护着自身能量的平衡。而每一个生命的存在与消散，都在提醒我们每一个生命的独特与唯一。</p><p>因此，只有你看清了死亡，你就会更加珍惜此时此刻的生活。时光总是一去不复返，每一刻都是如此珍贵，所以我们当珍惜生命，即不论衣食住行、喜怒哀乐，全然地投入当下的生活，郑重地对待此时此地眼前的这个人，手头的这件事。<br></p><p>我们大多数人常常会嗟叹人生的过去，陷入对过去的无限追思中去，无法自拔地沉迷于过去的痛苦或者畅快的时日，又抑或感怀生命的未来，对未来充满了幻想和憧憬，往往最被忽略的就是我们的今天、当下、此时此刻。</p><p>事实上，所谓过去，不就是曾经流逝走过的今天吗？所谓未来，不就是当下的绵延持续吗？而所谓生命不就是每一个此时此刻的片段汇集而成的记忆���？所以尊重当下、珍惜现在，便是对我们整个人生的负责。</p><p>我们认清了死亡，再来看看活着的无限可能、无数飞跃，就会发现雪漠老师说的是极有道理的。他说:活着总比死了好，因为只有活着，你才能弥补这辈子的许多遗憾，改写生命中的许多错误。但是这一切的前提是，你必须拥有一颗强大且充满智慧的心灵。</p><p>因为，你对世界的认知是你心灵的显现，你所有行为也是你心灵的显现。我们要在肉体消失之前，完成自己该做的事情，甚至建立不朽的功德利益众生，以实现你最高的人生价值。</p><p>那么，如何修炼自己的心，让自己的行为不再急躁呢？雪漠老师说的好:我不想得到什么，也不急着死，那么就写点东西；交朋友也是这样，来了就珍惜他，反正也不急着去死，也不想绝交，那么就好好对他。修道也是这样，你时刻都要告诉自己，你又不是急着去死，不如放松了心，把心中那些功利、急躁的东西放下。<br></p><p>是啊！每次读了雪漠老师的书，总会让我那颗急躁的心一下变得安静下来了。这么着急干嘛呢？又不急着去死，又何必把自己逼得那么紧呢？</p><p>读一读雪漠老师的文章，感受一下他的情怀，体验一下他所站高度的境界，这样我们这些平凡的人也会拥有不平凡的世界。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 640px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 100.0%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"640\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2178738-3654558e5f3451d3.jpg\" data-original-width=\"640\" data-original-height=\"640\" data-original-format=\"image/jpeg\" data-original-filesize=\"168774\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div>\n          ', '2018/04/13 21:57', 155, 106, 286, 'https://upload-images.jianshu.io/upload_images/2178738-3654558e5f3451d3.jpg', ''),
('a44f0319e372', 20577003, '2c5a9afb90d8', '画之髓——作者:李冰倩', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 363px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 52.0%;\"></div>\n<div class=\"image-view\" data-width=\"1477\" data-height=\"768\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9835749-fa701d168723e8b2.jpg\" data-original-width=\"1477\" data-original-height=\"768\" data-original-format=\"image/jpeg\" data-original-filesize=\"122817\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p>画，如生之孕育，始之初。可平淡如涓涓细流，无任何突兀之感；也可怒似狂喜之情，醇而躁动不安；也可清薄犹如花瓣，在悠悠风中随遇而安；更可无端而起之饥渴，狂傲不羁却落停于五指之间。万种不同的源眼，有万种情留于心，而汇于手腕，经指尖之把控，髓于笔尖，染于万千材料之上。</p><p>有人说画分两种。一种具象，只为表达眼前之物；一种抽象，只为表达情之深切。</p><p>可难道具象之画，只是技巧之精妙，毫无任何情感，任何梦想可言？就算如此，那涓涓细流，早已孜孜不倦的从笔尖流于画上。又比如最无情感的工笔画，在选画之题材，画之构图，只是，那情早已随心，经脉，留于纸上，或是愤���嫉俗，或是清新淡雅���或只因物而趋炎附势，或是热情满满而禁于笔。都能在其画中，显露无疑。所以人之画不可能没有情之灵。</p><p>然抽象之画，也不会全是情感所造，技即经验，也是具之体，它的表达，则是一种情之再现。情何不具象，何不真切？虽在寒时，无法御其裹身而取暖，虽在饿时，无法吃下填于肚中。可你曾为情或说爱，立于寒风，让大风四溢刮乱你的发；或是，为这情而废寝忘食，直到前路日出升，方觉饿之饥已无法忍受。所以画必有技之躯，情之灵。躯与灵交融即为人之本，技之深与情之切才是画之初，画之始。</p><p>有始必有过程之艰辛，画之过程，有时只是始于一瞬之情的记录，而延续情之切很难。所以，只能在情感模仿下，不断重复。技之强者，不只是躯体的把握，而是在情的一次次重复上，不断深度，不断醇厚。这样画将不止于画面本身，更是绘画人与观看者，心与灵之共鸣，与生的再现。其即似于生，又无生之自由，虽可与心交流，却只有灵而无心。</p><p>所以无数艺术家，都将其作品作为生之子。一生在具象的世界中，追寻其躯之再现，久久不能停止。更有甚者愿放弃所欲，求之真是之本来面目，有人终身不明其人之做法。但对于这些不明者的纠结不清，其实本不就是一种执念吗？更可说是其人与这追求无悔的艺术家一样。只是艺术家在意的是画之本，而其人在乎的人之本。</p><p>人活着就有情之表，只是他们的表达技法不同，有人表情达意用嘴，有人用脸，有人用心，心之表达则可通其技染于画面，流传于时之尘。画之艰辛，不止于情感之模仿。更如瞎子看世界，虽只能了解片面，但却想用笔表达出心的交汇。比起瞎子他可能会更难，因为有着无数的外部社会影响着他的心理。</p><p>这可能带来的是他幸运的一次成功，但更多的则是心的不完全表达。可能你不了解，这种不完全表达对画的影响。但不能表达真切的新的作品，在作者眼里，这画就犹如他孕育着不他人之子，格格不入，没有任何意义。有时这幅作品的出生，可能还带着些许憎恨与埋怨。因此，要一个画家画出自己满意的作品很难，但只有不断在艰辛中摸索，才能带来自己满意的画作。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 294px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 42.13%;\"></div>\n<div class=\"image-view\" data-width=\"2136\" data-height=\"900\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9835749-ba88126ff6153a33.jpg\" data-original-width=\"2136\" data-original-height=\"900\" data-original-format=\"image/jpeg\" data-original-filesize=\"905538\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><br><p>有人认为天才是天之子，而他的画作则是上帝赋予的。但事实却是他们有强有力的心理去反抗外界之干扰。就像梵高，在他的世界里，他的画作不再是心里的表现，更是一种多于外界不理解的呐喊。他的呐喊终极一生，无人理解。但他不在乎，他在乎的则是心的表达，与表达他的反抗，就算在最后他疯狂的割下了自己的耳朵，他也不愿停下他的呐喊。那一颗颗诡异的向日葵是他的无奈与述说，那华美的夏夜星空是扭曲的心灵与他希望活在梦境的表达，最后什么都没得到，他不在乎，可对于色的揣摩，使他在混乱中，死去，而他的作品却因他的纠结而流传于世。</p><p>其实作为一位画家或是艺术家，他的忘我可能是他成功的关键。但忘我成功后结果的纠结���是一把双刃剑。你可能在技法上越挫越勇，但忘我的代价将使你失去自我，或是说再也回不了心之本我，即失去初心，可寻回初心，又是人生最难之事。于是就有了一些艺术家的一生只留下一幅画作，而此画即使传世之名作。而画本身就是画家呵护下的初心，他带来的生之孕育，才是一个作品的真切表达。</p><p>其实画不难画，只要表达真实之意即可，难的是一辈子疯狂而艰辛的继续表达，具象之画是以静制动，抽象之画，则是情感的不断剥离与提纯。两者的结果都一样，终极一生，成为是时之尘埃，流淌于艺术的血脉里，为后人给予指引。</p><p>具象：非所说的具象绘画，在本文中，指还原真实之画作。</p>\n          ', '2018/04/16 10:12', 15051, 173, 19257, 'https://upload-images.jianshu.io/upload_images/9835749-fa701d168723e8b2.jpg', ''),
('a64529b4ccf3', 4306614, '6e176873807c', '刘若英把《后来》拍成电影，你怎么看哭了？', '\n            <p><b>01</b></p><p>奶茶刘若英导演的处女作电影《后来的我们》已经发布了预告片，短短两分钟半，看哭了无数有故事的人。</p><p>电影讲述了一对北漂情侣的故事，方小晓和林见清相识于一列返乡的火车上。</p><p>方小晓丢了火车票，被林见清捡到了，两人的缘分由此开始。</p><p>那时候，他们还很朴素青涩，扛着大包小包，满怀着对未来的憧憬，来到北京打拼。</p><p>路上，方小晓从出租车里伸出头来大喊：“北京，你听到了吗？我们很快就发了！”</p><p>但他们并没有很快就发了，而是租住在破旧狭窄的出租屋隔间里，白天被领导骂的狗血淋头，晚上穷得吃泡面。</p><p>生活慢慢露出它残酷的一面，身处其中的人，不得不妥协作出改变。</p><p>每一对情侣，刚开始的时候都是甜蜜的。但现实太残酷，每个人都苦不堪言，转而对对方有了各种要求。</p><p>但当林见清终于变成方小晓想要的样子���，方小晓却已经不是���前的那个方小晓了。</p><p>从相爱，到互相敌对，再到彼此辜负，最后分离。</p><p>说不清是谁的错，但结果就是双方都伤痕累累。</p><p><b>明明很相爱，明明都在为对方而努力，但为什么最后就是不能好好在一起？</b></p><p></p><p>也许，成长就是明白了生活有时候真的很无奈。</p><p>等到他们在各自的世界里想清楚，该放下的放下，该坚持的坚持，如果那时候还能在一起，那就好好珍惜。</p><p></p><p>年少的时候，我们总是敏感多疑，爱跟对方较劲，对什么都较真。</p><p>而长大后你会知道，生活才是最大的敌人，<b>对待爱情，有时候要钝一点才会幸福</b>。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 618px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 96.56%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"618\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2090254-b0c1b0bee5a3fea8.jpg\" data-original-width=\"640\" data-original-height=\"618\" data-original-format=\"image/jpeg\" data-original-filesize=\"46086\"></div>\n</div>\n<div class=\"image-caption\">图片来自网络</div>\n</div><p><b>02</b></p><p>不得不说，刘若英对爱情的理解是深刻的，电影中，她对爱情的刻画，很打动人心。</p><p>《后来的我们》是刘若英导演的处女作。</p><p>有人说，第一部作品里，一定有自己的影子。</p><p>奶茶刘若英在这部电影里，又放进去自己人生的哪些影子呢？</p><p>提起奶茶，就绕不开<b>陈升</b>这个名字，他是她的恩师，也是她暗生情愫的人。</p><p>但可惜，君生我未生，刘若英出现时，陈升已为人夫。</p><p>那时的奶茶，还能勇敢地唱着《为爱痴狂》，她是真的想过，一直等着他啊。</p><p>2002年，陈升在台北举办演唱会。</p><p>演出结束后，刘若英走过来，站在陈升面前，当众问道：“你能给我一个拥抱吗？”</p><p>在无数歌迷面前，陈升最后也只是用手掌轻轻拍了拍刘若英的头，正如一个师父对待徒弟那样。</p><p>陈升能给刘若英的，只有事业上的倾力相助，然后看着她一路事业飞升，大放异彩。</p><p>在综艺节目《桃色蛋白质》中，主持人问道：“你喜欢刘若英吗？”</p><p>陈升坦白地说：“我当然喜欢她，否则我为什么为她做这么多事情。”</p><p>而后，陈升又说：“现在她像风筝，不知已经飘到什么地方？”</p><p>刘若英哭得像个孩子：“<b>你可以拉拉线啊，风筝的线永远在你手里。</b>”</p><p>陈升沉默后说道：“可是我找不到线了。”</p><p>后来的奶茶，结婚生子，过着自己想要的生活。只是在演唱会上唱起《后来》这首歌，她还是情不自禁流泪大哭。</p><p>后来</p><p>我总算学会了如何去爱</p><p>可惜你早已远去</p><p>消失在人海</p><p>后来终于在眼泪中明白</p><p>有些人一旦错过就不再</p><p>这首歌太像她自己的心境。</p><p>后来，我们没有在一起，我也过得很好，但我还是会忍不住想起你，想像着你如何回忆我，是笑着，还是只有沉默。</p><p><b>03</b></p><p>微博上有个话题：<b>知道深爱的人结婚了，你那一刻是什么感觉？</b></p><p>有人说，其实挺开心的，你这么优秀如果还不结婚就浪费了，真感谢���婚礼从不打算请我，不然我都不知道该借哪个帅哥去参加。</p><p>话说着，已泪流满面。</p><p>有人说，深秋的街头，她抱着孩子从我们当年常去的一家饭馆里出来，我愣在那里，她抬起头，四目相对。</p><p>我感觉像是自己错过了另一种人生。</p><p>有人说，最难过的，莫过于当你遇上一个特别的人，却明白永远不可能在一起，或迟或早，你不得不放弃。</p><p><b>真心喜欢过的人是没法做朋友的，哪怕再多看几眼，都还是想拥有。���从未放弃过爱你，只是从浓烈变得悄无声息。</b></p><p>还有人说，那天我早上六点起床，想着他应该去接新娘了，我默默吃了早饭，喝了点酒，强迫自己睡去。</p><p>晚上七点醒来，估计着他应该和亲戚喝酒要洞房了，我关了手机在陌生的大城市转悠了一个晚上，等到12点，心想终于熬过了这难熬的一天，然后蹲在马路上哭了。</p><p>几万条评论，几万个伤心的人。</p><p>佛曰，人有八苦，生、老、病、死、怨憎会、爱别离、求不得、五阴盛。</p><p><b>求而不得的爱，是谁都无法避免的苦。</b></p><p>所以，每个人都可以从《后来》中听出自己的故事，每个人也都可以从《后来》中品出自己的伤痛。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 696px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 64.44%;\"></div>\n<div class=\"image-view\" data-width=\"1080\" data-height=\"696\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2090254-4beb02b22aa89f06.jpg\" data-original-width=\"1080\" data-original-height=\"696\" data-original-format=\"image/jpeg\" data-original-filesize=\"65363\"></div>\n</div>\n<div class=\"image-caption\">图片来自网络</div>\n</div><p><b>04</b></p><p><b>有一则玄妙的佛教故事。<br></b></p><p>从前，有一座圆音寺，香火旺盛，受禅语熏陶，寺庙前横梁上的蜘蛛也有了佛性。</p><p>忽然有一天，佛祖光临圆音寺，见蜘蛛有灵性，便问它：“世间什么才是最珍贵的？”</p><p>蜘蛛答道：“我觉得最珍贵的是‘得不到’和‘已失去’。”</p><p>过了一千年，风吹来一滴甘露，蜘蛛见它晶莹剔透，顿生爱意，每日看着，异常开心。</p><p>但又刮了一阵风，把甘露吹走了，蜘蛛感到寂寞更甚从前。</p><p>这时，佛祖又来了，问蜘蛛：“世间什么才是最珍贵的？”</p><p>蜘蛛想着甘露，仍回答：“世间最珍贵的是‘得不到’和‘已失去’。”</p><p>佛祖便邀它去人间走一趟。</p><p>于是，蜘蛛投胎到一个官宦人家，成为一名富家小姐，名叫蛛儿。</p><p>蛛儿16岁时，见到新科状元甘鹿，为他倾倒。</p><p>她一心以为，这是佛祖为她安排的姻缘。</p><p>但最后，皇上下诏，赐婚新科状元甘鹿和长风公主，并命太子芝草和蛛儿完婚。</p><p>蛛儿一气之下绝食，性命垂危时，佛祖来了，告诉她：</p><p>甘露，本来就是风带来的，所以甘鹿是属于长风公主的，而太子芝草，是当年圆音寺门前的一颗小草，他爱慕了你三千年，你却从未看过他。</p><p>此时，蛛儿才顿悟，<b>世间最珍贵的不是“得不到”和”“已失去”，而是现在能把握的幸福。</b></p><p><b>很多人想要把前任追回来，并不是出于深爱，而是出于对“未完成”的感情的不甘心。</b></p><p>但你们之所以分手，一定是有无法解决的矛盾在其中。</p><p>强求复合的结果，很可能只是重蹈覆辙。</p><p></p><p><b>得不到的和已失去的，都不值得你恋恋不舍。有些情愫，放在心底，某年某月想起来，能会心一笑，就够了。</b></p><p><b>05</b></p><p><b>对待爱情的正确态度，应该是怎样的呢？<br></b></p><p>电视剧《老男孩》中，女主角林小欧曾经深爱着男朋友叶昕。</p><p>但当得知叶昕出轨后，林小欧特意飞到澳洲，费劲周折，见到叶昕，当面和他做了了结。</p><p>经过一段时间的沉湎之后，林小欧还是振作起来了，尽职尽责做一名好老师。</p><p>此时，男主角吴争和兄弟史非都喜欢上了林小欧，出于兄弟情义，吴争一直回避着自己对林小欧的感情。</p><p>而林小欧，明确拒绝了史非的追求，主动对吴争坦露心迹。</p><p>一次失恋，并没有让林小欧对爱情灰心，遇到喜欢的男人，她也敢于主动追求。</p><p>林小欧和吴争的感情遭到了父母的反对，面对阻碍，她既没有任凭父母安排，也没有跟父母闹决裂，而是创造机会，让双方互相了解，增进信任。</p><p>后来，吴争因为私人原因和林小欧分手，叶昕又回来了，趁虚而入，想让小欧回到他身边。</p><p>面对嘘寒问暖的叶昕，林小欧并没有因为一时的心软，而接受对方。</p><p>不管叶昕如何费尽心思取悦自己、如何讨好自己的爸妈，林小欧都很坚定，叶昕背叛过自己，<b>感情已经是过去式，两人再无可能</b>。</p><p>而自己的心里还有吴争，应该为这段感情，再做一次努力。</p><p><b>分手了就应该彻底分开，不留恋、不后悔。</b></p><p>喜欢的人还单身时，就勇敢去爱，不要让自己遗憾。</p><p>在一起时就应该好好珍惜，生活不易，彼此多一些���谅和包容。</p><p>每个人从成长到成熟都有一段过程。</p><p>最初的不成熟的、笨拙而鲁莽的爱情，常常无疾而终，却恰恰最让人刻骨铭心的。</p><p><b>听不懂《后来》的人是幸运的，因为他从来就没有遗憾，所以不懂其中的感伤。</b></p><p><b><br></b></p><p>作者：漫漫Chan，富书签约作者，我喜欢你，如鲸向海，似鸟投林。欢迎关注简书：漫漫Chan</p>\n          ', '2018/04/11 11:25', 2, 127, 249, 'https://upload-images.jianshu.io/upload_images/2090254-b0c1b0bee5a3fea8.jpg', ''),
('a77ce6dcd4c1', 8747457, 'fee4b4b0b89e', '比行动懒惰更可怕的是思维懒惰！', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 393px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"1280\" data-height=\"720\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4082943-96f89345b487e447.jpg\" data-original-width=\"1280\" data-original-height=\"720\" data-original-format=\"image/jpeg\" data-original-filesize=\"257160\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>01</b></p><p>跟一个朋友聊天。她提起工作中的烦心事：她在一家企业做人事，前两天因为一个流程疏忽，有一个应聘者入职没有两天就辞职了，但是单位已经给这位应聘者交了公积金的部分，他的突然辞职会给公司造成一定的经济损失。</p><p>上司平时对她就有些意见，这次借机大题小做，给的处罚是：如果这部分钱应聘者要不回来的话她将承担公司损失，记过一次，取消年终奖。顿时她觉得很委屈，干的不开心想辞职。</p><p>工作中总是会出现问题，当出现问题的时候关键是去解决，我帮她梳理，建议她就是通过法律途径或者其它渠道挽回损失。</p><p><b>对于跳槽，也问她一些问题：</b></p><blockquote>\n<p>适合不适合工作？</p>\n<p>如果不适合，为什么，是缺少工作能力还是业务不熟悉，还是人际障碍？</p>\n<p>如果适合，你能在这份工作中收获到什么，会不会有长远的提升？</p>\n<p>有没有工作中的榜样，他们成功的样子是什么样？</p>\n<p>在相同的岗位上，你在这家单位的经验积累能不能帮助你增值，如果你跳槽，拿着你的这份工作中项目经历去到市场衡量一下，是否能帮助你找到更好的工作？</p>\n</blockquote><p>如果你只是为了换环境跳槽，那么还是要去做类似工作，还是要面对同样的问题。</p><p><b>那种为跳槽而跳槽，那种让自己得不到提升的工作，就相当于一个旋转的陀螺，被工作鞭打着，但是还是在原地旋转。</b></p><p><b>不要因为逃避去换工作，而是因为成长去考虑跳槽。</b></p><p>所以我建议她考虑好这些问题。</p><p><b>02</b></p><p>上班好几年了，刚上班的时候，工作凭着一些热情，态度端正，但要不断试错。</p><p><b>后来发现，工作和学习都有方法论的，完全可以避免无谓的试错。</b></p><p>最近换了工作，换了领导，现在的领导很优秀，学生时代是学霸，本科读的中山大学，研究生读的是武汉大学。工作能力也很强，年纪轻轻就被提拔成为处级干部。我发现他有一个优点，<b>就是会在做任何事情之前先梳理思路。</b>接手一件工作不是忙着去做，而是给自己一段时间先去了解这份工作是什么？职责是什么？流程是什么？关键事项是什么？有没有政策的要求？然后会梳理出一个工作指引——类似说明书的东西，这份工作指引就算是不懂的人也能迅速的上手。他就是这样，工作前先梳理，看似浪费时间但是节省的是今后办事中重复损耗的时间。</p><p>其次，如果他没有时间去梳理，会让在这个岗位经验丰富的人去梳理，直接看工作指引了解工作如何去做。<b>做领导就是通过这种方式了解工作如何做的。</b></p><p>再次，他总是带着问题去看工作，去思考进而去找资料去请教人。这有点像我们在看书，<b>如果只是一味的翻书，那么可能知识点记不住，也起不到什么作用，但是我们带着问题去翻书找答案的时候就会发现读书的效率很高。</b></p><p><b>所以，我现在要求自己无论是学习还是工作先有方法论。</b>在遇到难题的时候去思考去找方法，比如把之前的案例找出来，请教别人工作指引，梳理出流程和需要准备的材料，严格按照方法论去做，虽然很笨但是不会出错返工。<b>有的时候“慢工出细活”，再进一步讲这就是我们干工作中常说的“脑勤”，再干一件事情之前先清楚再干。</b></p><p><b>很多时候我们盲干，费时费力效果不好，其实比起行动懒惰的更可怕的是思维上的懒惰。</b></p><p><b>03</b></p><p>最近看到一个知乎博主在一篇文章中提到的几个问题，问题发人深省：</p><blockquote>\n<p>“你现在的状态，付出和收入是否成正比？”</p>\n<p>“如果不是，你是否在损失眼前的收获，押注于未来的时间价值（深造、长线式学习）？”</p>\n<p>“如果没有，你是否正在做你喜欢的事情？”</p>\n<p>“如果不是，有没有可以改变现状的途径？”</p>\n</blockquote><p>作者说对大部分人来说，这种思考会带来一个非常痛苦的认知转变过程，你试着每天这么问自己几次，时间���了，肯定三观崩塌。</p><p><b>现在生活我们一直以来都在偷懒，逃避去思考现实的问题。</b></p><p>比如股票、基金、理财产品一概不知，</p><p>房价、地段、区位一窍不通，</p><p>灰色区域充耳不闻也没想着去了解过，</p><p>最擅长的事情就是进行一种简单的冬眠动物囤货式“自我提升累积”。</p><p><b>很多人都在假装努力，开始所谓的打卡，读书、运动、学英语但是并没有真正的提高。</b></p><p><b>每天只是心理安慰：哎呀，我今天又做了好多事情！可是事实上呢，你并没有任何的改变？</b></p><p>所以有一句话这样说<b>“你只是假装努力，但是生活不会陪你演戏”。</b></p><p>你真的是勤奋，但是你的低水平勤奋毫无价值，你真的是在忙，每天加班，但是你依旧是工作能力没有得到提升，原地踏步？你一心想来大城市，可是过了三年、五年甚至更久，别人都已经成长了许多但是你还如刚来的状态……</p><p><b>可能你行动不懒惰，但是思维懒惰，思维没有先于行动，凭着感觉做事，结果并无所成。</b></p><p><b>04</b></p><p><b>怎么克服思维懒惰呢？有几个方法分享给大家：</b></p><p><b>1.   </b><b>先去体验</b></p><p> 如果你想去做一件事情不知道应该怎么去做，不如让做的好的人带着你去体验，在体验的过程中告诉你方法或者带给你动力和思考。</p><p>比如你英语不好，可能是你对英语不感兴趣，可能没有学习的方法，可能还没有找到学习英语的动力，那么你可以跟着英语好的朋友带着你去一个英语沙龙，去认识一些外国朋友，体验一下与外国友人交流的乐趣。</p><p>特别是当你觉得欣赏一个金发美女，你想去认识，你肯定有动力去练习口语。</p><p>或者当你想去考雅思，这个时候有一次游学的体验，当你发现留学可以看到很多外面美好的事物，留学之后的那些年轻人能够找到更好的工作，认识很多优秀的志同道合的人，那么你也会开始有动力去思考学习英语，继而去学习。</p><p>如果你真的还不知道怎么学习，就报一个信得过的名师班，让她带着你去学习。</p><p><b>2.   把目标进行分解</b></p><p>我们思维的懒惰，因为有趋利避害的天性，对于复杂的事情，或者没有那么着急的事情都会选择的性回避。</p><p>所以我们可以把事情进行分解，找到一个切入点。</p><p>比如写一篇论文，经历过写作的人都知道很痛苦，要反复修改，但是你必须要思考如何去写，怎么去完成一篇高质量的文章，那么首先就要对任务进行分解，先选题、再列出框架、再找素材、先给出一整块的时间写出第一部分，接着第二部分，直至结尾。没事儿，先写出初稿就好。然后自己先看一遍进行修改，拿去征求意见，进行修改。</p><p>如果你一开始思考出的主题、框架比较完善的话，那么充实内容的工作就相对简单一些了。</p><p>做任何事情，我们畏难，都是正常的，那么就先分解，找出切入点，先走出第一步就好。</p><p><b>3.</b><b>设计出思路</b></p><p>某知乎博主说，一件事情，能够长久做下去，无非两个方法：</p><p><b>1）降低它的阻力；2）提高它的动力。</b></p><p>这是一个简单而又极其有效的分析方法，小到个人成长，大到行业趋势、国家政策、经济发展，都适用。</p><p>比如你想知识变现？</p><p><b>非得从年入百万开始吗？不一定，实际上达不到这种水平。</b></p><p>但是我们先可以开始把它降低成可以实现的小目标，你读一本书，读三遍，然后抽出其中的要义，输出成一个分享的PPT，那么这样你就具备了知识变现的一种能力，有知识输出。</p><p>接着你可以尝试组建一个小群或者朋友进行分享，做100+的知识分享，锤炼你的知识变现所要具备的表达能力。同时在这个过程，要有反馈，这帮助你打磨好分享，当你分享多了就更自信了，然后你可以再选择一些平台输���。</p><p>等着你输出多了，会逐渐形成自己的品牌，然后随着个人品牌不断打造，你会有更多的读者、支持者，他们有可能成为你的粉丝，当粉丝达到一定量，比如5万粉丝，10万粉丝甚至百万、千万粉丝的流量时，就可以变现了。</p><p>变现的方式，可以是课程分享，可以是出书，可以是自媒体广告合作，可以是咨询等等。</p><p><b>你会发现，当你克服思维的懒惰，并拥有很强的行动力、执行力，那么你再去做一件事情的时候，一切都变得轻巧、明亮、清晰、简单了起来。</b></p><p><b>我们都想高效能，都想成功，都想付出有回报，所以需要克服思维懒惰，找到方法论，刻意练习，反复打造的过程，坚持下去，会真的看到成长。加油！</b></p><p><b>自荐首页文章（阅读量上万、过千赞或评论多的文章）：<br></b></p><p><b><a href=\"https://www.jianshu.com/p/4d472cc5bd35\" target=\"_blank\">目标管理，如何制定一份高效的年度计划，实现开挂？</a><br></b></p><p><b><a href=\"https://www.jianshu.com/p/c0ec231fcf01\" target=\"_blank\">“我不是来工作的，是来生活的。”</a><br></b></p><p><b><a href=\"https://www.jianshu.com/p/e75c0138c5e3\" target=\"_blank\">你好，四月！时间可以浪费，人生不能！</a></b></p><p><a href=\"https://www.jianshu.com/p/1260632264bf\" target=\"_blank\">从0到坚持晨跑700天、8000多公里、瘦身40斤，跑步遇见更好的自己！</a></p><p><a href=\"https://www.jianshu.com/p/9563fc108490\" target=\"_blank\">1月再见，2月你好！自律的人生从走好每一步开始！</a></p><p><a href=\"https://www.jianshu.com/p/c530053f3e4b\" target=\"_blank\">从今天起，培养5个思维让你获益一生！</a></p><p><a href=\"https://www.jianshu.com/p/33093aa32812\" target=\"_blank\">四年前我离开500强去考公，过上了自己想要的生活！</a></p><p><a href=\"https://www.jianshu.com/p/054a3fb345a5\" target=\"_blank\">2017年，这个小习惯让我效率提升数倍，实现了90%的目标</a></p><p><a href=\"https://www.jianshu.com/p/0206cbbaf215\" target=\"_blank\">一个月瘦10斤、从中年大叔到追风少年，跑步还给我带来哪些改变？</a></p><p><a href=\"https://www.jianshu.com/p/646b4e60d7b9\" target=\"_blank\">2月再见，3月你好！请保持自己的节奏，努力向前冲！</a></p>\n          ', '2018/04/12 22:48', 181, 1012, 1602, 'https://upload-images.jianshu.io/upload_images/4082943-96f89345b487e447.jpg', ''),
('bb05e42c975f', 12270173, '778731a5f6fc', '也做一个书房梦', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 525px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.0%;\"></div>\n<div class=\"image-view\" data-width=\"4032\" data-height=\"3024\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5880188-d5a3f39df70d5ae0.jpg\" data-original-width=\"4032\" data-original-height=\"3024\" data-original-format=\"image/jpeg\" data-original-filesize=\"2508250\"></div>\n</div>\n<div class=\"image-caption\">书房</div>\n</div><p>近日读肖复兴的散文《书房梦》，读到他热烈的梦想和阑珊的意兴时，脑子里便有许多的影像纷至沓来。<br></p><p>在电视里看过李敖的书房。高大明亮宽敞的一间屋子，中间一张极大的书桌，除了向阳的落地玻璃窗外，其余处处是书，直达天花板。李敖便坐在这书的森林里，接受鲁豫的采访，那么从容，那么稳健。如今，李敖已然离开，不知道，他的这间书房，是否也会随他一起消逝在我们的视野里。总归，他的书、他的风姿都是会留下的。</p><p>在书上看���冉云飞的书房。看不出书房的全貌，只看得到桌上地上全是书，甚至没有可以插脚的地方，真真乱七八糟、毫无章法。可我知道，对于冉先生来说，再不会有比这种杂乱更有规律的了。若是有人去好好拾掇了，他必定要哀叹甚而恼怒了。我还可以想象，扎在书堆里的那个身影，该是如何的沉静、安宁而又蕴藉着无穷的力量。</p><p>大学时去过一位老师家里。老师家房子不大，客厅即是书房，一张小小的沙发，沙发对面是一堵书墙。老师坐在书墙下的书桌旁，告诉我，这里该怎么写，那里该如何改。那是我毕业论文的第三稿了。老师悉心指导我的同时，他十来岁的女儿坐在沙发上，一直捧着一本书。老师沉稳的教导，我浅白的疑问，做了她模糊的背景。</p><p>博尔赫斯说，天堂的样子，就是图书馆的样子。这些人，他们都建造了自己独一无二的天堂。</p><p>父亲也是老师，还是我的初三语文老师。他没有书房，只有一个书橱。书橱不大，却是我的图书馆。父亲书橱的下层，有我小时候就爱看的《民间文学》《小小说选刊》《中篇小说选刊》；上层，有一套《红楼梦》，一本《红楼梦诗词赏析》……还有属于我和妹妹的《童话大王》《少年文艺》《皮皮鲁和鲁西西》《舒克贝塔历险记》……</p><p>我的初中班主任说我：别看你爸看的那些书了，小小年纪，老气横秋。老师错了，老气横秋的那个女孩儿，从来都不是我，便是如今，我的心里，也还住着一个小姑娘，一个爱幻想爱做梦的小姑娘。因为，我是看瑰丽的民间文学，看奇幻的童话长大的啊。</p><p>父亲应该也是有他的书房梦的，只是，那些年，他的那间书房，一直是爷爷奶奶，或者是我和妹妹的卧室。奶奶爷爷相继逝去，我和妹妹也先后离家。父亲终是有自己的书房了，可这时候，他也退休了。退休后，他和母亲便离开了老家。如今，妹妹家的餐桌，就是父亲的书桌。他的电脑，总是在吃饭之前，被挪到旁边的柜子上。</p><p>我自然也有我的书房梦。从第一本彩色连环画《哪吒闹海》开始，我慢慢有了不少单属于自己的书。最初是把书放在床头；再是把书桌上堆不下的书放在纸盒箱子里；再是和夫一起带着一箱箱的书从南到北再到南；再是购置了一个胡桃木色、一个原木色的书柜；再是一间书房、一面书墙，每间房子里都有一个书橱，沙发背后也藏一个书柜……终是完全没地方安置了，床头、茶几上、甚至卫生间的抽屉里，哪哪都有书的影子。</p><p>到底是房子不够大，越来越没地方放书了。于是，我和夫又开始做另一个书房梦了：一间向阳的大房间，一张餐桌一般的大书桌，三面高高的书墙，一面落地玻璃……</p><p><br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\n<div class=\"image-view\" data-width=\"3024\" data-height=\"4032\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5880188-c1ca1183ec259c3f.jpg\" data-original-width=\"3024\" data-original-height=\"4032\" data-original-format=\"image/jpeg\" data-original-filesize=\"2767004\"></div>\n</div>\n<div class=\"image-caption\">我的</div>\n</div><p>现在的房子里，书房的书墙上，更多的是夫的书；女儿房间里的书柜，自然是她自己的；我的书柜是沙发背后藏着的那个。我和夫仔细量了尺寸，设计了一个两层四格的小书柜。不叫它影响客厅的整体效果，又可以让我躺在摇椅上，躺在我的花草们中间，随手拿到自己喜欢的书。<br></p><p>夫说，你那些“上不得台面”的书，就藏那儿吧。当是小时候的习惯所致���那个言情和武侠风靡的年代，我跟着同学读了太多的琼瑶金庸席绢古龙。柔情和侠骨，根植在了我的骨子里。这么大年纪了，我仍旧爱在百无聊赖的时候看言情看武侠看侦探。这个书柜里，有一套《后宫·甄嬛传》，一套《金庸全集》，一套《福尔摩斯探案全集》。</p><p>女儿小的时候，我跟她一起看“彩乌鸦系列”，看《奥林匹斯星传》；女儿长大了，也跟着我一起读《福尔摩斯探案全集》，读《论语》《庄子》。虽说看书该有所选择，但书从不会教坏人，除非人自己想变坏。</p><p>书越买越多，越来越没地方安放，可叫我难以启齿的是，我读书的时间却是越来越少。理由总归是有的，但还是不找了吧。</p><p>我也问自己，买那么多书，读得过来吗？读不过来，真的读不过来。好些书都不过是刚买回来时浏览过而已，真感兴趣的，快速翻一遍过后一读再读；不对胃口的，放下了也便再也不会去拿起。可还是要买，不甘心错过。买了，兴许那天就顺手拿起来读了；不买，也就永远都没有遇见的可能。遇见一本喜欢的书，比碰上一个对脾胃的朋友的几率是大得多的。朋友可遇不可求，书却是花一点钱就可以买回来的，何乐不为？哪怕仅仅是买回来放在那里。只要放在那里了，它就会一直静静地等着，在我需要它的任何时候。</p><p>买了回来，总会有地方放的。大大的书房梦还是可以继续做的，并且不妨一直做下去。</p><p> <br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 700px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 100.0%;\"></div>\n<div class=\"image-view\" data-width=\"3024\" data-height=\"3024\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5880188-ccc49400940c195c.jpg\" data-original-width=\"3024\" data-original-height=\"3024\" data-original-format=\"image/jpeg\" data-original-filesize=\"1581290\"></div>\n</div>\n<div class=\"image-caption\">面朝阳光</div>\n</div>\n          ', '2018/04/14 10:39', 176, 14, 225, 'https://upload-images.jianshu.io/upload_images/5880188-d5a3f39df70d5ae0.jpg', '');
INSERT INTO `larticle` (`Xaid`, `Psid`, `Vaccount`, `Dtitle`, `Tcontent`, `Rdate`, `Klike`, `Wcomment`, `Oread`, `Kpicture`, `Vlabel`) VALUES
('bdc92008e4b8', 12987778, 'dbb14da93531', '那一场苏州之旅，从此魂牵梦绕（下）', '\n            <p>苏州之旅，我遇见了你们，开启了一场文字盛宴，虽然时光短暂，可记忆永不褪散。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 529px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.63%;\"></div>\n<div class=\"image-view\" data-width=\"1428\" data-height=\"1080\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5901395-2c3c463fe1cfbd1d.jpg\" data-original-width=\"1428\" data-original-height=\"1080\" data-original-format=\"image/jpeg\" data-original-filesize=\"1225127\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><p>参与人员：蒋老师、蓝胖说说、王小玲、齐梅齐、李 娟、李老师、邹 治、王 磊、与 秋、柳 锡、雪 梅、小 隐、齐帆齐、别山举水、一河漪沫、一 格、唐晓燕、王新琴、张 婧、齐梅齐女儿丫丫、齐帆齐女儿刘佩瑶、成秋菊、刘 静、谢梦。</p><p>这场聚会中，我们都来自各个城市，其中最远的当属���老师，他从河北邯郸而来，坐了近17个小时的火车，我们这里有60后、70后、80后、90后，00后，其中年纪最大的人还属李老师，这是何等的热爱和执著，另他不远千里颠簸至苏州，只为和我们这群文友相聚。</p><p>李老师，他是大山里的教师，教孩子们知识，点亮他们的人生，初见李老师，他穿着质朴，面带微笑，和蔼可亲，6月7日上午，张婧姐和与秋姐去接了李老师，下午，我和邹治、别山举水老师、李老师在一起聊天，我看李老师面带倦容，我想让他去沙发休息会，他说不困，觉留着晚上睡，便接着和别山举水老师交流……</p><p>在6月7日上午的交流上，我们二十多人分别做了简单的自我介绍。</p><p>每个人可能都有一段经历或者苦难，有人选择隐藏起来，有人选择释放出来，有些经历会给人力量使人成长。印象深刻的是张婧姐姐，她是苏州本地人，也是一位坚强的母亲，孩子身体很不好，听她说那些艰难的过程时，眼睛里闪着泪光，我低着头努力不去看她，我怕会泪流不止。</p><p>她人特别好，也很客气，晚上我们一起坐在徐总的车上，她说小沫妹妹，你的性格真好，我很喜欢你，希望下次再聚。而我想对她说，张婧姐姐，一切都会好起来，你要好好的，我也期待下次相聚，到时带上宝贝一起……</p><p>有时候，我想上天给人设置一些苦难，就是为了让你变得更好！交流会上，一格说，她曾经患有抑郁，这个抑郁症是非常恐怖的，我也听说过。好在，一格用画画让自己变得开心，变得优秀，慢慢地摆脱抑郁，以前只是齐齐老师的群里和她简单聊过，见面后，发现她不仅会画画，还是一位大美女，最重要她通过画画让自己的生活变得非常好，她和我的一个朋友超级像，我要赖上你，也向你学习……</p><p>有人说，看我的文字觉得我很淑女，其实生活中，我活泼开朗，如果再喝点红酒，那就完了，完全成一首歌，总会不着调。</p><p>我想4月6日晚，我可能出丑了。这得怨邹治，这个自称风雨中奔跑的大叔，其实是个93年的小哥哥，因我喊齐梅齐姐姐他们吃饭，用手大力拍门，被他见到，他说要告诉别人一河漪沫粗鲁（尴尬），于是餐桌上，他说喝红酒，本来想着不喝，听他一番道理和恐吓，自己一想，敬蒋老师和齐帆齐老师，用牛奶确实有点���合适，于是我喝了一杯红酒，然后不知道怎么竟然唱起了黄梅戏（捂脸），也不知道怎么地他当了我弟弟（赚了），好想知道那天我有没有说胡话？</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 549px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 78.51%;\"></div>\n<div class=\"image-view\" data-width=\"1340\" data-height=\"1052\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5901395-91dd69d0d06282d5.jpg\" data-original-width=\"1340\" data-original-height=\"1052\" data-original-format=\"image/jpeg\" data-original-filesize=\"972614\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>邹治的口才非常好，在交流会上，他担任主持人，一字一句有力道，但也有磁性，直播间里有人说，这个主持人小哥哥的声音听了耳朵会怀孕，哈哈哈。</p><p>后来在阳澄湖岸边，我和蒋老师拍照，他也一起过来搀着我的手臂，拍了合照，他很努力，也有目标，执行力强，我知道他一定会成功！</p><p>常听人说 ，喜欢散文的人都特别的安静，温柔如水。从作家与秋姐姐和作家小隐身上，我完全感受到了，那是一种很静地美，言谈举止都非常优雅，交流会上，与秋姐姐做了简单的自我介绍后，送我们每人一本散文集《简单爱》，值得细细去读。小隐是位江南姑娘，会古筝、会写文，我是从齐帆齐老师的文章中知道她的，她也出了书，期待她更多更美的文字。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 426px; max-height: 537px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 126.05999999999999%;\"></div>\n<div class=\"image-view\" data-width=\"426\" data-height=\"537\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5901395-52ee3d02525df9d6.png\" data-original-width=\"426\" data-original-height=\"537\" data-original-format=\"image/png\" data-original-filesize=\"598954\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>之前从齐帆齐写作群认识了刘静，她是一位警花，认识了很久了，虽然第一次见面，但我这个人有些算来熟，叫她静静，她长的很漂亮，可她老说自己胖要减肥（谦虚），她的文字写的非常好，还得过奖，特别厉害！</p><p>她特别爱学习，得知我开了PS课程，毫不犹豫也报名了，她说要留着慢慢学，因为我的一首黄梅戏，她这几天都不听歌了，一直在听戏（哈哈），这是中了我的毒呀，期待你来合肥，我为你解毒……</p><p>还有雪梅姐姐，我们是老乡，之前在网上很少聊天，苏州之行一见如故，我们的老家相距不远，都喜欢文字，都喜欢黄梅戏，在阳澄湖岸边，我们一起合唱了《天仙配》选段，她声音婉转，身段优美，现在在上海工作，苏州一别，期待下次再聚，共谈文字，共唱黄梅……</p><p>还有唐晓燕，只闻其名时以为是女生，见面之后才知道是一位帅哥，苏州本地人，4月7日他是开车过来的，为人非常热心，载我们四处观赏。他是企业高管，却依然不断学习，报了齐帆齐老师的写作课，在车上我们闲聊时，他说知道我在简书开了课程，他想学PS，后来加了人才发现不对，因没有联系方式没有报名，见面之后直接报名了我的课程，愿我们亦师亦友，互相学习……</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 525px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.05%;\"></div>\n<div class=\"image-view\" data-width=\"3912\" data-height=\"2936\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5901395-936bd37e77c622e3.jpg\" data-original-width=\"3912\" data-original-height=\"2936\" data-original-format=\"image/jpeg\" data-original-filesize=\"4606340\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>还有蓝胖说说，之前在简书经常看到他的文章，是历史文类的签约作者，文章写得特别好，只是没有聊过，见面后发现他真是博学，懂的非常多，向他学习……</p><p>还有柳锡，也是从齐帆齐写作群相识的，之前聊的不多，见面才知识他是做淘宝设计的，我们算是同行，她一位文静的美女，也开始喜欢黄梅戏，她说听了一夜戏曲，越听越嗨（哈哈）有机会一定要来安徽哦，管听够……</p><p>还有齐梅齐，她是齐帆齐老师的妹妹，我们在合肥南站相见后，就感觉特别亲切，我开始叫她二姐，她非常的漂亮且温柔，她是美食达人，经常朋友圈都会看到她发的美食图，简直是诱惑。聚会全程她帮我们拍了好多照片，因为我们离得近，以后可以常聚啦。</p><p>还有王小玲，她是齐梅齐的朋友，是做扶贫工作的，她也非常漂亮，还很温柔，更厉害的是她还会跳孔雀舞，非常柔美惊艳，希望以后有机会见她现场展示一段。</p><p>还有李娟，也是从齐帆齐写作群相识的，之前聊的不多，见面聊的很投机，李娟也是一位美女，从昆山来到苏州，路途虽短也经历了一些小插曲，好在最后我们终相聚……</p><p>还有很多的朋友，感恩遇见你们，因为有你们，这一场苏州之旅，变得特别有意义，也让我从此魂牵梦绕！</p><hr><h4><b>我的PS零基础入门课程正在热招中……</b></h4><h4><b>报名戳这里：</b></h4><h4><b><a href=\"https://www.jianshu.com/p/2f70c4c1562d\" target=\"_blank\">PS零基础入门课程 | 图文排版，让你文章更有可读性！</a></b></h4><p>报名方式：加我的微信：momo911025，备注“PS”，提供付款截图记录即可入群。</p>\n          ', '2018/04/11 20:24', 17, 11, 32, 'https://upload-images.jianshu.io/upload_images/5901395-2c3c463fe1cfbd1d.jpg', ''),
('bdcf548cd4be', 13507975, '98a3b5fc6851', '扎克伯格和44位议员，一场5小时的交锋', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 690px; max-height: 433px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 62.74999999999999%;\"></div>\n<div class=\"image-view\" data-width=\"690\" data-height=\"433\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6486956-53f44d425a4f8cde\" data-original-width=\"690\" data-original-height=\"433\" data-original-format=\"image/jpeg\" data-original-filesize=\"57869\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>如果不了解Facebook泄露门始末的读者，我简单说说大致背景：</p><p>一家名为“剑桥分析”的公司被曝以不正当方式获取8700万脸书用户数据，并被质疑用来影响2016年的美国总统选举。</p><p>今天，正是扎克伯格出席众议院听证会的日子，接受44名参议员质询。以往的扎克伯格，都是穿着由团队设计的亲民形象：灰色T恤+牛仔裤+拖鞋的搭配，甚至就这样去见投资人。</p><p>显然这个服饰搭配很成功，成功塑造出一个接地气的邻家大哥哥，让西方人更乐意信赖小扎，至少泄露门没出来之前是这样的。</p><p>这一次听证会，他穿着深蓝色西装，系着领带，表情很严肃，对听证会十分得重视。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 525px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.0%;\"></div>\n<div class=\"image-view\" data-width=\"1080\" data-height=\"810\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6486956-d3c3c419d79aa812\" data-original-width=\"1080\" data-original-height=\"810\" data-original-format=\"image/jpeg\" data-original-filesize=\"112718\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>这场听证会，扎克伯格成功演示了什么是教科书级别的公关。</p><p>在开场陈述时，有个议员针锋相对：「<b>如果你们和其他社交媒体企业不能规范自己的行为，那么我们谁都没有隐私可言。</b>」</p><p>扎克伯格念证词时，说道：「我创建了Facebook，我运营着这家公司，无论发生什么事情都应该由我来承担责任。」</p><p>小扎的信号很明显，他必须要将Facobook所有的错误归于自己，如此一来，才能让Facebook摆脱在大众的���质印象，走出困境。</p><p>有参议员问：「Facobook早在2015年就得知用户信息被非法泄露，但却未告知用户，是否有违道义责任？」</p><p>这种问题很难回答，一答错就会成为被攻击的把柄，小扎避重就轻：「公司认为数据被删除，事情就已经结束了，因此没向联邦贸易委员会汇报。」</p><p>后来小扎还补充一句：「我们未能全面审视自己的责任，这是一个巨大的错误。」</p><p>有参议员质问：「从Facebook成立之初到现在，这14年里，你一直在道歉，让我们怎么相信你，今天你还有什么不同的道歉？」</p><p>小扎的回答很巧妙，回避了对方的尖锐质疑，阐述了自己从宿舍建立Facebook，到发展成20亿用户的大公司，一路艰辛走来，不犯错误是非常难的，但只有犯错就会立刻改正。</p><p>对于其他参议员的提问，小扎能从容应答，但他最不愿看到针对Facebook的反垄断调查，因为到目前为止，脸书没有一个真正的竞争对手，中国的微博并不算。</p><p>当其中一位参议员抓住反垄断这点不放时，小扎的言辞比较谨慎，变得犹豫起来。</p><p>参议员：「你最大的竞争对手是谁？」 </p><p>小扎：「我们有许多竞争对手。」</p><p>参议员：「谁最大？」</p><p>小扎：「我认为...类别上讲...你只要一个么？不确定能给出一个，但可以给你一堆。主要有三类，我会关注的，第一类是其他技术平台：谷歌，苹果，亚马逊，微软等......」</p><p>参议员适时打断：「他们跟你们提供一样的服务么？如果我买辆福特不喜欢，我可以买雪佛兰。但我不爽Facebook，我可以选什么？！</p><p>小扎：「我刚刚要谈的第二种类别是......」</p><p>参议员：「我没有要谈类别，我在说真正的竞争者，因为车辆厂商有许多竞争者，如果他们的车出了问题，全世界都会知道，人们就不买他们家了，买别家。私人企业中，是否有除了facebook的其他选择？」</p><p>小扎：「是的，美国人平均使用8种App，来跟朋友交流，与其他人保持联系，从短信APP，到邮件......」</p><p>参议员：「我说的是你们相近的业务，比如Twitter？」</p><p>小扎：「额，是的，Twitter在某些方面和我们功能相近。」</p><p>参议员：「你不认为你们已经垄断了？」</p><p>小扎：「对我来说，没有这个感觉。」</p><p>看完正常听证会，我明显能看出来，场上的许多参议员确实一点都不专业，他们不懂技术，更不想去了解，抓住的一些细枝末节并不能真正戳到Facebook的软肋。</p><p>当然也不是所有参议员都会针对Facebook，比如有个参议员想替小扎说回公道话，自言自语：</p><p>「多好的故事啊。Facebook从大学宿舍一路走到现在的全球巨头，这个梦只会在美国实现。如果在中国，你是做不出这种传奇般的创业成就的，是吧？」</p><p>小扎显然没领悟到他的意思，又或者是为了迎合中国用户，一脸耿直地说：「其实中国也有很多厉害的互联网公司！」</p><p>参议员笑着说：「对这个问题。你本该直接回答‘没错啊’......总之答案就是‘没错’。」</p><p>听证会有两场，第一场听证会对于Facebook来说是一次小小的胜利。</p><p>我在微博上看许多人留言说心疼小扎，在一众政治大佬面前，他很像一只柔弱的小白兔。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 860px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 122.9%;\"></div>\n<div class=\"image-view\" data-width=\"1000\" data-height=\"1229\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6486956-3c37d0823f01654d\" data-original-width=\"1000\" data-original-height=\"1229\" data-original-format=\"image/jpeg\" data-original-filesize=\"177476\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>但小扎还真的没那么脆弱，Facebook专门聘请专家对小扎进行专项训练，来应对各种问题以及被打断的情况。</p><p>整整5个小时，小扎的回答滴水不漏，字句清晰，十分规范和专业，再加上态度诚恳，让投资人很满意。</p><p>这直接体现在Facebook的估价，上涨了4.5%，并创下近两年以来的单日最大涨幅。</p><p>此前有参议员提出一个疑问：「不向用户收费，你如何保持业务长期进行下去？」</p><p>小扎直接坦言：「参议员，我们靠经营广告赚钱。」</p><p>即使在第二场听证会中，委员询问：「为保护用户隐私，你们是否愿意改变商业模式？」</p><p>小扎的内心估计是极度抗拒：「我不知道该怎么回答这个问题。」</p><p>小扎给Facebook定义为科技公司，而不是媒体公司，但是利用用户信息本就不可避免，而广告是利用用户信息定向推送。</p><p>也有参议员直接反驳：「我是不是要给你钱，Facebook才能不泄露自己的信息？」</p><p>小扎停顿了几秒，开始阐述一个简单的事实：<b>人们并不讨厌广告，人们只是讨厌不相干的广告。</b></p><p>当然，今天我看新闻时，Facebook的COO表示：如果你不想看到这些广告，可能会向你收费（会员）</p><p>如果要我评价小扎，他确实是一个很有城府的青年人，时刻懂得营销和包装自己，和我们的马老板一模一样。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 676px; max-height: 450px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.57%;\"></div>\n<div class=\"image-view\" data-width=\"676\" data-height=\"450\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6486956-a4239f78b76a66ce\" data-original-width=\"676\" data-original-height=\"450\" data-original-format=\"image/jpeg\" data-original-filesize=\"45955\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>听证会外面架起一百个扎克伯格的靶子，人们并不买账</p><p>再回到我们国内，微博作为中国的Facobook，百度作为中国的谷歌，淘宝作为中国的亚马逊，这类公司对用户隐私的使用同样不可避免。</p><p>前段时间，李彦宏说中国人对于隐私问题更加开放，这句没有前因后果的话，加上百度“劣迹斑斑”的历史，容易被人过度解读。</p><p>但我写这篇文章，并非批判国内的众多的大数据公司如何作恶，也不是为了证明外国人更注重隐私权。</p><p>相反，其实国人同样注重隐私，只是我们没有找到一个真正能为之发声抗议的有效渠道，并渐渐地被各种快消娱乐内容所蒙蔽。</p><p>最重要的一点，国人对大数据公司失去对抗的信心，变得麻木起来。</p>\n          ', '2018/04/12 10:03', 1888, 1172, 2754, 'https://upload-images.jianshu.io/upload_images/6486956-53f44d425a4f8cde', ''),
('be0c740423e6', 12320117, '8c55431ed909', '我采访了13个90后同龄人，他们现在混得怎么样了', '\n            <blockquote><p>最近有一个词在网上引起关注——“同龄人”，事情源于美团收购摩拜，82年的摩拜创始人胡玮炜因此套现15亿，这个80后的美女，一定程度上将她的同龄人远远地甩在了后面。</p></blockquote><p>其实那些人只是极个别，不过这件事却引起了我对同龄人们的好奇。</p><p>有人说，人到25岁是一个分水岭，所以去采访了一些我身边与我一样的90后同龄人，25岁左右的他们，现在都怎样了。</p><p>长文预警，但每个人都有他们普通却又独特的地方。</p><h4>先说我自己：</h4><p>蔡小卿Yoki 92年出生，一个热爱旅行摄影的互联网工作者。</p><p>4年前某211院校工科毕业，在某国企做了一年冰淇淋工程师，起始工资3500，工作比较开心，一年后跳槽互联网，起始工资翻倍，痛并快乐着，感觉成长很快，不定期涨薪，两年后每月1w+，辞职出去浪了几个月，做了一���旅行摄影的自媒体账号(旅行摄影志)，没做起来，佛系更新，不过申请了去哪儿的试睡员和微博的旅游博主。</p><p>现在回湖南在长沙继续做互联网，但在职业生活之外似乎开启了一些新世界，现在兼任简书摄影专题的编辑，义务劳动，同时在帮一个学长的户外旅行俱乐部做推广（后文有他），偶尔还是会出去旅行、拍照。</p><p>贷款在长沙买了一个小公寓，余下大概不到两万块钱。</p><p>最喜欢的几个app 网易云音乐算一个，<b>曾经想此生应该找一个如网易云音乐一样的对象，懂你，且有惊喜</b>。</p><p>想今年去一趟摩洛哥，看看三毛待过的沙漠。还有<b>感觉今年可以干一些什么了不起的事，虽然我自己也不知道会是什么事。</b></p><blockquote><p><b>以下是我对身边一些朋友的采访</b></p></blockquote><h4>1.Punny （10w+作者，江湖人称：社会婷）</h4><p>92年本科毕业，刚毕业在郑州，后来去了杭州，今年刚到成都。</p><p>新闻学专业，一直在媒体行业，从纸媒大河报，到政府部门的内宣外宣，再到网站，最后入了自媒体的坑，追着风头每个月差不多都能出10w+阅读的文章，也因此认识了很多圈子内的人。目前薪资15K左右，日常喜欢旅游，到处逛逛，发掘人少景美的地方。</p><p>最常用的app，微信……因为工作，支付宝……因为生存，淘宝……因为剁手，ins，超级星饭团……因为追星，Bilibili ……因为下饭（看到这里的我笑了哈哈哈哈下饭神器）</p><p>现在的生活吧…觉得还可以再努力一些，因为<b>离家比较远，家人朋友都不能常见面，一直独居，所以其实挺没生活的，最近养了只猫，感觉接地气儿了一点</b>。</p><p>感情其实挺多但都集中在大学毕业前，毕业后只经历了一段恋爱，但也很短，两个月就分开了，现在已经单身两年了，以前是既然有好感那就在一起呀，现在是压根就很少能对某人产生好感（捂脸）<b>超想恋爱，但不想结婚</b>，新鲜期太短了，不管是对人还是对事物，一般就一年，很难会有长长久久的感觉。</p><p>现阶段最大的愿望就是父母身体都能健健康康的，这样自己不在他们身边也就放心很多。</p><p>（我认识Punny的时候她是广告圈很有名的账号social markerting里面经常十万加的作者，很喜欢她对于广告中人性的观察，现在她也在做自己的公众号：社会婷）<br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.7%;\"></div>\n<div class=\"image-view\" data-width=\"1078\" data-height=\"719\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5921503-bec8e8e96a4a1f85.jpg\" data-original-width=\"1078\" data-original-height=\"719\" data-original-format=\"image/jpeg\" data-original-filesize=\"377328\"></div>\n</div>\n<div class=\"image-caption\">社会婷</div>\n</div><p>2.死党坑坑 化工硕士毕业做设计<br></p><p>93年出生的可爱小姐姐，研究生老阿姨。</p><p>现在在北京，男朋友亲闺蜜都在这座城市，也不是追求梦想努力奋斗这种原因一定要留在首都，就是机缘巧合到了这里，然后生活，没有一定要归属的地方，<b>只要能舒舒服服，和喜欢的人在一起就很开心</b>。</p><p>我是个半路出家的设计师，想做设计的原因就是想要生活过得更浪漫哈哈。我现在依然乐在其中。第一份工作到手只有4500，有时候请几天假，第二个月就只能吃土（无辜脸）。我想成为一个厉害的设计师喔。希望未来的自己能看到，并且做到了哦。要一直努力。嗯。</p><p><b>坚持最久的游戏只有消消乐，真的，我朋友都很佩服我，1088关了。</b></p><p>至于生活，我不会强求要怎样，每天能回到自己的小窝就很开心。但是会焦虑吧，间歇性的，<b>就是那种看到周围的人很厉害很厉害就忍不住羡慕，但生活是自己的，任何人的道路都是无法复制的嘛，慢慢来</b>，这是我对自己说的话。</p><p>最后说一下吧，偶像练习生结束了，但我还是好想每天看到“长得俊”cp哦，加油！越努力，越幸运。</p><p><br></p><h4>3.我某大学同学，卖房小青年</h4><p>1991的男生，现居苏州，即将结婚，<b>勤奋但不奋进的卖房小青年一枚，年收入50万左右</b>。日常娱乐生活以看电影、玩手游为主，平时常看的是IT之家、汽车之家、什么值得买之类的。</p><p>对目前的生活满意，今年的愿望是换个车。</p><p>第一个采访对象，是我大学同学也是很好的朋友，可能是我还没把我的例子给他看，也可能是他的语言就是言简意赅，哈哈，至少在收入上碾压我了 。</p><p><br></p><h4>4.小民不自闭 ——网不红的网红</h4><p>24岁单身男青年，<b>做性教育的业余摄影师，数学系转心理系的戏剧爱好者。</b>从没在外生活过的上海土著。</p><p>2年前一直为进入互联网行业做着各种准备，直到那天晚上，看了一个短视频，觉得片尾的女孩儿很酷，决定加入这个团队。</p><p>对，我们是做性教育短视频的。如今<b>不出所料地做着很cool的事情，说着想说的话，有着百万的粉丝，更重要的是得到了认可。</b>这一年让许多人了解了他们该知道的知识，探讨了他们该思考的问题，当然也为此牺牲了很多形象。之后会探索新的自己，新的领域。</p><p>最近谈了一部戏剧，去做演员，成功的话，会全国巡演吧。之后想做摄影师，拍广告，演电影。日常的生活就是旅游，对，一个月一次的频率连自己都害怕。不过做创意的，总需要新鲜感，有时间想做一个特别的旅游博主。</p><p>最近常用的app是第五人格，好吧是一个游戏，喜欢那种刺激感，生活也该是这样。</p><p>今年会干一些新的事情，未来至少有五种身份。<b>以前觉得什么都做不好，现在觉得没什么做不到。</b></p><p>应他的要求宣传一波他：小民不自闭，小民本人超帅，不信可以去看他微博，不帅回来打我</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 465px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.57%;\"></div>\n<div class=\"image-view\" data-width=\"1343\" data-height=\"894\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5921503-0eede43d117711f8.jpg\" data-original-width=\"1343\" data-original-height=\"894\" data-original-format=\"image/jpeg\" data-original-filesize=\"334078\"></div>\n</div>\n<div class=\"image-caption\">小民不自闭</div>\n</div><h4>5.孙大猫叔叔 初中毕业打天下<br>\n</h4><p>15-16 岁 （苏州）干机械厂里搬了1年铁块 去毛刺 钳工 的 500月薪</p><p>16-17 岁 （苏州）传菜员 保安 摆地摊卖袜饰品 送牛奶 理发洗头 修汽车 都在1K左右</p><p>17-18岁 （家乡） 影楼里面学PS 1年没工资，第2年 300月薪</p><p>18 - 20岁 （苏州 杭州 南京 ）正式影楼修图的，1500月薪左右</p><p>21-23 （2年 北漂 北京）影楼修图的 ，后自学转平面设计，都在4000月薪左右</p><p>23-24 （ 上海 ）淘宝天猫美工负责摄影和设计 4800月薪左右</p><p>24-至今 （上海） 正规中型公司 担任公司美工技术支撑，6000月薪左右</p><p>（私下创业中.... 因为是技术员，所以自己做无障碍，目前还在培养中）</p><p>最难时候高温夏天，机械厂里工伤造成两根手指断裂失血没钱去医院，在出租屋里一个人躺了半个月，身上四十块钱，每天一碗1.5元阳春面度日，饿了就喝水。</p><p>在随后一年的努力当中，进入了互联网创业公司，再进入了上市公司，最后又走到民营企业。月薪从6000多到8000多到12000，也走到了这个职业的天花板。那么在月薪达到6000块的时候，生活基本可以保持稳定，就开始反复的做网店，一边上班一边创业。做了一年的茶叶甚至自己定制了大量的包装，最后失败而终。</p><p>随后又做了一整年的国际化妆品。最后亏损8万多，也是失败而终。第三年又开始卖电器，运气比较好，这一条路走通了。这三年都是一边上班一边经营网店，一年大概赚了18万。</p><p>他的主页现在写着单身，爱听纯钢琴 品茶 独处 商业 极简 养两只黑白猫 背包客两次西藏，风雨11年走过江浙沪北京上海工作，跨行业制造业、服务业、IT业，想想再过几年三张了，时光戏人。</p><p><br></p><h4>6.身份需要保密的小军官</h4><p>学历：军校本科</p><p>工作：军官</p><p>感情：正式的恋爱算上现在的三段   两段网恋 一段搭讪 时间不长 应该是因为个人性格原因不适合处对象</p><p>财力： 包吃住 不算公积金和住房补贴年收入13-15w 现有一套价值160w的房子一套</p><p>日常生活：工作上班  偶尔锻炼  看电影居多 以前喜欢打游戏 现在手游和电视剧为主 想考cpa和司法考 但是工作太忙 只有很零碎的时间 加上自觉不够 像温水里的青蛙 所以一直没有付诸行动</p><p>最常用/或喜欢的App：vx qq uc 美团 饿了么(没错，部队也可以叫外卖)</p><p>对现在的生活是否满意：不怎么满意 </p><p>现阶段最大的愿望：<b>找到那个对的人</b>  其次是让工作更有价值</p><p>一句话总结自己：狗一样的人生（关于这个解释我们聊了很多，但是有点敏感，省略）</p><p><br></p><h4>7.Lin Bing 走了18个国家，现在在南非 </h4><p>91年单身，一个很酷的小姐姐，家在南京或者一直在路上。</p><p>目前走了18个国家现在还在南非走着，感觉一年也在家待不了多久，完成小时候的梦想环游世界吧</p><p>之前在路上遇到过喜欢的人，现在感情的事情暂时不考虑</p><p>开过网店做过旅行代购，月收入过W感谢一路支持我的人们让我走得更远，自己也好好积累人品。首付自己付款贷款南京买了一小套两居室等升值吧，反正没想过在南京定居</p><p>对现在生活感觉还行，但是因为<b>经常在路上也是有点累的，希望自己五年能换一种生活模式。</b></p><p>现在最大希望存多点钱做自己想做的事情，想去读研艺术方面的事情发展，完全为爱好不为钱财。</p><p>四年改变了很多，<b>只有坚信没有不可能。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 480px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 68.65%;\"></div>\n<div class=\"image-view\" data-width=\"1512\" data-height=\"1038\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5921503-1981f50c7b486610.jpg\" data-original-width=\"1512\" data-original-height=\"1038\" data-original-format=\"image/jpeg\" data-original-filesize=\"379511\"></div>\n</div>\n<div class=\"image-caption\">Lin Bing</div>\n</div><p><b><br></b></p><h4>8.章筱雯  音乐人、写字的、画画的、做新闻的</h4><p>写字的人中唱歌好的，唱歌的人中画画不错的，画画的人中会写那么点东西的，目前在新闻理想中，越走越迷失。那么就吼两嗓子吧。</p><p>24岁这一年，我在天津塘沽。对，就是2015年812爆炸的那个地方。那时候我刚来这里一个礼拜，便爆炸了。我当时想，这真不是一个适合久留的地方。在这里，我没有朋友，没有家人，更没有归属感。</p><p>我把租处改造成了我喜欢的样子。并在家里的支持下，在这里贷款买了人生中第一套属于自己的房子，年底交房。有时候，房子不一定代表归属感，但总觉得是个归处。<b>等房子下来，我要把它装成我最喜欢的样子。</b></p><p>这一年，我心中有了一个牵挂的人。这一年，我们一起看了三场演���，走过了六个城市，吃遍了塘沽大大小小的餐厅小吃，逛遍了天津文艺小青年儿们乐意去的地儿。我很相信他，尽管我知道我们最终不能在一起。我们说好的我25岁生日之后，我们就恢复普通朋友的关系。<b>我不知道我们还能不能回到之前那样，但我从没有后悔和他在一起过。</b></p><p>以前我对很多事情都有很多热情。</p><p>比如唱歌（网易云音乐人：章筱雯）</p><p>比如写字（独立运营公众号：文艺说）</p><p>比如减肥（23岁减了18斤，现在又涨上来10斤）</p><p>比如不安于现状（以前最常看的网站是招聘网）</p><p>比如喜欢聊天（微信里固定聊天的人超过五个以上）</p><p>而现在，我更喜欢一个人静静地发呆，什么都不想，很享受大脑放松时的那一刻安宁。</p><p>很多人最怕的不是被同龄人抛弃，而是被后一辈扔在沙滩上。但是其实这是难免的。</p><p><b>25岁的我，不再给自己那么多限定。我只想让自己更快乐更随心的生活。</b></p><p><b>想做的，始���是那个自在如风的少年。</b></p><p><b><br></b></p><h4>9.我表姐 小城市做公务员的小青年</h4><p>	92年出生，本科，去年报了在职研究生MPA考试，本来想弃考，甚至考试那天早上都想忽悠自己睡懒觉不去考。后来想着考点就在家门口，以及交了两百报名费，就裸考上阵，然后前不久复试完，进了研究生的门。</p><p>	在自己家的四线小城市，毕业就进国企做财务。部门老大很信任刚毕业的我，各种工作都会砸给我，有时候只能翻出教材自己恶补。公司的快节奏很容易让人成长，但一直觉得很压抑，有些人我忍不了，递了三次辞职报告，都被打回让我好好考虑，然后我就休了两个月假，说是要考研，然后默默准备考国考，没考上，继续回去上班，然后不放弃继续省考，每天刷一下题，莫名就觉得这次肯定能考上。所以，我现在成了一名公务员。</p><p>	喜欢旅行，吃，摄影（业余），弹钢琴（弹不会），听民谣（房东的猫）。</p><p>	对现在生活还算满意，<b>基本能养活自己，买想买的东西，去想去的地方，拥有着能拥有的诗和远方。</b></p><p>	没有男朋友，身边出现过一些人，不喜欢就不强求。现在觉得遇到喜欢的男生很难，因为走心的少，都是为了解决单身而恋爱，还不如自己一个人，天生放荡不羁爱自由。对比那些早早结婚生孩子止不住抱怨的同学朋友来说，觉得自己过得舒服太多。其实有点<b>后悔大学没有谈恋爱，那么无忧无虑的好时光，我不恋爱，上课只听笑话去了</b>，真是可惜。</p><p>	我对我自己个儿的总结就是一个不是那么普通的普通人。对于“你正在被你的同龄人抛弃”这个说法，我不认同，但也不反对，<b>我应该不至于是一个被抛弃的人，生活暂且无忧，一直有着自己的梦想和追求，定期完成一些小目标，就不会被抛弃。</b></p><p><b><br></b></p><h4>10.小嘿 不会开飞机的程序员不是好摄影师</h4><p>作为一个90后，秉承了大家对我们的普遍看法，敢想敢干，做自己喜欢的事情；</p><p>211大学毕业，之后一直找不到自己的方向，尝试了几次工作，觉得还是要自己去闯一闯，曾经也是程序员出身，无奈对技术钻研的热情远低于对大自然的探索，从小就喜欢户外运动，喜欢探险的我，毅然决然的选择了辞职，创业做户外运动旅行。</p><p>这两三年，<b>上过天，跳过伞，开过飞机，潜过深海，和鲨鱼一起潜水，和海龟一起游泳，爬过高山，也在大草原上策马奔腾，在色达的山顶看过星空，也在非洲大草原上拍过南半球的星星，在贝加尔湖畔拍过倒立，也在仙本那的小船上躺着数星星，在富士山脚下泡着温泉，和朋友们一起跨年，也在长野滑过野雪</b>，梦想有很多，技能也在一个个的加点；</p><p>很享受现在的生活，<b>虽然不能指望这个养活自己，但起码可以满足我看世界的心</b>，希望接下来，能组织更精彩的活动，认识更多有趣的小伙伴～</p><p>我居住在上海，大家都叫我小嘿队长，队长无所不能，唯一的遗憾是还没来得及认识你…</p><p>（我：莫名觉得像相亲，不过小嘿队长马上会有沙漠穿越、潜水看海龟、摩洛哥、肯尼亚之类的行程正在招同行小伙伴喔）</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 700px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 100.0%;\"></div>\n<div class=\"image-view\" data-width=\"960\" ', '2018/04/09 00:14', 1774, 1797, 2419, 'https://upload-images.jianshu.io/upload_images/5921503-bec8e8e96a4a1f85.jpg', ''),
('c0ec231fcf01', 8747457, 'fee4b4b0b89e', '“我不是来工作的，是来生活的。”', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 788px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 112.57%;\"></div>\n<div class=\"image-view\" data-width=\"700\" data-height=\"788\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4082943-9723d6738aae73eb.jpg\" data-original-width=\"700\" data-original-height=\"788\" data-original-format=\"image/jpeg\" data-original-filesize=\"68532\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>01</b></p><p>晚上10点多从办公室走出来，碰见了也是刚来不久的同事。</p><p>外表娇小，个子不高，长相可爱，标准的南方的姑娘，但却还是一个人能抱一大摞资料来回跑出风的姑娘。</p><p>我问她这么晚了怎么回去？一个人挺不安全的。</p><p>她说走着就可以到家。</p><p>“怎么那么近？”</p><p>她说，就在前面的一个小区，走路5分钟就可以到。</p><p>“难道你没有住单位安排的宿舍。”</p><p>“没有，当时单位安排宿舍的时候，因为要跟别人合租，空间比较小，虽然省钱但是不方便，所以就在附近租了一套房子，搞完价之后几千元，还是挺合适的。”说着感慨到“我们是来生活的，不是来工作的。”</p><p><b>是的，她的一句——我们是来生活的，不是来工作的，突然之间触动了我，也让我想起最近接触的一些朋友。</b></p><p><b>02</b></p><p>C小姐是做法律工作的，每天处理很多的事务，但单位比较偏不在市中心，但她却选择在离单位1小时车程的市中心的地方租了房子。</p><p>我曾经问她，这样离单位那么远，房价贵不说上班也不是很方便啊。</p><p>她说，来到大城市了越是在中心的地方越是能接触到最新的信息，有趣的人，而且很多公共设施都在市区里面，周末的时候去学习去看书，逛逛街都比较方便。</p><p>如果你在大城市，还是住在比较偏的地方，那和之前小城市待着又有什么区别呢？</p><p>我接着问她，如果遇到加班的情况怎么办？</p><p>她告诉我，那就不加班，尽量把事情都在工作时间内搞定，<b>高效在8小时内完成工作，不去拖延工作不仅是对单位负责，也是对自己负责。</b></p><p>8小时之外一定要做些自己喜欢的事情。去健身、去读书、去思考，去和陪朋友聚聚，周末的时候学习一些插花课程、烘焙课程，绘画课程等等，假期的时候和朋友来一次说走就走的旅行，<b>尽量把生活过的精彩一点。</b></p><p><b>03</b></p><p>最近一个朋友跟我说想辞职。</p><p>我问她为什么？她说因为现在的工作节奏太快了，作息也不规律，她做的是教育，因为要根据学生的时间进行上课，也就意味着别人过周末的时候她还要去上班。</p><blockquote><p>有的时候要连上10几个小时的课，真的很疲惫。最近还累感冒了，“谢谢大家，怨气怎么重，不正能量的我也不想，我也想每天正能量的活着，快快乐乐地活着，但是人啊，毕竟有七情六欲，毕竟食五谷杂粮，毕竟都是俗世中的凡人，因为有黑暗才会有阳光的概念”。我看见她发的状态说自己真是够够的，突然感觉到很心疼。</p></blockquote><p><b>其实，没有一份工作是钱多、活少、离家近，来大城市打拼的人们明白这一点，也是苦于这一点。</b></p><p><b>我们这个时代做什么都不容易，但是我们能做的就是接受现实，继而改变，比如做出一些选择，给自己留出一些时间和一点空间，而不是被工作推着走。</b></p><p>我曾经问朋友：“现在挣钱重要还是成长重要？”</p><p>她说：“都重要。”</p><p>我说：“假如你现在的工资月薪2万，而给你每天多出1小时，这1小时可以干你自己想干的，学习英语、考过雅思，留学名校，而代价是让你每个月少2k，你愿意吗？”</p><p>她想了想。</p><p><b>其实如果是你，你会怎么选择？</b></p><p><b>相对于金钱，这个世界更可贵的就是希望。</b>钱是死的但是人是活的，如果我选，会毫不犹豫地选择那份可以给出1小时自由时间的工作，虽然少拿10%的工资，但是会更加自我，有更多机会甚至更多可能。</p><p>比如我有一定的英语功底了，每天坚持学习英语1小时，说不定半年的时间就能考研成功，继而名校深造出来以后工资翻番，<b>那么这样以来你的时间会更加有价值。</b></p><p><b>如果时间得到充分利用，还可以做更多有意义的事情。</b>如果你在一个地方，只是抱着打工的心态，干一天是一天，干一天拿一天的工资，那么相对那些有梦想，工作不仅是为了死工资而是为了铺就事业的人，时间久了，差距会越来越大。</p><p><b>工作是生活的一部分，但不是全部。</b></p><p><b>04</b></p><p><b>看过一篇小故事：</b></p><p>有三个工匠在一起盖房子。行人路过，分别问他们在干什么。</p><p>第一个工匠一脸茫然地说：“没看到我在忙吗？工头安排我来砌砖呢。“</p><p>第二个工匠很兴奋地说：“我在盖一栋很大的房子，等这房子盖好了，就可以住很多很多人。“</p><p>第三个工匠非常自豪地说：<b>“我要让这座城市变得更美丽。</b>我要争取将城市里的每一个人都称赞我们的城市是最漂亮的。这是我这辈子一定要做的事情！“</p><p><b>十年以后，第一个工匠还是一名普通的工匠，在埋头砌砖。第二个工匠成为了工程师，在工地上指挥大家建房子。第三个工匠当上了这座城市的设计师，在他的规划下，这座城市正变得越来越漂亮。</b></p><p>这个故事你也可能听过，它也有很多解读，<b>有的人说对待事物的态度不同人生也会不同。但我觉得是千万不要以打工的心态去做一件事情，甚至对繁琐没有创造的工作习以为常，日复一日没有改变。而应该有明确的目标，那就是成为更厉害的人</b>。</p><p>来一个城市、做一份工作是创造价值的，通过创造价值让这个社会变得更美好，也让自己变得更美好。</p><p>前几天，摩拜被美团收购，其创始人胡玮玮套现15亿元的消息传出，很多人不安定了，觉得为什么别人年级轻轻就成为人生赢家。你可能说，这件事与我们大多数人来说都是不可复制的，但是不得不看到一点，从10年的汽车记者到创业者，是因为她的不安分，她的创造性的工作，她想创造更大价值让她获得这样一个机会呢。</p><p>但成功不是一蹴而就的，当你羡慕别人在很多方面都取得成绩，在一些领域制高点上大步飞跃的时候，我们不要忘记，<b>在人生漫长的道路上，他们把大部分时间都花在了缓慢坚定的跋涉中。</b></p><p></p><p><b>不管多忙，都要想到去投资自己，多投资自己吧，是你的，别人谁也抢不走。</b></p><p><b>在大城市，不是来工作的，是来生活的，但干好工作是为了更好的生活。</b>为了更好的生活，需要我们别太在乎眼前，更要看长远。</p><p>希望我们目标明确，坚持坚持再坚持，<b>看得到改变，有成长的惊喜，遇见更好的自己，这才是我们一生应该做的事情。</b></p><p></p><p><b>自荐首页文章（阅读量上万、过千赞或评论多的文章）：<br></b></p><p><b><a href=\"https://www.jianshu.com/p/e75c0138c5e3\" target=\"_blank\">你好，四月！时间可以浪费，人生不能！</a><br></b></p><p><a href=\"https://www.jianshu.com/p/1260632264bf\" target=\"_blank\">从0到坚持晨跑700天、8000多公里、瘦身40斤，跑步遇见更好的自己！</a></p><p><a href=\"https://www.jianshu.com/p/9563fc108490\" target=\"_blank\">1月再见，2月你好！自律的人生从走好每一步开始！</a></p><p><a href=\"https://www.jianshu.com/p/c530053f3e4b\" target=\"_blank\">从今天起，培养5个思维让你获益一生！</a></p><p><a href=\"https://www.jianshu.com/p/33093aa32812\" target=\"_blank\">四年前我离开500强去考公，过上了自己想要的生活！</a></p><p><a href=\"https://www.jianshu.com/p/054a3fb345a5\" target=\"_blank\">2017年，这个小习惯让我效率提升数倍，实现了90%的目标</a></p><p><a href=\"https://www.jianshu.com/p/0206cbbaf215\" target=\"_blank\">一个月瘦10斤、从中年大叔到追风少年，跑步还给我带来哪些改变？</a></p><p><a href=\"https://www.jianshu.com/p/646b4e60d7b9\" target=\"_blank\">2月再见，3月你好！请保持自己的节奏，努力向前冲！</a></p>\n          ', '2018/04/08 21:03', 1858, 10, 1971, 'https://upload-images.jianshu.io/upload_images/4082943-9723d6738aae73eb.jpg', ''),
('c983ec21c71f', 9984068, 'a7f876850fa6', '大树与少女', '\n            <p>三原则：图原创，文原创，诗原创。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 466px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.67%;\"></div>\n<div class=\"image-view\" data-width=\"1800\" data-height=\"1200\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4810847-fedb98d6465a9094.jpeg\" data-original-width=\"1800\" data-original-height=\"1200\" data-original-format=\"image/jpeg\" data-original-filesize=\"1085768\"></div>\n</div>\n<div class=\"image-caption\">图片拍摄于俄罗斯</div>\n</div><p>在错误季节的相逢</p><p>也许是另一场错误</p><p>我终于长成了一颗树</p><p>遇见你时</p><p>却是风雪载途</p><p><br></p><p>然而</p><p>能得到你的注视</p><p>总算是一种幸福<br></p><p>哪怕面对面时</p><p>各自孤独</p><p><br></p><p>待雪化了</p><p>风也暖了</p><p>我会长出一些绿芽</p><p>开几朵小花</p><p>以此纪念</p><p>你曾经驻足</p>\n          ', '2018/04/14 08:16', 1225, 1451, 1570, 'https://upload-images.jianshu.io/upload_images/4810847-fedb98d6465a9094.jpeg', ''),
('ce340277fc6e', 17889974, '2b3ad4f2a058', '你为什么至今单身？看完后扎心了！', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 534px; max-height: 300px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.18%;\"></div>\n<div class=\"image-view\" data-width=\"534\" data-height=\"300\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-0e47e3f24c0896bb.png\" data-original-width=\"534\" data-original-height=\"300\" data-original-format=\"image/png\" data-original-filesize=\"165098\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>文/麦大人</p><h2>01</h2><p>知乎上有个热门话题：<b>为什么现在的男性普遍不再对女性展开追求了？</b></p><p>下面留言竟有24591个回答，看得出大家对这个话题的感兴趣程度。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 1244px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 177.78%;\"></div>\n<div class=\"image-view\" data-width=\"1080\" data-height=\"1920\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-4df6d46756010039\" data-original-width=\"1080\" data-original-height=\"1920\" data-original-format=\"image/jpeg\" data-original-filesize=\"149410\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>如今，单身贵族越来越多，当然有些人自愿的，有些却是被动单着。这个现象跟求职市场颇有几分相似？</p><p>一边是用人单位招不到合适人才，另一边毕业即失业再正常不过，年纪轻轻就回家啃老的不在少数。</p><p>为什么会出现这种现象？</p><p>麦叔认为，有大环境因素，当今社会生活压力徒增，人们择偶趋于理性，更注重精神诉求。</p><p>再有，社会在进步，女性地位在提升，结婚不再出于本能，而更多是情感需求，不结婚也可以过得很好。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 500px; max-height: 213px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 42.6%;\"></div>\n<div class=\"image-view\" data-width=\"500\" data-height=\"213\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-9d53fe5cfc4a0a38\" data-original-width=\"500\" data-original-height=\"213\" data-original-format=\"image/jpeg\" data-original-filesize=\"14497\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>当然，也有个人因素，很多人看一些情感毒鸡汤之类，不知不觉也被影响着。</p><blockquote>\n<p>你爱我就应该无条件地满足我，不然就是不够爱我。</p>\n<p>我只要努力减肥，让自己瘦下来，他就一定会爱上我。</p>\n</blockquote><p>要想摆脱单身，需要在意识和行动上双管齐下。</p><p></p><p><b>在拥有爱情之前，先具备爱人的能力。在爱他人之前，先学会爱自己。</b></p><p><br></p><h2>02</h2><h3>世上没有完美的爱情，适合的才是最好的。</h3><p>曾经看到这样一个段子：</p><blockquote>\n<p>我要追一个心仪的女生，有没有什么秘籍呢？</p>\n<p>只要满足他们的幻想就行。</p>\n<p>那是什么样的幻想呢？</p>\n<p>帅气多金、高知性感、才华横溢，不时还得有一些幽默感，最重要的有一份响当当的工作。</p>\n</blockquote><p>在这些条件里，怎么就没有女生最看重的<b>“对她好”</b>，难道说现在的女孩子已经进化到不需要这个了？</p><p>曾经，我们会给另一半附上一箩筐条件，直到你爱上那个人，才发现很多条件都是多余的。不符合预设标准的他，你们且相处得很融洽。</p><p>你觉得吴彦祖很好，但他不是你的菜。在感情方面，适合自己的才是最好的。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 400px; max-height: 203px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 50.74999999999999%;\"></div>\n<div class=\"image-view\" data-width=\"400\" data-height=\"203\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-b537127c4a575217\" data-original-width=\"400\" data-original-height=\"203\" data-original-format=\"image/gif\" data-original-filesize=\"281132\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>很多女生都有“紫霞仙子”情结：</p><blockquote><p>我的意中人，他是一个盖世英雄。有一天，他会脚踏七彩祥云身穿战甲来娶我！</p></blockquote><p>《大话西游》的经典，就在于它满足了我们对爱情的美好遐想，但也就仅此而已。</p><p><br></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 400px; max-height: 225px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"400\" data-height=\"225\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-f941dbd766808902\" data-original-width=\"400\" data-original-height=\"225\" data-original-format=\"image/gif\" data-original-filesize=\"459861\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>琼瑶阿姨是华人世界很多人的言情教母，她的作品影响了几代人的思想。</p><p>人不风流枉少年，哪个少女不怀春？</p><p><b>爱便轰轰烈烈，不爱则缠绵悱恻。男的英气逼人、儒雅潇洒，女的貌美如花、琴棋书画。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 432px; max-height: 243px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"432\" data-height=\"243\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-82349b62da059eb4\" data-original-width=\"432\" data-original-height=\"243\" data-original-format=\"image/gif\" data-original-filesize=\"1001969\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>似乎爱情就得惊天地泣鬼神，什么海枯石烂一生一世，平平淡淡的就不配作为爱情了。</p><p><b>年少时，我们始终相信，未来一定要经历一段刻骨铭心的爱情，此生才没有遗憾。但成年后发现，所谓轰轰烈烈的爱情，根本敌不过“合适”二字。</b></p><p>王子和公主最终会走到一起，从此过上幸福的生活，很多童话都是骗人的。</p><p>其实，邂逅一场爱情，只需要拥有一颗开放想心态就可以。感觉好了，一切都有了。至于那些条条框框的东西，什么英俊潇洒，谈吐不凡，“三子登科”应有尽有，只是不爱TA的原因。</p><p></p><p>世间哪得双全法。</p><p><br></p><h2>03</h2><p></p><p><b>努力尝试去爱，自己建立安全感。</b></p><p>好的爱情，不是去找一个完美的人才开始，而是在恋爱的过程中，不断完善，共同进步，让彼此变得更好。</p><p>有一次，听到小Q这么说：“我要找一个很爱很爱的人，才会谈恋爱。”</p><p>然后我问她：“什么样的人才算是很爱很爱呢？”</p><p>结果她却无法回答，因为她自己也不知道。</p><p>没错，我们总以为，你会找到一个自己很爱很爱的人。可后来，猛然回首，才发觉自己曾经多么天真。</p><p><b>假如从来没有开始，你又怎么知道自己，会不会很爱很爱那个人呢？其实，很爱很爱的感觉，是要在一起经历了许多事情之后才会发现的。</b></p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 576px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 82.3%;\"></div>\n<div class=\"image-view\" data-width=\"870\" data-height=\"716\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-85ff1c630f741cd1\" data-original-width=\"870\" data-original-height=\"716\" data-original-format=\"image/jpeg\" data-original-filesize=\"72490\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>《美好生活》里，徐豆豆是一个神经大条的女孩，她和黄大仙是医院同事，虽然最终喜结良缘，但恋情发展却让人揪心。</p><p>豆豆对待感情有些吊儿郎当，面对黄大仙多次求婚，在紧要关头总是选择逃避，吊着对方有些过分。</p><p>其实黄大仙是一个挺靠谱的男人，但豆豆却是一个恐婚症的女人。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 634px; max-height: 354px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 55.84%;\"></div>\n<div class=\"image-view\" data-width=\"634\" data-height=\"354\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-fdb9d39ee903cd83\" data-original-width=\"634\" data-original-height=\"354\" data-original-format=\"image/jpeg\" data-original-filesize=\"27093\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>如今，恐婚症成了一种社会现象，大城市更加普遍，它本质是就是一个安全感的缺失。</p><p>其实，我们在面对不可预知的未来时，会有一种不确定性，这就是不安全感。</p><p></p><p><b>而安全感的强烈程度与成长环境和当前处境有关，它的建立则有赖于个人对世界的理解。</b></p><p>刚出生的宝宝，他们可以从吮吸母亲的乳头而获得安全感。尤其是母乳喂养的小孩，断奶是一个艰难的过程。而那些晚上非得开着灯，抱着玩具，听着故事才能进入梦乡的孩子，他们会比较缺乏安全感。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 396px; max-height: 240px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 60.61%;\"></div>\n<div class=\"image-view\" data-width=\"396\" data-height=\"240\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-a778ee3084aab607\" data-original-width=\"396\" data-original-height=\"240\" data-original-format=\"image/jpeg\" data-original-filesize=\"10403\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>心理学研究得出，0-6岁之间的孩子，如果母亲陪伴时间少，长大了极易缺乏安全感。这期间如果母亲离开一个月以上，造成的创伤几乎是不可逆的。</p><p>具体到感情上，则会表现出两种不同的极端来。</p><p>有些情侣刚认识几天，自己就被催婚，TA只是想在对方身上获得安全感。其他的像徐豆豆一样，极度恐婚，害怕在婚后失去自我，谈“婚”色变。</p><p>那么，怎么建立安全感？</p><p> <b>正视自己，你不用对生活负全责。</b>人生本来就不安全，不因为你多一分担心，就会少一些变数。</p><p><b>正视失去，你本来就不拥有什么。</b>比如钱财乃身外之物，我们只不过是替人暂时保管。</p><p><b>生活在别处，安稳在心中。</b>真正的安全感只可能来自于一个地方，那就是你的内心。</p><p>俗话说，靠山山倒，靠人人跑，只有自己最可靠。所以，不要期望从别人哪里获得安全感，你只能靠自己。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 422px; max-height: 240px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.87%;\"></div>\n<div class=\"image-view\" data-width=\"422\" data-height=\"240\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-514f5e299c96a4a1\" data-original-width=\"422\" data-original-height=\"240\" data-original-format=\"image/gif\" data-original-filesize=\"322672\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>事实证明，单身时缺乏安全感的，婚后也很难拥有。</b></p><p>一直很喜欢这句话：不在乎有的，不惦记没的，不害怕失去的，不追求强扭的。对得到适可而止，对失去心无畏惧。</p><p><br></p><h2>04</h2><p><b>优秀是吸引对方的前提，精神上的门当户对很重要。</b></p><p>好的爱情不用拼命刻意追求，而是相互吸引的结果，费尽心机得到的也很难长久。</p><p>我们总是迷恋于钱钟书和杨绛的爱情，这对才子佳人演绎了相濡以沫的爱恋。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 382px; max-height: 220px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 57.589999999999996%;\"></div>\n<div class=\"image-view\" data-width=\"382\" data-height=\"220\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2259045-db61e9d75bd9ff25\" data-original-width=\"382\"', '2018/04/10 14:04', 147, 194, 279, 'https://upload-images.jianshu.io/upload_images/2259045-0e47e3f24c0896bb.png', ''),
('e1c705230850', 12362519, 'd6875d11fafd', '对简书作者要说的四点免费建议', '\n            <p>简书版权是为作者服务的。到现在为止我们做得还不错，接近80部作品签约出版了，从4月份开始，陆续会有一些纸书会面世。更让人开心的是，我们的非虚构类作者，有的已经拿到了起印三万册的条件，而虚构类作者，有的拿到了起印一万册的条件。</p><p>对于国内的新人作者来说，这绝对是最高的条件。我和我的同事要谢谢你们，是你们的才华和努力让简书版权成为目前国内最好的新人发现和孵化机构。</p><p>在不错的出版社出版一本纸书，这是一个新作者非常重要的里程牌，我们就像是做足球青训一样，在 C罗还在马德拉岛上踢球的时候就发现、培养他。现在虽然内容市场很热，但是真正立志于发现新人并培养他们的机构几乎没有，好多所谓热门内容都是泡泡。这就好比是中超联赛，钱花得不少，场面也花哨，但是你总是能看到停球停出五六米，下底传中出底线的画面。</p><p>说这些���简书版权不是为了表功，而是告诉大家，我们在关于什么是好作品方面是有发言权的。在寻找优秀作品的过程中，看到很多人在浪费时间，或者停留在自言自语、自我陶醉的状态，有几句不中听的话说一下。我说这些话，是替可能成为优秀作者的你着想，听不听取决你，说不说是我的事情。</p><p>一、不要自封，或者膜拜别人为简书大神，简书是一个新人作者的成长平台，每个人都有空间自由表达，有平等机会得到版权服务。我们的一些签约作者很快就会成为图书、内容市场的知名人物，有的甚至已经完成了作品的影视梦。但没有人是神，也很少有人通过一本书，甚至几万字的文章成为什么“神”。简书版权的团队都服务过大牌作者，很多还是国际大牌，在他们眼里没有谁是神，只要你有才华，你认真写作，我们都会努力帮助你。</p><p>二、如果想走得长远，远离公号写作。注意，这是一个建议和选择，不是命令、要求。如果你追求的是公号写作带来的收益，或者其他快感，你可能会离出版越来越远。一本要立得住的书，不是公号那种十万级加，蹭热点、抖机灵可以支撑的。没错，这几年因为有些出版人不求上进，出了一些这类的书。这些事情我们不做。</p><p>三、接着上一条。简书上绝大部分作者是很难出版一本可以在市场上销售的书的。这很正常，因为上帝没有把写作才华均分给每一个人。比如我，就觉得服务一个优秀的作者是我更应该做的。所以关于写作，你在简书写着开心就好。</p><p>四、如果写作是你的梦想，那也很好，但是你的梦想不是世界的中心，也没有谁通过写作获得金钱、声誉，或者其他回报，是理所应当的。即使你是一个很优秀的作者，别人也不是你梦想里面的背景或者是木偶。写作本身并不比做饭、带孩子高尚，写作的同时尊重别人，这是高尚的。</p>\n          ', '2018/04/12 17:51', 10, 1485, 1650, 'https:undefined', ''),
('f5c2a95aaf2b', 10418656, '384c2f242cdb', '《奇迹男孩》：我们所拥有的一切都是上天的礼物', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 690px; max-height: 390px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.52%;\"></div>\n<div class=\"image-view\" data-width=\"690\" data-height=\"390\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3238804-a64d6617102bb813.jpg\" data-original-width=\"690\" data-original-height=\"390\" data-original-format=\"image/jpeg\" data-original-filesize=\"200627\"></div>\n</div>\n<div class=\"image-caption\">图片来自网络</div>\n</div><p>几个月前，就被这部电影吸引了，一直想去电影院观看，却一直没有时间，直到今天，在网上观看了这部电影。我终于明白了，它的评分为什么会那么高，为什么它会被那么多人推荐了。</p><p>从影片的一开始，我就被奥克独特的自我介绍感动了，而这种感动一直延续到影片的结尾，我几乎是一边含着泪，一边微笑着看完这部电影的。这部电影带给了我暖暖的感动。</p><p>《奇迹男孩》中的主人公奥克，是一位很特别的小男孩，他出生后经历了27次手术才可以呼吸、看见东西，才能够不靠助听器听见声音。就是这样的一位男孩，默默地影响了身边的每一个人，就像是与生俱有的能力一般。</p><p>这部电影从四个不同人物的视角，让我明白了一个道理：也许，你害怕的一切，不想拥有的一切，正在被别人羡慕着。要相信，你所拥有的一切，不论好坏，都是上天送给你的礼物。</p><blockquote><p><b>外貌这张地图，从来都不丑陋</b></p></blockquote><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 665px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.5%;\"></div>\n<div class=\"image-view\" data-width=\"1000\" data-height=\"665\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3238804-271f62d0b1007a52.jpeg\" data-original-width=\"1000\" data-original-height=\"665\" data-original-format=\"image/jpeg\" data-original-filesize=\"118868\"></div>\n</div>\n<div class=\"image-caption\">图片来自网络</div>\n</div><p><b>“人们永远都只看外貌吗？”</b></p><p><b>“每个人的脸上都有印记，你第一次手术时，我长了这条皱纹，你最后一次手术时，我长了这些皱纹。心灵这张地图，给我们指引前方的道路，而这外貌这张地图，则记录我们走过的路途，这张地图从来都不丑陋。”</b></p><p>现实世界，大部分人了解别人的第一步就是看他的外貌，毕竟，这是最直接的方式。这让奥克非常伤心，因为，大家都像看怪物一样地看待他。后来，妈妈告诉了他上面的那段话，使他释然。</p><p>追星界里流传着这样的一句话：“始于颜值，陷于才华，忠于人品。”这是作为粉丝，认识偶像、了解偶像、喜欢偶像的过程，但对于偶像而言，也有同样的一句话：“始于颜值，限于才华，终于人品。”是的，如果一位艺人没有才华，就算有着超高的颜值，演艺道路上也会受到限制；如果他的人品不好，那么，总有一天，他的演艺道路会因此而终结。因为，群众的眼睛是雪亮的。</p><p>是的，我们每个人的长相都不一样，或是貌美如花，或是丑陋无比，更多的是普普通通。也许，第一眼看到一个人时，会因为外貌而想要去了解，但经过时间的推移，真正能让别人喜欢的，是心灵的美好。我们一辈子会遇到许许多多的人，不可能让每一个人都喜欢，那么就看看心灵这张地图，走自己的路吧！</p><blockquote><p><b>那些我们从未注意到的世界</b></p></blockquote><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 655px; max-height: 412px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 62.9%;\"></div>\n<div class=\"image-view\" data-width=\"655\" data-height=\"412\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3238804-a5fab5d1de2f7f3b.jpg\" data-original-width=\"655\" data-original-height=\"412\" data-original-format=\"image/png\" data-original-filesize=\"351572\"></div>\n</div>\n<div class=\"image-caption\">图片来自网络</div>\n</div><p><b>生命流逝得太快，我们甚至没时间看对方一眼，以前我不知道发生这么多事，我们却从未注意到。让我回去吧，到山上去，回到我的坟墓，首先，等一下，我再看一眼，再见，再见世界，再见妈妈，爸爸，再见，钟表的滴答声，食物，咖啡，热水澡，睡眠，还有醒来。地球，你是那么精彩斑斓，令人捉摸不透。</b></p><p>在舞台上，当姐姐说出这段台词时，妈妈在台下看得泪流满面。是的，一转眼间，孩子就长大了，因为一直很懂事，所以不用自己操心，但这不代表，应当忽视这些变化。</p><p>我想，当我们即将离开时，我们都会有这样的心情吧，那么不要让自己后悔，珍惜身边的每一个人，珍惜这做的每一件事，每���分每一秒，因为，它们都是独一无二的，正是它们，造就了我们这美好的世界。</p><p>记得大学那会儿，一位室友晚上突然说：“诶，你们说，如果有一天，我们的父母离开了我们，你们会怎么样？如果那一天真的到了，我都不知道，我要如何活下去了。”</p><p>当时，整个寝室突然就安静了下来，我想着这一天到来时的模样，眼泪不争气地掉了下来，只希望，这一刻永远都不要到来。我们能做的，也许只是认真聆听父母的话，照顾好他们，让这一天来得晚一点，再晚一点。</p><blockquote><p><b>用心去看，那些我们从未注意到的世界</b></p></blockquote><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 485px; max-height: 240px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 49.480000000000004%;\"></div>\n<div class=\"image-view\" data-width=\"485\" data-height=\"240\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3238804-640aa79035683f43.jpg\" data-original-width=\"485\" data-original-height=\"240\" data-original-format=\"image/jpeg\" data-original-filesize=\"32514\"></div>\n</div>\n<div class=\"image-caption\">图片来自网络</div>\n</div><p><b>如果我们了解别人的想法，就会知道，没有人是普通的，每个人都至少值得大家起来为他鼓掌一次。包括我的朋友，我的老师，我姐姐，因为她永远支持我；我爸爸，因为他总逗我们笑；特别是我妈妈，她从不放弃任何事情，特别是我。布朗老师分享的最后一句箴言写道：善良一点，因为每个人都在与人生苦战，如果你想真正了解他人，你只需要，用心去看。</b></p><p>这部剧用不同人物的不同视角，让我们看到了很多不一样的世界。</p><p>当我们以为姐姐的生活幸福的时候，我们看到了她的世界，失去了最好的朋友，不想麻烦别人的生活，会为她而抱不平。</p><p>当我们看到Miranda抛弃姐姐时，会觉得她特别讨厌，但在看到她的自白时，却看到了她的孤独与失落，看到了她的美好。</p><p>当我们看到奥克的朋友说出：“如果我长成他那样，我一定会自杀。”时，觉得自己看错了人，会和奥克一样误解他，但在他的世界里，却发现，其实那只是不得已说出的话，虽然它确确实实伤害了别人。</p><p>初入社会，爸妈会告诉我们，要小心处事，别被人算计。知道他们那是为我们好，但是，如果你没有做什么对不起别人的事，别人也不会平白无故地去算计你，除非，你让他们的利益受到了影响，被他们嫉妒了。如果真是这样，为什么不想想，在你炫耀这些事，做这些事时，为什么没有考虑到别人的心情呢？也许，两个人可以双赢呢？</p><p>当然，我们不可能考虑到每一个人的心情，那么，既然我们没有办法满足每一个人一样，也就不要去埋怨他们做出的一切吧，毕竟，在他们的世界里，他们是第一位。我们能做的，也许就是用一颗善良的心去看待这个世界，去对待别人，因为，每一个人都是独一无二的，为什么要羡慕别人的礼物呢？</p><p>在我们每个人自己的世界里，我们都是主人公，也许，我们都曾被别人伤害过，误解过别人，也被别人误解过，但只要我们的内心是善良的，用心去看，就能发现别人的不如意，看到他们闪闪发光的优点。</p><p>记住，我们所拥有的一切都是上天的礼物！现在，试着拆开你的礼物，哇，它竟然那么酷炫！</p><hr><p>无戒365极限挑战营 第122天<br></p>\n          ', '2018/04/12 06:38', 18513, 136, 19613, 'https://upload-images.jianshu.io/upload_images/3238804-a64d6617102bb813.jpg', ''),
('f65790e2a028', 10212711, 'f79de69d59e3', '【职场小说】第5期征文 |取快递', '\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 581px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 83.00999999999999%;\"></div>\n<div class=\"image-view\" data-width=\"1242\" data-height=\"1031\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4920384-6bc579f414e77708.jpg\" data-original-width=\"1242\" data-original-height=\"1031\" data-original-format=\"image/png\" data-original-filesize=\"608690\"></div>\n</div>\n<div class=\"image-caption\">图片发自简书App</div>\n</div><blockquote><p>01</p></blockquote><p>我们处二十一个人，七间办公室，处长和两个副处长单间，其他人四至五个人混着办公。我们办公室四个人，我、陈步淦、张坚贞和黄骅。</p><p>我们四个人没有实职，都是主任科员、副主任科员的这样虚的职级，用来享受待遇。陈步淦资格最老，五十六岁了，用他的话来说，就是进入退休倒计时了，革命生涯即将结束。张坚贞刚过五十，不善言辞，做事稳重，人也忠厚。知天命年一到，升不了处级，意味着政治生命线被切断，仕途走到底了。他也看得开，做好了把祖坟冒青烟的大业交给他儿子的准备。黄骅比我小两岁���腿脚勤快，口才也好，八小时之外的交际也广，深得同事们的喜欢，所以他虽然资历比我短，但和我一样也副科级了。</p><p>在我们处来说，我们办公室的年龄结构算是最合理的，老中青搭配。所以我们办公室很和谐，平日里大家都称兄道弟的。</p><p>机关工作也简单，一人一张办公桌，桌上一台电脑，一部电话，一个文具筒，再配个水杯，这些就是全部办公家什了。</p><p>上午的工间操刚结束，内勤刘芳跑进我们办公室，吆喝着说，奉处长之命紧急通知哈，10:30在会议室开会。</p><p>“这么急开什么会啊？刘姐。”黄骅问。</p><p>“是好事，评先评优，你和虬哥都连续两年优秀了，今年我们再推你们俩，连续三年优秀就要涨一级工资了，到时要请客啦！”刘芳回答黄骅时，眼睛朝我睃了睃。</p><p>我没接话，只是朝刘芳笑了笑。</p><p>“应该应该，还请刘姐投下您宝贵的一票。怎么这个时候评先评优？往年这时还没到啊！”黄骅边打哈哈边旁敲侧击着刘芳。</p><p>“综合处临时通知的，我们也不知道为啥提前了，不要缺席，就这样了。”说完，刘芳转身就走了。</p><p>黄骅拿着手机，也转出办公室了。</p><blockquote><p>02</p></blockquote><p>陈步淦朝我嘿嘿笑，说，小虬啊，连续三年优秀很不容易，不仅工资提前晋级，还能列入后备干部队伍，可喜可贺，到时是得好好请一下我们这些坐在路边鼓掌的有功之臣。</p><p>我说，谢谢陈哥吉言，这尘埃不还没落定吗？</p><p>三只手指捏田螺，十拿九稳的事，我们还不会投你？群众的眼睛是雪亮的，你对处里的贡献大家有目共睹。陈步淦笑眯眯地对我说。</p><p>陈哥，还没下文件敲定的事难说哦，我看小虬还是要认真对待。张坚贞慢悠悠地冒出一句了。</p><p>小虬你到其他办公室转转，给大家打个招呼，加深一下印象。陈步淦给我出主意了。</p><p>这不大妥吧，拉票行为，严重违纪。我拒绝着说。</p><p>你啊，真是死脑筋，你看，这个黄骅都不见了，人家就是活。陈步淦说。</p><p>说着，开会的时间就到了，处里的人陆陆续续到会议坐下了。黄骅这小子不知道什么时候冒出来，隔着我三个位置坐着。</p><p>处长手上夹着一个厚厚的文件夹，不紧不慢地踱着步，最后一个踏进会议。落座后，推了推眼镜，打开文件夹，清了���嗓子，开始讲话。</p><p>“请大家先把手机调到静音状态。今天会议议程有：一是学习党的十九大精神。二是年度评先评优工作。下面，请王副处长组织大家学习。”</p><p>会议室安安静静的。</p><p>处长说完，把十九大文件推到王副处长前面，王副处长拿起文件，中气十足地念着。</p><p>我静静地做着笔记。这个笔记是必须的，机关党委随时会来检查政治学习的，学习笔记本是必查的项目。有些同事比较淡定，全神贯注地刷着手机。</p><p>记了五页笔记后，政治学习这第一项议程总算结束，时间都过去35分钟了。期间，处长抬腕看了好几次手表。</p><blockquote><p>03</p></blockquote><p>下面，进入第二个议程，评先评优。去年，我们处的工作完成得很好，大家都是功臣，都可以评得上优秀。但是，这优秀的名额是有限的，特别是今年，局里要求从今年起把机关的一部分名额让出来，向业务部门倾斜，重点表彰一线干部，所以，我们处里优秀的名额只能选出四个，就是说，只有去年的一半了。这一半怎么砍呢，手心手背都是肉。为了平衡，每间办公室各推一个，票数高者为优秀。优秀只是一个荣誉，希望大家能正确看待。请大家每人投四个对象，多了无效，大家要客观、公正地推选，用好手中的推选权力，不要搞小动作，不要因此���产生矛盾，要把好事办好……处长滔滔不绝地说着。</p><p>叮铃铃，处长手机响起来，他手机没关静音。静静的会场，这响铃声特别刺耳，处长把眼镜朝上推去，架在额头上，瞪着眼看来电号码，可能是个重要的电话，处长唰地站起来，走出会议室接电话去了。</p><p>处长一走开，活跃的气氛又回到了会议室。</p><p>突然，我的口袋一震，来电话了。我赶紧掐了。</p><p>刚把手机放进口袋，又震起来了，同一个号码。我犹豫了一下，还是掐了。</p><p>手机第三次震起来，又是同一号码，真是顽固，我只好接起来。</p><p>喂，虬田先生吗？我是送快递的，请你到门口取下快递，我在你单位门口等你。对方说。</p><p>等会儿好吗？我在开会。我轻轻地说。</p><p>不行，我要去送下一件，要不然要下午再来了，但你这是海鲜，恐怕不保险。快递小哥急冲冲地说。</p><p>好吧。我只能屈从了，况且处长去打电话了，会议议程没法继续下去。鬼知道他什么时候打得完。</p><p>可是我没有网购什么海鲜啊，我想。</p><p>是老婆，肯定是败家的她买的了，她经常在网上购这购那的，还得意地说，秒杀了这个那个，好像捡到全世界的便宜似的。买得太多了，不好意思都往她单位送，有时填我的单位地址，往我这里送。这叫化整为零，降低不良影响。</p><p>想到是老婆的重要工程，我更不敢怠慢了。因为在家里，哪次口舌之争我有赢过？况且财政大权在她控制着，还要不要活路？混了这么久，总算明���了一个道理：在家靠老婆，在外靠领导。</p><blockquote><p>04</p></blockquote><p>我为自己离开会场去完成老婆的重要工程而得意，便加快了脚步，小跑着到单位门口。高高挂在空中的太阳暖融融地照在我身上，让我心情很舒朗。</p><p>单位门口就是大街，此时的大街上车来车往，小学生放学了，不少机关单位的家长都偷溜出来接小孩。</p><p>还好，我们家的宝贝女儿托管了，免去了中午这趟接送，我在处里腰杆也更直了点。天天偷偷摸摸地溜出来接送小孩，处长虽然嘴里不说，心里不高兴，脸上不表现而已。关键的时候肯定会摇摆，比如像今天这样的评先评优，他也许就不会投你了。</p><p>看来，我们的做法是英明的。</p><p>快递小哥怎么还不见啊。可能在路上吧，他们为了提高效率，往往都是没到之前打电话。我心里想，眼巴巴地站在那里等了五分钟。</p><p>不行，会议室还要去投票。</p><p>打电话催他。我突然醒悟过来。</p><p>“再二百米就到了。”快递小哥啪地挂下电话了。</p><p>在路上，电话里怎么那么安静呢？我有些孤疑。</p><p>我踮脚引颈朝着单位大门两边张望。这一张望，又是五分钟过去了，可哪有快递小哥的影子。</p><p>手机震了一下，黄骅给我发来微信：关键时刻到了，兄弟在哪里呢？</p><blockquote><p>05</p></blockquote><p>我急急地回过去：门口取快递。</p><p>再打快递小哥电话，他居然掐了。我再打，无人接听了，这个家伙，难道出车祸了？我不敢去细想了。</p><p>不管了，还是先去会议室吧。我折回头。</p><p>走到电梯口，门一开就见到黄骅了，我问他下楼干嘛，不是开会吗？他说，取快递去，会议结束了。</p><p>办公室里，陈步淦专心致志地盘着手串，包浆起得不错了。张坚贞举着报纸，远远地看着。</p><p>见我回来，陈步淦放慢了盘手串的动作，说，小虬，我是投了你的票啦，没有功劳也有苦劳，要记住哥的好。</p><p>张坚贞放下报纸，说，这次有点遗憾，三年连续就差你自己投自己的那一票。</p><p>我已经明白我被淘汰了，心情有些沮丧。但嘴上还是跟着两位大哥说谢谢，说大恩不忘。</p><p>我大口大口地喝着水，心情逐渐平静下来了。我越想越觉得那个快递的蹊跷。</p><p>问了老婆，老婆说这几天真没败家网购。</p><p>黄骅满面春风地回来了，办公室突然地静了下来，大家都不说话，空气像凝了起来。</p><p>黄骅作为胜利者，可能考虑到我心情，进来一下就串门去了。没多久，饭点到，陈步淦、张坚贞去食堂吃饭了。</p><p>我没有心情吃饭，想着这个蹊跷的快递，越来越觉得快递小哥的声音有些熟悉，似乎在哪里有听过。</p><blockquote><p>06</p></blockquote><p>对，我想起来，这不是黄骅一个卖保险的朋友吗？去年来我们办公室推销过保险，还给我们留了名片，我没买，把他的名片顺手塞进抽屉里了。</p><p>我把办公桌的抽屉翻了个底朝天，终于找到了他的名片，这家伙叫班雄，电话号码是18907560637。没错，刚才打我的电话就是这个。</p><p>我简直不敢相信。为了进一步证实，我有了主意。我走到黄骅的办公桌上，用他的座机拨通了班雄的电话。</p><p>骅哥有什么新指示？今天的事办得满意吧？我还没说话，班雄就阴阳怪气地开口了。</p><p>谢兄弟了。我学着黄骅的腔调说。</p><p>小事一桩，有事尽管交待。</p><p>我全明白了。黄骅这家伙事先和班雄串通好，在投票关键的时候，用取快递的招数把我支开，我傻乎乎地往套里钻。</p><p>他表面和我心连心，背后在跟我玩脑筋。</p><p>他是最聪明的人，我是最愚蠢的人。我自己责骂我自己。</p><p>这时，门口传来了黄骅和刘芳的说笑声。他们吃完饭回来，准备回各自的办公室午休。</p><p>祝贺你啊。刘芳对黄骅说。</p><p>都是你们支持的结果，谢谢咯。</p><p>黄骅说着，背着手，摇头晃脑地走进了办公室。</p><p><a href=\"https://www.jianshu.com/p/bda7cf3f71c0\" target=\"_blank\">职场小说征文</a></p>\n          ', '2018/04/15 10:03', 2, 1304, 2453, 'https://upload-images.jianshu.io/upload_images/4920384-6bc579f414e77708.jpg', '');

-- --------------------------------------------------------

--
-- 表的结构 `maction`
--

CREATE TABLE `maction` (
  `Eaid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '动态号',
  `Ukey` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '链接',
  `Rvalue` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '内容',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Htype` int(11) NOT NULL COMMENT '动态类型',
  `Bdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '动态日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `maction`
--

INSERT INTO `maction` (`Eaid`, `Ukey`, `Rvalue`, `Vaccount`, `Htype`, `Bdate`) VALUES
('12532d36e4da0b5cf4524003', '0b5cf4524003', '机器学习研究人员需要了解的8个神经网络架构（上）', '12532d36e4da', 2, '2018-04-17 11:10'),
('12532d36e4da0dc3192bea0a', '0dc3192bea0a', 'TensorFlow新功能：TensorFlow Probabi', '12532d36e4da', 2, '2018-04-16 10:51'),
('12532d36e4da19878aab9f1f', '19878aab9f1f', '佛系程序员的月薪五万指南', '12532d36e4da', 2, '2018-04-12 10:18'),
('12532d36e4da238d345ae40d', '238d345ae40d', '一篇深度学习论文背后的大规模在线协作', '12532d36e4da', 2, '2018-04-17 15:08'),
('12532d36e4da28bb5371a7c0', '28bb5371a7c0', '昔日骑三轮送货的夫妻去了米兰时装周，小作坊也有突围路', '12532d36e4da', 2, '2018-04-13 17:48'),
('12532d36e4da2adc963044bb', '2adc963044bb', '再谈全局网HBase八大应用场景', '12532d36e4da', 2, '2018-04-11 15:59'),
('12532d36e4da310e18422731', '310e18422731', '阿里云推区块链解决方案，支持天猫奢侈品正品溯源', '12532d36e4da', 2, '2018-04-13 18:05'),
('12532d36e4da40a01828e70a', '40a01828e70a', '让科技更有温度！2018阿里云年会全纪录', '12532d36e4da', 2, '2018-04-13 14:45'),
('12532d36e4da4dff81b48d5f', '4dff81b48d5f', '如何用区块链技术解决信任问题？Fabric 架构深度解读', '12532d36e4da', 2, '2018-04-12 13:24'),
('12532d36e4da513e11ec9f6f', '513e11ec9f6f', '理解递归神经网络-part1', '12532d36e4da', 2, '2018-04-16 14:38'),
('12532d36e4da5fac2a2b74ff', '5fac2a2b74ff', 'Python实践：seaborn的散点图矩阵（Pairs Plo', '12532d36e4da', 2, '2018-04-13 14:10'),
('12532d36e4da65c88b7f3e28', '65c88b7f3e28', '阿里巴巴陈博兴：单天翻译词量超过千亿的秘密', '12532d36e4da', 2, '2018-04-12 12:18'),
('12532d36e4da87134ee453e5', '87134ee453e5', '如何快速掌握Python数据采集与网络爬虫技术', '12532d36e4da', 2, '2018-04-12 14:28'),
('12532d36e4da98c5e97eb156', '98c5e97eb156', '浅谈人工智能芯片（一）-- 深度神经网络和NVidia GPU的', '12532d36e4da', 2, '2018-04-13 17:03'),
('12532d36e4da9fd3d99656ff', '9fd3d99656ff', '深度学习精要之CapsuleNets理论与实践（附Python代', '12532d36e4da', 2, '2018-04-16 16:06'),
('12532d36e4daabc27c975d39', 'abc27c975d39', '机器学习研究人员需要了解的8个神经网络架构（下）', '12532d36e4da', 2, '2018-04-17 13:29'),
('12532d36e4daacee465ba359', 'acee465ba359', '论文解读：华盛顿大学教授Pedro Domingos技术论文：机', '12532d36e4da', 2, '2018-04-17 16:01'),
('12532d36e4dabf1476187073', 'bf1476187073', '如何利用神经网络进行反欺诈！', '12532d36e4da', 2, '2018-04-16 09:41'),
('12532d36e4daed1294c41c20', 'ed1294c41c20', '改变你对世界看法的五大计算机视觉技术', '12532d36e4da', 2, '2018-04-16 13:24'),
('12532d36e4dafa114fdd770f', 'fa114fdd770f', '基于scikit-learn机器学习库的分类预测', '12532d36e4da', 2, '2018-04-17 17:16'),
('14ea11f850f3', '', '暖动师妹专属｜作家小隐回复普通小白写作常见问题', '14ea11f850f3', 4, '2018-04-16 20:09'),
('14ea11f850f307e41dbd9727', '07e41dbd9727', '【简书交友】：推荐一位汉服小姐姐', '14ea11f850f3', 1, '2018-04-17 17:51'),
('14ea11f850f30ea5a9740dfb', '0ea5a9740dfb', '暖动师妹专属｜作家小隐回复普通小白写作常见问题', '14ea11f850f3', 2, '2018-04-16 00:17'),
('14ea11f850f320f7f4031550', '20f7f4031550', '社会热点', '14ea11f850f3', 3, '2018-04-17 10:19'),
('14ea11f850f33221081f26d5', '3221081f26d5', '希望更多人来帮助我师兄的母亲', '14ea11f850f3', 1, '2018-04-15 18:33'),
('14ea11f850f343a1490b15c0', '43a1490b15c0', '曾经我就是产房外的那条狗啊', '14ea11f850f3', 1, '2018-04-15 13:09'),
('14ea11f850f37482d97e5953', '7482d97e5953', '燕南飞，千里文缘一线牵', '14ea11f850f3', 1, '2018-04-17 17:50'),
('14ea11f850f38372e4abcc3b', '8372e4abcc3b', '自媒体写作时代，如何打造个人IP品牌logo？', '14ea11f850f3', 1, '2018-04-17 08:49'),
('14ea11f850f385f8180c0e35', '85f8180c0e35', '寸铁千元征文 | 你的大声，影响的岂止几多尊贵的灵魂', '14ea11f850f3', 1, '2018-04-16 15:18'),
('14ea11f850f397f019e639bd', '97f019e639bd', '读懂懂日记的启发（一）', '14ea11f850f3', 1, '2018-04-15 18:36'),
('14ea11f850f3a2e12d8733d7', 'a2e12d8733d7', '让我遇见你', '14ea11f850f3', 1, '2018-04-15 13:44'),
('14ea11f850f3ac732b497fe4', 'ac732b497fe4', '当雷锋遇见雷锋，有血有肉有故事', '14ea11f850f3', 1, '2018-04-17 12:54'),
('14ea11f850f3b0a7c7a2ee9e', 'b0a7c7a2ee9e', '奔跑吧，正能量', '14ea11f850f3', 1, '2018-04-15 18:05'),
('14ea11f850f3ce4ebcfa3388', 'ce4ebcfa3388', '素十安', '14ea11f850f3', 0, '2018-04-17 17:51'),
('14ea11f850f3d92647e6d779', 'd92647e6d779', '【专访】与君成悦:最美的妻、最才的女、最虎的妈', '14ea11f850f3', 1, '2018-04-15 13:45'),
('14ea11f850f3f6e9ab4fa152', 'f6e9ab4fa152', '《简书有个骗子名字小桃慕雨》', '14ea11f850f3', 1, '2018-04-17 14:53'),
('21a7a893f4b7', '', '摄影，就是用镜头看世界啊', '21a7a893f4b7', 4, '2018-04-16 18:41'),
('21a7a893f4b74af1f2c08060', '4af1f2c08060', 'beautygirl集中营', '21a7a893f4b7', 0, '2018-04-16 20:13'),
('27e866de5623', '', '李敖：写作不要灵感，接客不靠性欲', '27e866de5623', 4, '2018-04-16 12:32'),
('27e866de562301ba1b5799ed', '01ba1b5799ed', '要做问题解决者，而非制造者', '27e866de5623', 2, '2018-04-11 21:28'),
('27e866de562306869f16b748', '06869f16b748', '2018，微商呈现出哪些趋势？', '27e866de5623', 2, '2018-04-15 22:56'),
('27e866de5623fb3c8421ad0d', 'fb3c8421ad0d', '本是微商生，相煎何太急？', '27e866de5623', 2, '2018-04-13 21:48'),
('2b3ad4f2a058', '', '击败北大才子，外卖小哥的诗与远方', '2b3ad4f2a058', 4, '2018-04-16 21:08'),
('2b3ad4f2a0586e67b0c70986', '6e67b0c70986', '44岁的维多利亚，她凭什么活出所有女人的梦想？', '2b3ad4f2a058', 2, '2018-04-17 11:41'),
('38071932f1e6', '', '早安', '38071932f1e6', 4, '2018-04-16 09:29'),
('38071932f1e611a7141c5b8a', '11a7141c5b8a', '至简小诗39〔春夜未暖〕', '38071932f1e6', 1, '2018-04-15 20:14'),
('38071932f1e62226da1fabc9', '2226da1fabc9', '茫茫人海中，我们终究只是别人生命里的过客', '38071932f1e6', 1, '2018-04-15 20:09'),
('38071932f1e622d5ef4199f2', '22d5ef4199f2', '风过处，万叶千声', '38071932f1e6', 1, '2018-04-15 20:13'),
('38071932f1e688a1f7923991', '88a1f7923991', '童话｜辛迪的小房子', '38071932f1e6', 1, '2018-04-15 20:07'),
('38071932f1e6a644b8cda8d7', 'a644b8cda8d7', '早安', '38071932f1e6', 1, '2018-04-16 09:29'),
('38071932f1e6f95ac4f915cd', 'f95ac4f915cd', '四月/想念您的文字', '38071932f1e6', 1, '2018-04-15 20:10'),
('38071932f1e6f9c738d71cad', 'f9c738d71cad', '（浪子讲故事）香消玉殒', '38071932f1e6', 1, '2018-04-15 20:15'),
('384c2f242cdb', '', '【童话】熊猫学艺', '384c2f242cdb', 4, '2018-04-15 19:27'),
('384c2f242cdb0a600da257d7', '0a600da257d7', '蜗牛的旅行', '384c2f242cdb', 1, '2018-04-13 20:22'),
('384c2f242cdb14cc430a64ea', '14cc430a64ea', '礼物', '384c2f242cdb', 2, '2018-04-14 14:41'),
('384c2f242cdb182798fa08f0', '182798fa08f0', '神奇的钙片', '384c2f242cdb', 1, '2018-04-13 20:22'),
('384c2f242cdb19e4acd9225b', '19e4acd9225b', '一双翅膀', '384c2f242cdb', 1, '2018-04-13 20:22'),
('384c2f242cdb45ef9844d7ff', '45ef9844d7ff', '【童话】熊猫学艺', '384c2f242cdb', 1, '2018-04-15 19:26'),
('384c2f242cdb78e0d8c004ec', '78e0d8c004ec', '梦想的阶梯', '384c2f242cdb', 3, '2018-04-15 08:38'),
('384c2f242cdb9050168a5d15', '9050168a5d15', '礼物｜一封陌生女子的来信', '384c2f242cdb', 1, '2018-04-15 12:14'),
('384c2f242cdb90a5e258788e', '90a5e258788e', '老人的礼物', '384c2f242cdb', 1, '2018-04-14 16:45'),
('384c2f242cdb92053dec2203', '92053dec2203', '320个闹钟', '384c2f242cdb', 1, '2018-04-13 20:22'),
('384c2f242cdbb6dce0fcd5db', 'b6dce0fcd5db', '原创儿童文学周刊180414 | 时间的旅行', '384c2f242cdb', 1, '2018-04-14 09:43'),
('384c2f242cdbbbd974edb451', 'bbd974edb451', '【儿童小说】凡小糕减肥', '384c2f242cdb', 1, '2018-04-13 20:22'),
('384c2f242cdbc03cf6a923cd', 'c03cf6a923cd', '偷走时间的怪兽', '384c2f242cdb', 1, '2018-04-13 20:21'),
('51995510ee0a', '', '你努力走过的路，每一步都算数', '51995510ee0a', 4, '2018-04-17 12:26'),
('604159f29174', '', '', '604159f29174', 0, '2018-04-16 18:10'),
('604159f291740a6b377d2470', '0a6b377d2470', '简书版权非虚构类作品出版推荐（一）', '604159f29174', 1, '2018-04-17 16:46'),
('604159f291740c3a66d836e3', '0c3a66d836e3', '大年初三｜《我们爱写日记》K歌嗨翻天', '604159f29174', 1, '2018-04-16 10:57'),
('604159f291742b818ffa395e', '2b818ffa395e', '贾母与王熙凤一一既用又防，恩威并施', '604159f29174', 1, '2018-04-16 12:04'),
('604159f291745f3670acbddc', '5f3670acbddc', '与小姐邂逅（上）', '604159f29174', 1, '2018-04-16 11:13'),
('604159f291749c8af4e59b09', '9c8af4e59b09', '【乡土】裸岸（78）', '604159f29174', 1, '2018-04-16 07:24'),
('604159f29174aba3f7dbd13b', 'aba3f7dbd13b', '如何在简书出版一本书（之一）', '604159f29174', 1, '2018-04-17 11:22'),
('61d710a4a0ce', '', '第一次读书会', '61d710a4a0ce', 4, '2018-04-16 12:50'),
('61d710a4a0ce0b66b3a84dab', '0b66b3a84dab', '走出绿荫之地，让心灵接受世界的阳光―读《大漠祭》有感', '61d710a4a0ce', 1, '2018-04-16 19:44'),
('61d710a4a0ce185acbf797fc', '185acbf797fc', '姗姗的杰作（二）', '61d710a4a0ce', 1, '2018-04-16 06:41'),
('61d710a4a0ce20b2a2920b0a', '20b2a2920b0a', '回忆与女儿一起成长的日子', '61d710a4a0ce', 1, '2018-04-16 06:45'),
('61d710a4a0ce5d70b286fa65', '5d70b286fa65', '致DYH:今生，你欠我一个解释', '61d710a4a0ce', 1, '2018-04-16 07:07'),
('61d710a4a0cea7d2de5528ea', 'a7d2de5528ea', '武汉之行', '61d710a4a0ce', 1, '2018-04-16 06:40'),
('61d710a4a0cec119a9238b33', 'c119a9238b33', '＃芯莹语录＃《寄望》', '61d710a4a0ce', 1, '2018-04-16 06:46'),
('61d710a4a0cec5ed1ae40328', 'c5ed1ae40328', '遇上罗嗦的老板是什么滋味', '61d710a4a0ce', 1, '2018-04-16 06:41'),
('61d710a4a0cecb06cd0e78ec', 'cb06cd0e78ec', '经典电影（十二）《卡萨布兰卡》世上酒馆千千万，你却走进这一家', '61d710a4a0ce', 1, '2018-04-16 06:49'),
('61d710a4a0cedbdbeec00cf9', 'dbdbeec00cf9', '致HY:思念', '61d710a4a0ce', 1, '2018-04-16 08:12'),
('61d710a4a0ceea9e8426ab87', 'ea9e8426ab87', '【开心乐乐】简书里哪有美女？都是老妇女！', '61d710a4a0ce', 1, '2018-04-16 06:41'),
('6e176873807c', '', '刘若英把《后来》拍成电影，你怎么看哭了？', '6e176873807c', 4, '2018-04-15 17:21'),
('6e176873807c1d5427854768', '1d5427854768', '“给你200块，今天你陪孩子写作业”“我给你300块！”', '6e176873807c', 2, '2018-04-10 11:44'),
('6e176873807c668182b01aff', '668182b01aff', '女朋友约会要喝15块的奶茶，太费钱了！', '6e176873807c', 2, '2018-04-07 10:18'),
('6e176873807ca64529b4ccf3', 'a64529b4ccf3', '刘若英把《后来》拍成电影，你怎么看哭了？', '6e176873807c', 2, '2018-04-11 11:25'),
('6e176873807cd3ff960cb89e', 'd3ff960cb89e', '男人走路的姿势，暴露了爱你的程度', '6e176873807c', 2, '2018-04-09 09:37'),
('6e176873807ce2eb650f052d', 'e2eb650f052d', '2018想法精选', '6e176873807c', 3, '2018-04-17 01:13'),
('778731a5f6fc', '', '寸铁千元征文｜悟空', '778731a5f6fc', 4, '2018-04-16 20:05'),
('778731a5f6fc0d12ffb3f03b', '0d12ffb3f03b', '《边城》：一面渡船，一面等你', '778731a5f6fc', 1, '2018-04-17 17:21'),
('778731a5f6fc14fe8c66fd96', '14fe8c66fd96', 'Grievanceroar No.08', '778731a5f6fc', 1, '2018-04-16 19:53'),
('778731a5f6fc2fce29516198', '2fce29516198', '【家庭伦理】暗涌（54）', '778731a5f6fc', 1, '2018-04-16 20:03'),
('778731a5f6fc478540deafac', '478540deafac', '浅论妨害写作者的“兰亭魔咒”', '778731a5f6fc', 1, '2018-04-16 19:55'),
('778731a5f6fc4d9e6bd4e056', '4d9e6bd4e056', '[职场理想国五号征文]董卿卿的素颜', '778731a5f6fc', 1, '2018-04-16 17:17'),
('778731a5f6fc5d6e0b7b29fc', '5d6e0b7b29fc', '机场百态', '778731a5f6fc', 1, '2018-04-16 20:03'),
('778731a5f6fc793e66f89a5a', '793e66f89a5a', '风车里的童年', '778731a5f6fc', 1, '2018-04-17 17:13'),
('778731a5f6fc87893de1978e', '87893de1978e', '《时间旅行者的妻子》/我一次又一次地穿越时空，只为爱你', '778731a5f6fc', 1, '2018-04-16 20:06'),
('778731a5f6fc952c3ee2f714', '952c3ee2f714', '遇见', '778731a5f6fc', 1, '2018-04-17 17:15'),
('778731a5f6fc969bf1c2c819', '969bf1c2c819', '聊一句《论语》', '778731a5f6fc', 1, '2018-04-16 19:51'),
('778731a5f6fcaef83f2747e7', 'aef83f2747e7', '分享一张图', '778731a5f6fc', 1, '2018-04-16 19:55'),
('778731a5f6fcb2c28b69a049', 'b2c28b69a049', '《月下小景》：我已坐在天堂门边', '778731a5f6fc', 1, '2018-04-17 17:18'),
('778731a5f6fcd1402064190d', 'd1402064190d', '寸铁千元征文丨漂亮姑娘嫁个痴呆汉', '778731a5f6fc', 1, '2018-04-16 19:58'),
('778731a5f6fce4c12c63e6a0', 'e4c12c63e6a0', '寸铁千元征文｜悟空', '778731a5f6fc', 1, '2018-04-16 20:04'),
('778731a5f6fcf25fa85def46', 'f25fa85def46', '【职业理想国五号征文】冤家路窄', '778731a5f6fc', 1, '2018-04-16 20:03'),
('778731a5f6fcf65790e2a028', 'f65790e2a028', '【职场小说】第5期征文 |取快递', '778731a5f6fc', 1, '2018-04-16 19:58'),
('81310278129d', '', '母女相见', '81310278129d', 4, '2018-04-16 21:09'),
('81310278129d0e79dde15e5a', '0e79dde15e5a', '四月|爱，在微笑咖啡馆', '81310278129d', 1, '2018-04-17 14:44'),
('81310278129d0ffa1eafb35d', '0ffa1eafb35d', '我丢失了自己的喜悦感', '81310278129d', 1, '2018-04-17 14:52'),
('81310278129d132beb50a61e', '132beb50a61e', '母女相见', '81310278129d', 1, '2018-04-16 21:09'),
('81310278129d23bcbd207a9b', '23bcbd207a9b', '《妈妈是超人》第三季：我们每天烦恼的育儿问题，明星妈妈们也有', '81310278129d', 1, '2018-04-16 19:00'),
('81310278129d2abb605d6be9', '2abb605d6be9', '[历史]林云传说(62)', '81310278129d', 1, '2018-04-16 18:54'),
('81310278129d3cca3212007b', '3cca3212007b', '开心一刻‖我和你没完', '81310278129d', 1, '2018-04-17 16:08'),
('81310278129d43234f1527b0', '43234f1527b0', '寸铁千元征文|谢谢你，依然爱着我', '81310278129d', 1, '2018-04-17 18:14'),
('81310278129d4d7b7f94fa92', '4d7b7f94fa92', '寸铁千元征文  |  飞鸟与老苹果树', '81310278129d', 1, '2018-04-17 15:12'),
('81310278129d52600fe83b35', '52600fe83b35', '【奇幻武侠】  君道（目录）', '81310278129d', 1, '2018-04-17 18:12'),
('81310278129d5c0aa674b9d4', '5c0aa674b9d4', '【武侠】月竹岛 （57）', '81310278129d', 1, '2018-04-16 18:23'),
('81310278129d600193ddadf1', '600193ddadf1', '童话｜不想做蜗牛的壳壳', '81310278129d', 1, '2018-04-17 16:07'),
('81310278129d7e2e4bf98f3c', '7e2e4bf98f3c', '【情感】等我老了，陪你走天涯（35）', '81310278129d', 1, '2018-04-17 14:41'),
('81310278129d81ad6f009434', '81ad6f009434', '寸铁千元征文|化蝶记', '81310278129d', 1, '2018-04-16 17:35'),
('81310278129d85be833edcfe', '85be833edcfe', '不断前行，才是最美好的风景', '81310278129d', 1, '2018-04-16 18:23'),
('81310278129d916fca6b1050', '916fca6b1050', '【365点评活动】大一班优秀文章赏析', '81310278129d', 1, '2018-04-16 18:56'),
('81310278129da15f56514e1e', 'a15f56514e1e', '我迷醉在江南小巷', '81310278129d', 1, '2018-04-17 17:39'),
('81310278129dc95b572e0f92', 'c95b572e0f92', '全职太太养成记（5）', '81310278129d', 1, '2018-04-17 18:14'),
('81310278129dcc6d8032102c', 'cc6d8032102c', '【情感】夜·一点一点深沉（89）', '81310278129d', 1, '2018-04-17 14:47'),
('81310278129de11dfd21ac04', 'e11dfd21ac04', '玛瑙劫｜番外一：尘生（3）', '81310278129d', 1, '2018-04-17 16:19'),
('81310278129df91973a2ead8', 'f91973a2ead8', '隋心_', '81310278129d', 0, '2018-04-17 16:27'),
('81310278129dfe8c9eaec0a0', 'fe8c9eaec0a0', '故事烩29‖看风雨过后，花成殇', '81310278129d', 1, '2018-04-17 17:40'),
('8c55431ed909', '', '我采访了13个90后同龄人，他们现在混得怎么样了', '8c55431ed909', 4, '2018-04-16 19:51'),
('8c55431ed9090bbc80b583e7', '0bbc80b583e7', '以文艺的情怀，寻觅有故事的上海弄堂', '8c55431ed909', 1, '2018-04-17 00:56'),
('8c55431ed9091f82954c5732', '1f82954c5732', '【花开的行走】玻利维亚DAY14：寻访民族舞蹈之Morenada', '8c55431ed909', 1, '2018-04-14 09:45'),
('8c55431ed9092514427e6fa7', '2514427e6fa7', '黑白，掺着少于的宁静', '8c55431ed909', 1, '2018-04-15 02:12'),
('8c55431ed9092c8b494b31fd', '2c8b494b31fd', '简书优秀文章', '8c55431ed909', 3, '2018-04-16 08:31'),
('8c55431ed90948a19767b958', '48a19767b958', '毕业照你想好怎么拍了吗？我这里有32个想法', '8c55431ed909', 1, '2018-04-17 09:48'),
('8c55431ed9095d4926d2475c', '5d4926d2475c', '摄影丨美是猝不及防的遇见', '8c55431ed909', 1, '2018-04-17 09:50'),
('8c55431ed90967df65b7cd66', '67df65b7cd66', '2015南疆自驾（十一）石头城  塔什库尔干  红其拉普  边境', '8c55431ed909', 1, '2018-04-15 02:13'),
('8c55431ed90992d20bc60613', '92d20bc60613', '那些还在用力生活的人们的样子', '8c55431ed909', 1, '2018-04-15 02:01'),
('8c55431ed909a47e7a578c6e', 'a47e7a578c6e', '一万种少年', '8c55431ed909', 0, '2018-04-15 21:19'),
('8c55431ed909b8fdbdd98f1a', 'b8fdbdd98f1a', '管呆', '8c55431ed909', 0, '2018-04-15 02:01'),
('8c55431ed909f9a7828e095f', 'f9a7828e095f', '分享丨大学两年，我成了旅行体验师和试睡师，靠写作实现经济独立。', '8c55431ed909', 1, '2018-04-15 21:19'),
('8c55431ed909fdf74ddc9759', 'fdf74ddc9759', '母亲的独居生活。', '8c55431ed909', 1, '2018-04-16 09:55'),
('9019674f5808', '', '如果你也生于1995年', '9019674f5808', 4, '2018-04-17 14:52'),
('9617ac822dc6', '', '寸铁千元征文‖爸爸是个什么鬼', '9617ac822dc6', 4, '2018-04-17 17:20'),
('9617ac822dc603ec73a53883', '03ec73a53883', '《赞》', '9617ac822dc6', 1, '2018-04-17 15:17'),
('9617ac822dc60cd1c098e37d', '0cd1c098e37d', '寸铁千元征文‖爸爸是个什么鬼', '9617ac822dc6', 2, '2018-04-17 15:52'),
('9617ac822dc61e9507ab77b9', '1e9507ab77b9', '扈三娘的孩子到底是谁的？', '9617ac822dc6', 1, '2018-04-17 16:39'),
('9617ac822dc630e2e476818d', '30e2e476818d', '【悬疑】睁大你的眼第二季（29）', '9617ac822dc6', 1, '2018-04-17 15:17'),
('9617ac822dc6369aea1f683b', '369aea1f683b', '助兴《老怪闲语*狐仙》一诗，即兴和诗一首:', '9617ac822dc6', 1, '2018-04-17 15:17'),
('9617ac822dc6c4c9d8c121a2', 'c4c9d8c121a2', '命的变奏|三行', '9617ac822dc6', 1, '2018-04-17 16:38'),
('9617ac822dc6dcf102d58fec', 'dcf102d58fec', '靓女(打油诗)', '9617ac822dc6', 1, '2018-04-17 15:17'),
('9617ac822dc6de4bbac8ae12', 'de4bbac8ae12', '助兴《老怪闲语*转世》一诗，即兴和诗一首。', '9617ac822dc6', 1, '2018-04-17 15:17'),
('a7f876850fa6', '', '《老怪闲语◎转世》', 'a7f876850fa6', 4, '2018-04-16 19:56'),
('a7f876850fa61d993c7837cb', '1d993c7837cb', '一只猫的乡愁', 'a7f876850fa6', 1, '2018-04-16 17:05'),
('a7f876850fa62a3d52646760', '2a3d52646760', '猫咪的检讨书', 'a7f876850fa6', 1, '2018-04-16 17:01'),
('a7f876850fa64d69edaf4afb', '4d69edaf4afb', '春赏花，与君付年华', 'a7f876850fa6', 1, '2018-04-16 16:58'),
('a7f876850fa667ab4ef4c94b', '67ab4ef4c94b', '《老怪闲语◎海宴》', 'a7f876850fa6', 1, '2018-04-16 17:37'),
('a7f876850fa678ee39373cae', '78ee39373cae', '因你而来', 'a7f876850fa6', 1, '2018-04-17 12:50'),
('a7f876850fa67f942475c5cf', '7f942475c5cf', '张歪瓜与毛驴(小小说)', 'a7f876850fa6', 1, '2018-04-17 10:28'),
('a7f876850fa682774e1e9bc9', '82774e1e9bc9', '嘿嘿……', 'a7f876850fa6', 1, '2018-04-17 15:35'),
('a7f876850fa68bfef679363f', '8bfef679363f', '故乡的往事', 'a7f876850fa6', 1, '2018-04-17 12:51'),
('a7f876850fa68d5c3e6da8b4', '8d5c3e6da8b4', '三行诗', 'a7f876850fa6', 1, '2018-04-17 09:24'),
('a7f876850fa693ee3d5bbe9e', '93ee3d5bbe9e', '一个关于文字的隐喻', 'a7f876850fa6', 1, '2018-04-17 12:49'),
('a7f876850fa6a6a4a3fba970', 'a6a4a3fba970', '《老怪闲语◎转世》', 'a7f876850fa6', 1, '2018-04-16 19:46'),
('a7f876850fa6ab4d51b2b308', 'ab4d51b2b308', '七绝.无题', 'a7f876850fa6', 1, '2018-04-17 17:07'),
('a7f876850fa6b088a98bd2ca', 'b088a98bd2ca', '《老怪闲语◎思》', 'a7f876850fa6', 1, '2018-04-16 17:59'),
('a7f876850fa6c0262cfc0c8d', 'c0262cfc0c8d', '送春', 'a7f876850fa6', 1, '2018-04-17 12:48'),
('a7f876850fa6c0a0c091cd9d', 'c0a0c091cd9d', '《老怪闲语◎赞》', 'a7f876850fa6', 1, '2018-04-17 11:53'),
('a7f876850fa6eef710bab559', 'eef710bab559', '七律·观《古诗词大赛》', 'a7f876850fa6', 1, '2018-04-16 16:57'),
('c0df9f7c15fa09af01db4cb6', '09af01db4cb6', '程序猿职场心理学，教你三进三出“斩”HR拿offer（跳槽必看）', 'c0df9f7c15fa', 2, '2018-04-13 21:51'),
('c0df9f7c15fa0ae96f26f3bc', '0ae96f26f3bc', '聊聊面试中关于并发问题的应对方案', 'c0df9f7c15fa', 2, '2018-04-09 21:45'),
('c0df9f7c15fa173d09bfdbe1', '173d09bfdbe1', '阿里架构师：​程序员必须掌握的几项技术能力', 'c0df9f7c15fa', 2, '2018-04-14 22:02'),
('c0df9f7c15fa1d2b61da81ad', '1d2b61da81ad', 'SpringFramework', 'c0df9f7c15fa', 3, '2018-04-06 23:06'),
('c0df9f7c15fa245d363ceda4', '245d363ceda4', 'java面试题', 'c0df9f7c15fa', 3, '2018-04-06 23:22'),
('c0df9f7c15fa32630a2eb949', '32630a2eb949', '聊聊一线互联网公司中并发编程的那些事（内含源码及面试题）', 'c0df9f7c15fa', 2, '2018-04-13 16:38'),
('c0df9f7c15fa38dd7fc9033a', '38dd7fc9033a', '饥人谷技术博客', 'c0df9f7c15fa', 3, '2018-04-06 23:06'),
('c0df9f7c15fa4fae4703f656', '4fae4703f656', '作为程序员的一些感悟：毁掉我们的不是我们所憎恨的东西，而恰恰是我', 'c0df9f7c15fa', 2, '2018-04-10 16:56'),
('c0df9f7c15fa4fe4b2b8dcca', '4fe4b2b8dcca', '为什么软件开发，人多，事少，还会工作量大？', 'c0df9f7c15fa', 2, '2018-04-10 14:59'),
('c0df9f7c15fa6efe44f14b18', '6efe44f14b18', '你和阿里资深架构师之间，差的不仅仅是年龄（进阶必看）', 'c0df9f7c15fa', 2, '2018-04-12 21:13'),
('c0df9f7c15fa7280ff526471', '7280ff526471', '干货：Java并发编程系列之volatile（一）', 'c0df9f7c15fa', 2, '2018-04-11 20:53'),
('c0df9f7c15fa80095043c2b3', '80095043c2b3', '记一次惨烈的阿里面试经历', 'c0df9f7c15fa', 2, '2018-04-10 22:32'),
('c0df9f7c15fa83342f80f74e', '83342f80f74e', '干货：Java并发编程系列之synchronized（二）', 'c0df9f7c15fa', 2, '2018-04-12 14:33'),
('c0df9f7c15fa922151b9f5c6', '922151b9f5c6', 'spring 源码剖析', 'c0df9f7c15fa', 3, '2018-04-06 23:05'),
('c0df9f7c15fa98aaef9f5d2f', '98aaef9f5d2f', 'Kotlin', 'c0df9f7c15fa', 3, '2018-04-06 23:06'),
('c0df9f7c15faa6a0567f9037', 'a6a0567f9037', '阿里Java工程师理解的三种架构模型', 'c0df9f7c15fa', 2, '2018-04-16 21:21'),
('c0df9f7c15fab474a4e49f75', 'b474a4e49f75', '干货：Java并发编程必懂知识点解析', 'c0df9f7c15fa', 2, '2018-04-08 18:00'),
('c0df9f7c15fad17f216a9cd5', 'd17f216a9cd5', '聊聊程序员的职场“围城”，给出作为过来人的一些建议', 'c0df9f7c15fa', 2, '2018-04-14 16:17'),
('c0df9f7c15faf1f3b97678cf', 'f1f3b97678cf', '从1.6W名面试者中收集的Java面试题精选汇总（内附知识脑图）', 'c0df9f7c15fa', 2, '2018-04-08 22:19'),
('c0df9f7c15faf482bca282c5', 'f482bca282c5', 'IT技术干货栏——分享移动端&前端&后端编程从入门到高级', 'c0df9f7c15fa', 3, '2018-04-06 23:22'),
('cab027d5878e', '', '这是我在巴西见过最美的海！', 'cab027d5878e', 4, '2018-04-16 17:55'),
('cab027d5878e0f4c98c764f1', '0f4c98c764f1', '麻辣咸香的牛肉干', 'cab027d5878e', 1, '2018-04-17 16:44'),
('cab027d5878e0f4fa206f816', '0f4fa206f816', '［写作交流］改作比写作更重要', 'cab027d5878e', 1, '2018-04-15 17:36'),
('cab027d5878e237c16e42855', '237c16e42855', '简 书 首 部 影 视 版 权 卖 出 ！', 'cab027d5878e', 1, '2018-04-16 18:21'),
('cab027d5878e2d89d872dd73', '2d89d872dd73', '北大不需要女神', 'cab027d5878e', 1, '2018-04-15 17:31'),
('cab027d5878e7e50a31cb45f', '7e50a31cb45f', '揭示小桃慕雨这个骗子', 'cab027d5878e', 1, '2018-04-16 21:08'),
('cab027d5878e96fc2409b869', '96fc2409b869', '22天的南极之旅：虽败犹荣的沙克尔顿', 'cab027d5878e', 1, '2018-04-17 09:35'),
('cab027d5878eb34df0692733', 'b34df0692733', '晒一晒旅行路上，那些奇葩的食物', 'cab027d5878e', 1, '2018-04-17 10:38'),
('cab027d5878ebe5dbb6da1a2', 'be5dbb6da1a2', '美在心里', 'cab027d5878e', 1, '2018-04-15 18:37'),
('cab027d5878ecd9b4906ba44', 'cd9b4906ba44', '【环球238-241】麦德林，从地狱之城到天堂之都---哥伦比亚', 'cab027d5878e', 1, '2018-04-17 09:35'),
('cab027d5878ef6e9ab4fa152', 'f6e9ab4fa152', '《简书有个骗子名字小桃慕雨》', 'cab027d5878e', 1, '2018-04-16 21:08'),
('ce94d617e045', '', '【遇见】别山举水，一位有故事的散文人', 'ce94d617e045', 4, '2018-04-16 19:36'),
('ce94d617e0452b5a0f55953f', '2b5a0f55953f', '你千万不要见怪，长大本就是一个失去又得到的过程', 'ce94d617e045', 1, '2018-04-16 16:56'),
('ce94d617e045b0a6abb1aff8', 'b0a6abb1aff8', '关于“读写说”的六大法宝，掌握一个就赚了！', 'ce94d617e045', 1, '2018-04-17 09:48'),
('ce94d617e045b521600f4214', 'b521600f4214', '【遇见】别山举水，一位有故事的散文人', 'ce94d617e045', 2, '2018-04-15 07:38'),
('d0be5ae77914', '', '王小波：我一生的黄金时代', 'd0be5ae77914', 4, '2018-04-12 23:44'),
('d0be5ae779141fb7c005d095', '1fb7c005d095', '影帝古天乐：一个陪跑金像奖十年的“烂片之王”', 'd0be5ae77914', 2, '2018-04-16 16:18'),
('d3fd05d71dec', '', '‹给我未来傻姑娘的一封信›至少，你还有我', 'd3fd05d71dec', 4, '2018-04-17 15:56'),
('d3fd05d71deceb41681b8d1e', 'eb41681b8d1e', '予我的韩先生', 'd3fd05d71dec', 1, '2018-04-17 12:28'),
('d6875d11fafd', '', '国色天香映狼山', 'd6875d11fafd', 4, '2018-04-16 18:47'),
('d6875d11fafd0044f479fa20', '0044f479fa20', '中乙联赛第三轮长安竞技客场不敌吉林百嘉，问题究竟出在哪里？', 'd6875d11fafd', 1, '2018-04-15 21:10'),
('d6875d11fafd08494e0d4620', '08494e0d4620', '聊聊古希腊“德性”传统——读《柏拉图对话集》有感', 'd6875d11fafd', 1, '2018-04-17 12:26'),
('d6875d11fafd0a6b377d2470', '0a6b377d2470', '简书版权非虚构类作品出版推荐（一）', 'd6875d11fafd', 1, '2018-04-17 17:01'),
('d6875d11fafd18201985', '18201985', '混凝土干燥工艺（短篇小说集）', 'd6875d11fafd', 3, '2018-04-16 16:57'),
('d6875d11fafd23787906', '23787906', '如何从文学作品中提炼写作技巧——小麦谈写作2', 'd6875d11fafd', 3, '2018-04-17 15:25'),
('d6875d11fafd237c16e42855', '237c16e42855', '简 书 首 部 影 视 版 权 卖 出 ！', 'd6875d11fafd', 1, '2018-04-16 15:05'),
('d6875d11fafd3fae555fa8c6', '3fae555fa8c6', '第十一课：农民起义都是正义的吗？——秦末之乱', 'd6875d11fafd', 1, '2018-04-15 18:51'),
('d6875d11fafd45ab2aea4b42', '45ab2aea4b42', '我为什么建议你们多读书，少写作', 'd6875d11fafd', 1, '2018-04-17 15:25'),
('d6875d11fafd60f5ec1015d3', '60f5ec1015d3', '第十五课：英雄的探险家和利欲熏心的商人——汉通西域和丝绸之路', 'd6875d11fafd', 1, '2018-04-14 12:53'),
('d6875d11fafd61dac65ccf0b', '61dac65ccf0b', '老克勒', 'd6875d11fafd', 1, '2018-04-16 07:06'),
('d6875d11fafd79bf0fe9dacd', '79bf0fe9dacd', '第十四个马拉松：泰山马拉松完赛记', 'd6875d11fafd', 1, '2018-04-15 20:03'),
('d6875d11fafd8627550f5eff', '8627550f5eff', '你连自我都在逃避，还谈什么写作？', 'd6875d11fafd', 1, '2018-04-17 15:41'),
('d6875d11fafd899d3d220c10', '899d3d220c10', '如何写一篇优质付费短篇故事，这里有5条建议给你', 'd6875d11fafd', 1, '2018-04-16 16:11'),
('d6875d11fafd8d08bad66e55', '8d08bad66e55', '第三课：历史是否存在必然性？——夏、商、西周的兴亡', 'd6875d11fafd', 1, '2018-04-16 14:48'),
('d6875d11fafd914fb128e342', '914fb128e342', '寻觅宣教士的脚踪--“戴德生挚爱中华”游学募捐活动', 'd6875d11fafd', 1, '2018-04-16 15:06'),
('d6875d11fafd95297d7e927d', '95297d7e927d', '登步岛战役与登步人', 'd6875d11fafd', 1, '2018-04-16 15:41'),
('d6875d11fafd9607c7976e1c', '9607c7976e1c', '旸晓昆', 'd6875d11fafd', 0, '2018-04-16 16:58'),
('d6875d11fafd9cf3dfe69ae5', '9cf3dfe69ae5', 'Scalers', 'd6875d11fafd', 0, '2018-04-16 09:32'),
('d6875d11fafda78dc1dcd10d', 'a78dc1dcd10d', '谈写作：别让叙述人称出卖你', 'd6875d11fafd', 1, '2018-04-17 15:22'),
('d6875d11fafdab60fdd0bcf8', 'ab60fdd0bcf8', '今日更新', 'd6875d11fafd', 1, '2018-04-16 07:05'),
('d6875d11fafdaba3f7dbd13b', 'aba3f7dbd13b', '如何在简书出版一本书（之一）', 'd6875d11fafd', 2, '2018-04-17 11:20'),
('d6875d11fafdaf525ee57fa3', 'af525ee57fa3', '抄袭了解一下啊', 'd6875d11fafd', 1, '2018-04-14 13:00'),
('d6875d11fafdbf89f14185c2', 'bf89f14185c2', '《对岸》（21）冰箱里的男人-逃之夭夭', 'd6875d11fafd', 1, '2018-04-17 15:20'),
('d6875d11fafdc188db11e25e', 'c188db11e25e', '第十六课：人的尊严和祖宗无关——从造纸术到地动仪', 'd6875d11fafd', 1, '2018-04-16 14:36'),
('d6875d11fafdc836973b258a', 'c836973b258a', '《对岸》（20）冰箱里的男人-狂怒', 'd6875d11fafd', 1, '2018-04-17 15:16'),
('d6875d11fafdc8cd47c13168', 'c8cd47c13168', 'Scalers：自媒体信息污染对个人成长的干扰', 'd6875d11fafd', 1, '2018-04-16 09:33'),
('d6875d11fafddede5bc8fab3', 'dede5bc8fab3', '笨人何以不笨？', 'd6875d11fafd', 1, '2018-04-17 16:34'),
('d769c1e1ae16', '', '偷拍500张照片，我从世界上最魔幻的国家穿越归来', 'd769c1e1ae16', 4, '2018-04-16 15:40'),
('d769c1e1ae160c16d1ed2a06', '0c16d1ed2a06', '偷拍500张照片，我从世界上最魔幻的国家穿越归来', 'd769c1e1ae16', 2, '2018-04-13 16:00'),
('d769c1e1ae162cf3277f9b90', '2cf3277f9b90', '不够野的人别去古巴', 'd769c1e1ae16', 2, '2017-10-16 15:41'),
('d769c1e1ae1672d7d913d37e', '72d7d913d37e', '一个女同学和她睡过的10个青旅', 'd769c1e1ae16', 2, '2017-10-25 22:44'),
('d769c1e1ae167e4b5a95f83a', '7e4b5a95f83a', '南非 | 致���野与海洋', 'd769c1e1ae16', 2, '2017-05-21 13:48'),
('d769c1e1ae167edca791346c', '7edca791346c', '一个月只做一件事，我生活在东野圭吾笔下的温泉雪场', 'd769c1e1ae16', 2, '2018-03-11 11:11'),
('d769c1e1ae168d839460b6a2', '8d839460b6a2', '在日本这座海滨小城，度过像日剧一样的夏天', 'd769c1e1ae16', 2, '2017-12-04 23:10'),
('d769c1e1ae16c2145e5af77c', 'c2145e5af77c', '每晚3万元的私密袋鼠酒店，不只是一片南大洋的啪啪海浪', 'd769c1e1ae16', 2, '2018-03-24 10:09'),
('d769c1e1ae16d55262699f04', 'd55262699f04', '在与一百座城市的记忆里，我最喜欢你', 'd769c1e1ae16', 2, '2017-06-02 11:27'),
('d769c1e1ae16e2e2ca42149b', 'e2e2ca42149b', '穿越回百年前的英国乡间，那些在画廊做义工的日子', 'd769c1e1ae16', 2, '2017-11-16 00:44'),
('d769c1e1ae16e836ed60c75d', 'e836ed60c75d', '「你一个女孩子，为什么要去学这么危险的运动？」', 'd769c1e1ae16', 2, '2018-02-17 13:07'),
('d769c1e1ae16f85bcfdb6e11', 'f85bcfdb6e11', '中东土豪炫富的极致，是在阿布扎比造了一座卢浮宫', 'd769c1e1ae16', 2, '2018-01-29 09:14'),
('d8c6bb6cbe0c', '', '你不知道我曾经多么的爱你', 'd8c6bb6cbe0c', 4, '2018-04-16 21:01'),
('d8c6bb6cbe0c2704469e2b57', '2704469e2b57', '桑果变形计', 'd8c6bb6cbe0c', 1, '2018-04-16 08:33'),
('d8c6bb6cbe0c3d380ded6297', '3d380ded6297', '赏杜鹃', 'd8c6bb6cbe0c', 1, '2018-04-16 07:13'),
('d8c6bb6cbe0c8952e5f42e09', '8952e5f42e09', '读《三国志》—“谋主”法正', 'd8c6bb6cbe0c', 1, '2018-04-17 09:41'),
('d8c6bb6cbe0cedb81fcd0cb7', 'edb81fcd0cb7', '寸铁千元征文|歪嘴巴的爱情', 'd8c6bb6cbe0c', 1, '2018-04-17 15:51'),
('dbb14da93531', '', 'PS零基础入门课程——通道抠图、滤镜使用', 'dbb14da93531', 4, '2018-04-16 21:38'),
('dbb14da935310fb58bdfa1ce', '0fb58bdfa1ce', '我们终将一无所有，请记得好好疼惜自己', 'dbb14da93531', 1, '2018-04-17 08:34'),
('dbb14da935311b23cbbfe9dc', '1b23cbbfe9dc', '致我写过的文友们', 'dbb14da93531', 1, '2018-04-16 09:53'),
('dbb14da93531237c16e42855', '237c16e42855', '简 书 首 部 影 视 版 权 卖 出 ！', 'dbb14da93531', 1, '2018-04-16 19:01'),
('dbb14da935316baccf575d32', '6baccf575d32', 'PS零基础入门课程——通道抠图、滤镜使用', 'dbb14da93531', 1, '2018-04-16 21:38'),
('dbb14da935318372e4abcc3b', '8372e4abcc3b', '自媒体写作时代，如何打造个人IP品牌logo？', 'dbb14da93531', 2, '2018-04-17 08:40'),
('dbb14da93531909a8eb93641', '909a8eb93641', '通道抠图，滤镜使用', 'dbb14da93531', 1, '2018-04-17 07:58'),
('dbb14da93531a58a9ca88f47', 'a58a9ca88f47', '2018-04-16动画练习作业', 'dbb14da93531', 1, '2018-04-16 21:37'),
('dbb14da93531a9acb0336b25', 'a9acb0336b25', 'ps零基础入门课程——一寸照+下雨雪+动画制作', 'dbb14da93531', 1, '2018-04-17 13:13'),
('dbb14da93531b521600f4214', 'b521600f4214', '【遇见】别山举水，一位有故事的散文人', 'dbb14da93531', 1, '2018-04-16 18:57'),
('dbb14da93531ebc3b26dcd11', 'ebc3b26dcd11', '作业2——名片制作', 'dbb14da93531', 1, '2018-04-16 09:03'),
('deeea9e09cbc', '', '霍思燕：多少孩子被害了一辈子，都是因为父母不会这样做', 'deeea9e09cbc', 4, '2018-04-15 14:33'),
('deeea9e09cbc223093c5ba1c', '223093c5ba1c', '对待早餐的态度，藏着你人生的高度', 'deeea9e09cbc', 2, '2018-04-17 08:56'),
('deeea9e09cbc46979f537c29', '46979f537c29', '霍思燕：多少孩子被害了一辈子，都是因为父母不会这样做', 'deeea9e09cbc', 2, '2018-04-15 08:49'),
('f79de69d59e3', '', '寸铁千元征文‖爸爸是个什么鬼', 'f79de69d59e3', 0, '2018-04-17 17:13'),
('f79de69d59e30cd1c098e37d', '0cd1c098e37d', '寸铁千元征文‖爸爸是个什么鬼', 'f79de69d59e3', 1, '2018-04-17 17:10'),
('f79de69d59e357d4d209de5a', '57d4d209de5a', '寸铁千元征文|田埂', 'f79de69d59e3', 1, '2018-04-17 15:52'),
('f79de69d59e358712a643959', '58712a643959', '给简书创作者的25条干货', 'f79de69d59e3', 1, '2018-04-17 16:06'),
('f79de69d59e38dad76806518', '8dad76806518', '白圭之玷', 'f79de69d59e3', 1, '2018-04-17 15:42'),
('f79de69d59e396c23324afb8', '96c23324afb8', '一个回复', 'f79de69d59e3', 1, '2018-04-17 16:56'),
('f79de69d59e3b5b3cd5aa586', 'b5b3cd5aa586', '寸铁千元征文|起风了', 'f79de69d59e3', 1, '2018-04-17 15:42'),
('f79de69d59e3ba4e2b30ad91', 'ba4e2b30ad91', '我陪妈妈看世界~喀纳斯湖之约（新疆之旅）四', 'f79de69d59e3', 1, '2018-04-17 16:56'),
('f79de69d59e3cacd1a9b7362', 'cacd1a9b7362', '寸铁千元征文|今晚，我要偷走小猫猫', 'f79de69d59e3', 1, '2018-04-17 16:56'),
('f79de69d59e3e395a49c6924', 'e395a49c6924', '你为什么来简书，是爱是责任吗？', 'f79de69d59e3', 1, '2018-04-17 16:06'),
('f79de69d59e3eaaa3b786dc7', 'eaaa3b786dc7', '吸引力法则让我们拥有想要的生活', 'f79de69d59e3', 1, '2018-04-17 17:00'),
('fee4b4b0b89e', '', '你好，四月！时间可以浪费，人生不能！', 'fee4b4b0b89e', 4, '2018-04-17 17:19');

-- --------------------------------------------------------

--
-- 表的结构 `nblacklist`
--

CREATE TABLE `nblacklist` (
  `Tbid` int(11) NOT NULL COMMENT '黑名单号',
  `Hblackaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '黑名单账号',
  `Vaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `ohistory`
--

CREATE TABLE `ohistory` (
  `Chid` int(11) NOT NULL COMMENT '历史记录号',
  `Gaid` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Aaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Pdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '阅读日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `rsubfocus`
--

CREATE TABLE `rsubfocus` (
  `Vsfid` int(11) NOT NULL COMMENT '专题关注号',
  `Ksid` int(11) NOT NULL COMMENT '专题号',
  `Saccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `lrank` int(11) NOT NULL DEFAULT '0' COMMENT '排列顺序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `rsubfocus`
--

INSERT INTO `rsubfocus` (`Vsfid`, `Ksid`, `Saccount`, `lrank`) VALUES
(1, 1, '879646529', 0),
(2, 2, '879646529', 0),
(3, 3, '879646529', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ruser`
--

CREATE TABLE `ruser` (
  `Raccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Ipassword` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '登录密码',
  `Hnickname` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `Uhead` varchar(30) COLLATE utf8_bin DEFAULT 'kaiyan/head/default.jpg' COMMENT '用户头像',
  `Jbrief` varchar(48) COLLATE utf8_bin NOT NULL COMMENT '个人简介',
  `Hcountfocus` int(11) DEFAULT '0' COMMENT '关注数',
  `Kcountfans` int(11) DEFAULT '0' COMMENT '粉丝数',
  `Ycountlike` int(11) DEFAULT '0' COMMENT '喜欢数',
  `Xcountarticle` int(11) DEFAULT '0' COMMENT '文章数',
  `Ecountsubject` int(11) DEFAULT '0' COMMENT '专题数',
  `Rindexback` varchar(30) COLLATE utf8_bin DEFAULT 'kaiyan/index/default.jpg' COMMENT '主页背景',
  `Bcountwords` int(11) DEFAULT '0' COMMENT '总文字数',
  `Gcountliked` int(11) DEFAULT '0' COMMENT '被喜欢数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `ruser`
--

INSERT INTO `ruser` (`Raccount`, `Ipassword`, `Hnickname`, `Uhead`, `Jbrief`, `Hcountfocus`, `Kcountfans`, `Ycountlike`, `Xcountarticle`, `Ecountsubject`, `Rindexback`, `Bcountwords`, `Gcountliked`) VALUES
('/u/1d467fec1', 'YmQ4MWNlZjc2NGQxL3Uv', '\n    铃铛子\n ', 'kaiyan/head/default.jpg', '【欢迎加我为好友~】个人微信：lingdangzi520微信公众号：边奔跑边寻找淘宝店：铃铛子的', 30, 67254, 1, 201, 1, 'kaiyan/index/default.jpg', 121446, 37131),
('/u/1d7106f50', 'YTFlMDVmNjAxN2QxL3Uv', '\n    流失的青春', 'kaiyan/head/default.jpg', '一个普通人，喜欢文字，没有高大上的梦想，只想做自己。', 177, 741, 1, 83, 1, 'kaiyan/index/default.jpg', 122768, 3896),
('/u/2b3ad4f2a', 'ODUwYTJmNGRhM2IyL3Uv', '\n    麦大人\n ', 'kaiyan/head/default.jpg', '一个不务正业的文字爱好者，最会写娱乐人物的自媒体人，偶尔品读诗词，长期泡娱乐人物圈，还活着。喜欢', 32, 15567, 1, 127, 1, 'kaiyan/index/default.jpg', 392068, 30027),
('/u/4fcb18420', 'NWZmMDI0ODFiY2Y0L3Uv', '\n    霖山\n  ', 'kaiyan/head/default.jpg', '曾经是大学教师，目前自由职业。【霖山原创】我已委托“维权骑士”(rightknights.com', 181, 928, 1, 57, 1, 'kaiyan/index/default.jpg', 68728, 4038),
('/u/51995510e', 'YTBlZTAxNTU5OTE1L3Uv', '\n    与君成悦\n', 'kaiyan/head/default.jpg', '微信号：w870724xinxin备注：简书。南方姑娘，简书成悦阁创建人。作家协会会员，喜文学，', 163, 31095, 1, 145, 1, 'kaiyan/index/default.jpg', 556389, 20623),
('/u/54bbb3396', 'ZTYxNjkzM2JiYjQ1L3Uv', '\n    好风似水\n', 'kaiyan/head/default.jpg', '写作吧：这是最佳的方式，让你阅读自己，聆听世界。我已加入“维权骑士”(rightknights.', 121, 1145, 1, 86, 1, 'kaiyan/index/default.jpg', 166686, 3326),
('/u/604159f29', 'NDcxOTJmOTUxNDA2L3Uv', '\n    蓝胖说说\n', 'kaiyan/head/default.jpg', '简书签约作者历史业余爱好者连载“历史真性情”认真上线了文中是对历史资料的总结难免谬误和不够严谨如', 598, 130601, 1, 241, 1, 'kaiyan/index/default.jpg', 686873, 39379),
('/u/6e1768738', 'YzcwODM3ODY3MWU2L3Uv', '\n    漫漫Cha', 'kaiyan/head/default.jpg', '富兰克林读书俱乐部签约作者微信公众号：漫漫Chan，未经授权不得转载微博：漫漫Chan是漫漫Ch', 159, 7776, 1, 142, 1, 'kaiyan/index/default.jpg', 323559, 10916),
('/u/8c55431ed', 'OTA5ZGUxMzQ1NWM4L3Uv', '\n    蔡小卿Yo', 'kaiyan/head/default.jpg', '简书摄影专题编委试睡员/旅行博主/半个拍照的互联网市场/运营/前冰淇淋研发工程师微博：蔡小卿Yo', 97, 11101, 1, 33, 1, 'kaiyan/index/default.jpg', 38992, 2041),
('/u/9617ac822', 'NmNkMjI4Y2E3MTY5L3Uv', '\n    山青青\n ', 'kaiyan/head/default.jpg', '一个爱做美食的妈妈，偶尔也会和大家分享故事。坚持图原创，文原创，故事原创！未经许可，不允许转载。', 798, 128512, 1, 144, 1, 'kaiyan/index/default.jpg', 195472, 17458),
('/u/a4bb47ef8', 'MTc4OGZlNzRiYjRhL3Uv', '\n    阿亮的月亮', 'kaiyan/head/default.jpg', '诗 专题 现代诗编审。水煮原味文字，我在等你。     〖原创文字，版权所有〗☞微信公众号   ', 99, 1200, 1, 120, 1, 'kaiyan/index/default.jpg', 57490, 2918),
('/u/ab993c12f', 'N2FhZjIxYzM5OWJhL3Uv', '\n    麦麦小兜\n', 'kaiyan/head/default.jpg', '散文随笔小编一枚身处三尺讲台，心有诗和远方我已加入“维权骑士”(rightknights.com', 69, 1405, 1, 29, 1, 'kaiyan/index/default.jpg', 49642, 3543),
('/u/c0e42eac8', 'Mjg3OGNhZTI0ZTBjL3Uv', '\n    左灯右右右', 'kaiyan/head/default.jpg', '越接近死亡，越接近生活的真相。', 5, 5650, 1, 80, 1, 'kaiyan/index/default.jpg', 235485, 9492),
('/u/cba1cf382', 'YTNkMjgzZmMxYWJjL3Uv', '\n    小奇鸽\n ', 'kaiyan/head/default.jpg', '小奇鸽的日常吐槽和干货分享的个人简书', 0, 2, 1, 3, 1, 'kaiyan/index/default.jpg', 1012, 9),
('/u/d0be5ae77', 'NDE5NzdlYTVlYjBkL3Uv', '\n    潘城王小古', 'kaiyan/head/default.jpg', '公众号：理想先森陪你一起长大', 23, 3257, 1, 48, 1, 'kaiyan/index/default.jpg', 110528, 9078),
('/u/d607c9779', 'NTQ1OTc3OWM3MDZkL3Uv', '\n    燕子高飞\n', 'kaiyan/head/default.jpg', '我心柔软，但有力量。不会写励志，不会写鸡汤，只是喜欢写写身边的真实故事偶尔温暖一下自己，温暖一下', 143, 2451, 1, 100, 1, 'kaiyan/index/default.jpg', 197642, 3846),
('/u/deeea9e09', 'Y2JjOTBlOWFlZWVkL3Uv', '\n    衷曲无闻\n', 'kaiyan/head/default.jpg', '个人微信：zqww667', 0, 56800, 1, 279, 1, 'kaiyan/index/default.jpg', 701120, 147970),
('/u/eee6e7dea', 'Yzg5YWVkN2U2ZWVlL3Uv', '\n    焱公子\n ', 'kaiyan/head/default.jpg', '勾搭公子通道，微信号：flamyice。请务必注明来意写有灵魂的故事，过有温度的人生微信公众号：', 1, 18759, 1, 181, 1, 'kaiyan/index/default.jpg', 613518, 21019),
('/u/f84c1c78f', 'YzE0Zjg3YzFjNDhmL3Uv', '\n    意磬\n  ', 'kaiyan/head/default.jpg', '爱我所爱，写我所爱。所有文章均为原创，如需转载请联系作者本人。我已委托维权骑士帮我维权。', 372, 7755, 1, 130, 1, 'kaiyan/index/default.jpg', 434762, 4808),
('/u/fee4b4b0b', 'ZTk4YjBiNGI0ZWVmL3Uv', '\n    晓多\n  ', 'kaiyan/head/default.jpg', '“不安分”的公务员，省市级荣誉10多项，认证好青年/前500强总裁办秘书/成长社群【晓多会客厅】', 64, 37237, 1, 191, 1, 'kaiyan/index/default.jpg', 522114, 66715),
('12532d36e4da', 'YWQ0ZTYzZDIzNTIx', '\n    阿里云云栖', 'kaiyan/head/default.jpg', '汇集阿里技术精粹，http://yq.aliyun.com欢迎关注：官方微博@阿里云云栖社区官方', 0, 224250, 1, 936, 1, 'kaiyan/index/default.jpg', 2628126, 15908),
('14ea11f850f3', 'M2YwNThmMTFhZTQx', '\n    请记住_我', 'kaiyan/head/default.jpg', '企业教练(as649253295)一位在风雨中奔跑的大叔，星多盛世商学院执行院长、企业培训师、I', 129, 566, 1, 42, 1, 'kaiyan/index/default.jpg', 88361, 1239),
('21a7a893f4b7', 'N2I0ZjM5OGE3YTEy', '\n    有备而来的', 'kaiyan/head/default.jpg', '大萌，对世界上瘾的二逼青年。旅行、摄影、公益、写作、民谣、吃货。微信公众号：大萌呀（ID：dmz', 505, 89746, 1, 192, 1, 'kaiyan/index/default.jpg', 305659, 87466),
('27e866de5623', 'MzI2NWVkNjY4ZTcy', '\n    我是磊少\n', 'kaiyan/head/default.jpg', '张磊，三石会社群创始人（付费会员近千人，门槛699），目前已签约入驻十二大自媒体平台。（合作微信', 90, 33572, 1, 224, 1, 'kaiyan/index/default.jpg', 297025, 1725),
('2b3ad4f2a058', 'ODUwYTJmNGRhM2Iy', '\n    麦大人\n ', 'kaiyan/head/default.jpg', '一个不务正业的文字爱好者，最会写娱乐人物的自媒体人，偶尔品读诗词，长期泡娱乐人物圈，还活着。喜欢', 32, 16016, 1, 128, 1, 'kaiyan/index/default.jpg', 394550, 31083),
('38071932f1e6', 'NmUxZjIzOTE3MDgz', '\n    古树蚂蚁\n', 'kaiyan/head/default.jpg', '希望自己可以变得更酷一点！欢迎大家关注个人微信公众号：古树蚂蚁如要转载文章，请简信私聊！', 96, 2157, 1, 216, 1, 'kaiyan/index/default.jpg', 241245, 7382),
('384c2f242cdb', 'YmRjMjQyZjJjNDgz', '\n    冰镇火药\n', 'kaiyan/head/default.jpg', '“你最喜欢什么？”“我最喜欢孩子！”“有多喜欢？”“像宇宙那么大的喜欢。因为，宇宙是科学家探索到', 209, 3366, 1, 235, 1, 'kaiyan/index/default.jpg', 402692, 2707),
('51995510ee0a', 'YTBlZTAxNTU5OTE1', '\n    与君成悦\n', 'kaiyan/head/default.jpg', '微信号：w870724xinxin备注：简书。南方姑娘，中文系才女，简书成悦阁创建人。作家协会会', 165, 31343, 1, 146, 1, 'kaiyan/index/default.jpg', 558935, 20979),
('604159f29174', 'NDcxOTJmOTUxNDA2', '\n    蓝胖说说\n', 'kaiyan/head/default.jpg', '简书签约作者历史业余爱好者连载“历史真性情”认真上线了文中是对历史资料的总结难免谬误和不够严谨如', 601, 131038, 1, 243, 1, 'kaiyan/index/default.jpg', 693158, 39594),
('61d710a4a0ce', 'ZWMwYTRhMDE3ZDE2', '\n    精进的医生', 'kaiyan/head/default.jpg', '一名小医生，热爱文学、热爱生活。希望用文字来留住世间的美好，希望用文字展现真诚与美丽，希望回首往', 869, 1590, 1, 633, 1, 'kaiyan/index/default.jpg', 810618, 11172),
('6e176873807c', 'YzcwODM3ODY3MWU2', '\n    漫漫Cha', 'kaiyan/head/default.jpg', '富兰克林读书俱乐部签约作者微信公众号：漫漫Chan，未经授权不得转载微博：漫漫Chan是漫漫Ch', 159, 8211, 1, 142, 1, 'kaiyan/index/default.jpg', 323559, 11782),
('778731a5f6fc', 'Y2Y2ZjVhMTM3ODc3', '\n    米喜\n  ', 'kaiyan/head/default.jpg', '写字的时候，很宁静。您若看上了我的字，请让我知道，谢谢您！我的微信公众号：米喜的院子。欢迎来坐坐', 76, 25020, 1, 162, 1, 'kaiyan/index/default.jpg', 335445, 10149),
('81310278129d', 'ZDkyMTg3MjAxMzE4', '\n    涅阳三水\n', 'kaiyan/head/default.jpg', '涅水河畔，简言的家伙在码字。我已加入“维权骑士”（rightknights.com）的版权保护计', 174, 10687, 1, 407, 1, 'kaiyan/index/default.jpg', 845913, 10859),
('879646527', 'zxc123aqswd', '测试一号', 'kaiyan/head/879646527.jpg', '测试一号', 0, 0, 0, 0, 0, '', 0, 0),
('879646528', 'zxc456123', '耗子爱骑车', 'kaiyan/head/879646528.jpg', '坏人能够获胜的唯一条件是：好人袖手旁观', 5, 1245, 12, 3, 1, 'kaiyan/back/879646528.jpg', 123056, 2587),
('879646529', 'zxc123456', '游学者、墨槿', 'kaiyan/head/879646529.jpg', '人生不是戏剧，而我亦非主角', 82, 2365, 15, 2, 1, 'kaiyan/back/879646529.jpg', 8452, 4521),
('8c55431ed909', 'OTA5ZGUxMzQ1NWM4', '\n    蔡小卿Yo', 'kaiyan/head/default.jpg', '简书摄影专题编委现居长沙/旅行博主/半个拍照的互联网市场/运营/前冰淇淋研发工程师微博：蔡小卿Y', 99, 11617, 1, 34, 1, 'kaiyan/index/default.jpg', 40266, 2245),
('9019674f5808', 'ODA4NWY0NzY5MTA5', '\n    Soul麦', 'kaiyan/head/default.jpg', '我在等你出现，体验爱恨缠绵、', 0, 9479, 1, 129, 1, 'kaiyan/index/default.jpg', 273963, 15110),
('9617ac822dc6', 'NmNkMjI4Y2E3MTY5', '\n    山青青\n ', 'kaiyan/head/default.jpg', '一个爱做美食的妈妈，偶尔也会和大家分享故事。坚持图原创，文原创，故事原创！未经许可，不允许转载。', 808, 132074, 1, 146, 1, 'kaiyan/index/default.jpg', 198872, 17869),
('a7f876850fa6', 'NmFmMDU4Njc4Zjdh', '\n    秋水饮马\n', 'kaiyan/head/default.jpg', '理工男+伪文人+色影师。坚持三个原则：图原创，文原创，诗原创。所有文章欢迎收录和分享。', 765, 52005, 1, 410, 1, 'kaiyan/index/default.jpg', 59818, 21894),
('c0df9f7c15fa', 'YWY1MWM3ZjlmZDBj', '\n    伊竹凌\n ', 'kaiyan/head/default.jpg', '欢迎大家加入我的架构交流群650385180喜欢我的文章或者遇到技术难题都可以加群，大家一起交流', 10, 2845, 1, 99, 1, 'kaiyan/index/default.jpg', 419574, 1105),
('cab027d5878e', 'ZTg3ODVkNzIwYmFj', '\n    巴西哥杂货', 'kaiyan/head/default.jpg', '一个爱旅行、爱写作的工程师，目前在巴西《旅行 南美洲》小编，欢迎关注，欢迎来稿！', 125, 1622, 1, 84, 1, 'kaiyan/index/default.jpg', 137788, 2772),
('ce94d617e045', 'NTQwZTcxNmQ0OWVj', '\n    羊达令\n ', 'kaiyan/head/default.jpg', '我有故事，也有酒微信公众平台：羊达令有想被我撩的，可以加这个微信：wangjing2814071', 33, 13264, 1, 123, 1, 'kaiyan/index/default.jpg', 272890, 22166),
('d0be5ae77914', 'NDE5NzdlYTVlYjBk', '\n    潘城王小古', 'kaiyan/head/default.jpg', '公众号：理想先森陪你一起长大', 23, 3384, 1, 49, 1, 'kaiyan/index/default.jpg', 112991, 9311),
('d3fd05d71dec', 'Y2VkMTdkNTBkZjNk', '\n    火星夜车\n', 'kaiyan/head/default.jpg', '你别难过，风筝有风，海豚有海，而你，还有我微信：zls15236715367（唠嗑）我在等，那个', 98, 1124, 1, 82, 1, 'kaiyan/index/default.jpg', 210659, 7798),
('d6875d11fafd', 'ZGZhZjExZDU3ODZk', '\n    世代\n  ', 'kaiyan/head/default.jpg', '在简书为作者跑腿，坐标北京。', 882, 1515, 1, 43, 1, 'kaiyan/index/default.jpg', 72638, 1478),
('d769c1e1ae16', 'NjFlYTFlMWM5Njdk', '\n    鱼丸\n  ', 'kaiyan/head/default.jpg', '公众号：极简旅行微博：傻蛋青年鱼丸知乎：鱼丸INTP，平庸倔强什么也不是生活的全部已委托“维权骑', 0, 272, 1, 11, 1, 'kaiyan/index/default.jpg', 31347, 550),
('d8c6bb6cbe0c', 'YzBlYmM2YmI2Yzhk', '\n    爱读书的陕', 'kaiyan/head/default.jpg', '公号：青风若凡 有底线的历史爱好者', 231, 25463, 1, 62, 1, 'kaiyan/index/default.jpg', 149978, 1885),
('dbb14da93531', 'MTM1MzlhZDQxYmJk', '\n    一河漪沫\n', 'kaiyan/head/default.jpg', '简书签约作者，本职工作平面设计（文学爱好者，业余写作多年，励志将技能与写作并驾齐驱）。6年广告行', 91, 13199, 1, 76, 1, 'kaiyan/index/default.jpg', 83153, 11629),
('deeea9e09cbc', 'Y2JjOTBlOWFlZWVk', '\n    衷曲无闻\n', 'kaiyan/head/default.jpg', '个人微信：zqww667', 0, 57165, 1, 280, 1, 'kaiyan/index/default.jpg', 703641, 149075),
('f79de69d59e3', 'M2U5NWQ5NmVkOTdm', '\n    虬田\n  ', 'kaiyan/head/default.jpg', '我已委托“维权骑士”（rightknights.com）为我的文章进行维权行动。如果转发请私信我', 352, 25285, 1, 72, 1, 'kaiyan/index/default.jpg', 215827, 15863),
('fee4b4b0b89e', 'ZTk4YjBiNGI0ZWVm', '\n    晓多\n  ', 'kaiyan/head/default.jpg', '“不安分”的公务员，省市级荣誉10多项，认证好青年/前500强总裁办秘书/成长社群【晓多会客厅】', 64, 37699, 1, 191, 1, 'kaiyan/index/default.jpg', 522106, 67618);

-- --------------------------------------------------------

--
-- 表的结构 `smessage`
--

CREATE TABLE `smessage` (
  `Dmid` int(11) NOT NULL COMMENT '私信号',
  `Esender` varchar(12) COLLATE utf8_bin NOT NULL,
  `Rdate` char(16) COLLATE utf8_bin NOT NULL,
  `Pcontent` varchar(128) COLLATE utf8_bin NOT NULL,
  `Oreceiver` varchar(12) COLLATE utf8_bin NOT NULL,
  `GisRead` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `smessage`
--

INSERT INTO `smessage` (`Dmid`, `Esender`, `Rdate`, `Pcontent`, `Oreceiver`, `GisRead`) VALUES
(1, '879646528', '2018-03-25 18:18', '你好，游学者！', '879646529', '0'),
(2, '879646529', '2018-03-27 19:24', '你好，爱骑车！', '879646528', '0'),
(3, '879646528', '2018-03-27 20:24', '哈哈哈', '879646529', '0');

-- --------------------------------------------------------

--
-- 表的结构 `umesssubject`
--

CREATE TABLE `umesssubject` (
  `Did` int(11) NOT NULL COMMENT '专题审核号',
  `Wsender` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '发送者账号',
  `Qreceiver` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '接收者账号',
  `Ydate` char(16) COLLATE utf8_bin NOT NULL COMMENT '请求日期',
  `Carticle` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '审核文章',
  `Isubject` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '请求专题'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_action`
-- (See below for the actual view)
--
CREATE TABLE `view_action` (
`id` varchar(50)
,`key` varchar(22)
,`value` varchar(32)
,`account` varchar(12)
,`type` int(11)
,`date` char(16)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_article`
-- (See below for the actual view)
--
CREATE TABLE `view_article` (
`id` varchar(24)
,`title` varchar(32)
,`content` varchar(8192)
,`date` char(16)
,`countLike` int(11)
,`countComment` int(11)
,`countRead` int(11)
,`thumbnail` varchar(80)
,`label` varchar(20)
,`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`sid` int(11)
,`subjectName` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_article_history`
-- (See below for the actual view)
--
CREATE TABLE `view_article_history` (
`id` int(11)
,`author` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`aid` varchar(24)
,`title` varchar(32)
,`date` char(16)
,`countLike` int(11)
,`countComment` int(11)
,`countRead` int(11)
,`thumbnail` varchar(80)
,`historyDate` char(16)
,`account` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_article_like`
-- (See below for the actual view)
--
CREATE TABLE `view_article_like` (
`id` int(11)
,`author` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`aid` varchar(24)
,`title` varchar(32)
,`date` char(16)
,`countLike` int(11)
,`countComment` int(11)
,`countRead` int(11)
,`thumbnail` varchar(80)
,`likeDate` char(16)
,`account` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_author_focus`
-- (See below for the actual view)
--
CREATE TABLE `view_author_focus` (
`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`title` text
,`aid` varchar(24)
,`owner` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_blacklist`
-- (See below for the actual view)
--
CREATE TABLE `view_blacklist` (
`bid` int(11)
,`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`owner` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_comment`
-- (See below for the actual view)
--
CREATE TABLE `view_comment` (
`id` int(11)
,`sender` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`receiver` varchar(12)
,`date` char(16)
,`content` varchar(128)
,`article` varchar(22)
,`type` char(1)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_examine`
-- (See below for the actual view)
--
CREATE TABLE `view_examine` (
`id` int(11)
,`sid` varchar(24)
,`aid` varchar(24)
,`title` varchar(32)
,`nickname` varchar(10)
,`account` varchar(12)
,`head` varchar(30)
,`date` char(16)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_history_search`
-- (See below for the actual view)
--
CREATE TABLE `view_history_search` (
`id` varchar(24)
,`content` varchar(30)
,`date` char(16)
,`account` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_history_search_popular`
-- (See below for the actual view)
--
CREATE TABLE `view_history_search_popular` (
`count` bigint(21)
,`content` text
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_message`
-- (See below for the actual view)
--
CREATE TABLE `view_message` (
`id` int(11)
,`sender` varchar(12)
,`date` char(16)
,`head` varchar(30)
,`content` varchar(128)
,`receiver` varchar(12)
,`isRead` char(1)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_message_list`
-- (See below for the actual view)
--
CREATE TABLE `view_message_list` (
`id` int(11)
,`sender` varchar(12)
,`receiver` varchar(12)
,`isRead` char(1)
,`nickname` varchar(10)
,`head` varchar(30)
,`content` text
,`date` text
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_messfocus`
-- (See below for the actual view)
--
CREATE TABLE `view_messfocus` (
`sender` varchar(12)
,`date` char(16)
,`isFocus` varchar(12)
,`account` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_messlike`
-- (See below for the actual view)
--
CREATE TABLE `view_messlike` (
`sender` varchar(12)
,`date` char(16)
,`nickname` varchar(10)
,`head` varchar(30)
,`article` varchar(24)
,`title` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_messsubject`
-- (See below for the actual view)
--
CREATE TABLE `view_messsubject` (
`id` int(11)
,`aid` varchar(24)
,`title` varchar(32)
,`nickname` varchar(10)
,`sender` varchar(12)
,`receiver` varchar(12)
,`head` varchar(30)
,`date` char(16)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_rank_author`
-- (See below for the actual view)
--
CREATE TABLE `view_rank_author` (
`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`aid` varchar(24)
,`title` text
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_subject`
-- (See below for the actual view)
--
CREATE TABLE `view_subject` (
`id` int(11)
,`name` varchar(12)
,`brief` varchar(128)
,`thumbnail` varchar(150)
,`nickname` varchar(10)
,`date` char(16)
,`owner` varchar(12)
,`countArticle` int(11)
,`countFocus` int(11)
,`label` varchar(20)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_subject_focus`
-- (See below for the actual view)
--
CREATE TABLE `view_subject_focus` (
`id` int(11)
,`account` varchar(12)
,`name` varchar(12)
,`brief` varchar(128)
,`thumbnail` varchar(150)
,`countArticle` int(11)
,`countFocus` int(11)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_user`
-- (See below for the actual view)
--
CREATE TABLE `view_user` (
`account` varchar(12)
,`password` varchar(20)
,`nickname` varchar(10)
,`head` varchar(30)
,`brief` varchar(48)
,`countFocus` int(11)
,`countFans` int(11)
,`countLike` int(11)
,`countArticle` int(11)
,`countSubject` int(11)
,`indexback` varchar(30)
,`countWords` int(11)
,`countLiked` int(11)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_userfocus`
-- (See below for the actual view)
--
CREATE TABLE `view_userfocus` (
`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`countwords` int(11)
,`countliked` int(11)
,`owner` varchar(12)
);

-- --------------------------------------------------------

--
-- 表的结构 `vuserlabel`
--

CREATE TABLE `vuserlabel` (
  `Xaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Qlabel` int(11) NOT NULL COMMENT '标签号',
  `Lvalue` int(11) NOT NULL COMMENT '标签值',
  `Otype` char(1) COLLATE utf8_bin NOT NULL COMMENT '标签类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `warticlelabel`
--

CREATE TABLE `warticlelabel` (
  `Salid` int(11) NOT NULL COMMENT '文章标签号',
  `Uname` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '标签名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `yhissearch`
--

CREATE TABLE `yhissearch` (
  `Hsid` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '搜索记录号',
  `Econtent` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '搜索内容',
  `Wdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '搜索日期',
  `Jaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '搜索者'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `yhissearch`
--

INSERT INTO `yhissearch` (`Hsid`, `Econtent`, `Wdate`, `Jaccount`) VALUES
('879646529180411201435', '区块链', '2018-04-11 20:14', '879646529'),
('879646529180411211435', '原型设计', '2018-04-11 21:14', '879646529'),
('879646529180411231435', '区块链', '2018-04-11 23:14', '879646528'),
('8796465291804141713', 'sketch', '2018-04-14 17:13', '879646529'),
('8796465291804141715', '反恐', '2018-04-14 17:15', '879646527'),
('8796465291804151713', 'axure', '2018-04-15 17:13', '879646529'),
('8796465291804151715', '缉私', '2018-04-15 17:15', '879646527'),
('8796465291804161713', 'photoshop', '2018-04-16 17:13', '879646529'),
('8796465291804161715', '国旗', '2018-04-16 17:15', '879646527'),
('8796465291804171713', '高保真', '2018-04-17 17:13', '879646529'),
('8796465291804171715', '救灾', '2018-04-17 17:15', '879646527'),
('8796465291804181713', '付费连载', '2018-04-18 17:13', '879646529'),
('879646529180418715', '惩治', '2018-04-18 17:15', '879646527'),
('8796465291804191713', '吃瓜群众岱岱', '2018-04-19 17:13', '879646529'),
('8796465291804191715', '高危', '2018-04-19 17:15', '879646527'),
('8796465291804201713', '考研', '2018-04-20 17:13', '879646529'),
('8796465291804201715', '国歌', '2018-04-20 17:15', '879646527'),
('8796465291804211713', '蒋坤元', '2018-04-21 17:13', '879646529'),
('8796465291804211715', '案发', '2018-04-21 17:15', '879646527'),
('8796465291804221713', '简书交友', '2018-04-22 17:13', '879646529'),
('8796465291804221715', '小程序', '2018-04-22 17:15', '879646527'),
('8796465291804231715', '反腐', '2018-04-23 17:15', '879646527'),
('8796465291804241715', 'vue', '2018-04-24 17:15', '879646527'),
('8796465291804251715', '故事', '2018-04-25 17:15', '879646527'),
('8796465291804261715', '白云麦田', '2018-04-26 17:15', '879646527');

-- --------------------------------------------------------

--
-- 表的结构 `ysubjectlabel`
--

CREATE TABLE `ysubjectlabel` (
  `Tslid` int(11) NOT NULL COMMENT '专题标签号',
  `Rname` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '标签名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 视图结构 `view_action`
--
DROP TABLE IF EXISTS `view_action`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_action`  AS  select `ma`.`Eaid` AS `id`,`ma`.`Ukey` AS `key`,`ma`.`Rvalue` AS `value`,`ma`.`Vaccount` AS `account`,`ma`.`Htype` AS `type`,`ma`.`Bdate` AS `date` from `maction` `ma` order by `ma`.`Bdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_article`
--
DROP TABLE IF EXISTS `view_article`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_article`  AS  select `la`.`Xaid` AS `id`,`la`.`Dtitle` AS `title`,`la`.`Tcontent` AS `content`,`la`.`Rdate` AS `date`,`la`.`Klike` AS `countLike`,`la`.`Wcomment` AS `countComment`,`la`.`Oread` AS `countRead`,`la`.`Kpicture` AS `thumbnail`,`la`.`Vlabel` AS `label`,`ru`.`Raccount` AS `account`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,`hs`.`Usid` AS `sid`,`hs`.`Yname` AS `subjectName` from ((`larticle` `la` join `ruser` `ru`) join `hsubject` `hs`) where ((`la`.`Psid` = `hs`.`Usid`) and (`la`.`Vaccount` = `ru`.`Raccount`)) order by `la`.`Rdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_article_history`
--
DROP TABLE IF EXISTS `view_article_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_article_history`  AS  select `h`.`Chid` AS `id`,`u`.`Raccount` AS `author`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`a`.`Xaid` AS `aid`,`a`.`Dtitle` AS `title`,`a`.`Rdate` AS `date`,`a`.`Klike` AS `countLike`,`a`.`Wcomment` AS `countComment`,`a`.`Oread` AS `countRead`,`a`.`Kpicture` AS `thumbnail`,`h`.`Pdate` AS `historyDate`,`h`.`Aaccount` AS `account` from ((`ohistory` `h` left join `ruser` `u` on((`h`.`Aaccount` = `u`.`Raccount`))) left join `larticle` `a` on((`h`.`Gaid` = `a`.`Xaid`))) order by `h`.`Pdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_article_like`
--
DROP TABLE IF EXISTS `view_article_like`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_article_like`  AS  select `ul`.`Hulid` AS `id`,`u`.`Raccount` AS `author`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`a`.`Xaid` AS `aid`,`a`.`Dtitle` AS `title`,`a`.`Rdate` AS `date`,`a`.`Klike` AS `countLike`,`a`.`Wcomment` AS `countComment`,`a`.`Oread` AS `countRead`,`a`.`Kpicture` AS `thumbnail`,`ul`.`Idate` AS `likeDate`,`ul`.`Vaccount` AS `account` from ((`fuserlike` `ul` left join `ruser` `u` on((`ul`.`Rautaccount` = `u`.`Raccount`))) left join `larticle` `a` on((`ul`.`Taid` = `a`.`Xaid`))) order by `ul`.`Idate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_author_focus`
--
DROP TABLE IF EXISTS `view_author_focus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_author_focus`  AS  select `haf`.`Tautaccount` AS `account`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,substring_index(group_concat(`la`.`Dtitle` order by `la`.`Rdate` DESC separator ','),',',1) AS `title`,`la`.`Xaid` AS `aid`,`haf`.`Daccount` AS `owner` from ((`hautfocus` `haf` left join `larticle` `la` on((`haf`.`Tautaccount` = `la`.`Vaccount`))) left join `ruser` `ru` on((`haf`.`Tautaccount` = `ru`.`Raccount`))) group by `ru`.`Raccount` ;

-- --------------------------------------------------------

--
-- 视图结构 `view_blacklist`
--
DROP TABLE IF EXISTS `view_blacklist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_blacklist`  AS  select `nb`.`Tbid` AS `bid`,`nb`.`Hblackaccount` AS `account`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`nb`.`Vaccount` AS `owner` from (`nblacklist` `nb` join `ruser` `u`) where (`nb`.`Hblackaccount` = `u`.`Raccount`) order by `u`.`Hnickname` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_comment`
--
DROP TABLE IF EXISTS `view_comment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_comment`  AS  select `mc`.`Ecid` AS `id`,`u`.`Raccount` AS `sender`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`mc`.`Dreceiver` AS `receiver`,`mc`.`Odate` AS `date`,`mc`.`Scontent` AS `content`,`mc`.`Particle` AS `article`,`mc`.`Rtype` AS `type` from (`dmesscomment` `mc` left join `ruser` `u` on((`mc`.`Vsender` = `u`.`Raccount`))) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_examine`
--
DROP TABLE IF EXISTS `view_examine`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_examine`  AS  select `je`.`Rid` AS `id`,`je`.`Usid` AS `sid`,`la`.`Xaid` AS `aid`,`la`.`Dtitle` AS `title`,`ru`.`Hnickname` AS `nickname`,`ru`.`Raccount` AS `account`,`ru`.`Uhead` AS `head`,`je`.`Edate` AS `date` from ((`jexamine` `je` left join `ruser` `ru` on((`je`.`Gaccount` = `ru`.`Raccount`))) left join `larticle` `la` on((`je`.`Caid` = `la`.`Xaid`))) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_history_search`
--
DROP TABLE IF EXISTS `view_history_search`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_history_search`  AS  select `yhs`.`Hsid` AS `id`,`yhs`.`Econtent` AS `content`,`yhs`.`Wdate` AS `date`,`yhs`.`Jaccount` AS `account` from `yhissearch` `yhs` order by `yhs`.`Wdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_history_search_popular`
--
DROP TABLE IF EXISTS `view_history_search_popular`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_history_search_popular`  AS  select count(0) AS `count`,substring_index(group_concat(`yhs`.`Econtent` order by `yhs`.`Wdate` ASC separator ','),',',1) AS `content` from `yhissearch` `yhs` group by `yhs`.`Econtent` ;

-- --------------------------------------------------------

--
-- 视图结构 `view_message`
--
DROP TABLE IF EXISTS `view_message`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_message`  AS  select `sm`.`Dmid` AS `id`,`sm`.`Esender` AS `sender`,`sm`.`Rdate` AS `date`,`ru`.`Uhead` AS `head`,`sm`.`Pcontent` AS `content`,`sm`.`Oreceiver` AS `receiver`,`sm`.`GisRead` AS `isRead` from (`smessage` `sm` left join `ruser` `ru` on((`sm`.`Esender` = `ru`.`Raccount`))) order by `sm`.`Rdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_message_list`
--
DROP TABLE IF EXISTS `view_message_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_message_list`  AS  select `sm`.`Dmid` AS `id`,`sm`.`Esender` AS `sender`,`sm`.`Oreceiver` AS `receiver`,`sm`.`GisRead` AS `isRead`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,substring_index(group_concat(`sm`.`Pcontent` order by `sm`.`Rdate` DESC separator ','),',',1) AS `content`,substring_index(group_concat(`sm`.`Rdate` order by `sm`.`Rdate` DESC separator ','),',',1) AS `date` from (`smessage` `sm` left join `ruser` `ru` on((`sm`.`Esender` = `ru`.`Raccount`))) group by `sm`.`Esender` ;

-- --------------------------------------------------------

--
-- 视图结构 `view_messfocus`
--
DROP TABLE IF EXISTS `view_messfocus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_messfocus`  AS  select `cmf`.`Xsender` AS `sender`,`cmf`.`Qdate` AS `date`,`haf`.`Tautaccount` AS `isFocus`,`haf`.`Daccount` AS `account` from (`cmessfocus` `cmf` left join `hautfocus` `haf` on((`cmf`.`Xsender` = `haf`.`Tautaccount`))) order by `cmf`.`Qdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_messlike`
--
DROP TABLE IF EXISTS `view_messlike`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_messlike`  AS  select `hml`.`Ssender` AS `sender`,`hml`.`Wdate` AS `date`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,`la`.`Xaid` AS `article`,`la`.`Dtitle` AS `title` from ((`hmesslike` `hml` left join `ruser` `ru` on((`hml`.`Ssender` = `ru`.`Raccount`))) left join `larticle` `la` on((`hml`.`Varticle` = `la`.`Xaid`))) order by `hml`.`Wdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_messsubject`
--
DROP TABLE IF EXISTS `view_messsubject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_messsubject`  AS  select `ms`.`Did` AS `id`,`la`.`Xaid` AS `aid`,`la`.`Dtitle` AS `title`,`ru`.`Hnickname` AS `nickname`,`ru`.`Raccount` AS `sender`,`ms`.`Qreceiver` AS `receiver`,`ru`.`Uhead` AS `head`,`ms`.`Ydate` AS `date` from ((`umesssubject` `ms` left join `ruser` `ru` on((`ms`.`Wsender` = `ru`.`Raccount`))) left join `larticle` `la` on((`ms`.`Carticle` = `la`.`Xaid`))) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_rank_author`
--
DROP TABLE IF EXISTS `view_rank_author`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rank_author`  AS  select `ru`.`Raccount` AS `account`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,`la`.`Xaid` AS `aid`,substring_index(group_concat(`la`.`Dtitle` order by `la`.`Rdate` DESC,',' ASC separator ','),',',1) AS `title` from (`ruser` `ru` left join `larticle` `la` on((`ru`.`Raccount` = `la`.`Vaccount`))) group by `ru`.`Raccount` order by `ru`.`Gcountliked` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_subject`
--
DROP TABLE IF EXISTS `view_subject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_subject`  AS  select `hs`.`Usid` AS `id`,`hs`.`Yname` AS `name`,`hs`.`Kbrief` AS `brief`,`hs`.`Uthumbnail` AS `thumbnail`,`ru`.`Hnickname` AS `nickname`,`hs`.`Ydate` AS `date`,`hs`.`Ebelong` AS `owner`,`hs`.`Hcountarticle` AS `countArticle`,`hs`.`Scountfocus` AS `countFocus`,`hs`.`Blabel` AS `label` from (`hsubject` `hs` join `ruser` `ru`) where (`hs`.`Ebelong` = `ru`.`Raccount`) order by `hs`.`Scountfocus` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_subject_focus`
--
DROP TABLE IF EXISTS `view_subject_focus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_subject_focus`  AS  select `rsf`.`Ksid` AS `id`,`rsf`.`Saccount` AS `account`,`hs`.`Yname` AS `name`,`hs`.`Kbrief` AS `brief`,`hs`.`Uthumbnail` AS `thumbnail`,`hs`.`Hcountarticle` AS `countArticle`,`hs`.`Scountfocus` AS `countFocus` from (`rsubfocus` `rsf` left join `hsubject` `hs` on((`rsf`.`Ksid` = `hs`.`Usid`))) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_user`
--
DROP TABLE IF EXISTS `view_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user`  AS  select `u`.`Raccount` AS `account`,`u`.`Ipassword` AS `password`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`u`.`Jbrief` AS `brief`,`u`.`Hcountfocus` AS `countFocus`,`u`.`Kcountfans` AS `countFans`,`u`.`Ycountlike` AS `countLike`,`u`.`Xcountarticle` AS `countArticle`,`u`.`Ecountsubject` AS `countSubject`,`u`.`Rindexback` AS `indexback`,`u`.`Bcountwords` AS `countWords`,`u`.`Gcountliked` AS `countLiked` from `ruser` `u` order by `u`.`Gcountliked` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_userfocus`
--
DROP TABLE IF EXISTS `view_userfocus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_userfocus`  AS  select `u`.`Raccount` AS `account`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`u`.`Bcountwords` AS `countwords`,`u`.`Gcountliked` AS `countliked`,`af`.`Daccount` AS `owner` from (`ruser` `u` join `hautfocus` `af`) where (`u`.`Raccount` = `af`.`Tautaccount`) order by `u`.`Hnickname` desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cmessfocus`
--
ALTER TABLE `cmessfocus`
  ADD PRIMARY KEY (`Ufid`),
  ADD KEY `fk_user_messfocus1` (`Xsender`),
  ADD KEY `fk_user_messfocus2` (`Greceiver`);

--
-- Indexes for table `dmesscomment`
--
ALTER TABLE `dmesscomment`
  ADD PRIMARY KEY (`Ecid`),
  ADD KEY `fk_article_messcomment` (`Particle`),
  ADD KEY `fk_user_messcomment1` (`Vsender`),
  ADD KEY `fk_user_messcomment2` (`Dreceiver`);

--
-- Indexes for table `fuserlike`
--
ALTER TABLE `fuserlike`
  ADD PRIMARY KEY (`Hulid`),
  ADD KEY `fk_article_userlike` (`Taid`),
  ADD KEY `fk_user_userlike1` (`Rautaccount`),
  ADD KEY `fk_user_userlike2` (`Vaccount`);

--
-- Indexes for table `hautfocus`
--
ALTER TABLE `hautfocus`
  ADD PRIMARY KEY (`Yafid`),
  ADD KEY `fk_user_autfocus1` (`Tautaccount`),
  ADD KEY `fk_user_autfocus2` (`Daccount`);

--
-- Indexes for table `hmesslike`
--
ALTER TABLE `hmesslike`
  ADD PRIMARY KEY (`Tlid`),
  ADD KEY `fk_user_messlike1` (`Ssender`),
  ADD KEY `fk_user_messlike2` (`Ireceiver`),
  ADD KEY `fk_article_messlike` (`Varticle`);

--
-- Indexes for table `hsubject`
--
ALTER TABLE `hsubject`
  ADD PRIMARY KEY (`Usid`),
  ADD KEY `fk_user_subject` (`Ebelong`);

--
-- Indexes for table `jexamine`
--
ALTER TABLE `jexamine`
  ADD PRIMARY KEY (`Rid`);

--
-- Indexes for table `larticle`
--
ALTER TABLE `larticle`
  ADD PRIMARY KEY (`Xaid`),
  ADD KEY `fk_user_article` (`Vaccount`),
  ADD KEY `fk_subkect_article` (`Psid`);

--
-- Indexes for table `maction`
--
ALTER TABLE `maction`
  ADD PRIMARY KEY (`Eaid`),
  ADD KEY `fk_user_maction` (`Vaccount`);

--
-- Indexes for table `nblacklist`
--
ALTER TABLE `nblacklist`
  ADD PRIMARY KEY (`Tbid`),
  ADD KEY `fk_user_blacklist1` (`Vaccount`),
  ADD KEY `fk_user_blacklist2` (`Hblackaccount`);

--
-- Indexes for table `ohistory`
--
ALTER TABLE `ohistory`
  ADD PRIMARY KEY (`Chid`),
  ADD KEY `fk_article_history` (`Gaid`),
  ADD KEY `fk_user_history` (`Aaccount`);

--
-- Indexes for table `rsubfocus`
--
ALTER TABLE `rsubfocus`
  ADD PRIMARY KEY (`Vsfid`),
  ADD KEY `fk_user_subfocus` (`Saccount`),
  ADD KEY `fk_subject_subfocus` (`Ksid`);

--
-- Indexes for table `ruser`
--
ALTER TABLE `ruser`
  ADD PRIMARY KEY (`Raccount`);

--
-- Indexes for table `smessage`
--
ALTER TABLE `smessage`
  ADD PRIMARY KEY (`Dmid`),
  ADD KEY `fk_user_message1` (`Esender`),
  ADD KEY `fk_user_message2` (`Oreceiver`);

--
-- Indexes for table `umesssubject`
--
ALTER TABLE `umesssubject`
  ADD PRIMARY KEY (`Did`),
  ADD KEY `fk_user_messlike1` (`Wsender`),
  ADD KEY `fk_user_messlike2` (`Qreceiver`),
  ADD KEY `fk_article_messlike` (`Carticle`);

--
-- Indexes for table `warticlelabel`
--
ALTER TABLE `warticlelabel`
  ADD PRIMARY KEY (`Salid`),
  ADD UNIQUE KEY `Uname` (`Uname`);

--
-- Indexes for table `yhissearch`
--
ALTER TABLE `yhissearch`
  ADD PRIMARY KEY (`Hsid`),
  ADD KEY `Jaccount` (`Jaccount`);

--
-- Indexes for table `ysubjectlabel`
--
ALTER TABLE `ysubjectlabel`
  ADD PRIMARY KEY (`Tslid`),
  ADD UNIQUE KEY `Rname` (`Rname`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cmessfocus`
--
ALTER TABLE `cmessfocus`
  MODIFY `Ufid` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注号', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `dmesscomment`
--
ALTER TABLE `dmesscomment`
  MODIFY `Ecid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论号', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `fuserlike`
--
ALTER TABLE `fuserlike`
  MODIFY `Hulid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户喜欢号';
--
-- 使用表AUTO_INCREMENT `hautfocus`
--
ALTER TABLE `hautfocus`
  MODIFY `Yafid` int(11) NOT NULL AUTO_INCREMENT COMMENT '作者关注号', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `hmesslike`
--
ALTER TABLE `hmesslike`
  MODIFY `Tlid` int(11) NOT NULL AUTO_INCREMENT COMMENT '喜欢号';
--
-- 使用表AUTO_INCREMENT `jexamine`
--
ALTER TABLE `jexamine`
  MODIFY `Rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核号';
--
-- 使用表AUTO_INCREMENT `nblacklist`
--
ALTER TABLE `nblacklist`
  MODIFY `Tbid` int(11) NOT NULL AUTO_INCREMENT COMMENT '黑名单号';
--
-- 使用表AUTO_INCREMENT `ohistory`
--
ALTER TABLE `ohistory`
  MODIFY `Chid` int(11) NOT NULL AUTO_INCREMENT COMMENT '历史记录号';
--
-- 使用表AUTO_INCREMENT `rsubfocus`
--
ALTER TABLE `rsubfocus`
  MODIFY `Vsfid` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题关注号', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `smessage`
--
ALTER TABLE `smessage`
  MODIFY `Dmid` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信号', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `umesssubject`
--
ALTER TABLE `umesssubject`
  MODIFY `Did` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题审核号';
--
-- 使用表AUTO_INCREMENT `warticlelabel`
--
ALTER TABLE `warticlelabel`
  MODIFY `Salid` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章标签号';
--
-- 使用表AUTO_INCREMENT `ysubjectlabel`
--
ALTER TABLE `ysubjectlabel`
  MODIFY `Tslid` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题标签号';
--
-- 限制导出的表
--

--
-- 限制表 `cmessfocus`
--
ALTER TABLE `cmessfocus`
  ADD CONSTRAINT `fk_user_messfocus1` FOREIGN KEY (`Xsender`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_messfocus2` FOREIGN KEY (`Greceiver`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `dmesscomment`
--
ALTER TABLE `dmesscomment`
  ADD CONSTRAINT `fk_article_messcomment` FOREIGN KEY (`Particle`) REFERENCES `larticle` (`Xaid`),
  ADD CONSTRAINT `fk_user_messcomment1` FOREIGN KEY (`Vsender`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_messcomment2` FOREIGN KEY (`Dreceiver`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `fuserlike`
--
ALTER TABLE `fuserlike`
  ADD CONSTRAINT `fk_article_userlike` FOREIGN KEY (`Taid`) REFERENCES `larticle` (`Xaid`),
  ADD CONSTRAINT `fk_user_userlike1` FOREIGN KEY (`Rautaccount`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_userlike2` FOREIGN KEY (`Vaccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `hautfocus`
--
ALTER TABLE `hautfocus`
  ADD CONSTRAINT `fk_user_autfocus1` FOREIGN KEY (`Tautaccount`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_autfocus2` FOREIGN KEY (`Daccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `hmesslike`
--
ALTER TABLE `hmesslike`
  ADD CONSTRAINT `fk_article_messlike` FOREIGN KEY (`Varticle`) REFERENCES `larticle` (`Xaid`),
  ADD CONSTRAINT `fk_user_messlike1` FOREIGN KEY (`Ssender`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_messlike2` FOREIGN KEY (`Ireceiver`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `maction`
--
ALTER TABLE `maction`
  ADD CONSTRAINT `fk_user_maction` FOREIGN KEY (`Vaccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `nblacklist`
--
ALTER TABLE `nblacklist`
  ADD CONSTRAINT `fk_user_blacklist1` FOREIGN KEY (`Vaccount`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_blacklist2` FOREIGN KEY (`Hblackaccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `ohistory`
--
ALTER TABLE `ohistory`
  ADD CONSTRAINT `fk_article_history` FOREIGN KEY (`Gaid`) REFERENCES `larticle` (`Xaid`),
  ADD CONSTRAINT `fk_user_history` FOREIGN KEY (`Aaccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `rsubfocus`
--
ALTER TABLE `rsubfocus`
  ADD CONSTRAINT `fk_subject_subfocus` FOREIGN KEY (`Ksid`) REFERENCES `hsubject` (`Usid`),
  ADD CONSTRAINT `fk_user_subfocus` FOREIGN KEY (`Saccount`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `smessage`
--
ALTER TABLE `smessage`
  ADD CONSTRAINT `fk_user_message1` FOREIGN KEY (`Esender`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_message2` FOREIGN KEY (`Oreceiver`) REFERENCES `ruser` (`Raccount`);

--
-- 限制表 `yhissearch`
--
ALTER TABLE `yhissearch`
  ADD CONSTRAINT `yhissearch_ibfk_1` FOREIGN KEY (`Jaccount`) REFERENCES `ruser` (`Raccount`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;





