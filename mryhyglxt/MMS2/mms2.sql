-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 11 月 27 日 13:17
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `mms2`
--

-- --------------------------------------------------------

--
-- 表的结构 `xy_auth_group`
--

CREATE TABLE IF NOT EXISTS `xy_auth_group` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `title` char(50) NOT NULL,
  `level` int(2) NOT NULL,
  `pid` int(4) NOT NULL,
  `sort` int(4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `xy_auth_group`
--

INSERT INTO `xy_auth_group` (`id`, `type`, `title`, `level`, `pid`, `sort`, `status`, `rules`) VALUES
(1, 0, '办公室', 0, 0, 1, 1, '2'),
(5, 1, '系统管理员', 1, 1, 1, 1, '309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,403,365,366,402,367,368,369,370,371,372,373,374,375,376,377,404,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,398,396,397,405,399,401,400,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,441,427,428,429,430,431,432,436,433,434,435,437,438,439,440,442,443,444,445,446,447,451,448,449,450,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,472,470,471,473,474,475,476,477,478,480,479,481,482,483,484,485,486,487,488,292,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,1,2,5,3,4,6,7,8,9,10,11,12,13,14,15,16,17,58,18,19,20,21,22,23,56,24,261,262,263,264,265,266,25,26,27,28,57,29,30,31,32,33,34,35,36,247,61,60,37,38,59,39,40,41'),
(6, 1, '老板', 1, 1, 2, 1, '309,588,589,590,591,592,601,602,603,604,605,606,607,608,609,611,612,613,614,615,616,745,746,747,593,594,595,596,597,691,598,599,600,369,557,558,559,560,561,562,563,564,565,566,567,568,569,570,572,571,573,574,575,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,617,618,619,620,621,640,641,642,643,644,645,646,647,584,585,586,587,648,649,650,651,419,420,421,422,423,424,425,426,427,428,429,430,431,432,436,433,434,435,437,438,439,440,442,443,444,445,446,447,451,448,449,450,452,453,454,455,456,457,545,546,547,548,549,463,689,690,576,577,578,670,671,672,743,744,580,581,583,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,673,674,675,676,677,678,679,680,681,682,292,550,551,552,553,554,555,556,683,684,688,719,720,721,722,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,739,740,741,742,1,538,539,540,541,542,543,544,2,5,3,4,7,8,9,10,11,13,14,15,16,17,58,18,19,20,21,23,261,262,264,35,36,247,61,60,37,38,59,39,40,41,489'),
(7, 1, '店长', 1, 15, 3, 1, '309,593,594,598,599,369,557,558,563,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,617,618,619,620,621,640,641,642,643,644,645,646,647,584,585,587,586,419,420,421,422,423,425,426,427,428,437,438,442,443,452,453,456,457,545,546,547,548,549,463,689,690,576,577,578,670,671,672,743,744,580,581,583,652,653,661,662,673,674,675,676,677,678,679,680,681,682,292,719,720,721,722,723,724,725,726,727,728,729,731,732,733,734,736,737,738,739,740,741,742,1,14,15,16,17,58,18,489'),
(14, 0, '财务部', 0, 0, 2, 1, ''),
(15, 0, '市场部', 0, 0, 3, 1, '309,310,311,312,313,318,319,320,321,324,325,326,327,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,353,354,359,360,361,362,363,364,403,365,366,402,367,368,369,370,371,372,373,374,376,377,404,378,379,380,381,384,385,386,387,390,391,392,393,394,398,397,405,537,399,401,406,407,408,409,412,413,414,415,418,490,532,533,491,492,493,494,496,498,499,500,501,502,503,504,505,506,517,518,521,522,523,526,527,528,531,292,294,295,305,306'),
(16, 0, '服务部', 0, 0, 4, 1, '309,310,311,312,313,318,319,320,321,324,325,326,327,335,336,337,338,339,340,341,342,343,344,345,346,348,349,350,351,353,354,359,360,361,362,363,364,403,365,366,402,367,368,369,413,414,415,418,292,294,295'),
(17, 1, '收银员', 1, 15, 4, 1, '309,588,589,590,591,592,601,602,603,604,605,606,607,608,609,611,612,613,614,615,616,745,746,747,593,594,595,597,596,691,598,599,600,369,557,558,559,560,564,565,566,567,568,569,570,572,571,573,574,575,622,623,624,625,640,641,642,643,644,646,647,648,649,650,651,420,421,422,423,424,425,426,427,428,429,430,431,432,436,433,434,435,437,438,439,440,442,443,444,445,446,447,451,448,449,450,452,453,454,455,456,457,545,546,547,548,549,689,690,576,577,578,670,671,672,580,581,583,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,673,674,675,676,677,678,679,680,681,682,292,551,552,553,554,555,556,685,686,687,688,719,720,726,727,538,539,540,541,542,543,544,2,5,3,4,6,7,8,9,10,11,12,13,14,15,16,17,58,18,19,20,21,22,23,56,24,261,262,263,264,265,266,25,26,27,28,57,29,30,31,32,33,34,35,36,247,61,60,37,38,59,39,40,41,489'),
(18, 1, '美容顾问', 1, 16, 5, 1, '309,640,641,642,584,587,586,648,649,419,420,421,426,545,546,547,548,549,463,743,744,292,726,727,728,729,732,733,734,737,738,739,740,741,742'),
(20, 1, '会计', 1, 14, 0, 1, '615,745,369,557,558,419,420,421,422,423,425,426,427,428,429,430,436,433,434,435,437,438,440,442,443,444,445,451,448,449,450,452,453,454,455,456,457,545,546,547,548,549,463,576,577,578,670,671,672,743,744,580,581,583,652,653,654,655,658,659,660,661,662,663,664,665,667,668,669,673,674,675,676,677,678,679,680,681,682');

-- --------------------------------------------------------

--
-- 表的结构 `xy_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `xy_auth_group_access` (
  `uid` mediumint(8) NOT NULL,
  `group_id` mediumint(8) NOT NULL,
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `xy_auth_group_access`
--

INSERT INTO `xy_auth_group_access` (`uid`, `group_id`) VALUES
(1, 5),
(1, 1),
(15, 20),
(15, 1),
(8, 1),
(8, 5),
(14, 15),
(14, 18),
(13, 15),
(13, 18),
(12, 15),
(12, 18),
(11, 15),
(11, 7),
(10, 15),
(10, 17),
(9, 15),
(9, 19),
(16, 17),
(16, 1),
(17, 17),
(17, 14),
(18, 17),
(18, 14),
(19, 15),
(19, 17),
(22, 14),
(22, 17),
(24, 1),
(24, 6),
(27, 14),
(27, 20),
(28, 14),
(28, 17),
(29, 14),
(29, 17),
(30, 14),
(30, 20),
(32, 16),
(32, 18),
(34, 16),
(34, 17),
(33, 1),
(33, 7),
(35, 16),
(35, 18),
(25, 16),
(25, 17),
(31, 16),
(31, 18);

-- --------------------------------------------------------

--
-- 表的结构 `xy_auth_rule`
--

CREATE TABLE IF NOT EXISTS `xy_auth_rule` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `sort` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=754 ;

--
-- 转存表中的数据 `xy_auth_rule`
--

INSERT INTO `xy_auth_rule` (`id`, `level`, `pid`, `name`, `title`, `type`, `status`, `condition`, `sort`) VALUES
(1, 0, 0, 'home/system/index', '系统管理', 1, 1, '', 99),
(2, 1, 1, 'home/org/', '部门管理', 1, 1, '', 1),
(3, 2, 2, 'home/org/add', '新增', 1, 1, '', 1),
(4, 2, 2, 'home/org/edit', '编辑', 1, 1, '', 2),
(5, 2, 2, 'home/org/index', '查看', 1, 1, '', 0),
(6, 2, 2, 'home/org/del', '删除', 1, 1, '', 3),
(7, 2, 2, 'home/org/editrule', '权限', 1, 1, '', 4),
(8, 1, 1, 'home/dep', '职位管理', 1, 1, '', 2),
(9, 2, 8, 'home/dep/index', '查看', 1, 1, '', 0),
(10, 2, 8, 'home/dep/add', '新增', 1, 1, '', 1),
(11, 2, 8, 'home/dep/edit', '编辑', 1, 1, '', 2),
(12, 2, 8, 'home/dep/del', '删除', 1, 1, '', 3),
(13, 2, 8, 'home/dep/editrule', '权限', 1, 1, '', 4),
(14, 1, 1, 'home/user/', '用户管理', 1, 1, '', 3),
(15, 2, 14, 'home/user/index', '查看', 1, 1, '', 0),
(16, 2, 14, 'home/user/add', '新增', 1, 1, '', 1),
(17, 2, 14, 'home/user/edit', '编辑', 1, 1, '', 2),
(18, 2, 14, 'home/user/del', '删除', 1, 1, '', 3),
(19, 2, 14, 'home/user/editrule', '权限', 1, 1, '', 4),
(20, 1, 1, 'home/config/', '数据字典', 1, 1, '', 4),
(21, 2, 20, 'home/config/index', '查看', 1, 1, '', 0),
(22, 2, 20, 'home/config/add', '新增', 1, 1, '', 1),
(23, 2, 20, 'home/config/edit', '编辑', 1, 1, '', 2),
(24, 2, 20, 'home/config/del', '删除', 1, 1, '', 3),
(25, 1, 1, 'home/menu/', '菜单管理', 1, 1, '', 6),
(26, 2, 25, 'home/menu/index', '查看', 1, 1, '', 0),
(27, 2, 25, 'home/menu/add', '新增', 1, 1, '', 1),
(28, 2, 25, 'home/menu/edit', '编辑', 1, 1, '', 2),
(29, 2, 25, 'home/menu/del', '删除', 1, 1, '', 3),
(30, 1, 1, 'home/rule/', '功能列表', 1, 1, '', 8),
(31, 2, 30, 'home/rule/index', '查看', 1, 1, '', 0),
(32, 2, 30, 'home/rule/add', '新增', 1, 1, '', 1),
(33, 2, 30, 'home/rule/edit', '编辑', 1, 1, '', 2),
(34, 2, 30, 'home/rule/del', '删除', 1, 1, '', 3),
(35, 1, 1, 'home/database', '数据备份', 1, 1, '', 10),
(36, 2, 35, 'home/database/index', '查看', 1, 1, '', 0),
(37, 1, 1, 'home/database/', '备份文件', 1, 1, '', 11),
(38, 2, 37, 'home/database/bakup', '查看', 1, 1, '', 0),
(39, 1, 1, 'home/log', '操作日志', 1, 1, '', 15),
(40, 2, 39, 'home/log/index', '查看', 1, 1, '', 0),
(41, 2, 39, 'home/log/del', '删除', 1, 1, '', 1),
(56, 2, 20, 'home/config/lock', '锁定', 1, 1, '', 2),
(57, 2, 25, 'home/menu/lock', '锁定', 1, 1, '', 2),
(58, 2, 14, 'home/user/lock', '锁定', 1, 1, '', 2),
(59, 2, 37, 'home/database/del', '删除', 1, 1, '', 2),
(60, 2, 35, 'home/database/repair', '修复', 1, 1, '', 5),
(61, 2, 35, 'home/database/optimize', '优化', 1, 1, '', 3),
(247, 2, 35, 'home/database/export', '备份', 1, 1, '', 1),
(261, 1, 1, 'home/datalist/index', '分类字典', 1, 1, '', 5),
(262, 2, 261, 'home/datalist/view', '查看', 1, 1, '', 0),
(263, 2, 261, 'home/datalist/add', '新增', 1, 1, '', 1),
(264, 2, 261, 'home/datalist/edit', '编辑', 1, 1, '', 2),
(265, 2, 261, 'home/datalist/lock', '锁定', 1, 1, '', 3),
(266, 2, 261, 'home/datalist/del', '删除', 1, 1, '', 4),
(292, 0, 0, 'home/set/index', '常用设置', 1, 1, '', 55),
(309, 0, 0, 'home/bangong/index', '常用功能', 1, 1, '', 0),
(369, 0, 0, 'home/huiyuan/', '会员管理', 1, 1, '', 1),
(419, 0, 0, 'home/cangku/index', '仓库管理', 1, 1, '', 3),
(420, 1, 419, 'home/chanpin/index', '产品管理', 1, 1, '', 1),
(421, 2, 420, 'home/chanpin/view', '查看', 1, 1, '', 0),
(422, 2, 420, 'home/chanpin/add', '新增', 1, 1, '', 1),
(423, 2, 420, 'home/chanpin/edit', '编辑', 1, 1, '', 2),
(424, 2, 420, 'home/chanpin/lock', '锁定', 1, 1, '', 3),
(425, 2, 420, 'home/chanpin/del', '删除', 1, 1, '', 4),
(426, 2, 420, 'home/chanpin/outxls', '导出', 1, 1, '', 6),
(427, 1, 419, 'home/ruku/index', '入库管理', 1, 1, '', 2),
(428, 2, 427, 'home/ruku/view', '查看', 1, 1, '', 0),
(429, 2, 427, 'home/ruku/add', '新增', 1, 1, '', 1),
(430, 2, 427, 'home/ruku/edit', '编辑', 1, 1, '', 2),
(431, 2, 427, 'home/ruku/lock', '锁定', 1, 1, '', 3),
(432, 2, 427, 'home/ruku/del', '删除', 1, 1, '', 4),
(433, 2, 427, 'home/ruku/shenhe', '审核', 1, 1, '', 5),
(434, 2, 427, 'home/ruku/dayin', '打印', 1, 1, '', 6),
(435, 2, 427, 'home/ruku/outxls', '导出', 1, 1, '', 6),
(436, 2, 427, 'home/ruku/dshenhe', '待审核', 1, 1, '', 4),
(437, 1, 419, 'home/rukus/index', '入库明细表', 1, 1, '', 3),
(438, 2, 437, 'home/rukus/view', '查看', 1, 1, '', 0),
(439, 2, 437, 'home/rukus/del', '删除', 1, 1, '', 4),
(440, 2, 437, 'home/rukus/outxls', '导出', 1, 1, '', 6),
(442, 1, 419, 'home/chuku/index', '出库管理', 1, 1, '', 6),
(443, 2, 442, 'home/chuku/view', '查看', 1, 1, '', 0),
(444, 2, 442, 'home/chuku/add', '新增', 1, 1, '', 1),
(445, 2, 442, 'home/chuku/edit', '编辑', 1, 1, '', 2),
(446, 2, 442, 'home/chuku/lock', '锁定', 1, 1, '', 3),
(447, 2, 442, 'home/chuku/del', '删除', 1, 1, '', 4),
(448, 2, 442, 'home/chuku/shenhe', '审核', 1, 1, '', 5),
(449, 2, 442, 'home/chuku/dayin', '打印', 1, 1, '', 6),
(450, 2, 442, 'home/chuku/outxls', '导出', 1, 1, '', 6),
(451, 2, 442, 'home/chuku/dshenhe', '待审核', 1, 1, '', 4),
(452, 1, 419, 'home/chukus/index', '出库明细表', 1, 1, '', 7),
(453, 2, 452, 'home/chukus/view', '查看', 1, 1, '', 0),
(454, 2, 452, 'home/chukus/del', '删除', 1, 1, '', 4),
(455, 2, 452, 'home/chukus/outxls', '导出', 1, 1, '', 6),
(456, 1, 419, 'home/chanpinbj/index', '库存查询', 1, 1, '', 11),
(457, 2, 456, 'home/chanpinbj/baojing', '库存报警', 1, 1, '', 0),
(463, 0, 0, 'home/caiwu/index', '财务管理', 1, 1, '', 6),
(489, 1, 1, 'home/public/clear', '清理缓存', 1, 1, '', 20),
(490, 0, 0, 'home/weiset/index', '微信设置', 1, 1, '', 9),
(538, 1, 1, 'home/shop/index', '店铺管理', 1, 1, '', 0),
(539, 2, 538, 'home/shop/view', '查看', 1, 1, '', 0),
(540, 2, 538, 'home/shop/add', '新增', 1, 1, '', 1),
(541, 2, 538, 'home/shop/edit', '编辑', 1, 1, '', 2),
(542, 2, 538, 'home/shop/lock', '锁定', 1, 1, '', 3),
(543, 2, 538, 'home/shop/del', '删除', 1, 1, '', 4),
(544, 2, 538, 'home/shop/outxls', '导出', 1, 1, '', 6),
(545, 1, 419, 'home/fxchanpin/index', '统计分析', 1, 1, '', 12),
(546, 2, 545, 'home/fxchanpin/rukus', '入库分析', 1, 1, '', 0),
(547, 2, 545, 'home/fxchanpin/chukus', '出库分析', 1, 1, '', 1),
(548, 2, 545, 'home/tjchanpin/index', '库存统计', 1, 1, '', 2),
(549, 2, 545, 'home/tjchanpin/dayin', '库存统计打印', 1, 1, '', 3),
(550, 1, 292, 'home/dengji/index', '等级管理', 1, 1, '', 1),
(551, 2, 550, 'home/dengji/view', '查看', 1, 1, '', 0),
(552, 2, 550, 'home/dengji/add', '新增', 1, 1, '', 1),
(553, 2, 550, 'home/dengji/edit', '编辑', 1, 1, '', 2),
(554, 2, 550, 'home/dengji/lock', '锁定', 1, 1, '', 3),
(555, 2, 550, 'home/dengji/del', '删除', 1, 1, '', 4),
(556, 2, 550, 'home/dengji/outxls', '导出', 1, 1, '', 6),
(557, 1, 369, 'home/huiyuan/index', '会员列表', 1, 1, '', 1),
(558, 2, 557, 'home/huiyuan/view', '查看', 1, 1, '', 0),
(559, 2, 557, 'home/huiyuan/add', '新增', 1, 1, '', 1),
(560, 2, 557, 'home/huiyuan/edit', '编辑', 1, 1, '', 2),
(561, 2, 557, 'home/huiyuan/lock', '锁定', 1, 1, '', 3),
(562, 2, 557, 'home/huiyuan/del', '删除', 1, 1, '', 4),
(563, 2, 557, 'home/huiyuan/outxls', '导出', 1, 1, '', 6),
(564, 1, 369, 'home/ka/index', '会员充值', 1, 1, '', 2),
(565, 2, 564, 'home/ka/chongzhi', '充值', 1, 1, '', 0),
(566, 2, 564, 'home/ka/gaimi', '更改密码', 1, 1, '', 1),
(567, 2, 564, 'home/ka/gaimiok', '改密保存', 1, 1, '', 2),
(568, 2, 564, 'home/ka/xinmi', '重置密码', 1, 1, '', 3),
(569, 2, 564, 'home/ka/xinmiok', '重置保存', 1, 1, '', 4),
(570, 2, 564, 'home/ka/guashi', '挂失锁定', 1, 1, '', 5),
(571, 1, 369, 'home/ka/huanka', '会员换卡', 1, 1, '', 3),
(572, 2, 564, 'home/ka/guashiok', '挂失保存', 1, 1, '', 6),
(573, 2, 571, 'home/ka/huanok', '换卡保存', 1, 1, '', 0),
(574, 2, 571, 'home/ka/tuikuan', '账户退款', 1, 1, '', 1),
(575, 2, 571, 'home/ka/tuikuanok', '退款保存', 1, 1, '', 3),
(576, 1, 463, 'home/ticheng/index', '提成记录流水', 1, 1, '', 1),
(577, 2, 576, 'home/ticheng/view', '查看', 1, 1, '', 0),
(578, 2, 576, 'home/ticheng/outxls', '导出', 1, 1, '', 1),
(580, 1, 463, 'home/zijin/index', '收银流水', 1, 1, '', 4),
(581, 2, 580, 'home/zijin/view', '查看', 1, 1, '', 0),
(583, 2, 580, 'home/zijin/outxls', '导出', 1, 1, '', 6),
(584, 1, 640, 'home/jifen/index', '积分流水', 1, 1, '', 3),
(585, 2, 584, 'home/jifen/view', '查看', 1, 1, '', 0),
(586, 2, 584, 'home/jifen/dayin', '打印', 1, 1, '', 6),
(587, 2, 584, 'home/jifen/outxls', '导出', 1, 1, '', 6),
(588, 1, 309, 'home/sale/index', '商品消费', 1, 1, '', 1),
(589, 2, 588, 'home/sale/', '会员', 1, 1, '', 0),
(590, 2, 588, 'home/sale/shangpin', '消费', 1, 1, '', 1),
(591, 2, 588, 'home/sale/sanke', '散客', 1, 1, '', 2),
(592, 2, 588, 'home/sale/sankeok', '消费', 1, 1, '', 3),
(593, 1, 309, 'home/xiaofei/index', '消费记录', 1, 1, '', 9),
(594, 2, 593, 'home/xiaofei/view', '查看', 1, 1, '', 0),
(595, 2, 593, 'home/xiaofei/edit', '编辑', 1, 1, '', 2),
(596, 2, 593, 'home/xiaofei/dayin', '打印', 1, 1, '', 6),
(597, 2, 593, 'home/xiaofei/outxls', '导出', 1, 1, '', 6),
(598, 1, 309, 'home/xiaofeis/index', '消费明细表', 1, 1, '', 11),
(599, 2, 598, 'home/xiaofeis/view', '查看', 1, 1, '', 0),
(600, 2, 598, 'home/xiaofeis/outxls', '导出', 1, 1, '', 6),
(601, 2, 588, 'home/xiaofei/guadan', '挂单列表', 1, 1, '', 4),
(602, 2, 588, 'home/sale/jiesuan', '挂单', 1, 1, '', 5),
(603, 2, 588, 'home/sale/jiesuanok', '消费', 1, 1, '', 6),
(604, 2, 588, 'home/sale/delguadan', '删除挂单', 1, 1, '', 7),
(605, 2, 588, 'home/xiaofei/chedan', '消费撤单', 1, 1, '', 8),
(606, 1, 309, 'home/sale/kshy', '快速消费', 1, 1, '', 2),
(607, 2, 606, 'home/sale/kshyok', '会员快速消费', 1, 1, '', 0),
(608, 2, 606, 'home/sale/kssk', '散客快速', 1, 1, '', 1),
(609, 2, 606, 'home/sale/ksskok', '消费', 1, 1, '', 2),
(611, 1, 309, 'home/sale/jici', '计次消费', 1, 1, '', 3),
(612, 2, 611, 'home/ka/chongci', '计次充值', 1, 1, '', 0),
(613, 2, 611, 'home/ka/chongciok', '充值保存', 1, 1, '', 1),
(614, 2, 611, 'home/sale/jiciok', '消费保存', 1, 1, '', 2),
(615, 1, 309, 'home/jiaoban/index', '交班打印', 1, 1, '', 4),
(616, 2, 615, 'home/jiaoban/dayin', '打印', 1, 1, '', 6),
(617, 1, 369, 'home/fxhuiyuan/index', '统计分析', 1, 1, '', 10),
(618, 2, 617, 'home/fxhuiyuan/qushi', '增长趋势', 1, 1, '', 0),
(619, 2, 617, 'home/fxhuiyuan/dengji', '等级分析', 1, 1, '', 1),
(620, 2, 617, 'home/fxhuiyuan/zhuangtai', '状态分析', 1, 1, '', 2),
(621, 2, 617, 'home/fxhuiyuan/juname', '业务员分析', 1, 1, '', 3),
(622, 1, 369, 'home/shouhou/index', '售后服务', 1, 1, '', 5),
(623, 2, 622, 'home/huiyuan/shengri', '近期生日', 1, 1, '', 0),
(624, 2, 622, 'home/huiyuan/weixiaofei', '未来消费', 1, 1, '', 1),
(625, 2, 622, 'home/huiyuan/yue', '余额报警', 1, 1, '', 3),
(626, 1, 369, 'home/huifang/index', '客户回访', 1, 1, '', 5),
(627, 2, 626, 'home/huifang/view', '查看', 1, 1, '', 0),
(628, 2, 626, 'home/huifang/add', '新增', 1, 1, '', 1),
(629, 2, 626, 'home/huifang/edit', '编辑', 1, 1, '', 2),
(630, 2, 626, 'home/huifang/lock', '锁定', 1, 1, '', 3),
(631, 2, 626, 'home/huifang/del', '删除', 1, 1, '', 4),
(632, 2, 626, 'home/huifang/outxls', '导出', 1, 1, '', 6),
(633, 1, 369, 'home/tousu/index', '客户投诉', 1, 1, '', 7),
(634, 2, 633, 'home/tousu/view', '查看', 1, 1, '', 0),
(635, 2, 633, 'home/tousu/add', '新增', 1, 1, '', 1),
(636, 2, 633, 'home/tousu/edit', '编辑', 1, 1, '', 2),
(637, 2, 633, 'home/tousu/lock', '锁定', 1, 1, '', 3),
(638, 2, 633, 'home/tousu/del', '删除', 1, 1, '', 4),
(639, 2, 633, 'home/tousu/outxls', '导出', 1, 1, '', 6),
(640, 0, 0, 'home/lipin/', '积分礼品', 1, 1, '', 2),
(641, 1, 640, 'home/lipin/index', '礼品列表', 1, 1, '', 2),
(642, 2, 641, 'home/lipin/view', '查看', 1, 1, '', 0),
(643, 2, 641, 'home/lipin/add', '新增', 1, 1, '', 1),
(644, 2, 641, 'home/lipin/edit', '编辑', 1, 1, '', 2),
(645, 2, 641, 'home/lipin/lock', '锁定', 1, 1, '', 3),
(646, 2, 641, 'home/lipin/del', '删除', 1, 1, '', 4),
(647, 2, 641, 'home/lipin/outxls', '导出', 1, 1, '', 6),
(648, 1, 640, 'home/duihuan/index', '积分兑换', 1, 1, '', 4),
(649, 2, 648, 'home/duihuan/duihuanok', '兑换保存', 1, 1, '', 0),
(650, 2, 648, 'home/duihuan/biandong', '积分变动', 1, 1, '', 1),
(651, 2, 648, 'home/duihuan/biandongok', '变动保存', 1, 1, '', 2),
(652, 1, 463, 'home/shou/index', '其他收入', 1, 1, '', 5),
(653, 2, 652, 'home/shou/view', '查看', 1, 1, '', 0),
(654, 2, 652, 'home/shou/add', '新增', 1, 1, '', 1),
(655, 2, 652, 'home/shou/edit', '编辑', 1, 1, '', 2),
(656, 2, 652, 'home/shou/lock', '锁定', 1, 1, '', 3),
(657, 2, 652, 'home/shou/del', '删除', 1, 1, '', 4),
(658, 2, 652, 'home/shou/shenhe', '审核', 1, 1, '', 5),
(659, 2, 652, 'home/shou/dshenhe', '待审核', 1, 1, '', 6),
(660, 2, 652, 'home/shou/outxls', '导出', 1, 1, '', 6),
(661, 1, 463, 'home/fukuan/index', '费用支出', 1, 1, '', 6),
(662, 2, 661, 'home/fukuan/view', '查看', 1, 1, '', 0),
(663, 2, 661, 'home/fukuan/add', '新增', 1, 1, '', 1),
(664, 2, 661, 'home/fukuan/edit', '编辑', 1, 1, '', 2),
(665, 2, 661, 'home/fukuan/lock', '锁定', 1, 1, '', 3),
(666, 2, 661, 'home/fukuan/del', '删除', 1, 1, '', 4),
(667, 2, 661, 'home/fukuan/shenhe', '审核', 1, 1, '', 5),
(668, 2, 661, 'home/fukuan/dshenhe', '待审核', 1, 1, '', 6),
(669, 2, 661, 'home/fukuan/outxls', '导出', 1, 1, '', 6),
(670, 1, 463, 'home/fxticheng/index', '员工提成统计', 1, 1, '', 1),
(671, 2, 670, 'home/fxticheng/view', '查看', 1, 1, '', 0),
(672, 2, 670, 'home/fxticheng/dayin', '打印', 1, 1, '', 6),
(673, 1, 463, 'home/fxcaiwu/index', '财务分析', 1, 1, '', 10),
(674, 2, 673, 'home/fxcaiwu/shuliang', '数量增长', 1, 1, '', 0),
(675, 2, 673, 'home/fxcaiwu/jine', '营业额', 1, 1, '', 1),
(676, 2, 673, 'home/fxcaiwu/xianjin', '现金收款', 1, 1, '', 2),
(677, 2, 673, 'home/fxcaiwu/pos', '银联收款', 1, 1, '', 3),
(678, 2, 673, 'home/fxcaiwu/yue', '卡余额支付', 1, 1, '', 4),
(679, 2, 673, 'home/fxcaiwu/juname', '业务员分析', 1, 1, '', 5),
(680, 2, 673, 'home/fxcaiwu/ticheng', '业务提成', 1, 1, '', 6),
(681, 2, 673, 'home/fxcaiwu/leixing', '费用支出类型', 1, 1, '', 6),
(682, 2, 673, 'home/fxcaiwu/fukuan', '费用支出趋势', 1, 1, '', 8),
(683, 1, 292, 'home/smss/index', '短信发送记录', 1, 1, '', 3),
(684, 2, 683, 'home/smss/view', '查看', 1, 1, '', 0),
(685, 2, 683, 'home/smss/lock', '锁定', 1, 1, '', 3),
(686, 2, 683, 'home/smss/del', '删除', 1, 1, '', 4),
(687, 2, 683, 'home/smss/outxls', '导出', 1, 1, '', 6),
(688, 2, 683, 'home/public/sms', '短信余额', 1, 1, '', 7),
(689, 1, 463, 'home/baobiao/index', '营业状况表', 1, 1, '', 0),
(690, 2, 689, 'home/baobiao/dayin', '打印', 1, 1, '', 6),
(691, 2, 593, 'home/xiaofei/liushui', '流水', 1, 1, '', 8),
(692, 1, 490, 'home/weiset/', '账号设置', 1, 1, '', 1),
(693, 2, 692, 'home/weiset/edit', '编辑', 1, 1, '', 2),
(694, 1, 490, 'home/wmenu/index', '微信菜单', 1, 1, '', 2),
(695, 2, 694, 'home/wmenu/view', '查看', 1, 1, '', 0),
(696, 2, 694, 'home/wmenu/add', '新增', 1, 1, '', 1),
(697, 2, 694, 'home/wmenu/edit', '编辑', 1, 1, '', 2),
(698, 2, 694, 'home/wmenu/lock', '锁定', 1, 1, '', 3),
(699, 2, 694, 'home/wmenu/del', '删除', 1, 1, '', 4),
(700, 2, 694, 'home/wmenu/shenhe', '审核', 1, 1, '', 5),
(701, 2, 694, 'home/wmenu/send', '生成', 1, 1, '', 6),
(702, 1, 490, 'home/replay/index', '微信回复', 1, 1, '', 3),
(703, 2, 702, 'home/replay/view', '查看', 1, 1, '', 0),
(704, 2, 702, 'home/replay/add', '新增', 1, 1, '', 1),
(705, 2, 702, 'home/replay/edit', '编辑', 1, 1, '', 2),
(706, 2, 702, 'home/replay/lock', '锁定', 1, 1, '', 3),
(707, 2, 702, 'home/replay/del', '删除', 1, 1, '', 4),
(708, 2, 702, 'home/replay/guanzhu', '首次关注', 1, 1, '', 5),
(709, 2, 702, 'home/replay/wenben', '文本回复', 1, 1, '', 6),
(710, 2, 702, 'home/replay/outxls', '导出', 1, 1, '', 6),
(711, 2, 702, 'home/replay/moren', '默认回复', 1, 1, '', 7),
(712, 1, 490, 'home/replays/index', '回复列表', 1, 1, '', 6),
(713, 2, 712, 'home/replays/view', '查看', 1, 1, '', 0),
(714, 2, 712, 'home/replays/edit', '编辑', 1, 1, '', 2),
(715, 2, 712, 'home/replays/lock', '锁定', 1, 1, '', 3),
(716, 2, 712, 'home/replays/del', '删除', 1, 1, '', 4),
(717, 2, 712, 'home/replays/outxls', '导出', 1, 1, '', 6),
(718, 2, 712, 'home/replays/send', '发送到微信', 1, 1, '', 7),
(719, 1, 292, 'home/news/index', '新闻管理', 1, 1, '', 4),
(720, 2, 719, 'home/news/view', '查看', 1, 1, '', 0),
(721, 2, 719, 'home/news/add', '新增', 1, 1, '', 1),
(722, 2, 719, 'home/news/edit', '编辑', 1, 1, '', 2),
(723, 2, 719, 'home/news/lock', '锁定', 1, 1, '', 3),
(724, 2, 719, 'home/news/del', '删除', 1, 1, '', 4),
(725, 2, 719, 'home/news/outxls', '导出', 1, 1, '', 6),
(726, 1, 292, 'home/yuyue/index', '预约管理', 1, 1, '', 5),
(727, 2, 726, 'home/yuyue/view', '查看', 1, 1, '', 0),
(728, 2, 726, 'home/yuyue/edit', '编辑', 1, 1, '', 2),
(729, 2, 726, 'home/yuyue/lock', '锁定', 1, 1, '', 3),
(730, 2, 726, 'home/yuyue/del', '删除', 1, 1, '', 4),
(731, 2, 726, 'home/yuyue/outxls', '导出', 1, 1, '', 6),
(732, 1, 292, 'home/pingjia/index', '客户评价', 1, 1, '', 7),
(733, 2, 732, 'home/pingjia/view', '查看', 1, 1, '', 0),
(734, 2, 732, 'home/pingjia/lock', '锁定', 1, 1, '', 3),
(735, 2, 732, 'home/pingjia/del', '删除', 1, 1, '', 4),
(736, 2, 732, 'home/pingjia/outxls', '导出', 1, 1, '', 6),
(737, 1, 292, 'home/guwen/index', '美容顾问', 1, 1, '', 8),
(738, 2, 737, 'home/guwen/view', '查看', 1, 1, '', 0),
(739, 2, 737, 'home/guwen/edit', '编辑', 1, 1, '', 2),
(740, 2, 737, 'home/guwen/lock', '锁定', 1, 1, '', 3),
(741, 2, 737, 'home/guwen/del', '删除', 1, 1, '', 4),
(742, 2, 737, 'home/guwen/outxls', '导出', 1, 1, '', 6),
(743, 1, 463, 'home/jsticheng/index', '员工提成汇总', 1, 1, '', 3),
(744, 2, 743, 'home/jsticheng/dayin', '打印', 1, 1, '', 6),
(745, 1, 309, 'home/zijin/chongzhi', '充值打印', 1, 1, '', 5),
(746, 2, 745, 'home/zijin/', '查看', 1, 1, '', 0),
(747, 2, 745, 'home/zijin/dayin', '打印', 1, 1, '', 6),
(748, 1, 490, 'home/guanzhu/index', '关注列表', 1, 1, '', 7),
(749, 2, 748, 'home/guanzhu/view', '查看', 1, 1, '', 0),
(750, 2, 748, 'home/guanzhu/edit', '编辑', 1, 1, '', 2),
(751, 2, 748, 'home/guanzhu/lock', '锁定', 1, 1, '', 3),
(752, 2, 748, 'home/guanzhu/del', '删除', 1, 1, '', 4),
(753, 2, 748, 'home/guanzhu/outxls', '导出', 1, 1, '', 6);

-- --------------------------------------------------------

--
-- 表的结构 `xy_chanpin`
--

CREATE TABLE IF NOT EXISTS `xy_chanpin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(100) NOT NULL,
  `bianhao` varchar(50) NOT NULL,
  `fenlei` varchar(50) NOT NULL,
  `type` varchar(200) NOT NULL,
  `danwei` varchar(20) NOT NULL,
  `rjiage` decimal(10,2) NOT NULL,
  `xjiage` decimal(10,2) NOT NULL,
  `kucun` int(11) NOT NULL,
  `beizhu` varchar(255) NOT NULL,
  `fanwei` tinyint(1) NOT NULL,
  `ticheng` decimal(10,2) NOT NULL,
  `tctype` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `dalei` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品管理' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xy_chanpin`
--

INSERT INTO `xy_chanpin` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `title`, `bianhao`, `fenlei`, `type`, `danwei`, `rjiage`, `xjiage`, `kucun`, `beizhu`, `fanwei`, `ticheng`, `tctype`, `shopid`, `dalei`) VALUES
(1, 24, '张玉龙', '2015-07-17 18:14:43', 0, '', '0000-00-00 00:00:00', 1, '妊娠纹修复套', '6953030209230', '美体面膜', '11', '盒', '12.00', '300.00', 13, '', 0, '7.00', 0, 2, '护肤品'),
(2, 24, '张玉龙', '2015-07-17 18:43:11', 0, '', '0000-00-00 00:00:00', 1, 'few', 'eget', '', '3t3y', '', '1.00', '1.00', 5, '', 0, '1.00', 0, 2, '');

