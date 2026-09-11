-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 01 2015 г., 08:30
-- Версия сервера: 5.5.42-cll
-- Версия PHP: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `itasi178_servdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `srv_active_users`
--

CREATE TABLE IF NOT EXISTS `srv_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(10) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about active users.';

--
-- Дамп данных таблицы `srv_active_users`
--

INSERT INTO `srv_active_users` (`internalKey`, `username`, `lasthit`, `id`, `action`, `ip`) VALUES
(1, 'admin', 1432895886, NULL, '2', '37.150.193.18');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_categories`
--

CREATE TABLE IF NOT EXISTS `srv_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc' AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `srv_categories`
--

INSERT INTO `srv_categories` (`id`, `category`) VALUES
(1, 'Demo Content'),
(2, 'Js'),
(3, 'Login'),
(4, 'Manager and Admin'),
(5, 'Search'),
(6, 'Navigation'),
(7, 'Content'),
(8, 'Forms');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_documentgroup_names`
--

CREATE TABLE IF NOT EXISTS `srv_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `srv_documentgroup_names`
--

INSERT INTO `srv_documentgroup_names` (`id`, `name`, `private_memgroup`, `private_webgroup`) VALUES
(1, 'Site Admin Pages', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_document_groups`
--

CREATE TABLE IF NOT EXISTS `srv_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `srv_document_groups`
--

INSERT INTO `srv_document_groups` (`id`, `document_group`, `document`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_event_log`
--

CREATE TABLE IF NOT EXISTS `srv_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `srv_event_log`
--

INSERT INTO `srv_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1, 0, 1432895806, 3, 1, 0, 'Системные файлы были изменены.', 'Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php)'),
(2, 0, 1432895806, 3, 1, 0, 'Файл конфигурации все еще доступен для записи', 'Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим ''Только для чтения''');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_jot_content`
--

CREATE TABLE IF NOT EXISTS `srv_jot_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `tagid` varchar(50) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `uparent` int(10) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `flags` varchar(25) DEFAULT NULL,
  `secip` varchar(32) DEFAULT NULL,
  `sechash` varchar(32) DEFAULT NULL,
  `content` mediumtext,
  `customfields` mediumtext,
  `mode` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0',
  `publishedby` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `secip` (`secip`),
  KEY `tagidx` (`tagid`),
  KEY `uparent` (`uparent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `srv_jot_content`
--

INSERT INTO `srv_jot_content` (`id`, `title`, `tagid`, `published`, `uparent`, `parent`, `flags`, `secip`, `sechash`, `content`, `customfields`, `mode`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`) VALUES
(9, 'The first comment', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'This is the first comment.', '<custom><name></name><email></email></custom>', 0, 0, 1160420310, 0, 0, 0, 0, 0, 0, 0),
(10, 'Second comment', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'This is the second comment and uses an alternate row color. I also supplied a name, but i''m not logged in.', '<custom><name>Armand</name><email></email></custom>', 0, 0, 1160420453, 0, 0, 0, 0, 0, 0, 0),
(11, 'No abuse', '', 1, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'Notice that I can''t abuse <b>html</b>, ,  or [+placeholder+] tags.\r\n\r\nA new line also doesn''t come unnoticed.', '<custom><name>Armand</name><email></email></custom>', 0, 0, 1160420681, 0, 0, 0, 0, 0, 0, 0),
(12, 'Posting when logged in', '', 1, 9, 0, '', '87.211.130.14', '58fade927c1df50ba6131f2b0e53c120', 'When you are logged in your own posts have a special color so you can easily spot them from the comment view. \r\n\r\nThe form also does not display any guest fields when logged in.', '<custom></custom>', 0, -1, 1160421310, 0, 0, 0, 0, 0, 0, 0),
(13, 'Managers', '', 1, 9, 0, '', '87.211.130.14', '91e230cf219e3ade10f32d6a41d0bd4d', 'Comments posted when only logged in as a manager user will use your manager name.\r\n\r\nModerators options are always shown when you are logged in as manager user.', '<custom></custom>', 0, 1, 1160421487, 0, 0, 0, 0, 0, 0, 0),
(14, 'Moderation', '', 1, 9, 0, '', '87.211.130.14', '58fade927c1df50ba6131f2b0e53c120', 'In this setup the Site Admins group is defined as being the moderator for this particular comment view. These users will have extra moderation options \r\n\r\nManager users, Moderators or Trusted users can post bad words like: dotNet.', '<custom></custom>', 0, -1, 1160422081, 0, 0, 0, 0, 0, 0, 0),
(15, 'I''m untrusted', '', 0, 9, 0, '', '87.211.130.14', 'edb75dab198ff302efbf2f60e548c0b3', 'Untrusted users however can NOT post bad words like: dotNet. When they do the posts will be unpublished.', '<custom><name></name><email></email></custom>', 0, 0, 1160422167, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_jot_subscriptions`
--

CREATE TABLE IF NOT EXISTS `srv_jot_subscriptions` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `uparent` mediumint(10) NOT NULL DEFAULT '0',
  `tagid` varchar(50) NOT NULL DEFAULT '',
  `userid` mediumint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uparent` (`uparent`),
  KEY `tagid` (`tagid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `srv_keyword_xref`
--

CREATE TABLE IF NOT EXISTS `srv_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cross reference bewteen keywords and content';

--
-- Дамп данных таблицы `srv_keyword_xref`
--

INSERT INTO `srv_keyword_xref` (`content_id`, `keyword_id`) VALUES
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_manager_CITY_INFO`
--

CREATE TABLE IF NOT EXISTS `srv_manager_CITY_INFO` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `page_text` text,
  `map` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `srv_manager_CITY_INFO`
--

INSERT INTO `srv_manager_CITY_INFO` (`id`, `city`, `phone`, `email`, `page_text`, `map`) VALUES
(1, 'Усть-Каменогорск', '8 (727) 350-82-63', 'miruslug782958@gmail.com', '<p><strong>Адрес:</strong><br />070001 Республика Казахстан, Восточно-Казахстанская область<br />г. Усть-Каменогорск, ул. Ж. Малдыбаева, 1</p>\r\n<p>&nbsp;</p>\r\n<p><strong><br /><br />Телефоны:<br /></strong>тел.: +7 (7172) 54 14 55<br />тел/факс.: +7 (7172) 54 16 12<br />+7 (701) 758 63 61<br />+7 (701) 729 07 98<br />+7 (747) 729 07 98</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Email:<br /></strong><a href="mailto:info@апрапр.kz">info@апрапр.kz<br /></a><a href="mailto:апрапр@mail.ru">апрапр@mail.ru</a><br /><a href="mailto:sdfdsfds@mail.ru">sdfdsfds@mail.ru</a></p>', ''),
(2, 'Павлодар', '8 (7182) 78-29-58', 'miruslug782958@gmail.com', '<p><strong>Адрес:<br /></strong>г. Павлодар, ул. Торайгырова. д. 64</p>\r\n<p><strong>Телефон:<br /></strong>8 (7182) 78-29-58</p>\r\n<p><strong>E-Mail:<br /></strong><a href="mailto:miruslug782958@gmail.com">miruslug782958@gmail.com</a></p>', '<script type="text/javascript" charset="utf-8" src="https://api-maps.yandex.ru/services/constructor/1.0/js/?sid=tNfvJU_NH989R_yFnY8ufV4M_AVaDjj-&height=450"></script>');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_manager_log`
--

CREATE TABLE IF NOT EXISTS `srv_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.' AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `srv_manager_log`
--

INSERT INTO `srv_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
(1, 1432895804, 1, 'admin', 58, '-', 'MODX', 'Logged in'),
(2, 1432895809, 1, 'admin', 28, '-', '-', 'Changing password'),
(3, 1432895814, 1, 'admin', 34, '-', '-', 'Saving new password'),
(4, 1432895824, 1, 'admin', 64, '-', '-', 'Removing deleted content'),
(5, 1432895864, 1, 'admin', 17, '-', '-', 'Editing settings'),
(6, 1432895885, 1, 'admin', 30, '-', '-', 'Saving settings');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_manager_users`
--

CREATE TABLE IF NOT EXISTS `srv_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `srv_manager_users`
--

INSERT INTO `srv_manager_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'uncrypt>dd9956c26b3582c59daeb572e8f2773373a2f677');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_membergroup_access`
--

CREATE TABLE IF NOT EXISTS `srv_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `srv_membergroup_names`
--

CREATE TABLE IF NOT EXISTS `srv_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `srv_member_groups`
--

CREATE TABLE IF NOT EXISTS `srv_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_content`
--

CREATE TABLE IF NOT EXISTS `srv_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `haskeywords` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to keywords',
  `hasmetatags` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to meta tags',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.' AUTO_INCREMENT=69 ;

--
-- Дамп данных таблицы `srv_site_content`
--

INSERT INTO `srv_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `haskeywords`, `hasmetatags`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Главная', 'Главная', '', '', '', 1, 0, 0, 0, 1, 'Create and do amazing things with MODX', '<h3>Главная страница</h3>', 1, 5, 0, 1, 1, 1, 1144904400, 1, 1432544638, 0, 0, 0, 0, 0, 'Главная', 0, 0, 0, 0, 0, 0, 1, 1),
(47, 'document', 'text/html', 'Ремонт компьютеров и ноутбуков ', 'Проблемы с компьютером  или ноутбуком?', 'Мы поможем!', 'comp', '', 1, 0, 0, 2, 0, '', '', 1, 6, 1, 1, 1, 1, 1432105455, 1, 1432539098, 0, 0, 0, 1432105455, 1, 'Ремонт компьютеров и ноутбуков ', 0, 0, 0, 0, 0, 0, 0, 1),
(48, 'document', 'text/html', 'Установка и ремонт бытовой техники ', 'Требуется ремонт  или установка бытовой техники?', 'Мы поможем!', 'tech', '', 1, 0, 0, 2, 0, '', '', 1, 6, 2, 1, 1, 1, 1432105610, 1, 1432618933, 0, 0, 0, 1432105610, 1, 'Установка и ремонт бытовой техники ', 0, 0, 0, 0, 0, 0, 0, 1),
(49, 'document', 'text/html', 'Мастера на час: сантехник, электрик, плотник ', 'Нужен электрик, сантехник  или плотник?', 'Обращайтесь к нам!', 'man-on-hour', '', 1, 0, 0, 2, 0, '', '', 1, 6, 3, 1, 1, 1, 1432106839, 1, 1432619087, 0, 0, 0, 1432106839, 1, 'Мастера на час: сантехник, электрик, плотник ', 0, 0, 0, 0, 0, 0, 0, 1),
(50, 'document', 'text/html', 'Ремонт и отделка помещений ', 'Планируете ремонт?', 'Покрасим, наклеим, уложим, побелим!', 'remont', '', 1, 0, 0, 2, 0, '', '', 1, 6, 4, 1, 1, 1, 1432106877, 1, 1432619123, 0, 0, 0, 1432106877, 1, 'Ремонт и отделка помещений ', 0, 0, 0, 0, 0, 0, 0, 1),
(51, 'document', 'text/html', 'Грузоперевозки и грузчики ', 'Требуются грузоперевозки, услуги  грузчиков?', 'Мы поможем!', 'cargoo', '', 1, 0, 0, 2, 0, '', '', 1, 6, 5, 1, 1, 1, 1432106911, 1, 1432539260, 0, 0, 0, 1432106911, 1, 'Грузоперевозки и грузчики ', 0, 0, 0, 0, 0, 0, 0, 1),
(52, 'document', 'text/html', 'Услуги курьеров и доставка ', 'Нужно срочно отправить посылку или доставить срочное письмо?', 'Наши курьеры помогут Вам!', 'courier', '', 1, 0, 0, 2, 0, '', '', 1, 6, 6, 1, 1, 1, 1432107776, 1, 1432539312, 0, 0, 0, 1432107776, 1, 'Услуги курьеров и доставка ', 0, 0, 0, 0, 0, 0, 0, 1),
(53, 'document', 'text/html', 'Уборка  помещений ', 'Мысли об уборке вызывают ужас?', 'Доверьте нам заботу о Вашем уюте!', 'cleaning', '', 1, 0, 0, 2, 0, '', '', 1, 6, 7, 1, 1, 1, 1432107804, 1, 1432619247, 0, 0, 0, 1432107804, 1, 'Уборка  помещений ', 0, 0, 0, 0, 0, 0, 0, 1),
(54, 'document', 'text/html', 'Дизайн, оформление, фотоуслуги ', 'Нужен дизайнер, оформитель или фотограф?', 'Обращайтесь к нам!', 'events', '', 1, 0, 0, 2, 0, '', '', 1, 6, 8, 1, 1, 1, 1432107835, 1, 1432539405, 0, 0, 0, 1432107835, 1, 'Дизайн, оформление, фотоуслуги ', 0, 0, 0, 0, 0, 0, 0, 1),
(55, 'document', 'text/html', 'Исполнитель поручений ', 'Не успеваете что-то сделать?', 'Поручите свои дела нам!', 'helper', '', 1, 0, 0, 2, 0, '', '', 1, 6, 9, 1, 1, 1, 1432107885, 1, 1432619188, 0, 0, 0, 1432107885, 1, 'Исполнитель поручений ', 0, 0, 0, 0, 0, 0, 0, 1),
(56, 'document', 'text/html', 'Выездной  автосервис ', 'Проблемы с автомобилем в пути?', 'Поможем в любой трудной ситуации!', 'auto', '', 1, 0, 0, 2, 0, '', '', 1, 6, 10, 1, 1, 1, 1432107910, 1, 1432539488, 0, 0, 0, 1432107910, 1, 'Выездной  автосервис ', 0, 0, 0, 0, 0, 0, 0, 1),
(57, 'document', 'text/html', 'Салон красоты  на выезд ', 'Нужны услуги парикмахера или визажиста?', 'Приедем в удобное для Вас время!', 'beuty', '', 1, 0, 0, 2, 0, '', '', 1, 6, 11, 1, 1, 1, 1432107934, 1, 1432539527, 0, 0, 0, 1432107934, 1, 'Салон красоты  на выезд ', 0, 0, 0, 0, 0, 0, 0, 1),
(2, 'document', 'text/html', 'Услуги', 'Услуги', '', 'services', '', 1, 0, 0, 0, 1, '', '[[Ditto? &amp;parents=`2` &amp;display=`2` &amp;removeChunk=`Comments` &amp;tpl=`ditto_blog` &amp;paginate=`1` &amp;extenders=`summary,dateFilter` &amp;paginateAlwaysShowLinks=`1` &amp;tagData=`documentTags`]]\r\n<p>Showing <strong>[+start+]</strong> - <strong>[+stop+]</strong> of <strong>[+total+]</strong> Articles</p>\r\n<div id="ditto_pages">[+previous+] [+pages+] [+next+]</div>\r\n<div id="ditto_pages">&nbsp;</div>\r\n[[Reflect? &amp;config=`wordpress` &amp;dittoSnippetParameters=`parents:2` &amp;id=`wp` &amp;getDocuments=`1`]]', 1, 5, 1, 0, 0, 1, 1144904400, 1, 1432102400, 0, 0, 0, 1432102371, 1, 'Услуги', 0, 0, 0, 0, 0, 0, 1, 1),
(4, 'document', 'text/html', '[*loginName*]', 'Login to Enable to Comments', '', 'login', '', 1, 0, 0, 0, 0, '', '<p>In order to comment on blog entries, you must be a registered user of [(site_name)]. If you haven''t already registered, you can  <a href="[~5~]">request an account</a>.</p>\n<div> [!WebLogin? &tpl=`WebLoginSideBar` &loginhomeid=`2`!] </div>', 1, 4, 9, 0, 0, 1, 1144904400, 1, 1144904400, 0, 0, 0, 0, 0, '[*loginName*]', 0, 0, 0, 0, 0, 0, 1, 1),
(5, 'document', 'text/html', 'Request an Account', 'Sign Up for Full Site Privileges', '', 'request-an-account', '', 1, 0, 0, 0, 0, '', '[[WebSignup? &amp;tpl=`FormSignup` &amp;groups=`Registered Users`]]', 1, 4, 9, 0, 0, 1, 1144904400, 1, 1432204032, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1, 1),
(6, 'document', 'text/html', 'Контакты', 'Контакты', '', 'contact-us', '', 1, 0, 0, 0, 0, '', '<p><strong>Адрес:</strong><br />070001 Республика Казахстан, Восточно-Казахстанская область<br />г. Усть-Каменогорск, ул. Ж. Малдыбаева, 1</p>\r\n<p></p>\r\n<p><strong><br /><br />Телефоны:<br /></strong>тел.: +7 (7172) 54 14 55<br />тел/факс.: +7 (7172) 54 16 12<br />+7 (701) 758 63 61<br />+7 (701) 729 07 98<br />+7 (747) 729 07 98</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Email:<br /></strong><a href="mailto:info@апрапр.kz">info@апрапр.kz<br /></a><a href="mailto:апрапр@mail.ru">апрапр@mail.ru</a><br /><a href="mailto:sdfdsfds@mail.ru">sdfdsfds@mail.ru</a></p>', 1, 8, 7, 1, 0, 1, 1144904400, 1, 1432204022, 0, 0, 0, 1432187548, 1, 'Контакты', 0, 0, 0, 0, 0, 0, 0, 1),
(7, 'document', 'text/html', '404 - страница не найдена', 'Упс... ошибка 404 (страница не найдена)', '', 'doc-not-found', '', 1, 0, 0, 0, 0, '', '<p>Похоже, что данной страницы не существует. Возможно, опечатка в адресе, возможно, она тут когда-то была, но уже удалена. Но ничего страшного. Можно быстро выбрать нужный раздел сайта:</p>\r\n[[Wayfinder? &amp;startId=`0` &amp;showDescription=`1`]]\r\n<h3>Или просто вернуться на <a href="http://test1.istyle.kz/">главную</a>&nbsp;и начать сначала.</h3>', 1, 7, 12, 0, 1, 1, 1144904400, 1, 1432726246, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1, 1),
(8, 'document', 'text/html', 'Search Results', 'Your Search Results', '', 'search-results', '', 1, 0, 0, 0, 0, '', '[!AjaxSearch? &showInputForm=`0` &ajaxSearch=`0`!]', 0, 4, 10, 0, 0, 1, 1144904400, 1, 1158613055, 0, 0, 0, 0, 0, '', 1, 0, 0, 0, 0, 0, 1, 1),
(59, 'document', 'text/html', 'Камент 1', 'Камент 1', '', '', '', 1, 0, 0, 1, 0, 'Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы! ', '<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>', 1, 7, 0, 1, 1, 1, 1432186038, 1, 1432186038, 0, 0, 0, 1432186038, 1, 'Камент 1', 0, 0, 0, 0, 0, 0, 1, 1),
(11, 'document', 'text/xml', 'RSS Feed', '[(site_name)] RSS Feed', '', 'feed.rss', '', 1, 0, 0, 0, 0, '', '[[Ditto? &parents=`2` &format=`rss` &display=`20` &total=`20` &removeChunk=`Comments`]]', 0, 0, 11, 0, 0, 1, 1144904400, 1, 1160062859, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1, 1),
(58, 'document', 'text/html', 'Жена на час (помощь по хозяйству) ', 'Нужно постирать, приготовить  или прибраться?', 'Мы поможем!', 'housewife', '', 1, 0, 0, 2, 0, '', '', 1, 6, 12, 1, 1, 1, 1432107960, 1, 1432619221, 0, 0, 0, 1432107960, 1, 'Жена на час (помощь по хозяйству) ', 0, 0, 0, 0, 0, 0, 0, 1),
(37, 'document', 'text/html', '[*loginName*]', 'The page you''re trying to reach requires a login', '', 'blog-login', '', 1, 0, 0, 0, 0, '', '<p>In order to add a blog entry, you must be logged in as a Site Admin webuser. Also, commenting on posts requires a login. <a href="[~6~]">Contact the site owner</a> for permissions to create new post, or <a href="[~5~]">create a web user account</a> to automatically receive commenting privileges. If you already have an account, please login below.</p>\n\n[!WebLogin? &tpl=`WebLoginSideBar` &loginhomeid=`3`!]', 1, 4, 8, 0, 0, 1, 1144904400, 1, 1158599931, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1, 1),
(46, 'document', 'text/html', 'Спасибо за Ваше обращение', '', '', 'thank-you', '', 1, 0, 0, 0, 0, '', '<h3 style="text-align: center;">Спасибо за Ваше обращение.</h3>\r\n<h3 style="text-align: center;">Мы обязательно с Вами свяжемся в самое ближайшее время<span style="color: #333333; font-size: 12px; line-height: 1.5;">.</span></h3>', 1, 7, 8, 1, 1, 1, 1159302141, 1, 1432725615, 0, 0, 0, 1159302182, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(60, 'document', 'text/html', 'Камент 2', 'Камент 2', '', '', '', 1, 0, 0, 1, 0, 'Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы! ', '<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>', 1, 7, 1, 1, 1, 1, 1432186065, 1, 1432186069, 0, 0, 0, 1432186065, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(61, 'document', 'text/html', 'Камент 3', 'Камент 3', '', '', '', 1, 0, 0, 1, 0, 'Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы! ', '<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>', 1, 7, 2, 1, 1, 1, 1432186085, 1, 1432186095, 0, 0, 0, 1432186085, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(62, 'document', 'text/html', 'Камент 4', 'Камент 4', '', '', '', 1, 0, 0, 1, 0, 'Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы! ', '<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!&nbsp;Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>', 1, 7, 3, 1, 1, 1, 1432186110, 1, 1432186110, 0, 0, 0, 1432186110, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(63, 'document', 'text/html', 'О сервисе', 'О сервисе', '', 'about', '', 1, 0, 0, 0, 0, '', '<h1>РЫБАТЕКСТ, ВСТРЕЧАЙТЕ!</h1>\r\n<h2>РЫБАТЕКСТ, ВСТРЕЧАЙТЕ!</h2>\r\n<h3>РЫБАТЕКСТ, ВСТРЕЧАЙТЕ!</h3>\r\n<p>Значимость этих проблем настолько очевидна, что рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации.</p>\r\n<div><strong>Значимость этих проблем настолько очевидна, что рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации.</strong></div>\r\n<blockquote>\r\n<p>Значимость этих проблем настолько очевидна, что рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации.</p>\r\n</blockquote>', 1, 7, 2, 1, 1, 1, 1432186265, 1, 1432187557, 0, 0, 0, 1432186265, 1, 'О сервисе', 0, 0, 0, 0, 0, 0, 0, 1),
(64, 'document', 'text/html', 'F.A.Q.', 'Частые вопросы', '', '', '', 1, 0, 0, 0, 0, '', '[!multiTV?\r\n&tvName=`faq`\r\n&docid=`[*id*]`\r\n&display=`all`\r\n&rows=`all`\r\n&orderBy=`question`\r\n&firstClass=`first`\r\n&lastClass=`last`\r\n!]\r\n<script>\r\n	$(document).ready(function(){\r\n		$(''.question'').click(function(){\r\n			$(''.answer'').not($(this).next()).slideUp();\r\n			$(this).next().slideToggle();\r\n		});\r\n	});\r\n</script>', 0, 7, 4, 1, 1, 1, 1432201369, 1, 1432617615, 0, 0, 0, 1432201369, 1, 'F.A.Q.', 0, 0, 0, 0, 0, 0, 0, 1),
(65, 'document', 'text/html', 'Как стать исполнителем?', 'Ищете работу мечты?', 'Работайте вместе с нами!', '', '', 1, 0, 0, 0, 0, '', '', 1, 9, 5, 1, 1, 1, 1432201395, 1, 1432204641, 0, 0, 0, 1432201395, 1, 'Как стать исполнителем?', 0, 0, 0, 0, 0, 0, 0, 1),
(66, 'document', 'text/html', 'Услуги', 'Услуги', '', 'services', '', 1, 0, 0, 0, 0, '', '', 1, 11, 6, 1, 1, 1, 1432204011, 1, 1432291303, 0, 0, 0, 1432204011, 1, 'Услуги', 0, 0, 0, 0, 0, 0, 0, 1),
(67, 'document', 'text/html', 'Главная', '', '', '', '', 1, 0, 0, 0, 0, '', '', 1, 12, 17, 1, 1, 1, 1432639739, 1, 1432639817, 0, 0, 0, 1432639739, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(68, 'document', 'text/html', 'Оферта', 'Оферта', '', 'oferta', '', 1, 0, 0, 0, 0, '', '<p><b>Офе́рта</b>&nbsp;(<a href="https://ru.wikipedia.org/wiki/%D0%9B%D0%B0%D1%82%D0%B8%D0%BD%D1%81%D0%BA%D0%B8%D0%B9_%D1%8F%D0%B7%D1%8B%D0%BA" title="Латинский язык">лат.</a>&nbsp;<i><span lang="la" xml:lang="la">offero</span></i>&nbsp;&mdash; предлагаю)&nbsp;&mdash; предложение о заключении сделки, в котором изложены&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%A1%D1%83%D1%89%D0%B5%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5_%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D1%8F_%D0%B4%D0%BE%D0%B3%D0%BE%D0%B2%D0%BE%D1%80%D0%B0" title="Существенные условия договора">существенные условия договора</a>, адресованное определённому лицу, ограниченному или неограниченному кругу лиц. Если получатель (адресат) принимает оферту (выражает согласие,&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%90%D0%BA%D1%86%D0%B5%D0%BF%D1%82" title="Акцепт">акцептует</a>&nbsp;её), это означает заключение между сторонами предложенного договора на оговоренных в оферте условиях. Оферта может быть письменной или устной.</p>\r\n<p>Направление (выпуск, публикация) оферты обязывает направившее ее лицо заключить указанный в оферте договор с акцептантом (или любым из группы акцептантов).</p>\r\n<h2><span class="mw-headline" id=".D0.97.D0.B0.D0.BA.D0.BE.D0.BD.D0.BE.D0.B4.D0.B0.D1.82.D0.B5.D0.BB.D1.8C.D0.BD.D0.BE.D0.B5_.D0.BE.D0.BF.D1.80.D0.B5.D0.B4.D0.B5.D0.BB.D0.B5.D0.BD.D0.B8.D0.B5">Законодательное определение</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;veaction=edit&amp;vesection=1" title="Редактировать раздел &laquo;Законодательное определение&raquo;" class="mw-editsection-visualeditor">править</a><span class="mw-editsection-divider">&nbsp;|&nbsp;</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;action=edit&amp;section=1" title="Редактировать раздел &laquo;Законодательное определение&raquo;">править вики-текст</a><span class="mw-editsection-bracket">]</span></span></h2>\r\n<p>Согласно пункту 1&nbsp;<a href="https://en.wikisource.org/wiki/ru:%D0%93%D1%80%D0%B0%D0%B6%D0%B4%D0%B0%D0%BD%D1%81%D0%BA%D0%B8%D0%B9_%D0%BA%D0%BE%D0%B4%D0%B5%D0%BA%D1%81_%D0%A0%D0%A4/%D0%93%D0%BB%D0%B0%D0%B2%D0%B0_28#.D0.A1.D1.82.D0.B0.D1.82.D1.8C.D1.8F_435._.D0.9E.D1.84.D0.B5.D1.80.D1.82.D0.B0" class="extiw" title="wikisource:ru:Гражданский кодекс РФ/Глава 28">статьи 435 Гражданского кодекса РФ</a>&nbsp;офертой признаётся адресованное одному или нескольким конкретным лицам предложение, которое достаточно определённо и выражает намерение лица, сделавшего предложение, считать себя заключившим договор с адресатом, которым будет принято предложение. Оферта должна содержать существенные условия договора.</p>\r\n<p>Ст. 11 Федерального закона О рекламе&raquo; гласит: &laquo;Если в соответствии с Гражданским кодексом Российской Федерации реклама признается офертой, такая оферта действует в течение двух месяцев со дня распространения рекламы при условии, что в ней не указан иной срок&raquo;.</p>\r\n<p>Во многих европейских странах оферта должна содержать все&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%A1%D1%83%D1%89%D0%B5%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5_%D1%83%D1%81%D0%BB%D0%BE%D0%B2%D0%B8%D1%8F_%D0%B4%D0%BE%D0%B3%D0%BE%D0%B2%D0%BE%D1%80%D0%B0" title="Существенные условия договора">существенные условия договора</a>&nbsp;(например, в договоре купли-продажи существенным является предмет и цена). В&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%90%D0%BD%D0%B3%D0%BB%D0%BE-%D0%B0%D0%BC%D0%B5%D1%80%D0%B8%D0%BA%D0%B0%D0%BD%D1%81%D0%BA%D0%BE%D0%B5_%D0%BF%D1%80%D0%B0%D0%B2%D0%BE" title="Англо-американское право" class="mw-redirect">англо-американском праве</a>&nbsp;оферта должна быть не столько определённой, сколько определимой, то есть получатель должен иметь возможность понимать все существенные условия, но сами они могут не оговариваться. Например, цена в оферте может не указываться, и если такая оферта акцептуется, то договор считается заключённым на условиях &laquo;разумной цены&raquo;.</p>\r\n<h2><span class="mw-headline" id=".D0.9E.D1.81.D0.BE.D0.B1.D0.B5.D0.BD.D0.BD.D0.BE.D1.81.D1.82.D0.B8_.D0.B2.D1.81.D1.82.D1.83.D0.BF.D0.BB.D0.B5.D0.BD.D0.B8.D1.8F_.D0.B4.D0.BE.D0.B3.D0.BE.D0.B2.D0.BE.D1.80.D0.B0_.D0.B2_.D1.81.D0.B8.D0.BB.D1.83">Особенности вступления договора в силу</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;veaction=edit&amp;vesection=2" title="Редактировать раздел &laquo;Особенности вступления договора в силу&raquo;" class="mw-editsection-visualeditor">править</a><span class="mw-editsection-divider">&nbsp;|&nbsp;</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;action=edit&amp;section=2" title="Редактировать раздел &laquo;Особенности вступления договора в силу&raquo;">править вики-текст</a><span class="mw-editsection-bracket">]</span></span></h2>\r\n<p>Согласно статьям 440, 441 Гражданского кодекса РФ договор считается заключённым после того, как лицо, направившее оферту, получает согласие (акцепт). В англо-американском праве действует &laquo;правило почтового ящика&raquo;: договор считается заключённым в момент, когда акцептант опустил свой акцепт в почтовый ящик независимо от того, в какой срок будет получено данное письмо. Различия в трактовке момента заключения договора влияют на распределение риска несвоевременного получения ответа или утери корреспонденции.</p>\r\n<p>В оферте можно заранее явно указать порядок определения времени заключения договора, чтобы не возникало разночтений из-за традиций разных стран.</p>\r\n<p>Если нет специальных оговорок, то молчание акцептом не признаётся.</p>\r\n<h2><span class="mw-headline" id=".D0.92.D0.B8.D0.B4.D1.8B_.D0.BE.D1.84.D0.B5.D1.80.D1.82">Виды оферт</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;veaction=edit&amp;vesection=3" title="Редактировать раздел &laquo;Виды оферт&raquo;" class="mw-editsection-visualeditor">править</a><span class="mw-editsection-divider">&nbsp;|&nbsp;</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;action=edit&amp;section=3" title="Редактировать раздел &laquo;Виды оферт&raquo;">править вики-текст</a><span class="mw-editsection-bracket">]</span></span></h2>\r\n<h3><span class="mw-headline" id=".D0.9F.D1.83.D0.B1.D0.BB.D0.B8.D1.87.D0.BD.D0.B0.D1.8F_.D0.BE.D1.84.D0.B5.D1.80.D1.82.D0.B0">Публичная оферта</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;veaction=edit&amp;vesection=4" title="Редактировать раздел &laquo;Публичная оферта&raquo;" class="mw-editsection-visualeditor">править</a><span class="mw-editsection-divider">&nbsp;|&nbsp;</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;action=edit&amp;section=4" title="Редактировать раздел &laquo;Публичная оферта&raquo;">править вики-текст</a><span class="mw-editsection-bracket">]</span></span></h3>\r\n<p>Адресованное неопределённому кругу лиц и содержащее все существенные условия договора предложение, из которого усматривается воля оферента заключить договор на указанных в предложении условиях с любым, кто отзовётся. Лицо, совершившее необходимые действия в целях акцепта публичной оферты (например, приславшее заявку на соответствующие товары), вправе требовать от оферента исполнения договорных обязательств.</p>\r\n<h4><span class="mw-headline" id=".D0.9E.D1.84.D0.B5.D1.80.D1.82.D0.B0_.D0.B8_.D1.80.D0.B5.D0.BA.D0.BB.D0.B0.D0.BC.D0.B0">Оферта и реклама</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;veaction=edit&amp;vesection=5" title="Редактировать раздел &laquo;Оферта и реклама&raquo;" class="mw-editsection-visualeditor">править</a><span class="mw-editsection-divider">&nbsp;|&nbsp;</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;action=edit&amp;section=5" title="Редактировать раздел &laquo;Оферта и реклама&raquo;">править вики-текст</a><span class="mw-editsection-bracket">]</span></span></h4>\r\n<p>В законодательстве по всему миру рекламу не считают офертой. Чаще всего реклама трактуется как приглашение к переговорам, готовность принимать предложения (п.1 ст.437 ГК РФ). Но в настоящее время в законодательстве ряда стран и в судебной практике случаи, если реклама содержит сведения, вводящие в заблуждение в отношении предмета, цены и&nbsp;т.&nbsp;п., такое рекламное объявление может быть рассмотрено как оферта. Соответственно, договор считается заключённым на условиях, изложенных в рекламе и ответственность по нему несёт рекламодатель (изготовитель или продавец).</p>\r\n<h3><span class="mw-headline" id=".D0.A1.D0.B2.D0.BE.D0.B1.D0.BE.D0.B4.D0.BD.D0.B0.D1.8F_.D0.BE.D1.84.D0.B5.D1.80.D1.82.D0.B0">Свободная оферта</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;veaction=edit&amp;vesection=6" title="Редактировать раздел &laquo;Свободная оферта&raquo;" class="mw-editsection-visualeditor">править</a><span class="mw-editsection-divider">&nbsp;|&nbsp;</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;action=edit&amp;section=6" title="Редактировать раздел &laquo;Свободная оферта&raquo;">править вики-текст</a><span class="mw-editsection-bracket">]</span></span></h3>\r\n<p>Оферта, которая делается (предлагается) нескольким покупателям и используется продавцом для предварительного изучения рынка.</p>\r\n<h3><span class="mw-headline" id=".D0.A2.D0.B2.D1.91.D1.80.D0.B4.D0.B0.D1.8F_.D0.BE.D1.84.D0.B5.D1.80.D1.82.D0.B0">Твёрдая оферта</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;veaction=edit&amp;vesection=7" title="Редактировать раздел &laquo;Твёрдая оферта&raquo;" class="mw-editsection-visualeditor">править</a><span class="mw-editsection-divider">&nbsp;|&nbsp;</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;action=edit&amp;section=7" title="Редактировать раздел &laquo;Твёрдая оферта&raquo;">править вики-текст</a><span class="mw-editsection-bracket">]</span></span></h3>\r\n<p>Оферта, которая делается (предлагается) продавцом одному возможному, потенциальному покупателю с указанием срока, в течение которого продавец связан обязательством продажи. Сделка считается совершённой, если за этот срок последует&nbsp;<a href="https://ru.wikipedia.org/wiki/%D0%90%D0%BA%D1%86%D0%B5%D0%BF%D1%82" title="Акцепт">акцепт</a>&nbsp;(согласие) покупателя.</p>\r\n<h3><span class="mw-headline" id=".D0.91.D0.B5.D0.B7.D0.BE.D1.82.D0.B7.D1.8B.D0.B2.D0.BD.D0.B0.D1.8F_.D0.BE.D1.84.D0.B5.D1.80.D1.82.D0.B0">Безотзывная оферта</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;veaction=edit&amp;vesection=8" title="Редактировать раздел &laquo;Безотзывная оферта&raquo;" class="mw-editsection-visualeditor">править</a><span class="mw-editsection-divider">&nbsp;|&nbsp;</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;action=edit&amp;section=8" title="Редактировать раздел &laquo;Безотзывная оферта&raquo;">править вики-текст</a><span class="mw-editsection-bracket">]</span></span></h3>\r\n<p>Безотзывная оферта подразумевает заключение договора оферентом на объявленных условиях со всеми желающими без возможности отмены ранее сделанного предложения, то есть его отзыва. Безотзывная оферта часто используется компаниями-эмитентами в предложениях по выкупу или погашению ценных бумаг в отношении своих акционеров<sup id="cite_ref-1" class="reference"><a href="https://ru.wikipedia.org/wiki/%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0#cite_note-1">[1]</a></sup>.</p>\r\n<h2><span class="mw-headline" id=".D0.9E.D0.B1.D0.BB.D0.B8.D0.B3.D0.B0.D1.86.D0.B8.D0.B8_.D1.81_.D0.BE.D1.84.D0.B5.D1.80.D1.82.D0.BE.D0.B9">Облигации с офертой</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;veaction=edit&amp;vesection=9" title="Редактировать раздел &laquo;Облигации с офертой&raquo;" class="mw-editsection-visualeditor">править</a><span class="mw-editsection-divider">&nbsp;|&nbsp;</span><a href="https://ru.wikipedia.org/w/index.php?title=%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0&amp;action=edit&amp;section=9" title="Редактировать раздел &laquo;Облигации с офертой&raquo;">править вики-текст</a><span class="mw-editsection-bracket">]</span></span></h2>\r\n<p>Многие эмитенты вводят оферты для своих облигаций, то есть возможность досрочного погашения ценной бумаги по заранее оговоренной цене.</p>\r\n<p>Для долгосрочных облигаций оферта может быть средством, с помощью которого инвестор и эмитент могут регулировать доходность ценных бумаг. В некоторых случаях выплата по купонам облигаций может быть меньше, чем ее рыночная цена, с помощью оферты облигации эмитент может регулировать доходность этой ценной бумаги.</p>\r\n<p>Дата оферты облигации определяется заранее и не подлежит изменению. Таким образом, с помощью оферты облигации инвестор может регулировать кредитный риск, а эмитент&nbsp;&mdash; процентный риск. Цена выкупа облигации по оферте определяется на основе договорённости эмитента и инвестора, и может быть как выше, так и ниже рыночной стоимости. Порядок выкупа облигации в соответствии с офертой определяется в договоре, который эмитент заключает с инвестором<sup id="cite_ref-2" class="reference"><a href="https://ru.wikipedia.org/wiki/%D0%9E%D1%84%D0%B5%D1%80%D1%82%D0%B0#cite_note-2">[2]</a></sup>.</p>', 1, 7, 18, 1, 1, 1, 1432726836, 1, 1432726842, 0, 0, 0, 1432726836, 1, 'Оферта', 0, 0, 0, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_content_metatags`
--

CREATE TABLE IF NOT EXISTS `srv_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `metatag_id` (`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reference table between meta tags and content';

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_htmlsnippets`
--

CREATE TABLE IF NOT EXISTS `srv_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.' AUTO_INCREMENT=40 ;

--
-- Дамп данных таблицы `srv_site_htmlsnippets`
--

INSERT INTO `srv_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`) VALUES
(1, 'mm_rules', 'Default ManagerManager rules.', 0, 2, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\n\nif ($modx->db->getValue($modx->db->select(''count(id)'', $modx->getFullTableName(''site_tmplvars''), "name=''documentTags''"))) {\n	mm_widget_tags(''documentTags'', '' ''); // Give blog tag editing capabilities to the ''documentTags (3)'' TV\n}\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\n', 0),
(2, 'WebLoginSideBar', 'WebLogin Tpl', 0, 3, 0, '<!-- #declare:separator <hr> -->\n<!-- login form section-->\n<form method="post" name="loginfrm" action="[+action+]">\n    <input type="hidden" value="[+rememberme+]" name="rememberme" />\n    <fieldset>\n        <h3>Your Login Details</h3>\n        <label for="username">User: <input type="text" name="username" id="username" tabindex="1" onkeypress="return webLoginEnter(document.loginfrm.password);" value="[+username+]" /></label>\n    	<label for="password">Password: <input type="password" name="password" id="password" tabindex="2" onkeypress="return webLoginEnter(document.loginfrm.cmdweblogin);" value="" /></label>\n    	<input type="checkbox" id="checkbox_1" name="checkbox_1" tabindex="3" size="1" value="" [+checkbox+] onclick="webLoginCheckRemember()" /><label for="checkbox_1" class="checkbox">Remember me</label>\n    	<input type="submit" value="[+logintext+]" name="cmdweblogin" class="button" />\n	<a href="#" onclick="webLoginShowForm(2);return false;" id="forgotpsswd">Forget Your Password?</a>\n	</fieldset>\n</form>\n<hr>\n<!-- log out hyperlink section -->\n<h4>You''re already logged in</h4>\nDo you wish to <a href="[+action+]" class="button">[+logouttext+]</a>?\n<hr>\n<!-- Password reminder form section -->\n<form name="loginreminder" method="post" action="[+action+]">\n    <fieldset>\n        <h3>It happens to everyone...</h3>\n        <input type="hidden" name="txtpwdrem" value="0" />\n        <label for="txtwebemail">Enter the email address of your account to reset your password: <input type="text" name="txtwebemail" id="txtwebemail" size="24" /></label>\n        <label>To return to the login form, press the cancel button.</label>\n    	<input type="submit" value="Submit" name="cmdweblogin" class="button" /> <input type="reset" value="Cancel" name="cmdcancel" onclick="webLoginShowForm(1);" class="button" style="clear:none;display:inline" />\n    </fieldset>\n</form>\n\n', 0),
(4, 'FormSignup', 'For the weblogin signup', 0, 2, 0, '<!-- #declare:separator <hr> --> \r\n<!-- login form section-->\r\n<form id="websignupfrm" method="post" name="websignupfrm" action="[+action+]">\r\n    <fieldset>\r\n        <h3>User Details</h3>\r\n        <p>Items marked by * are required</p>\r\n		<label for="su_username">User name:* <input type="text" name="username" id="su_username" class="inputBox" size="20" maxlength="30" value="[+username+]" /></label>\r\n        <label for="fullname">Full name: <input type="text" name="fullname" id="fullname" class="inputBox" size="20" maxlength="100" value="[+fullname+]" /></label>\r\n		<label for="email">Email address:* <input type="text" name="email" id="email" class="inputBox" size="20" value="[+email+]" /></label>\r\n	</fieldset>\r\n	\r\n	<fieldset>\r\n	    <h3>Password</h3>\r\n	    <label for="su_password">Password:* <input type="password" name="password" id="su_password" class="inputBox" size="20" /></label>\r\n	    <label for="confirmpassword">Confirm password:* <input type="password" name="confirmpassword" id="confirmpassword" class="inputBox" size="20" /></label>\r\n	</fieldset>\r\n	\r\n	<fieldset>\r\n		<h3>Optional Account Profile Info</h3>\r\n		<label for="country">Country:</label>\r\n		<select size="1" name="country" id="country">\r\n			<option value="" selected="selected">&nbsp;</option>\r\n			<option value="1">Afghanistan</option>\r\n			<option value="2">Albania</option>\r\n			<option value="3">Algeria</option>\r\n			<option value="4">American Samoa</option>\r\n			<option value="5">Andorra</option>\r\n			<option value="6">Angola</option>\r\n			<option value="7">Anguilla</option>\r\n			<option value="8">Antarctica</option>\r\n			<option value="9">Antigua and Barbuda</option>\r\n			<option value="10">Argentina</option>\r\n			<option value="11">Armenia</option>\r\n			<option value="12">Aruba</option>\r\n			<option value="13">Australia</option>\r\n			<option value="14">Austria</option>\r\n			<option value="15">Azerbaijan</option>\r\n			<option value="16">Bahamas</option>\r\n			<option value="17">Bahrain</option>\r\n			<option value="18">Bangladesh</option>\r\n			<option value="19">Barbados</option>\r\n			<option value="20">Belarus</option>\r\n			<option value="21">Belgium</option>\r\n			<option value="22">Belize</option>\r\n			<option value="23">Benin</option>\r\n			<option value="24">Bermuda</option>\r\n			<option value="25">Bhutan</option>\r\n			<option value="26">Bolivia</option>\r\n			<option value="27">Bosnia and Herzegowina</option>\r\n			<option value="28">Botswana</option>\r\n			<option value="29">Bouvet Island</option>\r\n			<option value="30">Brazil</option>\r\n			<option value="31">British Indian Ocean Territory</option>\r\n			<option value="32">Brunei Darussalam</option>\r\n			<option value="33">Bulgaria</option>\r\n			<option value="34">Burkina Faso</option>\r\n			<option value="35">Burundi</option>\r\n			<option value="36">Cambodia</option>\r\n			<option value="37">Cameroon</option>\r\n			<option value="38">Canada</option>\r\n			<option value="39">Cape Verde</option>\r\n			<option value="40">Cayman Islands</option>\r\n			<option value="41">Central African Republic</option>\r\n			<option value="42">Chad</option>\r\n			<option value="43">Chile</option>\r\n			<option value="44">China</option>\r\n			<option value="45">Christmas Island</option>\r\n			<option value="46">Cocos (Keeling) Islands</option>\r\n			<option value="47">Colombia</option>\r\n			<option value="48">Comoros</option>\r\n			<option value="49">Congo</option>\r\n			<option value="50">Cook Islands</option>\r\n			<option value="51">Costa Rica</option>\r\n			<option value="52">Cote D&#39;Ivoire</option>\r\n			<option value="53">Croatia</option>\r\n			<option value="54">Cuba</option>\r\n			<option value="55">Cyprus</option>\r\n			<option value="56">Czech Republic</option>\r\n			<option value="57">Denmark</option>\r\n			<option value="58">Djibouti</option>\r\n			<option value="59">Dominica</option>\r\n			<option value="60">Dominican Republic</option>\r\n			<option value="61">East Timor</option>\r\n			<option value="62">Ecuador</option>\r\n			<option value="63">Egypt</option>\r\n			<option value="64">El Salvador</option>\r\n			<option value="65">Equatorial Guinea</option>\r\n			<option value="66">Eritrea</option>\r\n			<option value="67">Estonia</option>\r\n			<option value="68">Ethiopia</option>\r\n			<option value="69">Falkland Islands (Malvinas)</option>\r\n			<option value="70">Faroe Islands</option>\r\n			<option value="71">Fiji</option>\r\n			<option value="72">Finland</option>\r\n			<option value="73">France</option>\r\n			<option value="74">France, Metropolitan</option>\r\n			<option value="75">French Guiana</option>\r\n			<option value="76">French Polynesia</option>\r\n			<option value="77">French Southern Territories</option>\r\n			<option value="78">Gabon</option>\r\n			<option value="79">Gambia</option>\r\n			<option value="80">Georgia</option>\r\n			<option value="81">Germany</option>\r\n			<option value="82">Ghana</option>\r\n			<option value="83">Gibraltar</option>\r\n			<option value="84">Greece</option>\r\n			<option value="85">Greenland</option>\r\n			<option value="86">Grenada</option>\r\n			<option value="87">Guadeloupe</option>\r\n			<option value="88">Guam</option>\r\n			<option value="89">Guatemala</option>\r\n			<option value="90">Guinea</option>\r\n			<option value="91">Guinea-bissau</option>\r\n			<option value="92">Guyana</option>\r\n			<option value="93">Haiti</option>\r\n			<option value="94">Heard and Mc Donald Islands</option>\r\n			<option value="95">Honduras</option>\r\n			<option value="96">Hong Kong</option>\r\n			<option value="97">Hungary</option>\r\n			<option value="98">Iceland</option>\r\n			<option value="99">India</option>\r\n			<option value="100">Indonesia</option>\r\n			<option value="101">Iran (Islamic Republic of)</option>\r\n			<option value="102">Iraq</option>\r\n			<option value="103">Ireland</option>\r\n			<option value="104">Israel</option>\r\n			<option value="105">Italy</option>\r\n			<option value="106">Jamaica</option>\r\n			<option value="107">Japan</option>\r\n			<option value="108">Jordan</option>\r\n			<option value="109">Kazakhstan</option>\r\n			<option value="110">Kenya</option>\r\n			<option value="111">Kiribati</option>\r\n			<option value="112">Korea, Democratic People&#39;s Republic of</option>\r\n			<option value="113">Korea, Republic of</option>\r\n			<option value="114">Kuwait</option>\r\n			<option value="115">Kyrgyzstan</option>\r\n			<option value="116">Lao People&#39;s Democratic Republic</option>\r\n			<option value="117">Latvia</option>\r\n			<option value="118">Lebanon</option>\r\n			<option value="119">Lesotho</option>\r\n			<option value="120">Liberia</option>\r\n			<option value="121">Libyan Arab Jamahiriya</option>\r\n			<option value="122">Liechtenstein</option>\r\n			<option value="123">Lithuania</option>\r\n			<option value="124">Luxembourg</option>\r\n			<option value="125">Macau</option>\r\n			<option value="126">Macedonia, The Former Yugoslav Republic of</option>\r\n			<option value="127">Madagascar</option>\r\n			<option value="128">Malawi</option>\r\n			<option value="129">Malaysia</option>\r\n			<option value="130">Maldives</option>\r\n			<option value="131">Mali</option>\r\n			<option value="132">Malta</option>\r\n			<option value="133">Marshall Islands</option>\r\n			<option value="134">Martinique</option>\r\n			<option value="135">Mauritania</option>\r\n			<option value="136">Mauritius</option>\r\n			<option value="137">Mayotte</option>\r\n			<option value="138">Mexico</option>\r\n			<option value="139">Micronesia, Federated States of</option>\r\n			<option value="140">Moldova, Republic of</option>\r\n			<option value="141">Monaco</option>\r\n			<option value="142">Mongolia</option>\r\n			<option value="143">Montserrat</option>\r\n			<option value="144">Morocco</option>\r\n			<option value="145">Mozambique</option>\r\n			<option value="146">Myanmar</option>\r\n			<option value="147">Namibia</option>\r\n			<option value="148">Nauru</option>\r\n			<option value="149">Nepal</option>\r\n			<option value="150">Netherlands</option>\r\n			<option value="151">Netherlands Antilles</option>\r\n			<option value="152">New Caledonia</option>\r\n			<option value="153">New Zealand</option>\r\n			<option value="154">Nicaragua</option>\r\n			<option value="155">Niger</option>\r\n			<option value="156">Nigeria</option>\r\n			<option value="157">Niue</option>\r\n			<option value="158">Norfolk Island</option>\r\n			<option value="159">Northern Mariana Islands</option>\r\n			<option value="160">Norway</option>\r\n			<option value="161">Oman</option>\r\n			<option value="162">Pakistan</option>\r\n			<option value="163">Palau</option>\r\n			<option value="164">Panama</option>\r\n			<option value="165">Papua New Guinea</option>\r\n			<option value="166">Paraguay</option>\r\n			<option value="167">Peru</option>\r\n			<option value="168">Philippines</option>\r\n			<option value="169">Pitcairn</option>\r\n			<option value="170">Poland</option>\r\n			<option value="171">Portugal</option>\r\n			<option value="172">Puerto Rico</option>\r\n			<option value="173">Qatar</option>\r\n			<option value="174">Reunion</option>\r\n			<option value="175">Romania</option>\r\n			<option value="176">Russian Federation</option>\r\n			<option value="177">Rwanda</option>\r\n			<option value="178">Saint Kitts and Nevis</option>\r\n			<option value="179">Saint Lucia</option>\r\n			<option value="180">Saint Vincent and the Grenadines</option>\r\n			<option value="181">Samoa</option>\r\n			<option value="182">San Marino</option>\r\n			<option value="183">Sao Tome and Principe</option>\r\n			<option value="184">Saudi Arabia</option>\r\n			<option value="185">Senegal</option>\r\n			<option value="186">Seychelles</option>\r\n			<option value="187">Sierra Leone</option>\r\n			<option value="188">Singapore</option>\r\n			<option value="189">Slovakia (Slovak Republic)</option>\r\n			<option value="190">Slovenia</option>\r\n			<option value="191">Solomon Islands</option>\r\n			<option value="192">Somalia</option>\r\n			<option value="193">South Africa</option>\r\n			<option value="194">South Georgia and the South Sandwich Islands</option>\r\n			<option value="195">Spain</option>\r\n			<option value="196">Sri Lanka</option>\r\n			<option value="197">St. Helena</option>\r\n			<option value="198">St. Pierre and Miquelon</option>\r\n			<option value="199">Sudan</option>\r\n			<option value="200">Suriname</option>\r\n			<option value="201">Svalbard and Jan Mayen Islands</option>\r\n			<option value="202">Swaziland</option>\r\n			<option value="203">Sweden</option>\r\n			<option value="204">Switzerland</option>\r\n			<option value="205">Syrian Arab Republic</option>\r\n			<option value="206">Taiwan</option>\r\n			<option value="207">Tajikistan</option>\r\n			<option value="208">Tanzania, United Republic of</option>\r\n			<option value="209">Thailand</option>\r\n			<option value="210">Togo</option>\r\n			<option value="211">Tokelau</option>\r\n			<option value="212">Tonga</option>\r\n			<option value="213">Trinidad and Tobago</option>\r\n			<option value="214">Tunisia</option>\r\n			<option value="215">Turkey</option>\r\n			<option value="216">Turkmenistan</option>\r\n			<option value="217">Turks and Caicos Islands</option>\r\n			<option value="218">Tuvalu</option>\r\n			<option value="219">Uganda</option>\r\n			<option value="220">Ukraine</option>\r\n			<option value="221">United Arab Emirates</option>\r\n			<option value="222">United Kingdom</option>\r\n			<option value="223">United States</option>\r\n			<option value="224">United States Minor Outlying Islands</option>\r\n			<option value="225">Uruguay</option>\r\n			<option value="226">Uzbekistan</option>\r\n			<option value="227">Vanuatu</option>\r\n			<option value="228">Vatican City State (Holy See)</option>\r\n			<option value="229">Venezuela</option>\r\n			<option value="230">Viet Nam</option>\r\n			<option value="231">Virgin Islands (British)</option>\r\n			<option value="232">Virgin Islands (U.S.)</option>\r\n			<option value="233">Wallis and Futuna Islands</option>\r\n			<option value="234">Western Sahara</option>\r\n			<option value="235">Yemen</option>\r\n			<option value="236">Yugoslavia</option>\r\n			<option value="237">Zaire</option>\r\n			<option value="238">Zambia</option>\r\n			<option value="239">Zimbabwe</option>\r\n			</select>\r\n        </fieldset>\r\n        \r\n        <fieldset>\r\n            <h3>Bot-Patrol</h3>\r\n            <p>Enter the word/number combination shown in the image below.</p>\r\n            <p><a href="[+action+]"><img align="top" src="[(site_manager_url)]includes/veriword.php" width="148" height="60" alt="If you have trouble reading the code, click on the code itself to generate a new random code." style="border: 1px solid #039" /></a></p>\r\n        <label>Form code:* \r\n            <input type="text" name="formcode" class="inputBox" size="20" /></label>\r\n            </fieldset>\r\n        \r\n        <fieldset>\r\n            <input type="submit" value="Submit" name="cmdwebsignup" />\r\n	</fieldset>\r\n</form>\r\n\r\n<script language="javascript" type="text/javascript"> \r\n	var id = "[+country+]";\r\n	var f = document.websignupfrm;\r\n	var i = parseInt(id);	\r\n	if (!isNaN(i)) f.country.options[i].selected = true;\r\n</script>\r\n<hr>\r\n<!-- notification section -->\r\n<p class="message">Signup completed successfully!<br />\r\nYour account was created. A copy of your signup information was sent to your email address.</p>\r\n', 0),
(6, 'nl_sidebar', 'Default Template TPL for Ditto', 0, 1, 0, '<strong><a href="[~[+id+]~]" title="[+title+]">[+title+]</a></strong><br />\r\n[+longtitle+]<br /><br />', 0),
(8, 'ditto_blog', 'Blog Template', 0, 1, 0, '<div class="ditto_summaryPost">\r\n  <h3><a href="[~[+id+]~]" title="[+title+]">[+title+]</a></h3>\r\n  <div class="ditto_info" >By <strong>[+author+]</strong> on [+date+]. <a  href="[~[+id+]~]#commentsAnchor">Comments\r\n  ([!Jot?&docid=`[+id+]`&action=`count-comments`!])</a></div><div class="ditto_tags">Tags: [+tagLinks+]</div>\r\n  [+summary+]\r\n  <p class="ditto_link">[+link+]</p>\r\n</div>', 0),
(9, 'footer', '', 0, 0, 0, '<div id="footer">\r\n		<div id="wrapper">\r\n			<div class="navbottom">\r\n				<h3>меню</h3>\r\n				[[Wayfinder?startId=`0` &outerTpl=`mh.OuterTpl` &innerTpl=`mh.InnerTpl` &rowTpl=`mh.RowTpl` &innerRowTpl=`mh.InnerRowTpl` &firstClass=`first` &hereClass=`active` &includeDocs=`1,63,64`]]\r\n				[[Wayfinder?startId=`0` &outerTpl=`mh.OuterTpl` &innerTpl=`mh.InnerTpl` &rowTpl=`mh.RowTpl` &innerRowTpl=`mh.InnerRowTpl` &firstClass=`first` &hereClass=`active` &includeDocs=`65,66,6`]]\r\n			</div>\r\n			\r\n			<div class="bottomlogo"><a id="logo" href="[~[(site_start)]~]" title="[(site_name)]">Мир Услуг</a></div>\r\n			<div class="copy">© 2015 Мир услуг</div>\r\n			\r\n			<div class="footercont">ГОРЯЧАЯ ЛИНИЯ С 9:00 ДО 22:00<br /><span>[!city_info? &value=`phone`!]</span></div>\r\n			\r\n			<div class="social">\r\n				мы в соцсетях<br />\r\n				<script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script><div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="small" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir" data-yashareTheme="counter"></div>\r\n			</div>\r\n			\r\n			<div id="istyle">\r\n				<a href="http://istyle.kz" target="blank"><img src="assets/templates/serv/images/istyle.png" /></a><span class="txt">Сделано в студии <a href="http://istyle.kz" target="blank"> iStyle</a><br /><a href="http://istyle.kz/portfolio/eshop/kozy.html" target="blank">Подробнее о проекте</a></span>\r\n			</div>\r\n			\r\n		</div>\r\n	</div>', 0),
(10, 'meta', 'Site Template Meta', 0, 1, 0, '<p><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional">Valid <abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a></p>                	<p><a href="http://jigsaw.w3.org/css-validator/check/referer" title="This page uses valid Cascading Stylesheets" rel="external">Valid <abbr title="W3C Cascading Stylesheets">css</abbr></a></p>				    <p><a href="http://modx.com/" title="Powered by MODX, Do more with less.">MOD<strong>x</strong></a></p>', 0),
(11, 'mh.InnerRowTpl', 'Inner row template for MODXHost top menu', 0, 1, 0, '<a href="[+wf.link+]" title="[+wf.title+]"><li[+wf.classes+]>[+wf.linktext+][+wf.wrapper+]</li></a>', 0),
(12, 'mh.InnerTpl', 'Inner nesting template for MODXHost top menu', 0, 1, 0, '<ul style="display:none">\r\n  [+wf.wrapper+]\r\n</ul>', 0),
(13, 'mh.OuterTpl', 'Outer nesting template for MODXHost top menu', 0, 1, 0, '<ul>\r\n    [+wf.wrapper+]\r\n  </ul>', 0),
(14, 'mh.RowTpl', 'Row template for MODXHost top menu', 0, 1, 0, '<a href="[+wf.link+]" title="[+wf.title+]"><li class="category [+wf.classnames+]">[+wf.linktext+][+wf.wrapper+]</li></a>', 0),
(15, 'Comments', 'Comments (Jot) showing beneath a blog entry.', 0, 1, 0, '<div id="commentsAnchor">\r\n[!Jot? &customfields=`name,email` &subscribe=`1` &pagination=`4` &badwords=`dotNet` &canmoderate=`Site Admins` !]\r\n</div>', 0),
(16, 'ContactForm', '', 0, 0, 0, '<div class="cont-form">\r\n<p class="error">[+validationmessage+]</p>\r\n\r\n<form method="post" action="[~[*id*]~]" id="EmailForm" name="EmailForm">\r\n\r\n	<fieldset>\r\n		<h3>Связаться</h3>\r\n\r\n		<input name="formid" type="hidden" value="ContactForm" />\r\n\r\n		<label for="cfName">\r\n			<input name="name" id="cfName" class="blured" type="text" eform="Your Name::1:" value="Ваше имя" /> </label><br />\r\n\r\n		<label for="cfEmail">\r\n			<input name="email" id="cfEmail" class="blured" type="text" eform="Email Address:email:1" value="Ваш Email" /> </label><br />\r\n\r\n		<label for="cfRegarding"></label>\r\n		<select name="subject" id="cfRegarding" eform="Form Subject::1">\r\n			<option disabled value="">Тема сообщения:</option>\r\n			<option value="Общее">Общие вопросы</option>\r\n			<option value="Отзыв">Отзыв о работе</option>\r\n			<option value="Претензии">Претензии</option>\r\n		</select><br />\r\n\r\n		<label for="cfMessage">\r\n		<textarea name="message" class="blured" id="cfMessage" rows="4" cols="20" eform="Message:textarea:1">Ваше сообщение</textarea>\r\n		</label><br />\r\n\r\n		<label>&nbsp;</label><input type="submit" name="contact" id="cfContact" class="button" value="Отправить сообщение" />\r\n\r\n	</fieldset>\r\n\r\n</form>\r\n</div>', 0),
(17, 'ContactFormReport', '', 0, 1, 0, '<p>Это сообщение отправлено <b>[+name+]</b> через форму обратной связи:</p>\r\n\r\n\r\n<p>Имя: [+name+]</p>\r\n<p>Email: [+email+]</p>\r\n<p>Тема: [+subject+]</p>\r\n<p>Текст сообщения:<br />[+message+]</p>\r\n\r\n<p>Для ответа <b>[+name+]</b> нужно использовать эту ссылку (нажать): <a href="mailto:[+email+]?subject=RE: [+subject+]">[+email+]</a></p>\r\n', 0),
(18, 'reflect_month_tpl', 'For the yearly archive. Use with Ditto.', 0, 1, 0, '<a href="[+url+]" title="[+month+] [+year+]" class="reflect_month_link">[+month+] [+year+]</a>', 0),
(19, 'ContactStyles', 'Styles for form validation', 0, 1, 0, '<style type="text/css">\r\ndiv.errors{ color:#F00; }\r\n#EmailForm .invalidValue{ background: #FFDFDF; border:1px solid #F00; }\r\n#EmailForm .requiredValue{ background: #FFFFDF; border:1px solid #F00; }\r\n</style>', 0),
(20, 'OrderForm', '', 0, 0, 0, '<a name="form7"></a>\r\n<p class="error">[+validationmessage+]</p>\r\n<form method="post" action="[~[*id*]~]#form7" id="OrderForm" name="OrderForm">\r\n\r\n	<fieldset>\r\n		<input name="formid" type="hidden" value="OrderForm" />\r\n\r\n		<label for="cfName">\r\n		<input name="name" id="cfName" class="blured" type="text" eform="Имя:string:1:" placeholder="Ваше имя" value="[+name+]"/> </label>\r\n\r\n		<label for="cfTel">\r\n		<input name="tel" id="cfTel" class="blured" type="text" eform="Телефон:string:1" placeholder="Ваш телефон" value="[+phone+]"/> </label>\r\n\r\n		<label>&nbsp;</label><input type="submit" name="contact" id="cfContact" class="button" value="Отправить заявку" />\r\n\r\n	</fieldset>\r\n\r\n</form>\r\n', 0),
(21, 'cat_tpl', 'Вывод категорий на главную', 0, 0, 0, '<div class="firm">\r\n  	<a href="[~[+id+]~]" title="[+title+]">\r\n		<div class="imgfirm"><img src="[+img-firm+]" /></div>\r\n	  	<p>[+title+]</p>\r\n	</a>\r\n</div>', 0),
(22, 'head', '', 0, 0, 0, '<head>\r\n  	<title>[*pagetitle*] - [(site_name)]</title>\r\n  	<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" />\r\n    <base href="[(site_url)]" />\r\n    <link rel="stylesheet" href="assets/templates/serv/css/layout.css" type="text/css" media="screen" />\r\n    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>\r\n	<script>\r\n		$(document).ready(function(){\r\n			setEvents();\r\n		});\r\n		\r\n		function setEvents(){\r\n			var InputClass = ''blured'';\r\n			var ClickedClass = ''clicked'';\r\n		\r\n			$(''.''+InputClass).unbind("focus").focus(function(){\r\n				if ($(this).attr(''defvalue'') == undefined) \r\n				$(this).attr(''defvalue'',$(this).val());\r\n				if (($(this).attr(''blurvalue'') == undefined)||($(this).attr(''blurvalue'') == $(this).attr(''defvalue''))) \r\n				  $(this).val('''').addClass(ClickedClass);\r\n			}).blur(function(){\r\n				var blurvalue = $(this).val();\r\n				if (blurvalue == '''') \r\n					$(this)\r\n					  .removeAttr(''blurvalue'')\r\n						.val($(this).attr(''defvalue''))\r\n						.removeClass(ClickedClass);\r\n				else \r\n					$(this).attr(''blurvalue'',blurvalue);\r\n			});\r\n		}\r\n	</script>\r\n</head>', 0),
(23, 'catalogue', '', 0, 0, 0, '<h1 class="maintitle">популярные услуги</h1>\r\n			[[Ditto? &parents=`2` &tpl=`cat_tpl` &orderBy=`menuindex ASC`]]\r\n			<div class="slogan">И ЕЩЕ БОЛЕЕ 200 ВИДОВ УСЛУГ<br /><span>ДЛЯ ДОМА, ОФИСА И АВТОМОБИЛИСТОВ!</span></div>\r\n			<div class="order">\r\n				<p>ДЛЯ ПОЛУЧЕНИЯ УСЛУГИ ЗАПОЛНИТЕ ЗАЯВКУ</p>\r\n			<div class="order-form">\r\n			[!eForm? &formid=`OrderForm2` &subject=`Новая заявка` &to=`[[city_info?&value=`email`]]` &tpl=`OrderForm2` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue`!]\r\n				</div></div>', 0),
(24, 'navi', '', 0, 0, 0, '<div id="toggleForm">\r\n	<div class="toggleForm">\r\n		<span class="closeForm">X</span>\r\n		<div class="order-form">\r\n			[!eForm? &formid=`OrderForm` &subject=`[+subject+]` &to=`[[city_info?&value=`email`]]` &tpl=`OrderForm` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue` !]\r\n		</div>\r\n	</div>\r\n</div>\r\n<div id="top">\r\n        <div id="wrapper">\r\n            <div class="logo">\r\n				<a id="logo" href="[~1~]" title="[(site_name)]">Мир Услуг</a>\r\n            </div>\r\n			\r\n			<script>\r\n				$(document).ready(function(){\r\n					$(".city a.selected").click(function(e){\r\n						e.preventDefault();\r\n						$(this).next(".items").show();\r\n					});\r\n					$("a.callme").click(function(e){\r\n						e.preventDefault();\r\n						$("#toggleForm").fadeIn(300);\r\n					});\r\n					$("span.closeForm").click(function(e){\r\n						e.preventDefault();\r\n						$("#toggleForm").fadeOut(300);\r\n					});\r\n				});\r\n			</script>\r\n			\r\n			<div class="city">\r\n				Выберите город:<br>\r\n				<form method="POST">\r\n				<a href="#" class="selected">[!city_info? &value=`city`!]</a>\r\n				<div class="items">\r\n					[!city_info? &value=`all`!]\r\n				</div>\r\n				</form>\r\n			</div>\r\n			\r\n			<a href="javascript:">\r\n				<div class="navi">\r\n					<span>меню</span>\r\n					[[Wayfinder? &startId=`0` &level=`1`]]\r\n				</div>\r\n			</a>\r\n\r\n            <div class="call">\r\n                [!city_info? &value=`phone`!]<br /><a class="callme" href="#">Заказать обратный звонок</a>\r\n            </div>\r\n        </div>\r\n    </div>', 0),
(25, 'hero-main', '', 0, 0, 0, '<div id="hero">\r\n		<div id="wrapper">\r\n			<div class="title">СЕРВИС ДЛЯ ЗАКАЗА ЛЮБЫХ УСЛУГ<br /><span>ДЛЯ ДОМА, ОФИСА И АВТОМОБИЛИСТОВ</span></div>\r\n			<div class="appstore"><img src="assets/templates/serv/images/appstore.png" /></div>\r\n			<div class="googleplay"><img src="assets/templates/serv/images/googleplay.png" /></div>\r\n			<div class="pad"><img src="assets/templates/serv/images/ipad.png" /></div>\r\n			<div class="phone"><img src="assets/templates/serv/images/iphone.png" /></div>\r\n		</div>\r\n	</div>\r\n	\r\n	<div id="orange">\r\n		<div id="wrapper">\r\n			<p>ДЛЯ ПОЛУЧЕНИЯ УСЛУГИ ЗАПОЛНИТЕ ЗАЯВКУ</p>\r\n			<div class="order-form">\r\n			[!eForm? &formid=`OrderForm3` &subject=`Новая заявка` &to=`[[city_info?&value=`email`]]` &tpl=`OrderForm3` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue`!]\r\n			</div>\r\n		</div>\r\n	</div>', 0),
(26, 'hero-inside', '', 0, 0, 0, '<div id="hero-in">\r\n		<div id="wrapper">\r\n			<div class="title">СЕРВИС ДЛЯ ЗАКАЗА ЛЮБЫХ УСЛУГ<br /><span>ДЛЯ ДОМА, ОФИСА И АВТОМОБИЛИСТОВ</span></div>\r\n			<div class="appstore"><img src="assets/templates/serv/images/appstore.png" /></div>\r\n			<div class="googleplay"><img src="assets/templates/serv/images/googleplay.png" /></div>\r\n		</div>\r\n	</div>\r\n	\r\n	<div id="orange">\r\n		<div id="wrapper">\r\n			<p>ДЛЯ ПОЛУЧЕНИЯ УСЛУГИ ЗАПОЛНИТЕ ЗАЯВКУ</p>\r\n			<div class="order-form">\r\n			[!eForm? &formid=`OrderForm` &subject=`Новаяя заявка` &to=`[[city_info?&value=`email`]]` &tpl=`OrderForm` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue` !]\r\n			</div>\r\n		</div>\r\n	</div>', 0),
(27, 'cont', '', 0, 0, 0, '[!eForm? &formid=`ContactForm` &subject=`[+subject+]` &to=`[[city_info? &value=`email`]]` &tpl=`ContactForm` &report=`ContactFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue` &cssStyle=`ContactStyles`  !]\r\n', 0),
(28, 'hero-title', '', 0, 0, 0, '<div id="hero-in">\r\n		<div id="wrapper">\r\n			<div style="padding-top:180px;" class="title">[*longtitle*]<br /><span>[*description*]</span></div>\r\n		</div>\r\n	</div>\r\n', 0),
(29, 'hero-service', 'Вывод картинки и надписей на странице услуги в шапке', 0, 0, 0, '<div id="hero-serv">\r\n		<div id="wrapper">\r\n			<div style="padding-top:180px;" class="title">[*longtitle*]<br /><span>[*description*]</span></div>\r\n		</div>\r\n	</div>\r\n\r\n<div id="orange">\r\n		<div id="wrapper">\r\n			<p>ДЛЯ ПОЛУЧЕНИЯ УСЛУГИ ЗАПОЛНИТЕ ЗАЯВКУ</p>\r\n			<div class="order-form">\r\n			[!eForm? &formid=`OrderForm` &subject=`[+subject+]` &to=`[[city_info?&value=`email`]]` &tpl=`OrderForm` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue`  !]\r\n			</div>\r\n		</div>\r\n	</div>\r\n', 0),
(30, 'head2', 'Для страницы услуги', 0, 0, 0, '<head>\r\n  	<title>[*pagetitle*] - [(site_name)]</title>\r\n  	<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" />\r\n    <base href="[(site_url)]" />\r\n    <link rel="stylesheet" href="assets/templates/serv/css/layout.css" type="text/css" media="screen" />\r\n    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>\r\n	<script>\r\n		$(document).ready(function(){\r\n			//setEvents();\r\n		});\r\n		\r\n		function setEvents(){\r\n			var InputClass = ''blured'';\r\n			var ClickedClass = ''clicked'';\r\n		\r\n			$(''.''+InputClass).unbind("focus").focus(function(){\r\n				if($(this).attr(''name'') == ''date'') return false;\r\n				if ($(this).attr(''defvalue'') == undefined) \r\n				$(this).attr(''defvalue'',$(this).val());\r\n				if (($(this).attr(''blurvalue'') == undefined)||($(this).attr(''blurvalue'') == $(this).attr(''defvalue''))) \r\n				  $(this).val('''').addClass(ClickedClass);\r\n			}).blur(function(){\r\n				if($(this).attr(''name'') == ''date'') return false;\r\n				var blurvalue = $(this).val();\r\n				if (blurvalue == '''') \r\n					$(this)\r\n					  .removeAttr(''blurvalue'')\r\n						.val($(this).attr(''defvalue''))\r\n						.removeClass(ClickedClass);\r\n				else \r\n					$(this).attr(''blurvalue'',blurvalue);\r\n			});\r\n		}\r\n	</script>\r\n	\r\n	<style>\r\n		#hero-serv {\r\n			background: url([*hero-img*]) center top no-repeat fixed;\r\n			width: 100%;\r\n			height: 420px;\r\n			position: relative;\r\n			float: left;\r\n			text-align: center;\r\n			background-size: 100%;\r\n		}\r\n\r\n		#hero-serv .title {padding-top: 140px; font-family: Raleway_ExtraBold;}\r\n		#hero-serv .title span {padding-top: 140px;}\r\n	</style>\r\n</head>', 0),
(31, 'anketaForm', '', 0, 0, 0, '[+validationmessage+]\r\n<form id="anketa" name="anketa" method="POST" enctype="multipart/form-data" action="[~[*id*]~]#form1">\r\n	<div class="cellinput"><input type="text" class="blured" name="city" placeholder="Город" value="[+city+]" eform="Город:string:1"></div>\r\n	<div class="cellinput"><input type="text" class="blured" name="fio" placeholder="Фамилия Имя Отчество" value="[+fio+]" eform="ФИО:string:1"></div>\r\n	<div class="cellinput"><input type="text" class="blured" name="prof" placeholder="Профессия" value="[+prof+]" eform="Профессия:string:1"></div>\r\n	<div class="cellinput"><input type="text" class="blured" name="phone" placeholder="Контактный телефон" value="[+phone+]" eform="Контактный телефон:string:1"></div>\r\n	<div class="cellinput"><input type="text" class="blured" name="email" placeholder="E-mail" value="[+email+]" eform="E-mail:email:1"></div>\r\n	<div class="cellinput parent_file"><strong>Ваше фото*</strong><input class="fileinput" type="file" name="file"><span>На фотографии должно быть хорошо видно Ваше лицо</span></div>\r\n	<div class="cellinput"><textarea class="blured" name="msg" placeholder="Расскажите немного о себе">[+msg+]</textarea></div>\r\n	<div class="ofr">Отправляя данную анкету Вы соглашаетесь с условиями <a href="index.php?id=68">оферты</a></div>\r\n	<div style="text-align:right"><input type="submit" class="button" name="submit" value="Отправить"/></div>\r\n</form>', 0),
(32, 'vacancyReportTpl', '', 0, 0, 0, 'Город: [+city+]<br>\r\nФамилия Имя Отчество: [+fio+]<br>\r\nПрофессия: [+prof+]<br>\r\nКонтактный телефон: [+phone+]<br>\r\nEmail: [+email+]<br>\r\nО себе: [+msg+]<br>', 0),
(33, 'indexzaya', '', 0, 0, 0, '[+validationmessage+]\r\n<form id="indexzaya" name="indexzaya" method="POST" enctype="multipart/form-data" action="[~[*id*]~]#form2">\r\n	<div class="cellinput"><input type="text" name="name" class="blured" placeholder="Имя" value="[+name+]" eform="Имя:name:1"></div>\r\n	<div class="cellinput"><input type="text" name="phone" class="blured" placeholder="Телефон" value="[+phone+]" eform="Телефон:phone:1"></div>\r\n	<div class="cellinput"><input type="text" name="address" class="blured" placeholder="Адрес" value="[+address+]" eform="Адрес:address:1"></div>\r\n	<div class="cellinput"><textarea name="msg" placeholder="Описание заказа" eform="Описание заказа:msg:1">[+msg+]</textarea></div>\r\n	<div>\r\n		<input type="text" value="[+date+]" class="blured datepicker" placeholder="Дата" name="date">	\r\n		<span>Мы позвоним Вам и согласуем время заказа</span>\r\n	</div>\r\n	<div class="txt">Отправляя данную анкету Вы соглашаетесь с условиями <a href="index.php?id=68">оферты</a></div>\r\n	<div style="text-align:center"><input type="submit" class="button" name="submit" value="Отправить"/></div>\r\n</form>\r\n<script type="text/javascript" src="assets/js/jquery/jquery-ui.min.js"></script>\r\n<script src="assets/js/jquery-ui-timepicker-addon.js"></script>\r\n<script type="text/javascript" src="assets/js/jquery/datepicker/jquery.ui.datepicker-ru.js"></script>\r\n<link rel="stylesheet" href="assets/js/jquery-ui-timepicker-addon.css" type="text/css" media="screen" />\r\n<link rel="stylesheet" href="assets/js/jquery/jquery-ui.css" type="text/css" media="screen" />\r\n<script>\r\n$(document).ready(function(){\r\n	$(''.datepicker'').datetimepicker({\r\n        dateFormat: "yy-mm-dd",\r\n        timeFormat: "HH:mm",\r\n        timeOnlyTitle: ''Выберите время'',\r\n        timeText: ''Время'',\r\n        hourText: ''Часы'',\r\n        minuteText: ''Минуты'',\r\n        secondText: ''Секунды'',\r\n        currentText: ''Сейчас'',\r\n        closeText: ''Закрыть''\r\n    });\r\n});\r\n</script>', 0),
(36, 'indexzayaReport', '', 0, 0, 0, 'Имя: [+name+]<br>\r\nТелефон: [+phone+]<br>\r\nАдрес: [+address+]<br>\r\nОписание заказа: [+msg+]', 0),
(34, 'OrderForm2', '', 0, 0, 0, '<a name="form5"></a>\r\n<p class="error">[+validationmessage+]</p>\r\n<form method="post" action="[~[*id*]~]#form5" id="OrderForm2" name="OrderForm2">\r\n\r\n	<fieldset>\r\n		<input name="formid" type="hidden" value="OrderForm2" />\r\n\r\n		<label for="cfName2">\r\n		<input name="name" id="cfName2" class="blured" type="text" eform="Имя:string:1:"  placeholder="Ваше имя" value="[+name+]"/> </label>\r\n\r\n		<label for="cfTel2">\r\n		<input name="tel" id="cfTel2" class="blured" type="text" eform="Телефон:string:1"  placeholder="Ваш телефон" value="[+phone+]"/> </label>\r\n\r\n		<label>&nbsp;</label><input type="submit" name="submit" id="cfContact" class="button" value="Отправить заявку" />\r\n\r\n	</fieldset>\r\n\r\n</form>\r\n', 0),
(35, 'OrderForm3', '', 0, 0, 0, '<a name="form6"></a>\r\n<p class="error">[+validationmessage+]</p>\r\n<form method="post" action="[~[*id*]~]#form6" id="OrderForm3" name="OrderForm3">\r\n\r\n	<fieldset>\r\n		<input name="formid" type="hidden" value="OrderForm3" />\r\n\r\n		<label for="cfName3">\r\n		<input name="name" id="cfName3" class="blured" type="text" eform="Имя:string:1:"  placeholder="Ваше имя" value="[+name+]"/> </label>\r\n\r\n		<label for="cfTel3">\r\n		<input name="tel" id="cfTel3" class="blured" type="text" eform="Телефон:string:1"  placeholder="Ваш телефон" value="[+phone+]"/> </label>\r\n\r\n		<label>&nbsp;</label><input type="submit" name="submit" id="cfContact" class="button" value="Отправить заявку" />\r\n\r\n	</fieldset>\r\n\r\n</form>\r\n', 0),
(38, 'Duplicate of ContactFormReport', '', 0, 1, 0, '<p>Это сообщение отправлено <b>[+name+]</b> через форму обратной связи:</p>\r\n\r\n\r\n<p>Имя: [+name+]</p>\r\n<p>Email: [+email+]</p>\r\n<p>Тема: [+subject+]</p>\r\n<p>Текст сообщения:<br />[+message+]</p>\r\n\r\n<p>Для ответа <b>[+name+]</b> нужно использовать эту ссылку (нажать): <a href="mailto:[+email+]?subject=RE: [+subject+]">[+email+]</a></p>\r\n', 0),
(37, 'cat_2', '', 0, 0, 0, '<h1 class="maintitle">популярные услуги</h1>\r\n			[[Ditto? &parents=`2` &tpl=`cat_tpl` &orderBy=`menuindex ASC`]]\r\n			<div class="slogan">И ЕЩЕ БОЛЕЕ 200 ВИДОВ УСЛУГ<br /><span>ДЛЯ ДОМА, ОФИСА И АВТОМОБИЛИСТОВ!</span></div>\r\n', 0),
(39, 'MinFormReport', '', 0, 1, 0, '<p>Имя: [+name+]</p>\r\n<p>Телефон: [+tel+]</p>', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_keywords`
--

CREATE TABLE IF NOT EXISTS `srv_site_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site keyword list' AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `srv_site_keywords`
--

INSERT INTO `srv_site_keywords` (`id`, `keyword`) VALUES
(1, 'MODX'),
(2, 'content management system'),
(3, 'Front End Editing'),
(4, 'login');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_metatags`
--

CREATE TABLE IF NOT EXISTS `srv_site_metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site meta tags' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_modules`
--

CREATE TABLE IF NOT EXISTS `srv_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Modules' AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `srv_site_modules`
--

INSERT INTO `srv_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 4, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', 'include_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/docmanager.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_frontend.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_backend.class.php'');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[''theme''] = $dm->getTheme();\n$dm->ph[''ajax.endpoint''] = MODX_SITE_URL.''assets/modules/docmanager/tv.ajax.php'';\n$dm->ph[''datepicker.offset''] = $modx->config[''datepicker_offset''];\n$dm->ph[''datetime.format''] = $modx->config[''datetime_format''];\n\nif (isset($_POST[''tabAction''])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(''main.tpl'', $dm->ph);\n}'),
(2, 'multiTV', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, '', 0, '', '/**\r\n * Database Manager\r\n *\r\n * CRUD module\r\n *\r\n * @category    snippet, module, tv\r\n * @version     2.0.4\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @author      Jako\r\n * @internal    @properties &configs=Configurations;text;event_log\r\n * @internal    @modx_category Content\r\n * @internal    @installset base, sample\r\n */\r\ninclude(MODX_BASE_PATH.''assets/tvs/multitv/multitv.module.php'');\r\n'),
(3, 'Города', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, '', 0, '', '/***********************************\r\n* \r\n* Информация о\r\n* \r\n***********************************/\r\n \r\n$dbname = $modx->db->config[''dbase'']; //имя базы данных\r\n$dbprefix = $modx->db->config[''table_prefix'']; //префикс таблиц\r\n$mod_table = $dbprefix."manager_CITY_INFO"; //таблица модуля\r\n$theme = $modx->config[''manager_theme'']; //тема админки\r\n$basePath = $modx->config[''base_path'']; //путь до сайта на сервере\r\n \r\necho ''\r\n<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml"  lang="en" xml:lang="en">\r\n<head>\r\n  <link rel="stylesheet" type="text/css" href="media/style/''.$theme.''/style.css" />\r\n  <!-- <link rel="stylesheet" type="text/css" href="/assets/templates/batyrmall/css/style_for_module_butiks.css" /> -->\r\n</head>\r\n<body>\r\n<br />\r\n<div class="sectionHeader">О городах</div>\r\n \r\n  <div class="sectionBody">\r\n \r\n<script language="JavaScript" type="text/javascript">\r\nfunction postForm(action, id){\r\n  document.module.action.value=action;\r\n  if (id != null) document.module.item_id.value=id;\r\n    document.module.submit();\r\n  }\r\n</script>\r\n\r\n<script language="javascript" type="text/javascript" src="/assets/plugins/tinymce/tiny_mce/tiny_mce.js"></script>\r\n<script language="javascript" type="text/javascript">\r\n	tinyMCE.init({\r\n	language : "ru",\r\n	mode : "specific_textareas",\r\n	editor_selector : "text1",\r\n	theme : "advanced",\r\n	plugins : "emotions,media,advimage",\r\n	theme_advanced_buttons1 : "undo,redo,|,bold,italic,underline,strikethrough,|,link, unlink,|,code,|,emotions,|,media,|,image",\r\n	theme_advanced_buttons2 : "",\r\n	theme_advanced_toolbar_location : "top",\r\n	theme_advanced_toolbar_align : "left",\r\n	theme_advanced_statusbar_location : "bottom",\r\n	theme_advanced_resizing : true,\r\n	});\r\n</script>\r\n \r\n<form name="module" method="post" enctype="multipart/form-data">\r\n<input name="action" type="hidden" value="" />\r\n<input name="item_id" type="hidden" value="" />\r\n'';\r\n \r\n$action = isset($_POST[''action'']) ? $_POST[''action'']:'''';\r\n \r\nswitch($action) {\r\n \r\n//Установка модуля (создание таблицы в БД)\r\ncase ''install'':\r\n  $sql = "CREATE TABLE $mod_table (id INT(11) NOT NULL AUTO_INCREMENT,\r\n  									city VARCHAR(255), PRIMARY KEY (id),\r\n  									phone VARCHAR(255),  \r\n  									email VARCHAR(255),\r\n									page_text TEXT,\r\n									map TEXT\r\n									)";\r\n  $modx->db->query($sql);\r\n  header("Location: $_SERVER[REQUEST_URI]");\r\n	\r\nbreak;\r\n \r\n//Удаление таблицы модуля\r\ncase "uninstall":\r\n  $sql = "DROP TABLE $mod_table";\r\n  $modx->db->query($sql);\r\n  header("Location: $_SERVER[REQUEST_URI]");\r\nbreak;\r\n\r\n	\r\n\r\n	\r\n//Добавление записи\r\ncase ''add'':\r\n  if (!empty($_POST[''item_id''])){//редактирование записи\r\n    $data = mysql_fetch_array($modx->db->select("*", $mod_table, "id = $_POST[item_id]", "", ""));\r\n    $id = $_POST[''item_id''];\r\n	$city = $data[''city''];\r\n    $phone = $data[''phone''];\r\n    $email = $data[''email''];\r\n	$page_text = $data[''page_text''];\r\n	$map = $data[''map''];\r\n    $save = "update";\r\n  }else{//если запись новая\r\n    $id = "";\r\n	$city = "";\r\n    $phone = "";\r\n    $email = "";\r\n	$page_text = "";\r\n	$map = "";\r\n    $save = "save";\r\n  }\r\n  echo ''\r\n  <table border="0" width="100%" class="table_bank">\r\n	<tr>\r\n		<td>Город:</td><td><input type="text" name="city" value="''.$city.''" /></td>\r\n	</tr>\r\n	<tr>\r\n		<td>Телефон:</td><td><input type="text" name="phone" value="''.$phone.''" /></td>\r\n	</tr>\r\n	<tr>\r\n		<td>E-mail:</td><td><input type="text" name="email" value="''.$email.''" /></td>\r\n	</tr>\r\n	<tr>\r\n		<td>Текст на странице "Контакты":</td>\r\n		<td><textarea class="text1" name="page_text">''.$page_text.''</textarea></td>\r\n	</tr>\r\n	<tr>\r\n		<td>Скрипт для "Карты":</td>\r\n		<td><textarea name="map">''.$map.''</textarea></td>\r\n	</tr>\r\n	</table>\r\n<div class="func_panel">\r\n<a href="#" onclick="postForm(\\''''.$save.''\\'',\\''''.$id.''\\'');return false;">Сохранить</a>\r\n&nbsp;\r\n<a href="#" onclick="postForm(\\''reload\\'',null);return false;">Отмена</a>\r\n</div>\r\n</form>\r\n'';\r\nbreak;\r\n \r\n//Сохранение записи в БД\r\ncase ''save'':\r\n  $sql = "INSERT INTO $mod_table VALUES (\r\n  NULL,\r\n  ''$_POST[city]'',\r\n  ''$_POST[phone]'',\r\n  ''$_POST[email]'',\r\n  ''$_POST[page_text]'',\r\n  ''$_POST[map]''\r\n  )";\r\n  $modx->db->query($sql);\r\n  header("Location: $_SERVER[REQUEST_URI]");\r\nbreak;\r\n\r\n//Обновление записи в БД\r\ncase ''update'':\r\n  $fields = array(\r\n	  "city" => $_POST[''city''],\r\n     "phone" => $_POST[''phone''],\r\n	  "email" => $_POST[''email''],\r\n	  "page_text" => $_POST[''page_text''],\r\n	  "map" => $_POST[''map'']\r\n     );\r\n  $query = $modx->db->update($fields, $mod_table, "id = ".$_POST[''item_id''].""); \r\n  header("Location: $_SERVER[REQUEST_URI]");\r\nbreak;\r\n	\r\n//Перезагрузка страницы (сброс $_POST)\r\ncase ''reload'':\r\n  header("Location: $_SERVER[REQUEST_URI]");\r\nbreak;\r\n \r\n//Удаление записи в БД \r\ncase ''delete'':\r\n  $modx->db->delete($mod_table, "id = $_POST[item_id]");\r\n  header("Location: $_SERVER[REQUEST_URI]");\r\nbreak;\r\n\r\n	\r\n//Страница модуля\r\ndefault:\r\n  if (mysql_num_rows(mysql_query("show tables from $dbname like ''$mod_table''"))==0){\r\n  //если таблицы не существует, выводим кнопку "Установить модуль"\r\n \r\n    echo ''<a href="#" onclick="postForm(\\''install\\'',null);return false;">Установить модуль</a>'';\r\n \r\n  }else{\r\n  //если же модуль уже установлен, выводим его\r\n \r\necho ''\r\n    </form>\r\n    <a href="#" onclick="postForm(\\''add\\'',null);return false;"><img src="media/style/''.$theme.''/images/icons/newdoc.gif" align="absmiddle" />Добавить город</a><br/>\r\n   '';\r\n	  \r\n    $data_query = $modx->db->select("*", $mod_table, "", "", ""); \r\n \r\n    echo ''\r\n<br /><br />\r\n<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#707070">\r\n  <thead>\r\n  <tr>\r\n  	<td><b>№</b></td>\r\n  	<td><b>Город</b></td>\r\n    <td><b>Телефон</b></td>\r\n	<td><b>E-mail</b></td>\r\n    <td><b></b></td>\r\n  </tr>\r\n  <thead>\r\n  <tbody>\r\n'';\r\n	  $k=0;\r\n    while ($data2 = mysql_fetch_array($data_query)){//выводим записи\r\n	$k++;\r\n    echo ''\r\n  <tr bgcolor="#EEEEEE">\r\n  	<td>''.$k.''</td>\r\n  	<td>''.$data2["city"].''</td>\r\n    <td>''.$data2["phone"].''</td>\r\n	<td>''.$data2["email"].''</td>\r\n    <td align="center"><a href="#" title="Редактировать" onclick="postForm(\\''add\\'',''.$data2["id"].'');return false;"><img src="media/style/''.$theme.''/images/icons/logging.gif" align="absmiddle" /></a><a href="#" title="Удалить" onclick="if(confirm(\\''Вы уверены?\\'')){postForm(\\''delete\\'',''.$data["id"].'')};return false"> <img src="media/style/''.$theme.''/images/icons/delete.gif" align="absmiddle" /></a></td>\r\n  </tr>'';\r\n    } \r\n	  \r\n \r\n    echo ''\r\n  </tbody>\r\n</table>\r\n<br /><br />\r\n<a href="#" onclick="if(confirm(\\''Вы уверены?\\'')){postForm(\\''uninstall\\'',null)};return false;"><img src="media/style/''.$theme.''/images/icons/delete.gif" align="absmiddle" />Удалить все записи</a>\r\n'';\r\n \r\n  }\r\nbreak;\r\n} \r\n \r\necho ''\r\n</div>\r\n</body>\r\n</html>\r\n'';');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_module_access`
--

CREATE TABLE IF NOT EXISTS `srv_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_module_depobj`
--

CREATE TABLE IF NOT EXISTS `srv_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_plugins`
--

CREATE TABLE IF NOT EXISTS `srv_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.' AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `srv_site_plugins`
--

INSERT INTO `srv_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`) VALUES
(1, 'ManagerManager', '<strong>0.6.2</strong> Customize the MODX Manager to offer bespoke admin functions for end users.', 0, 4, 0, '// You can put your ManagerManager rules EITHER in a chunk OR in an external file - whichever suits your development style the best\n\n// To use an external file, put your rules in /assets/plugins/managermanager/mm_rules.inc.php \n// (you can rename default.mm_rules.inc.php and use it as an example)\n// The chunk SHOULD have php opening tags at the beginning and end\n\n// If you want to put your rules in a chunk (so you can edit them through the Manager),\n// create the chunk, and enter its name in the configuration tab.\n// The chunk should NOT have php tags at the beginning or end.\n\n// See also user-friendly module for editing ManagerManager configuration file ddMMEditor (http://code.divandesign.biz/modx/ddmmeditor).\n\n// ManagerManager requires jQuery 1.9.1, which is located in /assets/plugins/managermanager/js/ folder.\n\n// You don''t need to change anything else from here onwards\n//-------------------------------------------------------\n\n// Run the main code\ninclude($modx->config[''base_path''].''assets/plugins/managermanager/mm.inc.php'');', 0, '&remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules', 0, ''),
(2, 'Quick Manager+', '<strong>1.5.6</strong> Enables QuickManager+ front end content editing support', 0, 4, 0, '// In manager\nif (isset($_SESSION[''mgrValidated''])) {\n\n    $show = TRUE;\n\n    if ($disabled  != '''') {\n        $arr = array_filter(array_map(''intval'', explode('','', $disabled)));\n        if (in_array($modx->documentIdentifier, $arr)) {\n            $show = FALSE;\n        }\n    }\n\n    if ($show) {\n        // Replace [*#tv*] with QM+ edit TV button placeholders\n        if ($tvbuttons == ''true'') {\n            $e = $modx->Event;\n            if ($e->name == ''OnParseDocument'') {\n                 $output = &$modx->documentOutput;\n                 $output = preg_replace(''~\\[\\*#(.*?)\\*\\]~'', ''<!-- ''.$tvbclass.'' $1 -->[*$1*]'', $output);\n                 $modx->documentOutput = $output;\n             }\n         }\n        // In manager\n        if (isset($_SESSION[''mgrValidated''])) {\n            include_once($modx->config[''base_path''].''assets/plugins/qm/qm.inc.php'');\n            $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\n        }\n    }\n}', 0, '&jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 1, ''),
(3, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/filesource/plugin.filesource.php'';', 0, '', 0, ''),
(4, 'CodeMirror', '<strong>1.2b</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirrir 3.13', 0, 4, 0, '$_CM_BASE = ''assets/plugins/codemirror/'';\r\n\r\n$_CM_URL = $modx->config[''site_url''] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .''codemirror.plugin.php'');\r\n\r\n', 0, '&theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light; &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;true', 0, ''),
(5, 'TinyMCE Rich Text Editor', '<strong>3.5.11</strong> Javascript WYSIWYG Editor', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/tinymce/plugin.tinymce.php'';\n', 0, '&customparams=Custom Parameters;textarea;valid_elements : "*[*]", &mce_formats=Block Formats;text;p,h1,h2,h3,h4,h5,h6,div,blockquote,code,pre &entity_encoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &mce_path_options=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &mce_resizing=Advanced Resizing;list;true,false;true &disabledButtons=Disabled Buttons;text; &link_list=Link List;list;enabled,disabled;enabled &webtheme=Web Theme;list;simple,editor,creative,custom;simple &webPlugins=Web Plugins;text;style,advimage,advlink,searchreplace,contextmenu,paste,fullscreen,xhtmlxtras,media &webButtons1=Web Buttons 1;text;undo,redo,selectall,|,pastetext,pasteword,|,search,replace,|,hr,charmap,|,image,link,unlink,anchor,media,|,cleanup,removeformat,|,fullscreen,code,help &webButtons2=Web Buttons 2;text;bold,italic,underline,strikethrough,sub,sup,|,|,blockquote,bullist,numlist,outdent,indent,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,|,styleprops &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;500', 0, ''),
(6, 'TransAlias', '<strong>1.0.2</strong> Human readible URL translation supporting multiple languages and overrides', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/transalias/plugin.transalias.php'';', 0, '&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;utf8lowercase &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;legal characters &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;', 0, ''),
(7, 'Search Highlight', '<strong>1.5</strong> Used with AjaxSearch to show search terms highlighted on page linked from search results', 0, 5, 0, '/*\n  ------------------------------------------------------------------------\n  Plugin: Search_Highlight v1.5\n  ------------------------------------------------------------------------\n  Changes:\n  18/03/10 - Remove possibility of XSS attempts being passed in the URL\n           - look-behind assertion improved\n  29/03/09 - Removed urldecode calls;\n           - Added check for magic quotes - if set, remove slashes\n           - Highlights terms searched for when target is a HTML entity\n  18/07/08 - advSearch parameter and pcre modifier added\n  10/02/08 - Strip_tags added to avoid sql injection and XSS. Use of $_REQUEST\n  01/03/07 - Added fies/updates from forum from users mikkelwe/identity\n  (better highlight replacement, additional div around term/removal message)\n  ------------------------------------------------------------------------\n  Description: When a user clicks on the link from the AjaxSearch results\n    the target page will have the terms highlighted.\n  ------------------------------------------------------------------------\n  Created By:  Susan Ottwell (sottwell@sottwell.com)\n               Kyle Jaebker (kjaebker@muddydogpaws.com)\n\n  Refactored by Coroico (www.evo.wangba.fr) and TS\n  ------------------------------------------------------------------------\n  Based off the the code by Susan Ottwell (www.sottwell.com)\n    http://forums.modx.com/thread/47775/plugin-highlight-search-terms\n  ------------------------------------------------------------------------\n  CSS:\n    The classes used for the highlighting are the same as the AjaxSearch\n  ------------------------------------------------------------------------\n  Notes:\n    To add a link to remove the highlighting and to show the searchterms\n    put the following on your page where you would like this to appear:\n\n      <!--search_terms-->\n\n    Example output for this:\n\n      Search Terms: the, template\n      Remove Highlighting\n\n    Set the following variables to change the text:\n\n      $termText - the text before the search terms\n      $removeText - the text for the remove link\n  ------------------------------------------------------------------------\n*/\nglobal $database_connection_charset;\n// Conversion code name between html page character encoding and Mysql character encoding\n// Some others conversions should be added if needed. Otherwise Page charset = Database charset\n$pageCharset = array(\n  ''utf8'' => ''UTF-8'',\n  ''latin1'' => ''ISO-8859-1'',\n  ''latin2'' => ''ISO-8859-2''\n);\n\nif (isset($_REQUEST[''searched'']) && isset($_REQUEST[''highlight''])) {\n\n  // Set these to customize the text for the highlighting key\n  // --------------------------------------------------------\n     $termText = ''<div class="searchTerms">Search Terms: '';\n     $removeText = ''Remove Highlighting'';\n  // --------------------------------------------------------\n\n  $highlightText = $termText;\n  $advsearch = ''oneword'';\n\n  $dbCharset = $database_connection_charset;\n  $pgCharset = array_key_exists($dbCharset,$pageCharset) ? $pageCharset[$dbCharset] : $dbCharset;\n\n  // magic quotes check\n  if (get_magic_quotes_gpc()){\n    $searched = strip_tags(stripslashes($_REQUEST[''searched'']));\n    $highlight = strip_tags(stripslashes($_REQUEST[''highlight'']));\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags(stripslashes($_REQUEST[''advsearch'']));\n  }\n  else {\n    $searched = strip_tags($_REQUEST[''searched'']);\n    $highlight = strip_tags($_REQUEST[''highlight'']);\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags($_REQUEST[''advsearch'']);\n  }\n\n  if ($advsearch != ''nowords'') {\n\n    $searchArray = array();\n    if ($advsearch == ''exactphrase'') $searchArray[0] = $searched;\n    else $searchArray = explode('' '', $searched);\n\n    $searchArray = array_unique($searchArray);\n    $nbterms = count($searchArray);\n    $searchTerms = array();\n    for($i=0;$i<$nbterms;$i++){\n      // Consider all possible combinations\n      $word_ents = array();\n      $word_ents[] = $searchArray[$i];\n      $word_ents[] = htmlentities($searchArray[$i], ENT_NOQUOTES, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_COMPAT, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_QUOTES, $pgCharset);\n      // Avoid duplication\n      $word_ents = array_unique($word_ents);\n      foreach($word_ents as $word) $searchTerms[]= array(''term'' => $word, ''class'' => $i+1);\n    }\n\n    $output = $modx->documentOutput; // get the parsed document\n    $body = explode("<body", $output); // break out the head\n\n    $highlightClass = explode('' '',$highlight); // break out the highlight classes\n    /* remove possibility of XSS attempts being passed in URL */\n    foreach ($highlightClass as $key => $value) {\n       $highlightClass[$key] = preg_match(''/[^A-Za-z0-9_-]/ms'', $value) == 1 ? '''' : $value;\n    }\n\n    $pcreModifier = ($pgCharset == ''UTF-8'') ? ''iu'' : ''i'';\n    $lookBehind = ''/(?<!&|&[\\w#]|&[\\w#]\\w|&[\\w#]\\w\\w|&[\\w#]\\w\\w\\w|&[\\w#]\\w\\w\\w\\w|&[\\w#]\\w\\w\\w\\w\\w)'';  // avoid a match with a html entity\n    $lookAhead = ''(?=[^>]*<)/''; // avoid a match with a html tag\n\n    $nbterms = count($searchTerms);\n    for($i=0;$i<$nbterms;$i++){\n      $word = $searchTerms[$i][''term''];\n      $class = $highlightClass[0].'' ''.$highlightClass[$searchTerms[$i][''class'']];\n\n      $highlightText .= ($i > 0) ? '', '' : '''';\n      $highlightText .= ''<span class="''.$class.''">''.$word.''</span>'';\n\n      $pattern = $lookBehind . preg_quote($word, ''/'') . $lookAhead . $pcreModifier;\n      $replacement = ''<span class="'' . $class . ''">${0}</span>'';\n      $body[1] = preg_replace($pattern, $replacement, $body[1]);\n    }\n\n    $output = implode("<body", $body);\n\n    $removeUrl = $modx->makeUrl($modx->documentIdentifier);\n    $highlightText .= ''<br /><a href="''.$removeUrl.''" class="ajaxSearch_removeHighlight">''.$removeText.''</a></div>'';\n\n    $output = str_replace(''<!--search_terms-->'',$highlightText,$output);\n    $modx->documentOutput = $output;\n  }\n}', 0, '', 1, ''),
(8, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 4, 0, 'require MODX_BASE_PATH.''assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php'';', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_plugin_events`
--

CREATE TABLE IF NOT EXISTS `srv_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

--
-- Дамп данных таблицы `srv_site_plugin_events`
--

INSERT INTO `srv_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 28, 0),
(1, 29, 0),
(1, 30, 0),
(1, 31, 0),
(1, 35, 0),
(1, 53, 0),
(1, 205, 0),
(2, 3, 0),
(2, 13, 0),
(2, 28, 0),
(2, 31, 0),
(2, 92, 0),
(3, 34, 0),
(3, 35, 0),
(3, 36, 0),
(3, 40, 0),
(3, 41, 0),
(3, 42, 0),
(4, 23, 0),
(4, 29, 0),
(4, 35, 0),
(4, 41, 0),
(4, 47, 0),
(4, 73, 0),
(5, 85, 0),
(5, 87, 0),
(5, 88, 0),
(6, 100, 0),
(7, 3, 0),
(8, 80, 0),
(8, 81, 0),
(8, 93, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_snippets`
--

CREATE TABLE IF NOT EXISTS `srv_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.' AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `srv_site_snippets`
--

INSERT INTO `srv_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(1, 'Breadcrumbs', '<strong>1.0.4</strong> Configurable breadcrumb page-trail navigation', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/breadcrumbs/snippet.breadcrumbs.php'';', 0, '', ''),
(2, 'Jot', '<strong>1.1.4</strong> User comments with moderation and email subscription', 0, 7, 0, '/*####\n#\n# Author: Armand "bS" Pondman (apondman@zerobarrier.nl)\n#\n# Latest Version: http://modx.com/extras/package/jot\n# Jot Demo Site: http://projects.zerobarrier.nl/modx/\n# Documentation: http://wiki.modxcms.com/index.php/Jot (wiki)\n#\n####*/\n\n$jotPath = $modx->config[''base_path''] . ''assets/snippets/jot/'';\ninclude_once($jotPath.''jot.class.inc.php'');\n\n$Jot = new CJot;\n$Jot->VersionCheck("1.1.4");\n$Jot->Set("path",$jotPath);\n$Jot->Set("action", $action);\n$Jot->Set("postdelay", $postdelay);\n$Jot->Set("docid", $docid);\n$Jot->Set("tagid", $tagid);\n$Jot->Set("subscribe", $subscribe);\n$Jot->Set("moderated", $moderated);\n$Jot->Set("captcha", $captcha);\n$Jot->Set("badwords", $badwords);\n$Jot->Set("bw", $bw);\n$Jot->Set("sortby", $sortby);\n$Jot->Set("numdir", $numdir);\n$Jot->Set("customfields", $customfields);\n$Jot->Set("guestname", $guestname);\n$Jot->Set("canpost", $canpost);\n$Jot->Set("canview", $canview);\n$Jot->Set("canedit", $canedit);\n$Jot->Set("canmoderate", $canmoderate);\n$Jot->Set("trusted", $trusted);\n$Jot->Set("pagination", $pagination);\n$Jot->Set("placeholders", $placeholders);\n$Jot->Set("subjectSubscribe", $subjectSubscribe);\n$Jot->Set("subjectModerate", $subjectModerate);\n$Jot->Set("subjectAuthor", $subjectAuthor);\n$Jot->Set("notify", $notify);\n$Jot->Set("notifyAuthor", $notifyAuthor);\n$Jot->Set("validate", $validate);\n$Jot->Set("title", $title);\n$Jot->Set("authorid", $authorid);\n$Jot->Set("css", $css);\n$Jot->Set("cssFile", $cssFile);\n$Jot->Set("cssRowAlt", $cssRowAlt);\n$Jot->Set("cssRowMe", $cssRowMe);\n$Jot->Set("cssRowAuthor", $cssRowAuthor);\n$Jot->Set("tplForm", $tplForm);\n$Jot->Set("tplComments", $tplComments);\n$Jot->Set("tplModerate", $tplModerate);\n$Jot->Set("tplNav", $tplNav);\n$Jot->Set("tplNotify", $tplNotify);\n$Jot->Set("tplNotifyModerator", $tplNotifyModerator);\n$Jot->Set("tplNotifyAuthor", $tplNotifyAuthor);\n$Jot->Set("tplSubscribe", $tplSubscribe);\n$Jot->Set("debug", $debug);\n$Jot->Set("output", $output);\nreturn $Jot->Run();', 0, '', ''),
(3, 'Ditto', '<strong>2.1.1</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/ditto/snippet.ditto.php'';', 0, '', ''),
(4, 'MemberCheck', '<strong>1.1</strong> Show chunks based on a logged in Web User''s group membership', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/membercheck/snippet.membercheck.php'';', 0, '', ''),
(5, 'phpthumb', '<strong>1.2</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/phpthumb/snippet.phpthumb.php'';\r\n', 0, '', ''),
(6, 'WebChangePwd', '<strong>1.0.1</strong> Allows Web User to change their password from the front-end of the website', 0, 3, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&tpl			- (Optional)\n#		Chunk name or document id to use as a template\n#				  \n#	Note: Templats design:\n#			section 1: change pwd template\n#			section 2: notification template \n#\n# Examples:\n#\n#	[[WebChangePwd? &tpl=`ChangePwd`]] \n\n# Set Snippet Paths \n$snipPath  = (($modx->isBackend())? "../":"");\n$snipPath .= "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$isPostBack		= count($_POST) && isset($_POST[''cmdwebchngpwd'']);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/webchangepwd.inc.php";\n\n# Return\nreturn $output;\n\n\n\n', 0, '', ''),
(7, 'eForm', '<strong>1.4.6</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/eform/snippet.eform.php'';', 0, '', ''),
(8, 'ListIndexer', '<strong>1.0.1</strong> A flexible way to show the most recent Resources and other Resource lists', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/listindexer/snippet.listindexer.php'';', 0, '', ''),
(9, 'Reflect', '<strong>2.1.0</strong> Generates date-based archives using Ditto', 0, 7, 0, '/*\n * Author: \n *      Mark Kaplan for MODX CMF\n * \n * Note: \n *      If Reflect is not retrieving its own documents, make sure that the\n *          Ditto call feeding it has all of the fields in it that you plan on\n *       calling in your Reflect template. Furthermore, Reflect will ONLY\n *          show what is currently in the Ditto result set.\n *       Thus, if pagination is on it will ONLY show that page''s items.\n*/\n \n\n// ---------------------------------------------------\n//  Includes\n// ---------------------------------------------------\n\n$reflect_base = isset($reflect_base) ? $modx->config[''base_path''].$reflect_base : $modx->config[''base_path'']."assets/snippets/reflect/";\n/*\n    Param: ditto_base\n    \n    Purpose:\n    Location of Ditto files\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    [(base_path)]assets/snippets/ditto/\n*/\n\n$config = (isset($config)) ? $config : "default";\n/*\n    Param: config\n\n    Purpose:\n    Load a custom configuration\n\n    Options:\n    "default" - default blank config file\n    CONFIG_NAME - Other configs installed in the configs folder or in any folder within the MODX base path via @FILE\n\n    Default:\n    "default"\n    \n    Related:\n    - <extenders>\n*/\n\nrequire($reflect_base."configs/default.config.php");\nrequire($reflect_base."default.templates.php");\nif ($config != "default") {\n    require((substr($config, 0, 5) != "@FILE") ? $reflect_base."configs/$config.config.php" : $modx->config[''base_path''].trim(substr($config, 5)));\n}\n\n// ---------------------------------------------------\n//  Parameters\n// ---------------------------------------------------\n\n$id = isset($id) ? $id."_" : false;\n/*\n    Param: id\n\n    Purpose:\n    Unique ID for this Ditto instance for connection with other scripts (like Reflect) and unique URL parameters\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    "" - blank\n*/\n$getDocuments = isset($getDocuments) ? $getDocuments : 0;\n/*\n    Param: getDocuments\n\n    Purpose:\n    Force Reflect to get documents\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n*/\n$showItems = isset($showItems) ? $showItems : 1;\n/*\n    Param: showItems\n\n    Purpose:\n    Show individual items in the archive\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$groupByYears = isset($groupByYears)? $groupByYears : 1;\n/*\n    Param: groupByYears\n\n    Purpose:\n    Group the archive by years\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$targetID = isset($targetID) ? $targetID : $modx->documentObject[''id''];\n/*\n    Param: targetID\n\n    Purpose:\n    ID for archive links to point to\n\n    Options:\n    Any MODX document with a Ditto call setup with extenders=`dateFilter`\n    \n    Default:\n    Current MODX Document\n*/\n$dateSource = isset($dateSource) ? $dateSource : "createdon";\n/*\n    Param: dateSource\n\n    Purpose:\n    Date source to display for archive items\n\n    Options:\n    # - Any UNIX timestamp from MODX fields or TVs such as createdon, pub_date, or editedon\n    \n    Default:\n    "createdon"\n    \n    Related:\n    - <dateFormat>\n*/\n$dateFormat = isset($dateFormat) ? $dateFormat : "%d-%b-%y %H:%M";  \n/*\n    Param: dateFormat\n\n    Purpose:\n    Format the [+date+] placeholder in human readable form\n\n    Options:\n    Any PHP valid strftime option\n\n    Default:\n    "%d-%b-%y %H:%M"\n    \n    Related:\n    - <dateSource>\n*/\n$yearSortDir = isset($yearSortDir) ? $yearSortDir : "DESC";\n/*\n    Param: yearSortDir\n\n    Purpose:\n    Direction to sort documents\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "DESC"\n    \n    Related:\n    - <monthSortDir>\n*/\n$monthSortDir = isset($monthSortDir) ? $monthSortDir : "ASC";\n/*\n    Param: monthSortDir\n\n    Purpose:\n    Direction to sort the months\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "ASC"\n    \n    Related:\n    - <yearSortDir>\n*/\n$start = isset($start)? intval($start) : 0;\n/*\n    Param: start\n\n    Purpose:\n    Number of documents to skip in the results\n    \n    Options:\n    Any number\n\n    Default:\n    0\n*/  \n$phx = (isset($phx))? $phx : 1;\n/*\n    Param: phx\n\n    Purpose:\n    Use PHx formatting\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n\n// ---------------------------------------------------\n//  Initialize Ditto\n// ---------------------------------------------------\n$placeholder = ($id != false && $getDocuments == 0) ? true : false;\nif ($placeholder === false) {\n    $rID = "reflect_".rand(1,1000);\n    $itemTemplate = isset($tplItem) ? $tplItem: "@CODE:".$defaultTemplates[''item''];\n    $dParams = array(\n        "id" => "$rID",\n        "save" => "3",  \n        "summarize" => "all",\n        "tpl" => $itemTemplate,\n    );\n    \n    $source = $dittoSnippetName;\n    $params = $dittoSnippetParameters;\n        // TODO: Remove after 3.0\n        \n    if (isset($params)) {\n        $givenParams = explode("|",$params);\n        foreach ($givenParams as $parameter) {\n            $p = explode(":",$parameter);\n            $dParams[$p[0]] = $p[1];\n        }\n    }\n    /*\n        Param: params\n\n        Purpose:\n        Pass parameters to the Ditto instance used to retreive the documents\n\n        Options:\n        Any valid ditto parameters in the format name:value \n        with multiple parameters separated by a pipe (|)\n        \n        Note:\n        This parameter is only needed for config, start, and phx as you can\n        now simply use the parameter as if Reflect was Ditto\n\n        Default:\n        [NULL]\n    */\n    \n    $reflectParameters = array(''reflect_base'',''config'',''id'',''getDocuments'',''showItems'',''groupByYears'',''targetID'',''yearSortDir'',''monthSortDir'',''start'',''phx'',''tplContainer'',''tplYear'',''tplMonth'',''tplMonthInner'',''tplItem'',''save'');\n    $params =& $modx->event->params;\n    if(is_array($params)) {\n        foreach ($params as $param=>$value) {\n            if (!in_array($param,$reflectParameters) && substr($param,-3) != ''tpl'') {\n                $dParams[$param] = $value;\n            }\n        }\n    }\n\n    $source = isset($source) ? $source : "Ditto";\n    /*\n        Param: source\n\n        Purpose:\n        Name of the Ditto snippet to use\n\n        Options:\n        Any valid snippet name\n\n        Default:\n        "Ditto"\n    */\n    $snippetOutput = $modx->runSnippet($source,$dParams);\n    $ditto = $modx->getPlaceholder($rID."_ditto_object");\n    $resource = $modx->getPlaceholder($rID."_ditto_resource");\n} else {\n    $ditto = $modx->getPlaceholder($id."ditto_object");\n    $resource = $modx->getPlaceholder($id."ditto_resource");\n}\nif (!is_object($ditto) || !isset($ditto) || !isset($resource)) {\n    return !empty($snippetOutput) ? $snippetOutput : "The Ditto object is invalid. Please check it.";\n}\n\n// ---------------------------------------------------\n//  Templates\n// ---------------------------------------------------\n\n$templates[''tpl''] = isset($tplContainer) ? $ditto->template->fetch($tplContainer): $defaultTemplates[''tpl''];\n/*\n    Param: tplContainer\n\n    Purpose:\n    Container template for the archive\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year''] = isset($tplYear) ? $ditto->template->fetch($tplYear): $defaultTemplates[''year''];\n/*\n    Param: tplYear\n\n    Purpose:\n    Template for the year item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year_inner''] = isset($tplYearInner) ? $ditto->template->fetch($tplYearInner): $defaultTemplates[''year_inner''];\n/*\n    Param: tplYearInner\n\n    Purpose:\n    Template for the year item (the ul to hold the year template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month''] = isset($tplMonth) ? $ditto->template->fetch($tplMonth): $defaultTemplates[''month''];\n/*\n    Param: tplMonth\n\n    Purpose:\n    Template for the month item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month_inner''] = isset($tplMonthInner) ? $ditto->template->fetch($tplMonthInner): $defaultTemplates[''month_inner''];\n/*\n    Param: tplMonthInner\n\n    Purpose:\n    Template for the month item  (the ul to hold the month template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''item''] = isset($tplItem) ? $ditto->template->fetch($tplItem): $defaultTemplates[''item''];\n/*\n    Param: tplItem\n\n    Purpose:\n    Template for the individual item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n\n$ditto->addField("date","display","custom");\n    // force add the date field if receiving data from a Ditto instance\n\n// ---------------------------------------------------\n//  Reflect\n// ---------------------------------------------------\n\nif (function_exists("reflect") === FALSE) {\nfunction reflect($templatesDocumentID, $showItems, $groupByYears, $resource, $templatesDateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir) {\n    global $modx;\n    $cal = array();\n    $output = '''';\n    $ph = array(''year''=>'''',''month''=>'''',''item''=>'''',''out''=>'''');\n    $build = array();\n    $stop = count($resource);\n\n    // loop and fetch all the results\n    for ($i = $start; $i < $stop; $i++) {\n        $date = getdate($resource[$i][$templatesDateSource]);\n        $year = $date["year"];\n        $month = $date["mon"];\n        $cal[$year][$month][] = $resource[$i];\n    }\n    if ($yearSortDir == "DESC") {\n        krsort($cal);\n    } else {\n        ksort($cal);\n    }\n    foreach ($cal as $year=>$months) {\n        if ($monthSortDir == "ASC") {\n            ksort($months);\n        } else {\n            krsort($months);\n        }\n        $build[$year] = $months;\n    }\n    \n    foreach ($build as $year=>$months) {\n        $r_year = '''';\n        $r_month = '''';\n        $r_month_2 = '''';\n        $year_count = 0;\n        $items = array();\n        \n        foreach ($months as $mon=>$month) {\n            $month_text = strftime("%B", mktime(10, 10, 10, $mon, 10, $year));\n            $month_url = $ditto->buildURL("month=".$mon."&year=".$year."&day=false&start=0",$templatesDocumentID,$id);\n            $month_count = count($month);\n            $year_count += $month_count;\n            $r_month = $ditto->template->replace(array("year"=>$year,"month"=>$month_text,"url"=>$month_url,"count"=>$month_count),$templates[''month'']);\n            if ($showItems) {\n                foreach ($month as $item) {\n                    $items[$year][$mon][''items''][] = $ditto->render($item, $templates[''item''], false, $templatesDateSource, $dateFormat, array(),$phx);\n                }\n                $r_month_2 = $ditto->template->replace(array(''wrapper'' => implode('''',$items[$year][$mon][''items''])),$templates[''month_inner'']);\n                $items[$year][$mon] = $ditto->template->replace(array(''wrapper'' => $r_month_2),$r_month);\n            } else {\n                $items[$year][$mon] = $r_month;\n            }\n        }\n        if ($groupByYears) {\n            $year_url = $ditto->buildURL("year=".$year."&month=false&day=false&start=0",$templatesDocumentID,$id);\n            $r_year =  $ditto->template->replace(array("year"=>$year,"url"=>$year_url,"count"=>$year_count),$templates[''year'']);\n            $var = $ditto->template->replace(array(''wrapper''=>implode('''',$items[$year])),$templates[''year_inner'']);\n            $output .= $ditto->template->replace(array(''wrapper''=>$var),$r_year);\n        } else {\n            $output .= implode('''',$items[$year]);\n        }\n    }\n\n    $output = $ditto->template->replace(array(''wrapper''=>$output),$templates[''tpl'']);\n    $modx->setPlaceholder($id.''reset'',$ditto->buildURL(''year=false&month=false&day=false'',$templatesDocumentID,$id));\n\nreturn $output;\n    \n}\n}\n\nreturn reflect($targetID, $showItems, $groupByYears, $resource, $dateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir);', 0, '', ''),
(10, 'WebSignup', '<strong>1.1.1</strong> Basic Web User account creation/signup system', 0, 3, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Usage:     \n#    Allows a web user to signup for a new web account from the website\n#    This snippet provides a basic set of form fields for the signup form\n#    You can customize this snippet to create your own signup form\n#\n# Params:    \n#\n#    &tpl        - (Optional) Chunk name or document id to use as a template\n#	    		   If custom template AND captcha on AND using WebSignup and \n#                  WebLogin on the same page make sure you have a field named\n#                  cmdwebsignup. In the default template it is the submit button \n#                  One can use a hidden field.\n#    &groups     - Web users groups to be assigned to users\n#    &useCaptcha - (Optional) Determine to use (1) or not to use (0) captcha\n#                  on signup form - if not defined, will default to system\n#                  setting. GD is required for this feature. If GD is not \n#                  available, useCaptcha will automatically be set to false;\n#                  \n#    Note: Templats design:\n#        section 1: signup template\n#        section 2: notification template \n#\n# Examples:\n#\n#    [[WebSignup? &tpl=`SignupForm` &groups=`NewsReaders,WebUsers`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n    return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl = isset($tpl)? $tpl:"";\n$useCaptcha = isset($useCaptcha)? $useCaptcha : $modx->config[''use_captcha''] ;\n// Override captcha if no GD\nif ($useCaptcha && !gd_info()) $useCaptcha = 0;\n\n# setup web groups\n$groups = isset($groups) ? array_filter(array_map(''trim'', explode('','', $groups))):array();\n\n# System settings\n$isPostBack        = count($_POST) && isset($_POST[''cmdwebsignup'']);\n\n$output = '''';\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/websignup.inc.php";\n\n# Return\nreturn $output;', 0, '&tpl=Template;string;', ''),
(11, 'AjaxSearch', '<strong>1.10.1</strong> Ajax and non-Ajax search that supports results highlighting', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/ajaxSearch/snippet.ajaxSearch.php'';', 0, '', ''),
(12, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its "ultimate" non-root parent', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/ultimateparent/snippet.ultimateparent.php'';', 0, '', ''),
(13, 'WebLogin', '<strong>1.1.1</strong> Allows webusers to login to protected pages in the website, supporting multiple user groups', 0, 3, 0, '# Created By Raymond Irving 2004\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&loginhomeid 	- (Optional)\n#		redirects the user to first authorized page in the list.\n#		If no id was specified then the login home page id or \n#		the current document id will be used\n#\n#	&logouthomeid 	- (Optional)\n#		document id to load when user logs out	\n#\n#	&pwdreqid 	- (Optional)\n#		document id to load after the user has submited\n#		a request for a new password\n#\n#	&pwdactid 	- (Optional)\n#		document id to load when the after the user has activated\n#		their new password\n#\n#	&logintext		- (Optional) \n#		Text to be displayed inside login button (for built-in form)\n#\n#	&logouttext 	- (Optional)\n#		Text to be displayed inside logout link (for built-in form)\n#	\n#	&tpl			- (Optional)\n#		Chunk name or document id to as a template\n#				  \n#	Note: Templats design:\n#			section 1: login template\n#			section 2: logout template \n#			section 3: password reminder template \n#\n#			See weblogin.tpl for more information\n#\n# Examples:\n#\n#	[[WebLogin? &loginhomeid=`8` &logouthomeid=`1`]] \n#\n#	[[WebLogin? &loginhomeid=`8,18,7,5` &tpl=`Login`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n# deprecated params - only for backward compatibility\nif(isset($loginid)) $loginhomeid=$loginid;\nif(isset($logoutid)) $logouthomeid = $logoutid;\nif(isset($template)) $tpl = $template;\n\n# Snippet customize settings\n$liHomeId	= isset($loginhomeid)? array_filter(array_map(''intval'', explode('','', $loginhomeid))):array($modx->config[''login_home''],$modx->documentIdentifier);\n$loHomeId	= isset($logouthomeid)? $logouthomeid:$modx->documentIdentifier;\n$pwdReqId	= isset($pwdreqid)? $pwdreqid:0;\n$pwdActId	= isset($pwdactid)? $pwdactid:0;\n$loginText	= isset($logintext)? $logintext:''Login'';\n$logoutText	= isset($logouttext)? $logouttext:''Logout'';\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$webLoginMode = isset($_REQUEST[''webloginmode''])? $_REQUEST[''webloginmode'']: '''';\n$isLogOut		= $webLoginMode==''lo'' ? 1:0;\n$isPWDActivate	= $webLoginMode==''actp'' ? 1:0;\n$isPostBack		= count($_POST) && (isset($_POST[''cmdweblogin'']) || isset($_POST[''cmdweblogin_x'']));\n$txtPwdRem 		= isset($_REQUEST[''txtpwdrem''])? $_REQUEST[''txtpwdrem'']: 0;\n$isPWDReminder	= $isPostBack && $txtPwdRem==''1'' ? 1:0;\n\n$site_id = isset($site_id)? $site_id: '''';\n$cookieKey = substr(md5($site_id."Web-User"),0,15);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once ($modx->config[''site_manager_path''] . "includes/crypt.class.inc.php");\n\nif ($isPWDActivate || $isPWDReminder || $isLogOut || $isPostBack) {\n	# include the logger class\n	include_once $modx->config[''site_manager_path''] . "includes/log.class.inc.php";\n	include_once $snipPath."weblogin/weblogin.processor.inc.php";\n}\n\ninclude_once $snipPath."weblogin/weblogin.inc.php";\n\n# Return\nreturn $output;\n', 0, '&loginhomeid=Login Home Id;string; &logouthomeid=Logout Home Id;string; &logintext=Login Button Text;string; &logouttext=Logout Button Text;string; &tpl=Template;string;', ''),
(14, 'Personalize', '<strong>2.1</strong> Personalize snippet', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/personalize/snippet.personalize.php'';', 0, '', ''),
(15, 'if', '<strong>1.2</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/if/snippet.if.php'';', 0, '', ''),
(16, 'Wayfinder', '<strong>2.0.4</strong> Completely template-driven and highly flexible menu builder', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/wayfinder/snippet.wayfinder.php'';\n', 0, '', ''),
(17, 'FirstChildRedirect', '<strong>2.0</strong> Automatically redirects to the first child of a Container Resource', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/firstchildredirect/snippet.firstchildredirect.php'';', 0, '', ''),
(18, 'multiTV', '', 0, 0, 0, '\r\n/**\r\n * multiTV\r\n *\r\n * Custom Template Variabe containing a sortable multi item list or a datatable\r\n *\r\n * @category    snippet, tv\r\n * @version     2.0.4\r\n * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)\r\n * @author      Jako\r\n * @internal    @modx_category Content\r\n * @internal    @installset base, sample\r\n */\r\nreturn require MODX_BASE_PATH . ''assets/tvs/multitv/multitv.snippet.php'';\r\n', 0, '', ' '),
(19, 'clients', '', 0, 0, 0, '\r\n$dir = ''clients/''; // Папка с изображениями\r\n$files = scandir($dir); // Берём всё содержимое директории\r\n$rand = array();\r\nfor($i = 0; $i <= 9; $i++){\r\n	$r = rand(0, count($files) - 3);\r\n	while(in_array($r, $rand) || $files[$r] == "." || $files[$r] == ".."){\r\n		$r = rand(0, count($files) - 3);\r\n	}\r\n	$rand[] = $r;\r\n}\r\nforeach($rand as $r){\r\n	$path = $dir.$files[$r]; // Получаем путь к картинке     \r\n	echo "<div><img src=''$path'' alt=''Наш клиет'' title=''Наш клиент''/></div>"; // Вывод превью картинки\r\n}\r\n', 0, '', ' '),
(20, 'city_info', '', 0, 0, 0, '\r\n$output="";\r\n$a=[];\r\nif(isset($_POST[''city''])){\r\n	setcookie("city", $_POST[''city''], time()+24*3600);\r\n	$city = $_POST[''city''];\r\n} else {\r\n	if(!isset($_COOKIE[''city''])) {$city = "Павлодар"; setcookie("city", "Павлодар", time()+24*3600);} else $city = $_COOKIE[''city''];\r\n	\r\n}\r\n\r\n\r\n$dbprefix = $modx->db->config[''table_prefix''];\r\n$mod_table = $dbprefix."manager_CITY_INFO";\r\n$sql = "SELECT * FROM {$mod_table} WHERE city=''".$city."''";\r\n$result = $modx->db->query($sql);\r\nwhile( $row = $modx->db->getRow( $result ) ) {\r\n	$a[]=$row;\r\n}\r\n\r\nif($value=="all"){\r\n	$result2 = $modx->db->query("SELECT * FROM $mod_table ");\r\n	while( $row2 = $modx->db->getRow( $result2 ) ) {\r\n		$output.=''<input type="submit" name="city" value="''.$row2[''city''].''"/>'';	\r\n	}\r\n}\r\n\r\nif($value=="city"){\r\n	$output=$city;\r\n}\r\n\r\nif($value=="phone"){\r\n	$output=$a[0][''phone''];\r\n}\r\n\r\nif($value=="email"){\r\n	$output=$a[0][''email''];\r\n}\r\n\r\nif($value=="page_text"){\r\n	$output=$a[0][''page_text''];\r\n}\r\n\r\nif($value=="map"){\r\n	$output=$a[0][''map''];\r\n}\r\n\r\nif($value==''select''){\r\n	$result2 = $modx->db->query("SELECT * FROM $mod_table ");\r\n	while( $row2 = $modx->db->getRow( $result2 ) ) {\r\n		$output.=''<option value="''.$row2[''city''].''">''.$row2[''city''].''</option>'';	\r\n	}\r\n}\r\n\r\nreturn $output;\r\n', 0, '', ' ');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_templates`
--

CREATE TABLE IF NOT EXISTS `srv_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.' AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `srv_site_templates`
--

INSERT INTO `srv_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`) VALUES
(3, 'Minimal Template', 'Default minimal empty template (content returned only)', 0, 0, '', 0, '[*content*]', 0),
(4, 'MODxHost', '<strong>1.0</strong> Legacy MODX Host template including dropdown menu', 0, 1, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n\n<head>\n  <title>[(site_name)] | [*pagetitle*]</title>\n  <meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" />\n  <base href="[(site_url)]"></base>\n  <link rel="stylesheet" href="assets/templates/modxhost/layout.css" type="text/css" media="screen" />\n  <link rel="stylesheet" href="assets/templates/modxhost/modxmenu.css" type="text/css" media="screen" />\n  <link rel="stylesheet" href="assets/templates/modxhost/form.css" type="text/css" media="screen" />\n  <link rel="stylesheet" href="assets/templates/modxhost/modx.css" type="text/css" media="screen" />\n  <link rel="stylesheet" href="assets/templates/modxhost/print.css" type="text/css" media="print" />\n  <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="[(site_url)][~11~]" />\n  <script src="[(site_manager_url)]media/script/mootools/mootools.js" type="text/javascript"></script>\n  <script src="assets/templates/modxhost/drop_down_menu.js" type="text/javascript"></script>\n</head>\n<body>\n<div id="wrapper">\n  <div id="minHeight"></div>\n  <div id="outer">\n    <div id="inner">\n      <div id="right">\n        <div id="right-inner">\n          <h1 style="text-indent: -5000px;padding: 0px; margin:0px; font-size: 1px;">[(site_name)]</h1>\n          <div id="sidebar">\n            <h2>News:</h2>\n            [[Ditto? &parents=`2` &display=`2` &total=`20` &removeChunk=`Comments` &tpl=`nl_sidebar`]]\n            <div id="recentdocsctnr">\n              <h2>Most Recent:</h2>\n				<a name="recentdocs"></a><ul class="LIn_shortMode">[[Ditto?parents=0&display=5&tpl=''@CODE:<li><a href="[+url+]" title="[+pagetitle+]">[+pagetitle+]</a> <span class="LIn_date">[+date+]</span> <span class="LIn_desc"></span></li>'']]</ul> </div>\n            <h2>Login:</h2>\n            <div id="sidebarlogin">[!WebLogin? &tpl=`WebLoginSideBar` &loginhomeid=`[(site_start)]`!]</div>\n            <h2>Meta:</h2>\n            <p><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional">Valid <abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a></p>\n            <p><a href="http://jigsaw.w3.org/css-validator/check/referer" title="This page uses valid Cascading Stylesheets" rel="external">Valid <abbr title="W3C Cascading Stylesheets">css</abbr></a></p>\n            <p><a href="http://modx.com" title="Ajax CMS and PHP Application Framework">MODX</a></p>\n          </div>\n          <!-- close #sidebar -->\n        </div>\n        <!-- end right inner-->\n      </div>\n      <!-- end right -->\n      <div id="left">\n        <div id="left-inner">\n          [[Breadcrumbs?]]\n          <div id="content">\n            <div class="post">\n              <h2>[*longtitle*]</h2>\n              [*#content*] </div>\n            <!-- close .post (main column content) -->\n          </div>\n          <!-- close #content -->\n        </div>\n        <!-- end left-inner -->\n      </div>\n      <!-- end left -->\n    </div>\n    <!-- end inner -->\n    <div id="clearfooter"></div>\n    <div id="header">\n      <h1><a id="logo" href="[~[(site_start)]~]" title="[(site_name)]">[(site_name)]</a></h1>\n\n      <div id="search"><!--search_terms--><span id="search-txt">SEARCH</span><a name="search"></a>[!AjaxSearch? &ajaxSearch=`1` &landingPage=`8` &moreResultsPage=`8` &addJscript=`0` &showIntro=`0` &ajaxMax=`5` &extract=`1`!]</div>\n      <div id="ajaxmenu"> [[Wayfinder?startId=`0` &outerTpl=`mh.OuterTpl` &innerTpl=`mh.InnerTpl` &rowTpl=`mh.RowTpl` &innerRowTpl=`mh.InnerRowTpl` &firstClass=`first` &hereClass=``]] </div>\n      <!-- end topmenu -->\n    </div>\n    <!-- end header -->\n    <br style="clear:both;height:0;font-size: 1px" />\n    <div id="footer">\n      <p> <a href="http://modx.com" title="Ajax CMS and PHP Application Framework">Powered\n          by MODX</a> &nbsp;<a href="http://modx.com/" title="Template Designed by modXhost.com">Template &copy; 2006-2011\n          modXhost.com</a><br />\n        Memory: [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document retrieved\n        from [^s^]. </p>\n    </div>\n    <!-- end footer -->\n  </div>\n  <!-- end outer div -->\n</div>\n<!-- end wrapper -->\n</body>\n</html>', 0),
(5, 'mainpage', 'Шаблон главной страницы сайта', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang="ru">\r\n	{{head}}\r\n<body>\r\n	{{navi}}\r\n	\r\n	{{hero-main}}\r\n			\r\n	<div id="empty">\r\n		<div id="wrapper">\r\n			{{catalogue}}\r\n		</div>\r\n	</div>\r\n		\r\n	<div id="rew">\r\n		<div id="wrapper">\r\n			<div class="rew-inner">\r\n				<div class="rew-white">\r\n					<img src="assets/templates/serv/images/face.png" />\r\n					<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n					<div class="name">— Андрей / Екатеринбург, Россия</div>\r\n				</div>\r\n				<div class="rew-blue">\r\n					<img src="assets/templates/serv/images/face.png" />\r\n					<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n					<div class="name">— Андрей / Екатеринбург, Россия</div>\r\n				</div>\r\n				<div class="rew-blue">\r\n					<img src="assets/templates/serv/images/face.png" />\r\n					<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n					<div class="name">— Андрей / Екатеринбург, Россия</div>\r\n				</div>\r\n				<div class="rew-white">\r\n					<img src="assets/templates/serv/images/face.png" />\r\n					<p>Спасибо за помощь. Хочу сказать, что здесь лучшая поддержка клиентов, с которой я когда-либо сталкивался онлайн. Молодцы!</p>\r\n					<div class="name">— Андрей / Екатеринбург, Россия</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n			\r\n	<div id="blue">\r\n		<div id="wrapper">\r\n			<div class="prem">\r\n				<h3>ТАМ, ГДЕ И ВЫ</h3>\r\n				<img src="assets/templates/serv/images/kz.png" />\r\n				<p>Мы работаем во многих городах. Если нас где-то ещё нет, мы обязательно скоро там появимся!</p>\r\n			</div>\r\n			<div class="prem">\r\n				<h3>БЕЗОПАСНО</h3>\r\n				<img src="assets/templates/serv/images/shield.png" />\r\n				<p>Все наши исполнители проходят тщательную проверку. Мы проверяем их через службу безопасности, проводим собеседование и тестирование </p>\r\n			</div>\r\n			<div class="prem">\r\n				<h3>ПРОСТО!</h3>\r\n				<img src="assets/templates/serv/images/ok.png" />\r\n				<p>Достаточно сделать заказ на сайте или по телефону. Остальное сделаем мы!</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n		\r\n		\r\n	<div id="black">\r\n		<div id="wrapper">\r\n			<h1>как это работает?</h1>\r\n			<div class="blackprem">\r\n				<img src="assets/templates/serv/images/bottom_tel.png" />\r\n				<p>Сделайте заявку на сайте или по телефону</p>\r\n			</div>\r\n			\r\n			<div class="arrow"></div>\r\n			\r\n			<div class="blackprem">\r\n				<img src="assets/templates/serv/images/bottom_money.png" />\r\n				<p>Специалист приедет и проведет расчет стоимости</p>\r\n			</div>\r\n			\r\n			<div class="arrow"></div>\r\n			\r\n			<div class="blackprem">\r\n				<img src="assets/templates/serv/images/bottom_instrument.png" />\r\n				<p>С Вашего согласия исполнитель приступит к работе</p>\r\n			</div>\r\n			\r\n			<div class="arrow"></div>\r\n			\r\n			<div class="blackprem">\r\n				<img src="assets/templates/serv/images/bottom_ok.png" />\r\n				<p>Принимаете работу и производите оплату </p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n			\r\n	<div id="blue">\r\n		<div id="wrapper">\r\n			<h1>наши клиенты</h1>\r\n			<div id="clients">[!clients!]</div>\r\n		</div>\r\n	</div>\r\n	\r\n	<div id="orange">\r\n		<div id="wrapper">\r\n			<p>ДЛЯ ПОЛУЧЕНИЯ УСЛУГИ ЗАПОЛНИТЕ ЗАЯВКУ</p>\r\n			<div class="order-form">\r\n			[!eForm? &formid=`OrderForm` &subject=`Новая заявка` &to=`[[city_info?&value=`email`]]` &tpl=`OrderForm` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue` !]\r\n			</div>\r\n		</div>\r\n	</div>\r\n	{{footer}}\r\n</body>\r\n</html>', 0),
(6, 'service', 'Шаблон страницы услуги', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang="ru">\r\n{{head2}}\r\n<body>\r\n  	{{navi}}\r\n	{{hero-service}}\r\n	<div id="empty">\r\n		<div id="wrapper">\r\n			<div class="left">\r\n				<div class="hotline">\r\n					<img src="assets/templates/serv/images/hot-girl.png" />\r\n					<p>ЗВОНИТЕ!<br />И Я ПОМОГУ ВАМ<br />ОФОРМИТЬ ЗАЯВКУ!<br /><span>[!city_info? &value=`phone`!]</span></p>\r\n					<div class="or">ГОРЯЧАЯ ЛИНИЯ С  9-00 ДО 22-00</div>\r\n				</div>\r\n				\r\n				<div class="howitworks">\r\n					<div class="hiw1">\r\n						<img src="assets/templates/serv/images/bottom_tel.png" /><br />Сделайте заявку на сайте или по телефону\r\n					</div>\r\n					\r\n					<div class="arrow_right"></div>\r\n					\r\n					<div class="hiw2">\r\n						<img src="assets/templates/serv/images/bottom_money.png" /><br />Специалист приедет и проведет расчет стоимости\r\n					</div>\r\n					\r\n					<div class="arrow_bottom"></div>\r\n					\r\n					<div class="hiw4">\r\n						<img src="assets/templates/serv/images/bottom_ok.png" /><br />Принимаете работу и производите оплату\r\n					</div>\r\n					\r\n					<div class="arrow_left"></div>\r\n					\r\n					<div class="hiw3">\r\n						<img src="assets/templates/serv/images/bottom_instrument.png" /><br />С Вашего согласия исполнитель приступит к работе\r\n					</div>\r\n				</div>\r\n			</div>\r\n			\r\n			<div class="right">\r\n				[!eForm? &formid=`indexzaya` &subject=`Новая заявка на сайте [(site_name)]` &to=`[[city_info? &value=`email`]]` &tpl=`indexzaya` &report=`indexzayaReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue`!]\r\n			</div>\r\n\r\n			<div class="cat-2">\r\n			{{cat_2}}\r\n			</div>\r\n		</div>\r\n	</div>\r\n	{{footer}}\r\n</body>\r\n</html>', 0),
(12, 'firstpage', '', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang="ru" style="width:100%;">\r\n	{{head}}\r\n	<body style="width: 100%; float: none;background: url(assets/templates/serv/images/glava.jpg) no-repeat;background-size: cover;">\r\n		<div id="firstpage_image"></div>\r\n		<table valign="center" align="center" style="width:100%; height:100%;text-align:center">\r\n			<tr>\r\n				<td>\r\n					<h2 class="logo_home">Мир Услуг</h2>\r\n					<div class="firstpage">\r\n					<form method="POST" action="[~1~]">\r\n						<select name="city" onchange="$(this).parent().submit()"><option>Выберите город</option>[[city_info? &value="select"]]</select>\r\n					</form>\r\n					</div>\r\n				</td>\r\n			</tr>\r\n		</table>\r\n	</body>\r\n</html>', 0),
(7, 'text', 'Шаблон текстовой страницы', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang="ru">\r\n	{{head}}\r\n<body>\r\n	{{navi}}\r\n	\r\n	{{hero-inside}}\r\n			\r\n	<div id="empty">\r\n		<div id="wrapper">\r\n			[*content*]\r\n		</div>\r\n	</div>\r\n		\r\n	{{footer}}\r\n</body>\r\n</html>', 0),
(8, 'cont', 'Шаблон страницы контактов', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang="ru">\r\n	{{head}}\r\n<body>\r\n	{{navi}}\r\n	\r\n	{{hero-main}}\r\n			\r\n	<div id="empty-cont">\r\n		<div id="wrapper">\r\n			<h1>[*pagetitle*]</h1>\r\n			<div class="cont-info">[!city_info? &value=`page_text`!]</div>\r\n			{{cont}}\r\n		</div>\r\n	</div>\r\n	\r\n	<div class="map">\r\n		[!city_info? &value=`map`!]\r\n	</div>\r\n		\r\n	{{footer}}\r\n</body>\r\n</html>', 0),
(9, 'vacancy', 'Шаблон для  исполнителей', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang="ru">\r\n	{{head}}\r\n<body>\r\n	{{navi}}\r\n	\r\n	{{hero-title}}\r\n			\r\n	<div id="orange">\r\n		<div id="wrapper">\r\n			<div class="vac">\r\n				<h1>ПОПУЛЯРНЫЕ УСЛУГИ</h1>\r\n				<p>- ВОЗМОЖНОСТЬ ЗАРАБАТЫВАТЬ И ЧУВСТВОВАТЬ СЕБЯ СВОБОДНЫМ</p>\r\n				<p>- ВЫ САМИ ВЫБИРАЕТЕ СЕБЕ ПРОФЕССИЮ, В РАМКАХ КОТОРОЙ ВАМ БУДУТ ПОСТУПАТЬ ЗАЯВКИ.</p>\r\n				<p>- ЗА ИХ ВЫПОЛНЕНИЕ ВЫ БУДЕТЕ ПОЛУЧАТЬ ДЕНЕЖНОЕ ВОЗНАГРАЖДЕНИЕ.</p>\r\n			</div>\r\n			\r\n			<div class="vacprem">\r\n				<img src="assets/templates/serv/images/ico_1.png" />\r\n				<p><span>СВОБОДНЫЙ ГРАФИК</span><br />РАБОТАЙТЕ ТОГДА, КОГДА ВАМ ЭТО УДОБНО</p>\r\n			</div>\r\n			\r\n			<div class="vacprem">\r\n				<img src="assets/templates/serv/images/ico_2.png" />\r\n				<p><span>ЗАРАБАТЫВАЙТЕ ДОСТОЙНО</span><br />СКОЛЬКО, ЗАВИСИТ ОТ ВАС (ПРОЦЕНТ С ЗАКАЗА + БОНУСЫ)</p>\r\n			</div>\r\n			\r\n			<div class="vacprem">\r\n				<img src="assets/templates/serv/images/ico_3.png" />\r\n				<p><span>ЗАНИМАЙТЕСЬ ЛЮБИМЫМ ДЕЛОМ</span><br />ЗАКАЗЫ ПО ВАШЕМУ ПРОФИЛЮ</p>\r\n			</div>\r\n			\r\n			<div class="vacprem">\r\n				<img src="assets/templates/serv/images/ico_4.png" />\r\n				<p><span>SMS-УВЕДОМЛЕНИЯ</span><br />ВЫ БУДЕТЕ ОПЕРАТИВНО ПРОИНФОРМИРОВАНЫ О НОВЫХ ЗАЯВКАХ</p>\r\n			</div>\r\n			\r\n			<div class="vacprem">\r\n				<img src="assets/templates/serv/images/ico_5.png" />\r\n				<p><span>ОПЛАТА СРАЗУ</span><br />ВЫ ПОЛУЧАЕТЕ ДЕНЬГИ СРАЗУ ПОСЛЕ ВЫПОЛНЕНИЯ ЗАКАЗА</p>\r\n			</div>\r\n			\r\n			<div class="vacprem">\r\n				<img src="assets/templates/serv/images/ico_6.png" />\r\n				<p><span>РАБОТА РЯДОМ</span><br />БЕРИТЕ ЗАКАЗЫ, КОТОРЫЕ РЯДОМ С ВАМИ</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n			\r\n			\r\n	\r\n	<div id="empty">\r\n		<div id="wrapper">\r\n			<h2>нам нужны</h2>\r\n			<ul class="orange-dot">\r\n				<li>МАСТЕР ПО РЕМОНТУ ПК</li>\r\n				<li>САНТЕХНИК</li>\r\n				<li>ЭЛЕКТРИК</li>\r\n				<li>ПЛОТНИК</li>\r\n			</ul>\r\n			\r\n			<ul class="orange-dot">\r\n				<li>МАСТЕР НА ЧАС</li>\r\n				<li>ОТДЕЛОЧНИК</li>\r\n				<li>УСТАНОВЩИК ДВЕРЕЙ</li>\r\n				<li>КУРЬЕР</li>\r\n			</ul>\r\n			\r\n			<ul class="orange-dot">\r\n				<li>ДИЗАЙНЕР</li>\r\n				<li>ФОТОГРАФ</li>\r\n				<li>РАЗНОРАБОЧИЙ</li>\r\n				<li>ВОДИТЕЛЬ «ГАЗЕЛИ»</li>\r\n			</ul>\r\n			\r\n			<ul class="orange-dot">\r\n				<li>ГРУЗЧИК</li>\r\n				<li>УБОРЩИК</li>\r\n				<li>УСТАНОВЩИК СПУТНИКОВЫХ ТАРЕЛОК</li>\r\n				<li>МАСТЕР ПО РЕМОНТУ БЫТ. ТЕХНИКИ</li>\r\n			</ul>\r\n		</div>\r\n	</div>		\r\n	\r\n	<div id="orange">\r\n		<div id="wrapper">\r\n			<p>ХОТИТЕ РАБОТАТЬ С НАМИ?</p>\r\n			<div class="order-form">\r\n				<a href="[(site_url)]/index.php?id=65#form1"><div class="button">Стать исполнителем</div></a>\r\n			</div>\r\n		</div>\r\n	</div>\r\n		\r\n	<div id="black">\r\n		<div id="wrapper">\r\n			<div class="treb">\r\n				<p><span>ТРЕБОВАНИЯ:</span><br />наличие собственного инструмента, коммуникабельность, опыт работы (можно неофициальный), отсутствие вредных привычек.</p>\r\n			</div>\r\n			\r\n			<div class="treb">\r\n				<p><span>ОБЯЗАННОСТИ:</span><br />работа на территории заказчика(на выезде), качественное исполнение должностных обязанностей, согласование с клиентом стоимости работ.</p>\r\n			</div>\r\n			\r\n			<div class="treb">\r\n				<p><span>ЗАРАБОТНАЯ ПЛАТА:</span><br />ежедневная, сдельная (процент от заявки + оплата выезда), высокая. Премии по результатам работы.</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n			\r\n	<div id="red">\r\n		<div id="wrapper">\r\n			<h1>как стать исполнителем</h1>\r\n			<div class="treb2">\r\n				<img src="assets/templates/serv/images/howto_1.png" />\r\n				<p>ЗАПОЛНИТЕ АНКЕТУ ИСПОЛНИТЕЛЯ (НАХОДИТСЯ НИЖЕ)</p>\r\n			</div>\r\n			\r\n			<div class="treb2">\r\n				<img src="assets/templates/serv/images/howto_2.png" />\r\n				<p>МЫ СВЯЖЕМСЯ С ВАМИ В ТЕЧЕНИИ 3-Х ДНЕЙ И  ПРОВЕДЕМ НЕБОЛЬШОЕ СОБЕСЕДОВАНИЕ ПО ТЕЛЕФОНУ</p>\r\n			</div>\r\n			\r\n			<div class="treb2">\r\n				<img src="assets/templates/serv/images/howto_3.png" />\r\n				<p>ВНИМАТЕЛЬНО ОЗНАКОМЬТЕСЬ С ПРИСЛАННЫМИ ИНСТРУКЦИЯМИ И ПРАЙС-ЛИСТОМ</p>\r\n			</div>\r\n			\r\n			<div class="treb-bottom">И МОЖЕТЕ ПРИСТУПАТЬ К РАБОТЕ!</div>\r\n			\r\n		</div>\r\n	</div>\r\n	\r\n	<a name="form1"></a>\r\n	<div id="empty">\r\n		<div id="wrapper">\r\n			<a name="form1">\r\n			<h1>анкета исполнителя</h1>\r\n			<div>[!eForm? &formid=`anketa` &tpl=`anketaForm` &report=`vacancyReportTpl` &thankyou=`` &vericode=`0` &to=`ibragim@nur.kz` &subject=`Анкета исполнителя`!]</div>\r\n			</a>\r\n		</div>\r\n	</div>\r\n	\r\n	<div id="black">\r\n		<div id="wrapper">\r\n			<h1>как выполнять заказы?</h1>\r\n			<div class="num">\r\n				<div class="numor">1</div>\r\n				<div class="txt"><span>ПРИМИТЕ ЗАЯВКУ</span><br />(ПО ТЕЛЕФОНУ, СМС ИЛИ ИНТЕРНЕТ)</div>\r\n			</div>\r\n			\r\n			<div class="num">\r\n				<div class="numor">2</div>\r\n				<div class="txt"><span>ВЫПОЛНИТЕ ЗАКАЗ</span><br />(СОГЛАСНО НАШИМ ФИРМЕННЫМ СТАНДАРТАМ)</div>\r\n			</div>\r\n			\r\n			<div class="num">\r\n				<div class="numor">3</div>\r\n				<div class="txt"><span>ПОЛУЧИТЕ ОПЛАТУ ОТ КЛИЕНТА</span><br />(ОПОВЕСТИТЕ КОМПАНИЮ О ВЫПОЛНЕНИИ ЗАКАЗА)</div>\r\n			</div>\r\n			\r\n			<div class="num">\r\n				<div class="numor">4</div>\r\n				<div class="txt"><span>ОПЛАТИТЕ КОМИССИЮ КОМПАНИИ</span><br />(НАЛИЧНЫМИ, ЧЕРЕЗ ТЕРМИНАЛЫ ИЛИ НА КАРТУ)</div>\r\n			</div>\r\n			\r\n		</div>\r\n	</div>\r\n	\r\n	<div id="orange">\r\n		<div id="wrapper">\r\n			<p>ЧТОБЫ УЗНАТЬ О КОМПАНИИ БОЛЬШЕ<br />ПЕРЕЙДИТЕ НА НАШ <a href="/">ГЛАВНЫЙ САЙТ</a></p>\r\n			<div class="order-form">\r\n				<h3>ИЛИ ЗАПОЛНИТЕ ФОРМУ И МЫ ОТВЕТИМ НА ВСЕ ВАШИ ВОПРОСЫ</h3>\r\n			[!eForm? &formid=`OrderForm` &subject=`Новая заявка` &to=`[[city_info?&value=`email`]]` &attachmentField=`file` &tpl=`OrderForm` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue`!]\r\n			</div>\r\n		</div>\r\n	</div>\r\n	\r\n	{{footer}}\r\n</body>\r\n</html>', 0),
(11, 'serv', 'Шаблон вывода всех категорий', 0, 0, '', 0, '<!DOCTYPE html>\r\n<html lang="ru">\r\n	{{head}}\r\n<body>\r\n	{{navi}}\r\n	\r\n	{{hero-inside}}\r\n			\r\n	<div id="empty">\r\n		<div id="wrapper">\r\n			{{catalogue}}\r\n		</div>\r\n	</div>\r\n		\r\n	{{footer}}\r\n</body>\r\n</html>', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_tmplvars`
--

CREATE TABLE IF NOT EXISTS `srv_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables' AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `srv_site_tmplvars`
--

INSERT INTO `srv_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`) VALUES
(1, 'text', 'documentTags', 'Tags', 'Space delimited tags for the current document', 0, 1, 0, '', 0, '', '', ''),
(2, 'text', 'loginName', 'loginName', 'Conditional name for the Login menu item', 0, 1, 0, '', 0, '', '', '@EVAL if ($modx->getLoginUserID()) return ''Logout''; else return ''Login'';'),
(3, 'richtext', 'blogContent', 'blogContent', 'RTE for the new blog entries', 0, 1, 0, '', 0, 'RichText', '&w=383px&h=450px&edt=TinyMCE', ''),
(4, 'image', 'img-firm', 'Иконка категории для вывода в каталоге', '', 0, 0, 0, '', 0, '', '', ''),
(5, 'image', 'hero-img', 'Большая картинка категории', 'Большая картинка категории', 0, 0, 0, '', 0, '', '', ''),
(6, 'custom_tv', 'faq', 'Вопросы и ответы', '', 0, 0, 0, '@INCLUDE/assets/tvs/multitv/multitv.customtv.php', 0, '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_tmplvar_access`
--

CREATE TABLE IF NOT EXISTS `srv_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_tmplvar_contentvalues`
--

CREATE TABLE IF NOT EXISTS `srv_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table' AUTO_INCREMENT=31 ;

--
-- Дамп данных таблицы `srv_site_tmplvar_contentvalues`
--

INSERT INTO `srv_site_tmplvar_contentvalues` (`id`, `tmplvarid`, `contentid`, `value`) VALUES
(3, 4, 47, 'assets/images/ico_comp.png'),
(4, 4, 48, 'assets/images/ico_wash.png'),
(5, 4, 49, 'assets/images/ico_otvertka.png'),
(6, 4, 50, 'assets/images/ico_remont.png'),
(7, 4, 51, 'assets/images/ico_gruz.png'),
(8, 4, 52, 'assets/images/ico_box.png'),
(9, 4, 53, 'assets/images/ico_clean.png'),
(10, 4, 54, 'assets/images/ico_foto.png'),
(11, 4, 55, 'assets/images/ico_man.png'),
(12, 4, 56, 'assets/images/ico_auto.png'),
(13, 4, 57, 'assets/images/ico_fen.png'),
(14, 4, 58, 'assets/images/ico_utug.png'),
(15, 5, 47, 'assets/images/comp_back.jpg'),
(16, 5, 49, 'assets/images/vsee1.jpg'),
(17, 5, 50, 'assets/images/vsee2.jpg'),
(18, 5, 52, 'assets/images/kurer_back.jpg'),
(19, 5, 53, 'assets/images/vsee5.jpg'),
(20, 5, 54, 'assets/images/foto_back.jpg'),
(21, 5, 55, 'assets/images/vsee3.jpg'),
(22, 5, 56, 'assets/images/sto_back.jpg'),
(23, 5, 57, 'assets/images/beauty_back.jpg'),
(24, 6, 64, '{"fieldValue":[{"question":"dsadsad","answer":"sadsadsasdas"},{"question":"fdsadsfsda","answer":"fddsf dsaf dsaf asfdsafdas sdadfsa"},{"question":"fasdfdasfadsf","answer":"fdsdsafdsa fasfsadfsa fasd as"}],"fieldSettings":{"autoincrement":1}}'),
(25, 5, 48, 'assets/images/vsee.jpg'),
(26, 5, 58, 'assets/images/vsee4.jpg'),
(27, 6, 67, '[]'),
(28, 6, 46, '[]'),
(29, 6, 7, '[]'),
(30, 6, 68, '[]');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_site_tmplvar_templates`
--

CREATE TABLE IF NOT EXISTS `srv_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `srv_site_tmplvar_templates`
--

INSERT INTO `srv_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(1, 4, 0),
(2, 4, 0),
(3, 4, 0),
(4, 6, 0),
(5, 6, 0),
(6, 7, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_system_eventnames`
--

CREATE TABLE IF NOT EXISTS `srv_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='System Event Names.' AUTO_INCREMENT=1001 ;

--
-- Дамп данных таблицы `srv_system_eventnames`
--

INSERT INTO `srv_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(20, 'OnLoadWebPageCache', 4, ''),
(21, 'OnBeforeSaveWebPageCache', 4, ''),
(22, 'OnChunkFormPrerender', 1, 'Chunks'),
(23, 'OnChunkFormRender', 1, 'Chunks'),
(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(25, 'OnChunkFormSave', 1, 'Chunks'),
(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(27, 'OnChunkFormDelete', 1, 'Chunks'),
(28, 'OnDocFormPrerender', 1, 'Documents'),
(29, 'OnDocFormRender', 1, 'Documents'),
(30, 'OnBeforeDocFormSave', 1, 'Documents'),
(31, 'OnDocFormSave', 1, 'Documents'),
(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
(33, 'OnDocFormDelete', 1, 'Documents'),
(34, 'OnPluginFormPrerender', 1, 'Plugins'),
(35, 'OnPluginFormRender', 1, 'Plugins'),
(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
(37, 'OnPluginFormSave', 1, 'Plugins'),
(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(39, 'OnPluginFormDelete', 1, 'Plugins'),
(40, 'OnSnipFormPrerender', 1, 'Snippets'),
(41, 'OnSnipFormRender', 1, 'Snippets'),
(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(43, 'OnSnipFormSave', 1, 'Snippets'),
(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(45, 'OnSnipFormDelete', 1, 'Snippets'),
(46, 'OnTempFormPrerender', 1, 'Templates'),
(47, 'OnTempFormRender', 1, 'Templates'),
(48, 'OnBeforeTempFormSave', 1, 'Templates'),
(49, 'OnTempFormSave', 1, 'Templates'),
(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
(51, 'OnTempFormDelete', 1, 'Templates'),
(52, 'OnTVFormPrerender', 1, 'Template Variables'),
(53, 'OnTVFormRender', 1, 'Template Variables'),
(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(55, 'OnTVFormSave', 1, 'Template Variables'),
(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(57, 'OnTVFormDelete', 1, 'Template Variables'),
(58, 'OnUserFormPrerender', 1, 'Users'),
(59, 'OnUserFormRender', 1, 'Users'),
(60, 'OnBeforeUserFormSave', 1, 'Users'),
(61, 'OnUserFormSave', 1, 'Users'),
(62, 'OnBeforeUserFormDelete', 1, 'Users'),
(63, 'OnUserFormDelete', 1, 'Users'),
(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
(65, 'OnWUsrFormRender', 1, 'Web Users'),
(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(67, 'OnWUsrFormSave', 1, 'Web Users'),
(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(69, 'OnWUsrFormDelete', 1, 'Web Users'),
(70, 'OnSiteRefresh', 1, ''),
(71, 'OnFileManagerUpload', 1, ''),
(72, 'OnModFormPrerender', 1, 'Modules'),
(73, 'OnModFormRender', 1, 'Modules'),
(74, 'OnBeforeModFormDelete', 1, 'Modules'),
(75, 'OnModFormDelete', 1, 'Modules'),
(76, 'OnBeforeModFormSave', 1, 'Modules'),
(77, 'OnModFormSave', 1, 'Modules'),
(78, 'OnBeforeWebLogin', 3, ''),
(79, 'OnWebAuthentication', 3, ''),
(80, 'OnBeforeManagerLogin', 2, ''),
(81, 'OnManagerAuthentication', 2, ''),
(82, 'OnSiteSettingsRender', 1, 'System Settings'),
(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(84, 'OnUserSettingsRender', 1, 'System Settings'),
(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(89, 'OnManagerPageInit', 2, ''),
(90, 'OnWebPageInit', 5, ''),
(101, 'OnLoadDocumentObject', 5, ''),
(91, 'OnLoadWebDocument', 5, ''),
(92, 'OnParseDocument', 5, ''),
(93, 'OnManagerLoginFormRender', 2, ''),
(94, 'OnWebPageComplete', 5, ''),
(95, 'OnLogPageHit', 5, ''),
(96, 'OnBeforeManagerPageInit', 2, ''),
(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
(98, 'OnEmptyTrash', 1, 'Documents'),
(99, 'OnManagerLoginFormPrerender', 2, ''),
(100, 'OnStripAlias', 1, 'Documents'),
(200, 'OnCreateDocGroup', 1, 'Documents'),
(201, 'OnManagerWelcomePrerender', 2, ''),
(202, 'OnManagerWelcomeHome', 2, ''),
(203, 'OnManagerWelcomeRender', 2, ''),
(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
(205, 'OnDocDuplicate', 1, 'Documents'),
(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(207, 'OnManagerPreFrameLoader', 2, ''),
(208, 'OnManagerFrameLoader', 2, ''),
(209, 'OnManagerTreeInit', 2, ''),
(210, 'OnManagerTreePrerender', 2, ''),
(211, 'OnManagerTreeRender', 2, ''),
(212, 'OnManagerNodePrerender', 2, ''),
(213, 'OnManagerNodeRender', 2, ''),
(999, 'OnPageUnauthorized', 1, ''),
(1000, 'OnPageNotFound', 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_system_settings`
--

CREATE TABLE IF NOT EXISTS `srv_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `srv_system_settings`
--

INSERT INTO `srv_system_settings` (`setting_name`, `setting_value`) VALUES
('manager_theme', 'MODxRE'),
('settings_version', '1.0.15'),
('show_meta', '0'),
('server_offset_time', '0'),
('server_protocol', 'http'),
('manager_language', 'russian-UTF8'),
('modx_charset', 'UTF-8'),
('site_name', 'Мир Услуг'),
('site_start', '67'),
('error_page', '7'),
('unauthorized_page', '4'),
('site_status', '1'),
('site_unavailable_message', 'The site is currently unavailable'),
('track_visitors', '0'),
('top_howmany', '10'),
('auto_template_logic', 'sibling'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '1'),
('cache_default', '1'),
('search_default', '1'),
('friendly_urls', '1'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('captcha_words', 'Access,Better,BitCode,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Tattoo,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('emailsender', 'denis@istyle.kz'),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_host', ''),
('smtp_port', '25'),
('smtp_username', ''),
('emailsubject', 'Your login details'),
('number_of_logs', '100'),
('number_of_messages', '30'),
('number_of_results', '20'),
('use_editor', '1'),
('use_browser', '1'),
('rb_base_dir', '/home/itasi178/public_html/assets/'),
('rb_base_url', 'assets/'),
('which_editor', 'TinyMCE'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('strip_image_paths', '1'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('upload_files', 'aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip'),
('upload_maxsize', '1048576'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('filemanager_path', '/home/itasi178/public_html/'),
('theme_refresher', ''),
('manager_layout', '4'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '60'),
('manager_direction', 'ltr'),
('tinymce_editor_theme', 'editor'),
('tinymce_custom_plugins', 'style,advimage,advlink,searchreplace,print,contextmenu,paste,fullscreen,nonbreaking,xhtmlxtras,visualchars,media'),
('tinymce_custom_buttons1', 'undo,redo,selectall,separator,pastetext,pasteword,separator,search,replace,separator,nonbreaking,hr,charmap,separator,image,link,unlink,anchor,media,separator,cleanup,removeformat,separator,fullscreen,print,code,help'),
('tinymce_custom_buttons2', 'bold,italic,underline,strikethrough,sub,sup,separator,bullist,numlist,outdent,indent,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,styleselect,formatselect,separator,styleprops'),
('tree_show_protected', '0'),
('rss_url_news', 'http://feeds.feedburner.com/modx-announce'),
('rss_url_security', 'http://feeds.feedburner.com/modxsecurity'),
('validate_referer', '1'),
('datepicker_offset', '-10'),
('xhtml_urls', '1'),
('allow_duplicate_alias', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '1'),
('remember_last_tab', '0'),
('enable_bindings', '1'),
('seostrict', '1'),
('cache_type', '1'),
('maxImageWidth', '1600'),
('maxImageHeight', '1200'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('docid_incrmnt_method', '0'),
('make_folders', '0'),
('site_id', '5559828b2e178'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('error_reporting', '1'),
('send_errormail', '0'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words_default', 'MODX,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('smtp_secure', 'none'),
('reload_emailsubject', ''),
('emailsubject_default', 'Данные для авторизации'),
('reload_signupemail_message', ''),
('signupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_signup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('tree_page_click', '27'),
('resource_tree_node_name', 'pagetitle'),
('mce_editor_skin', 'default'),
('mce_template_docs', ''),
('mce_template_chunks', ''),
('mce_entermode', 'p'),
('mce_element_format', 'xhtml'),
('mce_schema', 'html5'),
('tinymce_custom_buttons3', ''),
('tinymce_custom_buttons4', ''),
('tinymce_css_selectors', 'left=justifyleft;right=justifyright'),
('rb_webuser', '0'),
('clean_uploaded_filename', '0'),
('sys_files_checksum', 'a:4:{s:36:"/home/itasi178/public_html/index.php";s:32:"c6f73908b7b0a58acfe95b0f844d134e";s:36:"/home/itasi178/public_html/.htaccess";s:32:"61a3be34923238e6cfe23b963fb82015";s:44:"/home/itasi178/public_html/manager/index.php";s:32:"30df65e2d71987b65a4258e318c21aaf";s:58:"/home/itasi178/public_html/manager/includes/config.inc.php";s:32:"9541a08bcda29478941f02b494e51d36";}');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_user_attributes`
--

CREATE TABLE IF NOT EXISTS `srv_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `srv_user_attributes`
--

INSERT INTO `srv_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
(1, 1, 'Default admin account', 1, 'denis@istyle.kz', '', '', 0, 0, 0, 23, 1432725399, 1432895804, 0, 'fjsjk7kgmf64rrb0gk7abca7s4', 0, 0, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_user_messages`
--

CREATE TABLE IF NOT EXISTS `srv_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `srv_user_roles`
--

CREATE TABLE IF NOT EXISTS `srv_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'manage site meta tags and keywords',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'edit document meta tags and keywords',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.' AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `srv_user_roles`
--

INSERT INTO `srv_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `file_manager`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `manage_metatags`, `edit_doc_metatags`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_user_settings`
--

CREATE TABLE IF NOT EXISTS `srv_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `srv_webgroup_access`
--

CREATE TABLE IF NOT EXISTS `srv_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `srv_webgroup_access`
--

INSERT INTO `srv_webgroup_access` (`id`, `webgroup`, `documentgroup`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_webgroup_names`
--

CREATE TABLE IF NOT EXISTS `srv_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `srv_webgroup_names`
--

INSERT INTO `srv_webgroup_names` (`id`, `name`) VALUES
(1, 'Site Admins'),
(2, 'Registered Users');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_web_groups`
--

CREATE TABLE IF NOT EXISTS `srv_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `srv_web_groups`
--

INSERT INTO `srv_web_groups` (`id`, `webgroup`, `webuser`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `srv_web_users`
--

CREATE TABLE IF NOT EXISTS `srv_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `srv_web_users`
--

INSERT INTO `srv_web_users` (`id`, `username`, `password`, `cachepwd`) VALUES
(1, 'siteadmin', '5f4dcc3b5aa765d61d8327deb882cf99', '');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_web_user_attributes`
--

CREATE TABLE IF NOT EXISTS `srv_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `srv_web_user_attributes`
--

INSERT INTO `srv_web_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
(1, 1, 'Site Admin', 0, 'you@example.com', '', '', 0, 0, 0, 25, 1129049624, 1129063123, 0, 'f426f3209310abfddf2ee00e929774b4', 0, 0, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `srv_web_user_settings`
--

CREATE TABLE IF NOT EXISTS `srv_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
