# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.41-3ubuntu12.6)
# Database: shopim2
# Generation Time: 2013-09-13 05:11:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table shop_webim_domains
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_domains`;

CREATE TABLE `shop_webim_domains` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domains_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_domains` WRITE;
/*!40000 ALTER TABLE `shop_webim_domains` DISABLE KEYS */;

INSERT INTO `shop_webim_domains` (`id`, `eid`, `name`, `created_at`)
VALUES
	(1,10000,'shopim.com','0000-00-00 00:00:00'),
	(2,10000,'shop.webim20.cn','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `shop_webim_domains` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_evals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_evals`;

CREATE TABLE `shop_webim_evals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT '10000',
  `user_id` varchar(20) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `visitor_id` varchar(20) DEFAULT NULL,
  `grade` int(2) NOT NULL DEFAULT '4',
  `suggestion` text,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访客评价表';

LOCK TABLES `shop_webim_evals` WRITE;
/*!40000 ALTER TABLE `shop_webim_evals` DISABLE KEYS */;

INSERT INTO `shop_webim_evals` (`id`, `eid`, `user_id`, `group_id`, `visitor_id`, `grade`, `suggestion`, `created_at`)
VALUES
	(6,10000,'1',1,'52050b0b1848c',3,'态度再好点儿就成。','2013-08-09 23:33:50'),
	(7,10000,'2',2,'520f7cae8539e',4,'','2013-08-17 21:51:24'),
	(8,10000,'2',2,'5211e4c460a19',4,'','2013-08-19 21:19:15'),
	(9,10000,'2',2,'52136773d88db',4,'','2013-08-20 20:56:30'),
	(10,10000,'2',2,'52136773d88db',4,'','2013-08-20 20:57:28'),
	(11,10000,'2',2,'52136773d88db',4,'','2013-08-20 21:00:56'),
	(12,10000,'2',2,'52136898101fa',4,'','2013-08-20 21:02:53'),
	(13,10000,'2',2,'521db93a7302d',2,'','2013-08-28 16:51:10'),
	(14,10000,'2',2,'521db93a7302d',4,'','2013-08-28 16:54:03'),
	(15,10000,'2',2,'522323528e271',4,'','2013-09-01 19:24:14'),
	(16,10000,'2',2,'522323528e271',4,'','2013-09-01 19:24:29'),
	(17,10000,'2',2,'522fdf4b0805d',4,'','2013-09-11 11:11:45'),
	(18,10000,'2',2,'522fdf4b0805d',4,'','2013-09-11 11:16:10');

/*!40000 ALTER TABLE `shop_webim_evals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_groups`;

CREATE TABLE `shop_webim_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `pic` varchar(50) DEFAULT NULL,
  `desc` text,
  `rid` int(11) DEFAULT NULL,
  `desc_pic` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_groups` WRITE;
/*!40000 ALTER TABLE `shop_webim_groups` DISABLE KEYS */;

INSERT INTO `shop_webim_groups` (`id`, `eid`, `name`, `pic`, `desc`, `rid`, `desc_pic`, `created_at`, `updated_at`)
VALUES
	(1,10000,'商务支持',NULL,'商务支持',2,NULL,'2013-08-01 12:24:19','2013-07-27 12:25:38'),
	(2,10000,'技术支持','13753251294116.png','技术支持',1,NULL,'2013-08-01 12:24:08','2013-07-27 12:57:45'),
	(7,10000,'售后服务',NULL,'',3,NULL,'2013-08-08 10:46:26','0000-00-00 00:00:00');

/*!40000 ALTER TABLE `shop_webim_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_histories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_histories`;

CREATE TABLE `shop_webim_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL COMMENT 'Chat Thread ID',
  `send` tinyint(1) DEFAULT NULL,
  `visitor_id` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `to` varchar(20) DEFAULT NULL,
  `to_nick` varchar(30) DEFAULT NULL,
  `from` varchar(20) DEFAULT NULL,
  `nick` varchar(20) DEFAULT NULL COMMENT 'from nick',
  `body` text,
  `style` varchar(150) DEFAULT NULL,
  `timestamp` double DEFAULT NULL,
  `todel` tinyint(1) NOT NULL DEFAULT '0',
  `fromdel` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `todel` (`todel`),
  KEY `fromdel` (`fromdel`),
  KEY `timestamp` (`timestamp`),
  KEY `to` (`to`),
  KEY `from` (`from`),
  KEY `send` (`send`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_histories` WRITE;
/*!40000 ALTER TABLE `shop_webim_histories` DISABLE KEYS */;

INSERT INTO `shop_webim_histories` (`id`, `tid`, `send`, `visitor_id`, `user_id`, `type`, `to`, `to_nick`, `from`, `nick`, `body`, `style`, `timestamp`, `todel`, `fromdel`, `created_at`, `updated_at`)
VALUES
	(1,NULL,1,'5201a8b6bf5d3','weiyue','unicast','5201a8b6bf5d3','guest3561','weiyue','魏玥','您好，我是魏玥，欢迎来访','',1375840519148.3,1,0,'2013-08-07 09:55:19',NULL),
	(2,NULL,1,'5201a8b6bf5d3','weiyue','unicast','weiyue','魏玥','5201a8b6bf5d3','guest3561','正在: http://shopim.webim20.cn/','',1375840526453.1,0,1,'2013-08-07 09:55:26',NULL),
	(3,NULL,1,'5201a8b6bf5d3','weiyue','unicast','weiyue','魏玥','5201a8b6bf5d3','guest3561','hello','',1375840526458.9,0,1,'2013-08-07 09:55:26',NULL),
	(4,NULL,1,'5201a8b6bf5d3','weiyue','unicast','5201a8b6bf5d3','guest3561','weiyue','魏玥','hellp','',1375840533775.7,1,0,'2013-08-07 09:55:33',NULL),
	(5,NULL,1,'5201a8b6bf5d3','weiyue','unicast','5201a8b6bf5d3','guest3561','weiyue','魏玥','hello','',1375840536011.9,1,0,'2013-08-07 09:55:36',NULL),
	(6,NULL,1,'5201a8b6bf5d3','weiyue','unicast','5201a8b6bf5d3','guest3561','weiyue','魏玥','您好，我是魏玥，欢迎来访','',1375840635923.6,0,0,'2013-08-07 09:57:16',NULL),
	(7,NULL,1,'5201a8b6bf5d3','weiyue','unicast','5201a8b6bf5d3','guest3561','weiyue','魏玥','您好，我是魏玥，欢迎来访','',1375840635914.5,0,0,'2013-08-07 09:57:16',NULL),
	(8,NULL,1,'5201a8b6bf5d3','weiyue','unicast','5201a8b6bf5d3','guest3561','weiyue','魏玥','您好','',1375840645737.2,0,0,'2013-08-07 09:57:25',NULL),
	(9,NULL,1,'52050b0b1848c','admin','unicast','52050b0b1848c','guest9645','admin','管理员','您好，我是管理员，欢迎来访','',1376062384838.7,0,0,'2013-08-09 23:33:06',NULL),
	(10,NULL,1,'52050b0b1848c','admin','unicast','admin','管理员','52050b0b1848c','guest9645','hi','',1376062397037.9,0,0,'2013-08-09 23:33:17',NULL),
	(11,NULL,1,'52050b0b1848c','admin','unicast','admin','管理员','52050b0b1848c','guest9645','正在: http://shopim1.webim20.cn/','',1376062397192,0,0,'2013-08-09 23:33:17',NULL),
	(12,NULL,1,'52050b0b1848c','admin','unicast','admin','管理员','52050b0b1848c','guest9645','Some boddy online?','',1376062409712.2,0,0,'2013-08-09 23:33:29',NULL),
	(13,NULL,1,'520c935b06587','weiyue','unicast','520c935b06587','guest4683','weiyue','魏玥','您好，我是魏玥，欢迎来访','',1376555972809.3,0,0,'2013-08-15 16:39:33',NULL),
	(14,NULL,1,'520c935b06587','weiyue','unicast','weiyue','魏玥','520c935b06587','guest4683','正在: http://shopim.webim20.cn/','',1376555979615.3,0,0,'2013-08-15 16:39:39',NULL),
	(15,NULL,1,'520c935b06587','weiyue','unicast','weiyue','魏玥','520c935b06587','guest4683','hello','',1376555979691.6,0,0,'2013-08-15 16:39:39',NULL),
	(16,NULL,1,'520c935b06587','weiyue','unicast','520c935b06587','guest4683','weiyue','魏玥','您好，我是魏玥，欢迎来访','',1376555999220.7,0,0,'2013-08-15 16:39:59',NULL),
	(17,NULL,1,'520c935b06587','weiyue','unicast','weiyue','魏玥','520c935b06587','guest4683','hihi','',1376556005912.7,0,0,'2013-08-15 16:40:05',NULL),
	(18,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376579717467.7,0,0,'2013-08-15 23:15:19',NULL),
	(19,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','hell','',1376579727748.8,0,0,'2013-08-15 23:15:27',NULL),
	(20,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','正在: http://shopim.webim20.cn/','',1376579734193.9,0,0,'2013-08-15 23:15:34',NULL),
	(21,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','lGreat','',1376579734373.5,0,0,'2013-08-15 23:15:34',NULL),
	(22,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','Great','',1376579736664.1,0,0,'2013-08-15 23:15:36',NULL),
	(23,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376586713418.6,0,0,'2013-08-16 01:11:54',NULL),
	(24,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376586903881.7,0,0,'2013-08-16 01:15:05',NULL),
	(25,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','ll','',1376587002216.7,0,0,'2013-08-16 01:16:42',NULL),
	(26,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','li','',1376587009513,0,0,'2013-08-16 01:16:49',NULL),
	(27,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376587106881.3,0,0,'2013-08-16 01:18:27',NULL),
	(28,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ll','',1376587114348.2,0,0,'2013-08-16 01:18:34',NULL),
	(29,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376588686396.3,0,0,'2013-08-16 01:44:46',NULL),
	(30,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','。。。','',1376588701803.7,0,0,'2013-08-16 01:45:01',NULL),
	(31,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','你还记得我啊','',1376588706082.2,0,0,'2013-08-16 01:45:06',NULL),
	(32,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376623977275.2,0,0,'2013-08-16 11:32:57',NULL),
	(33,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','nope','',1376623983837.3,0,0,'2013-08-16 11:33:03',NULL),
	(34,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376624756773.7,0,0,'2013-08-16 11:45:57',NULL),
	(35,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376624909452.5,0,0,'2013-08-16 11:48:29',NULL),
	(36,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376625133739.6,0,0,'2013-08-16 11:52:14',NULL),
	(37,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376625168627.5,0,0,'2013-08-16 11:52:49',NULL),
	(38,NULL,1,'520da20bc12be','erylee','unicast','erylee','李枫','520da20bc12be','guest9228','正在: http://shopim.webim20.cn/','',1376625172607.3,0,0,'2013-08-16 11:52:52',NULL),
	(39,NULL,1,'520da20bc12be','erylee','unicast','erylee','李枫','520da20bc12be','guest9228','ni','',1376625172628.3,0,0,'2013-08-16 11:52:52',NULL),
	(40,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376625625658.1,0,0,'2013-08-16 12:00:25',NULL),
	(41,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376625639247.6,0,0,'2013-08-16 12:00:39',NULL),
	(42,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376626099526.1,0,0,'2013-08-16 12:08:20',NULL),
	(43,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376626114867.4,0,0,'2013-08-16 12:08:35',NULL),
	(44,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376626294678.6,0,0,'2013-08-16 12:11:34',NULL),
	(45,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376626385291.7,0,0,'2013-08-16 12:13:07',NULL),
	(46,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376626454534.7,0,0,'2013-08-16 12:14:15',NULL),
	(47,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376626463251.3,0,0,'2013-08-16 12:14:24',NULL),
	(48,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376626550924.9,0,0,'2013-08-16 12:15:51',NULL),
	(49,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376626559485.5,0,0,'2013-08-16 12:15:59',NULL),
	(50,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376626651085.7,0,0,'2013-08-16 12:17:31',NULL),
	(51,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376626654746.7,0,0,'2013-08-16 12:17:35',NULL),
	(52,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376626661201.9,0,0,'2013-08-16 12:17:41',NULL),
	(53,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376626776698.7,0,0,'2013-08-16 12:19:37',NULL),
	(54,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376626787614.9,0,0,'2013-08-16 12:19:48',NULL),
	(55,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376626981169.2,0,0,'2013-08-16 12:23:04',NULL),
	(56,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376627002458.6,0,0,'2013-08-16 12:23:23',NULL),
	(57,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376627026507,0,0,'2013-08-16 12:23:47',NULL),
	(58,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376627032087.8,0,0,'2013-08-16 12:23:52',NULL),
	(59,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376628365703.3,0,0,'2013-08-16 12:46:05',NULL),
	(60,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','ls','',1376628371914.5,0,0,'2013-08-16 12:46:11',NULL),
	(61,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376628383752.4,0,0,'2013-08-16 12:46:24',NULL),
	(62,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','你好','',1376628393503.8,0,0,'2013-08-16 12:46:33',NULL),
	(63,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','你也好','',1376628398267.2,0,0,'2013-08-16 12:46:38',NULL),
	(64,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376628733874.6,0,0,'2013-08-16 12:52:14',NULL),
	(65,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376628740068,0,0,'2013-08-16 12:52:20',NULL),
	(66,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','你好','',1376628744767.5,0,0,'2013-08-16 12:52:24',NULL),
	(67,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','你也好','',1376628756347.2,0,0,'2013-08-16 12:52:36',NULL),
	(68,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376628813639.4,0,0,'2013-08-16 12:53:33',NULL),
	(69,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','你也好','',1376628819322.3,0,0,'2013-08-16 12:53:39',NULL),
	(70,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','晕','',1376628822736.5,0,0,'2013-08-16 12:53:42',NULL),
	(71,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376631015470.9,0,0,'2013-08-16 13:30:18',NULL),
	(72,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','li','',1376631025259.7,0,0,'2013-08-16 13:30:25',NULL),
	(73,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','i；；；；；','',1376631029532,0,0,'2013-08-16 13:30:29',NULL),
	(74,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376631030575.3,0,0,'2013-08-16 13:30:31',NULL),
	(75,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','ll','',1376631044715.6,0,0,'2013-08-16 13:30:44',NULL),
	(76,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376632428269.4,0,0,'2013-08-16 13:53:50',NULL),
	(77,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376632441457.4,0,0,'2013-08-16 13:54:03',NULL),
	(78,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ls','',1376632446953,0,0,'2013-08-16 13:54:06',NULL),
	(79,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','grep','',1376632451653.2,0,0,'2013-08-16 13:54:11',NULL),
	(80,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','jian','',1376632465619.1,0,0,'2013-08-16 13:54:25',NULL),
	(81,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','jianjiande','',1376632467726.9,0,0,'2013-08-16 13:54:27',NULL),
	(82,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','Great\n','',1376632470489.4,0,0,'2013-08-16 13:54:30',NULL),
	(83,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','Haode','',1376632475218,0,0,'2013-08-16 13:54:35',NULL),
	(84,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','l..','',1376632480031.1,0,0,'2013-08-16 13:54:40',NULL),
	(85,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','你妹的','',1376632485348.3,0,0,'2013-08-16 13:54:45',NULL),
	(86,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','哈哈','',1376632487769.1,0,0,'2013-08-16 13:54:47',NULL),
	(87,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','哈哈','',1376632489705.1,0,0,'2013-08-16 13:54:49',NULL),
	(88,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376632548197,0,0,'2013-08-16 13:55:51',NULL),
	(89,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','hello','',1376632764864.9,0,0,'2013-08-16 13:59:24',NULL),
	(90,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','你好','',1376632770476.4,0,0,'2013-08-16 13:59:30',NULL),
	(91,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','weishenme','',1376632774637.4,0,0,'2013-08-16 13:59:34',NULL),
	(92,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','会场好','',1376632797505.5,0,0,'2013-08-16 13:59:57',NULL),
	(93,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','nimei de','',1376632802961.7,0,0,'2013-08-16 14:00:02',NULL),
	(94,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','怎么了','',1376632806271.9,0,0,'2013-08-16 14:00:06',NULL),
	(95,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','mei shenme','',1376632810175.2,0,0,'2013-08-16 14:00:10',NULL),
	(96,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','没什么你说个鸡巴','',1376632815533.6,0,0,'2013-08-16 14:00:15',NULL),
	(97,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','怎么就不能说了','',1376632825243.5,0,0,'2013-08-16 14:00:25',NULL),
	(98,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','哪天你给我带个烧饼','',1376632833614.4,0,0,'2013-08-16 14:00:33',NULL),
	(99,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','好吧','',1376632839119,0,0,'2013-08-16 14:00:39',NULL),
	(100,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','你个吃货','',1376632842506.4,0,0,'2013-08-16 14:00:42',NULL),
	(101,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','你妹的','',1376632857256,0,0,'2013-08-16 14:00:57',NULL),
	(102,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','。。。','',1376632860619.8,0,0,'2013-08-16 14:01:00',NULL),
	(103,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','...','',1376632867563.2,0,0,'2013-08-16 14:01:07',NULL),
	(104,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','............................','',1376632871773.2,0,0,'2013-08-16 14:01:11',NULL),
	(105,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','.,.,.,.,.,.,.,.,','',1376632876677,0,0,'2013-08-16 14:01:16',NULL),
	(106,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','.,.,.,.','',1376632878800.4,0,0,'2013-08-16 14:01:18',NULL),
	(107,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫',',.,.','',1376632879293.2,0,0,'2013-08-16 14:01:19',NULL),
	(108,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫',',.,.','',1376632881402.5,0,0,'2013-08-16 14:01:21',NULL),
	(109,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫',',.,,,..,,..,,.,.,..,,.,.,..,,.,..,','',1376632884623.5,0,0,'2013-08-16 14:01:24',NULL),
	(110,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ssss','',1376632885826.4,0,0,'2013-08-16 14:01:25',NULL),
	(111,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632887124.1,0,0,'2013-08-16 14:01:27',NULL),
	(112,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632887775.8,0,0,'2013-08-16 14:01:27',NULL),
	(113,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632888944.2,0,0,'2013-08-16 14:01:28',NULL),
	(114,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632889396.5,0,0,'2013-08-16 14:01:29',NULL),
	(115,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632889593.6,0,0,'2013-08-16 14:01:29',NULL),
	(116,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ss','',1376632890350.6,0,0,'2013-08-16 14:01:30',NULL),
	(117,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632890709.5,0,0,'2013-08-16 14:01:30',NULL),
	(118,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632890799.5,0,0,'2013-08-16 14:01:30',NULL),
	(119,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ss','',1376632891049.2,0,0,'2013-08-16 14:01:31',NULL),
	(120,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632891467.6,0,0,'2013-08-16 14:01:31',NULL),
	(121,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632891997.5,0,0,'2013-08-16 14:01:31',NULL),
	(122,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632892350.8,0,0,'2013-08-16 14:01:32',NULL),
	(123,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632892563.7,0,0,'2013-08-16 14:01:32',NULL),
	(124,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632892657.9,0,0,'2013-08-16 14:01:32',NULL),
	(125,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ss','',1376632892758.5,0,0,'2013-08-16 14:01:32',NULL),
	(126,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ss','',1376632893345,0,0,'2013-08-16 14:01:33',NULL),
	(127,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632893824.4,0,0,'2013-08-16 14:01:33',NULL),
	(128,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ssss','',1376632894399.4,0,0,'2013-08-16 14:01:34',NULL),
	(129,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632894534.9,0,0,'2013-08-16 14:01:34',NULL),
	(130,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632894791.5,0,0,'2013-08-16 14:01:34',NULL),
	(131,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632896317.8,0,0,'2013-08-16 14:01:36',NULL),
	(132,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632896469.3,0,0,'2013-08-16 14:01:36',NULL),
	(133,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632896629.6,0,0,'2013-08-16 14:01:36',NULL),
	(134,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632896749.6,0,0,'2013-08-16 14:01:36',NULL),
	(135,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632897041.6,0,0,'2013-08-16 14:01:37',NULL),
	(136,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','\nsssss','',1376632897360.4,0,0,'2013-08-16 14:01:37',NULL),
	(137,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632898310.8,0,0,'2013-08-16 14:01:38',NULL),
	(138,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632899126.2,0,0,'2013-08-16 14:01:39',NULL),
	(139,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632899506.1,0,0,'2013-08-16 14:01:39',NULL),
	(140,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','\n\ns','',1376632899570.5,0,0,'2013-08-16 14:01:39',NULL),
	(141,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','f','',1376632899600.9,0,0,'2013-08-16 14:01:39',NULL),
	(142,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','sa','',1376632899715.3,0,0,'2013-08-16 14:01:39',NULL),
	(143,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df as','',1376632900238.4,0,0,'2013-08-16 14:01:40',NULL),
	(144,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632901184.4,0,0,'2013-08-16 14:01:41',NULL),
	(145,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫',' as','',1376632901424.5,0,0,'2013-08-16 14:01:41',NULL),
	(146,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632901473.1,0,0,'2013-08-16 14:01:41',NULL),
	(147,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asdf','',1376632901500.5,0,0,'2013-08-16 14:01:41',NULL),
	(148,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','sa','',1376632902504.7,0,0,'2013-08-16 14:01:42',NULL),
	(149,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632902835.1,0,0,'2013-08-16 14:01:42',NULL),
	(150,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','sadf','',1376632903282.1,0,0,'2013-08-16 14:01:43',NULL),
	(151,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','\nsdf','',1376632903375,0,0,'2013-08-16 14:01:43',NULL),
	(152,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asd','',1376632903399.3,0,0,'2013-08-16 14:01:43',NULL),
	(153,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','fas','',1376632903460.4,0,0,'2013-08-16 14:01:43',NULL),
	(154,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632904351.6,0,0,'2013-08-16 14:01:44',NULL),
	(155,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asdf','',1376632904787.7,0,0,'2013-08-16 14:01:44',NULL),
	(156,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','s','',1376632905218.8,0,0,'2013-08-16 14:01:45',NULL),
	(157,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632905373,0,0,'2013-08-16 14:01:45',NULL),
	(158,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asdf','',1376632905478.7,0,0,'2013-08-16 14:01:45',NULL),
	(159,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','as','',1376632905648.8,0,0,'2013-08-16 14:01:45',NULL),
	(160,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632906499,0,0,'2013-08-16 14:01:46',NULL),
	(161,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asd','',1376632906716.7,0,0,'2013-08-16 14:01:46',NULL),
	(162,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','sdf','',1376632907537,0,0,'2013-08-16 14:01:47',NULL),
	(163,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','sad','',1376632907789.1,0,0,'2013-08-16 14:01:47',NULL),
	(164,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','f','',1376632907842.4,0,0,'2013-08-16 14:01:47',NULL),
	(165,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','fa','',1376632907983.8,0,0,'2013-08-16 14:01:47',NULL),
	(166,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asdf','',1376632908513.3,0,0,'2013-08-16 14:01:48',NULL),
	(167,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','as','',1376632908682,0,0,'2013-08-16 14:01:48',NULL),
	(168,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632910269,0,0,'2013-08-16 14:01:50',NULL),
	(169,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','sdf','',1376632910512.4,0,0,'2013-08-16 14:01:50',NULL),
	(170,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','fa','',1376632910873.6,0,0,'2013-08-16 14:01:50',NULL),
	(171,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asd','',1376632910933,0,0,'2013-08-16 14:01:50',NULL),
	(172,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','as','',1376632911003,0,0,'2013-08-16 14:01:51',NULL),
	(173,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632911400.2,0,0,'2013-08-16 14:01:51',NULL),
	(174,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asdf','',1376632912828.4,0,0,'2013-08-16 14:01:52',NULL),
	(175,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','as','',1376632912858.7,0,0,'2013-08-16 14:01:52',NULL),
	(176,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632912940.7,0,0,'2013-08-16 14:01:52',NULL),
	(177,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','f','',1376632913204.8,0,0,'2013-08-16 14:01:53',NULL),
	(178,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asdf','',1376632913212,0,0,'2013-08-16 14:01:53',NULL),
	(179,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asd','',1376632913259.2,0,0,'2013-08-16 14:01:53',NULL),
	(180,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','as','',1376632914488.4,0,0,'2013-08-16 14:01:54',NULL),
	(181,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','df','',1376632914492.9,0,0,'2013-08-16 14:01:54',NULL),
	(182,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','asd','',1376632914663.1,0,0,'2013-08-16 14:01:54',NULL),
	(183,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','f','',1376632915070.9,0,0,'2013-08-16 14:01:55',NULL),
	(184,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','。。。','',1376632924295.6,0,0,'2013-08-16 14:02:04',NULL),
	(185,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376632954936.5,0,0,'2013-08-16 14:02:35',NULL),
	(186,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376637512884.2,0,0,'2013-08-16 15:18:34',NULL),
	(187,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','ls','',1376637516029.3,0,0,'2013-08-16 15:18:36',NULL),
	(188,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','why ?','',1376637522743.2,0,0,'2013-08-16 15:18:42',NULL),
	(189,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','ls','',1376637524748.1,0,0,'2013-08-16 15:18:44',NULL),
	(190,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','\n\n\njis','',1376637526901.9,0,0,'2013-08-16 15:18:46',NULL),
	(191,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','\n\nls','',1376637527593.5,0,0,'2013-08-16 15:18:47',NULL),
	(192,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','\nljs','',1376637527656,0,0,'2013-08-16 15:18:47',NULL),
	(193,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376637602859.8,0,0,'2013-08-16 15:20:03',NULL),
	(194,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','是','',1376637609307.7,0,0,'2013-08-16 15:20:09',NULL),
	(195,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','为什么','',1376637615578,0,0,'2013-08-16 15:20:15',NULL),
	(196,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','会这样','',1376637617515.4,0,0,'2013-08-16 15:20:17',NULL),
	(197,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','可耻','',1376637621181.1,0,0,'2013-08-16 15:20:21',NULL),
	(198,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','非常可耻','',1376637625299.5,0,0,'2013-08-16 15:20:25',NULL),
	(199,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','不是嘛','',1376637630899.5,0,0,'2013-08-16 15:20:30',NULL),
	(200,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','...','',1376637634118.7,0,0,'2013-08-16 15:20:34',NULL),
	(201,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376637767942.7,0,0,'2013-08-16 15:22:49',NULL),
	(202,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','ls','',1376637780191.2,0,0,'2013-08-16 15:23:00',NULL),
	(203,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','旅行社','',1376637783615.3,0,0,'2013-08-16 15:23:03',NULL),
	(204,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376637905918.8,0,0,'2013-08-16 15:25:06',NULL),
	(205,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','great','',1376637914235.4,0,0,'2013-08-16 15:25:14',NULL),
	(206,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376638015593.8,0,0,'2013-08-16 15:26:56',NULL),
	(207,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','ls','',1376638020465.5,0,0,'2013-08-16 15:27:00',NULL),
	(208,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ls','',1376644452512.7,0,0,'2013-08-16 17:14:12',NULL),
	(209,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376644448672.4,0,0,'2013-08-16 17:14:13',NULL),
	(210,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376645731871.3,0,0,'2013-08-16 17:35:32',NULL),
	(211,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ls','',1376645747885.6,0,0,'2013-08-16 17:35:47',NULL),
	(212,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376648187302.9,0,0,'2013-08-16 18:16:28',NULL),
	(213,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','历史','',1376648194079,0,0,'2013-08-16 18:16:34',NULL),
	(214,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','你妹的','',1376648196812.5,0,0,'2013-08-16 18:16:36',NULL),
	(215,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','擦','',1376648200390.9,0,0,'2013-08-16 18:16:40',NULL),
	(216,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376648404281.5,0,0,'2013-08-16 18:20:04',NULL),
	(217,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','你好','',1376648419825.2,0,0,'2013-08-16 18:20:19',NULL),
	(218,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','这...','',1376648424172.3,0,0,'2013-08-16 18:20:24',NULL),
	(219,NULL,1,'520da20bc12be','erylee','unicast','erylee','李枫','520da20bc12be','guest9228','算了','',1376648434068.3,0,0,'2013-08-16 18:20:34',NULL),
	(220,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376648718027.4,0,0,'2013-08-16 18:25:18',NULL),
	(221,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','','erylee','李枫','你好','',1376648789479.6,0,0,'2013-08-16 18:26:29',NULL),
	(222,NULL,1,'520da20bc12be','erylee','unicast','520da20bc12be','guest9228','erylee','李枫','您好，我是李枫，欢迎来访','',1376648813610.3,0,0,'2013-08-16 18:26:53',NULL),
	(223,NULL,1,'520da20bc12be','erylee','unicast','erylee','李枫','520da20bc12be','guest9228','好吧','',1376648827103.7,0,0,'2013-08-16 18:27:07',NULL),
	(224,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376649149335.8,0,0,'2013-08-16 18:32:29',NULL),
	(225,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','历史','',1376649154780.6,0,0,'2013-08-16 18:32:34',NULL),
	(226,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376649752710.3,0,0,'2013-08-16 18:42:32',NULL),
	(227,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376649972040.1,0,0,'2013-08-16 18:46:12',NULL),
	(228,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376650064665.8,0,0,'2013-08-16 18:47:44',NULL),
	(229,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ls','',1376650069291.8,0,0,'2013-08-16 18:47:49',NULL),
	(230,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','你好','',1376650073928.5,0,0,'2013-08-16 18:47:53',NULL),
	(231,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376650111278.6,0,0,'2013-08-16 18:48:31',NULL),
	(232,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376650125166.8,0,0,'2013-08-16 18:48:45',NULL),
	(233,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376650166398.4,0,0,'2013-08-16 18:49:26',NULL),
	(234,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376650299238,0,0,'2013-08-16 18:51:39',NULL),
	(235,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376650365307.4,0,0,'2013-08-16 18:52:45',NULL),
	(236,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376650384986.4,0,0,'2013-08-16 18:53:05',NULL),
	(237,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','欧式','',1376650416138.1,0,0,'2013-08-16 18:53:36',NULL),
	(238,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376650491193.1,0,0,'2013-08-16 18:54:51',NULL),
	(239,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','你好','',1376650552589,0,0,'2013-08-16 18:55:52',NULL),
	(240,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376652510114,0,0,'2013-08-16 19:28:30',NULL),
	(241,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376652624376.3,0,0,'2013-08-16 19:30:24',NULL),
	(242,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ls','',1376663779984.2,0,0,'2013-08-16 22:36:19',NULL),
	(243,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','Great','',1376663827448.3,0,0,'2013-08-16 22:37:07',NULL),
	(244,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','guest5478','erylee','李枫','您好，我是李枫，欢迎来访','',1376663854755.3,0,0,'2013-08-16 22:37:35',NULL),
	(245,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','。。。','',1376663858714.1,0,0,'2013-08-16 22:37:38',NULL),
	(246,NULL,1,'520ce7d8246b2','erylee','unicast','erylee','李枫','520ce7d8246b2','guest5478','。。。','',1376663868230.7,0,0,'2013-08-16 22:37:48',NULL),
	(247,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','ls','',1376671478521.8,0,0,'2013-08-17 00:44:38',NULL),
	(248,NULL,1,'520ce7d8246b2','erylee','unicast','520ce7d8246b2','','erylee','李枫','job','',1376671504464.5,0,0,'2013-08-17 00:45:04',NULL),
	(249,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376675205107.1,0,0,'2013-08-17 01:46:47',NULL),
	(250,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','','erylee','李枫','历史','',1376675227610.8,0,0,'2013-08-17 01:47:07',NULL),
	(251,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376675313917.2,0,0,'2013-08-17 01:48:34',NULL),
	(252,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376707406593.4,0,0,'2013-08-17 10:43:26',NULL),
	(253,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376707498093.4,0,0,'2013-08-17 10:44:58',NULL),
	(254,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376707547719.2,0,0,'2013-08-17 10:45:47',NULL),
	(255,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376708108136.9,0,0,'2013-08-17 10:55:08',NULL),
	(256,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376708156561.3,0,0,'2013-08-17 10:55:57',NULL),
	(257,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376708263708,0,0,'2013-08-17 10:57:43',NULL),
	(258,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376708353771.1,0,0,'2013-08-17 10:59:14',NULL),
	(259,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','','erylee','李枫','ls','',1376708362654.3,0,0,'2013-08-17 10:59:22',NULL),
	(260,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','','erylee','李枫','历史','',1376708367816.6,0,0,'2013-08-17 10:59:27',NULL),
	(261,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','','erylee','李枫','你妹的','',1376708446511.6,0,0,'2013-08-17 11:00:46',NULL),
	(262,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376710700784.3,0,0,'2013-08-17 11:38:21',NULL),
	(263,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376711530858.5,0,0,'2013-08-17 11:52:11',NULL),
	(264,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376711923770.2,0,0,'2013-08-17 11:58:44',NULL),
	(265,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376711973111.7,0,0,'2013-08-17 11:59:33',NULL),
	(266,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376712523768.3,0,0,'2013-08-17 12:08:44',NULL),
	(267,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','','erylee','李枫','ls','',1376712529186.1,0,0,'2013-08-17 12:08:49',NULL),
	(268,NULL,1,'520efab313178','erylee','unicast','520efab313178','guest1941','erylee','李枫','您好，我是李枫，欢迎来访','',1376713400574.9,0,0,'2013-08-17 12:23:21',NULL),
	(269,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','正在: http://shopim.webim20.cn/','',1376713472537.9,0,0,'2013-08-17 12:24:32',NULL),
	(270,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','k','',1376713472589,0,0,'2013-08-17 12:24:32',NULL),
	(271,NULL,1,'520efab313178','erylee','unicast','520efab313178','guest1941','erylee','李枫','您好，我是李枫，欢迎来访','',1376713923073,0,0,'2013-08-17 12:32:03',NULL),
	(272,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','a','',1376713927979.2,0,0,'2013-08-17 12:32:07',NULL),
	(273,NULL,1,'520efab313178','erylee','unicast','520efab313178','','erylee','李枫','aha','',1376713937211.7,0,0,'2013-08-17 12:32:17',NULL),
	(274,NULL,1,'520efab313178','erylee','unicast','520efab313178','','erylee','李枫','haha','',1376713938685.6,0,0,'2013-08-17 12:32:18',NULL),
	(275,NULL,1,'520efab313178','erylee','unicast','520efab313178','','erylee','李枫','nice','',1376713939268.5,0,0,'2013-08-17 12:32:19',NULL),
	(276,NULL,1,'520efab313178','erylee','unicast','520efab313178','','erylee','李枫','aaa','',1376713966092.3,0,0,'2013-08-17 12:32:46',NULL),
	(277,NULL,1,'520efab313178','erylee','unicast','520efab313178','','erylee','李枫','ddd','',1376713966968.9,0,0,'2013-08-17 12:32:46',NULL),
	(278,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','a','',1376713980262.8,0,0,'2013-08-17 12:33:00',NULL),
	(279,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','ada','',1376713984582,0,0,'2013-08-17 12:33:04',NULL),
	(280,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','d','',1376713985078,0,0,'2013-08-17 12:33:05',NULL),
	(281,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','d','',1376713985332.3,0,0,'2013-08-17 12:33:05',NULL),
	(282,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','e','',1376713985512.9,0,0,'2013-08-17 12:33:05',NULL),
	(283,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','d','',1376713985775.2,0,0,'2013-08-17 12:33:05',NULL),
	(284,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','d','',1376713985888.3,0,0,'2013-08-17 12:33:05',NULL),
	(285,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','d','',1376713986073,0,0,'2013-08-17 12:33:06',NULL),
	(286,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','d','',1376713986328.6,0,0,'2013-08-17 12:33:06',NULL),
	(287,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','fff','',1376713987303.5,0,0,'2013-08-17 12:33:07',NULL),
	(288,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','f','',1376713987843.6,0,0,'2013-08-17 12:33:07',NULL),
	(289,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','f','',1376713988217.2,0,0,'2013-08-17 12:33:08',NULL),
	(290,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','f','',1376713988451.4,0,0,'2013-08-17 12:33:08',NULL),
	(291,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','d','',1376713988751.8,0,0,'2013-08-17 12:33:08',NULL),
	(292,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','g','',1376713990762.3,0,0,'2013-08-17 12:33:10',NULL),
	(293,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','a','',1376713991616.3,0,0,'2013-08-17 12:33:11',NULL),
	(294,NULL,1,'520efab313178','erylee','unicast','erylee','李枫','520efab313178','guest1941','d','',1376713991870.5,0,0,'2013-08-17 12:33:11',NULL),
	(295,NULL,1,'520efab313178','erylee','unicast','520efab313178','','erylee','李枫','a','',1376713997904.9,0,0,'2013-08-17 12:33:17',NULL),
	(296,NULL,1,'520efab313178','erylee','unicast','520efab313178','','erylee','李枫','aa','',1376713998681.3,0,0,'2013-08-17 12:33:18',NULL),
	(297,NULL,1,'520efab313178','erylee','unicast','520efab313178','','erylee','李枫','ckd','',1376713999432.2,0,0,'2013-08-17 12:33:19',NULL),
	(298,NULL,1,'520efab313178','erylee','unicast','520efab313178','','erylee','李枫',':)','',1376714001206.8,0,0,'2013-08-17 12:33:21',NULL),
	(299,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376715154389.8,0,0,'2013-08-17 12:52:34',NULL),
	(300,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376715375033.1,0,0,'2013-08-17 12:56:15',NULL),
	(301,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376715738019.4,0,0,'2013-08-17 13:02:19',NULL),
	(302,NULL,1,'520e57dc3519e','erylee','unicast','erylee','李枫','520e57dc3519e','guest3602','这','',1376715771583.8,0,0,'2013-08-17 13:02:51',NULL),
	(303,NULL,1,'520e57dc3519e','erylee','unicast','erylee','李枫','520e57dc3519e','guest3602','怎么了','',1376715785160,0,0,'2013-08-17 13:03:05',NULL),
	(304,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376715804589.5,0,0,'2013-08-17 13:03:24',NULL),
	(305,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376715873195.4,0,0,'2013-08-17 13:04:34',NULL),
	(306,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376715969667.5,0,0,'2013-08-17 13:06:10',NULL),
	(307,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376716041818.8,0,0,'2013-08-17 13:07:22',NULL),
	(308,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376716122419,0,0,'2013-08-17 13:08:42',NULL),
	(309,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376716231761.8,0,0,'2013-08-17 13:10:32',NULL),
	(310,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376716343151.5,0,0,'2013-08-17 13:12:23',NULL),
	(311,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376719983403.2,0,0,'2013-08-17 14:13:04',NULL),
	(312,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376743786194.9,0,0,'2013-08-17 20:49:46',NULL),
	(313,NULL,1,'520e57dc3519e','erylee','unicast','erylee','李枫','520e57dc3519e','guest3602','你好','',1376743788509.9,0,0,'2013-08-17 20:49:48',NULL),
	(314,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','','erylee','李枫','你也好啊','',1376743804101.3,0,0,'2013-08-17 20:50:04',NULL),
	(315,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','guest3602','erylee','李枫','您好，我是李枫，欢迎来访','',1376746181933.6,0,0,'2013-08-17 21:29:42',NULL),
	(316,NULL,1,'520f7cae8539e','erylee','unicast','520f7cae8539e','guest7987','erylee','李枫','您好，我是李枫，欢迎来访','',1376746675664.4,0,0,'2013-08-17 21:37:56',NULL),
	(317,NULL,1,'520f7cae8539e','erylee','unicast','erylee','李枫','520f7cae8539e','guest7987','正在: http://shopim.webim20.cn/','',1376746679244.2,0,0,'2013-08-17 21:37:59',NULL),
	(318,NULL,1,'520f7cae8539e','erylee','unicast','erylee','李枫','520f7cae8539e','guest7987','hi','',1376746679271.3,0,0,'2013-08-17 21:37:59',NULL),
	(319,NULL,1,'520f7cae8539e','erylee','unicast','erylee','李枫','520f7cae8539e','guest7987','a','',1376746681695.3,0,0,'2013-08-17 21:38:01',NULL),
	(320,NULL,1,'520f7cae8539e','erylee','unicast','erylee','李枫','520f7cae8539e','guest7987',':)','',1376746687825.8,0,0,'2013-08-17 21:38:07',NULL),
	(321,NULL,1,'520f7cae8539e','erylee','unicast','520f7cae8539e','','erylee','李枫','呵呵','',1376746830419.7,0,0,'2013-08-17 21:40:30',NULL),
	(322,NULL,1,'520e57dc3519e','erylee','unicast','520e57dc3519e','','erylee','李枫','呵呵','',1376746846355.1,0,0,'2013-08-17 21:40:46',NULL),
	(323,NULL,1,'5211049382bac','admin','unicast','5211049382bac','guest4771','admin','管理员','您好，我是管理员，欢迎来访','',1376847063126.1,0,0,'2013-08-19 01:31:03',NULL),
	(324,NULL,1,'5211049382bac','admin','unicast','admin','管理员','5211049382bac','guest4771','hi','',1376847070197.2,0,0,'2013-08-19 01:31:10',NULL),
	(325,NULL,1,'5211049382bac','admin','unicast','5211049382bac','guest4771','admin','管理员','hi','',1376847082383.2,0,0,'2013-08-19 01:31:22',NULL),
	(326,NULL,1,'5211049382bac','admin','unicast','5211049382bac','guest4771','admin','管理员','ok me','',1376847091408.3,0,0,'2013-08-19 01:31:31',NULL),
	(327,NULL,1,'5211049382bac','admin','unicast','5211049382bac','guest4771','admin','管理员','de','',1376847106752.7,0,0,'2013-08-19 01:31:46',NULL),
	(328,NULL,1,'5211049382bac','admin','unicast','5211049382bac','guest4771','admin','管理员','您好，我是管理员，欢迎来访','',1376847139076.8,0,0,'2013-08-19 01:32:20',NULL),
	(329,NULL,1,'5211049382bac','admin','unicast','5211049382bac','guest4771','admin','管理员','您好，我是管理员，欢迎来访','',1376847184639.9,0,0,'2013-08-19 01:33:04',NULL),
	(330,NULL,1,'5211049382bac','admin','unicast','5211049382bac','guest4771','admin','管理员','您好，我是管理员，欢迎来访','',1376847241427.9,0,0,'2013-08-19 01:34:01',NULL),
	(331,NULL,1,'5211049382bac','admin','unicast','5211049382bac','guest4771','admin','管理员','您好，我是管理员，欢迎来访','',1376847261556.9,0,0,'2013-08-19 01:34:22',NULL),
	(332,NULL,1,'5211049382bac','admin','unicast','5211049382bac','guest4771','admin','管理员','您好，我是管理员，欢迎来访','',1376847282426.5,0,0,'2013-08-19 01:34:42',NULL),
	(333,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','您好，我是李枫，欢迎来访','',1376851015897.9,0,0,'2013-08-19 02:36:56',NULL),
	(334,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','','erylee','李枫','你也好','',1376851045675.4,0,0,'2013-08-19 02:37:25',NULL),
	(335,NULL,1,'521114454d46b','erylee','unicast','erylee','李枫','521114454d46b','guest6660','好吧','',1376851048918.2,0,0,'2013-08-19 02:37:28',NULL),
	(336,NULL,1,'52117c5bc3366','erylee','unicast','erylee','李枫','52117c5bc3366','guest6326','hi','',1376879144056.3,0,0,'2013-08-19 10:25:44',NULL),
	(337,NULL,1,'52117c5bc3366','erylee','unicast','erylee','李枫','52117c5bc3366','guest6326','hi','',1376879147357.8,0,0,'2013-08-19 10:25:47',NULL),
	(338,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','您好，我是李枫，欢迎来访','',1376900990673.8,0,0,'2013-08-19 16:29:51',NULL),
	(339,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','','erylee','李枫','你也好阿','',1376900997598.6,0,0,'2013-08-19 16:29:57',NULL),
	(340,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','','erylee','李枫','尼码','',1376900999284.3,0,0,'2013-08-19 16:29:59',NULL),
	(341,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','','erylee','李枫','擦','',1376901000089,0,0,'2013-08-19 16:30:00',NULL),
	(342,NULL,1,'521114454d46b','erylee','unicast','erylee','李枫','521114454d46b','guest6660','擦了个擦','',1376901003806,0,0,'2013-08-19 16:30:03',NULL),
	(343,NULL,1,'521114454d46b','erylee','unicast','erylee','李枫','521114454d46b','guest6660','。。。','',1376901004970.5,0,0,'2013-08-19 16:30:04',NULL),
	(344,NULL,1,'5211e44cd06a0','erylee','unicast','5211e44cd06a0','guest7749','erylee','李枫','您好，我是李枫，欢迎来访','',1376904278831.6,0,0,'2013-08-19 17:24:39',NULL),
	(345,NULL,1,'5211e44cd06a0','erylee','unicast','erylee','李枫','5211e44cd06a0','guest7749','正在: http://shopim.webim20.cn/','',1376904281179.2,0,0,'2013-08-19 17:24:41',NULL),
	(346,NULL,1,'5211e44cd06a0','erylee','unicast','erylee','李枫','5211e44cd06a0','guest7749','hi','',1376904281256.3,0,0,'2013-08-19 17:24:41',NULL),
	(347,NULL,1,'5211e4c460a19','erylee','unicast','5211e4c460a19','guest3659','erylee','李枫','您好，我是李枫，欢迎来访','',1376904394853.7,0,0,'2013-08-19 17:26:35',NULL),
	(348,NULL,1,'5211e4c460a19','erylee','unicast','erylee','李枫','5211e4c460a19','guest3659','正在: http://shopim.webim20.cn/','',1376904397628.8,0,0,'2013-08-19 17:26:37',NULL),
	(349,NULL,1,'5211e4c460a19','erylee','unicast','erylee','李枫','5211e4c460a19','guest3659','haha','',1376904397635.9,0,0,'2013-08-19 17:26:37',NULL),
	(350,NULL,1,'5211e4c460a19','erylee','unicast','5211e4c460a19','guest3659','erylee','李枫','ni','',1376904403559.8,0,0,'2013-08-19 17:26:43',NULL),
	(351,NULL,1,'5211e44cd06a0','erylee','unicast','erylee','李枫','5211e44cd06a0','guest7749','hi','',1376904567761.9,0,0,'2013-08-19 17:29:27',NULL),
	(352,NULL,1,'5211e44cd06a0','erylee','unicast','erylee','李枫','5211e44cd06a0','guest7749','hih','',1376904569386.4,0,0,'2013-08-19 17:29:29',NULL),
	(353,NULL,1,'5211e44cd06a0','erylee','unicast','erylee','李枫','5211e44cd06a0','guest7749','hi','',1376904644336,0,0,'2013-08-19 17:30:44',NULL),
	(354,NULL,1,'5211e44cd06a0','erylee','unicast','erylee','李枫','5211e44cd06a0','guest7749','hh','',1376904645194.5,0,0,'2013-08-19 17:30:45',NULL),
	(355,NULL,1,'5211e44cd06a0','erylee','unicast','erylee','李枫','5211e44cd06a0','guest7749','h','',1376904645951,0,0,'2013-08-19 17:30:45',NULL),
	(356,NULL,1,'5211e44cd06a0','erylee','unicast','erylee','李枫','5211e44cd06a0','guest7749','h','',1376904647124.5,0,0,'2013-08-19 17:30:47',NULL),
	(357,NULL,1,'521114454d46b','erylee','unicast','erylee','李枫','521114454d46b','guest6660','两三','',1376904995940,0,0,'2013-08-19 17:36:35',NULL),
	(358,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','?','',1376905699303.7,0,0,'2013-08-19 17:48:19',NULL),
	(359,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','x','',1376905703661.1,0,0,'2013-08-19 17:48:23',NULL),
	(360,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','who  a u','',1376905708229.7,0,0,'2013-08-19 17:48:28',NULL),
	(361,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','你好欢迎客服系统！','',1376905718828.7,0,0,'2013-08-19 17:48:38',NULL),
	(362,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','guest4084','erylee','李枫','您好，我是李枫，欢迎来访','',1376915265778.6,0,0,'2013-08-19 20:27:46',NULL),
	(363,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','wo le ge qu','',1376915280452.8,0,0,'2013-08-19 20:28:00',NULL),
	(364,NULL,1,'52120f289edc2','erylee','unicast','erylee','李枫','52120f289edc2','guest4084','so?','',1376915283627.3,0,0,'2013-08-19 20:28:03',NULL),
	(365,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','nothing','',1376915292091.3,0,0,'2013-08-19 20:28:12',NULL),
	(366,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','ls','',1376915299815.7,0,0,'2013-08-19 20:28:19',NULL),
	(367,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','ls','',1376915300335.2,0,0,'2013-08-19 20:28:20',NULL),
	(368,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','ls','',1376915301200.1,0,0,'2013-08-19 20:28:21',NULL),
	(369,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','ls','',1376915301399.8,0,0,'2013-08-19 20:28:21',NULL),
	(370,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','ls','',1376915301710,0,0,'2013-08-19 20:28:21',NULL),
	(371,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','ls','',1376915302184.7,0,0,'2013-08-19 20:28:22',NULL),
	(372,NULL,1,'52120f289edc2','erylee','unicast','erylee','李枫','52120f289edc2','guest4084','do ','',1376915305235,0,0,'2013-08-19 20:28:25',NULL),
	(373,NULL,1,'52120f289edc2','erylee','unicast','erylee','李枫','52120f289edc2','guest4084','it ','',1376915305984.7,0,0,'2013-08-19 20:28:25',NULL),
	(374,NULL,1,'52120f289edc2','erylee','unicast','erylee','李枫','52120f289edc2','guest4084','do ','',1376915307004.3,0,0,'2013-08-19 20:28:27',NULL),
	(375,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','guest4084','erylee','李枫','您好，我是李枫，欢迎来访','',1376916762660.4,0,0,'2013-08-19 20:52:43',NULL),
	(376,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','well','',1376916777755.8,0,0,'2013-08-19 20:52:57',NULL),
	(377,NULL,1,'52120f289edc2','erylee','unicast','erylee','李枫','52120f289edc2','guest4084','nihao','',1376916783870.6,0,0,'2013-08-19 20:53:03',NULL),
	(378,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','guest4084','erylee','李枫','您好，我是李枫，欢迎来访','',1376917661003.7,0,0,'2013-08-19 21:07:41',NULL),
	(379,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','guest4084','erylee','李枫','您好，我是李枫，欢迎来访','',1376917830001.3,0,0,'2013-08-19 21:10:30',NULL),
	(380,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','ni','',1376917838003.5,0,0,'2013-08-19 21:10:38',NULL),
	(381,NULL,1,'52120f289edc2','erylee','unicast','52120f289edc2','','erylee','李枫','牛黄','',1376917843500.9,0,0,'2013-08-19 21:10:43',NULL),
	(382,NULL,1,'52120f289edc2','erylee','unicast','erylee','李枫','52120f289edc2','guest4084','..','',1376917847332,0,0,'2013-08-19 21:10:47',NULL),
	(383,NULL,1,'5211e44cd06a0','erylee','unicast','erylee','李枫','5211e44cd06a0','guest7749','a','',1376918310615.4,0,0,'2013-08-19 21:18:30',NULL),
	(384,NULL,1,'5211e44cd06a0','erylee','unicast','5211e44cd06a0','guest7749','erylee','李枫','j','',1376918322560.7,0,0,'2013-08-19 21:18:42',NULL),
	(385,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','您好，我是李枫，欢迎来访','',1376927005879.4,0,0,'2013-08-19 23:43:26',NULL),
	(386,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','您好，我是李枫，欢迎来访','',1376927147762.7,0,0,'2013-08-19 23:45:47',NULL),
	(387,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','您好，我是李枫，欢迎来访','',1376927539199.7,0,0,'2013-08-19 23:52:19',NULL),
	(388,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','guest6660','erylee','李枫','您好，我是李枫，欢迎来访','',1376927955724.3,0,0,'2013-08-19 23:59:16',NULL),
	(389,NULL,1,'521114454d46b','erylee','unicast','521114454d46b','','erylee','李枫','hello','',1376927961723.7,0,0,'2013-08-19 23:59:21',NULL),
	(390,NULL,1,'521114454d46b','erylee','unicast','erylee','李枫','521114454d46b','guest6660','你好','',1376927965126,0,0,'2013-08-19 23:59:25',NULL),
	(391,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376967944140.2,0,0,'2013-08-20 11:05:44',NULL),
	(392,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','你好','',1376967954241.7,0,0,'2013-08-20 11:05:54',NULL),
	(393,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376967984872.9,0,0,'2013-08-20 11:06:25',NULL),
	(394,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376967989240.1,0,0,'2013-08-20 11:06:29',NULL),
	(395,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968054466.1,0,0,'2013-08-20 11:07:34',NULL),
	(396,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968250632.5,0,0,'2013-08-20 11:10:50',NULL),
	(397,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968372233.9,0,0,'2013-08-20 11:12:52',NULL),
	(398,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968603485.7,0,0,'2013-08-20 11:16:43',NULL),
	(399,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968744039.9,0,0,'2013-08-20 11:19:04',NULL),
	(400,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968793410.4,0,0,'2013-08-20 11:19:53',NULL),
	(401,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968870457.6,0,0,'2013-08-20 11:21:10',NULL),
	(402,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968905517.4,0,0,'2013-08-20 11:21:45',NULL),
	(403,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968941578.3,0,0,'2013-08-20 11:22:21',NULL),
	(404,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376968962961.8,0,0,'2013-08-20 11:22:43',NULL),
	(405,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969252503.7,0,0,'2013-08-20 11:27:33',NULL),
	(406,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969345795.7,0,0,'2013-08-20 11:29:05',NULL),
	(407,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969406392.3,0,0,'2013-08-20 11:30:06',NULL),
	(408,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969483775.3,0,0,'2013-08-20 11:31:24',NULL),
	(409,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969487643.6,0,0,'2013-08-20 11:31:27',NULL),
	(410,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969526056.8,0,0,'2013-08-20 11:32:06',NULL),
	(411,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969620287,0,0,'2013-08-20 11:33:40',NULL),
	(412,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969662160.5,0,0,'2013-08-20 11:34:22',NULL),
	(413,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969705293.4,0,0,'2013-08-20 11:35:05',NULL),
	(414,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','ls','',1376969727392,0,0,'2013-08-20 11:35:27',NULL),
	(415,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','你好','',1376969730864.6,0,0,'2013-08-20 11:35:30',NULL),
	(416,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','阿','',1376969732614.3,0,0,'2013-08-20 11:35:32',NULL),
	(417,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','a','',1376969734382.7,0,0,'2013-08-20 11:35:34',NULL),
	(418,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','a','',1376969735436,0,0,'2013-08-20 11:35:35',NULL),
	(419,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','Great','',1376969751941.1,0,0,'2013-08-20 11:35:51',NULL),
	(420,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','ll','',1376969763464.8,0,0,'2013-08-20 11:36:03',NULL),
	(421,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969824333.4,0,0,'2013-08-20 11:37:04',NULL),
	(422,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969879417.3,0,0,'2013-08-20 11:38:00',NULL),
	(423,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','来说','',1376969890619.5,0,0,'2013-08-20 11:38:10',NULL),
	(424,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','这....','',1376969893323.3,0,0,'2013-08-20 11:38:13',NULL),
	(425,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','是为什么','',1376969896289.5,0,0,'2013-08-20 11:38:16',NULL),
	(426,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969919760.1,0,0,'2013-08-20 11:38:40',NULL),
	(427,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376969970420.6,0,0,'2013-08-20 11:39:30',NULL),
	(428,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','你好','',1376969996559.9,0,0,'2013-08-20 11:39:56',NULL),
	(429,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','为什么','',1376970000324.3,0,0,'2013-08-20 11:40:00',NULL),
	(430,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','是这样的','',1376970004414.2,0,0,'2013-08-20 11:40:04',NULL),
	(431,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','The following is a list of colors. A number of the color swatches below are taken from domain-specific naming schemes such as X11 or HTML4. RGB values are given for each swatch because such standards are defined in terms of the sRGB color space. It is not possible to accurately convert many of these swatches to CMYK values because of the differing gamuts of the two spaces, but the color management systems built into operating systems and image editing software attempt such conversions as accurately as possible.','',1376970014316.4,0,0,'2013-08-20 11:40:14',NULL),
	(432,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','The following is a list of colors. A number of the color swatches below are taken from domain-specific naming schemes such as X11 or HTML4. RGB values are given for each swatch because such standards are defined in terms of the sRGB color space. It is not possible to accurately convert many of these swatches to CMYK values because of the differing gamuts of the two spaces, but the color management systems built into operating systems and image editing software attempt such conversions as accurately as possible.','',1376970042136.8,0,0,'2013-08-20 11:40:42',NULL),
	(433,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376970068668.3,0,0,'2013-08-20 11:41:08',NULL),
	(434,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','非常欢迎','',1376970082904.2,0,0,'2013-08-20 11:41:22',NULL),
	(435,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','哈哈','',1376970086172.9,0,0,'2013-08-20 11:41:26',NULL),
	(436,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','你好','',1376970087672,0,0,'2013-08-20 11:41:27',NULL),
	(437,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','了阿','',1376970089037.1,0,0,'2013-08-20 11:41:29',NULL),
	(438,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','啊啊啊啊','',1376970090819.6,0,0,'2013-08-20 11:41:30',NULL),
	(439,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','为什么嗯','',1376970093670.8,0,0,'2013-08-20 11:41:33',NULL),
	(440,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','不要这样吧','',1376970097592.4,0,0,'2013-08-20 11:41:37',NULL),
	(441,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','这是要闹那样','',1376970104184.3,0,0,'2013-08-20 11:41:44',NULL),
	(442,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376970136268.6,0,0,'2013-08-20 11:42:16',NULL),
	(443,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376970189738.1,0,0,'2013-08-20 11:43:10',NULL),
	(444,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','无所谓了','',1376970225248.1,0,0,'2013-08-20 11:43:45',NULL),
	(445,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','为什么','',1376970228762.3,0,0,'2013-08-20 11:43:48',NULL),
	(446,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','怎么会这样呢','',1376970234582.8,0,0,'2013-08-20 11:43:54',NULL),
	(447,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','好吧','',1376970243041.3,0,0,'2013-08-20 11:44:03',NULL),
	(448,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','既然这样','',1376970248230.2,0,0,'2013-08-20 11:44:08',NULL),
	(449,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','你就别想回去了','',1376970251782.8,0,0,'2013-08-20 11:44:11',NULL),
	(450,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','我了个擦','',1376970255264.7,0,0,'2013-08-20 11:44:15',NULL),
	(451,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','guest5104','erylee','李枫','您好，我是李枫，欢迎来访','',1376970524598,0,0,'2013-08-20 11:48:44',NULL),
	(452,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','好吧','',1376970536221,0,0,'2013-08-20 11:48:56',NULL),
	(453,NULL,1,'5212dd0400242','erylee','unicast','5212dd0400242','','erylee','李枫','你好阿','',1376970537958,0,0,'2013-08-20 11:48:57',NULL),
	(454,NULL,1,'5212dd0400242','erylee','unicast','erylee','李枫','5212dd0400242','guest5104','你也好','',1376970541264.8,0,0,'2013-08-20 11:49:01',NULL),
	(455,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376979426936,0,0,'2013-08-20 14:17:07',NULL),
	(456,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','你好阿','',1376979437336.8,0,0,'2013-08-20 14:17:17',NULL),
	(457,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','怎么了','',1376979443900.8,0,0,'2013-08-20 14:17:23',NULL),
	(458,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','为什么会这样','',1376979455819.8,0,0,'2013-08-20 14:17:35',NULL),
	(459,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','这究竟是为什么','',1376979459372.8,0,0,'2013-08-20 14:17:39',NULL),
	(460,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','。。。','',1376979460891.6,0,0,'2013-08-20 14:17:40',NULL),
	(461,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','即','',1376979462334.9,0,0,'2013-08-20 14:17:42',NULL),
	(462,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','贱人','',1376979464860.5,0,0,'2013-08-20 14:17:44',NULL),
	(463,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','擦。。。。','',1376979467771.8,0,0,'2013-08-20 14:17:47',NULL),
	(464,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','你妹的','',1376979469679.1,0,0,'2013-08-20 14:17:49',NULL),
	(465,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','为什么','',1376979472373.4,0,0,'2013-08-20 14:17:52',NULL),
	(466,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','为什么会这样','',1376979475551.7,0,0,'2013-08-20 14:17:55',NULL),
	(467,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','。。。。。','',1376979486970.5,0,0,'2013-08-20 14:18:06',NULL),
	(468,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','。。。。','',1376979489891.5,0,0,'2013-08-20 14:18:09',NULL),
	(469,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','。。。。。','',1376979493874.1,0,0,'2013-08-20 14:18:13',NULL),
	(470,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','。。。','',1376979496288.8,0,0,'2013-08-20 14:18:16',NULL),
	(471,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','。。。。。','',1376979499579,0,0,'2013-08-20 14:18:19',NULL),
	(472,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','。。。。。。。。','',1376979502838.3,0,0,'2013-08-20 14:18:22',NULL),
	(473,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','。。。。。。。。。。','',1376979505535.8,0,0,'2013-08-20 14:18:25',NULL),
	(474,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','渐渐的','',1376979549756.1,0,0,'2013-08-20 14:19:09',NULL),
	(475,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','渐渐的','',1376979786762.4,0,0,'2013-08-20 14:23:06',NULL),
	(476,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','','erylee','李枫','你妹的','',1376979852861.4,0,0,'2013-08-20 14:24:12',NULL),
	(477,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','','erylee','李枫','这也行','',1376979860464.6,0,0,'2013-08-20 14:24:20',NULL),
	(478,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','为什么不行','',1376979868904.2,0,0,'2013-08-20 14:24:28',NULL),
	(479,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','当然行','',1376979887368.7,0,0,'2013-08-20 14:24:47',NULL),
	(480,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','。。。','',1376979900161.7,0,0,'2013-08-20 14:25:00',NULL),
	(481,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376980775731.9,0,0,'2013-08-20 14:39:38',NULL),
	(482,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376980826301.4,0,0,'2013-08-20 14:40:28',NULL),
	(483,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376983292602.8,0,0,'2013-08-20 15:21:32',NULL),
	(484,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376983354416.4,0,0,'2013-08-20 15:22:37',NULL),
	(485,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376983449531.3,0,0,'2013-08-20 15:24:09',NULL),
	(486,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376983543525.3,0,0,'2013-08-20 15:25:44',NULL),
	(487,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376983855644.5,0,0,'2013-08-20 15:30:55',NULL),
	(488,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376983922589.8,0,0,'2013-08-20 15:32:02',NULL),
	(489,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376984143561.6,0,0,'2013-08-20 15:35:44',NULL),
	(490,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376984211869.9,0,0,'2013-08-20 15:36:53',NULL),
	(491,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376984541830,0,0,'2013-08-20 15:42:22',NULL),
	(492,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376984652035.8,0,0,'2013-08-20 15:44:12',NULL),
	(493,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','','erylee','李枫','这究竟是为什么','',1376984666624.9,0,0,'2013-08-20 15:44:26',NULL),
	(494,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376984721571.5,0,0,'2013-08-20 15:45:22',NULL),
	(495,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376984792174.8,0,0,'2013-08-20 15:46:32',NULL),
	(496,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376984886864.7,0,0,'2013-08-20 15:48:07',NULL),
	(497,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376984991611.5,0,0,'2013-08-20 15:49:51',NULL),
	(498,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376985060877.7,0,0,'2013-08-20 15:51:01',NULL),
	(499,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376985209430,0,0,'2013-08-20 15:53:29',NULL),
	(500,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376985252707.1,0,0,'2013-08-20 15:54:12',NULL),
	(501,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376985553810.6,0,0,'2013-08-20 15:59:15',NULL),
	(502,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376986525514.9,0,0,'2013-08-20 16:15:26',NULL),
	(503,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376986631821.3,0,0,'2013-08-20 16:17:12',NULL),
	(504,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376986737399.4,0,0,'2013-08-20 16:18:58',NULL),
	(505,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376986836247.8,0,0,'2013-08-20 16:20:36',NULL),
	(506,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','','erylee','李枫','def upload():\n    from myway.gallery.forms import ImageForm\n    form = ImageForm()\n\n    if form.validate_on_submit():\n        image = Image()\n        image.save(form.image.data, form.tag.data, form.title.data, form.is_public.data)这里我直接可以把form传给save函数么？form里面参数太多了，如果分开来写的话，save就得加很多参数','',1376986911145.8,0,0,'2013-08-20 16:21:51',NULL),
	(507,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376986953751.4,0,0,'2013-08-20 16:22:33',NULL),
	(508,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','def upload():\n    from myway.gallery.forms import ImageForm\n    form = ImageForm()\n\n    if form.validate_on_submit():\n        image = Image()\n        image.save(form.image.data, form.tag.data, form.title.data, form.is_public.data)这里我直接可以把form传给save函数么？form里面参数太多了，如果分开来写的话，save就得加很多参数','',1376987022741.1,0,0,'2013-08-20 16:23:42',NULL),
	(509,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376987100315.7,0,0,'2013-08-20 16:25:00',NULL),
	(510,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376987200044.9,0,0,'2013-08-20 16:26:40',NULL),
	(511,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376987327185.2,0,0,'2013-08-20 16:28:47',NULL),
	(512,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376987398940.5,0,0,'2013-08-20 16:30:00',NULL),
	(513,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376987447386.7,0,0,'2013-08-20 16:30:48',NULL),
	(514,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376987807823,0,0,'2013-08-20 16:36:48',NULL),
	(515,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376988640497.6,0,0,'2013-08-20 16:50:40',NULL),
	(516,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376993078869.7,0,0,'2013-08-20 18:04:39',NULL),
	(517,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376997872068.5,0,0,'2013-08-20 19:24:32',NULL),
	(518,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','来说','',1376998064184.6,0,0,'2013-08-20 19:27:44',NULL),
	(519,NULL,1,'5212fbfc88728','erylee','unicast','erylee','李枫','5212fbfc88728','guest8955','说来','',1376998096176.5,0,0,'2013-08-20 19:28:16',NULL),
	(520,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376998576267.7,0,0,'2013-08-20 19:36:16',NULL),
	(521,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376998697594.3,0,0,'2013-08-20 19:38:17',NULL),
	(522,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1376998737446.1,0,0,'2013-08-20 19:38:58',NULL),
	(523,NULL,1,'52136773d88db','erylee','unicast','52136773d88db','guest8209','erylee','李枫','您好，我是李枫，欢迎来访','',1377003382951.8,0,0,'2013-08-20 20:56:23',NULL),
	(524,NULL,1,'52136773d88db','erylee','unicast','52136773d88db','guest8209','erylee','李枫','您好，我是李枫，欢迎来访','',1377003430022.2,0,0,'2013-08-20 20:57:10',NULL),
	(525,NULL,1,'5211e4c460a19','erylee','unicast','5211e4c460a19','guest3659','erylee','李枫','hi','',1377003583781.9,0,0,'2013-08-20 20:59:43',NULL),
	(526,NULL,1,'52136773d88db','erylee','unicast','52136773d88db','guest8209','erylee','李枫','您好，我是李枫，欢迎来访','',1377003622220,0,0,'2013-08-20 21:00:23',NULL),
	(527,NULL,1,'52136773d88db','erylee','unicast','52136773d88db','guest8209','erylee','李枫','您好，我是李枫，欢迎来访','',1377003686951.1,0,0,'2013-08-20 21:01:27',NULL),
	(528,NULL,1,'52136898101fa','erylee','unicast','52136898101fa','guest1402','erylee','李枫','您好，我是李枫，欢迎来访','',1377003755811.8,0,0,'2013-08-20 21:02:36',NULL),
	(529,NULL,1,'52136773d88db','erylee','unicast','52136773d88db','guest8209','erylee','李枫','您好，我是李枫，欢迎来访','',1377003922903.4,0,0,'2013-08-20 21:05:24',NULL),
	(530,NULL,1,'52136773d88db','erylee','unicast','erylee','李枫','52136773d88db','guest8209','正在: http://shopim.webim20.cn/','',1377003935684.6,0,0,'2013-08-20 21:05:35',NULL),
	(531,NULL,1,'52136773d88db','erylee','unicast','erylee','李枫','52136773d88db','guest8209','哈哈','',1377003935709.1,0,0,'2013-08-20 21:05:35',NULL),
	(532,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377004029405.4,0,0,'2013-08-20 21:07:09',NULL),
	(533,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','jo','',1377004085432.6,0,0,'2013-08-20 21:08:05',NULL),
	(534,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','lkk','',1377004087173.9,0,0,'2013-08-20 21:08:07',NULL),
	(535,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','你非常好','',1377009904762.4,0,0,'2013-08-20 22:45:04',NULL),
	(536,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','哈哈','',1377009906426.8,0,0,'2013-08-20 22:45:06',NULL),
	(537,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377018396260.4,0,0,'2013-08-21 01:06:36',NULL),
	(538,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377018499191.4,0,0,'2013-08-21 01:08:19',NULL),
	(539,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377018553014,0,0,'2013-08-21 01:09:13',NULL),
	(540,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377018830780.3,0,0,'2013-08-21 01:13:50',NULL),
	(541,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377018949505.7,0,0,'2013-08-21 01:15:49',NULL),
	(542,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377019763369.3,0,0,'2013-08-21 01:29:23',NULL),
	(543,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377019817678.4,0,0,'2013-08-21 01:30:17',NULL),
	(544,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377019872226.3,0,0,'2013-08-21 01:31:12',NULL),
	(545,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377019930167.9,0,0,'2013-08-21 01:32:10',NULL),
	(546,NULL,1,'5212fbfc88728','erylee','unicast','5212fbfc88728','guest8955','erylee','李枫','您好，我是李枫，欢迎来访','',1377020487375.4,0,0,'2013-08-21 01:41:27',NULL),
	(547,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377063749515.9,0,0,'2013-08-21 13:42:29',NULL),
	(548,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377063797413.7,0,0,'2013-08-21 13:43:17',NULL),
	(549,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377063803211.5,0,0,'2013-08-21 13:43:23',NULL),
	(550,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377063841343.4,0,0,'2013-08-21 13:44:01',NULL),
	(551,NULL,1,'5214533ac8721','erylee','unicast','erylee','李枫','5214533ac8721','v9087467','Hi,\nThat’s not so hard to implement it. Write your own custom context menu (an item with some buttons put them in column and also you can implement mouse hover for buttons) then in mouse area of qml, implement right and left click to show your desired context menu.','',1377063881498.8,0,0,'2013-08-21 13:44:41',NULL),
	(552,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','','erylee','李枫','Hi,\nThat’s not so hard to implement it. Write your own custom context menu (an item with some buttons put them in column and also you can implement mouse hover for buttons) then in mouse area of qml, implement right and left click to show your desired context menu.','',1377063883788.5,0,0,'2013-08-21 13:44:43',NULL),
	(553,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377063985255.4,0,0,'2013-08-21 13:46:25',NULL),
	(554,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377064212311.8,0,0,'2013-08-21 13:50:12',NULL),
	(555,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377064260041.5,0,0,'2013-08-21 13:51:00',NULL),
	(556,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377064443278.6,0,0,'2013-08-21 13:54:03',NULL),
	(557,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377064525924,0,0,'2013-08-21 13:55:26',NULL),
	(558,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377064580228.9,0,0,'2013-08-21 13:56:20',NULL),
	(559,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377064922067.6,0,0,'2013-08-21 14:02:03',NULL),
	(560,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377065104982.6,0,0,'2013-08-21 14:05:05',NULL),
	(561,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377065183577.7,0,0,'2013-08-21 14:06:24',NULL),
	(562,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377065246530.5,0,0,'2013-08-21 14:07:27',NULL),
	(563,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377069000279.9,0,0,'2013-08-21 15:10:01',NULL),
	(564,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377069163227.6,0,0,'2013-08-21 15:12:43',NULL),
	(565,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377069216886.3,0,0,'2013-08-21 15:13:38',NULL),
	(566,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377069985932.5,0,0,'2013-08-21 15:26:26',NULL),
	(567,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377070125391.7,0,0,'2013-08-21 15:28:45',NULL),
	(568,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377070524412.3,0,0,'2013-08-21 15:35:25',NULL),
	(569,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377070586038,0,0,'2013-08-21 15:36:28',NULL),
	(570,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377070677337.5,0,0,'2013-08-21 15:37:58',NULL),
	(571,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377070917296.2,0,0,'2013-08-21 15:41:57',NULL),
	(572,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377071038824.5,0,0,'2013-08-21 15:43:59',NULL),
	(573,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377071089786.9,0,0,'2013-08-21 15:44:50',NULL),
	(574,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377071199412.6,0,0,'2013-08-21 15:46:39',NULL),
	(575,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377071352152.4,0,0,'2013-08-21 15:49:12',NULL),
	(576,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377071437825.1,0,0,'2013-08-21 15:50:38',NULL),
	(577,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377071835553.8,0,0,'2013-08-21 15:57:18',NULL),
	(578,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377071998567.3,0,0,'2013-08-21 16:00:00',NULL),
	(579,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377072221119.5,0,0,'2013-08-21 16:03:43',NULL),
	(580,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377072306980,0,0,'2013-08-21 16:05:08',NULL),
	(581,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377072374699,0,0,'2013-08-21 16:06:17',NULL),
	(582,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377072434327.7,0,0,'2013-08-21 16:07:17',NULL),
	(583,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377072532389.4,0,0,'2013-08-21 16:09:00',NULL),
	(584,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377072647031.8,0,0,'2013-08-21 16:10:53',NULL),
	(585,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377072843239.4,0,0,'2013-08-21 16:14:05',NULL),
	(586,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','','erylee','李枫','The following is a list of colors. A number of the color swatches below are taken from domain-specific naming schemes such as X11 or HTML4. RGB values are given for each swatch because such standards are defined in terms of the sRGB color space. It is not possible to accurately convert many of these swatches to CMYK values because of the differing gamuts of the two spaces, but the color management systems built into operating systems and image editing software attempt such conversions as accurately as possible.','',1377072877779.1,0,0,'2013-08-21 16:14:37',NULL),
	(587,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','v9087467','erylee','李枫','您好，我是李枫，欢迎来访','',1377073133398.4,0,0,'2013-08-21 16:18:56',NULL),
	(588,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','','erylee','李枫','The following is a list of colors. A number of the color swatches below are taken from domain-specific naming schemes such as X11 or HTML4. RGB values are given for each swatch because such standards are defined in terms of the sRGB color space. It is not possible to accurately convert many of these swatches to CMYK values because of the differing gamuts of the two spaces, but the color management systems built into operating systems and image editing software attempt such conversions as accurately as possible.','',1377073210768.1,0,0,'2013-08-21 16:20:10',NULL),
	(589,NULL,1,'5214533ac8721','erylee','unicast','5214533ac8721','','erylee','李枫','The following is a list of colors. A number of the color swatches below are taken from domain-specific naming schemes such as X11 or HTML4. RGB values are given for each swatch because such standards are defined in terms of the sRGB color space. It is not possible to accurately convert many of these swatches to CMYK values because of the differing gamuts of the two spaces, but the color management systems built into operating systems and image editing software attempt such conversions as accurately as possible.','',1377073212971.9,0,0,'2013-08-21 16:20:12',NULL),
	(590,NULL,1,'521575e434dd2','weiyue','unicast','521575e434dd2','v4071121','weiyue','魏玥','您好，我是魏玥，欢迎来访','',1377138425693,1,0,'2013-08-22 10:27:06',NULL),
	(591,NULL,1,'','weiyue','unicast','weiyue','魏玥','weiyue','魏玥','hello','',1377138431558.1,0,0,'2013-08-22 10:27:11',NULL),
	(592,NULL,1,'521575e434dd2','weiyue','unicast','521575e434dd2','魏玥','weiyue','魏玥','请问您有什么要咨询？','',1377138446489.4,1,0,'2013-08-22 10:27:26',NULL),
	(593,NULL,1,'521575e434dd2','weiyue','unicast','521575e434dd2','v4071121','weiyue','admin','您好，我是admin，欢迎来访','',1377138975603.2,1,0,'2013-08-22 10:36:15',NULL),
	(594,NULL,1,'521575e434dd2','','unicast','521575e434dd2','v4071121','521575e434dd2','v4071121','您好，我是admin，请问您有什么要咨询的吗？','',1377139006510.9,0,0,'2013-08-22 10:36:46',NULL),
	(595,NULL,1,'521575e434dd2','weiyue','unicast','521575e434dd2','v4071121','weiyue','v4071121','您好，我是admin，请问您有什么要咨询的吗？','',1377139006510.9,1,0,'2013-08-22 10:36:46',NULL),
	(596,NULL,1,'521575e434dd2','','unicast','521575e434dd2','v4071121','521575e434dd2','v4071121','您好，我是admin，欢迎来访','',1377139025965,0,0,'2013-08-22 10:37:05',NULL),
	(597,NULL,1,'521575e434dd2','weiyue','unicast','521575e434dd2','v4071121','weiyue','v4071121','您好，我是admin，欢迎来访','',1377139025965,1,0,'2013-08-22 10:37:06',NULL),
	(598,NULL,1,'521575e434dd2','weiyue','unicast','weiyue','admin','521575e434dd2','v4071121','hello','',1377139032287.1,0,1,'2013-08-22 10:37:12',NULL),
	(599,NULL,1,'521575e434dd2','','unicast','521575e434dd2','v4071121','521575e434dd2','v4071121','请问您有什么要咨询？','',1377139039764.7,0,0,'2013-08-22 10:37:19',NULL),
	(600,NULL,1,'521575e434dd2','weiyue','unicast','521575e434dd2','v4071121','weiyue','v4071121','请问您有什么要咨询？','',1377139039764.7,1,0,'2013-08-22 10:37:19',NULL),
	(601,NULL,1,'521575e434dd2','','unicast','521575e434dd2','v4071121','521575e434dd2','v4071121','您好，我是admin，欢迎来访！','',1377139249931.7,0,0,'2013-08-22 10:40:49',NULL),
	(602,NULL,1,'521575e434dd2','weiyue','unicast','521575e434dd2','v4071121','weiyue','v4071121','您好，我是admin，欢迎来访！','',1377139249931.7,1,0,'2013-08-22 10:40:50',NULL),
	(603,NULL,1,'521575e434dd2','weiyue','unicast','weiyue','admin','521575e434dd2','v4071121','hello','',1377139259207.2,0,1,'2013-08-22 10:40:59',NULL),
	(604,NULL,1,'521575e434dd2','weiyue','unicast','521575e434dd2','v4071121','weiyue','admin','您好，我是admin，欢迎来访','',1377139295123.4,0,0,'2013-08-22 10:41:35',NULL),
	(605,NULL,1,'521575e434dd2','weiyue','unicast','weiyue','admin','521575e434dd2','v4071121','您好:)','',1377139306083.3,0,0,'2013-08-22 10:41:46',NULL),
	(606,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140390231.1,1,0,'2013-08-22 10:59:50',NULL),
	(607,NULL,1,'52157e976646c','weiyue','unicast','weiyue','admin','52157e976646c','v3911750','hello','',1377140404573.7,0,1,'2013-08-22 11:00:04',NULL),
	(608,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','请问您有什么要咨询？','',1377140431856.9,1,0,'2013-08-22 11:00:31',NULL),
	(609,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140459180.4,1,0,'2013-08-22 11:00:59',NULL),
	(610,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140459246.4,1,0,'2013-08-22 11:00:59',NULL),
	(611,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140469133.6,1,0,'2013-08-22 11:01:09',NULL),
	(612,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140477494.1,1,0,'2013-08-22 11:01:17',NULL),
	(613,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140610875.1,1,0,'2013-08-22 11:03:31',NULL),
	(614,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140689044.7,1,0,'2013-08-22 11:04:49',NULL),
	(615,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140694035.8,1,0,'2013-08-22 11:04:54',NULL),
	(616,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140738165.2,0,0,'2013-08-22 11:05:38',NULL),
	(617,NULL,1,'52157e976646c','weiyue','unicast','52157e976646c','v3911750','weiyue','admin','您好，我是admin，欢迎来访','',1377140778236,0,0,'2013-08-22 11:06:18',NULL),
	(618,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377189470983.5,0,0,'2013-08-23 00:37:51',NULL),
	(619,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377189592116.1,0,0,'2013-08-23 00:39:52',NULL),
	(620,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377190268081.5,0,0,'2013-08-23 00:51:08',NULL),
	(621,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377191470733.9,0,0,'2013-08-23 01:11:10',NULL),
	(622,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377191519411.3,0,0,'2013-08-23 01:11:59',NULL),
	(623,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377191659132.7,0,0,'2013-08-23 01:14:19',NULL),
	(624,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377228079434.1,0,0,'2013-08-23 11:21:20',NULL),
	(625,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377228150769.4,0,0,'2013-08-23 11:22:31',NULL),
	(626,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377228323094.5,0,0,'2013-08-23 11:25:23',NULL),
	(627,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377228330836.8,0,0,'2013-08-23 11:25:31',NULL),
	(628,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377233580185.9,0,0,'2013-08-23 12:53:00',NULL),
	(629,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377233693043.3,0,0,'2013-08-23 12:54:53',NULL),
	(630,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377233724695,0,0,'2013-08-23 12:55:25',NULL),
	(631,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377233867300.6,0,0,'2013-08-23 12:57:47',NULL),
	(632,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377236716223.2,0,0,'2013-08-23 13:45:28',NULL),
	(633,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377237387923,0,0,'2013-08-23 13:56:41',NULL),
	(634,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377237604688.6,0,0,'2013-08-23 14:00:15',NULL),
	(635,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377244513662.5,0,0,'2013-08-23 15:55:14',NULL),
	(636,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377244595220.5,0,0,'2013-08-23 15:56:35',NULL),
	(637,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377244636887.5,0,0,'2013-08-23 15:57:17',NULL),
	(638,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377244715299.8,0,0,'2013-08-23 15:58:36',NULL),
	(639,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377245635084.5,0,0,'2013-08-23 16:13:55',NULL),
	(640,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377245739070,0,0,'2013-08-23 16:15:39',NULL),
	(641,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377246610922.7,0,0,'2013-08-23 16:30:11',NULL),
	(642,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377247454145.8,0,0,'2013-08-23 16:44:14',NULL),
	(643,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377247699794.7,0,0,'2013-08-23 16:48:20',NULL),
	(644,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377248399167.8,0,0,'2013-08-23 17:00:00',NULL),
	(645,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377248448414,0,0,'2013-08-23 17:00:48',NULL),
	(646,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','','erylee','李枫','nihao','',1377258065625.6,0,0,'2013-08-23 19:41:05',NULL),
	(647,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','','erylee','李枫','ls','',1377258068524.3,0,0,'2013-08-23 19:41:08',NULL),
	(648,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377258051659.3,0,0,'2013-08-23 19:41:14',NULL),
	(649,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','','erylee','李枫','I thin \n','',1377258094808.9,0,0,'2013-08-23 19:41:34',NULL),
	(650,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','好的','',1377258112334.3,0,0,'2013-08-23 19:41:52',NULL),
	(651,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','','erylee','李枫','你好','',1377258143456.2,0,0,'2013-08-23 19:42:23',NULL),
	(652,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','','erylee','李枫','为什么','',1377258258861,0,0,'2013-08-23 19:44:18',NULL),
	(653,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','','erylee','李枫','还','',1377258273384.9,0,0,'2013-08-23 19:44:33',NULL),
	(654,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','','erylee','李枫','还好\n','',1377258285123.4,0,0,'2013-08-23 19:44:45',NULL),
	(655,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','这。。。','',1377258299208.6,0,0,'2013-08-23 19:44:59',NULL),
	(656,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','这。。。','',1377258300422.7,0,0,'2013-08-23 19:45:00',NULL),
	(657,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','这。。。','',1377258300697.6,0,0,'2013-08-23 19:45:00',NULL),
	(658,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','这。。。','',1377258310374.1,0,0,'2013-08-23 19:45:10',NULL),
	(659,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','这。。。','',1377258311995.8,0,0,'2013-08-23 19:45:11',NULL),
	(660,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377260032930.3,0,0,'2013-08-23 20:13:53',NULL),
	(661,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','','erylee','李枫','好的','',1377260043714.9,0,0,'2013-08-23 20:14:03',NULL),
	(662,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','售后服务','',1377260051732.2,0,0,'2013-08-23 20:14:11',NULL),
	(663,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','你好','',1377260053644.8,0,0,'2013-08-23 20:14:13',NULL),
	(664,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','真的','',1377260055532.5,0,0,'2013-08-23 20:14:15',NULL),
	(665,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377260135627.8,0,0,'2013-08-23 20:15:35',NULL),
	(666,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','','erylee','李枫','了去','',1377260146457.2,0,0,'2013-08-23 20:15:46',NULL),
	(667,NULL,1,'52163e5c61968','erylee','unicast','erylee','李枫','52163e5c61968','v1126011','Great','',1377260153024.1,0,0,'2013-08-23 20:15:53',NULL),
	(668,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377267593925.1,0,0,'2013-08-23 22:19:54',NULL),
	(669,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377267720579.3,0,0,'2013-08-23 22:22:01',NULL),
	(670,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377267811289.9,0,0,'2013-08-23 22:23:31',NULL),
	(671,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377268503388.4,0,0,'2013-08-23 22:35:04',NULL),
	(672,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377268916148,0,0,'2013-08-23 22:41:57',NULL),
	(673,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377269136623.6,0,0,'2013-08-23 22:45:39',NULL),
	(674,NULL,1,'521774bd7a2d2','erylee','unicast','521774bd7a2d2','v1777243','erylee','李枫','您好，我是李枫，欢迎来访','',1377269433435.7,0,0,'2013-08-23 22:50:34',NULL),
	(675,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377269489304.8,0,0,'2013-08-23 22:51:30',NULL),
	(676,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377269643313.3,0,0,'2013-08-23 22:54:04',NULL),
	(677,NULL,1,'521774bd7a2d2','erylee','unicast','521774bd7a2d2','v1777243','erylee','李枫','您好，我是李枫，欢迎来访','',1377269739647.7,0,0,'2013-08-23 22:55:40',NULL),
	(678,NULL,1,'521774bd7a2d2','erylee','unicast','521774bd7a2d2','v1777243','erylee','李枫','您好，我是李枫，欢迎来访','',1377269896426,0,0,'2013-08-23 22:58:17',NULL),
	(679,NULL,1,'52163e5c61968','erylee','unicast','52163e5c61968','v1126011','erylee','李枫','您好，我是李枫，欢迎来访','',1377269935841.3,0,0,'2013-08-23 22:58:56',NULL),
	(680,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','v8826013','erylee','李枫','您好，我是李枫，欢迎来访','',1377439159838.3,0,0,'2013-08-25 21:59:21',NULL),
	(681,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439165319.4,0,0,'2013-08-25 21:59:25',NULL),
	(682,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439167120.6,0,0,'2013-08-25 21:59:27',NULL),
	(683,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439169196.6,0,0,'2013-08-25 21:59:29',NULL),
	(684,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439169768.4,0,0,'2013-08-25 21:59:29',NULL),
	(685,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439170801.2,0,0,'2013-08-25 21:59:30',NULL),
	(686,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439171619.6,0,0,'2013-08-25 21:59:31',NULL),
	(687,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439173000.7,0,0,'2013-08-25 21:59:32',NULL),
	(688,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439175949.8,0,0,'2013-08-25 21:59:35',NULL),
	(689,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439176956.7,0,0,'2013-08-25 21:59:36',NULL),
	(690,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439179251.5,0,0,'2013-08-25 21:59:39',NULL),
	(691,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439180168.5,0,0,'2013-08-25 21:59:40',NULL),
	(692,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439180950,0,0,'2013-08-25 21:59:40',NULL),
	(693,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439182760.9,0,0,'2013-08-25 21:59:42',NULL),
	(694,NULL,1,'521a0db3d0af2','erylee','unicast','521a0db3d0af2','','erylee','李枫','你好','',1377439187913,0,0,'2013-08-25 21:59:47',NULL),
	(695,NULL,1,'521db93a7302d','erylee','unicast','erylee','李枫','521db93a7302d','v1753437','正在: http://shopim.webim20.cn/','',1377679774498.1,0,0,'2013-08-28 16:49:34',NULL),
	(696,NULL,1,'521db93a7302d','erylee','unicast','erylee','李枫','521db93a7302d','v1753437','hello','',1377679774583.7,0,0,'2013-08-28 16:49:34',NULL),
	(697,NULL,1,'521db93a7302d','erylee','unicast','521db93a7302d','v1753437','erylee','李枫','您好，我是李枫，欢迎来访','',1377679768761,0,0,'2013-08-28 16:49:37',NULL),
	(698,NULL,1,'521db93a7302d','erylee','unicast','521db93a7302d','v1753437','erylee','李枫','请问什么时间？你好欢迎客服系统！','',1377679791244.5,0,0,'2013-08-28 16:49:51',NULL),
	(699,NULL,1,'521db93a7302d','erylee','unicast','521db93a7302d','v1753437','erylee','李枫','您好，我是李枫，欢迎来访','',1377679833689.8,0,0,'2013-08-28 16:50:34',NULL),
	(700,NULL,1,'521db93a7302d','erylee','unicast','erylee','李枫','521db93a7302d','v1753437','1','',1377679859454.8,0,0,'2013-08-28 16:50:59',NULL),
	(701,NULL,1,'521db93a7302d','erylee','unicast','521db93a7302d','v1753437','erylee','李枫','您好，我是李枫，欢迎来访','',1377680017267,0,0,'2013-08-28 16:53:38',NULL),
	(702,NULL,1,'521db93a7302d','erylee','unicast','521db93a7302d','v1753437','erylee','李枫','您好，我是李枫，欢迎来访','',1377680044650.3,0,0,'2013-08-28 16:54:06',NULL),
	(703,NULL,1,'521db93a7302d','erylee','unicast','521db93a7302d','v1753437','erylee','李枫','您好，我是李枫，欢迎来访','',1377680096984.4,0,0,'2013-08-28 16:54:58',NULL),
	(704,NULL,1,'522323528e271','erylee','unicast','522323528e271','v1930965','erylee','李枫','您好，我是李枫，欢迎来访','',1378034610667.9,0,0,'2013-09-01 19:23:31',NULL),
	(705,NULL,1,'522323528e271','erylee','unicast','erylee','李枫','522323528e271','v1930965','hi','',1378034615069,0,0,'2013-09-01 19:23:35',NULL),
	(706,NULL,1,'522323528e271','erylee','unicast','522323528e271','v1930965','erylee','李枫','你好欢迎客服系统！','',1378034621674.5,0,0,'2013-09-01 19:23:41',NULL),
	(707,NULL,1,'522323528e271','erylee','unicast','522323528e271','v1930965','erylee','李枫','hi','',1378034629060,0,0,'2013-09-01 19:23:49',NULL),
	(708,NULL,1,'522323528e271','erylee','unicast','erylee','李枫','522323528e271','v1930965','hell','',1378034635778.5,0,0,'2013-09-01 19:23:55',NULL),
	(709,NULL,1,'522323528e271','erylee','unicast','522323528e271','v1930965','erylee','李枫','您好，我是李枫，欢迎来访','',1378034655175.2,0,0,'2013-09-01 19:24:16',NULL),
	(710,NULL,1,'522323528e271','erylee','unicast','erylee','李枫','522323528e271','v1930965','a','',1378034661831.2,0,0,'2013-09-01 19:24:21',NULL),
	(711,NULL,1,'522323528e271','erylee','unicast','erylee','李枫','522323528e271','v1930965','a','',1378034664247.3,0,0,'2013-09-01 19:24:24',NULL),
	(712,NULL,1,'522323528e271','erylee','unicast','erylee','李枫','522323528e271','v1930965','b','',1378034664728,0,0,'2013-09-01 19:24:24',NULL),
	(713,NULL,1,'522fdf4b0805d','erylee','unicast','522fdf4b0805d','v6473190','erylee','李枫','您好，我是李枫，欢迎来访','',1378869076150.9,0,0,'2013-09-11 11:11:16',NULL),
	(714,NULL,1,'522fdf4b0805d','erylee','unicast','erylee','李枫','522fdf4b0805d','v6473190','正在: http://shopim.webim20.cn/','',1378869079113.2,0,0,'2013-09-11 11:11:19',NULL),
	(715,NULL,1,'522fdf4b0805d','erylee','unicast','erylee','李枫','522fdf4b0805d','v6473190','hi','',1378869079124.5,0,0,'2013-09-11 11:11:19',NULL),
	(716,NULL,1,'522fdf4b0805d','erylee','unicast','522fdf4b0805d','v6473190','erylee','李枫','hoho','',1378869085819.6,0,0,'2013-09-11 11:11:25',NULL),
	(717,NULL,1,'522fdf4b0805d','erylee','unicast','522fdf4b0805d','v6473190','erylee','李枫','cool','',1378869088035.8,0,0,'2013-09-11 11:11:28',NULL),
	(718,NULL,1,'522fdf4b0805d','erylee','unicast','522fdf4b0805d','v6473190','erylee','李枫','您好，我是李枫，欢迎来访','',1378869106734.9,0,0,'2013-09-11 11:11:46',NULL);

/*!40000 ALTER TABLE `shop_webim_histories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_notes`;

CREATE TABLE `shop_webim_notes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `visitor_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` int(2) DEFAULT '0',
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_notes` WRITE;
/*!40000 ALTER TABLE `shop_webim_notes` DISABLE KEYS */;

INSERT INTO `shop_webim_notes` (`id`, `user_id`, `group_id`, `visitor_id`, `name`, `contact`, `content`, `created_at`, `status`, `remark`)
VALUES
	(1,6,7,'52050b0b1848c','Arron','126','有人在么？','2013-08-09 23:37:25',0,NULL),
	(2,0,0,'520c935b06587','weiyue','123','123','2013-08-15 16:38:13',0,NULL),
	(3,1,1,'521db93a7302d','123','123','123','2013-08-28 16:55:03',0,NULL),
	(4,4,2,'52203d8b186d8','erlan','emai@agk','akakaka','2013-08-30 14:39:05',0,NULL),
	(5,2,2,'52203d8b186d8','erlan','emai@agk','akakaka','2013-08-30 14:39:07',0,NULL),
	(6,2,2,'52203d8b186d8','erlan','emai@agk','akakaka','2013-08-30 14:39:07',0,NULL),
	(7,4,2,'52203d8b186d8','erlan','emai@agk','akakaka','2013-08-30 14:39:08',0,NULL),
	(8,4,2,'52203d8b186d8','erlan','emai@agk','akakaka','2013-08-30 14:39:13',0,NULL),
	(9,4,2,'52203d8b186d8','erlan','emai@agk','akakaka','2013-08-30 14:39:17',0,NULL),
	(10,2,2,'52203d8b186d8','erlan','emai@agk','akakaka','2013-08-30 14:39:20',0,NULL),
	(11,2,2,'52203d8b186d8','erlan','emai@agk','akakaka','2013-08-30 14:39:22',0,NULL);

/*!40000 ALTER TABLE `shop_webim_notes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_questions`;

CREATE TABLE `shop_webim_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `qid` int(11) NOT NULL,
  `question` varchar(50) NOT NULL,
  `answer` varchar(200) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rid` (`rid`,`qid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_questions` WRITE;
/*!40000 ALTER TABLE `shop_webim_questions` DISABLE KEYS */;

INSERT INTO `shop_webim_questions` (`id`, `eid`, `rid`, `qid`, `question`, `answer`, `created_at`)
VALUES
	(1,10000,1,1,'请问NextIM的技术架构','NextIM采用Erlang开发',NULL),
	(2,10000,2,1,'问题test？','ok',NULL);

/*!40000 ALTER TABLE `shop_webim_questions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_robots
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_robots`;

CREATE TABLE `shop_webim_robots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `role` varchar(40) NOT NULL DEFAULT 'user',
  `remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_robots` WRITE;
/*!40000 ALTER TABLE `shop_webim_robots` DISABLE KEYS */;

INSERT INTO `shop_webim_robots` (`id`, `eid`, `name`, `status`, `role`, `remark`)
VALUES
	(1,10000,'技术问答机器人',1,'user','技术问题回答'),
	(2,10000,'商务问答机器人',1,'user',''),
	(3,10000,'售后服务',0,'','');

/*!40000 ALTER TABLE `shop_webim_robots` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_sentences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_sentences`;

CREATE TABLE `shop_webim_sentences` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `group_id` int(11) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_sentences` WRITE;
/*!40000 ALTER TABLE `shop_webim_sentences` DISABLE KEYS */;

INSERT INTO `shop_webim_sentences` (`id`, `user_id`, `group_id`, `content`)
VALUES
	(1,0,2,'您好，请问您有什么问题？'),
	(2,0,2,'你好欢迎客服系统！'),
	(3,0,1,'请问您有什么要咨询？'),
	(4,1,1,'曹洁生加入的常用语01'),
	(5,0,2,'请问什么时间？');

/*!40000 ALTER TABLE `shop_webim_sentences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_settings`;

CREATE TABLE `shop_webim_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) DEFAULT NULL,
  `web` blob,
  `air` blob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_settings` WRITE;
/*!40000 ALTER TABLE `shop_webim_settings` DISABLE KEYS */;

INSERT INTO `shop_webim_settings` (`id`, `uid`, `web`, `air`, `created_at`, `updated_at`)
VALUES
	(1,'52110486c1aeb',X'7B7D',NULL,NULL,NULL),
	(2,'5211049382bac',X'7B22706C61795F736F756E64223A66616C73652C2262756464795F737469636B79223A747275652C226D696E696D697A655F6C61796F7574223A747275652C226D73675F6175746F5F706F70223A747275652C22626C6F636B65645F726F6F6D73223A5B5D7D',NULL,NULL,NULL),
	(3,'admin',X'7B7D',NULL,NULL,NULL),
	(4,'5211049382bac',X'7B22706C61795F736F756E64223A66616C73652C2262756464795F737469636B79223A747275652C226D696E696D697A655F6C61796F7574223A747275652C226D73675F6175746F5F706F70223A747275652C22626C6F636B65645F726F6F6D73223A5B5D7D',NULL,NULL,NULL),
	(5,'5211049382bac',X'7B7D',NULL,NULL,NULL),
	(6,'5211049382bac',X'7B7D',NULL,NULL,NULL),
	(7,'5211049382bac',X'7B7D',NULL,NULL,NULL),
	(8,'5211049382bac',X'7B7D',NULL,NULL,NULL),
	(9,'521114454d46b',X'7B7D',NULL,NULL,NULL),
	(10,'52117bf65dbfa',X'7B7D',NULL,NULL,NULL),
	(11,'5211e43428656',X'7B7D',NULL,NULL,NULL),
	(12,'5211e44cd06a0',X'7B7D',NULL,NULL,NULL),
	(13,'5211e44cd06a0',X'7B7D',NULL,NULL,NULL),
	(14,'5211e4c460a19',X'7B22706C61795F736F756E64223A66616C73652C2262756464795F737469636B79223A747275652C226D696E696D697A655F6C61796F7574223A747275652C226D73675F6175746F5F706F70223A747275652C22626C6F636B65645F726F6F6D73223A5B5D7D',NULL,NULL,NULL),
	(15,'5211e4c460a19',X'7B22706C61795F736F756E64223A66616C73652C2262756464795F737469636B79223A747275652C226D696E696D697A655F6C61796F7574223A747275652C226D73675F6175746F5F706F70223A747275652C22626C6F636B65645F726F6F6D73223A5B5D7D',NULL,NULL,NULL),
	(16,'52120f289edc2',X'7B7D',NULL,NULL,NULL),
	(17,'5211e4c460a19',X'7B22706C61795F736F756E64223A66616C73652C2262756464795F737469636B79223A747275652C226D696E696D697A655F6C61796F7574223A747275652C226D73675F6175746F5F706F70223A747275652C22626C6F636B65645F726F6F6D73223A5B5D7D',NULL,NULL,NULL),
	(18,'5211e4c460a19',X'7B7D',NULL,NULL,NULL),
	(19,'52121ffc40279',X'7B7D',NULL,NULL,NULL),
	(20,'5212dd0400242',X'7B7D',NULL,NULL,NULL),
	(21,'52136773d88db',X'7B22706C61795F736F756E64223A66616C73652C2262756464795F737469636B79223A747275652C226D696E696D697A655F6C61796F7574223A747275652C226D73675F6175746F5F706F70223A747275652C22626C6F636B65645F726F6F6D73223A5B5D7D',NULL,NULL,NULL),
	(22,'52136898101fa',X'7B7D',NULL,NULL,NULL),
	(23,'52136898101fa',X'7B7D',NULL,NULL,NULL),
	(24,'52136898101fa',X'7B7D',NULL,NULL,NULL),
	(25,'5214533ac8721',X'7B7D',NULL,NULL,NULL),
	(26,'52153521ce372',X'7B7D',NULL,NULL,NULL),
	(27,'5215356dcb16e',X'7B7D',NULL,NULL,NULL),
	(28,'521535707e278',X'7B7D',NULL,NULL,NULL),
	(29,'52153570dbdf1',X'7B7D',NULL,NULL,NULL),
	(30,'52153571481bd',X'7B7D',NULL,NULL,NULL),
	(31,'52153574b5275',X'7B7D',NULL,NULL,NULL),
	(32,'5215357527449',X'7B7D',NULL,NULL,NULL),
	(33,'52153575e3cda',X'7B7D',NULL,NULL,NULL),
	(34,'521535768c4f9',X'7B7D',NULL,NULL,NULL),
	(35,'521535774fa07',X'7B7D',NULL,NULL,NULL),
	(36,'52153577ad9e9',X'7B7D',NULL,NULL,NULL),
	(37,'521575e434dd2',X'7B7D',NULL,NULL,NULL),
	(38,'521575e434dd2',X'7B7D',NULL,NULL,NULL),
	(39,'521575e434dd2',X'7B7D',NULL,NULL,NULL),
	(40,'521575e434dd2',X'7B7D',NULL,NULL,NULL),
	(41,'521575e434dd2',X'7B7D',NULL,NULL,NULL),
	(42,'521575e434dd2',X'7B7D',NULL,NULL,NULL),
	(43,'52157e976646c',X'7B7D',NULL,NULL,NULL),
	(44,'52157e976646c',X'7B7D',NULL,NULL,NULL),
	(45,'52157e976646c',X'7B7D',NULL,NULL,NULL),
	(46,'52157f7181929',X'7B7D',NULL,NULL,NULL),
	(47,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(48,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(49,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(50,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(51,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(52,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(53,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(54,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(55,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(56,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(57,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(58,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(59,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(60,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(61,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(62,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(63,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(64,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(65,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(66,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(67,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(68,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(69,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(70,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(71,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(72,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(73,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(74,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(75,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(76,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(77,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(78,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(79,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(80,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(81,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(82,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(83,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(84,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(85,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(86,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(87,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(88,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(89,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(90,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(91,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(92,'5216fae443eb6',X'7B7D',NULL,NULL,NULL),
	(93,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(94,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(95,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(96,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(97,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(98,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(99,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(100,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(101,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(102,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(103,'521717be6fabf',X'7B7D',NULL,NULL,NULL),
	(104,'521718a93d88f',X'7B7D',NULL,NULL,NULL),
	(105,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(106,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(107,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(108,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(109,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(110,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(111,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(112,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(113,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(114,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(115,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(116,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(117,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(118,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(119,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(120,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(121,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(122,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(123,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(124,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(125,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(126,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(127,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(128,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(129,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(130,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(131,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(132,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(133,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(134,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(135,'521774bd7a2d2',X'7B7D',NULL,NULL,NULL),
	(136,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(137,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(138,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(139,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(140,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(141,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(142,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(143,'52163e5c61968',X'7B7D',NULL,NULL,NULL),
	(144,'5217797c57cad',X'7B7D',NULL,NULL,NULL),
	(145,'521968e6d1b2c',X'7B7D',NULL,NULL,NULL),
	(146,'521968e6d1b2c',X'7B7D',NULL,NULL,NULL),
	(147,'521a0db3d0af2',X'7B7D',NULL,NULL,NULL),
	(148,'521968e6d1b2c',X'7B7D',NULL,NULL,NULL),
	(149,'52203d8b186d8',X'7B22706C61795F736F756E64223A66616C73652C2262756464795F737469636B79223A747275652C226D696E696D697A655F6C61796F7574223A747275652C226D73675F6175746F5F706F70223A747275652C22626C6F636B65645F726F6F6D73223A5B5D7D',NULL,NULL,NULL),
	(150,'522055a0af02f',X'7B7D',NULL,NULL,NULL),
	(151,'522323528e271',X'7B7D',NULL,NULL,NULL),
	(152,'52232374c9e26',X'7B7D',NULL,NULL,NULL),
	(153,'522323528e271',X'7B7D',NULL,NULL,NULL),
	(154,'52252edae555a',X'7B7D',NULL,NULL,NULL),
	(155,'522ed07821ed2',X'7B7D',NULL,NULL,NULL),
	(156,'52316c532ce65',X'7B7D',NULL,NULL,NULL);

/*!40000 ALTER TABLE `shop_webim_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_sites`;

CREATE TABLE `shop_webim_sites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eid` bigint(20) DEFAULT NULL,
  `domain` varchar(50) NOT NULL,
  `apikey` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table shop_webim_syslogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_syslogs`;

CREATE TABLE `shop_webim_syslogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `facility` varchar(40) DEFAULT NULL,
  `severity` varchar(50) DEFAULT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_syslogs` WRITE;
/*!40000 ALTER TABLE `shop_webim_syslogs` DISABLE KEYS */;

INSERT INTO `shop_webim_syslogs` (`id`, `eid`, `uid`, `facility`, `severity`, `ipaddr`, `content`, `created_at`)
VALUES
	(2,10000,2,'管理模块','info','10.10.10.10','登陆系统','2013-05-19 10:10:10');

/*!40000 ALTER TABLE `shop_webim_syslogs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_tenants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_tenants`;

CREATE TABLE `shop_webim_tenants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT '',
  `status` tinyint(1) DEFAULT NULL COMMENT '租户状态: 1. 未激活；2.激活',
  `company` varchar(60) DEFAULT NULL COMMENT '公司信息',
  `contact` varchar(40) DEFAULT NULL COMMENT '联系人信息',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `signat` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_tenants` WRITE;
/*!40000 ALTER TABLE `shop_webim_tenants` DISABLE KEYS */;

INSERT INTO `shop_webim_tenants` (`id`, `name`, `status`, `company`, `contact`, `remark`, `signat`)
VALUES
	(10000,'webim20.cn',1,'杭州巨鼎信息技术有限公司','webim20@qq.com','测试公司',NULL);

/*!40000 ALTER TABLE `shop_webim_tenants` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_threads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_threads`;

CREATE TABLE `shop_webim_threads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `vid` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_threads` WRITE;
/*!40000 ALTER TABLE `shop_webim_threads` DISABLE KEYS */;

INSERT INTO `shop_webim_threads` (`id`, `eid`, `uid`, `vid`, `created_at`)
VALUES
	(10000,0,NULL,0,NULL);

/*!40000 ALTER TABLE `shop_webim_threads` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_user_groups`;

CREATE TABLE `shop_webim_user_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergrp_uid_gid` (`uid`,`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table shop_webim_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_users`;

CREATE TABLE `shop_webim_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `role` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_users` WRITE;
/*!40000 ALTER TABLE `shop_webim_users` DISABLE KEYS */;

INSERT INTO `shop_webim_users` (`id`, `eid`, `login`, `password`, `nick`, `email`, `group_id`, `role`, `created_at`, `updated_at`)
VALUES
	(1,10000,'admin','public','管理员','public',1,'admin','2013-07-27 12:25:38','2013-07-27 12:25:38'),
	(2,10000,'erylee','public','李枫','',2,'user',NULL,NULL),
	(4,10000,'hidden','public','镇东','zzdhidden@gmail.com',2,'admin',NULL,NULL),
	(5,10000,'weiyue','123456','admin','weiyue@ctbri.com.cn',1,'admin',NULL,NULL),
	(6,10000,'jason','zxin10','admin','jasonnust@126.com',7,'admin',NULL,NULL);

/*!40000 ALTER TABLE `shop_webim_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shop_webim_visitors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shop_webim_visitors`;

CREATE TABLE `shop_webim_visitors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `nick` varchar(50) NOT NULL,
  `ipaddr` varchar(50) NOT NULL DEFAULT '' COMMENT '访客登陆IP',
  `signat` datetime DEFAULT NULL,
  `referer` varchar(100) DEFAULT NULL COMMENT '访客来源URL，例如百度',
  `url` varchar(100) DEFAULT NULL,
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '访客登陆地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `visitor_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `shop_webim_visitors` WRITE;
/*!40000 ALTER TABLE `shop_webim_visitors` DISABLE KEYS */;

INSERT INTO `shop_webim_visitors` (`id`, `eid`, `uid`, `name`, `nick`, `ipaddr`, `signat`, `referer`, `url`, `location`)
VALUES
	(1,10000,NULL,'5201309ecac25','guest4232','119.183.152.53','2013-08-07 01:30:56','','http://shopim1.webim20.cn/','山东省泰安市'),
	(2,10000,NULL,'5201a4d8c8ade','guest4100','219.142.69.78','2013-08-07 09:47:12','','http://shopim.webim20.cn/','北京市'),
	(3,10000,NULL,'5201a8b6bf5d3','guest3561','219.142.69.78','2013-08-07 09:55:18','','http://shopim.webim20.cn/','北京市'),
	(4,10000,NULL,'5201a8e8d4243','guest4288','58.213.14.189','2013-08-07 09:56:01','','','江苏省南京市'),
	(5,10000,NULL,'52050b0b1848c','guest9645','123.135.191.235','2013-08-09 23:30:29','','http://shopim1.webim20.cn/','山东省泰安市'),
	(6,10000,NULL,'520a07508f190','guest4804','119.183.151.101','2013-08-13 21:45:00','','http://shopim.webim20.cn/','山东省泰安市'),
	(7,10000,NULL,'520c935b06587','guest4683','219.142.69.78','2013-08-15 16:37:52','','http://shopim.webim20.cn/','北京市'),
	(8,10000,NULL,'520ce7d8246b2','guest5478','119.183.153.65','2013-08-15 22:38:28','','http://shopim.webim20.cn/','山东省泰安市'),
	(9,10000,NULL,'520da20bc12be','guest9228','119.183.153.65','2013-08-16 11:52:48','','http://shopim.webim20.cn/','山东省泰安市'),
	(10,10000,NULL,'520e57dc3519e','guest3602','119.183.153.65','2013-08-17 00:48:34','','http://shopim.webim20.cn/','山东省泰安市'),
	(11,10000,NULL,'520efab313178','guest1941','119.183.153.65','2013-08-17 12:23:20','','http://shopim.webim20.cn/','山东省泰安市'),
	(12,10000,NULL,'520f7cae8539e','guest7987','119.183.153.65','2013-08-17 21:37:55','','http://shopim.webim20.cn/','山东省泰安市'),
	(13,10000,NULL,'5211049382bac','guest4771','27.200.87.157','2013-08-19 01:31:01','','http://shopim1.webim20.cn/','中国'),
	(14,10000,NULL,'521114454d46b','guest6660','27.200.87.157','2013-08-19 02:36:55','','http://shopim.webim20.cn/','中国'),
	(15,10000,NULL,'52117c5bc3366','guest6326','27.200.87.157','2013-08-19 10:25:38','','http://shopim.webim20.cn/','中国'),
	(16,10000,NULL,'5211e44cd06a0','guest7749','27.200.87.157','2013-08-19 17:24:38','','http://shopim.webim20.cn/','中国'),
	(17,10000,NULL,'5211e4c460a19','guest3659','27.200.87.157','2013-08-19 17:26:34','','http://shopim.webim20.cn/','中国'),
	(18,10000,NULL,'52120f289edc2','guest4084','27.200.87.157','2013-08-19 20:27:45','','http://shopim.webim20.cn/','中国'),
	(19,10000,NULL,'5212dd0400242','guest5104','27.200.87.157','2013-08-20 11:05:43','','http://shopim.webim20.cn/','中国'),
	(20,10000,NULL,'5212fbfc88728','guest8955','27.200.87.157','2013-08-20 14:17:06','','http://shopim.webim20.cn/','中国'),
	(21,10000,NULL,'52136773d88db','guest8209','27.200.87.157','2013-08-20 20:56:22','','http://shopim.webim20.cn/','中国'),
	(22,10000,NULL,'52136898101fa','guest1402','27.200.87.157','2013-08-20 21:02:35','','http://shopim.webim20.cn/','中国'),
	(23,10000,NULL,'5214533ac8721','v9087467','119.183.145.56','2013-08-21 13:42:29','','http://shopim.webim20.cn/','山东省泰安市'),
	(24,10000,NULL,'521575e434dd2','v4071121','219.142.69.78','2013-08-22 10:22:50','','http://shopim.webim20.cn/','北京市'),
	(25,10000,NULL,'52157e976646c','v3911750','219.142.69.78','2013-08-22 10:59:50','','http://shopim.webim20.cn/','北京市'),
	(26,10000,NULL,'52163e5c61968','v1126011','218.58.200.29','2013-08-23 00:37:50','','http://shopim.webim20.cn/','山东省泰安市'),
	(27,10000,NULL,'5216fae443eb6','v8200050','119.183.147.107','2013-08-23 14:03:27','','http://shopim.webim20.cn/','山东省泰安市'),
	(28,10000,NULL,'521774bd7a2d2','v1777243','119.183.147.107','2013-08-23 22:50:29','','http://shopim.webim20.cn/','山东省泰安市'),
	(29,10000,NULL,'521968e6d1b2c','v6749020','119.183.147.176','2013-08-25 10:16:08','','http://shopim.webim20.cn/','山东省泰安市'),
	(30,10000,NULL,'521a0db3d0af2','v8826013','119.183.147.176','2013-08-25 21:59:19','','http://shopim.webim20.cn/','山东省泰安市'),
	(31,10000,NULL,'521db93a7302d','v1753437','219.142.69.78','2013-08-28 16:49:26','','http://shopim.webim20.cn/','北京市'),
	(32,10000,NULL,'52203d8b186d8','v7139470','124.132.207.9','2013-08-30 14:38:16','','http://shopim.webim20.cn/','山东省泰安市'),
	(33,10000,NULL,'522323528e271','v1930965','122.234.62.242','2013-09-01 19:23:17','','http://shopim.webim20.cn/','浙江省杭州市'),
	(34,10000,NULL,'52252edae555a','v9318910','123.135.151.175','2013-09-03 08:36:36','','http://shopim.webim20.cn/','山东省泰安市'),
	(35,10000,NULL,'522fdbcea445a','v2810068','119.183.144.178','2013-09-11 11:10:15','','http://shopim.webim20.cn/','山东省泰安市'),
	(36,10000,NULL,'522fdf4b0805d','v6473190','119.183.144.178','2013-09-11 11:11:16','','http://shopim.webim20.cn/','山东省泰安市');

/*!40000 ALTER TABLE `shop_webim_visitors` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