-- --------------------------------------------------------

--
-- 表的结构 `xy_chuku`
--

CREATE TABLE IF NOT EXISTS `xy_chuku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `bianhao` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `shuliang` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `shijian` date NOT NULL,
  `jingban` varchar(50) NOT NULL,
  `shenheren` varchar(50) NOT NULL,
  `shenhe` varchar(50) NOT NULL,
  `shopid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='出库记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xy_chukus`
--

CREATE TABLE IF NOT EXISTS `xy_chukus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `bianhao` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `type` varchar(255) NOT NULL,
  `danwei` varchar(21) NOT NULL,
  `shuliang` int(11) NOT NULL,
  `beizhu` varchar(255) NOT NULL,
  `shenhe` varchar(50) NOT NULL,
  `xid` int(11) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `jingban` varchar(50) NOT NULL,
  `shijian` date NOT NULL,
  `fenlei` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `shopid` int(11) NOT NULL,
  `dalei` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='出库明细表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xy_chukus`
--

INSERT INTO `xy_chukus` (`id`, `status`, `bianhao`, `title`, `type`, `danwei`, `shuliang`, `beizhu`, `shenhe`, `xid`, `edit`, `jingban`, `shijian`, `fenlei`, `number`, `shopid`, `dalei`) VALUES
(1, 1, 'eget', 'few', '', '', 1, '卡号[12]商品消费', '审核通过', 0, 0, '张玉龙', '2015-07-20', '', 'SP2015072009302684', 2, ''),
(2, 1, '6953030209230', '妊娠纹修复套', '盒', '盒', 1, '卡号[12]商品消费', '审核通过', 0, 0, '张玉龙', '2015-07-20', '美体面膜', 'SP2015072005175992', 2, '护肤品');

