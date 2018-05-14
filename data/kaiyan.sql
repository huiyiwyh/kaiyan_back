-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-05-14 04:22:36
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET FOREIGN_KEY_CHECKS=0;
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
  `Particle` varchar(24) COLLATE utf8_bin NOT NULL COMMENT '评论文章',
  `Rtype` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '评论类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

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
  `Daccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Fdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '关注日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `Uthumbnail` varchar(150) COLLATE utf8_bin DEFAULT 'subject/default.jpg' COMMENT '缩略图',
  `Ebelong` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '所属用户',
  `Hcountarticle` int(11) DEFAULT '0' COMMENT '文章数',
  `Scountfocus` int(11) DEFAULT '0' COMMENT '关注数',
  `Ydate` char(16) COLLATE utf8_bin NOT NULL COMMENT '创建日期',
  `Blabel` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '专题标签'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `hsubject`
--

INSERT INTO `hsubject` (`Usid`, `Yname`, `Kbrief`, `Uthumbnail`, `Ebelong`, `Hcountarticle`, `Scountfocus`, `Ydate`, `Blabel`) VALUES
(0, '暂无标题', '', 'subject/default.jpg', '', 0, 0, '', ''),
(1, '旅游', '“旅”是旅行，外出，即为了实现某一目的而在空间上从甲地到乙地的行进过程；“游”是外出游览、观光、娱乐，即为达到这些目的所作的旅行。二者合起来即旅游。所以，旅行偏重于行，旅游不但有“行”，且有观光、娱乐含义。', 'subject/17826857056180509121445.jpg', '17826857056', 2, 12, '2018-05-09 12:14', '1|3'),
(2, '移动端开发', 'https://www.cnblogs.com/qijunj...  - 百度快照\r\n移动开发_百度百科\r\n移动开发也称为手机开发，或叫做移动互联网开发。是指以手机、PDA、UMPC等便携终端为基础，进行相应的开发工作。', 'subject/17826857055180514111523.jpg', '17826857055', 1, 8, '2018-05-14 11:15', '5|6'),
(3, '前端开发', '扬我大前端！', 'subject/17826857054180509105431.jpg', '17826857054', 0, 1, '2018-05-09 10:54', '5|6'),
(4, '历史', '忘记历史就等于背叛', 'subject/15458752345180509124112.jpg', '15458752345', 1, 12, '2018-05-09 12:41', '12'),
(5, '读书', '读书和不读书，到底差在了哪里？', 'subject/13554755478180510110752.jpg', '13554755478', 1, 2, '2018-05-10 11:07', '7'),
(6, '美食', '唯爱与美食不可辜负', 'subject/13583787452180513021314.jpg', '13583787452', 1, 4, '2018-05-13 02:13', '8|9'),
(7, '体育', '人生百态，体育人生', 'subject/17878785432180512120324.jpg', '17878785432', 1, 17, '2018-05-12 12:03', '2'),
(8, '电影', '生活不比电影，生活比电影苦', 'subject/17868752546180511111334.jpg', '17868752546', 2, 5, '2018-05-11 11:13', '11'),
(9, '娱乐圈', '娱乐圈是个圈，兜兜转转又回来', 'subject/17854125425180513071335.jpg', '17854125425', 1, 20, '2018-05-13 07:13', '9'),
(10, '国学', '国学即中国固有的学术，而传统文化是指中国传统社会，中华民族的整体生活方式和价值系统，其精神学术层面，包括知识、信仰、艺术、宗教、哲学、法律、道德等。', 'subject/17854235412180515122653.jpg', '17854235412', 1, 1, '2018-05-15 12:26', '7'),
(11, '创业', '只要行动，人生没有太晚的开始', 'subject/17826857056180515071345.jpg', '17826857056', 1, 15, '2018-05-15 07:13', '10'),
(12, '小说', '借一斑略知全豹 ，以一目尽传精神。', 'subject/15854754254180512122446.jpg', '15854754254', 0, 17, '2018-05-12 12:24', '7'),
(13, '生活', '每个人都是生活家  ', 'subject/15754856125180510101752.jpg', '15754856125', 1, 9, '2018-05-10 10:17', '8'),
(14, '故事', '我有故事，你有酒吗？', 'subject/15589632542180513122147.jpg', '15589632542', 0, 12, '2018-05-1312:21', '11'),
(15, '摄影', '用快门捕捉你双眼所见，心有所感的一切', 'subject/15558754125180510101041.jpg', '15558754125', 1, 9, '2018-05-10 10:10', '4|9'),
(16, '电竞游戏', '不玩游戏，过不好人生', 'subject/15554754123180512121235.jpg', '15554754123', 1, 3, '2018-05-12 12:12', '9'),
(17, '随笔集', '一切温暖、冷酷，长的、短的，亲情、友情、爱情，皆可成章', 'subject/15545211123180516132635.jpg', '15545211123', 2, 14, '2018-05-16 13:26', '8'),
(18, '投资理财', '投资理财相关，投资理念分享，投资方式不限于固定资产、金融产品、股权投资等', 'subject/15458752345180509011353.jpg', '15458752345', 2, 6, '2018-05-09 01:13', '8|10'),
(19, 'iOS开发技巧', '内容主要包括OC、swift等涉及到iOS开发进阶的内容', 'subject/13854214512180512122347.jpg', '13854214512', 0, 10, '2018-05-12 12:23', '5|6'),
(20, '高效学习', '交流和探讨最高效的学习方法，让知识落地，让知识创造价值。', 'subject/13754215245180511121336.jpg', '13754215245', 1, 5, '2018-05-11 12:13', '5');

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
  `Kpicture` varchar(80) COLLATE utf8_bin DEFAULT 'article/default.jpg' COMMENT '缩略图',
  `Vlabel` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '文章标签'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `larticle`
--

INSERT INTO `larticle` (`Xaid`, `Psid`, `Vaccount`, `Dtitle`, `Tcontent`, `Rdate`, `Klike`, `Wcomment`, `Oread`, `Kpicture`, `Vlabel`) VALUES
('13554755478180510110711', 5, '13554755478', '满地都是六便士,他却抬头看见了月亮', '      <div data-note-content class=\"show-content\">\n          <div class=\"show-content-free\">\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 615px; max-height: 524px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 85.2%;\"></div>\n<div class=\"image-view\" data-width=\"615\" data-height=\"524\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/4881458-ad95a619d25fdf78.jpg\" data-original-width=\"615\" data-original-height=\"524\" data-original-format=\"image/jpeg\" data-original-filesize=\"215098\"></div>\n</div>\n<div class=\"image-caption\">高更画作</div>\n</div>\n<p>可以说，《月亮与六便士》是毛姆最著名的作品了。<br>\n经常在各大书单里发现它的踪迹，却又经常看到有人说读不下去而弃读之。<br>\n然而，又有多少人，耐着性子看下去，最后惊叹到说不出话来。<br>\n我就是其中之一。</p>\n<p>1<br>\n初读本书，是在大二、亦或是大三的时候。<br>\n与许多人一样，初初看来实在乏味，是以还未看完第一章，便放弃了。<br>\n我想这也是很多人放弃读这本小说的原因罢？<br>\n好在，这本书一直是各大公众号和网站推荐书单里的常青树，所以多年以后，我又再次捧起了它。</p>\n<p>2<br>\n说句实在话，于小说这一行当，我连门也未窥得，所以，至今仍停留在乱翻书的阶段。<br>\n不过，如果你是初次阅读这本书，我建议从第四章开始阅读。<br>\n为什么呢？<br>\n以今时今日的小说家们来写的话，我想，他们会直接把前三章都删除了。<br>\n许多人弃读这本书，大抵原因应该都与我相同——开头实在是太过冗长乏味，而主人公登场太晚，又太过平庸寡淡。就如同毛姆在开篇第一句说的那句话：“说实话，最初认识查尔斯·斯特里克兰时，我一点也没有看出来他身上有什么不同凡响的东西。”<br>\n小说家在介绍主人公登场时，常用的手法是烘托。<br>\n最近在读《笑傲江湖》（原谅我拿一本通俗的武侠小说做例子），金庸在让令狐冲正式登场前，做了大量的铺垫，读者从华山派、恒山派、青城派、甚至魔教众人口中，已经对主人公产生了充分的好奇，也被吊足了胃口。<br>\n而在《月亮与六便士》里，毛姆显然也是运用了同样的手法，先是叙述了主人公斯特里克兰去世后世人对他的评价，然后花了大量的篇幅介绍了主人公的妻子，以及妻子口中的主人公。</p>\n<p>然而，第二次或是第三次阅读这本书的话，就会发现，看似冗余的前三章，其实是为后文主人公翻天覆地的变化做铺垫，以形成强烈的对比。<br>\n对比确实鲜明又强烈，以至于我耐着性子读到最后，心情竟久久不能平息。</p>\n<p>3<br>\n毛姆在《阅读是一所随身携带的避难所：毛姆读书随笔》中说道：“我想要指明的第一件事就是阅读应当是享受的……但是这些书会让你活得更加丰满。”<br>\n大多数人的人生应当都是有些乏味的，如同《月亮与六便士》的主人公斯特里克兰的前半生一样——有一份收入不错的工作，有身份有地位，有一个温柔的妻子和一双可爱的儿女，生活不算得多精彩，但至少是平稳有序的。<br>\n这也是我们大部分人的人生，因此，何不阅读一些小说，以此“丰满”自己的生活呢？</p>\n<p>4<br>\n不管是用哪个时代的眼光来看：一个男人抛弃妻子，去追寻虚无缥缈的梦想，是不是都挺混蛋的？<br>\n主人公斯特里克兰就是这样一个混蛋。<br>\n但，他并不在乎自己的名声是个混蛋还是个圣人，他只知道——我要画画。</p>\n<p>或许，即便平凡如你我，都有过这样的时候——心里一把火，有燎原之势，只为了一个在世俗的眼光里看起来异常可笑的梦想——比如写作、比如画画。<br>\n那些梦想，实现了的被称为理想，没实现的被叫做白日梦。<br>\n斯特里克兰才不管什么梦想什么理想什么白日梦，他毅然决然地放弃了工作，离开了家庭，去了谁也不认识自己的地方，去画画。即便是过得穷困潦倒，即便是身染恶疾，他只知道，他要画画。</p>\n<p>支撑他的，是心里那把燃烧的火。那把火一直烧到他双目失明，那把火一直烧到他生命终结之时。<br>\n“她在干燥的地板和露兜树做成的垫子上倒了煤油，点燃，没过多久屋子就烧得只剩下灰烬了。那幅旷世之作彻底消失了。”</p>\n<p>5<br>\n主人公的原型是艺术家高更，和书中人物一样，曾经作为股票经济人的他在35岁时离职，全身心学习艺术。<br>\n看完小说，我在网上找了高更的画来看，说实话，作为一个没什么艺术细胞的人来说，实在是看不懂。但结合《月亮与六便士》中对于斯特里克兰画作的描述，还是颇为震撼。<br>\n我们平庸的大众看艺术家，往往对他们的艺术作品只字不提，却对他们的私生活津津乐道。比如毕加索，人人都说看不懂，但人人都对他的私生活表示鄙夷。<br>\n其实，他们或许根本不在乎世人的眼光吧，就如斯特里克兰一样。</p>\n<p>6<br>\n读完整本书，我发现书里并没有提到“月亮与六便士”六个字，故而实在是想不明白这不知何处得来的书名，竟然这样贴切。<br>\n在网上搜索许久后，才终于找到书名的来历。<br>\n《月亮和六便士》这个书名来自一篇书评，该文作者称《人性的枷锁》（毛姆的另一本小说）主角——“和许多年轻人一样，他为天上的月亮神魂颠倒，对脚下的六便士视而不见”。<br>\n据说毛姆很喜欢这个说法，便决定以《月亮和六便士》作为下一本小说的书名。<br>\n后来在刘瑜在自己的文章里，把这句话精简为：“满地都是六便士，他却抬头看见了月亮。”<br>\n这也就是如今网上广为流传的那句话了。</p>\n\n          </div>\n        </div>\n    </div>', '2018-05-10 11:07', 7, 0, 10, 'article/13554755478180510110711/180510110711.jpg', '7'),
('13583787452180509124105', 6, '13583787452', '我的美味是一碗清汤素面', '有时到了吃饭时间，会为这一餐吃什么犯愁——不吃吧，似乎对不起自己这半天的辛劳苦劳，吃吧，又实在想不出吃什么好。为此，郁闷的时候偶尔也会打电话给朋友，他们有时也苦于近来没有好的“创意”。在到了吃饭的时间，想不起到底吃什么为好，吃饭倒成了一种负担。\r\n\r\n        有时是朋友见面，有时是同学聚会，偶尔有朋友从外地到本地来，总是要吃餐饭，可吃什么饭有时让你很难选择……在该吃饭而不知道该吃什么的时候，吃饭成了一种烦恼。\r\n\r\n        有时休息在家，实在是懒得做饭也懒得吃饭，这一天无聊的我就会一只手拿一本无聊的书，另一只手拿着电视机的遥控器无聊地换台。不知书里写的什么，也不在意电视里播的是什久，直到过了吃饭时间，肚子里有了饥饿感。这时，我走进厨房，在清水锅里放入一把面条、一点青菜、一点盐、煮一碗白绿相间的清汤挂面。\r\n\r\n        其实我们每个人可能都会对一种食物有着一种特殊的情结，就像我对这碗清汤素面的情结一样。记得小时候，每次感冒发烧身体不舒服，吃不下东西的时候，妈妈就会做这样的一碗面给我。清汤无油，放上少许蔬菜，有时还会窝个鸡蛋，最后出锅的时候，再在面上撒些葱花，大功告成。最让人怀念的是，出锅后，在碗里淋上的那几滴香油，就着热气腾腾的面香，一下冲入鼻腔，顿时感觉食欲大开。\r\n\r\n　    后来工作了，结婚了，终于需要自己下厨了。刚结婚的时候，租来的房子居住环境简陋，不可能有条件做更多好吃的，于是想到了这碗清汤素面，因为它最简单，让忙于工作的我不必再考虑更多；也因为它最廉价，是那时候经济拮据的我可以吃得起的不多的美味；也因为它最有家的温暖，热乎乎的面汤下肚，心里浮起的是妈妈微笑的脸。\r\n\r\n　　到后来，我别的本事没长，煮面的手艺倒是日渐高超。为什么呢？因为在我偷懒不想做大餐的时候，最先想到的是这碗清汤素面；在我深夜加班的时候，陪我的是这碗清汤素面；临时有朋友来访，来不及买菜的时候，拿出来招待朋友的依旧是这碗清汤素面。素面虽素，但味道并不差，尤其是对那些吃惯大鱼大肉，浓油赤酱的人们，偶尔来上一碗这样清淡的面条，反而成了记忆中最难忘的食物\r\n\r\n        生活有时候就和这碗简简单单的清汤素面一样，有开心，有不开心，但是有滋有味、沁人心脾……\r\n\r\n        我的美味就是一碗清汤素面。\r\n\r\n        材料：挂面，青菜，虾干、\r\n\r\n　　调料：盐、葱花、香油\r\n\r\n　　1、锅内放清水，放虾干少许，煮开，放挂面；\r\n\r\n　　2、面条快熟的时候，放入一把青菜；\r\n\r\n　　3、煮到面条没有硬芯，放盐调味，撒葱花，出锅；\r\n\r\n　　4、出锅后，滴几滴香油。即可食用。\r\n', '2018-05-09 12:41', 12, 0, 18, 'article/13583787452180509124105/180509124105.jpg', '2|12'),
('13754215245180511121342', 20, '13754215245', '碎片化时间学习VS碎片化学习', '何为碎片化学习\r\n\r\n想必你的手机上，无论是微信，还是微博等社交工具，早已经关注诸多微信公众号或者某些大V，其内容涵盖你的饮食、学习、娱乐、工作等，每天从早到晚刷公众号等消息，今天从一篇文章中获知健身技巧，明天从另外一篇文章中得知健身饮食的注意事项。为什么会这样，因为我们觉得他们懂的好多，很牛，说的好有道理，我的好好学习以保证自己也朝着大牛的方向发展。于是你觉得收获了很多，在这个方面也是有小小的发言权。每天吸收碎片化的知识，名曰碎片化学习。\r\n\r\n何为碎片化时间学习\r\n\r\n你知道自己要干什么，这周的计划是什么，有具体的方案，你每天晚上空闲的时候学习主体知识，然后利用每天上下班途中在公交车或者地铁上的时间，来针对你的学习计划进行丰富，我们称之为碎片化时间学习。\r\n\r\n二者区别\r\n\r\n学习对象不同：碎片化学习的对象是社交平台上消息的分享者，从社交平台获取相应的知识，来丰富自己的知识库，其面很广，但没有针对性和目的性，吸收的知识浅显和杂乱；而碎片化时间学习则是在以前人的知识为基础，设定自己的学习方案，利用碎片化的时间进行丰富，更具有针对性和系统性。\r\n\r\n二者学习时间不一样：碎片化学习的人群往往是手机控，一天很多时间都是与手机相伴，在碎片化学习的过程中消耗了空闲时间，以及本该属于自己的上课或者工作时间；而碎片化时间学习指的是利用自己的空闲时间来丰富自己的体系，而不会本末倒置去占用原本应该属于工作或者上课的时间。', '2018-05-11 12:13', 9, 0, 22, 'article/13754215245180511121342/180511121342.jpg', '5'),
('15458752345180509011324', 18, '15458752345', '“神算子”也会失算？天上不会掉馅饼！', '    <div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <p>近日，小虎又双叒叕看到两则关于骗钱的新闻：</p><p><b>新闻一：</b></p><p>家住浙江省建德市大慈岩镇的算命先生汪某，十多年间被连襟涂某以借款的名义诈骗了几百万的巨款，后又被中间人艾某以帮忙讨债为由骗了40多万元…..</p><p>据了解，涂某给汪某画了一个很大的饼，他对汪谎称自己在外面做大生意，借钱也是投资在生意上面，之后可以把这些钱连本带利相还，比如借800万还1800万。然而，到了约定期限后汪某屡次讨钱都无果，他开始产生怀疑。就在这时，中间人艾某出现了，声称能帮汪某把钱讨回来，但前提是先付一定的报酬。就这样，在一年时间里，艾某从汪某手里一共骗走了40余万元。</p><p>算命大师接连遭遇两次诈骗，走投无路之下，汪某最终选择了报警……</p><p><b>新闻二：</b></p><p>中专毕业的朱某来到江苏省江阴市区寻找工作，因学历不高而难以找到好工作，后当起了算命先生。凭借自己的能说会道，朱某结交了各色人等。为了满足自己的贪欲，朱某对身边的人实施了诈骗。</p><p>在一次有预谋的饭局上，朱某对张某、潘某、任某等几位老板谎称在搞一个赚钱的项目，诱导他们投资，但当场遭到回绝。饭局结束后，朱某采取“逐个击破”的方法，比如联系张某说潘某已经投钱了，然后又联系潘某说任某已经投钱了……在这样的说辞下，张某等人没有进一步核实就投入了朱某所谓的项目中，令后者共获利270余万元。</p><p>随着朱某的胃口越来越大，诈骗的钱财越来越多，终于东窗事发，被判有期徒刑十五年。</p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 450px; max-height: 315px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 70.0%;\"></div>\r\n<div class=\"image-view\" data-width=\"450\" data-height=\"315\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/9270074-c98a81470a490c7f.jpeg\" data-original-width=\"450\" data-original-height=\"315\" data-original-format=\"image/jpeg\" data-original-filesize=\"39330\"></div>\r\n</div>\r\n<div class=\"image-caption\"></div>\r\n</div><p>同样是算命先生，一个是被骗，一个骗；一个把自己的钱财赔了进去，一个把自己的人生搭了进去。“神算子”都会失算，何况普通人呢？上文中小虎之所以说“又双叒叕”，是因为这类骗局实在太多了。很多骗子都是打着为受害人着想的旗号，抓其心理弱点，诱之以利，从而实施诈骗。</p><p>上述案例中，骗子们做了一个投资获利的局，所谓当局者迷，旁观者清，受害人轻信了骗子的只言片语，把自己的积蓄送到骗子手中，实不应该。“理财有风险，投资需谨慎”不是空话，很多人对投资了解甚少，就因高收益率、熟人推荐等原因，将大把积蓄砸进“理财骗局”当中，从而造成血本无归。</p><p><b>前不久，公安部公布了10种“投资理财”骗局，需要大家提高警惕：</b></p><p>1.以“看广告、赚外快”“消费返利”等为幌子的；</p><p>2.以投资境外股权、期权、外汇、贵金属等为幌子的；</p><p>3.以投资养老产业可获高额回报或“免费”养老为幌子的；</p><p>4.以私募入股、合伙办企业为幌子，但不办理企业工商注册登记的；</p><p>5.以投资“虚拟货币”“区块链”等为幌子的；</p><p>6.以“扶贫”“慈善”“互助”等为幌子的；</p><p>7.在街头、商超发放广告的；</p><p>8.以组织考察、旅游、讲座等方式招揽老年群众的；</p><p>9.“投资”“理财”公司、网站及服务器在境外的；</p><p>10.要求以现金方式或向个人账户、境外账户缴纳投资款的。</p><p>俗话说天上不会掉馅饼，骗局这么多，大家还是要提高警惕。</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-09 01:13', 7, 0, 9, 'article/15458752345180509011324/180509011324.jpg', '3'),
('15458752345180509121313', 18, '15458752345', '制定财富梦想清单', ' <div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <p>随着生活水平的提高，挣钱能力的提高，理财在我们的生活中占的比重越来越高了。很多人都拥有擅长打理金钱的美好愿望，但事实上却是，不知从何下手。</p><p>身边的朋友经常会问我以下问题：有哪些理财产品值得投？安全不安全？基金怎么买？股票能投么？有没有好的理财产品推荐？</p><p>理财永远是那句话，没有最好，只有最适合。选择哪些产品去投？每笔投资占多少比重？综合收益要达到多少？其实这些都是根据你的财富梦想来确定的。</p><p>今天，我就来教大家如何制定自己的财富梦想清单。</p><blockquote><p>一、回答三个问题</p></blockquote><p>在制定财富梦想清单时，我们需要回答三个疑问：我要完成什么梦想？完成这个梦想需要花费多少金钱？我准备花多长时间去储备足够的金钱？</p><p>例如，我准备在六个月后存到2万RMB去日本旅游。</p><blockquote><p>二、根据时长分类</p></blockquote><p>我们将要达成的梦想清单一条条列出来之后，需要根据时长对它们进行归类，可大致划分为一年以内、一年到五年和五年以上三种类型。</p><p>因为各类理财产品的流动性不同，所以我们需要对梦想进行时长划分，以匹配不同的产品。例如，一年以内要实现的梦想，就可以选择货币基金或者短期P2P，如果选择股票或者基金，就可能短期内亏损，无法达成目标。一年到五年的梦想，可以选择国债，长期P2P或者银行理财产品。五年以上的，可以选择基金，股票等收益更高的产品。</p><blockquote><p>三、测算合理收益</p></blockquote><p>当我们根据完成梦想的时长进行分类并选择出流动性可匹配的产品，接下来我们就要进行测算。</p><p>测算出，我每年投入这个梦想的本金需要达到多少年化收益，才能在相应的时长达到梦想资金。一般，一年以内的目标，测算结果在6%以内、一年到五年的在10%以内、五年以上的在12%以内，我们认为是合理的，是可以通过资产配置达成的。如果测算的结果太高，我们需要对投入本金或者达成时长进行相应的调整，最终使测算结果达到合理值。</p><blockquote><p>四、选择配置策略</p></blockquote><p>前面已经测算出需要达到的年化收益，最后一步，就是要根据测算的收益选择合适的投资产品以及产品配置策略。</p><p>例如，如果预测出的年化收益是6%，时长是一年到五年，我们就可以选择将一部分资金投入银行理财产品，另一部分资金投入长期P2P，从而达成目标收益。</p><p>理财的产品很多，方式也千千万，最重要的是我们要从自身的情况出发，选择最适合自己需求的产品，选择最符合自己情况的资产配置策略。</p><p>没有最好，只有最适合！</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-09 12:13', 11, 0, 15, 'article/default.jpg', '3'),
('15458752345180509124125', 4, '15458752345', '赵匡胤为什么把帝位传给弟弟而不是儿子', '古代帝王家，皇位的传承一般情况下是子承父位，也就是父亲传给儿子，然而宋太祖赵匡胤却传给了他的三弟赵光义。\n\n这件事引起的争议比较大，因为赵匡胤死的时候，除了两个早亡的儿子，他的二儿子赵德昭已经26岁，四儿子赵德芳已经17岁，按说都已经到了可以做皇帝的年龄了，但他却把皇位传给了38岁的弟弟赵光义。\n\n所以关于此事，正史中都有这样的记载。\n\n正史《金匮之盟》\n\n《宋史》记载赵匡胤的母亲杜太后临终时召赵普入宫记录遗言，并劝说太祖赵匡胤死后传位于其弟，顺序是这样的，赵匡胤传位于弟弟赵光义，赵光义再传位于弟弟赵廷美，而赵廷美再传位于赵匡胤的二儿子赵德昭。\n\n为什么会这么个顺序呢？赵匡胤为何会同意呢？\n\n这就引出了赵匡胤得到皇帝位置的方法。\n\n赵匡胤看当时后周的皇帝年纪小，孤儿寡母的，没什么实力，于是发动陈桥兵变，黄袍加身，做了皇帝。\n\n而此时赵匡胤儿子尚小，为防止同样的事情发生，他害怕别人也通过这样的方式来篡夺他的帝国，况且他的弟弟赵光义在他夺取的帝位过程中，功劳很大，于是他便同意了这样的方案。\n\n从他日后没有将儿子立太子，任由弟弟发展势力可以看出这份盟约确实是存在的。\n\n但是其具体内容，有没有经过篡改就不得而知了。\n\n而且此份盟约的首发时间很值得玩味，在赵光义已经做了六年皇帝的时候，他忽然正式公开了这份盟约，来证明自己皇位的权威依据。\n\n但是其时间出现太晚，并非是在赵匡胤死前出现，而且其原文从未公开，所以引发了一些争议。', '2018-05-09 12:41', 4, 0, 10, 'article/15458752345180509124125/180509124125.jpg', '5|9'),
('15545211123180516132623', 17, '15545211123', '夏天的雨', ' <div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <p>  一直在等一场大雨，像记忆中那种雨。</p><p>起风了，之前满眼的酷热，居然就那么一下子被吹的干干净净。阿婆拉着嗓子呼唤家里养的几只鸡的声音，夹杂在那几棵高大的细叶桉咧咧的声中，一起冲到远方。小孩子的游戏已经继续不下去了，兴奋的大喊大叫到处蹿，阿婆看到这样的情景就一定会大声制止我们的叫喊，而且是表情异常严肃的，好像天上有什么敬畏的东西。</p><p>抬头，总是奇怪乌云怎么来的这么快，忍不住盯着天上想瞧个明白，但是现在的乌云已经不是一块一块了，连成一天，所以终究没瞧出个所以然来。天空好像比平时矮了很多，好像被乌云压得很重。此时天空已经漆黑一团了，父亲是木工，所以用他的话说就是像墨斗一样。风也不知道什么时候撤的无影无踪了，指不定是趁我盯天空那会儿就溜走了。小孩这时候都往屋里跑，蹭蹭跑上二楼窗口那，眼睛亮亮的望着天边，满小脸的期待着。</p><p>天空底下，和远山相接的部分出现了一条鱼肚白，四周原来漆黑的样子也被映白了一些，只是显得有些妖异。这时候风应该是不在的，格外的平静，或许还有一只鸡还没回家，阿婆的声音时不时响起。听，小孩认真屏息听着，小小的闷闷的沙沙的声音⋯最远那座山已经变得白蒙蒙的了，近了近了！就这样看着雨幕把远近的这段距离全部侵占了，夹着风向我们扑来，被屋檐挡住，最后只剩一阵雨雾和风扑在脸上，原来风是藏雨里面了，到了脸上闻到新鲜的黄土的味道，不过一会儿就是剩下水汽凉凉的感觉了，就像是大大的吸了一口凉气，看着外面的世界大雨一幕一幕地往下倒，伙伴们都觉得非常刺激。</p><p>站累了，下楼，到大门那荡起了秋千，门外，屋檐泻下的水帘珠子，远处，一幕一幕白茫茫的雨幕，远了又近，远了又近……</p><p>一直在等一场雨，像记忆中的那种雨……</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-16 13:26', 1, 0, 15, 'article/15545211123180516132623/180516132623.jpg', '2'),
('155452111231805161354', 17, '15545211123', '我在人民广场吃着炸鸡，而此时此刻你在哪里', '   <div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 500px; max-height: 365px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 73.0%;\"></div>\r\n<div class=\"image-view\" data-width=\"500\" data-height=\"365\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/637832-7c9f684a6537da58.jpeg\" data-original-width=\"500\" data-original-height=\"365\" data-original-format=\"image/jpeg\" data-original-filesize=\"20264\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p><br></p><p>还记得，归家后的第二天，我就开始甩开膀子玩耍了。</p><p>那天，是与俩好友饭后相聚于一家家庭式酒吧，磕着瓜子抽着小烟喝着小酒，看着这个城市的夜景，聊天，至深夜4点。<br><br>昏暗的卡座里可以无话不谈。我们享受头顶不停旋转的光斑带来的迷幻气氛，指尖的烟草味，一饮而尽的啤酒和嘴角白色的泡沫，我享受这似是一场男人间的小聚。</p><p>从女人，事业，世事变化，到某一任前任和现任，热血沸腾的年少，不清不楚的纠缠，甚或声色场所的奇遇，都是座上话题。虽也没有无话不谈或天南海北，却也聊得及其畅快，仿佛自己已然是个爷们儿了。</p><p>“她有种想要做个爷们儿闯天下的冲动。她想要的从来都不是上街shopping画指甲聊八卦，她想要的是像个男人一样独立而沉稳，像个男生一样热血而爽快，她渴望铁打的哥们儿情谊，轰轰烈烈的炙热爱情。”<br></p><p>不要误会，我是直的。</p><p>我只是想在加班到半夜的时候，能叫上失眠或者刚打完dota的哥们儿，吃个烧烤喝个啤酒。<br></p><p>那么简单。可是好难。</p><p>这世界那么大，可就是没有一个城市，可以让我同时拥有家人，随叫随到的朋友，和一份我想要的工作。<br><br>现在的我，再一次陷入翻了几遍通讯录后无所适从的状态。</p><p>人都是有被了解的渴望吧，却又不愿随便一个人就能走进自己的内心。即使是在和朋友促膝长谈那样的时刻，我解下了戒备，却还是无法完全坦露自我。毕竟历史经验证明，这样的姑娘太容易遇上偏见。<br><br>让人沮丧的是，即使再珍惜，没有时间的堆积也很难弥补生命里太久的缺席。常年在外的我，一边与老友疏离着，一边无法再花更多的精力去结交一个新朋友。</p><p>于是就像一块漂浮的木头，随波，不自控，不知将要去到哪里。</p><p>当时在微博里写下：</p><p>“对于可以料想的未来里更为长久的分离，我已经开始怀念还未成为过去的当下。”</p><p>是啊，就是这样，正在经历分离的我正在无比怀念那些一高兴就忘记时间的日子。彼此生活中有太多留白，下次再见，我会不会对你们不知所措的say hi？</p><p>也不是没有适应一个人吃吃喝喝，也不是没有人陪伴，只是不再是爷们儿的感觉。我那不拘小节的豪放性格啊，该收收了。</p><p>不是每一次举杯都要一饮而尽，不是每一只烤串都是一次就撸完，也不是每条生活轨迹交叠了就不会再各奔东西。</p><p>这就是生活呐。嗯，最后一口啤酒，喝完就滚去睡觉。</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-16 13:54', 8, 0, 12, 'article/155452111231805161354/1805161354.jpg', '2'),
('15554754123180512121212', 16, '15554754123', 'Faker或将成为韩国首位免除兵役电竞选手，宋仲基都没这待遇', ' <div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <p>近日，据消息称：韩国设立“电竞名誉殿堂”。包括委员会选出的BoxeR、FlaSh、YellOw、NaDa、iloveoov等5位，以及由7500位人气投票选出的Jaedong、Bisu、Moon、Faker、Bengi、PraY等6位。</p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 600px; max-height: 302px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 50.33%;\"></div>\r\n<div class=\"image-view\" data-width=\"600\" data-height=\"302\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5078459-e626b17be3f1d3c7\" data-original-width=\"600\" data-original-height=\"302\" data-original-format=\"image/jpeg\" data-original-filesize=\"46504\"></div>\r\n</div>\r\n<div class=\"image-caption\"></div>\r\n</div><p>自电子竞技运动发展以来韩国电竞行业一直都走在世界的前列，设立的“电竞名誉殿堂”也更一步确定了电竞在韩国的地位，同时再一次向全世界宣布：电竞也可以像传统体育运动一样，受到人们喜爱和尊重。</p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 533px; max-height: 300px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.28999999999999%;\"></div>\r\n<div class=\"image-view\" data-width=\"533\" data-height=\"300\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5078459-6c4579c5386890af\" data-original-width=\"533\" data-original-height=\"300\" data-original-format=\"image/jpeg\" data-original-filesize=\"17647\"></div>\r\n</div>\r\n<div class=\"image-caption\"></div>\r\n</div><p>众所周知，在韩国有服兵役的准则，韩国男人30岁前必须到军队报到入伍服役两年。这件事对韩国众多的偶像明星来说都是必需要跨过去的一道坎。随着电子竞技快速发展，社会影响力逐渐增强。诞生出的游戏明星选手服兵役问题逐渐进入公众视眼。</p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 600px; max-height: 314px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 52.33%;\"></div>\r\n<div class=\"image-view\" data-width=\"600\" data-height=\"314\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5078459-6ce9134e43994cf2\" data-original-width=\"600\" data-original-height=\"314\" data-original-format=\"image/jpeg\" data-original-filesize=\"23867\"></div>\r\n</div>\r\n<div class=\"image-caption\"></div>\r\n</div><p>众所周知电竞行业非常吃青春饭，很多选手都是年少成名，SKT王朝的中野组合便是其中之一。Faker、Bengji入选荣誉殿。作为5届LCK联赛冠军得主，更是带领SKT这个强大的队伍获得S3、S5、S6世界赛冠军，Faker大魔王被人们所熟知，LOL这个游戏成就了Faker，Fake也成功的推动LOL的影响力。然而韩国并非没有革除兵役一说，但必须是要作出特别奉献的人。那么这位曾经为韩国拿下3座世界总冠军在世界规模内不断推进韩国电竞开展的Faker是否有这样的资历呢？</p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 330px; max-height: 230px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 69.69999999999999%;\"></div>\r\n<div class=\"image-view\" data-width=\"330\" data-height=\"230\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5078459-8f6535f6d57468f5\" data-original-width=\"330\" data-original-height=\"230\" data-original-format=\"image/jpeg\" data-original-filesize=\"9155\"></div>\r\n</div>\r\n<div class=\"image-caption\"></div>\r\n</div><p>有韩媒体报道：LOL等电竞赛事当选了2022亚运会，分析称如果Faker能够参与并且在该项目上协助韩国队夺冠，特别奉献的人荣誉将非他莫属，进而可以革除兵役。因为在LOL非玩家集体中亚运会的世界影响力要比电竞职业联赛更大，所以如果能够成功拿到冠军奖牌是有极强的说服力的。</p><p>2022亚运会时Faker是26岁，因而仍然还能够继续工作。并且假如真的能够在亚运会上拿到金牌夺冠，这个免兵役的资历的确是十分诱人的。</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-12 12:12', 6, 0, 14, 'article/15554754123180512121212/180512121212.jpg', '1|10'),
('15558754125180510101010', 15, '15558754125', '大陆以东，有离岛，其名东极', ' <div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <p>      </p><p></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 388px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 55.52%;\"></div>\r\n<div class=\"image-view\" data-width=\"2048\" data-height=\"1137\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6083136-6a993c8d15a74d02.jpeg\" data-original-width=\"2048\" data-original-height=\"1137\" data-original-format=\"image/jpeg\" data-original-filesize=\"874223\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p><br></p><p>       这个世界上有很多尽头，有南极有北极，有路止于此，有海止于斯。但在我们到不了的尽头处，有一座可以抵达的孤岛——舟山东极岛。</p><p>      韩寒的一部《后会无期》，让很多人重新认识了这个地方。东极不是一个特定的岛，它是岛屿的总称，其中主要包括东福山岛、庙子湖岛，青浜（bang）岛等等。</p><p>       关于东极岛的旅行攻略，网上有很多，其中不乏好的攻略，所以虫子也就无需多说了。（才不是懒～）</p><p>      </p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 486px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 69.51%;\"></div>\r\n<div class=\"image-view\" data-width=\"1840\" data-height=\"1279\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6083136-9dcdf219738ea052.jpeg\" data-original-width=\"1840\" data-original-height=\"1279\" data-original-format=\"image/jpeg\" data-original-filesize=\"818449\"></div>\r\n</div>\r\n<div class=\"image-caption\">很形象的一幅画</div>\r\n</div><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 954px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 136.32%;\"></div>\r\n<div class=\"image-view\" data-width=\"1360\" data-height=\"1854\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6083136-b378e9a166227f97.jpeg\" data-original-width=\"1360\" data-original-height=\"1854\" data-original-format=\"image/jpeg\" data-original-filesize=\"530489\"></div>\r\n</div>\r\n<div class=\"image-caption\">庙子湖岛</div>\r\n</div><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\r\n<div class=\"image-view\" data-width=\"1440\" data-height=\"1920\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6083136-490566af58eed3f9.jpeg\" data-original-width=\"1440\" data-original-height=\"1920\" data-original-format=\"image/jpeg\" data-original-filesize=\"1036726\"></div>\r\n</div>\r\n<div class=\"image-caption\">庙子湖岛</div>\r\n</div><p>     庙子湖岛是政府所在地，东极几个岛里面最热闹的应该就是它了。岛上设施是相对比较完善的，也是电影《后会无期》的主演取景地。</p><p>     </p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 525px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.0%;\"></div>\r\n<div class=\"image-view\" data-width=\"2000\" data-height=\"1500\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6083136-45f2cee9d2450b52.jpeg\" data-original-width=\"2000\" data-original-height=\"1500\" data-original-format=\"image/jpeg\" data-original-filesize=\"792134\"></div>\r\n</div>\r\n<div class=\"image-caption\">东福山岛</div>\r\n</div><br><p></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 525px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 75.0%;\"></div>\r\n<div class=\"image-view\" data-width=\"2000\" data-height=\"1500\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6083136-ff79a152fe912f14.jpeg\" data-original-width=\"2000\" data-original-height=\"1500\" data-original-format=\"image/jpeg\" data-original-filesize=\"801612\"></div>\r\n</div>\r\n<div class=\"image-caption\">东福山岛</div>\r\n</div><p></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 450px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 64.29%;\"></div>\r\n<div class=\"image-view\" data-width=\"1879\" data-height=\"1208\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6083136-67d1ba3968b2bc28.jpeg\" data-original-width=\"1879\" data-original-height=\"1208\" data-original-format=\"image/jpeg\" data-original-filesize=\"590520\"></div>\r\n</div>\r\n<div class=\"image-caption\">东福山岛</div>\r\n</div><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 463px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 66.21000000000001%;\"></div>\r\n<div class=\"image-view\" data-width=\"2048\" data-height=\"1356\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/6083136-88d7ee829a03ca41.jpeg\" data-original-width=\"2048\" data-original-height=\"1356\" data-original-format=\"image/jpeg\" data-original-filesize=\"459047\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p>      最早东极流传着一句佳话:东极除了人,其它都是野生的。</p><p>      几个岛之中，个人比较推荐东福山岛，景致好，人不多，但是条件不好也是真的。</p><p>     东福山是看日出的绝佳地方，前提是那天天气要好。当时为了看到日出，连续两天早上4点爬起来，去观景台那边蹲守。</p><p>      等到下午阳光不那么强烈的时候，可以坐在海边听海涛，吹海风，看日落。</p><p>      岛上的电是靠驻岛部队的，所以供电很不稳定。有可能多开了几台空调，岛上就会发生停电的情况，然后在一片漆黑中，耳边传来几声尖叫声。</p><p>     还有不太美好的地方就是，岛上信号不太好，断断续续的。不过刚好可以治治手机控这个毛病。</p><p>     由于行程紧张，倒是无缘青浜岛。如果未来有机会，能再去那里看看。</p><p>    东极岛，我们后会有期！</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-10 10:10', 14, 0, 20, 'article/15558754125180510101010/180510101010.jpg', '11'),
('15754856125180510101712', 13, '15754856125', '我是怎么开始学英文花体字的', '<div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <p>从小我的汉字写的不错，没有正经练过，但几乎每个老师都夸我的字好。于是我也就沾沾自喜，真的觉得我的字挺好的。可惜现在看过太多好字，觉得自己的字实在是无法入目，算不得一门特长，也无法跟上时代潮流来教人写字变现。<br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\r\n<div class=\"image-view\" data-width=\"3024\" data-height=\"4032\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8844965-2576bc65e42b0016.jpg\" data-original-width=\"3024\" data-original-height=\"4032\" data-original-format=\"image/jpeg\" data-original-filesize=\"2843770\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p><br></p><p></p><p></p><p>也曾发誓要重新练字，却越练越难看。误打误撞却进入了一个英文练字群，写的是英文圆体。因为酷爱英语，平时的工作也基本和英语相关，于是花了几百块报名学了花体。</p><p>说实话英文花体挺好写的，相对于复杂的汉字来说，英文花体简直就是一个月就可以从入门到精通，只不过自学好像总摸不到门道，所以想想花了几百块也值了。</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\r\n<div class=\"image-view\" data-width=\"3024\" data-height=\"4032\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8844965-bc6cbd32616edde8.jpg\" data-original-width=\"3024\" data-original-height=\"4032\" data-original-format=\"image/jpeg\" data-original-filesize=\"2452237\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p><br></p><p>学完圆体后因为写的不错，带了一次班，赚了点钱，所以学费也就赚回来了。后来又学了铜板印刷体，不过这次很后悔，收获不多。后来便开始了其他字体的自学。研究了一些书法资料和书籍，也看了不少大神的作品，有了基础感觉进步飞速，很多东西都是相通的。<br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\r\n<div class=\"image-view\" data-width=\"3024\" data-height=\"4032\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8844965-97a790078433dd0c.jpg\" data-original-width=\"3024\" data-original-height=\"4032\" data-original-format=\"image/jpeg\" data-original-filesize=\"2313849\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p><br></p><p></p><p>综合各方面因素，最后选了brush lettering，现在完全爱上了它。比起国产圆体，它更美观灵动；比起铜版印刷体，它更个性又创意。其实最重要的原因是，它最便宜。几块钱的笔，外加一张纸，就可以开始写字了，不需要挖个大坑跳进去。<br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\r\n<div class=\"image-view\" data-width=\"3024\" data-height=\"4032\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8844965-9200855ff4f27fcb.jpg\" data-original-width=\"3024\" data-original-height=\"4032\" data-original-format=\"image/jpeg\" data-original-filesize=\"3257373\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\r\n<div class=\"image-view\" data-width=\"3024\" data-height=\"4032\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/8844965-60257d4c7423799c.jpg\" data-original-width=\"3024\" data-original-height=\"4032\" data-original-format=\"image/jpeg\" data-original-filesize=\"2229333\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p><br></p><p><br></p><p></p><p>从硬的秀丽笔到软头的自来水笔也才几个月时间，但还是不够，所以还是要每天坚持写字，坚持练习，坚持学习更优秀的作品，坚持思考，坚持成一个习惯，一个爱好，一个职业。</p><p>别人或许通过打游戏或看电视来休闲，我却是看书写字画小画，怡然自得，废寝忘食。</p><p>就这样继续精进吧。</p><p><br></p><p>后续会继续更新花体相关帖子和入门教程。</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-10 10:17', 3, 0, 12, 'article/15754856125180510101712/180510101712.jpg', '5'),
('17826857055180514111524', 2, '17826857055', '移动端 or 服务端？', '    <div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <blockquote>\r\n<p>今天的话题，我想这是当今无数初入行业的程序员无法拿定主意的一个话题</p>\r\n</blockquote>\r\n<h4>看移动端开发</h4>\r\n<p>之前我发表的一篇！ <a href=\"https://www.jianshu.com/p/40c6abec6401\" target=\"_blank\">移动端开发者以后的路在哪里</a><br>\r\n在简书上受到了很多人的关注和认可，我用心总结了处在移动端的劣势和趋势，不了解的朋友可先行点击回看，看完再回来。</p>\r\n<p>文中有提及的，就不在此一 一重复了。为了命中要害，更为直接的得出结论，故在此简单总结一下：</p>\r\n<p>文中我先就 Android 的立场表明了 Android 开发以后的趋势，在原生开发开发这块并不会走向终结。</p>\r\n<p>但是我的意思很明显，我指的只是在一个相当长的时间里网页不会完全取代原生，这个时间有多长，谁都确定不了，瞬息万变的互联网任谁都无法准确做出这个判断。</p>\r\n<p>毫无疑问的是移动端开发正在逐步向网页靠拢，小至创业公司，大致 BAT，无论是 iOS 还是 Android，目前都是以这样的形态存在着。</p>\r\n<p>而这样的形态造就了移动开发领域极强的便捷性，一套解决方案，多平台公用。如此发展的市场导致了以下几点：</p>\r\n<ol>\r\n<li>移动端开发人员需求骤降</li>\r\n<li>开发因前端与网页的渗入而门槛变高</li>\r\n<li>以上两点共同导致开发人员过剩，市场饱和，开发人员鱼龙混杂，参差不齐。造成现在很多公司招聘一个职位也需要很长时间，头痛不已！大浪淘沙只能靠时间来磨...</li>\r\n</ol>\r\n<h4>用数据说话，不要被流行词迷惑</h4>\r\n<p>Stack Overflow 最新一期的开发者调查报告显示，对于开发人才的需求一直处于一个上涨趋势，如今正是互联网高速发展时期，必然是一个上升趋势，而且会一直持续下去，开发人员过剩并说明不了什么，为什么这么说？</p>\r\n<p>如今行业里边儿如果你细心观察，对于此类问题：比如做移动端还是服务端，前端或后端，Android 还是 iOS，此类问题的关注者 90% 以上都是初级开发者。</p>\r\n<p>因为不管是什么语言哪个方向，现在市场对于初级开发者的需求都处于一个饱和状态了，现在互联网行业大量人才涌入，学校，培训机构，高薪资的诱惑阻挡不了转行大军以及求职大军，985 211 这种院校的人才都烂大街了，更别说普通院校了！</p>\r\n<p>相对来说中高级的需求还是特别旺盛的，好多公司就比如 BAT 这种体量的，如今招聘也是要磨足时间，就是我上面所说的大浪淘沙，要的是中级和高级，淘掉的是为了迎合市场需求而包装成中高级的开发者。</p>\r\n<p>Stack Overflow 的另一项调查结果，关于开发者薪资，移动端现在是垫底的，但是我需要申明的是这个结果不包含中国内地。</p>\r\n<p>毫无疑问中国移动互联网目前是领军之国，很多人可能在局中并不清楚，包括苹果 FaceBook 对中国目前移动互联网的发展都极其担忧，而 FaceBook 借鉴微信的地方比比皆是，因为中国是唯一 一个带上手机和充电宝就可以搞定你日常生活的国家。</p>\r\n<p>而领先指的不仅仅是腾讯，还有包括阿里巴巴，新生代美团，滴滴等等。这些信息指明了中国对于移动开发人员的需求没有比之更高的，所以 Stack Overflow 的这一调查并不适用国内。</p>\r\n<p>而事实也说明了在两三年以上大多数同级开发者比较的数据来看，移动端薪资还是略胜一筹，远的不看，如今上海在我身边的这样的案例比比皆是。</p>\r\n<p>无论是 Stack Overflow 还是 GitHub 或别的权威网站的数据表明，开发人员需求还是很旺盛的，但初级需求已经是一个死结了。</p>\r\n<p>所以当你看到哪个语言好，哪个方向怎么样，什么饱和了之类的字眼的时候，不要去盲目跟随，初级开发的饱和已是一个不争的事实，而这些结论的来源毫无疑问是以点概面，没有一点说服力，误导了大量开发者。好多人转做其他语言或方向之后才被现实惊醒，怎么还是饱和的？</p>\r\n<h4>移动端 or 服务端 or 任何方向</h4>\r\n<p>关于服务端，就拿 java 来举例，我有刚培训出来经验不足的朋友，起初做的 Android，发觉市场太严苛时转做了 javaWeb，可到头来却发现都是一样的，这也足矣印证了以上的结论。</p>\r\n<p>再比如现在 Python 很受关注，需求也进一步变得旺盛，因为机器学习和数据抓取的缘故。</p>\r\n<p>但你随便去一个招聘网站上浏览一下招聘要求，你会发现什么三年五年以上的到了刷屏状态，当一个方向被定义成高需求高关注量的时候，那这个领域显然已经聚集了大量人员储备，就中国目前的就业压力和人口这没什么可抱怨的。</p>\r\n<p>我说了我有刚入行的朋友起初做移动端做得不景气，但是还有人也一同是新手，但他们做得倒是井井有条，我相信无论你是初级还是高级，这样的案例你已经不觉得有什么稀奇了！</p>\r\n<p>什么心灵鸡汤大道理再讲就是废话了，你在开始你的职业生涯的时候，一定先拿准你的定位，你爱好移动端还是服务端，或者别的方向，这是最重要的！</p>\r\n<p>在做这些决定的时候你要结合你自身条件，而什么端比较下来工作性质完全都是不同的，再结合了自身条件后选择适合自己符合兴趣所在的。</p>\r\n<p>就拿我一个 211 院校的朋友来举例，实习期做的编程发现对此不感兴趣，之后转入产品，做了产品经理，一毕业即和美团签订劳务合同，年薪 20w+，可能有人就觉得我拿这个说事就有点不合适了，且看我逐步道出。</p>\r\n<p>我的这位朋友他对自身条件的定位就很准确，及时做出了调整，并有能力胜任这份工作。这个事例这是为了说明定位的重要性！</p>\r\n<p>就比如你以后的方向在于管理或产品，但你自身实力和学历都不强，所以你想先积累两年的技术背景，对于这样的发展规划来说就很好，首先你要结合自身而选择技术领域，接下里为之奋斗付出。</p>\r\n<p>再者就是想一直从事技术的朋友，那这个时候你想有一个明确的方向，长期发展发展下去，此刻就更不应该被流行词和谣言所影响。</p>\r\n<p>同样结合自身条件选择技术领域，这个世界上只缺乏一种人，那便是认真工作的人，你选择好自己看好和喜欢的方向，掌握技术人的看家本领，即学习能力，语言和方向只是挥手一瞬间！</p>\r\n<p>当你再纠结投入哪个方向的时候，希望以上结论可以帮到你。</p>\r\n<div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 100px; max-height: 100px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 100.0%;\"></div>\r\n<div class=\"image-view\" data-width=\"100\" data-height=\"100\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/5276837-777e7cc4192f144c.png\" data-original-width=\"100\" data-original-height=\"100\" data-original-format=\"image/png\" data-original-filesize=\"14000\"></div>\r\n</div>\r\n<div class=\"image-caption\">手写我心，吐血版珍藏持续更新中，一个你会爱上的公众号</div>\r\n</div>\r\n\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-14 11:15', 8, 0, 14, 'article/17826857055180514111524/180514111524.jpg', '5|6'),
('17826857056180509121418', 1, '17826857056', '盛世楼台---滕王阁', '<div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 672px; max-height: 488px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 72.61999999999999%;\"></div>\r\n<div class=\"image-view\" data-width=\"672\" data-height=\"488\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3029399-70736397b62e50a2.png\" data-original-width=\"672\" data-original-height=\"488\" data-original-format=\"image/png\" data-original-filesize=\"281862\"></div>\r\n</div>\r\n<div class=\"image-caption\">楼有点歪，将就看哈</div>\r\n</div><p><b>【零】序</b></p><p>中国古代一到盛世，帝王将相或是封疆大吏吃饱了撑得慌就总要找点事来干，要不凸显不了自己的文治武功，因此留下不少亭台楼阁，但是一到乱世就被摧毁，摧毁了又建，建了又毁，这治世乱世来回颠倒，不注意就到我们啦。</p><p><b>【壹】大师情怀</b></p><p>当年梁思成先生带着弟子莫宗江大江南北到处跑，形色匆匆，就为调查中国古代建筑概貌，写中国建筑史，后来有一次路过南昌，时任南昌交通厅长为梁启超先生门生，请梁思成师徒歇脚，并邀请梁先生绘制滕王阁图，先生欣然应允，亲手绘制了滕王阁草图，希望有朝一日能重建滕王阁！</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 522px; max-height: 585px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 112.07000000000001%;\"></div>\r\n<div class=\"image-view\" data-width=\"522\" data-height=\"585\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3029399-db36542b874f7c02.png\" data-original-width=\"522\" data-original-height=\"585\" data-original-format=\"image/png\" data-original-filesize=\"145638\"></div>\r\n</div>\r\n<div class=\"image-caption\">大师名作</div>\r\n</div><p>前几年去南昌出差，每次去都是匆匆忙忙，完事就往回赶。后来又有一次机会，那天下午没事，想起梁先生风尘仆仆的样子，总觉得还是该去看看这崭新的旧楼，才算对得起先生百忙之中画的滕王阁草图！  </p><p><b>【贰】宋阁最好</b></p><p>趁着夕阳还在，打车出门，并不远！</p><p>阁有九层（我其实没数出来九层），不过九为极，也不能再增加层数。</p><p>地宫里有唐宋元明清五个朝代的典型楼阁模型。</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 414px; max-height: 523px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 126.33000000000001%;\"></div>\r\n<div class=\"image-view\" data-width=\"414\" data-height=\"523\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3029399-de70d58b0c08270f.png\" data-original-width=\"414\" data-original-height=\"523\" data-original-format=\"image/png\" data-original-filesize=\"273744\"></div>\r\n</div>\r\n<div class=\"image-caption\">唐阁，原谅我用的锤子手机</div>\r\n</div><p>唐阁看起来胖胖的，这个和那个时代对女人的审美观基本一致！</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 378px; max-height: 465px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 123.02%;\"></div>\r\n<div class=\"image-view\" data-width=\"378\" data-height=\"465\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3029399-0ecb021c3347f88f.png\" data-original-width=\"378\" data-original-height=\"465\" data-original-format=\"image/png\" data-original-filesize=\"256217\"></div>\r\n</div>\r\n<div class=\"image-caption\">宋阁</div>\r\n</div><p>宋阁已经偏瘦了！</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 378px; max-height: 533px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 141.01%;\"></div>\r\n<div class=\"image-view\" data-width=\"378\" data-height=\"533\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3029399-efa7e8e5326d0453.png\" data-original-width=\"378\" data-original-height=\"533\" data-original-format=\"image/png\" data-original-filesize=\"276534\"></div>\r\n</div>\r\n<div class=\"image-caption\">元阁</div>\r\n</div><p>元阁，和我看到的蒙古人体型很像，特别是腾格尔的体型！</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 401px; max-height: 546px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 136.16%;\"></div>\r\n<div class=\"image-view\" data-width=\"401\" data-height=\"546\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3029399-39cf0d7831093f12.png\" data-original-width=\"401\" data-original-height=\"546\" data-original-format=\"image/png\" data-original-filesize=\"260755\"></div>\r\n</div>\r\n<div class=\"image-caption\">明阁</div>\r\n</div><p>不知道为啥，看到明阁总觉得下面窄上面宽，像要倒要倒的样子。</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 388px; max-height: 453px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 116.75%;\"></div>\r\n<div class=\"image-view\" data-width=\"388\" data-height=\"453\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3029399-0da412cb7ed0bbf2.png\" data-original-width=\"388\" data-original-height=\"453\" data-original-format=\"image/png\" data-original-filesize=\"240384\"></div>\r\n</div>\r\n<div class=\"image-caption\">清阁</div>\r\n</div><p>清阁有几分大成殿的感觉，但是太古板。</p><p>对比下来，还是宋阁好看，稳重，飘逸，俊秀，怪不得梁先生要用宋阁为底稿！</p><p><b>【叄】落霞秋水</b></p><p>地宫除了唐宋元明清五阁模型，还可以买到滕王阁赖以成名的序，就是滕王阁能借此名列江南三大名楼的滕王阁序，里面有我最喜欢的东坡手书，也有文征明的手书，真是看得爱不释手！</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 508px; max-height: 1471px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 210.23999999999998%;\"></div>\r\n<div class=\"image-view\" data-width=\"508\" data-height=\"1068\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3029399-9441a812d212cbb9.png\" data-original-width=\"508\" data-original-height=\"1068\" data-original-format=\"image/png\" data-original-filesize=\"723718\"></div>\r\n</div>\r\n<div class=\"image-caption\">滕王阁序-东坡手书</div>\r\n</div><p>把名句放上来，大家欣赏下。</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 530px; max-height: 637px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 120.19%;\"></div>\r\n<div class=\"image-view\" data-width=\"530\" data-height=\"637\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/3029399-1bb676cd7c05d46d.png\" data-original-width=\"530\" data-original-height=\"637\" data-original-format=\"image/png\" data-original-filesize=\"585759\"></div>\r\n</div>\r\n<div class=\"image-caption\">落霞秋水</div>\r\n</div><p>江南三大名楼，才游过一处，还有两处，还有那些不太出名的阅江楼、谢朓楼、黄楼、超然台、平山堂、醉翁亭！</p><p>里面好多地方其实还没有建起来，但总觉得现在这些封疆大吏总会去建的。</p><p>余生还长，慢慢逛，慢慢赏！</p><p>汉字为母语真好！</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-09 12:14', 10, 0, 11, 'article/17826857056180509121418/180509121418.jpg', '8'),
('17826857056180509131401', 1, '17826857056', '美国城市小记－前五年，我在费城生活过', '<div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <p><i>横跨东西部，前五年里我在4个不同的城市停留。</i></p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 300px; max-height: 300px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 100.0%;\"></div>\r\n<div class=\"image-view\" data-width=\"300\" data-height=\"300\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/12074071-c893b3a5b3b513be.jpeg\" data-original-width=\"300\" data-original-height=\"300\" data-original-format=\"image/jpeg\" data-original-filesize=\"23666\"></div>\r\n</div>\r\n<div class=\"image-caption\">I Love Philly~!</div>\r\n</div><h2>费城－City of (Black) Brotherly Love</h2><p><i>要说费城的关键词：便宜，老黑，旧城谱着新曲儿。</i></p><p>费城是我真正美国生活的开始，我的前两年在这儿度过。当初申请学校的时候，我的第一条件就是位置。即便学校的排名不是很高，位置好的话，我相信生活、找工作都会比较容易。事实证明，费城真的是东部学习生活性价比第一之地。类比一下的话，费城就好比咱们河北，占着离北京很近的风水宝地，却远比北京消费指数低。费城同理，北上开车2小时到纽约，南下开车2小时到华盛顿DC，生活费却是纽约DC一半左右。</p><h4><b>在费城读书，你会发现找工作的范围很广。</b></h4><p>纽约可能是你最想去的地方——华尔街装逼金融狗，布鲁克林玩艺术的设计师，各大律所的律政俏佳人，如此如此。各种钱多逼格高的专业的毕业生，在NY都能找到自己梦想的公司。</p><p>如果你说，我不在乎钱不钱的，我是个治世之才，那么DC是你的选择。以世界银行为首的各种非营利机构，等着不在乎钱的文科生商科生们提壶济世；各种咨询公司遍地开花，以自己的智慧为客户们指一柳暗花明之路；还有那些用嘴就能改变世界的政客们，他们是DC的主角，真正的国家大事弹指间灰飞烟灭。</p><p>费城的隔壁，是以普林斯顿大学为中心地的新泽西。学Science的同学们，特别是化学，生物，医药，电子工程的，欢迎来到学术气氛浓厚、与世无争的新泽西。最后，如果你愿意留守费城，也不错。费城没有什么特别有特色的行业，但是各大公司都在费城有分部。如果你想成为费城的老大，欢迎去Comcast，毕竟Comcast 的总部就是费城。</p><h4>黑人可以说是费城最大的特色</h4><p>我有个习惯，对每个城市都只提炼一个个人感觉最深的点。我想费城的特点不是什么费城人自己都说不出来的“brotherly love”，而是无处不在的黑哥哥黑姐姐们和gentrification。Gentrification 通俗点儿翻译就是城乡结合，只不过中国的城乡结合多是外来务工住在城市边缘，而美国是外来富人把原来住在这里的穷（黑）人挤到城市边缘。</p><p>我的学校就是gentrification的中心。学校半径10条街区之内，请了百来个警察驻守保护同学们的安全。我刚到学校的时候，orientation（新生欢迎）专门有个安全教育。天色黑了以后，无论男女，不要在在学校以外自己走路，要打电话让高大威猛的警察叔叔和你同行。如果你住在离学校10街以外，打电话让校巴把你送回家。学长学姐们说，晚上不要坐地铁，因为满地铁都是吸毒的流浪汉。就算白天，最好也和别人一起搭地铁。</p><p>是的，在费城，你要时时刻刻注意自己的安全。</p><p>就因为黑人非常的多，我直观的感受到了美国的阶级差距和人种多样。美国不再是我在国内想象的那种热情白人，逍遥自在，而是一个多种族多颜色有着各种冲突和融合的地方，这让我为之惊叹。加之我是一个很喜欢黑人文化的人，所以并不像其它华人那么对费城的黑人深恶痛绝。</p><h4>旧城谱着新曲儿</h4><p>费城是美国的独立革命的一个符号，也是美国最开始的临时首都。Independence Hall 是美国和英国签署独立宣言之地，Liberty Bell 象征着美国的独立（虽然那缝是越裂越开），Benjamin Franklin 是费城的代表偶像，是除了第一总统George Washington 之外的全民第二pick 了。这些都无不代表着美国200多年历史最厚重的部分。</p><p>虽然费城的红砖瓦，老街道让其外貌上是个老妪，但这个城市的内核却生机盎然得如20岁少女。</p><p>市中心的高楼是各大会计公司、通讯公司，围绕在这些公司的附近是很酷的酒吧和年轻人的狂乐之地。费城也出了很多的黑人明星，这些年轻的黑人新秀们把专属于费城的城乡碰撞文化写进歌里、写到脱口秀中，影响着整个美国。还有高校，年轻的灵魂在每个周五周六都在街头晃荡。每到春天的时候，大学生们排队在街上参加着各个society的排队，spring fling 是整个学校的疯狂。</p><p>说到底，我很感激自己选择了费城这个层次很丰富的城市。虽然我呆着这个地方只有短短的两年，却感受到了美国社会的高低跨度、最老的历史和年轻的灵魂，还有我和Franklin 都喜欢的the Franklin Fountain 雪糕，哈哈哈哈哈。</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 933px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 133.32999999999998%;\"></div>\r\n<div class=\"image-view\" data-width=\"1200\" data-height=\"1600\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/12074071-ca9ed13a7c8e456f.JPG\" data-original-width=\"1200\" data-original-height=\"1600\" data-original-format=\"image/jpeg\" data-original-filesize=\"275424\"></div>\r\n</div>\r\n<div class=\"image-caption\">The Franklin Fountain 雪糕</div>\r\n</div>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-09 13:14', 4, 0, 7, 'article/17826857056180509131401/180509131401.jpg', '8'),
('17826857056180511123532', 7, '17826857056', '有望手握赛点？骑士5弱点步行者别手软：7将仅1人能帮詹皇', ' <div data-note-content class=\"show-content\">\n          <div class=\"show-content-free\">\n            <div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 360px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"360\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1264463-b0cd51e2cb1219c4\" data-original-width=\"640\" data-original-height=\"360\" data-original-format=\"image/jpeg\" data-original-filesize=\"58485\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>在步行者再次以92-90拿下比赛后，骑士在首轮已经遭遇2-1的困境。</p><p>事实上骑士在半场结束时还能手握17分的领先优势，并且在进入第四节时还能以71-63领先，就本赛季来看，骑士进入第四节还能保有领先优势很大程度上就意味着比赛都能稳稳拿下，毕竟在进入第四节还能领先时骑士确实有40胜0负的战绩摆在那。</p><p>在首轮系列赛第四场比赛开始前，不少球迷认为步行者有很大机会能拿下3-1的赛点。那么下面我们就来看看骑士已经陷入困境的5个理由：</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 360px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"360\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1264463-5b5d84b0081f0953\" data-original-width=\"640\" data-original-height=\"360\" data-original-format=\"image/jpeg\" data-original-filesize=\"38392\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>1）步行者实力并不比骑士差</b></p><p>首先可以肯定的是，步行者能拿下系列赛首战并不是侥幸，当然第3场比赛也不是。主教练麦克米兰率领这支步行者打出坚实的攻防两端表现，至少他们所表现出的态度是并不畏惧连续三年卫冕东部冠军的骑士。</p><p>首场比赛中步行者仅在半场就能拿下57-40的领先优势，并且这场比赛似乎也让球队对拿下这轮系列赛更有信心。别忘了，常规赛期间步行者对阵骑士的4场比赛中能稳稳拿下3场，再加上目前2-1落后，这也是该让詹姆斯心里发慌的因素。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 360px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"360\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1264463-c3c33831eed71e42\" data-original-width=\"640\" data-original-height=\"360\" data-original-format=\"image/jpeg\" data-original-filesize=\"43443\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>2）步行者知道该如何防守</b><b>詹姆斯</b></p><p>要消除詹姆斯对比赛的影响肯定是不可能，但步行者队詹姆斯的防守确实已经做得很好。这其中像史蒂芬森，博格达诺维奇和赛迪斯-杨等都能很好地轮换防守詹姆斯。当然步行者阵中其他防守球员也能很好地完成自己的工作。</p><p>骑士在G1前19分钟仅能得到20分，下半场也仅有30分的输出，更何况这段时间内骑士28投仅9中，三分12投1中并有多达10次失误。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 360px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"360\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1264463-f65d682e293b0643\" data-original-width=\"640\" data-original-height=\"360\" data-original-format=\"image/jpeg\" data-original-filesize=\"53448\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>3）骑士其他球员没能给到詹姆斯必要的帮助</b></p><p>在G3中詹姆斯能砍下28分12篮板和8助攻的数据表现，乐福也能得到19分，但骑士进攻端却没有其他能有所贡献的球员。科沃尔和JR史密斯两人场均才共得到14分，虽说乔治-希尔在G3中还能有不错的表现并得到13分，但像小南斯，胡德和克拉克森等球员却并没有在得分上有所贡献。</p><p>自从交易截止日以来，骑士这套阵容老实说都没能真正打出该有的化学反应和效果，至少上述7名球员中，真正能在进攻端给到詹姆斯较大帮助的恐怕就只有乐福一人。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 360px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"360\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1264463-a3e92e3e516a4cae\" data-original-width=\"640\" data-original-height=\"360\" data-original-format=\"image/jpeg\" data-original-filesize=\"31322\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>4）骑士三分球手感不佳</b></p><p>作为联盟中三分球最好的球队之一，骑士在G3却仅有31.3%的投篮命中率表现，系列赛首场比赛更是仅有23.5%。对于一支如此依赖三分进攻的球队来说，这样的表现对进攻端伤害有多大也是可想而知。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 360px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"360\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1264463-f050fe5e690140a8\" data-original-width=\"640\" data-original-height=\"360\" data-original-format=\"image/jpeg\" data-original-filesize=\"27980\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p><b>5）骑士无法保持整场比赛的防守专注</b></p><p>在系列赛过去三场比赛中骑士都能将步行者的得分限制在100分以内，只是当比赛最后时刻需要抓紧防守时，骑士往往会出现某些状况。</p><div class=\"image-package\">\n<div class=\"image-container\" style=\"max-width: 640px; max-height: 360px;\">\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.25%;\"></div>\n<div class=\"image-view\" data-width=\"640\" data-height=\"360\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/1264463-aaeef27643e76cde\" data-original-width=\"640\" data-original-height=\"360\" data-original-format=\"image/jpeg\" data-original-filesize=\"39119\"></div>\n</div>\n<div class=\"image-caption\"></div>\n</div><p>同时，第三场比赛中得到18分的奥拉迪波同样也算是能在进攻端完成自己的任务，而波格丹诺维奇不仅能盯防詹姆斯，在第三场比赛中三分9中7并砍下30分更是步行者能拿下比赛的关键，此外就连赛迪斯-杨都能稳稳得到12分。</p>\n          </div>\n        </div>\n    </div>', '2018-05-11 12:35', 17, 0, 20, 'article/17826857056180511123532/180511123532.jpg', '1'),
('17826857056180515071352', 11, '17826857056', '天底下最多的就是这种创业者', '来自以色列和美国的两个年轻人一同搭船到异国闯天下，由于志趣相投，遂结为好友。\r\n\r\n下了码头后，他俩看着海上的豪华游艇从面前缓缓而过，都非常羡慕。以色列人对美国人说：“如果有一天我也能拥有这么一艘船，那该有多好！”美国人连连点头，表示非常同意。\r\n\r\n\r\n\r\n午饭时间到了，\r\n\r\n他们都觉得肚子有些饿，两人四处看了看，发现不远处有一个快餐车，不少人在排队购买，生意好像不错。\r\n\r\n以色列人就对美国人说：“我们不如也来做快餐的生意吧。”美国人说：“你这主意确实不错，可是你看旁边的咖啡厅生意也很好，不如咱们再走走看看吧！”\r\n\r\n这一次两人意见没有统一，\r\n\r\n于是就此各奔东西。\r\n\r\n握手言别后，\r\n\r\n以色列人毫不犹豫，马上利落地选择了一个适当的地点，投下所有的本钱做起了快餐。他勤恳认真，经过八年的用心经营，最后生意越做越大，一连开了许多家快餐连锁店。有了钱之后，以色列人兑现了自己的梦想：买了一艘游艇。\r\n\r\n这一天，以色列人驾着游艇正准备出去游玩，发现一个衣衫褴褛的男子从远处走了过来，似曾相识。他定睛一看，那人竟然就是当年与他一起出来闯天下的美国朋友。\r\n\r\n以色列人兴奋地下了船，激动地问：“朋友，我想死你了，这八年来，你都在做些什么呢？”美国人回答道：“这八年间，我每时每刻都在想，我到底该做什么呢？”', '2018-05-15 07:13', 3, 0, 5, 'article/17826857056180515071352/180515071352.jpg', '3'),
('17826857056185141076', 0, '17826857056', '哈哈', '测试', '', 0, 0, 0, 'article/default.jpg', '1'),
('17854125425180513071314', 9, '17854125425', '为什么不再有周星驰？', '<div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 371px; max-height: 316px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 85.18%;\"></div>\r\n<div class=\"image-view\" data-width=\"371\" data-height=\"316\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/11690733-418e26eb5277d5ea.jpg\" data-original-width=\"371\" data-original-height=\"316\" data-original-format=\"image/jpeg\" data-original-filesize=\"12360\"></div>\r\n</div>\r\n<div class=\"image-caption\"></div>\r\n</div><p>少年观影碟片上。捧腹笑穿肠。壮年观影剧院中。长吁短叹、妆伪知淡浓。</p><p>而今观影电脑下。声已轻轻也。炎凉冷暖总人情。一任时钟、滴答到天明。</p><p><br></p><p>我相信这是许多周星驰影迷的感受，同样也是我的，经久不衰，当是经典。</p><p><br></p><p>自周以后，近十几年来的喜剧印象深刻的寥寥无几，被人重温的更是屈指可数，何况养活平台的诸位主播？现在大多所谓的喜剧影片只抓住了无厘头，再来个衣带哲理的尾巴，便欣欣然自觉自得周氏幽默，大肆打着旗号招摇撞骗起来，更有甚者，偷些网梗，盗些热词，不经加工，便是与时俱进，迎合大众。殊不知喜剧不是装疯卖傻，让你演失忆得像三岁小孩，结果演成了傻子，缺灵性一味。喜剧不是通篇玩乐，嘻哈了一整场，最后几分钟没有任何铺垫得让观者哭，心凉了半截。无厘头尚且弄不明白，还要装内涵，这是中国喜剧的一大悲哀。一个笑得想哭，一个骂得想笑。</p><p>八两金、如花、酱爆.......每一个角色都那么鲜明，甚至有的没有一分钟，没有台词，也令人记忆犹新，这不是时下奇装异服，故意搞怪来表达一个角色所能拥有的效果。周的电影每一个角色，包括路人都是活的，有呼吸的，而现在女主角，女二号整得一样，只能通过服饰发髻分辨，请原谅我的脸盲。一个影片的成功与否，配角、路人、甚至一草、一木亦不容忽视，不容摆错，要说不合理不舒服我可能说不出，但令人不对，总归是有不对的地方。</p><p>周的喜剧有许多经典桥段，经典台词，但也有尬的片段，总之很少，瑕不掩瑜。目前，王宝强是一名很好的喜剧演员（说到他，不由想讲点题外话，周偶像是李小龙，一开始也希望走武打明星，奈何当上了喜剧之王，王亦是如此，谁愿意当一个“笑星”呢？），但总感觉少了帮手（类似周的黄金配角），少了好导演（那时的鬼点子王晶），这是可遇不可求的。有些时候可以再夸张一点，再嗨一点，有些时候不需要台词，呼吸声就够了，幅度加大，不要浮夸，便更上一层楼。周的经典也许不是当时的经典，但经典不会尘封，经典将是永恒的经典。</p><p>周的故事多是小人物的故事，身边的故事，感人至切，感人至深。一条无厘头的明线，一条黑色彩的暗线交织埋下，贯彻始终，骤然的反转只是铺垫的呼应。所以如今特效满屏、大片烂街，仍不少人愿意静静的回味一番，仅仅因偶然想起的某个片段，忘了某段台词，想看某个角色......因为这更贴近我们身边，仿佛可能就在身边，真实往往是最真挚的追求。</p><p>那为什么周不拍了呢？没有东西了吗？我认为原因有三</p><p>一、累了</p><p>不注意保养，满头近白的头发，超过了这个年纪，还原最真实的自己的同时，也是当初拍电影心力交瘁的原因，周拍电影很严格，可以说是苛刻，一人一物稍有不对便重新再来，一想出新点子，推倒重来亦是常事，工作到凌晨也是家常便饭，哪是现在这些念123456台词的小鲜肉所能比的？一个是演员，一个是明星，一个是艺术，一个流水，一个是质量，一个是数量，一个是口碑，一个是片酬。哎，一旦歇下来就歇下来了，像“松弛”的李连杰，“肥胖”的科比。</p><p>二、变化</p><p>现在变化日新月异，今年流行的明年就out了，每年的每年的词汇都在变化，这不是以前的那个年代所能企及的。有人说称热拍啊，我说周准备一个电影剧本肯定花费很多心思，准备好几年，而不是现在眼看电视剧第一部火了，赶紧写第二部，怕冷了这群观众，慢了这种题材。而几年呕心沥血的作品很可能跟不上这个时代了。</p><p>三、期望</p><p>由于现在烂片无数，名导名演的作品大多也是充斥着铜臭味，影片质量愈来愈差，宣传手段愈来愈高。所以许多人回味老片，尤其是港片，非常渴望周星驰能再次出山，比如热度不减十几年的功夫2，期望越大，失望越大，我们寄予了很高很高的期望，以至于“不敢拍”，伤了粉丝的心，不如守护着美好的憧憬。</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-13 07:13', 14, 0, 17, 'article/17854125425180513071314/180513071314.jpg', '4'),
('17854235412180515122614', 10, '17854235412', '君子也争——《论语》学习', '子曰：“君子无所争，必也射乎?揖让而升下，而饮，其争也君子。”\n\n【钱穆译】先生说：“君子对人没有什么争，除却和人比射时。但先必相互作揖，才升到堂上去。比射后，又相互作揖才退下。胜者败者又必相互作揖了再升堂，举杯对饮。这样的争，还是君子之争呀。”\n\n【杨伯峻译】孔子说：“君子没有什么可争的事情。如果有所争，一定是比箭吧，［但是当射箭的时候，］相互作揖然后登堂；［射箭完毕，］走下堂来，然后［作揖］喝酒。那一种竞赛是很有礼貌的。”\n\n【傅佩荣译】孔子说：“君子没有什么可争的。如果一定要有，那就比赛射箭吧。比赛时，上下台阶与饮酒，都拱手作礼，互相谦让，这样的竞争也是很有君子风度的。”\n\n“必也”可解释成“如果一定要有”，“除却”意思是对的。 “揖让而升下，而饮”是古代射箭礼仪。\n\n本篇讲君子无所争，要说有争，只有在比赛射箭时，因为射箭是有很多礼仪的，君子比射之争也是君子之争。古代的射箭比赛有很多的礼仪，“揖让而升下，而饮”这些都是礼仪的形式，做到了这些，争个胜负，争个高低，都是人们真实内心的反映了，体现了人的真诚，不是表面意义上的“君子无所争”。概括一下，就是“君子也争，争也君子。”\n\n君子只要直面了自己内心，就不要囿于繁文缛节的束缚，真诚地做自己该做的事。这里有两个概念，一个是符合礼，一个是内心真诚。\n\n现在人们最讨厌的是“虚假”和“虚伪”及“不成体统”，虚、假、伪是违背自己的内心，体统全无是不符合礼的标准，是离经叛道。所以，我们不论在人前人后，尊重自己的内心，待人处事，不断修炼自己，致力于德行修养的提升上，跟自己竞争，实现自我超越，成为君子。', '2018-05-15 12:26', 2, 0, 9, 'article/17854235412180515122614/180515122614.jpg', '7');
INSERT INTO `larticle` (`Xaid`, `Psid`, `Vaccount`, `Dtitle`, `Tcontent`, `Rdate`, `Klike`, `Wcomment`, `Oread`, `Kpicture`, `Vlabel`) VALUES
('17868752546180511111324', 8, '17868752546', '《恋爱回旋》——生活没有奇迹', 'div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 510px; max-height: 274px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 53.73%;\"></div>\r\n<div class=\"image-view\" data-width=\"510\" data-height=\"274\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/2596314-a288581a2581dfd7.jpg\" data-original-width=\"510\" data-original-height=\"274\" data-original-format=\"image/jpeg\" data-original-filesize=\"14694\"></div>\r\n</div>\r\n<div class=\"image-caption\"></div>\r\n</div><p>“成年人的生活里没有容易二字”，第一次看到看到这句话是在一个图片上，图片内容是一个老者的讲话。</p><p>电影《恋爱回旋》中，新垣结衣饰演的女主富田多满子是一个很普通的女孩，小的时候，母亲一直逼着富田打乒乓球，但是她一点都不喜欢打。影片中的福田也说过，她只是一个普通人，想要普通的生活，普通的恋爱，普通的结婚普通的过完一生，她渴望的生活是平凡的生活，平凡的嫁人生子，但平凡的生活也很难得到。</p><p>终于在等母亲过世后，富田就完全抛弃兵乓球，从此放飞自我，一路上普通的上学，普通的工作，直到的得到一份普通的工作，但是富田不知道的是，兵乓球是她唯一的闪光点，把兵乓球收起来以后，她的人生真的是普普通通了。</p><h1>1 普通的人生</h1><p>毕业后，富田在一家企业工作，做着自己不喜欢的工作，过着普通的生活，却没想到，在这家公司遇到兵乓球天才江岛。此前，她一直渴望有一天，王子会出来拯救自己，江岛的出现，让她以为他就是那个王子。</p><p>江岛说，和她在一起很舒服。但富田不知道的是，江岛之所以和她在一起，也是因为江岛认出了她曾经是乒乓球选手。</p><p>江岛生日那天，富田到江岛家为他准备晚餐，把自己打扮成一个礼物，想给江岛一个惊喜，没想到是江岛给了她一个“惊喜”，江岛和兵乓球搭档爱莉搂在沙发上。</p><p>心灰意冷的富田，提交了离职信，喝的烂醉跑回乡下，本来想回家当啃老族，结果父亲说自己还欠外债，让富田有机会就去工作顺便还钱。</p><p>于是，回家啃老失败，以前的同学吉冈叫富田好好经营富田家开的花儿兵乓球俱乐部。</p><p>一开始，富田是拒绝的，她说自己要去外企工作，至于俱乐部的死活，她才不关心呢。而所谓的外企工作，就是外企工厂里面的流水线工人。</p><h1>2“为什么中国队是世界第一”</h1><h1>　“因为他们训练最刻苦”</h1><p>终于在一次次的思想斗争中，福田以夺回“江岛”为自己的理由，硬拉着俱乐部的成员，嫁给医生的家庭主妇，经营圣女果农场的中年夫妇，被前妻抛弃的职业拳击手。。。。。一群失败者，但是人生并不是充满奇迹，不是说打就打得赢。</p><p>第一次参加比赛的时候，花儿乒乓球俱乐部连一个球都没有赢，灰溜溜地回来了，富田还摔伤了脚。本来想要放弃，但终究还是不甘心，毕竟，他们还没有真正努力过。</p><p>卖麻婆豆腐的老张和老板娘是中国人，富田他们几个问老板娘乒乓球是不是打得很厉害。老板娘悲伤地说，他们乒乓球打得很烂，进不了中国国家队，只能到日本卖麻婆豆腐。</p><p>“为什么中国队是世界第一”</p><p>　　“因为他们训练最刻苦”</p><p>在刻苦的训练下，他们终于进入了决赛，面对最后的对手，也只是以微小的差距落败。富田一开始打球的动机是不纯的，但是在努力打球的过程中，她变得更自信、更优秀。</p><p>在兵乓球中领悟到了很多人生哲理：人生就像打球一样，需要不断地前进，不能后退，不能怯弱。</p><h1>3 可是她拼尽全力去生活，你们别瞧不起人</h1><p>这部片子里面的人即使努力了也不一定得冠军，但却收获了最好的自己。</p><p>福田没有和江岛复合，瑛太和他前妻也没复合；他前妻和上司在一起（看来当初没打错）；他们的组合也没有获得第一，但是拿了第二；凉子姐姐获得了丈夫认可；元信夫妇帮儿子实现了打全国赛的梦想。</p><p>现实生活中不就是这样么，很多时候，努力了不见得人生真的开挂了。但至少在努力的过程中，我们收获了很多。不管是生活中失意也好，爱情中被甩了也好，努力走出来，找到一个人生方向，你一定能成为最好的自己。</p><p>是的，生活没有奇迹，但我们不能因为这个原因就放弃努力：正是因为努力，他们才能得到上述的结果。如果不努力的话，他们肯定会继续原来的生活。</p>\r\n          </div>\r\n        </div>\r\n    </div>\r\n', '2018-05-11 11:13', 2, 0, 5, 'article/17868752546180511111324/180511111324.jpg', '4'),
('17868752546180511111521', 8, '17868752546', '《初恋这首情歌》：奏出我们的青春曲', '<div data-note-content class=\"show-content\">\r\n          <div class=\"show-content-free\">\r\n            <p>  曾经那个为爱和梦不顾一切的自己最可爱</p><p>  纯情的梦，可爱的人，简简单单的事，才是那个平凡的我们。</p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 1037px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 148.15%;\"></div>\r\n<div class=\"image-view\" data-width=\"1080\" data-height=\"1600\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/796174-4c6aa8c492de12ec.jpg\" data-original-width=\"1080\" data-original-height=\"1600\" data-original-format=\"image/jpeg\" data-original-filesize=\"758425\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p>  《初恋这首情歌》这个绵长的名字令我一开始对这个片子有很多的误解，本以为会是朦胧镜头下草地上的奔跑，滤镜下的教室课桌前你和我···</p><p>   但却是一部惊喜之作，很久没有这样被单纯美好的青春所打动了。</p><p>    导演约翰卡尼，爱尔兰导演，音乐人，他的电影中最少不了的就是音乐，所以这部电影里的每首歌都好听到炸裂，甚至会让人忽略剧情，全身心投入。</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 568px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 52.59%;\"></div>\r\n<div class=\"image-view\" data-width=\"1080\" data-height=\"568\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/796174-cc96cd00cbe5c6c6.jpg\" data-original-width=\"1080\" data-original-height=\"568\" data-original-format=\"image/jpeg\" data-original-filesize=\"306561\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p>   故事很简单，不轰轰烈烈。十四岁的康纳因为家境窘迫被迫转达教会学校读书，那里的老师死板苛刻，还不幸地惹上了“校霸”。本是一片灰暗的现实，这时他遇到了拉菲娜，为了吸引她的注意，康纳邀请拉菲娜来担任自己乐队MV的主演，然而其实康纳对音乐一窍不通，还好身边有群靠谱的伙伴，然后“Sing Street”乐队就成立了···</p><p>   简单的因爱而生，然后为梦是对梦想的追逐。但看的令我又哭又笑，全身颤抖。</p><p>  虽然别人的青春有音乐和姑娘，而我却只能校服和考试。但更多的是来自全世界青少年的烦恼共鸣，曾几何时， 我们蒙在被子里想躲避父母的争吵声，我们与老师对峙试图维护少年的骄傲，我们那扑通激动地心脏被现实打击到冷却。但，也曾悄悄在日记本上写下那些称不上理想且羞于说出口的梦。</p><p>   烦恼，迷茫，幻想，一身热血，这就是青春。不过跟电影比起来，我们的青春似乎无聊极了，但这是只有自己能评说的岁月，不容他人轻蔑。</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 551px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 51.019999999999996%;\"></div>\r\n<div class=\"image-view\" data-width=\"1080\" data-height=\"551\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/796174-4feb5212c0323b33.jpg\" data-original-width=\"1080\" data-original-height=\"551\" data-original-format=\"image/jpeg\" data-original-filesize=\"280645\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p>     一直对青春片满怀希望但却总是又差强人意。明明是最纯情美好的年纪，但总是被用力过猛的表现。  初恋其实很简单，喜欢很简单，而对梦想的渴望更是最初的悸动。这个年纪的我们被过分的妖魔化，标签化。</p><p>   但其实我们都是简单的像康纳一样去追求美好，做些蠢事，不计后果。但却像拉菲娜那样被现实击打的一塌糊涂，然后我们沉沦，继续迷茫。不过最后仍会继续勇往直前，虽然一切未卜。</p><p><br></p><div class=\"image-package\">\r\n<div class=\"image-container\" style=\"max-width: 700px; max-height: 607px;\">\r\n<div class=\"image-container-fill\" style=\"padding-bottom: 56.2%;\"></div>\r\n<div class=\"image-view\" data-width=\"1080\" data-height=\"607\"><img data-original-src=\"//upload-images.jianshu.io/upload_images/796174-d7cb2d7ed88b9178.jpg\" data-original-width=\"1080\" data-original-height=\"607\" data-original-format=\"image/jpeg\" data-original-filesize=\"252791\"></div>\r\n</div>\r\n<div class=\"image-caption\">图片发自简书App</div>\r\n</div><p>   或许导演所创造的小世界太理想，令人觉得生活很美好，梦想都能实现。或许太理想化的美好似乎无法在这个世界很好的继续，但这种触及心灵的热泪盈眶提醒着我们，我们都曾年轻过，我们都曾拥有着。</p><p>  也许我的青春没有这么精彩，但会在某个午夜时分陷入幻想，试图站在世界之巅。    </p><p>  都说青春是拿来祭奠的，怀念的，也许吧。但更愿我们可以永远青春着。</p>\r\n          </div>\r\n        </div>\r\n    </div>', '2018-05-11 11:15', 10, 0, 19, 'article/17868752546180511111521/180511111521.jpg', '4');

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
  `Gaid` varchar(22) COLLATE utf8_bin NOT NULL COMMENT '文章号',
  `Uauthor` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '文章作者',
  `Aaccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Pdate` char(16) COLLATE utf8_bin NOT NULL COMMENT '阅读日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `ohistory`
--

INSERT INTO `ohistory` (`Gaid`, `Uauthor`, `Aaccount`, `Pdate`) VALUES
('155452111231805161354', '17826857055', '17826857056', ''),
('1555475412318051212121', '15554754123', '17826857056', '');

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

-- --------------------------------------------------------

--
-- 表的结构 `ruser`
--

CREATE TABLE `ruser` (
  `Raccount` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `Ipassword` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '登录密码',
  `Hnickname` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `Uhead` varchar(30) COLLATE utf8_bin DEFAULT 'user/default.jpg' COMMENT '用户头像',
  `Jbrief` varchar(48) COLLATE utf8_bin DEFAULT '这个家伙很懒，什么都没留下' COMMENT '个人简介',
  `Hcountfocus` int(11) DEFAULT '0' COMMENT '关注数',
  `Kcountfans` int(11) DEFAULT '0' COMMENT '粉丝数',
  `Ycountlike` int(11) DEFAULT '0' COMMENT '喜欢数',
  `Xcountarticle` int(11) DEFAULT '0' COMMENT '文章数',
  `Ecountsubject` int(11) DEFAULT '0' COMMENT '专题数',
  `Rindexback` varchar(30) COLLATE utf8_bin DEFAULT 'user/index.jpg' COMMENT '主页背景',
  `Bcountwords` int(11) DEFAULT '0' COMMENT '总文字数',
  `Gcountliked` int(11) DEFAULT '0' COMMENT '被喜欢数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `ruser`
--

INSERT INTO `ruser` (`Raccount`, `Ipassword`, `Hnickname`, `Uhead`, `Jbrief`, `Hcountfocus`, `Kcountfans`, `Ycountlike`, `Xcountarticle`, `Ecountsubject`, `Rindexback`, `Bcountwords`, `Gcountliked`) VALUES
('13553756152', '2584542r', '心心相惜', 'user/13553756152.jpg', '若无相欠，怎会遇见', 0, 0, 0, 0, 0, 'index/default.jpg', 0, 0),
('13554755478', 't55478', '开心就好', 'user/13554755478.jpg', '人生在世须尽欢，莫使金樽空对月', 0, 0, 0, 1, 0, 'index/default.jpg', 0, 0),
('13583787452', '27276666h', '无所谓喜欢', 'user/13583787452.jpg', '无所谓喜欢，都是荷尔蒙作祟', 0, 0, 0, 1, 0, 'index/default.jpg', 0, 0),
('13754215245', 'jyp45525', '老鼠爱大米', 'user/13754215245.jpg', '你问我爱你有多深，月亮代表我的心', 0, 0, 0, 1, 0, 'index/default.jpg', 0, 0),
('13854214512', 'ja4525425', '快使用双截棍', 'user/13854214512.jpg', '快使用双截棍，吼吼哈哈', 0, 0, 0, 0, 0, 'index/default.jpg', 0, 0),
('15458752345', 'l555422', '摩纳哥梦游记', 'user/15458752345.jpg', '醉生梦死，不思其返', 0, 0, 0, 3, 0, 'index/default.jpg', 0, 0),
('15545211123', '456123k', '磷互爱', 'user/15545211123.jpg', '我什么都不知道，但我知道我是个坏人', 0, 0, 0, 2, 0, 'index/default.jpg', 0, 0),
('15554754123', 'm5454258', '不爱你的猫', 'user/15554754123.jpg', '不是不爱，只是不想伤害', 0, 0, 0, 1, 0, 'index/default.jpg', 0, 0),
('15558754125', 'h7673647', '怀念小时候', 'user/15558754125.jpg', '小时候没有钱却很快乐，现在没有钱也不快乐', 0, 0, 0, 1, 0, 'index/default.jpg', 0, 0),
('15589632542', '765454o', '想你的夜', 'user/15589632542.jpg', '生病了要输液，你问我输什么液，我说想你的夜。', 0, 0, 0, 0, 0, 'index/default.jpg', 0, 0),
('15754856125', 'kkk123456', '编程砖家', 'user/15754856125.jpg', '思考快你一步', 0, 0, 0, 1, 0, 'index/default.jpg', 0, 0),
('15854754254', 'r5428545', '雄霸天下', 'user/15854754254.jpg', '成也风云，败也风云', 0, 0, 0, 0, 0, 'index/default.jpg', 0, 0),
('17826857054', 'zxc123', '天使不投资人', 'user/17826857054.jpg', '我是天使不投资人', 2, 0, 0, 0, 0, 'index/default.jpg', 0, 0),
('17826857055', 'zxc123', '耗子爱骑车', 'user/17826857055.jpg', '坏人获胜的唯一方法就是好人都袖手旁观', 1, 1, 0, 1, 2, 'index/default.jpg', 400, 2),
('17826857056', 'zxc123', '游学者、墨槿', 'user/17826857056.jpg', '人生不是戏剧，而我亦非主角', 2, 2, 0, 3, 1, 'index/default.jpg', 100, 1),
('17854125425', '776558l', '世间无我这般人', 'user/17854125425.jpg', '手触日月摘星辰，世间无我这般人', 0, 0, 0, 1, 0, 'index/default.jpg', 0, 0),
('17854235412', 'a123321', '行者孙孙行者', 'user/17854235412.jpg', '我叫你一声，你敢答应吗？', 0, 0, 0, 1, 0, 'index/default.jpg', 0, 0),
('17855425544', 't7895478', '雪花秀', 'user/17855425544.jpg', '最喜欢冬天一片片飘落的雪花', 0, 0, 0, 0, 0, 'index/default.jpg', 0, 0),
('17868752546', '54125412p', '爱情是什么', 'user/17868752546.jpg', '爱情是一种很玄的东西，揣摩不透', 0, 0, 0, 2, 0, 'index/default.jpg', 0, 0),
('17878785432', 'you54222', '哈哈哈哈逗你玩', 'user/17878785432.jpg', '哈哈哈哈哈哈就爱逗你玩，没有任何原因', 0, 0, 0, 1, 0, 'index/default.jpg', 0, 0);

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
  `GisRead` char(1) COLLATE utf8_bin DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
`author` varchar(12)
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
,`title` varchar(32)
,`article` varchar(24)
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
,`nickname` varchar(10)
,`date` char(16)
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
,`receiver` varchar(12)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_messsubject`
-- (See below for the actual view)
--
CREATE TABLE `view_messsubject` (
`id` int(11)
,`sid` varchar(24)
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
-- 替换视图以便查看 `view_userfans`
-- (See below for the actual view)
--
CREATE TABLE `view_userfans` (
`account` varchar(12)
,`nickname` varchar(10)
,`head` varchar(30)
,`countwords` int(11)
,`countliked` int(11)
,`owner` varchar(12)
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

--
-- 转存表中的数据 `warticlelabel`
--

INSERT INTO `warticlelabel` (`Salid`, `Uname`) VALUES
(1, '体育'),
(9, '历史'),
(5, '学习'),
(2, '情感'),
(11, '摄影'),
(8, '旅游'),
(10, '游戏竞技'),
(4, '电影'),
(3, '经济'),
(12, '美食'),
(7, '读书'),
(6, '软件开发');

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

--
-- 转存表中的数据 `ysubjectlabel`
--

INSERT INTO `ysubjectlabel` (`Tslid`, `Rname`) VALUES
(9, '休闲娱乐'),
(2, '体育'),
(12, '历史'),
(3, '国内旅游'),
(5, '学习'),
(11, '情感'),
(4, '摄影'),
(1, '旅游'),
(8, '生活'),
(6, '程序员'),
(10, '经济'),
(7, '读书');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_article`  AS  select `la`.`Xaid` AS `id`,`la`.`Dtitle` AS `title`,`la`.`Tcontent` AS `content`,`la`.`Rdate` AS `date`,`la`.`Klike` AS `countLike`,`la`.`Wcomment` AS `countComment`,`la`.`Oread` AS `countRead`,`la`.`Kpicture` AS `thumbnail`,`la`.`Vlabel` AS `label`,`ru`.`Raccount` AS `account`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,`hs`.`Usid` AS `sid`,`hs`.`Yname` AS `subjectName` from ((`larticle` `la` left join `ruser` `ru` on((`la`.`Vaccount` = `ru`.`Raccount`))) left join `hsubject` `hs` on((`la`.`Psid` = `hs`.`Usid`))) order by `la`.`Rdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_article_history`
--
DROP TABLE IF EXISTS `view_article_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_article_history`  AS  select `u`.`Raccount` AS `author`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`a`.`Xaid` AS `aid`,`a`.`Dtitle` AS `title`,`a`.`Rdate` AS `date`,`a`.`Klike` AS `countLike`,`a`.`Wcomment` AS `countComment`,`a`.`Oread` AS `countRead`,`a`.`Kpicture` AS `thumbnail`,`h`.`Pdate` AS `historyDate`,`h`.`Aaccount` AS `account` from ((`ohistory` `h` left join `ruser` `u` on((`h`.`Uauthor` = `u`.`Raccount`))) left join `larticle` `a` on((`h`.`Gaid` = `a`.`Xaid`))) order by `h`.`Pdate` desc ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_comment`  AS  select `mc`.`Ecid` AS `id`,`u`.`Raccount` AS `sender`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`mc`.`Dreceiver` AS `receiver`,`mc`.`Odate` AS `date`,`mc`.`Scontent` AS `content`,`la`.`Dtitle` AS `title`,`mc`.`Particle` AS `article`,`mc`.`Rtype` AS `type` from ((`dmesscomment` `mc` left join `ruser` `u` on((`mc`.`Vsender` = `u`.`Raccount`))) left join `larticle` `la` on((`mc`.`Particle` = `la`.`Xaid`))) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_messfocus`  AS  select `f`.`Tautaccount` AS `sender`,`u`.`Hnickname` AS `nickname`,`f`.`Fdate` AS `date`,`f`.`Daccount` AS `account` from (`hautfocus` `f` left join `ruser` `u` on((`f`.`Tautaccount` = `u`.`Raccount`))) order by `f`.`Fdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_messlike`
--
DROP TABLE IF EXISTS `view_messlike`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_messlike`  AS  select `hml`.`Ssender` AS `sender`,`hml`.`Wdate` AS `date`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,`la`.`Xaid` AS `article`,`la`.`Dtitle` AS `title`,`hml`.`Ireceiver` AS `receiver` from ((`hmesslike` `hml` left join `ruser` `ru` on((`hml`.`Ssender` = `ru`.`Raccount`))) left join `larticle` `la` on((`hml`.`Varticle` = `la`.`Xaid`))) order by `hml`.`Wdate` desc ;

-- --------------------------------------------------------

--
-- 视图结构 `view_messsubject`
--
DROP TABLE IF EXISTS `view_messsubject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_messsubject`  AS  select `ms`.`Did` AS `id`,`ms`.`Isubject` AS `sid`,`la`.`Xaid` AS `aid`,`la`.`Dtitle` AS `title`,`ru`.`Hnickname` AS `nickname`,`ru`.`Raccount` AS `sender`,`ms`.`Qreceiver` AS `receiver`,`ru`.`Uhead` AS `head`,`ms`.`Ydate` AS `date` from ((`umesssubject` `ms` left join `ruser` `ru` on((`ms`.`Wsender` = `ru`.`Raccount`))) left join `larticle` `la` on((`ms`.`Carticle` = `la`.`Xaid`))) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_rank_author`
--
DROP TABLE IF EXISTS `view_rank_author`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rank_author`  AS  select `ru`.`Raccount` AS `account`,`ru`.`Hnickname` AS `nickname`,`ru`.`Uhead` AS `head`,`la`.`Xaid` AS `aid`,substring_index(group_concat(`la`.`Dtitle` order by `la`.`Rdate` DESC,',' ASC separator ','),',',1) AS `title` from (`ruser` `ru` left join `larticle` `la` on((`ru`.`Raccount` = `la`.`Vaccount`))) where (`la`.`Xaid` is not null) group by `ru`.`Raccount` order by `ru`.`Gcountliked` desc ;

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
-- 视图结构 `view_userfans`
--
DROP TABLE IF EXISTS `view_userfans`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_userfans`  AS  select `u`.`Raccount` AS `account`,`u`.`Hnickname` AS `nickname`,`u`.`Uhead` AS `head`,`u`.`Bcountwords` AS `countwords`,`u`.`Gcountliked` AS `countliked`,`af`.`Daccount` AS `owner` from (`ruser` `u` join `hautfocus` `af`) where (`u`.`Raccount` = `af`.`Tautaccount`) order by `u`.`Hnickname` desc ;

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
  ADD PRIMARY KEY (`Ecid`);

--
-- Indexes for table `fuserlike`
--
ALTER TABLE `fuserlike`
  ADD PRIMARY KEY (`Hulid`);

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
  ADD PRIMARY KEY (`Gaid`,`Aaccount`);

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
  MODIFY `Ufid` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注号';
--
-- 使用表AUTO_INCREMENT `dmesscomment`
--
ALTER TABLE `dmesscomment`
  MODIFY `Ecid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论号';
--
-- 使用表AUTO_INCREMENT `fuserlike`
--
ALTER TABLE `fuserlike`
  MODIFY `Hulid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户喜欢号';
--
-- 使用表AUTO_INCREMENT `hautfocus`
--
ALTER TABLE `hautfocus`
  MODIFY `Yafid` int(11) NOT NULL AUTO_INCREMENT COMMENT '作者关注号';
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
-- 使用表AUTO_INCREMENT `rsubfocus`
--
ALTER TABLE `rsubfocus`
  MODIFY `Vsfid` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题关注号';
--
-- 使用表AUTO_INCREMENT `smessage`
--
ALTER TABLE `smessage`
  MODIFY `Dmid` int(11) NOT NULL AUTO_INCREMENT COMMENT '私信号';
--
-- 使用表AUTO_INCREMENT `umesssubject`
--
ALTER TABLE `umesssubject`
  MODIFY `Did` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题审核号';
--
-- 使用表AUTO_INCREMENT `warticlelabel`
--
ALTER TABLE `warticlelabel`
  MODIFY `Salid` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章标签号', AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `ysubjectlabel`
--
ALTER TABLE `ysubjectlabel`
  MODIFY `Tslid` int(11) NOT NULL AUTO_INCREMENT COMMENT '专题标签号', AUTO_INCREMENT=13;
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
-- 限制表 `hautfocus`
--
ALTER TABLE `hautfocus`
  ADD CONSTRAINT `fk_user_autfocus1` FOREIGN KEY (`Tautaccount`) REFERENCES `ruser` (`Raccount`),
  ADD CONSTRAINT `fk_user_autfocus2` FOREIGN KEY (`Daccount`) REFERENCES `ruser` (`Raccount`);

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
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


SET SQL_SAFE_UPDATES = 0;