-- --------------------------------------------------------

--
-- 表的结构 `xy_cika`
--

CREATE TABLE IF NOT EXISTS `xy_cika` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `shopid` int(11) NOT NULL,
  `hid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `bianhao` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `shuliang` int(11) NOT NULL,
  `zjiage` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员次卡' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xy_config`
--

CREATE TABLE IF NOT EXISTS `xy_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fenlei` varchar(20) NOT NULL COMMENT '分类',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `addtime` datetime NOT NULL COMMENT '创建时间',
  `updatetime` datetime NOT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=81 ;

--
-- 转存表中的数据 `xy_config`
--

INSERT INTO `xy_config` (`id`, `fenlei`, `name`, `type`, `title`, `extra`, `remark`, `addtime`, `updatetime`, `status`, `value`, `sort`) VALUES
(1, '系统', 'CONFIG_TYPE_LIST', 3, '配置类型列表', '', '主要用于数据解析和页面表单的生成', '2015-02-01 14:39:41', '2015-02-25 10:44:48', 1, '0:数字\n1:字符\n2:文本\n3:数组\n4:枚举', 0),
(2, '基础', 'PERPAGE', 0, '每页条数', '', '列表分页条数', '2015-02-01 14:49:47', '2015-06-02 12:00:53', 1, '50', 0),
(3, '基础', 'SEARCHKEY', 3, '参与搜索的字段名', '', '', '2015-02-01 14:56:03', '2015-06-29 08:03:37', 1, 'title\r\nbiaoti\r\nmingcheng\r\nname\r\nvalue\r\nxingming\r\ndianhua\r\nphone\r\ntel\r\nqq\r\nemail\r\nbeizhu\r\nlaiyuan\r\njinzhan\r\nsfz\r\ncontent\r\nusername\r\nuname\r\nuuname\r\nurl\r\nip\r\ntruename\r\ndepname\r\nposname\r\ntype\r\nleixing\r\ndanwei\r\nzhiwei\r\ncontent\r\nneirong\r\njinban\r\njingban\r\nshenhe\r\nshenheren\r\nbianhao\r\nnumber\r\nkahao\r\nkeyword\r\nopenid', 0),
(4, '系统', 'DATA_CACHE_TIME', 0, '数据缓存时间', '', '数据缓存有效期 0表示永久缓存', '2015-02-01 15:05:20', '2015-02-25 10:44:23', 1, '14400', 0),
(5, '系统', 'SESSION_PREFIXX', 1, 'session 前缀', '', '', '2015-02-01 15:07:09', '2015-02-25 10:44:17', 1, 'lygxykj', 0),
(6, '系统', 'WEB_SITE_TITLE', 2, '系统名称', '', '', '2015-02-01 15:17:46', '2017-11-27 21:10:19', 1, '美时美刻SPA会所管理系统', 0),
(7, '系统', 'DATA_BACKUP_PATH', 1, '数据库备份路径', '', '', '2015-02-01 15:55:43', '2015-02-25 10:43:53', 1, 'data', 0),
(8, '系统', 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '2015-02-01 15:56:41', '2015-02-25 10:44:00', 1, '20971520', 0),
(9, '系统', 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', '0:不压缩\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '2015-02-01 15:57:49', '2015-02-25 10:43:30', 1, '1', 0),
(10, '系统', 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', '1:普通\n4:一般\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '2015-02-01 15:58:48', '2015-02-25 10:43:25', 1, '9', 0),
(11, '模型', 'MODEL_B_SHOW', 3, '字段模型表单显示', '', '', '2015-02-01 22:12:54', '2015-02-25 10:43:02', 1, '0:不显示\n1:都显示\n2:新增显示\n3:编辑显示', 0),
(12, '模型', 'MODEL_L_SHOW', 3, '字段模型列表显示', '', '', '2015-02-02 14:55:31', '2015-02-25 10:42:53', 1, '0:不显示\n1:显示', 0),
(13, '模型', 'MODEL_B_ATTR', 3, '数据模型中表单属性', '', '', '2015-02-02 15:46:08', '2015-04-15 18:16:56', 1, '0:文本框\n1:文本域\n2:密码框\n3:日期框\n4:编辑器\n5:微调器\n6:单选框\n7:多选框\n8:下拉框\n9:查找带回\n10:上传附件\n11:日期时间框\n12:隐藏字段', 0),
(14, '模型', 'MODEL_B_ISMUST', 3, '数据模型中是否必填', '', '', '2015-02-02 16:05:26', '2015-02-28 11:37:48', 1, '0:非必填\n1:必填\n2:必填日期\n3:必填手机号码\n4:必填EMAIL\n5:必填字母\n6:必填身份证号码\n7:必填中文\n8:必填数字\n9:必填日期时间', 0),
(15, '模型', 'MODEL_B_ISSORT', 3, '数据模型中的字段是否参与排序', '', '', '2015-02-02 19:53:07', '2015-02-25 10:42:27', 1, '0:不参与\n1:参与', 0),
(16, '基础', 'BASE_SEX', 3, '性别', '', '', '2015-02-02 21:21:58', '2015-02-25 10:28:07', 1, '0:男\n1:女', 0),
(17, '基础', 'BASE_XUELI', 3, '学历', '', '', '2015-02-02 21:23:26', '2015-02-25 10:28:01', 1, '0:中专\n1:大专\n2:本科\n3:硕士\n4:博士', 0),
(18, '基础', 'CONFIG_CLASS', 3, '配置分类', '', '', '2015-02-25 10:22:21', '2015-05-13 15:31:07', 1, '0:系统\n1:基础\n2:模型', 0),
(38, '模型', 'MODEL_F_TYPE', 3, '图表类型', '', '', '2015-03-06 14:16:26', '0000-00-00 00:00:00', 1, '0:不生成\n1:3D饼图\n2:柱状图\n3:曲线图\n4:环状图\n5:柱商务图', 0),
(39, '系统', 'WEB_COMPANY_NAME', 2, '单位名称', '', '', '2015-04-05 11:26:27', '2015-05-18 19:24:21', 1, '连云港信友科技有限公司', 0),
(41, '模型', 'MODEL_B_ISSEARCH', 3, '模型中是否参与搜索', '', '', '2015-04-16 09:18:09', '0000-00-00 00:00:00', 1, '0:不参与\n1:参与', 0),
(42, '基础', 'BASE_ZU', 3, '参数组别', '', '', '2015-04-19 11:02:43', '0000-00-00 00:00:00', 1, '少儿A组：3-6岁\n少儿B组：7-9岁\n少年A组：10-12岁\n少年B组：13-18岁\n青年组：19-40岁\n中老年组：40岁以上', 0),
(43, '基础', 'BASE_XM', 3, '参数项目', '', '', '2015-04-19 11:17:43', '0000-00-00 00:00:00', 1, '大众才艺类\n书画美术类\n全民阅读', 0),
(52, '基础', 'CUST_LAIYUAN', 3, '客户来源', '', '', '2015-05-20 10:04:59', '0000-00-00 00:00:00', 1, '百度推广\n电话营销\n主动联系\n客户介绍', 0),
(53, '基础', 'CUSTGD_TYPE', 3, '跟单方式', '', '', '2015-05-20 10:52:25', '0000-00-00 00:00:00', 1, '电话沟通\nQQ/旺旺\n电子邮箱\n上门拜访', 0),
(54, '基础', 'CUSTGD_JINZHAN', 3, '跟单进展阶段', '', '', '2015-05-20 10:56:47', '0000-00-00 00:00:00', 1, '需求整理\n选择比较\n成交客户\n他人签单', 0),
(55, '基础', 'CUST_XUQIU', 3, '客户需求', '', '', '2015-05-20 11:34:07', '0000-00-00 00:00:00', 1, '软件定制\nCRM/OA\n物流管理\n美容院管理', 0),
(56, '基础', 'CHANPIN_FENLEI', 3, '产品分类', '', '', '2015-05-22 10:23:50', '2015-06-02 09:26:43', 1, '软件服务\n软件配套\n办公用品\n', 0),
(57, '基础', 'CHANPIN_DANWEI', 3, '产品单位', '', '', '2015-05-22 10:26:04', '2015-07-03 10:04:07', 1, '只\r\n个\r\n台\r\n卷\r\n套\r\n次\r\n瓶\r\n盒', 0),
(58, '基础', 'SHENHE', 3, '审核状态', '', '', '2015-05-22 16:02:16', '0000-00-00 00:00:00', 1, '审核通过\n退回修改', 0),
(59, '基础', 'QUXIANG_TYPE', 3, '去向类型', '', '', '2015-05-24 23:16:49', '0000-00-00 00:00:00', 1, '外出\n请假\n出差', 0),
(60, '基础', 'HUIBAO_TYPE', 3, '汇报类型', '', '', '2015-05-25 09:15:40', '0000-00-00 00:00:00', 1, '日总结\n周总结\n月总结\n年总结\n其他', 0),
(61, '基础', 'ZHISHI_TYPE', 3, '知识分类', '', '', '2015-05-25 10:39:14', '0000-00-00 00:00:00', 1, '产品知识\n技术知识\n营销知识\n质量知识\n培训资料\n管理知识\n其他知识', 0),
(62, '基础', 'TXL_LEIXING', 3, '通讯录类型', '', '', '2015-05-25 12:24:21', '0000-00-00 00:00:00', 1, '私有\n公共', 0),
(63, '基础', 'RENWU_JIEGUO', 3, '处理结果', '', '', '2015-05-31 16:53:05', '0000-00-00 00:00:00', 1, '进行中\n已完成', 0),
(64, '基础', 'BIANHAO_AUTO', 1, '自动编号', '', '编号规则是否自动编号，如果是手工输入的，请删除自动编号', '2015-06-06 08:21:46', '2015-06-06 08:36:11', 1, '自动编号', 0),
(65, '基础', 'BIANHAO_GUIZE', 0, '编号规则', '', '0，年月日秒+4位顺序号\n1，年月日时分秒+2位随机数\n2，年与日+4位随机数', '2015-06-06 08:29:27', '2015-06-06 08:49:54', 1, '0', 0),
(66, '基础', 'BIANHAO_NUM', 0, '编号长度', '', '默认是4位长度值，效果如：0001', '2015-06-06 08:32:59', '0000-00-00 00:00:00', 1, '4', 0),
(67, '系统', 'SHOP_ISZB', 3, '是否总部', '', '', '2015-06-06 20:12:54', '2015-06-06 20:16:42', 1, '是\r\n否', 0),
(68, '基础', 'SET_JIZHI', 3, '升级机制', '', '自动升级，自动根据积分调整升级', '2015-06-06 21:42:07', '2015-06-06 21:53:37', 1, '0:自动升级\r\n1:手工调整', 0),
(69, '基础', 'CHANPIN_TCTYPE', 3, '产品提成类型', '', '', '2015-06-07 08:57:57', '0000-00-00 00:00:00', 1, '0:按销售价格比例\r\n1:固定金额', 0),
(70, '基础', 'CHANPIN_FANWEI', 3, '产品范围', '', '', '2015-06-07 09:02:34', '0000-00-00 00:00:00', 1, '0:仅本店铺\r\n1:所有店铺', 0),
(71, '基础', 'HUIYUAN_ZHUANGTAI', 3, '会员状态', '', '', '2015-06-07 18:01:22', '0000-00-00 00:00:00', 1, '正常\r\n锁定\r\n挂失', 0),
(72, '基础', 'HUIYUAN_TUIJIAN', 0, '推荐会员获得积分', '', '', '2015-06-07 19:18:43', '0000-00-00 00:00:00', 1, '200', 0),
(73, '基础', 'ZHUCE_TICHENG', 0, '会员注册提成', '', '业务员介绍一个会员办卡的提成，单位 元', '2015-06-07 21:08:02', '0000-00-00 00:00:00', 1, '100', 0),
(74, '基础', 'CHONGZHI_TICHENG', 0, '会员充值提成', '', '5% 充值金额的百分比', '2015-06-07 21:09:20', '2015-06-08 11:03:59', 1, '0', 0),
(75, '基础', 'LIPIN_FENLEI', 3, '礼品分类', '', '', '2015-06-14 20:59:34', '0000-00-00 00:00:00', 1, '日用品\r\n电话费', 0),
(78, '基础', 'WMENU_TYPE', 3, '微信菜单类型', '', '', '2015-06-27 20:48:15', '0000-00-00 00:00:00', 1, '跳转网址\r\n返回文字\r\n返回图文', 0),
(79, '基础', 'REPLAY_TYPE', 3, '微信回复类型', '', '', '2015-06-28 15:57:25', '0000-00-00 00:00:00', 1, '文本\r\n图文', 0),
(80, '基础', 'NEW_FENLEI', 3, '新闻分类', '', '', '2015-06-29 08:15:38', '2015-07-02 22:18:30', 1, '新闻动态\r\n活动促销\r\n美容课堂', 0);

-- --------------------------------------------------------

--
-- 表的结构 `xy_datalist`
--

CREATE TABLE IF NOT EXISTS `xy_datalist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `level` tinyint(1) NOT NULL,
  `pid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `sort` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类字典' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `xy_datalist`
--

INSERT INTO `xy_datalist` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `level`, `pid`, `title`, `desc`, `sort`) VALUES
(1, 1, '陈高明', '2015-05-06 15:35:39', 1, '陈高明', '2015-06-06 22:11:27', 1, 0, 0, '产品分类', '产品分类', 1),
(2, 1, '陈高明', '2015-05-06 15:38:20', 1, '陈高明', '2015-06-06 22:13:54', 1, 1, 1, '护肤品', '护肤品类', 1),
(3, 1, '陈高明', '2015-05-06 15:38:39', 1, '陈高明', '2015-06-06 22:16:57', 1, 2, 2, '美体面膜', '', 1),
(4, 1, '陈高明', '2015-05-06 15:40:30', 1, '陈高明', '2015-06-06 22:15:54', 1, 2, 2, '水胭脂', '', 5),
(5, 8, '管理员', '2015-05-12 09:47:00', 1, '陈高明', '2015-06-06 22:11:53', 1, 1, 1, '美容套餐', '套餐服务类的', 20),
(6, 8, '管理员', '2015-05-12 09:47:58', 1, '陈高明', '2015-06-06 22:14:37', 1, 2, 5, '面部护理', '面部护理', 21),
(7, 1, '陈高明', '2015-06-06 22:14:54', 1, '陈高明', '2015-06-06 22:15:15', 1, 2, 5, '美体', '美体', 2),
(8, 18, '王倩', '2015-06-15 16:19:07', 0, '', '0000-00-00 00:00:00', 1, 0, 0, '礼品分类', '积分兑换礼品', 3),
(9, 1, '陈高明', '2015-07-07 10:17:38', 1, '陈高明', '2015-07-08 09:23:19', 1, 2, 2, '美白面膜', '产品分类', 2),
(10, 1, '陈高明', '2015-07-17 18:18:14', 0, '', '0000-00-00 00:00:00', 1, 2, 2, '美体套盒', '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `xy_dengji`
--

CREATE TABLE IF NOT EXISTS `xy_dengji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(50) NOT NULL,
  `jifen` int(11) NOT NULL,
  `jizhi` tinyint(1) NOT NULL,
  `zhekou` int(11) NOT NULL,
  `bili` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员等级' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `xy_dengji`
--

INSERT INTO `xy_dengji` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `title`, `jifen`, `jizhi`, `zhekou`, `bili`) VALUES
(1, 1, '陈高明', '2015-06-06 22:00:57', 1, '陈高明', '2015-06-07 18:58:29', 1, '普通会员', 0, 0, 95, 1),
(2, 1, '陈高明', '2015-06-06 22:10:09', 1, '陈高明', '2015-06-07 18:58:33', 1, '银卡会员', 2000, 0, 80, 1),
(3, 17, '张雨', '2015-06-12 15:19:52', 17, '张雨', '2015-06-12 15:21:59', 1, '铂金卡会员', 3000, 1, 75, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xy_files`
--

CREATE TABLE IF NOT EXISTS `xy_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attid` int(11) NOT NULL,
  `folder` varchar(50) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filetype` varchar(50) NOT NULL,
  `filedesc` varchar(200) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `xy_files`
--

INSERT INTO `xy_files` (`id`, `attid`, `folder`, `filename`, `filetype`, `filedesc`, `uid`, `addtime`, `status`) VALUES
(1, 1434356580, 'Uploads/Public/2015-06-15/', '557e8bdc24706.jpg', 'jpg', 'QQ截图20150615161931.jpg', '18', '2015-06-15 16:25:00', 1),
(2, 1435386266, 'Uploads/Public/2015-06-27/', '558e88ae99dbe.jpg', 'jpg', '0.jpg', '1', '2015-06-27 19:27:42', 1),
(3, 1435410552, 'Uploads/Public/2015-06-27/', '558ea0dec2939.jpg', 'jpg', 'u=1953875875,1197124114&fm=21&gp=0.jpg', '1', '2015-06-27 21:10:54', 1),
(4, 1435479465, 'Uploads/Public/2015-06-28/', '558fadf0d4d53.jpg', 'jpg', 'u=1953875875,1197124114&fm=21&gp=0.jpg', '1', '2015-06-28 16:18:56', 1),
(5, 1435488737, 'Uploads/Public/2015-06-28/', '558fd20eecfb7.jpg', 'jpg', 'u=1953875875,1197124114&fm=21&gp=0.jpg', '1', '2015-06-28 18:53:02', 1),
(6, 1435492565, 'Uploads/Public/2015-06-28/', '558fe12a31959.jpg', 'jpg', '48540923dd54564e7e8663eab6de9c82d0584f06.jpg', '1', '2015-06-28 19:57:30', 1),
(10, 1435643927, 'Uploads/Public/2015-06-30/', '559230b368c7d.jpg', 'jpg', 'u=3851635297,1147903915&fm=21&gp=0.jpg', '1', '2015-06-30 14:01:23', 1),
(13, 1435671590, 'Uploads/Public/2015-06-30/', '55929c69f3dbd.jpg', 'jpg', 'u=2873728698,3792194626&fm=58.jpg', '17', '2015-06-30 21:40:58', 1),
(14, 1435674699, 'Uploads/Public/2015-06-30/', '5592a8c99a28d.jpg', 'jpg', 'c83d70cf3bc79f3d8da69692bfa1cd11738b29c8.jpg', '1', '2015-06-30 22:33:45', 1),
(15, 1435710051, 'Uploads/Public/2015-07-01/', '559334a0ac66d.jpg', 'jpg', '201151111347810.jpg', '1', '2015-07-01 08:30:24', 1),
(17, 1435968225, 'Uploads/Public/2015-07-04/', '55972452ca67e.jpg', 'jpg', '003422270.jpg', '28', '2015-07-04 08:09:54', 1),
(18, 1435969014, 'Uploads/Public/2015-07-04/', '5597265eb2c9b.jpg', 'jpg', '1151461R4-76.jpg', '29', '2015-07-04 08:18:38', 1),
(20, 1435492565, 'Uploads/Public/2015-07-10/', '559f5c3d2ec4d.jpg', 'jpg', '81f64827d3976822b63c38.jpg', '1', '2015-07-10 13:46:37', 1),
(21, 1436507206, 'Uploads/Public/2015-07-10/', '559f5c77afccd.jpg', 'jpg', 'dd22dd673752ee84f00d0b.jpg', '1', '2015-07-10 13:47:35', 1),
(22, 1436507262, 'Uploads/Public/2015-07-10/', '559f5cc06f963.jpg', 'jpg', '2924174d4e721c46437985.jpg', '1', '2015-07-10 13:48:48', 1),
(23, 1436507265, 'Uploads/Public/2015-07-10/', '559f5d459440c.jpg', 'jpg', 'QQ截图20150710134446.jpg', '32', '2015-07-10 13:51:01', 1),
(24, 1436507441, 'Uploads/Public/2015-07-10/', '559f5d8b50f25.png', 'png', '64e8f9ed5ea993a613132c.png', '1', '2015-07-10 13:52:11', 1),
(25, 1436507635, 'Uploads/Public/2015-07-10/', '559f5e20997f0.png', 'png', '28b5833563d3e760bef520.png', '1', '2015-07-10 13:54:40', 1),
(26, 1436507672, 'Uploads/Public/2015-07-10/', '559f5f0fd11c4.jpg', 'jpg', '222.jpg', '26', '2015-07-10 13:58:39', 1),
(28, 1436508799, 'Uploads/Public/2015-07-10/', '559f641c81829.jpg', 'jpg', '86.jpg', '1', '2015-07-10 14:20:12', 1),
(29, 1435386266, 'Uploads/Public/2015-07-20/', '55acd1278d98a.jpg', 'jpg', 'qrcode_for_gh_0e63d56d3d9b_258.jpg', '1', '2015-07-20 18:44:55', 1),
(30, 1435628731, 'Uploads/Public/2015-07-21/', '55adb23d5828a.jpg', 'jpg', 'qrcode_for_gh_0e63d56d3d9b_258.jpg', '1', '2015-07-21 10:45:17', 1),
(31, 1437471519, 'Uploads/Public/2015-07-21/', '55ae13ac4c2d5.jpg', 'jpg', 'image.jpg', '35', '2015-07-21 17:41:01', 1);

-- --------------------------------------------------------

--
-- 表的结构 `xy_fukuan`
--

CREATE TABLE IF NOT EXISTS `xy_fukuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shopid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `leixing` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `jine` decimal(10,2) NOT NULL,
  `jingban` varchar(50) NOT NULL,
  `beizhu` varchar(255) NOT NULL,
  `shenheren` varchar(50) NOT NULL,
  `shenhe` varchar(50) NOT NULL,
  `attid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支出记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xy_guanzhu`
--

CREATE TABLE IF NOT EXISTS `xy_guanzhu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(200) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `nickname` varchar(200) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `fenlei` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='关注列表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `xy_guwen`
--

CREATE TABLE IF NOT EXISTS `xy_guwen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shopid` int(11) NOT NULL,
  `gonghao` varchar(50) NOT NULL,
  `techang` varchar(200) NOT NULL,
  `content` varchar(255) NOT NULL,
  `xingming` varchar(50) NOT NULL,
  `zhicheng` varchar(50) NOT NULL,
  `yycs` int(11) NOT NULL,
  `manyi` int(11) NOT NULL,
  `attid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='美容顾问' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `xy_guwen`
--

INSERT INTO `xy_guwen` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `shopid`, `gonghao`, `techang`, `content`, `xingming`, `zhicheng`, `yycs`, `manyi`, `attid`) VALUES
(1, 35, '王渺渺', '2015-07-21 17:39:30', 24, '张玉龙', '2015-07-21 17:41:51', 1, 2, '1001', '顾问', '顾问', '王渺渺', '', 1, 0, 1437471519);

-- --------------------------------------------------------

--
-- 表的结构 `xy_huifang`
--

CREATE TABLE IF NOT EXISTS `xy_huifang` (
  `shopid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `hid` int(11) NOT NULL,
  `attid` int(11) NOT NULL,
  `xingming` varchar(50) NOT NULL,
  `kahao` varchar(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `beizhu` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户回访' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xy_huiyuan`
--

CREATE TABLE IF NOT EXISTS `xy_huiyuan` (
  `attid` int(11) NOT NULL,
  `shengri` date NOT NULL,
  `sfz` varchar(50) NOT NULL,
  `dengji` varchar(50) NOT NULL,
  `dianhua` varchar(50) NOT NULL,
  `shopid` int(11) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `mima` varchar(50) NOT NULL,
  `xingming` varchar(50) NOT NULL,
  `kahao` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updatetime` datetime NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `uuid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `uname` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beizhu` text NOT NULL,
  `dizhi` varchar(255) NOT NULL,
  `juname` varchar(50) NOT NULL,
  `juid` int(11) NOT NULL,
  `tjr` varchar(100) NOT NULL,
  `jztime` date NOT NULL,
  `jici` int(11) NOT NULL,
  `jine` decimal(10,2) NOT NULL,
  `xiaofei` decimal(10,2) NOT NULL,
  `jifen` int(11) NOT NULL,
  `zhuangtai` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员管理' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xy_huiyuan`
--

INSERT INTO `xy_huiyuan` (`attid`, `shengri`, `sfz`, `dengji`, `dianhua`, `shopid`, `sex`, `mima`, `xingming`, `kahao`, `status`, `updatetime`, `uuname`, `uuid`, `addtime`, `uname`, `uid`, `id`, `beizhu`, `dizhi`, `juname`, `juid`, `tjr`, `jztime`, `jici`, `jine`, `xiaofei`, `jifen`, `zhuangtai`) VALUES
(1437470964, '2015-07-21', '1111', '普通会员', '15905120019', 2, '男', '789456', '张三', '881531', 1, '2015-07-21 17:45:31', '', 0, '2015-07-21 17:44:25', '张玉龙', 24, 2, '', '111', '', 0, '', '0000-00-00', 0, '5000.00', '0.00', 0, '正常');

-- --------------------------------------------------------

--
-- 表的结构 `xy_jifen`
--

CREATE TABLE IF NOT EXISTS `xy_jifen` (
  `danhao` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `jifen` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `xingming` varchar(50) NOT NULL,
  `shopid` int(11) NOT NULL,
  `kahao` varchar(50) NOT NULL,
  `hid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updatetime` datetime NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `uuid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `uname` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分记录' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `xy_jifen`
--

INSERT INTO `xy_jifen` (`danhao`, `title`, `jifen`, `type`, `xingming`, `shopid`, `kahao`, `hid`, `status`, `updatetime`, `uuname`, `uuid`, `addtime`, `uname`, `uid`, `id`) VALUES
('SP2015072009302684', '卡号[12]商品消费获得积分', 0, '商品消费', 'as', 2, '12', 1, 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 09:30:26', '张玉龙', 24, 1),
('SP2015072005175992', '卡号[12]商品消费获得积分', 285, '商品消费', 'as', 2, '12', 1, 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 17:17:59', '张玉龙', 24, 2),
('KS2015072005422521', '卡号[12]快速消费获得积分', 1280, '快速消费', 'as', 2, '12', 1, 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 17:42:25', '张三', 34, 3);

-- --------------------------------------------------------

--
-- 表的结构 `xy_ku`
--

CREATE TABLE IF NOT EXISTS `xy_ku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(11) NOT NULL,
  `bianhao` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `dalei` varchar(50) NOT NULL,
  `fenlei` varchar(50) NOT NULL,
  `type` varchar(200) NOT NULL,
  `danwei` varchar(20) NOT NULL,
  `kucun` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品管理' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xy_ku`
--

INSERT INTO `xy_ku` (`id`, `shopid`, `bianhao`, `title`, `dalei`, `fenlei`, `type`, `danwei`, `kucun`) VALUES
(1, 2, '6953030209230', '妊娠纹修复套', '护肤品', '美体面膜', '11', '盒', 13),
(2, 2, 'eget', 'few', '', '', '3t3y', '', 5);

-- --------------------------------------------------------

--
-- 表的结构 `xy_lipin`
--

CREATE TABLE IF NOT EXISTS `xy_lipin` (
  `content` text NOT NULL,
  `kucun` int(11) NOT NULL,
  `jifen` int(11) NOT NULL,
  `attid` int(11) NOT NULL,
  `fenlei` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `shopid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updatetime` datetime NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `uuid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `uname` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='礼品列表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xy_log`
--

CREATE TABLE IF NOT EXISTS `xy_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` datetime NOT NULL,
  `username` char(20) NOT NULL,
  `content` char(100) NOT NULL,
  `os` varchar(100) NOT NULL,
  `url` char(100) NOT NULL,
  `ip` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=158 ;

--
-- 转存表中的数据 `xy_log`
--

INSERT INTO `xy_log` (`id`, `addtime`, `username`, `content`, `os`, `url`, `ip`) VALUES
(1, '2015-07-17 17:54:11', 'admins', '新增成功1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Shop&a=add', '222.191.137.117'),
(2, '2015-07-17 17:54:47', 'admins', '新增成功2', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Shop&a=add', '222.191.137.117'),
(3, '2015-07-17 17:55:02', 'admins', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Shop&a=edit', '222.191.137.117'),
(4, '2015-07-17 17:55:21', 'admins', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Shop&a=edit', '222.191.137.117'),
(5, '2015-07-17 17:55:36', 'admins', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Shop&a=edit', '222.191.137.117'),
(6, '2015-07-17 17:55:58', 'admins', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Shop&a=edit', '222.191.137.117'),
(7, '2015-07-17 17:58:04', 'admins', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Shop&a=edit', '222.191.137.117'),
(8, '2015-07-17 17:59:01', 'admins', '编辑成功24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=User&a=edit', '222.191.137.117'),
(9, '2015-07-17 18:00:01', 'admins', '编辑成功24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=User&a=edit', '222.191.137.117'),
(10, '2015-07-17 18:01:24', 'admins', '设置成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=User&a=editrule', '222.191.137.117'),
(11, '2015-07-17 18:01:28', 'admins', '设置成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=User&a=editrule', '222.191.137.117'),
(12, '2015-07-17 18:02:56', 'admins', '退出成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=logout', '222.191.137.117'),
(13, '2015-07-17 18:03:05', 'admins', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(14, '2015-07-17 18:03:21', 'admins', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(15, '2015-07-17 18:03:24', 'admins', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(16, '2015-07-17 18:05:07', 'admins', '新增成功33', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=User&a=add', '222.191.137.117'),
(17, '2015-07-17 18:07:52', 'admins', '新增成功34', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=User&a=add', '222.191.137.117'),
(18, '2015-07-17 18:07:58', 'admins', '退出成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=logout', '222.191.137.117'),
(19, '2015-07-17 18:08:06', 'msmk', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(20, '2015-07-17 18:08:26', 'msmk', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(21, '2015-07-17 18:08:51', 'admins', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(22, '2015-07-17 18:09:25', 'admins', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(23, '2015-07-17 18:10:43', 'admins', '权限设置成功', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Dep&a=EditRule', '222.191.137.117'),
(24, '2015-07-17 18:14:43', 'admins', '新增成功1', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Chanpin&a=add', '222.191.137.117'),
(25, '2015-07-17 18:16:00', 'admins', '新增成功1', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Ruku&a=add', '222.191.137.117'),
(26, '2015-07-17 18:16:14', 'admins', '审核结果审核通过', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Ruku&a=shenhe', '222.191.137.117'),
(27, '2015-07-17 18:17:06', 'admins', '退出成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=logout', '222.191.137.117'),
(28, '2015-07-17 18:17:16', 'admin', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(29, '2015-07-17 18:18:14', 'admin', '新增成功10', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Datalist&a=add', '222.191.137.117'),
(30, '2015-07-17 18:25:32', 'admins', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(31, '2015-07-17 18:31:44', 'admins', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(32, '2015-07-17 18:36:25', 'admins', '退出成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=logout', '222.191.137.117'),
(33, '2015-07-17 18:36:40', 'msmk', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(34, '2015-07-17 18:37:12', 'msmk', '退出成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=logout', '222.191.137.117'),
(35, '2015-07-17 18:37:22', 'admins', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(36, '2015-07-17 18:38:04', 'admins', '设置成功', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=User&a=editrule', '222.191.137.117'),
(37, '2015-07-17 18:38:09', 'admins', '设置成功', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=User&a=editrule', '222.191.137.117'),
(38, '2015-07-17 18:38:17', 'admins', '退出成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=logout', '222.191.137.117'),
(39, '2015-07-17 18:38:53', 'msmk', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(40, '2015-07-17 18:39:41', 'msmk', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(41, '2015-07-17 18:40:48', 'admins', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(42, '2015-07-17 18:43:11', 'admins', '新增成功2', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Chanpin&a=add', '222.191.137.117'),
(43, '2015-07-17 18:45:14', 'admins', '新增成功3', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Ruku&a=add', '222.191.137.117'),
(44, '2015-07-17 18:45:44', 'admins', '审核结果审核通过', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Ruku&a=shenhe', '222.191.137.117'),
(45, '2015-07-17 18:47:57', 'msmk', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(46, '2015-07-17 18:49:38', 'msmk', '新增成功1', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Huiyuan&a=add', '222.191.137.117'),
(47, '2015-07-17 18:51:00', 'msmk', '[12]充值[13]', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Ka&a=chongzhi', '222.191.137.117'),
(48, '2015-07-17 18:53:07', 'admins', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(49, '2015-07-17 18:58:36', 'admins', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(50, '2015-07-17 19:01:02', 'admins', '权限设置成功', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Dep&a=EditRule', '222.191.137.117'),
(51, '2015-07-17 19:03:00', 'admins', '权限设置成功', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Dep&a=EditRule', '222.191.137.117'),
(52, '2015-07-17 19:03:35', 'admins', '[12]充值[5000]', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Ka&a=chongzhi', '222.191.137.117'),
(53, '2015-07-17 19:04:23', 'admins', '结算失败！您才支付0还差285.95元才能完成本次结算', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Sale&a=shangpin', '222.191.137.117'),
(54, '2015-07-17 19:04:51', 'admins', '结算失败！您才支付0还差285.95元才能完成本次结算', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Sale&a=shangpin', '222.191.137.117'),
(55, '2015-07-17 19:06:29', 'admins', '结算失败！您才支付0还差285.95元才能完成本次结算', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Sale&a=shangpin', '222.191.137.117'),
(56, '2015-07-17 19:07:07', 'admins', '结算失败！您才支付0还差285.95元才能完成本次结算', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Sale&a=shangpin', '222.191.137.117'),
(57, '2015-07-17 19:07:53', 'admins', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(58, '2015-07-17 19:08:33', 'admins', '结算失败！您才支付0还差0.95元才能完成本次结算', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '/index.php?m=Home&c=Sale&a=shangpin', '222.191.137.117'),
(59, '2015-07-17 19:10:32', 'admins', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(60, '2015-07-17 19:10:56', 'admins', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '222.191.137.117'),
(61, '2015-07-18 09:02:26', 'admin', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '114.237.199.221'),
(62, '2015-07-18 13:48:47', 'admin', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '114.237.200.71'),
(63, '2015-07-18 18:37:46', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDUBrowser', '/index.php?m=Home&c=Public&a=Login', '180.127.90.48'),
(64, '2015-07-18 18:38:04', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDUBrowser', '/index.php?m=Home&c=Public&a=Login', '180.127.90.48'),
(65, '2015-07-18 18:38:21', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDUBrowser', '/index.php?m=Home&c=Public&a=Login', '180.127.90.48'),
(66, '2015-07-18 18:40:44', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDUBrowser', '/index.php?m=Home&c=Public&a=Login', '180.127.90.48'),
(67, '2015-07-18 18:43:22', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDUBrowser', '/index.php?m=Home&c=Public&a=Login', '180.127.90.48'),
(68, '2015-07-18 18:48:50', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDUBrowser', '/index.php?m=Home&c=Public&a=Login', '180.127.90.48'),
(69, '2015-07-18 18:49:51', 'admin', '退出成功！', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDUBrowser', '/index.php?m=Home&c=Public&a=logout', '180.127.90.48'),
(70, '2015-07-18 18:50:01', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDUBrowser', '/index.php?m=Home&c=Public&a=Login', '180.127.90.48'),
(71, '2015-07-19 09:44:07', 'admin', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '180.127.244.69'),
(72, '2015-07-19 18:09:44', 'admin', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '180.127.90.48'),
(73, '2015-07-20 09:30:27', 'admins', '[as]商品消费成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Sale&a=shangpin', '218.90.63.124'),
(74, '2015-07-20 09:30:49', 'admins', '消费撤单成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Xiaofei&a=chedan', '218.90.63.124'),
(75, '2015-07-20 17:16:35', 'admins', '登录成功！', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=Public&a=Login', '218.90.63.124'),
(76, '2015-07-20 17:18:00', 'admins', '[as]商品消费成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=Sale&a=shangpin', '218.90.63.124'),
(77, '2015-07-20 17:18:47', 'admins', '退出成功！', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=Public&a=logout', '218.90.63.124'),
(78, '2015-07-20 17:19:02', 'msmk', '登录成功！', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=Public&a=Login', '218.90.63.124'),
(79, '2015-07-20 17:35:02', 'msmk', '[12]充值[4558]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=Ka&a=chongzhi', '218.90.63.124'),
(80, '2015-07-20 17:42:26', 'msmk', '[as]快速消费成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=Sale&a=kshyok', '218.90.63.124'),
(81, '2015-07-20 17:55:29', 'admins', '退出成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=logout', '218.90.63.124'),
(82, '2015-07-20 17:55:44', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '218.90.63.124'),
(83, '2015-07-20 17:56:32', 'admin', '更新成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Weiset&a=edit', '218.90.63.124'),
(84, '2015-07-20 18:05:25', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '114.224.20.235'),
(85, '2015-07-20 18:05:53', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '114.224.20.235'),
(86, '2015-07-20 18:08:55', '', '退出成功！', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; GT-I9500 Build/KOT49H) AppleWebKit/537.36 (KHTML, like ', '/index.php?m=Home&c=Public&a=logout', '101.226.89.116'),
(87, '2015-07-20 18:32:20', 'admin', '更新成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Weiset&a=edit', '218.90.63.124'),
(88, '2015-07-20 18:35:23', 'admin', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '180.127.88.100'),
(89, '2015-07-20 18:44:59', 'admin', '更新成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Weiset&a=edit', '218.90.63.124'),
(90, '2015-07-20 18:45:57', 'admin', '更新成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Weiset&a=edit', '218.90.63.124'),
(91, '2015-07-20 19:13:29', 'admin', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '114.237.197.246'),
(92, '2015-07-20 19:26:07', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '218.90.63.124'),
(93, '2015-07-20 21:14:13', 'admin', '发送生成菜单请求成功！微信更新菜单需要一定时间，或是取消关注，重新关注试试', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '/index.php?m=Home&c=Wmenu&a=send', '114.237.197.246'),
(94, '2015-07-20 21:37:53', 'admin', '新增成功1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=News&a=add', '218.90.63.124'),
(95, '2015-07-20 21:42:33', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '218.90.63.124'),
(96, '2015-07-20 21:55:42', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '218.90.63.124'),
(97, '2015-07-21 10:37:20', 'admin', '权限设置成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Dep&a=EditRule', '218.90.63.124'),
(98, '2015-07-21 10:38:21', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '218.90.63.124'),
(99, '2015-07-21 10:38:35', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '218.90.63.124'),
(100, '2015-07-21 10:42:30', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '218.90.63.124'),
(101, '2015-07-21 10:43:13', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '218.90.63.124'),
(102, '2015-07-21 10:45:20', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Replay&a=edit', '218.90.63.124'),
(103, '2015-07-21 10:48:46', 'admin', '退出成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=logout', '218.90.63.124'),
(104, '2015-07-21 10:49:09', 'admins', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '218.90.63.124'),
(105, '2015-07-21 10:50:59', 'admins', '权限设置成功', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Dep&a=EditRule', '218.90.63.124'),
(106, '2015-07-21 10:52:50', 'admins', '编辑成功6', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Config&a=edit', '218.90.63.124'),
(107, '2015-07-21 10:53:28', 'admins', '锁定1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Huiyuan&a=lock', '218.90.63.124'),
(108, '2015-07-21 10:53:39', 'admins', '清理1条无用的记录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Huiyuan&a=del', '218.90.63.124'),
(109, '2015-07-21 10:55:05', 'admins', '清理180天以前的日志记录成功!!!', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Log&a=del', '218.90.63.124'),
(110, '2015-07-21 17:29:13', 'admins', '登录成功！', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=Public&a=Login', '180.113.155.180'),
(111, '2015-07-21 17:30:42', 'admins', '设置成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=editrule', '180.113.155.180'),
(112, '2015-07-21 17:30:58', 'admins', '设置成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=editrule', '180.113.155.180'),
(113, '2015-07-21 17:31:06', 'admins', '清理0条无用的记录', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=del', '180.113.155.180'),
(114, '2015-07-21 17:31:36', 'admins', '设置成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=editrule', '180.113.155.180'),
(115, '2015-07-21 17:31:54', 'admins', '清理0条无用的记录', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=del', '180.113.155.180'),
(116, '2015-07-21 17:32:25', 'admins', '设置成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=editrule', '180.113.155.180'),
(117, '2015-07-21 17:33:32', 'admins', '设置成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=editrule', '180.113.155.180'),
(118, '2015-07-21 17:33:40', 'admins', '清理0条无用的记录', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=del', '180.113.155.180'),
(119, '2015-07-21 17:37:16', 'admins', '新增成功35', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=add', '180.113.155.180'),
(120, '2015-07-21 17:41:51', 'admins', '编辑成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=Guwen&a=edit', '180.113.155.180'),
(121, '2015-07-21 17:44:26', 'admins', '新增成功1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=Huiyuan&a=add', '180.113.155.180'),
(122, '2015-07-21 17:46:55', 'admins', '编辑成功35', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=edit', '180.113.155.180'),
(123, '2015-07-21 17:51:44', 'admins', '新增成功2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=News&a=add', '180.113.155.180'),
(124, '2015-07-21 17:52:59', 'admins', '设置成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=editrule', '180.113.155.180'),
(125, '2015-07-21 17:53:11', 'admins', '设置成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=editrule', '180.113.155.180'),
(126, '2015-07-21 17:54:12', 'admins', '设置成功', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=editrule', '180.113.155.180'),
(127, '2015-07-21 17:55:30', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDU', '/index.php?m=Home&c=Public&a=Login', '117.92.179.63'),
(128, '2015-07-21 18:05:34', 'admin', '编辑成功58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDU', '/index.php?m=Home&c=Rule&a=edit', '117.92.179.63'),
(129, '2015-07-21 18:06:07', 'admins', '锁定23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=lock', '180.113.155.180'),
(130, '2015-07-21 18:06:17', 'admins', '清理1条无用的记录', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=del', '180.113.155.180'),
(131, '2015-07-21 18:12:22', 'admins', '锁定26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=lock', '180.113.155.180'),
(132, '2015-07-21 18:12:40', 'admins', '清理1条无用的记录', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/6.2.2', '/index.php?m=Home&c=User&a=del', '180.113.155.180'),
(133, '2015-07-23 10:00:08', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDU', '/index.php?m=Home&c=Public&a=Login', '114.237.208.15'),
(134, '2015-07-23 10:00:44', 'admin', '编辑成功215', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDU', '/index.php?m=Home&c=Menu&a=edit', '114.237.208.15'),
(135, '2015-07-23 10:01:26', 'admin', '新增成功217', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDU', '/index.php?m=Home&c=Menu&a=add', '114.237.208.15'),
(136, '2015-07-23 10:02:11', 'admin', '新增成功753', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 BIDU', '/index.php?m=Home&c=Rule&a=add', '114.237.208.15'),
(137, '2015-07-24 10:08:20', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '122.97.217.154'),
(138, '2015-07-24 10:09:33', 'admin', '退出成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=logout', '122.97.217.154'),
(139, '2015-07-24 10:23:02', '', '退出成功！', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; GT-I9500 Build/KOT49H) AppleWebKit/537.36 (KHTML, like ', '/index.php?m=Home&c=Public&a=logout', '101.226.33.221'),
(140, '2015-07-27 14:36:45', 'admin', '登录成功！', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '/index.php?m=Home&c=Public&a=Login', '180.127.89.65'),
(141, '2015-07-28 13:18:28', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '180.127.71.132'),
(142, '2015-07-28 13:18:32', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=Login', '180.127.71.132'),
(143, '2015-07-28 13:18:56', 'admin', '退出成功！', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safa', '/index.php?m=Home&c=Public&a=logout', '180.127.71.132'),
(144, '2015-07-28 13:32:22', '', '退出成功！', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; GT-I9500 Build/KOT49H) AppleWebKit/537.36 (KHTML, like ', '/index.php?m=Home&c=Public&a=logout', '180.153.206.38'),
(145, '2015-10-25 11:04:41', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0; BIDUBrowser 7.6) like Gecko', '/index.php?m=Home&c=Public&a=Login', '106.110.160.186'),
(146, '2015-10-25 11:05:56', 'admin', '锁定20', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0; BIDUBrowser 7.6) like Gecko', '/index.php?m=Home&c=Menu&a=lock', '106.110.160.186'),
(147, '2015-10-25 11:06:04', 'admin', '清理1条无用的记录', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0; BIDUBrowser 7.6) like Gecko', '/index.php?m=Home&c=Menu&a=del', '106.110.160.186'),
(148, '2017-11-27 21:08:39', 'admin', '退出成功！', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Public&a=logout', '127.0.0.1'),
(149, '2017-11-27 21:08:49', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Public&a=Login', '127.0.0.1'),
(150, '2017-11-27 21:09:45', 'admin', '退出成功！', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Public&a=logout', '127.0.0.1'),
(151, '2017-11-27 21:09:51', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Public&a=Login', '127.0.0.1'),
(152, '2017-11-27 21:10:19', 'admin', '编辑成功6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Config&a=edit', '127.0.0.1'),
(153, '2017-11-27 21:13:03', 'admin', '保存成功', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Index&a=index', '127.0.0.1'),
(154, '2017-11-27 21:13:44', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Shop&a=edit', '127.0.0.1'),
(155, '2017-11-27 21:13:53', 'admin', '编辑成功', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Shop&a=edit', '127.0.0.1'),
(156, '2017-11-27 21:14:04', 'admin', '退出成功！', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Public&a=logout', '127.0.0.1'),
(157, '2017-11-27 21:16:24', 'admin', '登录成功！', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BID', '/mms2/index.php?m=Home&c=Public&a=Login', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `xy_menu`
--

CREATE TABLE IF NOT EXISTS `xy_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` tinyint(1) NOT NULL,
  `pid` int(4) NOT NULL,
  `catename` char(20) NOT NULL DEFAULT '',
  `alink` char(100) NOT NULL DEFAULT '',
  `sort` int(4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=218 ;

--
-- 转存表中的数据 `xy_menu`
--

INSERT INTO `xy_menu` (`id`, `level`, `pid`, `catename`, `alink`, `sort`, `status`) VALUES
(1, 0, 0, '会员管理', 'huiyuan/index', 1, 1),
(7, 0, 0, '系统管理', 'system/index', 99, 1),
(8, 1, 1, '售后服务', 'shouhou/index', 15, 1),
(9, 1, 7, '组织机构', 'system/index', 1, 1),
(10, 2, 9, '职位管理', 'dep/index', 2, 1),
(11, 2, 22, '菜单管理', 'menu/index', 4, 1),
(13, 1, 7, '操作日志', 'Log/index', 7, 1),
(14, 2, 9, '用户管理', 'user/index', 3, 1),
(19, 2, 22, '功能列表', 'rule/index', 5, 1),
(21, 1, 7, '备份文件', 'database/bakup', 5, 1),
(22, 1, 7, '系统设置', 'system/index', 1, 1),
(23, 2, 9, '部门管理', 'org/index', 1, 1),
(24, 1, 7, '数据备份', 'Database/index', 4, 1),
(25, 2, 22, '分类字典', 'datalist/index', 2, 1),
(31, 2, 22, '数据字典', 'config/index', 1, 1),
(107, 1, 214, '积分流水', 'jifen/index', 1, 1),
(108, 1, 1, '会员登记', 'huiyuan/add', 0, 1),
(109, 1, 1, '会员列表', 'huiyuan/index', 1, 1),
(110, 0, 0, '常用设置', 'set/index', 20, 1),
(111, 1, 110, '会员级别', 'dengji/index', 1, 1),
(112, 1, 214, '礼品列表', 'lipin/index', 3, 1),
(113, 0, 0, '微信设置', 'weiset/index', 18, 1),
(114, 1, 113, '微信菜单', 'wmenu/index', 2, 1),
(115, 1, 149, '营业状况表', 'baobiao/index', 0, 1),
(116, 1, 110, '短信余额', 'public/sms', 2, 1),
(117, 1, 110, '短信发送记录', 'smss/index', 3, 1),
(118, 1, 113, '账号设置', 'weiset/edit', 1, 1),
(119, 1, 1, '更改密码', 'ka/gaimi', 4, 1),
(120, 2, 8, '近期生日的会员', 'huiyuan/shengri', 1, 1),
(121, 2, 8, '一个月没来消费', 'huiyuan/weixiaofei', 2, 1),
(122, 2, 8, '客户回访', 'huifang/index', 3, 1),
(124, 1, 1, '会员充值', 'ka/index', 3, 1),
(125, 1, 1, '统计分析', 'fxhuiyuan/index', 20, 1),
(126, 2, 125, '增长趋势', 'fxhuiyuan/index', 1, 1),
(127, 2, 125, '等级分析', 'fxhuiyuan/index', 2, 1),
(128, 2, 125, '状态分析', 'fxhuiyuan/index', 3, 1),
(129, 2, 125, '店铺分析', 'fxhuiyuan/index', 4, 1),
(130, 2, 125, '业务员分析', 'fxhuiyuan/index', 5, 1),
(131, 1, 1, '会员换卡', 'ka/huanka', 7, 1),
(132, 1, 1, '重置密码', 'ka/xinmi', 5, 1),
(135, 0, 0, '仓库管理', 'cangku/index', 3, 1),
(136, 1, 135, '入库', 'cangku/index', 1, 1),
(137, 2, 136, '新增入库', 'ruku/add', 1, 1),
(138, 2, 136, '退还入库', 'ruku/add', 2, 1),
(139, 2, 136, '入库审核', 'ruku/dshenhe', 3, 1),
(140, 2, 136, '入库记录', 'ruku/index', 4, 1),
(141, 2, 136, '入库明细表', 'rukus/index', 5, 1),
(142, 1, 135, '出库', 'chuku/index', 2, 1),
(143, 2, 142, '新增出库', 'chuku/add', 1, 1),
(144, 2, 142, '出库审核', 'chuku/dshenhe', 2, 1),
(145, 2, 142, '出库记录', 'chuku/index', 3, 1),
(146, 2, 142, '出库明细表', 'chukus/index', 4, 1),
(147, 1, 135, '库存报警', 'chanpinbj/baojing', 4, 1),
(149, 0, 0, '财务管理', 'caiwu/index', 5, 1),
(150, 1, 149, '其他收入', 'shou/index', 3, 1),
(151, 2, 150, '新增收入', 'shou/add', 1, 1),
(152, 2, 150, '收入审核', 'shou/dshenhe', 2, 1),
(153, 2, 150, '收入记录', 'shou/index', 3, 1),
(154, 1, 149, '费用支出', 'fukuan/index', 4, 1),
(155, 2, 154, '新增支出', 'fukuan/add', 1, 1),
(156, 2, 154, '支出审核', 'fukuan/dshenhe', 2, 1),
(157, 2, 154, '支出记录', 'fukuan/index', 3, 1),
(158, 1, 135, '产品管理', 'chanpin/index', 0, 1),
(159, 1, 135, '库存查询', 'chanpinbj/index', 3, 1),
(160, 0, 0, '常用功能', 'bangong/index', 0, 1),
(161, 1, 160, '会员登记', 'huiyuan/add', 1, 1),
(162, 1, 160, '会员充值', 'ka/index', 2, 1),
(163, 1, 160, '会员充次', 'ka/chongci', 3, 1),
(164, 1, 160, '商品消费(会员)', 'sale/index', 4, 1),
(165, 1, 160, '商品消费(散客)', 'sale/sanke', 5, 1),
(166, 1, 160, '快速消费(会员)', 'sale/kshy', 6, 1),
(168, 1, 160, '报表中心', 'xiaofei/index', 15, 1),
(169, 2, 168, '消费流水', 'xiaofei/liushui', 1, 1),
(170, 2, 168, '消费明细表', 'xiaofeis/index', 2, 1),
(171, 2, 172, '交班打印', 'jiaoban/index', 4, 1),
(172, 1, 160, '打印区', 'xiaofei/index', 14, 1),
(173, 2, 172, '消费打印', 'xiaofei/index', 1, 1),
(174, 2, 172, '充值打印', 'zijin/chongzhi', 2, 1),
(175, 1, 160, '挂单列表', 'xiaofei/guadan', 10, 1),
(176, 1, 160, '计次消费', 'sale/jici', 8, 1),
(177, 1, 160, '快速消费(散客)', 'sale/kssk', 7, 1),
(178, 2, 9, '店铺管理', 'shop/index', 0, 1),
(179, 1, 7, '清理缓存', 'public/clear', 10, 1),
(180, 1, 1, '账户退款', 'ka/tuikuan', 8, 1),
(181, 1, 1, '挂失锁定', 'ka/guashi', 6, 1),
(183, 1, 113, '微信回复', 'replay/index', 4, 1),
(184, 2, 183, '首次关注', 'replay/guanzhu', 1, 1),
(185, 2, 183, '文本回复', 'replay/wenben', 2, 1),
(186, 2, 183, '图文回复', 'replay/index', 3, 1),
(187, 2, 183, '默认回复', 'replay/moren', 4, 1),
(188, 2, 202, '业务员对比分析', 'fxcaiwu/index', 7, 1),
(189, 1, 110, '美容顾问', 'guwen/index', 9, 1),
(190, 1, 149, '员工提成汇总', 'jsticheng/index', 2, 1),
(191, 1, 149, '员工提成统计', 'fxticheng/index', 1, 1),
(192, 1, 110, '新闻管理', 'news/index', 4, 1),
(193, 1, 110, '预约管理', 'yuyue/index', 6, 1),
(194, 2, 202, '业务员提成增长趋势', 'fxcaiwu/index', 8, 1),
(195, 2, 202, '费用支出趋势', 'fxcaiwu/index', 10, 1),
(196, 2, 202, '增长趋势(卡支付)', 'fxcaiwu/index', 6, 1),
(197, 2, 202, '费用支出类型分析', 'fxcaiwu/index', 9, 1),
(198, 1, 214, '积分变动', 'duihuan/biandong', 5, 1),
(199, 1, 135, '统计分析', 'fxchanpin/index', 9, 1),
(200, 2, 199, '入库分析', 'fxchanpin/index', 1, 1),
(201, 2, 199, '出库分析', 'fxchanpin/index', 2, 1),
(202, 1, 149, '财务分析', 'fxcaiwu/index', 7, 1),
(203, 2, 202, '增长趋势(数量)', 'fxcaiwu/index', 1, 1),
(204, 2, 202, '增长趋势(营业额)', 'fxcaiwu/index', 2, 1),
(205, 2, 202, '增长趋势(现金收款)', 'fxcaiwu/index', 3, 1),
(206, 2, 202, '增长趋势(银联收款)', 'fxcaiwu/index', 5, 1),
(207, 1, 214, '积分兑换', 'duihuan/index', 3, 1),
(208, 2, 199, '库存统计', 'tjchanpin/index', 3, 1),
(209, 1, 149, '提成记录流水', 'ticheng/index', 0, 1),
(210, 1, 149, '收银流水', 'zijin/index', 2, 1),
(212, 2, 8, '客户投诉', 'tousu/index', 4, 1),
(213, 2, 8, '账户余额报警', 'huiyuan/yue', 2, 1),
(214, 0, 0, '积分礼品', 'lipin/index', 2, 1),
(215, 1, 113, '回复列表', 'replays/index', 6, 1),
(216, 1, 110, '客户评价', 'pingjia/index', 8, 1),
(217, 1, 113, '关注列表', 'guanzhu/index', 7, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xy_news`
--

CREATE TABLE IF NOT EXISTS `xy_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `fenlei` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻管理' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xy_news`
--

INSERT INTO `xy_news` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `fenlei`, `title`, `content`, `hits`) VALUES
(1, 1, '陈高明', '2015-07-20 21:37:53', 0, '', '0000-00-00 00:00:00', 1, '活动促销', '一周年店庆，来就送面膜', '一周年店庆，来就送面膜，一周年店庆，来就送面膜，一周年店庆，来就送面膜。', 0),
(2, 24, '张玉龙', '2015-07-21 17:51:44', 0, '', '0000-00-00 00:00:00', 1, '新闻动态', '测试新闻动态', '测试&lt;img src=&quot;/Public/BJUI/plugins/kindeditor_4.1.10/attached/image/20150721/20150721175139_71633.jpg&quot; width=&quot;800&quot; height=&quot;1000&quot; alt=&quot;&quot; /&gt;', 2);

-- --------------------------------------------------------

--
-- 表的结构 `xy_pingjia`
--

CREATE TABLE IF NOT EXISTS `xy_pingjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shopid` int(11) NOT NULL,
  `juid` int(11) NOT NULL,
  `juname` varchar(50) NOT NULL,
  `hid` int(11) NOT NULL,
  `xingming` varchar(100) NOT NULL,
  `kahao` varchar(200) NOT NULL,
  `pingfen` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评价管理' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xy_replay`
--

CREATE TABLE IF NOT EXISTS `xy_replay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `keyword` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `biaoti` varchar(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `attid` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信回复' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `xy_replay`
--

INSERT INTO `xy_replay` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `keyword`, `type`, `title`, `biaoti`, `content`, `attid`, `url`) VALUES
(1, 1, '陈高明', '2015-06-28 16:16:41', 1, '陈高明', '2015-07-10 13:18:55', 1, '首次关注', '文本', '感谢您关注我们。我们将会为您带来美丽精彩生活！', '', '', 1435479355, ''),
(2, 1, '陈高明', '2015-06-28 16:17:28', 1, '陈高明', '2015-06-30 09:45:28', 1, '默认回复', '文本', '这个是默认设置，找不到关键词就返回此项', '', '', 1435479421, ''),
(3, 1, '陈高明', '2015-06-28 16:19:38', 1, '陈高明', '2015-06-29 12:17:54', 1, '产品中心  产品展示', '图文', '', '这个是我们的产品中心哦，有很多内容哦', '这个是产品中间的简介哦，可以写很多字的的哦吗，写写看，能写多少的呢,还带图片的，如果产品中心有很多的，可以写同一个关键词，写很多条新闻，最多10条哦', 1435479465, 'http://oa.xinyou88.com/mms/index.php/news/1'),
(4, 1, '陈高明', '2015-06-28 18:53:06', 1, '陈高明', '2015-06-29 12:17:49', 1, '美容师', '图文', '', '这里是美容师里诶包', '这里是美容师里诶包这里是美容师里诶包这里是美容师里诶包这里是美容师里诶包这里是美容师里诶包这里是美容师里诶包这里是美容师里诶包这里是美容师里诶包这里是美容师里诶包', 1435488737, 'http://oa.xinyou88.com/mms/index.php/news/1'),
(5, 1, '陈高明', '2015-06-28 19:57:40', 1, '陈高明', '2015-07-10 13:46:40', 1, '产品中心  产品展示', '图文', '', '护理加美白', '+美白 给肌肤最健康的靓白 \r\n完美成就最健康明亮肌肤 \r\n适应对象：成熟型黯淡无光泽肌肤、混合型暗哑肌肤 \r\n护理功效：修复与美白并行的同时，温和呵护肌肤，令彼劳的肌肤重现光彩，带给肌肤更健康更明亮、更年轻的立体美白。\r\n', 1435492565, 'http://oa.xinyou88.com/mms/index.php/news/1'),
(6, 1, '陈高明', '2015-06-30 09:45:54', 1, '陈高明', '2015-07-21 10:45:20', 1, '会员', '图文', '', '这里是会员管理中心的登陆入口', '这里是会员管理中心的登陆入口，通过会员卡号/手机号，已经登陆密码就可以进入管理中心进行各种操作哦', 1435628731, 'http://wxmsmk.kuaijiahao.com/member.php'),
(7, 1, '陈高明', '2015-06-30 14:02:04', 1, '陈高明', '2015-07-21 10:38:21', 1, '老板', '图文', '', '这个是老板的管理中心', '这个是老板的管理中心,老板可以在这里查看所有的经营情况哦,店铺的经营情况尽在&quot;掌&quot;握!', 1435643927, 'http://wxmsmk.kuaijiahao.com/admin.php'),
(8, 1, '陈高明', '2015-06-30 22:33:54', 1, '陈高明', '2015-07-21 10:38:35', 1, '顾问', '图文', '', '这里是美容顾问管理中心', '这里是美容顾问管理中心,在这里可以查看我的业绩，被预约情况，被评价情况哦', 1435674699, 'http://wxmsmk.kuaijiahao.com/user.php'),
(9, 1, '陈高明', '2015-07-10 13:36:50', 0, '', '0000-00-00 00:00:00', 1, '走进美丽人身', '文本', '美丽人身以“打造美容养生产业链，解决全民亚健康”为目标，用精湛的技术，优质的服务和疗效来说话，以科学的技术为顾客提供最优质的服务；以舒适优美的环境为顾客舒解压力、改善、解决皮肤问题及亚健康。公司员工以饱满的热情，专业的水准，投入全部情感用心来打造一个让您可以放松、享受的同时改变的场所。\r\n我们的使命：创造健康与美丽，传播爱心与欢乐。\r\n我们的价值观：注重人才，团队第一，与时俱进。\r\n我们的经营理念：客户至上，精益求精。\r\n我们的企业精神：爱，健康快乐、真诚自信。', '', '', 1436506557, ''),
(10, 1, '陈高明', '2015-07-10 13:44:36', 0, '', '0000-00-00 00:00:00', 1, '分店地址', '文本', '美丽人身解放路总店：新浦区解放中路180号\r\n美丽人生东海店：东海县中华露65号2号门面\r\n美丽人生万润园店：新浦区万润园速8楼下', '', '', 1436506709, ''),
(11, 1, '陈高明', '2015-07-10 13:47:38', 0, '', '0000-00-00 00:00:00', 1, '产品中心', '图文', '', '从细胞开始驯服敏感肌肤筑建绿色防敏系统', '不仅仅是一般的防敏修复产品 修复脆弱敏感肌肤，先从每个细胞开始 \r\n适应对象：受损肌肤 \r\n护理功效：突破性发现运用EGF的活性作用，与水润成份科学配伍，给肌肤提供充配的水份和修复能力，启动肌肤细胞卓越的再生能力和修复功能；调节皮下毛细血管的发育，加快成纤维细胞的再生速度，使皮肤红润，富有弹性；创建皮肤的健康微酸性环境，神奇加快创伤、敏感伤口愈合速度；改善皱纹、色斑、毛孔粗大、暗疮、换肤后遗症等肌肤。 \r\n', 1436507206, ''),
(12, 1, '陈高明', '2015-07-10 13:48:50', 0, '', '0000-00-00 00:00:00', 1, '产品中心', '图文', '', '24小时美白保湿', '肌肤层层水嫩欲滴，就像水中绽放的玫瑰 水凝玫瑰花般的肌肤，绿色水润的完美体验 \r\n开启天然活水源，让肌脸层层畅饮新鲜的玫瑰精华水 \r\n适应对象：中干性、缺水、干燥、粗糙肌肤 \r\n护理功效：富含十足玫瑰水润能量，伴随着淡雅的玫瑰花香，滴水不漏地融入干渴缺水肌肤，真正开启肌肤的天然活水源，循环带动肌肤层次间的水分流动和补给，为缺水干旱的肌肤带来久逢甘露的极致享受。 \r\n', 1436507262, ''),
(13, 1, '陈高明', '2015-07-10 13:52:16', 1, '陈高明', '2015-07-10 13:53:16', 1, '998优惠卡', '图文', '', '998优惠卡，可享受价值1980的卵宫疏通调理套一套', '998优惠卡，可享受价值1980的卵宫疏通调理套一套和价值1980的驱寒除湿艾灸调理套一套。 ', 1436507441, 'http://oa.xinyou88.com/mms/index.php/news/7'),
(14, 1, '陈高明', '2015-07-10 13:54:47', 1, '陈高明', '2015-07-10 13:59:46', 1, '特大喜讯', '图文', '', '特大喜讯：颐芝堂养生馆隆重推出超级天使回馈活动，仅需50元：可享受5896元大礼包！ ', '特大喜讯：颐芝堂养生馆隆重推出超级天使回馈活动，仅需50元：可享受5896元大礼包！ \r\n1、价值100元话费。 \r\n2、价值498元驱寒暖压理疗一次。\r\n\r\n3、价值298元肩颈驱寒艾灸一次。\r\n\r\n4、可享受5000消费卷1张。\r\n\r\n全店仅限30名。 \r\n', 1436507635, 'http://oa.xinyou88.com/mms/index.php/news/8');

-- --------------------------------------------------------

--
-- 表的结构 `xy_replays`
--

CREATE TABLE IF NOT EXISTS `xy_replays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `openid` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='回复列表' AUTO_INCREMENT=87 ;

--
-- 转存表中的数据 `xy_replays`
--

INSERT INTO `xy_replays` (`id`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `openid`, `title`, `content`) VALUES
(1, '2015-06-29 15:16:17', 0, '', '0000-00-00 00:00:00', 1, 'oSBXujqSVVWEZihp6ZJDhirlvvl8', '陈高明', ''),
(2, '2015-06-29 15:17:55', 0, '', '0000-00-00 00:00:00', 1, 'oSBXujiItnuxeYiWUBjbB4QOMIRI', '抢红包', ''),
(3, '2015-06-29 15:18:10', 0, '', '0000-00-00 00:00:00', 1, 'oSBXujoUSpUf1XwHHo6U2weGETwU', '抢红包', ''),
(4, '2015-06-29 15:18:17', 0, '', '0000-00-00 00:00:00', 1, 'oSBXujknFjimBTrEFiDIyqwogvEI', '抢红包', ''),
(5, '2015-06-29 15:19:59', 0, '', '0000-00-00 00:00:00', 1, 'oSBXujv2huKqI3EoC-6eYwHSTcrQ', '抢红包', ''),
(6, '2015-06-29 15:32:18', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '对话', ''),
(7, '2015-06-29 15:32:31', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '淡淡的', ''),
(8, '2015-06-29 15:33:35', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '产品', '已按指定规则回复'),
(9, '2015-06-29 15:33:54', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '美容', '已按指定规则回复'),
(10, '2015-06-29 15:35:48', 1, '陈高明', '2015-06-29 16:15:01', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '会员', '这个是我们公众号给你回复的，有什么问题可以随时回复，我们能后台可以看到的哦'),
(11, '2015-06-29 16:38:03', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '抢红包', ''),
(12, '2015-06-29 22:22:23', 1, '陈高明', '2015-06-30 09:49:54', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '你好', '你好，这是第二天回复的哦'),
(13, '2015-06-29 22:22:30', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '产品', '已按指定规则回复'),
(14, '2015-06-30 12:19:01', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '你好的', ''),
(15, '2015-06-30 14:09:12', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是老板', '已按指定规则回复'),
(16, '2015-06-30 17:38:22', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '我是老板', '已按指定规则回复'),
(17, '2015-06-30 22:34:36', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '美容', '已按指定规则回复'),
(18, '2015-06-30 22:36:36', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是内容顾问', ''),
(19, '2015-06-30 22:36:48', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是美容顾问', '已按指定规则回复'),
(20, '2015-07-01 15:39:39', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是老板', '已按指定规则回复'),
(21, '2015-07-01 15:40:37', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '内容', ''),
(22, '2015-07-01 15:40:48', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '美容', '已按指定规则回复'),
(23, '2015-07-01 15:53:35', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '我是美容顾问', '已按指定规则回复'),
(24, '2015-07-01 20:47:05', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '预约中心', '已按指定规则回复'),
(25, '2015-07-01 20:48:18', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '美容', '已按指定规则回复'),
(26, '2015-07-02 09:15:36', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是老板', '已按指定规则回复'),
(27, '2015-07-02 18:04:03', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '你好', ''),
(28, '2015-07-02 22:14:38', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '美容', '已按指定规则回复'),
(29, '2015-07-02 22:15:54', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是老板', '已按指定规则回复'),
(30, '2015-07-03 11:15:20', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是老板', '已按指定规则回复'),
(31, '2015-07-03 22:12:03', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '我是老板', '已按指定规则回复'),
(32, '2015-07-06 09:41:04', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是美容顾问', '已按指定规则回复'),
(33, '2015-07-06 09:45:08', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是老板', '已按指定规则回复'),
(34, '2015-07-06 09:49:34', 1, '陈高明', '2015-07-06 09:50:00', 1, 'o-6csuMLqEZ38arrk7nnVpDcohrg', '你好', '欢迎到店参观'),
(35, '2015-07-06 11:10:11', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '我是美容顾问', '已按指定规则回复'),
(36, '2015-07-06 13:50:30', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '我是美容顾问', '已按指定规则回复'),
(37, '2015-07-06 13:59:33', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '我是老板', '已按指定规则回复'),
(38, '2015-07-06 14:02:39', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuLPatRc-3R4rseOfoL5DzC8', '我是顾客', ''),
(39, '2015-07-06 14:11:12', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuEPY7B-Fc4Vrg5kXW2jny30', '我是老板', '已按指定规则回复'),
(40, '2015-07-06 14:34:00', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuEPY7B-Fc4Vrg5kXW2jny30', '我是美容顾问', '已按指定规则回复'),
(41, '2015-07-06 14:42:48', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuEPY7B-Fc4Vrg5kXW2jny30', '我是顾客', ''),
(42, '2015-07-06 15:12:09', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuMUnl9uByPa8d-dCJ_uKJQE', '你好', ''),
(43, '2015-07-06 15:12:15', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuLPatRc-3R4rseOfoL5DzC8', '我是老板', '已按指定规则回复'),
(44, '2015-07-06 15:54:01', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuMUnl9uByPa8d-dCJ_uKJQE', '你好', ''),
(45, '2015-07-06 15:54:29', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuMUnl9uByPa8d-dCJ_uKJQE', '我是顾客', ''),
(46, '2015-07-06 15:54:40', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuMUnl9uByPa8d-dCJ_uKJQE', '我是老板', '已按指定规则回复'),
(47, '2015-07-07 16:34:14', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuNAwMKpVyUE3zxgfTMllFds', '我是老板', '已按指定规则回复'),
(48, '2015-07-07 16:39:05', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuNAwMKpVyUE3zxgfTMllFds', '我是美容顾问', '已按指定规则回复'),
(49, '2015-07-08 09:31:46', 1, '陈高明', '2015-07-08 09:32:10', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '你好', '欢迎光临'),
(50, '2015-07-09 12:32:39', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuNOKUpXSZhXsYX8kCwMrd2w', '我是美容顾问', '已按指定规则回复'),
(51, '2015-07-10 10:16:37', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuMLqEZ38arrk7nnVpDcohrg', '我是老板', '已按指定规则回复'),
(52, '2015-07-10 10:20:26', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuMLqEZ38arrk7nnVpDcohrg', '我是顾客', ''),
(53, '2015-07-10 13:47:25', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '我是美容顾问', '已按指定规则回复'),
(54, '2015-07-10 14:12:43', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuMLqEZ38arrk7nnVpDcohrg', '我是美容顾问', '已按指定规则回复'),
(55, '2015-07-10 14:13:59', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是老板', '已按指定规则回复'),
(56, '2015-07-10 14:42:53', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuLTSNpVswZXskqkAkVoIVso', '我是老板', '已按指定规则回复'),
(57, '2015-07-10 14:47:32', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '我是老板', '已按指定规则回复'),
(58, '2015-07-10 14:48:46', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuLTSNpVswZXskqkAkVoIVso', '我是美容顾问', '已按指定规则回复'),
(59, '2015-07-10 14:59:33', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuNc3AeLSZLb69kYiKzLrXdE', '我是美容师', ''),
(60, '2015-07-10 15:02:48', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuNc3AeLSZLb69kYiKzLrXdE', '我是老板', '已按指定规则回复'),
(61, '2015-07-10 17:12:52', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuD0OPV_I89jrlyeQkyVLask', '我是美容顾问', '已按指定规则回复'),
(62, '2015-07-12 06:51:38', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuIkczsGBgIvSbNT4Ogleq2Y', '我是美容师', ''),
(63, '2015-07-12 06:52:02', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuIkczsGBgIvSbNT4Ogleq2Y', '我是老板', '已按指定规则回复'),
(64, '2015-07-12 09:56:06', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuLTSNpVswZXskqkAkVoIVso', '我是老板', '已按指定规则回复'),
(65, '2015-07-12 10:17:55', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuIkczsGBgIvSbNT4Ogleq2Y', '我是老板', '已按指定规则回复'),
(66, '2015-07-12 11:39:09', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuIkczsGBgIvSbNT4Ogleq2Y', '我是老板', '已按指定规则回复'),
(67, '2015-07-13 14:11:26', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuLZHazC_w-fG5AddU9E0A5A', '我是老板', '已按指定规则回复'),
(68, '2015-07-13 15:41:43', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuLTSNpVswZXskqkAkVoIVso', '我是老板', '已按指定规则回复'),
(69, '2015-07-15 09:57:07', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是老板', '已按指定规则回复'),
(70, '2015-07-16 13:40:38', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuOWbrx2kiPPcVNw8Z2q4k_I', '我是老板', '已按指定规则回复'),
(71, '2015-07-17 11:19:24', 0, '', '0000-00-00 00:00:00', 1, 'o-6csuEJXpx97Yfo1eNeXkvSfzy8', '我是老板', '已按指定规则回复'),
(72, '2015-07-20 21:29:21', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv7KumhyP6xsovkovwPstf-E', '你好', ''),
(73, '2015-07-20 21:29:39', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv_qjxgFn6RIotP16PbtnYX4', '我是老板', '已按指定规则回复'),
(74, '2015-07-20 21:40:09', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv_qjxgFn6RIotP16PbtnYX4', '我是美容顾问', '已按指定规则回复'),
(75, '2015-07-20 21:46:04', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv_qjxgFn6RIotP16PbtnYX4', '我是美容顾问', '已按指定规则回复'),
(76, '2015-07-20 21:56:38', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv_qjxgFn6RIotP16PbtnYX4', '我是美容顾问', '已按指定规则回复'),
(77, '2015-07-21 10:45:50', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv_qjxgFn6RIotP16PbtnYX4', '会员', '已按指定规则回复'),
(78, '2015-07-21 10:47:09', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv_qjxgFn6RIotP16PbtnYX4', '老板', '已按指定规则回复'),
(79, '2015-07-21 17:37:52', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv_qjxgFn6RIotP16PbtnYX4', '顾问', '已按指定规则回复'),
(80, '2015-07-21 17:44:44', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv_qjxgFn6RIotP16PbtnYX4', '会员', '已按指定规则回复'),
(81, '2015-07-21 18:17:28', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv4cG9ox30XnEOwkJPHpyWa8', '老板', '已按指定规则回复'),
(82, '2015-07-21 22:22:08', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv7KumhyP6xsovkovwPstf-E', '你好', ''),
(83, '2015-07-21 22:22:38', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv7KumhyP6xsovkovwPstf-E', '活动', ''),
(84, '2015-07-21 22:22:51', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv7KumhyP6xsovkovwPstf-E', '我是美容顾问', ''),
(85, '2015-07-22 12:16:15', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv7KumhyP6xsovkovwPstf-E', '活动', ''),
(86, '2015-08-12 14:17:26', 0, '', '0000-00-00 00:00:00', 1, 'oP6Fzv_qjxgFn6RIotP16PbtnYX4', '老板', '已按指定规则回复');

-- --------------------------------------------------------

--
-- 表的结构 `xy_ruku`
--

CREATE TABLE IF NOT EXISTS `xy_ruku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `bianhao` varchar(50) NOT NULL,
  `type` varchar(200) NOT NULL,
  `shuliang` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `shijian` date NOT NULL,
  `jingban` varchar(50) NOT NULL,
  `shenheren` varchar(50) NOT NULL,
  `shenhe` varchar(50) NOT NULL,
  `shopid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='入库记录' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xy_ruku`
--

INSERT INTO `xy_ruku` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `bianhao`, `type`, `shuliang`, `title`, `shijian`, `jingban`, `shenheren`, `shenhe`, `shopid`) VALUES
(1, 24, '张玉龙', '2015-07-17 18:16:00', 0, '', '0000-00-00 00:00:00', 1, '150717000001', '网购', 10, '妊娠纹修复套', '2015-07-17', '张玉龙', '张玉龙', '审核通过', 2),
(2, 24, '张玉龙', '2015-07-17 18:45:14', 0, '', '0000-00-00 00:00:00', 1, '150717140002', 'frrg', 9, 'few,妊娠纹修复套', '2015-07-17', '张玉龙', '张玉龙', '审核通过', 2);

-- --------------------------------------------------------

--
-- 表的结构 `xy_rukus`
--

CREATE TABLE IF NOT EXISTS `xy_rukus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `bianhao` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `type` varchar(255) NOT NULL,
  `danwei` varchar(20) NOT NULL,
  `shuliang` int(11) NOT NULL,
  `beizhu` varchar(255) NOT NULL,
  `shenhe` varchar(50) NOT NULL,
  `xid` int(11) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `jingban` varchar(50) NOT NULL,
  `shijian` date NOT NULL,
  `fenlei` varchar(50) NOT NULL,
  `dalei` varchar(50) NOT NULL,
  `shopid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='入库明细表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `xy_rukus`
--

INSERT INTO `xy_rukus` (`id`, `status`, `bianhao`, `title`, `type`, `danwei`, `shuliang`, `beizhu`, `shenhe`, `xid`, `edit`, `jingban`, `shijian`, `fenlei`, `dalei`, `shopid`) VALUES
(1, 1, '6953030209230', '妊娠纹修复套', '11', '盒', 10, '', '审核通过', 1, 0, '张玉龙', '2015-07-17', '美体面膜', '护肤品', 2),
(2, 1, 'eget', 'few', '3t3y', '', 5, '', '审核通过', 2, 0, '张玉龙', '2015-07-17', '', '', 2),
(3, 1, '6953030209230', '妊娠纹修复套', '11', '盒', 4, '', '审核通过', 2, 0, '张玉龙', '2015-07-17', '美体面膜', '护肤品', 2),
(4, 1, 'eget', 'few', '', '', 1, '卡号[12]消费撤单,返还入库', '审核通过', 0, 0, '张玉龙', '2015-07-20', '', '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `xy_shenhe`
--

CREATE TABLE IF NOT EXISTS `xy_shenhe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `xid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='审核记录' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xy_shenhe`
--

INSERT INTO `xy_shenhe` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `type`, `title`, `content`, `xid`) VALUES
(1, 24, '张玉龙', '2015-07-17 18:16:14', 0, '', '0000-00-00 00:00:00', 1, 'Ruku', '审核通过', '', 1),
(2, 24, '张玉龙', '2015-07-17 18:45:44', 0, '', '0000-00-00 00:00:00', 1, 'Ruku', '审核通过', '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `xy_shop`
--

CREATE TABLE IF NOT EXISTS `xy_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(100) NOT NULL,
  `dizhi` varchar(255) NOT NULL,
  `dianhua` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `beizhu` text NOT NULL,
  `iszb` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='店铺管理' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xy_shop`
--

INSERT INTO `xy_shop` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `title`, `dizhi`, `dianhua`, `name`, `content`, `beizhu`, `iszb`) VALUES
(1, 24, '周庆国', '2015-07-17 17:54:11', 1, '陈高明', '2017-11-27 21:13:52', 1, '美时美刻美容SPA会所-总部', '惠山区万达广场17号', '0518-85526465', '相红林', '', '', '是'),
(2, 24, '周庆国', '2015-07-17 17:54:47', 1, '陈高明', '2017-11-27 21:13:44', 1, '惠山区美时美刻美容SPA会所', '惠山区万达广场17号', '0518-85526465', '相红林', '', '享受美丽的地方，放松心情的空间！', '否');

-- --------------------------------------------------------

--
-- 表的结构 `xy_shou`
--

CREATE TABLE IF NOT EXISTS `xy_shou` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shopid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `jine` decimal(10,2) NOT NULL,
  `jingban` varchar(50) NOT NULL,
  `beizhu` varchar(255) NOT NULL,
  `attid` int(11) NOT NULL,
  `shenhe` varchar(50) NOT NULL,
  `shenheren` varchar(50) NOT NULL,
  `leixing` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收入记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xy_smss`
--

CREATE TABLE IF NOT EXISTS `xy_smss` (
  `uname` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` datetime NOT NULL,
  `content` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `jieguo` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ip` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='短信发送记录' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xy_smss`
--

INSERT INTO `xy_smss` (`uname`, `uid`, `id`, `addtime`, `content`, `phone`, `status`, `jieguo`, `url`, `ip`) VALUES
('张玉龙', 24, 1, '2015-07-21 17:44:26', '【CRM】亲:恭喜您于2015-07-21 17:44:26成为本店会员,级别:普通会员,卡号:881531,卡余额:5000.00 无锡市惠山区美时美刻美容SPA会所 退订回复TD', '15905120019', 1, '成功', '/index.php?m=Home&c=Huiyuan&a=add', '180.113.155.180'),
('', 0, 2, '2015-07-21 17:47:56', '【CRM】亲:会员张三预约了您，顾客将在 20:00:00到店，请做好准备！ 无锡市惠山区美时美刻美容SPA会所 退订回复TD', '18961314946', 1, '成功', '/index.php?m=Member&c=Index&a=yuyue_add', '180.113.155.180');

-- --------------------------------------------------------

--
-- 表的结构 `xy_ticheng`
--

CREATE TABLE IF NOT EXISTS `xy_ticheng` (
  `title` varchar(255) NOT NULL,
  `jine` decimal(10,2) NOT NULL,
  `danhao` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `juname` varchar(50) NOT NULL,
  `shopid` int(11) NOT NULL,
  `juid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updatetime` datetime NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `uuid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `hid` int(11) NOT NULL,
  `xingming` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='提成记录' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `xy_ticheng`
--

INSERT INTO `xy_ticheng` (`title`, `jine`, `danhao`, `type`, `juname`, `shopid`, `juid`, `status`, `updatetime`, `uuname`, `uuid`, `id`, `uid`, `uname`, `addtime`, `hid`, `xingming`) VALUES
('卡号[12]商品消费[few]获得提成', '0.01', 'SP2015072009302684', '商品消费提成', '徐敏', 2, 31, 1, '0000-00-00 00:00:00', '', 0, 1, 24, '张玉龙', '2015-07-20 09:30:26', 1, 'as'),
('卡号[12]消费撤单[few]退提成', '-0.01', 'CD2015072009304884', '消费撤单', '徐敏', 2, 31, 1, '0000-00-00 00:00:00', '', 0, 2, 24, '张玉龙', '2015-07-20 09:30:48', 1, 'as'),
('卡号[12]商品消费[妊娠纹修复套]获得提成', '19.95', 'SP2015072005175992', '商品消费提成', '李莉', 2, 26, 1, '0000-00-00 00:00:00', '', 0, 3, 24, '张玉龙', '2015-07-20 17:17:59', 1, 'as');

-- --------------------------------------------------------

--
-- 表的结构 `xy_tousu`
--

CREATE TABLE IF NOT EXISTS `xy_tousu` (
  `attid` int(11) NOT NULL,
  `beizhu` varchar(255) NOT NULL,
  `shopid` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `xingming` varchar(50) NOT NULL,
  `kahao` varchar(100) NOT NULL,
  `hid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updatetime` datetime NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `uuid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `uname` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客户投诉' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xy_user`
--

CREATE TABLE IF NOT EXISTS `xy_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `shopid` int(11) NOT NULL,
  `depname` varchar(50) NOT NULL,
  `posname` varchar(50) NOT NULL,
  `truename` char(30) NOT NULL,
  `sex` char(5) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `phone` char(11) NOT NULL,
  `neixian` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `logintime` datetime NOT NULL,
  `loginip` char(15) NOT NULL,
  `logins` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `update_time` int(11) NOT NULL,
  `bian` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `xy_user`
--

INSERT INTO `xy_user` (`id`, `username`, `password`, `shopid`, `depname`, `posname`, `truename`, `sex`, `tel`, `phone`, `neixian`, `email`, `qq`, `logintime`, `loginip`, `logins`, `status`, `update_time`, `bian`) VALUES
(1, 'admin', 'd7c6c07a0a04ba4e65921e2f90726384', 1, '综合办公室', '系统管理员', '陈高明', '男', '8552646', '13812349563', '6535665', 'pinkecn@qq.com', '1612985', '2017-11-27 21:16:24', '127.0.0.1', 738, 1, 1511788584, '此系统有X-Mis快速开发而来，欲了解详情请加QQ群：147654231  或联系开发者QQ:16129825'),
(24, 'admins', '14e1b600b1fd579f47433b88e8d85291', 2, '办公室', '老板', '张玉龙', '男', '0510-83594189', '15905120019', '', '490944019@qq.com', '490944019', '2015-07-21 18:18:27', '180.113.155.180', 72, 1, 1437473907, ''),
(25, 'arris', '14e1b600b1fd579f47433b88e8d85291', 2, '服务部', '收银员', '李爱云', '女', '0518-85866668', '13501248965', '', '501248965', '501248965', '2015-07-08 15:12:35', '117.92.167.213', 18, 1, 1436339555, ''),
(27, 'caiwu', '14e1b600b1fd579f47433b88e8d85291', 2, '财务部', '会计', '张紫然', '女', '0518-85866668', '85866668', '', '85866668', '85866668', '2015-07-13 10:01:22', '113.124.161.58', 15, 1, 1436752882, ''),
(28, 'lixue', '14e1b600b1fd579f47433b88e8d85291', 3, '财务部', '收银员', '李雪', '女', '0', '0', '', '0', '0', '2015-07-17 15:53:57', '222.191.137.117', 43, 1, 1437119932, ''),
(29, 'wl', '14e1b600b1fd579f47433b88e8d85291', 3, '服务部', '美容顾问', '王蕾', '女', '0', '13812349563', '', '0', '0', '2015-07-14 16:24:27', '58.223.4.226', 41, 1, 1436862267, ''),
(30, 'dhcw', '14e1b600b1fd579f47433b88e8d85291', 3, '财务部', '会计', '吴协恩', '女', '0', '0', '', '0', '0', '2015-07-08 15:15:49', '117.92.167.213', 7, 1, 1436339749, ''),
(31, 'xumin', '14e1b600b1fd579f47433b88e8d85291', 2, '服务部', '美容顾问', '徐敏', '女', '15651110214', '15651110214', '', '0', '0', '2015-07-20 21:56:58', '218.90.63.124', 12, 1, 1437400618, ''),
(32, 'zhanglan', '14e1b600b1fd579f47433b88e8d85291', 3, '服务部', '美容顾问', '张兰', '女', '22', '18705238063', '', '22', '22', '2015-07-10 13:47:38', '180.105.230.232', 1, 1, 1436507258, ''),
(33, 'xhl', '14e1b600b1fd579f47433b88e8d85291', 2, '办公室', '店长', '相红林', '女', '11', '11', '', '11', '11', '0000-00-00 00:00:00', '', 0, 1, 0, ''),
(34, 'msmk', '14e1b600b1fd579f47433b88e8d85291', 2, '服务部', '收银员', '张三', '女', '11', '11', '', '11', '11', '2015-07-20 17:19:02', '218.90.63.124', 7, 1, 1437385346, ''),
(35, 'wmm', '14e1b600b1fd579f47433b88e8d85291', 2, '服务部', '美容顾问', '王渺渺', '女', '1111', '18961314946', '', '11', '11', '2015-07-21 17:38:22', '180.113.155.180', 1, 1, 1437471502, '');

-- --------------------------------------------------------

--
-- 表的结构 `xy_weiset`
--

CREATE TABLE IF NOT EXISTS `xy_weiset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `ghid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  `appid` varchar(200) NOT NULL,
  `appsecret` varchar(200) NOT NULL,
  `attid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='账号设置' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `xy_weiset`
--

INSERT INTO `xy_weiset` (`id`, `title`, `ghid`, `name`, `token`, `appid`, `appsecret`, `attid`) VALUES
(1, '无锡美时美刻', 'gh_0e63d56d3d9b ', 'wxmsmkSPA', 'w123', 'wxa925589629ddd465', '0faa784f2d033ccad00f6950631fd6f1', 1435386266);

-- --------------------------------------------------------

--
-- 表的结构 `xy_wmenu`
--

CREATE TABLE IF NOT EXISTS `xy_wmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `level` tinyint(1) NOT NULL,
  `pid` int(11) NOT NULL,
  `catename` varchar(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `alink` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `biaoti` varchar(100) NOT NULL,
  `jianjie` varchar(255) NOT NULL,
  `pic` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信菜单' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `xy_wmenu`
--

INSERT INTO `xy_wmenu` (`id`, `uid`, `uname`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `level`, `pid`, `catename`, `type`, `alink`, `text`, `biaoti`, `jianjie`, `pic`, `url`, `sort`) VALUES
(1, 1, '陈高明', '2015-06-27 21:06:34', 1, '陈高明', '2015-07-10 13:31:21', 1, 0, 0, '美丽人身', '', '', '', '', '', 0, '', 1),
(2, 1, '陈高明', '2015-06-27 21:07:16', 1, '陈高明', '2015-07-10 13:35:37', 1, 1, 1, '走进美丽人身', '返回文字', '', '这个是美容院简介哦', '', '', 1435410398, '', 1),
(3, 1, '陈高明', '2015-06-27 21:09:05', 1, '陈高明', '2015-07-10 13:38:21', 1, 1, 1, '分店地址', '返回文字', '', '', '', '', 0, '', 2),
(4, 1, '陈高明', '2015-06-27 21:11:40', 1, '陈高明', '2015-06-28 19:13:10', 1, 1, 1, '产品中心', '返回图文', '', '', '我们有很多产品的哦', '美容化妆品加盟众多化妆品品牌，一站式供货，超低折扣，美容化妆品加盟稳定的客户人群!美容化妆品加盟整店输出，督导上门指导，托管经营，美容化妆品加盟店店排队', 1435410552, 'http://www.baidu.com/s?ie=utf-8&amp;wd=美容院产品', 3),
(5, 1, '陈高明', '2015-06-27 21:12:34', 1, '陈高明', '2015-07-10 13:25:46', 1, 0, 0, '会员中心', '跳转网址', '', '', '', '', 0, '', 1),
(6, 1, '陈高明', '2015-06-27 21:13:48', 1, '陈高明', '2015-07-10 14:12:21', 1, 0, 0, '最新活动', '返回图文', '', '返回预约中心文字内容', '', '', 0, '', 3),
(7, 1, '陈高明', '2015-07-10 13:25:59', 0, '', '0000-00-00 00:00:00', 1, 1, 5, '我的账户', '跳转网址', 'http://oa.xinyou88.com/mms/member.php', '', '', '', 0, '', 1),
(8, 1, '陈高明', '2015-07-10 13:26:15', 0, '', '0000-00-00 00:00:00', 1, 1, 5, '我要预约', '跳转网址', 'http://oa.xinyou88.com/mms/member.php', '', '', '', 0, '', 2),
(9, 1, '陈高明', '2015-07-10 13:27:06', 0, '', '0000-00-00 00:00:00', 1, 1, 5, '我的消费', '跳转网址', 'http://oa.xinyou88.com/mms/member.php', '', '', '', 0, '', 3),
(10, 1, '陈高明', '2015-07-10 13:27:18', 0, '', '0000-00-00 00:00:00', 1, 1, 5, '我的评价', '跳转网址', 'http://oa.xinyou88.com/mms/member.php', '', '', '', 0, '', 4),
(11, 1, '陈高明', '2015-07-10 13:27:37', 0, '', '0000-00-00 00:00:00', 1, 1, 5, '积分礼品', '跳转网址', 'http://oa.xinyou88.com/mms/member.php', '', '', '', 0, '', 5),
(12, 1, '陈高明', '2015-07-10 13:50:26', 0, '', '0000-00-00 00:00:00', 1, 1, 6, '998优惠卡', '返回图文', '', '', '', '', 0, '', 1),
(13, 1, '陈高明', '2015-07-10 13:53:49', 0, '', '0000-00-00 00:00:00', 1, 1, 6, '特大喜讯', '返回图文', '', '', '', '', 0, '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `xy_xiaofei`
--

CREATE TABLE IF NOT EXISTS `xy_xiaofei` (
  `jian` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `zhuangtai` varchar(50) NOT NULL,
  `jifen` int(11) NOT NULL,
  `fukuan` decimal(10,2) NOT NULL,
  `jine` decimal(10,2) NOT NULL,
  `type` varchar(50) NOT NULL,
  `kahao` varchar(100) NOT NULL,
  `xingming` varchar(50) NOT NULL,
  `hid` int(11) NOT NULL,
  `danhao` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updatetime` datetime NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `uuid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `uname` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消费记录' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `xy_xiaofei`
--

INSERT INTO `xy_xiaofei` (`jian`, `shopid`, `zhuangtai`, `jifen`, `fukuan`, `jine`, `type`, `kahao`, `xingming`, `hid`, `danhao`, `status`, `updatetime`, `uuname`, `uuid`, `addtime`, `uname`, `uid`, `id`, `title`) VALUES
(0, 2, '已撤单', 0, '0.95', '0.95', '商品消费', '12', 'as', 1, 'SP2015072009302684', 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 09:30:26', '张玉龙', 24, 1, ' few'),
(0, 2, '消费撤单', 0, '-0.95', '-0.95', '消费撤单', '12', 'as', 1, 'CD2015072009304884', 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 09:30:48', '张玉龙', 24, 2, NULL),
(0, 2, '已结算', 285, '285.00', '285.00', '商品消费', '12', 'as', 1, 'SP2015072005175992', 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 17:17:59', '张玉龙', 24, 3, ' 妊娠纹修复套'),
(0, 2, '已结算', 1280, '1280.00', '1280.00', '快速消费', '12', 'as', 1, 'KS2015072005422521', 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 17:42:25', '张三', 34, 4, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xy_xiaofeis`
--

CREATE TABLE IF NOT EXISTS `xy_xiaofeis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `addtime` datetime NOT NULL,
  `xid` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `danhao` varchar(100) NOT NULL,
  `bianhao` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `xjiage` decimal(10,2) NOT NULL,
  `zjiage` decimal(10,2) NOT NULL,
  `shuliang` int(11) NOT NULL,
  `jifen` int(11) NOT NULL,
  `juid` int(11) NOT NULL,
  `juname` varchar(50) NOT NULL,
  `xiaoji` decimal(10,2) NOT NULL,
  `zhuangtai` varchar(50) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `rjiage` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消费明细表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `xy_xiaofeis`
--

INSERT INTO `xy_xiaofeis` (`id`, `uid`, `uname`, `addtime`, `xid`, `shopid`, `status`, `danhao`, `bianhao`, `title`, `xjiage`, `zjiage`, `shuliang`, `jifen`, `juid`, `juname`, `xiaoji`, `zhuangtai`, `edit`, `rjiage`) VALUES
(1, 24, '张玉龙', '2015-07-20 09:30:26', 1, 2, 1, 'SP2015072009302684', 'eget', 'few', '1.00', '0.95', 1, 0, 31, '徐敏', '0.95', '已撤单', 0, '1.00'),
(2, 24, '张玉龙', '2015-07-20 09:30:48', 2, 2, 1, 'CD2015072009304884', 'eget', 'few', '1.00', '0.95', 1, 0, 31, '徐敏', '0.95', '消费撤单', 0, '0.00'),
(3, 24, '张玉龙', '2015-07-20 17:17:59', 3, 2, 1, 'SP2015072005175992', '6953030209230', '妊娠纹修复套', '300.00', '285.00', 1, 285, 26, '李莉', '285.00', '已结算', 0, '12.00');

-- --------------------------------------------------------

--
-- 表的结构 `xy_yuyue`
--

CREATE TABLE IF NOT EXISTS `xy_yuyue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `updatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `juid` int(11) NOT NULL,
  `juname` varchar(100) NOT NULL,
  `hid` int(11) NOT NULL,
  `xingming` varchar(100) NOT NULL,
  `kahao` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `yytime` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='预约管理' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `xy_yuyue`
--

INSERT INTO `xy_yuyue` (`id`, `shopid`, `addtime`, `uuid`, `uuname`, `updatetime`, `status`, `juid`, `juname`, `hid`, `xingming`, `kahao`, `title`, `yytime`, `content`) VALUES
(1, 2, '2015-07-21 17:46:00', 0, '', '0000-00-00 00:00:00', 1, 35, '王渺渺', 2, '张三', '881531', '做', '2019-11-30 00:00:00', '');

-- --------------------------------------------------------

--
-- 表的结构 `xy_zijin`
--

CREATE TABLE IF NOT EXISTS `xy_zijin` (
  `title` varchar(255) NOT NULL,
  `jine` decimal(10,2) NOT NULL,
  `type` varchar(20) NOT NULL,
  `xianjin` decimal(10,2) NOT NULL,
  `yue` decimal(10,2) NOT NULL,
  `pos` decimal(10,2) NOT NULL,
  `song` decimal(10,2) NOT NULL,
  `jian` decimal(10,2) NOT NULL,
  `xingming` varchar(50) NOT NULL,
  `danhao` varchar(100) NOT NULL,
  `kahao` varchar(50) NOT NULL,
  `hid` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updatetime` datetime NOT NULL,
  `uuname` varchar(50) NOT NULL,
  `uuid` int(11) NOT NULL,
  `addtime` datetime NOT NULL,
  `uname` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资金记录' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `xy_zijin`
--

INSERT INTO `xy_zijin` (`title`, `jine`, `type`, `xianjin`, `yue`, `pos`, `song`, `jian`, `xingming`, `danhao`, `kahao`, `hid`, `shopid`, `status`, `updatetime`, `uuname`, `uuid`, `addtime`, `uname`, `uid`, `id`) VALUES
('首次办卡[12]充值[33],赠送', '33.00', '充值', '33.00', '0.00', '0.00', '0.00', '0.00', 'as', 'CZ150717380002', '12', 1, 2, 1, '0000-00-00 00:00:00', '', 0, '2015-07-17 18:49:38', '张三', 34, 1),
('[12]充值[13] ', '13.00', '充值', '12.00', '0.00', '0.00', '1.00', '0.00', 'as', 'CZ2015071706510082', '12', 1, 2, 1, '0000-00-00 00:00:00', '', 0, '2015-07-17 18:51:00', '张三', 34, 2),
('[12]充值[5000] ', '5000.00', '充值', '5000.00', '0.00', '0.00', '0.00', '0.00', 'as', 'CZ2015071707033538', '12', 1, 2, 1, '0000-00-00 00:00:00', '', 0, '2015-07-17 19:03:35', '张玉龙', 24, 3),
('卡号[12]商品消费,卡扣款0.95', '0.95', '商品消费', '0.00', '0.95', '0.00', '0.00', '0.00', 'as', 'SP2015072009302684', '12', 1, 2, 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 09:30:26', '张玉龙', 24, 4),
('卡号[12]商品消费撤单,卡退款0.95', '-0.95', '消费撤单', '0.00', '-0.95', '0.00', '0.00', '0.00', 'as', 'CD2015072009304884', '12', 1, 2, 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 09:30:49', '张玉龙', 24, 5),
('卡号[12]商品消费,卡扣款285', '285.00', '商品消费', '0.00', '285.00', '0.00', '0.00', '0.00', 'as', 'SP2015072005175992', '12', 1, 2, 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 17:17:59', '张玉龙', 24, 6),
('[12]充值[4558] ', '4558.00', '充值', '4558.00', '0.00', '0.00', '0.00', '0.00', 'as', 'CZ2015072005350268', '12', 1, 2, 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 17:35:02', '张三', 34, 7),
('卡号[12]快速消费,卡扣款1280', '1280.00', '快速消费', '0.00', '1280.00', '0.00', '0.00', '0.00', 'as', 'KS2015072005422521', '12', 1, 2, 1, '0000-00-00 00:00:00', '', 0, '2015-07-20 17:42:25', '张三', 34, 8),
('首次办卡[881531]充值[5000],赠送', '5000.00', '充值', '5000.00', '0.00', '0.00', '0.00', '0.00', '张三', 'CZ150721250002', '881531', 2, 2, 1, '0000-00-00 00:00:00', '', 0, '2015-07-21 17:44:25', '张玉龙', 24, 9);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
