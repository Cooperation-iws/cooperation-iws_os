-- phpMyAdmin SQL Dump
-- version 2.11.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 02, 2008 at 04:43 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.6-2ubuntu4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ciwscms`
--
CREATE DATABASE `ciwscms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ciwscms`;

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(30) NOT NULL default 'banner',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_banner`
--

INSERT INTO `jos_banner` (`bid`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `imageurl`, `clickurl`, `date`, `showBanner`, `checked_out`, `checked_out_time`, `editor`, `custombannercode`, `catid`, `description`, `sticky`, `ordering`, `publish_up`, `publish_down`, `tags`, `params`) VALUES
(1, 1, 'banner', 'OSM 1', 'osm-1', 0, 43, 0, 'osmbanner1.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(2, 1, 'banner', 'OSM 2', 'osm-2', 0, 49, 0, 'osmbanner2.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(3, 1, '', 'Joomla!', 'joomla', 0, 106, 0, '', 'http://www.joomla.org', '2006-05-29 14:21:28', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomla! The most popular and widely used Open Source CMS Project in the world.', 14, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(4, 1, '', 'JoomlaCode', 'joomlacode', 0, 106, 0, '', 'http://joomlacode.org', '2006-05-29 14:19:26', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomlaCode, development and distribution made easy.', 14, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(5, 1, '', 'Joomla! Extensions', 'joomla-extensions', 0, 101, 0, '', 'http://extensions.joomla.org', '2006-05-29 14:23:21', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomla! Components, Modules, Plugins and Languages by the bucket load.', 14, '', 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(6, 1, '', 'Joomla! Shop', 'joomla-shop', 0, 101, 0, '', 'http://shop.joomla.org', '2006-05-29 14:23:21', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nFor all your Joomla! merchandise.', 14, '', 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, 1, '', 'Joomla! Promo Shop', 'joomla-promo-shop', 0, 80, 1, 'shop-ad.jpg', 'http://shop.joomla.org', '2007-09-19 17:26:24', 1, 0, '0000-00-00 00:00:00', '', '', 33, '', 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(8, 1, '', 'Joomla! Promo Books', 'joomla-promo-books', 0, 82, 0, 'shop-ad-books.jpg', 'http://shop.joomla.org/amazoncom-bookstores.html', '2007-09-19 17:28:01', 1, 0, '0000-00-00 00:00:00', '', '', 33, '', 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contact` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_bannerclient`
--

INSERT INTO `jos_bannerclient` (`cid`, `name`, `contact`, `email`, `extrainfo`, `checked_out`, `checked_out_time`, `editor`) VALUES
(1, 'Open Source Matters', 'Administrator', 'admin@opensourcematters.org', '', 0, '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(1, 0, 'Latest', '', 'latest-news', 'taking_notes.jpg', '1', 'left', 'The latest news from the Ciws Team', 1, 0, '0000-00-00 00:00:00', '', 1, 0, 1, ''),
(2, 0, 'Ciws Specific Links', '', 'ciws-specific-links', 'clock.jpg', 'com_weblinks', 'left', 'A selection of links that are all related to the Ciws Project.', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(3, 0, 'Newsflash', '', 'newsflash', '', '1', 'left', '', 1, 62, '2008-10-20 12:25:58', '', 2, 0, 0, ''),
(4, 0, 'Joomla!', '', 'joomla', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(5, 0, 'Business: General', '', 'business-general', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(6, 0, 'Linux', '', 'linux', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(7, 0, 'Internet', '', 'internet', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 7, 0, 0, ''),
(12, 0, 'Contacts', '', 'contacts', '', 'com_contact_details', 'left', 'Contact Details for this Web site', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(13, 0, 'Joomla', '', 'joomla', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(14, 0, 'Text Ads', '', 'text-ads', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(15, 0, 'Features', '', 'features', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(17, 0, 'Benefits', '', 'benefits', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(18, 0, 'Platforms', '', 'platforms', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(19, 0, 'Other Resources', '', 'other-resources', '', 'com_weblinks', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(29, 0, 'The servers', '', 'the-servers', '', '4', 'left', 'Information about the software behind Joomla!', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(28, 0, 'Current Users', '', 'current-users', '', '3', 'left', 'Questions that users migrating to Joomla! 1.5 are likely to raise<br />', 0, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(25, 0, 'The Project', '', 'the-project', '', '4', 'left', 'General facts about Ciws.', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(27, 0, 'New to Ciws', '', 'new-to-ciws', '', '3', 'left', 'Questions for new users of Ciws.', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(30, 0, 'The Community', '', 'the-community', '', '4', 'left', 'About the millions of Joomla! users and Web sites<br />', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(31, 0, 'General', '', 'general', '', '3', 'left', 'General questions about the Cooperation-iws project.', 1, 62, '2008-10-20 13:24:31', NULL, 0, 0, 0, ''),
(32, 0, 'Languages', '', 'languages', '', '3', 'left', 'Questions related to localisation and languages', 1, 62, '2008-10-20 12:25:49', NULL, 4, 0, 0, ''),
(33, 0, 'Joomla! Promo', '', 'joomla-promo', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=1\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(34, 'Joom!Fish', 'option=com_joomfish', 0, 0, 'option=com_joomfish', 'Joom!Fish', 'com_joomfish', 0, 'components/com_joomfish/assets/images/icon-16-joomfish.png', 0, '', 1),
(35, 'Control Panel', '', 0, 34, 'option=com_joomfish', 'Control Panel', 'com_joomfish', 0, 'components/com_joomfish/assets/images/icon-16-cpanel.png', 0, '', 1),
(36, 'Translation', '', 0, 34, 'option=com_joomfish&task=translate.overview', 'Translation', 'com_joomfish', 1, 'components/com_joomfish/assets/images/icon-16-translation.png', 0, '', 1),
(37, 'Orphan Translations', '', 0, 34, 'option=com_joomfish&task=translate.orphans', 'Orphan Translations', 'com_joomfish', 2, 'components/com_joomfish/assets/images/icon-16-orphan.png', 0, '', 1),
(38, 'Manage Translations', '', 0, 34, 'option=com_joomfish&task=manage.overview', 'Manage Translations', 'com_joomfish', 3, 'components/com_joomfish/assets/images/icon-16-manage.png', 0, '', 1),
(39, 'Statistics', '', 0, 34, 'option=com_joomfish&task=statistics.overview', 'Statistics', 'com_joomfish', 4, 'components/com_joomfish/assets/images/icon-16-statistics.png', 0, '', 1),
(40, '', '', 0, 34, 'option=com_joomfish', '', 'com_joomfish', 5, 'components/com_joomfish/assets/images/icon-10-blank.png', 0, '', 1),
(41, 'Languages', '', 0, 34, 'option=com_joomfish&task=languages.show', 'Languages', 'com_joomfish', 6, 'components/com_joomfish/assets/images/icon-16-language.png', 0, '', 1),
(42, 'Content elements', '', 0, 34, 'option=com_joomfish&task=elements.show', 'Content elements', 'com_joomfish', 7, 'components/com_joomfish/assets/images/icon-16-extension.png', 0, '', 1),
(43, 'Plugins', '', 0, 34, 'option=com_joomfish&task=plugin.show', 'Plugins', 'com_joomfish', 8, 'components/com_joomfish/assets/images/icon-16-plugin.png', 0, '', 1),
(44, '', '', 0, 34, 'option=com_joomfish', '', 'com_joomfish', 9, 'components/com_joomfish/assets/images/icon-10-blank.png', 0, '', 1),
(45, 'Help', '', 0, 34, 'option=com_joomfish&task=help.show', 'Help', 'com_joomfish', 10, 'components/com_joomfish/assets/images/icon-16-help.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `con_position` varchar(255) default NULL,
  `address` text,
  `suburb` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `postcode` varchar(100) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`) VALUES
(1, 'Name', 'name', 'Position', 'Street', 'Suburb', 'State', 'Country', 'Zip Code', 'Telephone', 'Fax', 'Miscellanous info', 'powered_by.png', 'top', 'email@email.com', 1, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\r\nshow_position=1\r\nshow_email=0\r\nshow_street_address=1\r\nshow_suburb=1\r\nshow_state=1\r\nshow_postcode=1\r\nshow_country=1\r\nshow_telephone=1\r\nshow_mobile=1\r\nshow_fax=1\r\nshow_webpage=1\r\nshow_misc=1\r\nshow_image=1\r\nallow_vcard=0\r\ncontact_icons=0\r\nicon_address=\r\nicon_email=\r\nicon_telephone=\r\nicon_fax=\r\nicon_misc=\r\nshow_email_form=1\r\nemail_description=1\r\nshow_email_copy=1\r\nbanned_email=\r\nbanned_subject=\r\nbanned_text=', 0, 12, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `title_alias` varchar(255) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'Welcome to Cooperation-iws', 'welcome-to-cooperation-iws', '', '<h3>Cooperation-iws is an Intranet Nomad Web Server project:</h3> <ol><li> A <strong>web</strong> <strong>server</strong>, to provide hosting services of web applications (Blog - words processor, Wiki, Forum, Electronic Documents Management, Pictures galleries - Pictures manipulation, eLearning portal, …) for collaborative work that contributes to knowledge management and/or knowledge engineering.</li><li><strong> Intranet</strong>, to provide these services where you want: at home, at association meetings, at professional meetings without requiring an internet connection or without the volonty to publish personnal items on the web .</li><li><strong> Nomad</strong>, to bring these services with you, on a cd/dvd, usb key, or usb hard drive.</li></ol><br /><h3>Cooperation-iws is distributed for free and under open source licence.</h3><p>&lt;?php </p><p>$xml_file="cooperation-wui.xml"; </p><p>$tree = simplexml_load_file(''../''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree-&gt;item as $item) {    <br />                            $array_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);<br />                            $array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);<br />                            $array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);<br />                            $array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);<br />                            $array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_xml as $key =&gt; $row) {<br />                            $category[$key]  = $row[''0''];<br />                            $item_name[$key] = $row[''1''];<br />                            $item_desc[$key] = $row[''2''];<br />                            $item_url[$key] = $row[''3''];<br />                            $item_admin_url[$key] = $row[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($category, SORT_ASC, $item_name, SORT_ASC, $array_xml);<br /><br />?&gt;</p><h1>Applications</h1><p>&lt;?php<br /><br />                       $prev_category = "";<br />                        for($count_boucle=0; $count_boucle &lt;= $count_xml_elt ; $count_boucle++) {<br />                            $category= $array_xml[$count_boucle][0];<br />                            if ("$prev_category" != "$category"){<br />                                echo "&lt;br&gt;\\n&lt;h3&gt;&lt;a name=\\"".$count_boucle."\\"&gt;&lt;/a&gt;".$category."&lt;/h3&gt;&lt;hr&gt;&lt;br&gt;\\n";<br />                            }<br />                            $prev_category = $category;<br />                            $name = $array_xml[$count_boucle][1];<br />                            $desc = $array_xml[$count_boucle][2];<br />                            $url = $array_xml[$count_boucle][3];<br />                            $admin_url =$array_xml[$count_boucle][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\\n";<br />                            echo $desc."&lt;br&gt;&lt;br&gt;\\n";<br />                            echo "&lt;a href=\\"".$url."\\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\\"".$admin_url."\\"&gt;admin&lt;/a&gt;\\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt; <br />&lt;?php $tree_admin = simplexml_load_file(''../admin/''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree_admin-&gt;item as $item) {    <br />                            $array_admin_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_admin_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_admin_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_admin_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_admin_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_admin_xml[$count_xml_elt][0] = strval($array_admin_xml[$count_xml_elt][0]);<br />                            $array_admin_xml[$count_xml_elt][1] = strval($array_admin_xml[$count_xml_elt][1]);<br />                            $array_admin_xml[$count_xml_elt][2] = strval($array_admin_xml[$count_xml_elt][2]);<br />                            $array_admin_xml[$count_xml_elt][3] = strval($array_admin_xml[$count_xml_elt][3]);<br />                            $array_admin_xml[$count_xml_elt][4] = strval($array_admin_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_admin_xml as $key_admin =&gt; $row_admin) {<br />                            $item_admin_category[$key_admin]  = $row_admin[''0''];<br />                            $item_admin_name[$key_admin] = $row_admin[''1''];<br />                            $item_admin_desc[$key_admin] = $row_admin[''2''];<br />                            $item_url[$key_admin] = $row_admin[''3''];<br />                            $item_admin_admin_url[$key_admin] = $row_admin[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($item_admin_category, SORT_ASC, $item_admin_name, SORT_ASC, $array_admin_xml);<br /><br />?&gt;</p><h1>Administration</h1><p>&nbsp;</p><p>&lt;?php<br /><br />                       $prev_admin_category = "";</p><p>&nbsp;</p><p>                        for($count_boucle_admin=0; $count_boucle_admin &lt;= $count_xml_elt ; $count_boucle_admin++) {<br />                            $category_admin= $array_admin_xml[$count_boucle_admin][0];<br />                            if ("$prev_admin_category" != "$category_admin"){<br />                                echo "&lt;br&gt;\\n&lt;h3&gt;&lt;a name=\\"admin_".$count_boucle_admin."\\"&gt;&lt;/a&gt;".$category_admin."&lt;/h3&gt;&lt;hr&gt;&lt;br&gt;\\n";<br />                            }<br />                            $prev_admin_category = $category_admin;<br />                            $name = $array_admin_xml[$count_boucle_admin][1];<br />                            $desc = $array_admin_xml[$count_boucle_admin][2];<br />                            $url = $array_admin_xml[$count_boucle_admin][3];<br />                            $admin_url =$array_admin_xml[$count_boucle_admin][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\\n";<br />                            echo $desc."&lt;br&gt;\\n";<br />                            echo "&lt;a href=\\"".$url."\\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\\"".$admin_url."\\"&gt;admin&lt;/a&gt;\\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt;         </p>', '', 0, 1, 0, 1, '2006-10-12 10:00:00', 62, '', '2008-10-25 08:14:05', 62, 0, '0000-00-00 00:00:00', '2006-01-03 01:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 50, 0, 2, '', '', 0, 93, 'robots=\nauthor='),
(47, 'General questions about Ciws', 'general-questions-about-ciws', '', '<h4><a name="what_s_live_cd_or_live_usb" title="what_s_live_cd_or_live_usb"></a>What''s Live CD or Live USB ?</h4> <div class="level4"> A Live CD is an operating system contained on a CD-ROM that has the ability to operate without installing anything on the machine of execution. The technology allows Live CD to boot directly from a CD while decompressing in the memory (RAM) the files system . So the Live CD is often used to test operating systems, because there is no manipulation, no configuration to be done to have an operational system. The drawback of the Live CD is that it does not retain the changes made during the sessions of use. A Live USB is an operating system contained on a USB storage device (Key or HDD), the technology is the same as for the Live CD, apart that it is possible to save the changes through a persistent mode . This is the solution retained for Cooperation IWS. </div>  <h4><a name="the_changes_made_on_my_cooperation-iws_server_will_be_saved" title="the_changes_made_on_my_cooperation-iws_server_will_be_saved"></a>The changes made on my Cooperation-iws server will be saved ?</h4> <div class="level4">  If your are using a Live CD no changes are saved, it is a read only mode. <p>If you are using a Live USB, the change to the lampp environment (the web applications server) data located in /var/ as well as some specific configuration files will be saved. So your intranet working environment is saved through time. Any changes outside this specific data will be lost after every reboot. The var directory is saved with the USB live persistence technology. In this case, on Cooperation IWS, the persistence is on the partition /media/ciws-rw. If you want to modify core files (e-g apt-get install some application) in your Cooperation IWS, you need to do it during the customization of your installation. </p>  <p> The interest is that only changes of interest are saved and changes that could arm the core of your server are not saved. So you just need a reboot and you get again your environment, provided there was no modification on the lampp critical data situated on the /var partition. </p>  </div>', '', -2, 3, 0, 31, '2008-10-20 12:35:16', 62, '', '2008-10-20 12:36:56', 62, 0, '0000-00-00 00:00:00', '2008-10-20 12:35:16', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(2, 'Newsflash 1', 'newsflash-1', '', '<p>Joomla! makes it easy to launch a Web site of any kind. Whether you want a brochure site or you are building a large online community, Joomla! allows you to deploy a new site in minutes and add extra functionality as you need it. The hundreds of available Extensions will help to expand your site and allow you to deliver new services that extend your reach into the Internet.</p>', '', -2, 1, 0, 3, '2004-08-10 06:30:34', 62, '', '2007-11-08 12:19:35', 62, 0, '0000-00-00 00:00:00', '2004-08-09 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 0, '', '', 0, 1, 'robots=\nauthor='),
(3, 'Newsflash 2', 'newsflash-2', '', '<p>The one thing about a Web site, it always changes! Joomla! makes it easy to add Articles, content, images, videos, and more. Site administrators can edit and manage content ''in-context'' by clicking the ''Edit'' link. Webmasters can also edit content through a graphical Control Panel that gives you complete control over your site.</p>', '', -2, 1, 0, 3, '2004-08-09 22:30:34', 62, '', '2007-11-08 12:20:41', 62, 0, '0000-00-00 00:00:00', '2004-08-09 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(4, 'Ciws 0.5.2 released', 'newsflash-3', '', 'Cooperation-iws 0.5.2 released ! Check the new features on <a href="http://cooperation-iws.gensys-net.eu">http://cooperation-iws.gensys-net.eu</a>.', '', -2, 1, 0, 3, '2004-08-10 06:30:34', 62, '', '2008-10-20 13:07:03', 62, 0, '0000-00-00 00:00:00', '2004-08-09 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 0, '', '', 0, 1, 'robots=\nauthor='),
(5, 'Ciws License Guidelines', 'ciws-license-guidelines', 'joomla-license-guidelines', '<h3> Use, duplication, distribution</h3> <p>Use, duplication or distribution of materials on this web site or its contents can be subject to the terms and conditions contained in separate licenses. With the exception where these terms and conditions are in conflict with previous licenses mentioned here, these terms and conditions apply. The scripts for creating Cooperation-iws and the web user interface, ( "Cooperation-wui") are subject to the GNU General Public License version 2 ( "GPL") or higher. Use, duplication or distribution of Cooperation-iws live scripts as well as Cooperation-wui are subject to the terms and conditions of the GPL.</p> <h3>Limitation of Liability</h3> The contents of this website and download the materials are distributed in the hope that they will be useful, but WITHOUT ANY WARRANTY, even without warranty of merchantability or fitness for a particular purpose. Refer to the "GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this content and these materials, otherwise write to the "Free Software Foundation, Inc.. , 675 Mass Ave, Cambridge, MA 02139, USA. " http://www.gnu.org/licenses/gpl-howto.fr.html Http://www.gnu.org/licenses/gpl-howto.fr.html<p>Cooperation-iws documentation is released under the terms of the <a href="http://creativecommons.org/licenses/by-nc-sa/2.5/" title="Creative Commons ">Creative Commons Attribution-Non-Commercial-Share-Alike License 2.5</a> or by the specific license of their respective copyright owners.</p><p>The Cooperation-iws licence has always been GPL.</p>', '', -2, 4, 0, 25, '2004-08-20 10:11:07', 62, '', '2008-10-19 09:41:14', 62, 0, '0000-00-00 00:00:00', '2004-08-19 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 0, '', '', 0, 116, 'robots=\nauthor='),
(6, 'We are Volunteers', 'we-are-volunteers', '', '<p>The Joomla Core Team consists of volunteer developers, designers, administrators and managers who, together with a large range of Work Groups of dedicated community members have taken Joomla to new heights in its relatively short life. This well-oiled machine is often copied but never surpassed.  Joomla has some wonderfully talented people taking Open Source concepts to the forefront of industry standards.  Joomla 1.5 is a major leap forward and represents the most exciting Joomla release in the history of the project. </p>', '<p>The project has a nice balance of legacy development from well-known coders such as Andrew Eddie (who pioneered Mambo''s early success) to some young guns like Louis Landry.  This dynamic duo has been further strengthening the project by bringing in new talent.  In open source development people joke about the ''bus'' factor.  Projects which don''t have coding ''spread'' are considered less sound should their single lead developer get hit by a bus.</p>', -2, 1, 0, 1, '2004-07-07 09:54:06', 62, '', '2008-08-31 04:12:49', 62, 0, '0000-00-00 00:00:00', '2004-07-06 22:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 0, '', '', 0, 54, 'robots=\nauthor='),
(7, 'Stick to the Code!', 'stick-to-the-code', '', 'To ensure this code release, Wilco Jansen resorted to sending rum to joint lead-developer Johan Janssens.  Johan, who''s had a penchant for rum ever since the first "Pirate''s of the Caribbean" movie screened, took the bait, mixed it with Cola, and here we are with our latest 1.5 release.  It looks like pirate talk will figure quite a lot in future Joomla! development! ', '<strong><br />Translation for you real pirates:<br /></strong> <br />First Mate Wilco resorted t'' sendin'' rum t'' joint Capt''n Johan. Johan, who''s had a penchant for rum ever since t'' first "Pirate''s o'' t'' Caribbean" movie screened, took t'' bait, mixed it with molasses, and here we be with our latest 1.5 release. It looks like pirate talk will figure quite a lot in future Joomla! development!', -2, 1, 0, 1, '2004-07-07 12:00:00', 62, '', '2007-11-25 22:37:55', 62, 0, '0000-00-00 00:00:00', '2004-07-07 11:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=', 13, 0, 0, '', '', 0, 55, 'robots=\nauthor='),
(8, 'The Legend of Buca di Beppo', 'the-legend-of-buca-di-beppo', '', '<p>The legend of Buca di Beppo involves a covert meeting of key developers in a Mafia-style restaurant in the United States.  ''Bucas'' has on more than one occasion been the catalyst for key (and in some cases considered insurmountable) development ''humps'' being overcome.</p><p>With copius amounts of food and wine flowing, the creative juices of coders seem to work keener, faster, and problems are solved. Louis Landry famously agreed that living near a Bucas could actually lead to faster development cycles.</p><p>Mmmm. A restaurant with photos of famous Mafia films like <em>The Godfather</em> and violin cases leaning against the booths.  Makes you wonder, doesn''t it?  </p><p>If Joomla! was a commercial venture, we''re sure management would actually consider building a Bucas inside the building!</p><p>Masterchief meet Bugsy Landry. </p>', '', -2, 1, 0, 1, '2004-04-12 09:54:06', 62, '', '2007-11-08 12:14:09', 62, 0, '0000-00-00 00:00:00', '2004-07-06 22:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 0, '', '', 0, 13, 'robots=\nauthor='),
(9, '1 Million Smiles', '1-million-smiles', '', '<p>The Joomla! team has about 1 million good reasons to be smiling about the Joomla! 1.5. In its current incarnation, it''s had more than 1 million downloads, taking it to an unprecedented level of popularity.  The new code base is almost an entire re-factor of the old code base.  The user experience is still extremely slick but for developers the API is a dream.  A proper framework for real PHP architects seeking the best of the best.</p><p>If you''re a former Mambo User or a 1.0 series Joomla! User, 1.5 is the future of CMSs for a number of reasons.  It''s more powerful, more flexible, more secure, and intuitive.  Our developers and interface designers have worked countless hours to make this the most exciting release in the content management system sphere.</p><p>Go on ... get your FREE copy of Joomla! today and spread the word about this benchmark project. </p>', '', -2, 1, 0, 1, '2004-07-07 09:54:06', 62, '', '2007-11-08 12:16:19', 62, 0, '0000-00-00 00:00:00', '2004-07-06 22:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 0, '', '', 0, 23, 'robots=\nauthor='),
(10, 'How do I localise Joomla! to my language?', 'how-do-i-localise-joomla-to-my-language', '', '<h4>General<br /></h4><p>In Joomla! 1.5 all User interfaces can be localised. This includes the installation, the Back-end Control Panel and the Front-end Site.</p><p>The core release of Joomla! 1.5 is shipped with multiple language choices in the installation but, other than English (the default), languages for the Site and Administration interfaces need to be added after installation. Links to such language packs exist below.</p>', '<p>Translation Teams for Joomla! 1.5 may have also released fully localised installation packages where site, administrator and sample data are in the local language. These localised releases can be found in the specific team projects on the <a href="http://joomlacode.org" title="The Joomla! Code Repository">JoomlaCode</a>.</p><h4>How do I install language packs?</h4><ul><li>First download both the admin and the site language packs that you require.</li><li>Install each pack separately using the Extensions-&gt;Install/Uninstall Menu selection and then the package file upload facility.</li><li>Go to the Language Manager and be sure to select Site or Admin in the sub-menu. Then select the appropriate language and make it the default one using the Toolbar button.</li></ul><h4>How do I select languages?</h4><ul><li>Default languages can be independently set for Site and for Administrator</li><li>In addition, users can define their preferred language for each Site and Administrator. This takes affect after logging in</li><li>While logging in to the Administrator Back-end, a language can also be selected for the particular session.</li></ul><h4>Where can I find Language Packs and Localised Releases?</h4><p><em>Please note that Joomla! 1.5 is new and language packs for this version may have not been released at this time.</em> </p><ul><li><a href="http://joomlacode.org/gf/project/jtranslation/" target="_blank" title="Accredited Translations">The Joomla! Accredited Translations Project</a>  - This is a joint repository for language packs that were developed by teams that are members of the Joomla! Translations Working Group.</li><li><a href="http://extensions.joomla.org/component/option,com_mtree/task,listcats/cat_id,1837/Itemid,35/" target="_blank" title="Translations">The Joomla! Extensions Site - Translations</a>  </li><li><a href="http://dev.joomla.org/content/view/42/66/" target="_blank" title="Translation Work Group Teams">List of Translation Teams and Translation Partner Sites for Joomla! 1.5</a> </li></ul>', -2, 3, 0, 32, '2006-09-30 14:06:37', 62, '', '2007-11-08 11:55:56', 62, 0, '0000-00-00 00:00:00', '2006-09-29 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 9, 0, 0, '', '', 0, 10, 'robots=\nauthor='),
(11, 'How do I upgrade to Joomla! 1.5 ?', 'how-do-i-upgrade-to-joomla-15', '', '<p>Joomla! 1.5 does not provide an upgrade path from earlier versions. Converting an older site to a Joomla! 1.5 site requires creation of a new empty site using Joomla! 1.5 and then populating the new site with the content from the old site. This migration of content is not a one-to-one process and involves conversions and modifications to the content dump.</p> <p>There are two ways to perform the migration:</p>', ' <div id="post_content-107"><li>An automated method of migration has been provided which uses a migrator Component to create the migration dump out of the old site (Mambo 4.5.x up to Joomla! 1.0.x) and a smart import facility in the Joomla! 1.5 Installation that performs required conversions and modifications during the installation process.</li> <li>Migration can be performed manually. This involves exporting the required tables, manually performing required conversions and modifications and then importing the content to the new site after it is installed.</li>  <p><!--more--></p> <h2><strong> Automated migration</strong></h2>  <p>This is a two phased process using two tools. The first tool is a migration Component named <font face="courier new,courier">com_migrator</font>. This Component has been contributed by Harald Baer and is based on his <strong>eBackup </strong>Component. The migrator needs to be installed on the old site and when activated it prepares the required export dump of the old site''s data. The second tool is built into the Joomla! 1.5 installation process. The exported content dump is loaded to the new site and all conversions and modification are performed on-the-fly.</p> <h3><u> Step 1 - Using com_migrator to export data from old site:</u></h3> <li>Install the <font face="courier new,courier">com_migrator</font> Component on the <u><strong>old</strong></u> site. It can be found at the <a href="http://joomlacode.org/gf/project/pasamioprojects/frs/" target="_blank">JoomlaCode developers forge</a>.</li> <li>Select the Component in the Component Menu of the Control Panel.</li> <li>Click on the <strong>Dump it</strong> icon. Three exported <em>gzipped </em>export scripts will be created. The first is a complete backup of the old site. The second is the migration content of all core elements which will be imported to the new site. The third is a backup of all 3PD Component tables.</li> <li>Click on the download icon of the particular exports files needed and store locally.</li> <li>Multiple export sets can be created.</li> <li>The exported data is not modified in anyway and the original encoding is preserved. This makes the <font face="courier new,courier">com_migrator</font> tool a recommended tool to use for manual migration as well.</li> <h3><u> Step 2 - Using the migration facility to import and convert data during Joomla! 1.5 installation:</u></h3><p>Note: This function requires the use of the <em><font face="courier new,courier">iconv </font></em>function in PHP to convert encodings. If <em><font face="courier new,courier">iconv </font></em>is not found a warning will be provided.</p> <li>In step 6 - Configuration select the ''Load Migration Script'' option in the ''Load Sample Data, Restore or Migrate Backed Up Content'' section of the page.</li> <li>Enter the table prefix used in the content dump. For example: ''jos_'' or ''site2_'' are acceptable values.</li> <li>Select the encoding of the dumped content in the dropdown list. This should be the encoding used on the pages of the old site. (As defined in the _ISO variable in the language file or as seen in the browser page info/encoding/source)</li> <li>Browse the local host and select the migration export and click on <strong>Upload and Execute</strong></li> <li>A success message should appear or alternately a listing of database errors</li> <li>Complete the other required fields in the Configuration step such as Site Name and Admin details and advance to the final step of installation. (Admin details will be ignored as the imported data will take priority. Please remember admin name and password from the old site)</li> <p><u><br /></u></p></div>', -2, 3, 0, 28, '2006-09-30 20:27:52', 62, '', '2007-11-08 11:01:01', 62, 0, '0000-00-00 00:00:00', '2006-09-29 12:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 0, '', '', 0, 14, 'robots=\nauthor='),
(12, 'Why does Joomla! 1.5 use utf-8 encoding?', 'why-does-joomla-15-use-utf-8-encoding', '', '<p>Well... how about never needing to mess with encoding settings again?</p><p>Ever needed to display several languages on one page or site and something always came up in Giberish?</p><p>With utf-8 (a variant of Unicode) glyphs (character forms) of basically all languages can be displayed with one single encoding setting. </p>', '', -2, 3, 0, 31, '2006-10-05 01:11:29', 62, '', '2007-11-08 11:39:51', 62, 0, '0000-00-00 00:00:00', '2006-10-03 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 0, '', '', 0, 29, 'robots=\nauthor='),
(13, 'What happened to the locale setting?', 'what-happened-to-the-locale-setting', '', 'This is now defined in the Language [<em>lang</em>].xml file in the Language metadata settings. If you are having locale problems such as dates do not appear in your language for example, you might want to check/edit the entries in the locale tag. Note that multiple locale strings can be set and the host will usually accept the first one recognised.', '', -2, 3, 0, 28, '2006-10-06 16:47:35', 62, '', '2007-11-04 23:12:30', 62, 0, '0000-00-00 00:00:00', '2006-10-05 14:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 0, '', '', 0, 11, 'robots=\nauthor='),
(14, 'What is the FTP layer for?', 'what-is-the-ftp-layer-for', '', '<p>The FTP Layer allows file operations (such as installing Extensions or updating the main configuration file) without having to make all the folders and files writable. This has been an issue on Linux and other Unix based platforms in respect of file permissions. This makes the site admin''s life a lot easier and increases security of the site.</p><p>You can check the write status of relevent folders by going to ''''Help-&gt;System Info" and then in the sub-menu to "Directory Permissions". With the FTP Layer enabled even if all directories are red, Joomla! will operate smoothly.</p><p>NOTE: the FTP layer is not required on a Windows host/server. </p>', '', -2, 3, 0, 31, '2006-10-06 21:27:49', 62, '', '2007-05-03 09:39:48', 62, 0, '0000-00-00 00:00:00', '2006-10-05 16:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=', 6, 0, 0, '', '', 0, 23, 'robots=\nauthor='),
(15, 'Can Joomla! 1.5 operate with PHP Safe Mode On?', 'can-joomla-15-operate-with-php-safe-mode-on', '', '<p>Yes it can! This is a significant security improvement.</p><p>The <em>safe mode</em> limits PHP to be able to perfom actions only on files/folders who''s owner is the same as PHP is currently using (this is usually ''apache''). As files normally are created either by the Joomla! application or by FTP access, the combination of PHP file actions and the FTP Layer allows Joomla! to operate in PHP Safe Mode.</p>', '', -2, 3, 0, 31, '2006-10-06 19:28:35', 62, '', '2007-11-08 11:26:51', 62, 0, '0000-00-00 00:00:00', '2006-10-05 14:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 0, '', '', 0, 8, 'robots=\nauthor='),
(16, 'Only one edit window! How do I create "Read more..."?', 'only-one-edit-window-how-do-i-create-read-more', '', '<p>This is now implemented by inserting a <strong>Read more...</strong> tag (the button is located below the editor area) a dotted line appears in the edited text showing the split location for the <em>Read more....</em> A new Plugin takes care of the rest.</p><p>It is worth mentioning that this does not have a negative effect on migrated data from older sites. The new implementation is fully backward compatible.</p>', '', -2, 3, 0, 28, '2006-10-06 19:29:28', 62, '', '2007-11-08 11:03:30', 62, 0, '0000-00-00 00:00:00', '2006-10-05 14:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 0, '', '', 0, 20, 'robots=\nauthor='),
(17, 'My MySQL database does not support UTF-8. Do I have a problem?', 'my-mysql-database-does-not-support-utf-8-do-i-have-a-problem', '', 'No you don''t. Versions of MySQL lower than 4.1 do not have built in UTF-8 support. However, Joomla! 1.5 has made provisions for backward compatibility and is able to use UTF-8 on older databases. Let the installer take care of all the settings and there is no need to make any changes to the database (charset, collation, or any other).', '', -2, 3, 0, 31, '2006-10-07 09:30:37', 62, '', '2007-11-08 11:39:01', 62, 0, '0000-00-00 00:00:00', '2006-10-05 20:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 0, '', '', 0, 9, 'robots=\nauthor='),
(18, 'Joomla! Features', 'joomla-features', '', '<h4><font color="#ff6600">Joomla! features:</font></h4> <ul><li>Completely database driven site engines </li><li>News, products, or services sections fully editable and manageable</li><li>Topics sections can be added to by contributing Authors </li><li>Fully customisable layouts including <em>left</em>, <em>center</em>, and <em>right </em>Menu boxes </li><li>Browser upload of images to your own library for use anywhere in the site </li><li>Dynamic Forum/Poll/Voting booth for on-the-spot results </li><li>Runs on Linux, FreeBSD, MacOSX server, Solaris, and AIX', '  </li></ul> <h4>Extensive Administration:</h4> <ul><li>Change order of objects including news, FAQs, Articles etc. </li><li>Random Newsflash generator </li><li>Remote Author submission Module for News, Articles, FAQs, and Links </li><li>Object hierarchy - as many Sections, departments, divisions, and pages as you want </li><li>Image library - store all your PNGs, PDFs, DOCs, XLSs, GIFs, and JPEGs online for easy use </li><li>Automatic Path-Finder. Place a picture and let Joomla! fix the link </li><li>News Feed Manager. Choose from over 360 News Feeds from around the world </li><li>E-mail a friend and Print format available for every story and Article </li><li>In-line Text editor similar to any basic word processor software </li><li>User editable look and feel </li><li>Polls/Surveys - Now put a different one on each page </li><li>Custom Page Modules. Download custom page Modules to spice up your site </li><li>Template Manager. Download Templates and implement them in seconds </li><li>Layout preview. See how it looks before going live </li><li>Banner Manager. Make money out of your site</li></ul>', -2, 4, 0, 29, '2006-10-08 23:32:45', 62, '', '2007-11-04 16:38:53', 62, 0, '0000-00-00 00:00:00', '2006-10-07 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 11, 0, 0, '', '', 0, 59, 'robots=\nauthor='),
(19, 'Ciws Overview', 'ciws-overview', '', '<h3>Cooperation-iws is an Intranet Nomad Web Server project:</h3> <ol><li> A <strong>web</strong> <strong>server</strong>, to provide hosting services of web applications (Blog - words processor, Wiki, Forum, Electronic Documents Management, Pictures galleries - Pictures manipulation, eLearning portal, …) for collaborative work that contributes to knowledge management and/or knowledge engineering.</li><li><strong> Intranet</strong>, to provide these services where you want: at home, at association meetings, at professional meetings without requiring an internet connection or without the volonty to publish personnal items on the web .</li><li><strong> Nomad</strong>, to bring these services with you, on a cd/dvd, usb key, or usb hard drive.</li></ol><h3><a name="cooperation-iws_is_free" title="cooperation-iws_is_free"></a>Cooperation-iws is free</h3>   <p>  Cooperation-iws is <strong>free</strong> and is based on <strong>open-source</strong> softwares like Ubuntu or Debian Linux. </p><h3><a name="audience" title="audience"></a>Audience</h3><p>Cooperation-iws servers are available in several flavours. </p><h4>Ciws Servers flavours: <br /></h4> <div class="level2"> <ol><li class="level1"><strong>Ciws Groupware server</strong>: A groupware flavour, for small business or small associations;</li><li class="level1"><strong>Ciws eLearning server</strong>: An eLearning flavour for professional teacher or institutions teacher;</li><li class="level1"><strong>Ciws CMS server</strong>: A Content Management System server for publishing and communication.</li><li class="level1"><strong>Ciws Social Writer server</strong>: A Social and Internet 2.0 content management server for writers.</li><li class="level1"><strong>Ciws Development server</strong>: A development Server for design teams.</li><li class="level1"><strong>Ciws Personal server</strong>: A Personal intranet Server for families.</li></ol><h4>Ciws Clients flavours:</h4><ol><li class="level1"><strong>Ciws Client</strong>: A generic Client to access the Ciws Servers.</li><li class="level1"><strong>Ciws light Client</strong>: A generic Client to access Ciws Servers from low end terminals.</li></ol>  </div><p>&nbsp;</p><p>&nbsp;</p>', '', -2, 4, 0, 29, '2006-10-09 07:49:20', 62, '', '2008-10-20 11:48:46', 62, 0, '0000-00-00 00:00:00', '2006-10-07 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 15, 0, 0, '', '', 0, 202, 'robots=\nauthor='),
(20, 'Support and Documentation', 'support-and-documentation', '', '<h1>Support </h1><p>Support for the Cooperation-iws can be found on several places. The best place to start would be the official <a href="http://cooperation-iws.gensys-net.eu/wiki/">wiki</a>. Here you can help yourself to the information that is regularly published and updated as Ciws develops. There is much more to come too!</p><p>Another great place would of course be the <a href="http://cooperation-iws.gensys-net.eu/forum/" target="_blank">Forum</a> . On the Ciws Forum you can find help and support from Community members as well as from Ciws Core members and Working Group members. </p><h1>Documentation </h1><p>Ciws Documentation can of course be found on the <a href="http://cooperation-iws.gensys-net.eu/wiki" target="_blank">wiki</a>. You can find information such as an Installation Guide, User and Administrator manuals, Frequently Asked Questions and a lot more.</p><h1>Want to help? </h1><p>If you want to help in the documentation project for Joomla! then please post your details on the <a href="http://cooperation-iws.gensys-net.eu/forum/" title="The Joomla! User Documentation Forums">User Documentation Forum</a> or the <a href="http://cooperation-iws.gensys-net.eu/forum/" title="The Joomla! Developer Documentation Forum">Developer Documentation Forum</a> </p><p><a class="urlextern" href="http://forum.joomla.org/viewforum.php?f=391" target="_blank" title="http://forum.joomla.org/viewforum.php?f=59" onclick="return svchk()"><br /></a></p>', '', -2, 4, 0, 25, '2006-10-09 08:33:57', 62, '', '2008-10-20 12:15:01', 62, 0, '0000-00-00 00:00:00', '2006-10-07 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 14, 0, 0, '', '', 0, 8, 'robots=\nauthor='),
(48, 'What are the default logins / passwords ?', 'what-are-the-default-logins-passwords-', '', 'Default login / passwords are stored on a text file called PASSWORDS.txt on the Desktop of the Ciws server.', '', -2, 3, 0, 31, '2008-10-20 12:37:20', 62, '', '2008-10-20 12:39:54', 62, 0, '0000-00-00 00:00:00', '2008-10-20 12:37:20', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(21, 'Joomla! Facts', 'joomla-facts', '', '<p>Here are some interesting facts about Joomla!</p><ul><li><span>Over 140,000 active registered Users on the <a href="http://forums.joomla.org">Official Joomla! community forum</a> and more on the many international community sites.</span><ul><li><span>over 1,000,000 posts in over 200,000 topics</span></li><li>over 1,200 posts per day</li><li>growing at 150 new participants each day!</li></ul></li><li><span>1168 Projects on the JoomlaCode (<a href="http://joomlacode.org/">joomlacode.org</a> ). All for open source addons by third party developers.</span><ul><li><span>Nearly 1,900,000 downloads of Joomla! since the migration to JoomlaCode in March 2007.<br /></span></li></ul></li><li><span>2200+ Extensions for Joomla! have been registered on the <a href="http://extensions.joomla.org" title="http://extensions.joomla.org">Joomla! Extension Directory</a>  </span></li><li><span>Joomla.org exceeds 2 TB of traffic per month!</span></li><li><span>Alexa report [November 2007]: Joomla.org at #690 of the busiest Web sites in the world.</span></li></ul>', '', -2, 4, 0, 30, '2006-10-09 16:46:37', 62, '', '2007-11-04 18:24:09', 62, 0, '0000-00-00 00:00:00', '2006-10-07 14:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 13, 0, 0, '', '', 0, 50, 'robots=\nauthor='),
(22, 'What''s New in 0.5.2?', 'whats-new-in-052', '', 'The 0.5.2 release of Cooperation-iws improved many aspects of the servers: <br /><p style="margin-bottom: 0in">In Ciws 0.5.2, you''ll notice: </p>    <ul><li>New unified front-end to your Ciws Server. </li><li><p style="margin-bottom: 0in">Ciws comes now in different flavour: Ciws servers and Ciws client </p>   </li><li>     <p style="margin-bottom: 0in"> Cooperation-iws.gensys-net.eu new Content Management System aimed at spreading Ciws philosophy.</p>   </li></ul>', '', -2, 4, 0, 29, '2006-10-11 22:13:58', 62, '', '2008-10-20 12:01:12', 62, 0, '0000-00-00 00:00:00', '2006-10-10 18:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 12, 0, 0, '', '', 0, 103, 'robots=\nauthor='),
(49, 'How do I boot from Live CD or Live Usb?', 'how-do-i-boot-from-live-cd-or-live-usb', '', '<h4><a name="how_to_boot_from_cooperation-iws_live_cd"></a>How do I boot from Cooperation-iws Live CD</h4> <div class="level4">  <p> In most PC, you just have to insert the Live CD in your Computer tray and then reboot. If nothing happens and you stay in your normal environment, it means that your bios is not configure to boot first on Cdrom device. <br />To configure your bios, you need to press a specific key which is indicated on the screen at the start of your computer. You need then to naviguate in menu and choose to boot first on the CDROM device. </p>  </div>  <h4><a name="how_to_boot_from_cooperation-iws_live_usb"></a>How do I boot from Cooperation-iws Live USB</h4> <div class="level4">  <p> Generally you will have to tell your bios to boot first from the Live USB device (key or hard drive). <br />To configure your bios, you need to press a specific key which is indicated on the screen at the start of your computer. You need then to naviguate in menu and choose to boot first on your USB device. </p>  </div>', '', -2, 3, 0, 31, '2008-10-20 12:40:07', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-20 12:40:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 0, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(23, 'Platforms and Open Standards', 'platforms-and-open-standards', '', '<div class="level2">  <p>Cooperation-iws runs from CD (Read only),  USB key (read / write), USB disk (read / write),</p><p>Cooperation-iws runs on any  32-bit machine with a minimum of 1Gb RAM (2Gb recommended) which can boot on removable medias (Most recent pc).</p><p> Once installed on the removable media, Cooperation-iws may run on different machines. The Ciws server stopped, the machine returns to its original use. Ciws does not install anything on the operating machine (If windows is installed, it does not remove windows). </p>  </div>', '', -2, 4, 0, 25, '2006-10-11 04:22:14', 62, '', '2008-10-20 12:09:17', 62, 0, '0000-00-00 00:00:00', '2006-10-10 08:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 0, '', '', 0, 13, 'robots=\nauthor='),
(24, 'Content Layouts', 'content-layouts', '', '<p>Joomla! provides plenty of flexibility when displaying your Web content. Whether you are using Joomla! for a blog site, news or a Web site for a company, you''ll find one or more content styles to showcase your information. You can also change the style of content dynamically depending on your preferences. Joomla! calls how a page is laid out a <strong>layout</strong>. Use the guide below to understand which layouts are available and how you might use them. </p> <h2>Content </h2> <p>Joomla! makes it extremely easy to add and display content. All content  is placed where your mainbody tag in your template is located. There are three main types of layouts available in Joomla! and all of them can be customised via parameters. The display and parameters are set in the Menu Item used to display the content your working on. You create these layouts by creating a Menu Item and choosing how you want the content to display.</p> <h3>Blog Layout<br /> </h3> <p>Blog layout will show a listing of all Articles of the selected blog type (Section or Category) in the mainbody position of your template. It will give you the standard title, and Intro of each Article in that particular Category and/or Section. You can customise this layout via the use of the Preferences and Parameters, (See Article Parameters) this is done from the Menu not the Section Manager!</p> <h3>Blog Archive Layout<br /> </h3> <p>A Blog Archive layout will give you a similar output of Articles as the normal Blog Display but will add, at the top, two drop down lists for month and year plus a search button to allow Users to search for all Archived Articles from a specific month and year.</p> <h3>List Layout<br /> </h3> <p>Table layout will simply give you a <em>tabular </em>list<em> </em>of all the titles in that particular Section or Category. No Intro text will be displayed just the titles. You can set how many titles will be displayed in this table by Parameters. The table layout will also provide a filter Section so that Users can reorder, filter, and set how many titles are listed on a single page (up to 50)</p> <h2>Wrapper</h2> <p>Wrappers allow you to place stand alone applications and Third Party Web sites inside your Joomla! site. The content within a Wrapper appears within the primary content area defined by the "mainbody" tag and allows you to display their content as a part of your own site. A Wrapper will place an IFRAME into the content Section of your Web site and wrap your standard template navigation around it so it appears in the same way an Article would.</p> <h2>Content Parameters</h2> <p>The parameters for each layout type can be found on the right hand side of the editor boxes in the Menu Item configuration screen. The parameters available depend largely on what kind of layout you are configuring.</p>', '', -2, 4, 0, 29, '2006-10-12 22:33:10', 62, '', '2007-11-04 16:58:35', 62, 0, '0000-00-00 00:00:00', '2006-10-11 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 11, 0, 0, '', '', 0, 70, 'robots=\nauthor='),
(25, 'What are the requirements to run a Ciws server', 'what-are-the-requirements-to-run-ciws-052', '', '<div class="level2">  <p> In fact it depends of the contents of your Ciws server. </p>  <p> In every case you need a Intel-compatible CPU (i486 or later), bootable CD-ROM drive or Usb bootable motherboard. </p>  <p> To boot the demo Live CD, you need at least 1Gb RAM. </p>  <p> To boot the demo Live DVD, you need at least 1,5Gb RAM. </p>  <p> To boot demo USB, you need at least 1Gb RAM. </p>  <p>  But if you make your custom Cooperation-iws and if you only choose small applications (like blog <acronym title="Content Management System">CMS</acronym>), you might boot USB with 256Mb RAM.</p>  </div>  <h2><a name="where_can_i_get_cooperation-iws_cd_dvd" title="where_can_i_get_cooperation-iws_cd_dvd"></a></h2><a href="http://forum.joomla.org" title="The Joomla! Community Forums"></a>', '', -2, 3, 0, 31, '2006-10-11 00:42:31', 62, '', '2008-10-20 12:43:08', 62, 0, '0000-00-00 00:00:00', '2006-10-10 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 0, '', '', 0, 31, 'robots=\nauthor='),
(26, 'Extensions', 'extensions', '', '<p>Out of the box, Joomla! does a great job of managing the content needed to make your Web site sing. But for many people, the true power of Joomla! lies in the application framework that makes it possible for developers all around the world to create powerful add-ons that are called <strong>Extensions</strong>. An Extension is used to add capabilities to Joomla! that do not exist in the base core code. Here are just some examples of the hundreds of available Extensions:</p> <ul>   <li>Dynamic form builders</li>   <li>Business or organisational directories</li>   <li>Document management</li>   <li>Image and multimedia galleries</li>   <li>E-commerce and shopping cart engines</li>   <li>Forums and chat software</li>   <li>Calendars</li>   <li>E-mail newsletters</li>   <li>Data collection and reporting tools</li>   <li>Banner advertising systems</li>   <li>Paid subscription services</li>   <li>and many, many, more</li> </ul> <p>You can find more examples over at our ever growing <a href="http://extensions.joomla.org" target="_blank" title="Joomla! Extensions Directory">Joomla! Extensions Directory</a>. Prepare to be amazed at the amount of exciting work produced by our active developer community!</p><p>A useful guide to the Extension site can be found at:<br /><a href="http://extensions.joomla.org/content/view/15/63/" target="_blank" title="Guide to the Joomla! Extension site">http://extensions.joomla.org/content/view/15/63/</a> </p> <h3>Types of Extensions </h3><p>There are five types of extensions:</p> <ul>   <li>Components</li>   <li>Modules</li>   <li>Templates</li>   <li>Plugins</li>   <li>Languages</li> </ul> <p>You can read more about the specifics of these using the links in the Article Index - a Table of Contents (yet another useful feature of Joomla!) - at the top right or by clicking on the <strong>Next </strong>link below.<br /> </p> <hr title="Components" class="system-pagebreak" /> <h3><img src="images/stories/ext_com.png" border="0" alt="Component - Joomla! Extension Directory" title="Component - Joomla! Extension Directory" width="17" height="17" /> Components</h3> <p>A Component is the largest and most complex of the Extension types.  Components are like mini-applications that render the main body of the  page. An analogy that might make the relationship easier to understand  would be that Joomla! is a book and all the Components are chapters in  the book. The core Article Component (<font face="courier new,courier">com_content</font>), for example, is the  mini-application that handles all core Article rendering just as the  core registration Component (<font face="courier new,courier">com_user</font>) is the mini-application  that handles User registration.</p> <p>Many of Joomla!''s core features are provided by the use of default Components such as:</p> <ul>   <li>Contacts</li>   <li>Front Page</li>   <li>News Feeds</li>   <li>Banners</li>   <li>Mass Mail</li>   <li>Polls</li></ul><p>A Component will manage data, set displays, provide functions, and in general can perform any operation that does not fall under the general functions of the core code.</p> <p>Components work hand in hand with Modules and Plugins to provide a rich variety of content display and functionality aside from the standard Article and content display. They make it possible to completely transform Joomla! and greatly expand its capabilities.</p>  <hr title="Modules" class="system-pagebreak" /> <h3><img src="images/stories/ext_mod.png" border="0" alt="Module - Joomla! Extension Directory" title="Module - Joomla! Extension Directory" width="17" height="17" /> Modules</h3> <p>A more lightweight and flexible Extension used for page rendering is a Module. Modules are used for small bits of the page that are generally  less complex and able to be seen across different Components. To  continue in our book analogy, a Module can be looked at as a footnote  or header block, or perhaps an image/caption block that can be rendered  on a particular page. Obviously you can have a footnote on any page but  not all pages will have them. Footnotes also might appear regardless of  which chapter you are reading. Simlarly Modules can be rendered  regardless of which Component you have loaded.</p> <p>Modules are like little mini-applets that can be placed anywhere on your site. They work in conjunction with Components in some cases and in others are complete stand alone snippets of code used to display some data from the database such as Articles (Newsflash) Modules are usually used to output data but they can also be interactive form items to input data for example the Login Module or Polls.</p> <p>Modules can be assigned to Module positions which are defined in your Template and in the back-end using the Module Manager and editing the Module Position settings. For example, "left" and "right" are common for a 3 column layout. </p> <h4>Displaying Modules</h4> <p>Each Module is assigned to a Module position on your site. If you wish it to display in two different locations you must copy the Module and assign the copy to display at the new location. You can also set which Menu Items (and thus pages) a Module will display on, you can select all Menu Items or you can pick and choose by holding down the control key and selecting multiple locations one by one in the Modules [Edit] screen</p> <p>Note: Your Main Menu is a Module! When you create a new Menu in the Menu Manager you are actually copying the Main Menu Module (<font face="courier new,courier">mod_mainmenu</font>) code and giving it the name of your new Menu. When you copy a Module you do not copy all of its parameters, you simply allow Joomla! to use the same code with two separate settings.</p> <h4>Newsflash Example</h4> <p>Newsflash is a Module which will display Articles from your site in an assignable Module position. It can be used and configured to display one Category, all Categories, or to randomly choose Articles to highlight to Users. It will display as much of an Article as you set, and will show a <em>Read more...</em> link to take the User to the full Article.</p> <p>The Newsflash Component is particularly useful for things like Site News or to show the latest Article added to your Web site.</p>  <hr title="Plugins" class="system-pagebreak" /> <h3><img src="images/stories/ext_plugin.png" border="0" alt="Plugin - Joomla! Extension Directory" title="Plugin - Joomla! Extension Directory" width="17" height="17" /> Plugins</h3> <p>One  of the more advanced Extensions for Joomla! is the Plugin. In previous  versions of Joomla! Plugins were known as Mambots. Aside from changing their name their  functionality has been expanded. A Plugin is a section of code that  runs when a pre-defined event happens within Joomla!. Editors are Plugins, for example, that execute when the Joomla! event <font face="courier new,courier">onGetEditorArea</font> occurs. Using a Plugin allows a developer to change  the way their code behaves depending upon which Plugins are installed  to react to an event.</p>  <hr title="Languages" class="system-pagebreak" /> <h3><img src="images/stories/ext_lang.png" border="0" alt="Language - Joomla! Extensions Directory" title="Language - Joomla! Extensions Directory" width="17" height="17" /> Languages</h3> <p>New  to Joomla! 1.5 and perhaps the most basic and critical Extension is a Language. Joomla! is released with multiple Installation Languages but the base Site and Administrator are packaged in just the one Language <strong>en-GB</strong> - being English with GB spelling for example. To include all the translations currently available would bloat the core package and make it unmanageable for uploading purposes. The Language files enable all the User interfaces both Front-end and Back-end to be presented in the local preferred language. Note these packs do not have any impact on the actual content such as Articles. </p> <p>More information on languages is available from the Joomla! help site: Language Packs and Localised Releases<br />   <a href="http://help.joomla.org/content/view/1651/243/" target="_blank" title="Joomla! help site: Language Packs and Localised Releases">http://help.joomla.org/content/view/1651/243/</a></p>', '', -2, 4, 0, 29, '2006-10-11 06:00:00', 62, '', '2007-11-08 14:49:48', 62, 0, '0000-00-00 00:00:00', '2006-10-10 22:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 24, 0, 0, 'About Joomla!, General, Extensions', '', 0, 103, 'robots=\nauthor='),
(27, 'The Joomla! Community', 'the-joomla-community', '', '<p><strong>Got a question? </strong>With more than 210,000 members, the Joomla Discussion Forums at <a href="http://forum.joomla.org/" target="_blank">forum.joomla.org</a>  are a great resource for both new and experienced users. Ask your toughest questions—the community is waiting to see what you''ll do with your Joomla site.</p><p><strong>Do you want to show off your new Joomla Web site?</strong> Visit the <a href="http://forum.joomla.org/viewforum.php?f=514">Site Showcase</a> section of our forum. </p><p><strong>Do you want to contribute?</strong></p><p>If you think working with Joomla is fun, wait until you start working on it. We''re passionate about helping Joomla users become contributors. There are many ways you can help Joomla''s development:</p> <ul><li>Submit news about Joomla. We syndicate Joomla-related news on <a href="http://news.joomla.org" title="JoomlaConnect">JoomlaConnect™</a>. If you have Joomla news that you would like to share with the community, find out how to get connected <a href="http://community.joomla.org/connect.html">here</a>. </li><li>Report bugs and request features in our <a href="http://joomlacode.org/gf/project/joomla/tracker/" title="Joomla! developement trackers">trackers</a>. Please read <a href="http://dev.joomla.org/content/view/1450/89/">Reporting Bugs</a>, for details on how we like our bug reports served up</li><li>Submit patches for new and/or fixed behaviour. Please read <a href="http://dev.joomla.org/content/view/14/55/">Submitting Patches</a>, for details on how to submit a patch.</li><li>Join the <a href="http://forum.joomla.org/viewforum.php?f=509" title="Joomla! development forums">developer forums</a> and share your ideas for how to improve Joomla. We''re always open to suggestions, although we''re likely to be sceptical of large-scale suggestions without some code to back it up.</li><li>Join any of the <a href="http://dev.joomla.org/content/view/13/53/" title="Joomla! working groups">Joomla Working Groups</a>  and bring your personal expertise to  the Joomla community. </li></ul>           <p> These are just a few ways you can contribute. See <a href="http://www.joomla.org/about-joomla/contribute-to-joomla.html">Contribute to Joomla</a> for many more ways.</p>', '', -2, 4, 0, 30, '2006-10-12 16:50:48', 62, '', '2008-08-28 21:52:00', 62, 0, '0000-00-00 00:00:00', '2006-10-11 02:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 12, 0, 0, '', '', 0, 53, 'robots=\nauthor='),
(28, 'How do I install a Ciws server?', 'how-do-i-install-ciws-server', '', '<p>Installing of Ciws server 0.5.2 is pretty easy. <br /><br />Download the iso image of a ciws server flavour, burn it and boot it.To install on Usb device, click on the Live Usb installer icon on the desktop.</p><p>You should get the following screen: </p><p>&nbsp;</p><div style="text-align: center"><img src="http://cooperation-iws.gensys-net.eu/wiki/lib/exe/fetch.php?w=&h=&cache=cache&media=screenshots:en:capture-live-usb.png" border="0" width="514" height="450" /></div><p>&nbsp;</p><p>&nbsp;</p><p>Choose your usb device in the target device field, click on the right icon to detect it if not detected.</p><p>Choose  what kind of persistent partition you need (ciws-rw for server) and click on execute !</p><p> That''s it. </p>', '', -2, 3, 0, 31, '2006-10-11 01:10:59', 62, '', '2008-10-20 12:49:47', 62, 0, '0000-00-00 00:00:00', '2006-10-10 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 0, '', '', 0, 8, 'robots=\nauthor='),
(29, 'What is the purpose of the collation selection in the installation screen?', 'what-is-the-purpose-of-the-collation-selection-in-the-installation-screen', '', 'The collation option determines the way ordering in the database is done. In languages that use special characters, for instance the German umlaut, the database collation determines the sorting order. If you don''t know which collation you need, select the "utf8_general_ci" as most languages use this. The other collations listed are exceptions in regards to the general collation. If your language is not listed in the list of collations it most likely means that "utf8_general_ci is suitable.', '', -2, 3, 0, 32, '2006-10-11 03:11:38', 62, '', '2007-05-03 09:40:32', 62, 0, '0000-00-00 00:00:00', '2006-10-10 08:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=', 4, 0, 0, '', '', 0, 6, 'robots=\nauthor='),
(30, 'What languages are supported by Joomla! 1.5?', 'what-languages-are-supported-by-joomla-15', '', 'Within the Installer you will find a wide collection of languages. The installer currently supports the following languages: Arabic, Bulgarian, Bengali, Czech, Danish, German, Greek, English, Spanish, Finnish, French, Hebrew, Devanagari(India), Croatian(Croatia), Magyar (Hungary), Italian, Malay, Norwegian bokmal, Dutch, Portuguese(Brasil), Portugues(Portugal), Romanian, Russian, Serbian, Svenska, Thai and more are being added all the time.<br />By default the English language is installed for the Back and Front-ends. You can download additional language files from the <a href="http://extensions.joomla.org" title="Joomla! Extensions Directory">Joomla!Extensions Directory</a>. In addition some translation teams are offering fully localised versions of the entire package. Please check the <a href="http://help.joomla.org/content/view/1651/62/" target="blank_" title="Joomla! help site for links">Joomla! Help Site for links</a>   to locations where languages and localised versions can be found.', '', -2, 3, 0, 32, '2006-10-11 01:12:18', 62, '', '2007-11-08 11:45:40', 62, 0, '0000-00-00 00:00:00', '2006-10-10 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 0, '', '', 0, 8, 'robots=\nauthor='),
(31, 'Is it useful to install the sample data?', 'is-it-useful-to-install-the-sample-data', '', 'Well you are reading it right now! This depends on what you want to achieve. If you are new to Joomla! and have no clue how it all fits together, just install the sample data. If you don''t like the English sample data because you - for instance - speak Chinese, then leave it out.', '', -2, 3, 0, 27, '2006-10-11 09:12:55', 62, '', '2007-11-08 12:03:24', 62, 0, '0000-00-00 00:00:00', '2006-10-10 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 0, '', '', 0, 3, 'robots=\nauthor='),
(32, 'Where is the Static Content Item?', 'where-is-the-static-content', '', '<p>In Joomla! versions prior to 1.5 there were separate processes for creating a Static Content Item and normal Content Items. The processes have been combined now and whilst both content types are still around they are renamed as Articles for Content Items and Uncategorized Articles for Static Content Items. </p><p>If you want to create a static item, create a new Article in the same way as for standard content and rather than relating this to a particular Section and Category just select <span style="font-style: italic">Uncategorized</span> as the option in the Section and Category drop down lists.</p>', '', -2, 3, 0, 28, '2006-10-10 23:13:33', 62, '', '2007-11-08 11:23:56', 62, 0, '0000-00-00 00:00:00', '2006-10-10 04:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 0, '', '', 0, 5, 'robots=\nauthor='),
(33, 'What is an Uncategorised Article?', 'what-is-uncategorised-article', '', 'Most Articles will be assigned to a Section and Category. In many cases, you might not know where you want it to appear so put the Article in the <em>Uncategorized </em>Section/Category. The Articles marked as <em>Uncategorized </em>are handled as static content.', '', -2, 3, 0, 31, '2006-10-11 15:14:11', 62, '', '2007-11-08 11:23:14', 62, 0, '0000-00-00 00:00:00', '2006-10-10 12:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 0, '', '', 0, 6, 'robots=\nauthor='),
(34, 'Does the PDF icon render pictures and special characters?', 'does-the-pdf-icon-render-pictures-and-special-characters', '', 'Yes! Prior to Joomla! 1.5, only the text values of an Article and only for ISO-8859-1 encoding was allowed in the PDF rendition. With the new PDF library in place, the complete Article including images is rendered and applied to the PDF. The PDF generator also handles the UTF-8 texts and can handle any character sets from any language. The appropriate fonts must be installed but this is done automatically during a language pack installation.', '', -2, 3, 0, 32, '2006-10-11 17:14:57', 62, '', '2007-11-08 11:46:29', 62, 0, '0000-00-00 00:00:00', '2006-10-10 14:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 0, '', '', 0, 6, 'robots=\nauthor='),
(35, 'Is it possible to change A Menu Item''s Type?', 'is-it-possible-to-change-the-types-of-menu-entries', '', '<p>You indeed can change the Menu Item''s Type to whatever you want, even after they have been created. </p><p>If, for instance, you want to change the Blog Section of a Menu link, go to the Control Panel-&gt;Menus Menu-&gt;[menuname]-&gt;Menu Item Manager and edit the Menu Item. Select the <strong>Change Type</strong> button and choose the new style of Menu Item Type from the available list. Thereafter, alter the Details and Parameters to reconfigure the display for the new selection  as you require it.</p>', '', -2, 3, 0, 31, '2006-10-10 23:15:36', 62, '', '2007-11-08 11:25:01', 62, 0, '0000-00-00 00:00:00', '2006-10-10 04:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 0, '', '', 0, 18, 'robots=\nauthor='),
(36, 'Where did the Installers go?', 'where-did-the-installer-go', '', 'The improved Installer can be found under the Extensions Menu. With versions prior to Joomla! 1.5 you needed to select a specific Extension type when you wanted to install it and use the Installer associated with it, with Joomla! 1.5 you just select the Extension you want to upload, and click on install. The Installer will do all the hard work for you.', '', -2, 3, 0, 28, '2006-10-10 23:16:20', 62, '', '2007-11-04 23:10:18', 62, 0, '0000-00-00 00:00:00', '2006-10-10 04:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 0, '', '', 0, 4, 'robots=\nauthor='),
(37, 'Where did the Mambots go?', 'where-did-the-mambots-go', '', '<p>Mambots have been renamed as Plugins. </p><p>Mambots were introduced in Mambo and offered possibilities to add plug-in logic to your site mainly for the purpose of manipulating content. In Joomla! 1.5, Plugins will now have much broader capabilities than Mambots. Plugins are able to extend functionality at the framework layer as well.</p>', '', -2, 3, 0, 28, '2006-10-11 09:17:00', 62, '', '2007-11-08 11:04:30', 62, 0, '0000-00-00 00:00:00', '2006-10-10 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 0, '', '', 0, 4, 'robots=\nauthor='),
(38, 'I installed with my own language, but the Back-end is still in English', 'i-installed-with-my-own-language-but-the-back-end-is-still-in-english', '', '<p>A lot of different languages are available for the Back-end, but by default this language may not be installed. If you want a translated Back-end, get your language pack and install it using the Extension Installer. After this, go to the Extensions Menu, select Language Manager and make your language the default one. Your Back-end will be translated immediately.</p><p>Users who have access rights to the Back-end may choose the language they prefer in their Personal Details parameters. This is of also true for the Front-end language.</p><p> A good place to find where to download your languages and localised versions of Joomla! is on our <a href="http://help.joomla.org/content/view/1651/62/" target="blank_" title="Help Site">Help Site</a>.</p>', '', -2, 3, 0, 32, '2006-10-11 17:18:14', 62, '', '2007-11-08 11:42:43', 62, 0, '0000-00-00 00:00:00', '2006-10-10 14:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 0, '', '', 0, 7, 'robots=\nauthor='),
(39, 'How do I remove an Article?', 'how-do-i-remove-an-article', '', '<p>To completely remove an Article, select the Articles that you want to delete and move them to the Trash. Next, open the Article Trash in the Content Menu and select the Articles you want to delete. After deleting an Article, it is no longer available as it has been deleted from the database and it is not possible to undo this operation.  </p>', '', -2, 3, 0, 27, '2006-10-11 09:19:01', 62, '', '2007-11-08 12:01:26', 62, 0, '0000-00-00 00:00:00', '2006-10-10 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 0, '', '', 0, 4, 'robots=\nauthor='),
(40, 'What is the difference between Archiving and Trashing an Article? ', 'what-is-the-difference-between-archiving-and-trashing-an-article', '', '<p>When you <em>Archive </em>an Article, the content is put into a state which removes it from your site as published content. The Article is still available from within the Control Panel and can be <em>retrieved </em>for editing or republishing purposes. Trashed Articles are just one step from being permanently deleted but are still available until you Remove them from the Trash Manager. You should use Archive if you consider an Article important, but not current. Trash should be used when you want to delete the content entirely from your site and from future search results.  </p>', '', -2, 3, 0, 27, '2006-10-11 05:19:43', 62, '', '2007-11-08 12:02:40', 62, 0, '0000-00-00 00:00:00', '2006-10-10 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 0, '', '', 0, 6, 'robots=\nauthor='),
(41, 'Newsflash 5', 'newsflash-5', '', 'Joomla! 1.5 - ''Experience the Freedom''!. It has never been easier to create your own dynamic Web site. Manage all your content from the best CMS admin interface and in virtually any language you speak.', '', -2, 1, 0, 3, '2006-10-12 00:17:31', 62, '', '2007-11-08 12:17:53', 62, 0, '0000-00-00 00:00:00', '2006-10-11 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 0, '', '', 0, 4, 'robots=\nauthor='),
(42, 'Newsflash 4', 'newsflash-4', '', 'Yesterday all servers in the U.S. went out on strike in a bid to get more RAM and better CPUs. A spokes person said that the need for better RAM was due to some fool increasing the front-side bus speed. In future, buses will be told to slow down in residential motherboards.', '', -2, 1, 0, 3, '2006-10-12 00:25:50', 62, '', '2007-11-08 12:17:20', 62, 0, '0000-00-00 00:00:00', '2006-10-11 06:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 0, '', '', 0, 5, 'robots=\nauthor='),
(43, 'Example Pages and Menu Links', 'example-pages-and-menu-links', '', '<p>This page is an example of content that is <em>Uncategorized</em>; that is, it does not belong to any Section or Category. You will see there is a new Menu in the left column. It shows links to the same content presented in 4 different page layouts.</p><ul><li>Section Blog</li><li>Section Table</li><li> Blog Category</li><li>Category Table</li></ul><p>Follow the links in the <strong>Example Pages</strong> Menu to see some of the options available to you to present all the different types of content included within the default installation of Joomla!.</p><p>This includes Components and individual Articles. These links or Menu Item Types (to give them their proper name) are all controlled from within the <strong><font face="courier new,courier">Menu Manager-&gt;[menuname]-&gt;Menu Items Manager</font></strong>. </p>', '', -2, 0, 0, 0, '2006-10-12 09:26:52', 62, '', '2007-11-04 15:36:15', 62, 0, '0000-00-00 00:00:00', '2006-10-11 10:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 0, 'Uncategorized, Uncategorized, Example Pages and Menu Links', '', 0, 43, 'robots=\nauthor='),
(44, 'The New Joomla Security Strike Team', 'the-new-joomla-security-strike-team', '', '<p>The Joomla Project has assembled a top-notch team of experts to form the new Joomla Security Strike Team. This new team will solely focus on investigating and resolving security issues. Instead of working in relative secrecy, the JSST will have a strong public-facing presence at the new <a href="http://developer.joomla.org/security.html">Joomla Security Center</a>.</p>', '<p>The new JSST will call the new <a href="http://developer.joomla.org/security.html">Joomla Security Center</a> their home base. The Security Center provides a public presence for <a href="http://developer.joomla.org/security/news.html">security issues</a> and a platform for the JSST to <a href="http://developer.joomla.org/security/articles-tutorials.html">help the general public better understand security</a> and how it relates to Joomla. The Security Center also offers users a clearer understanding of how security issues are handled. There''s also a <a href="http://feedproxy.google.com/JoomlaSecurityNews">news feed</a>, which provides subscribers an up-to-the-minute notification of security issues as they arise.</p>', -2, 1, 0, 1, '2004-07-07 09:54:06', 62, '', '2008-08-31 04:07:47', 62, 0, '0000-00-00 00:00:00', '2004-07-06 22:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(45, 'Joomla Community Portal Online', 'joomla-community-portal-online', '', '<p>The new <a href="http://community.joomla.org/">Joomla Community Portal</a> is now online. The Joomla Community Portal is a new web site for the Joomla community. There you will find a constant source of information about the activities powering the Joomla Project, learn about <a href="http://community.joomla.org/events.html">Joomla Events</a> worldwide, and see if there is a <a href="http://community.joomla.org/joomla-user-groups.html">Joomla User Group</a> nearby. A new, monthly <a href="http://community.joomla.org/magazine.html">Joomla Community Magazine</a> promises an interesting overview of project activities, community accomplishments, and learning material.</p>', '<p>The <a href="http://community.joomla.org/magazine.html">Joomla Community Magazine</a> promises to be a must read each month. Community members will take turns sharing cool Joomla 1.5 Web sites, Joomla 1.5 GPL extensions, event information, involvement opportunities, and articles about local communities.</p> <p>The new <a href="http://community.joomla.org/connect.html">JoomlaConnect™</a> brings together tons of Joomla news from all over the world in your language. Get the latest and greatest by clicking <a href="http://community.joomla.org/connect.html">here</a>.</p>', -2, 1, 0, 1, '2004-07-07 09:54:06', 62, '', '2008-08-31 04:21:50', 62, 0, '0000-00-00 00:00:00', '2004-07-06 22:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(46, 'Download', 'download', '', 'Here''s the download area!', '', -2, 4, 0, 25, '2008-10-19 10:49:56', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-10-19 10:49:56', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 0, '', '', 0, 2, 'robots=\nauthor='),
(50, 'Welcome on Cooperation-iws web !', 'welcome-on-cooperation-iws-web-', '', '<p>You are now surfing on a Cooperation-iws Intranet server 0.7.0. </p><p>&nbsp;</p><div style="text-align: center"><img src="images/ciws_front_design.jpg" border="0" width="400" height="233" /></div> <p>&nbsp;</p><p> More info about Cooperation-iws: <a href="http://www.cooperation-iws.eu">http://www.cooperation-iws.eu</a></p><p>&lt;?php </p><p>$xml_file="cooperation-wui.xml"; </p><p>$tree = simplexml_load_file(''../''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree-&gt;item as $item) {    <br />                            $array_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);<br />                            $array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);<br />                            $array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);<br />                            $array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);<br />                            $array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_xml as $key =&gt; $row) {<br />                            $category[$key]  = $row[''0''];<br />                            $item_name[$key] = $row[''1''];<br />                            $item_desc[$key] = $row[''2''];<br />                            $item_url[$key] = $row[''3''];<br />                            $item_admin_url[$key] = $row[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($category, SORT_ASC, $item_name, SORT_ASC, $array_xml);<br /><br />?&gt;</p><h1>Applications</h1><p>&lt;?php<br /><br />                       $prev_category = "";<br />                        for($count_boucle=0; $count_boucle &lt;= $count_xml_elt ; $count_boucle++) {<br />                            $category= $array_xml[$count_boucle][0];<br />                            if ("$prev_category" != "$category"){<br />                                echo "&lt;br&gt;\\n&lt;h3&gt;&lt;a name=\\"".$count_boucle."\\"&gt;&lt;/a&gt;".$category."&lt;/h3&gt;&lt;hr&gt;&lt;br&gt;\\n";<br />                            }<br />                            $prev_category = $category;<br />                            $name = $array_xml[$count_boucle][1];<br />                            $desc = $array_xml[$count_boucle][2];<br />                            $url = $array_xml[$count_boucle][3];<br />                            $admin_url =$array_xml[$count_boucle][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\\n";<br />                            echo $desc."&lt;br&gt;&lt;br&gt;\\n";<br />                            echo "&lt;a href=\\"".$url."\\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\\"".$admin_url."\\"&gt;admin&lt;/a&gt;\\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt; <br />&lt;?php $tree_admin = simplexml_load_file(''../admin/''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree_admin-&gt;item as $item) {    <br />                            $array_admin_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_admin_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_admin_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_admin_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_admin_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_admin_xml[$count_xml_elt][0] = strval($array_admin_xml[$count_xml_elt][0]);<br />                            $array_admin_xml[$count_xml_elt][1] = strval($array_admin_xml[$count_xml_elt][1]);<br />                            $array_admin_xml[$count_xml_elt][2] = strval($array_admin_xml[$count_xml_elt][2]);<br />                            $array_admin_xml[$count_xml_elt][3] = strval($array_admin_xml[$count_xml_elt][3]);<br />                            $array_admin_xml[$count_xml_elt][4] = strval($array_admin_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_admin_xml as $key_admin =&gt; $row_admin) {<br />                            $item_admin_category[$key_admin]  = $row_admin[''0''];<br />                            $item_admin_name[$key_admin] = $row_admin[''1''];<br />                            $item_admin_desc[$key_admin] = $row_admin[''2''];<br />                            $item_url[$key_admin] = $row_admin[''3''];<br />                            $item_admin_admin_url[$key_admin] = $row_admin[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($item_admin_category, SORT_ASC, $item_admin_name, SORT_ASC, $array_admin_xml);<br /><br />?&gt;</p><h1>Administration</h1><p>&nbsp;</p><p>&lt;?php<br /><br />                       $prev_admin_category = "";</p><p>&nbsp;</p><p>                        for($count_boucle_admin=0; $count_boucle_admin &lt;= $count_xml_elt ; $count_boucle_admin++) {<br />                            $category_admin= $array_admin_xml[$count_boucle_admin][0];<br />                            if ("$prev_admin_category" != "$category_admin"){<br />                                echo "&lt;br&gt;\\n&lt;h3&gt;&lt;a name=\\"admin_".$count_boucle_admin."\\"&gt;&lt;/a&gt;".$category_admin."&lt;/h3&gt;&lt;hr&gt;&lt;br&gt;\\n";<br />                            }<br />                            $prev_admin_category = $category_admin;<br />                            $name = $array_admin_xml[$count_boucle_admin][1];<br />                            $desc = $array_admin_xml[$count_boucle_admin][2];<br />                            $url = $array_admin_xml[$count_boucle_admin][3];<br />                            $admin_url =$array_admin_xml[$count_boucle_admin][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\\n";<br />                            echo $desc."&lt;br&gt;\\n";<br />                            echo "&lt;a href=\\"".$url."\\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\\"".$admin_url."\\"&gt;admin&lt;/a&gt;\\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt;         </p><p>&nbsp;</p>', '', 1, 1, 0, 1, '2008-11-29 23:32:01', 62, '', '2008-12-02 16:39:02', 62, 62, '2008-12-02 16:39:02', '2008-11-29 23:32:01', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 15, 0, 1, '', '', 0, 2, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(1, 2),
(50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL default '0',
  `section_value` varchar(230) NOT NULL default '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(25, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jf_content`
--

CREATE TABLE IF NOT EXISTS `jos_jf_content` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `reference_id` int(11) NOT NULL default '0',
  `reference_table` varchar(100) NOT NULL default '',
  `reference_field` varchar(100) NOT NULL default '',
  `value` text NOT NULL,
  `original_value` varchar(255) default NULL,
  `original_text` text,
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=142 ;

--
-- Dumping data for table `jos_jf_content`
--

INSERT INTO `jos_jf_content` (`id`, `language_id`, `reference_id`, `reference_table`, `reference_field`, `value`, `original_value`, `original_text`, `modified`, `modified_by`, `published`) VALUES
(1, 4, 5, 'content', 'title', 'Licence Ciws', '8d1641811303eaa68438b5f1455feddc', 'Ciws License Guidelines', '2008-10-19 09:50:01', 62, 1),
(2, 4, 5, 'content', 'alias', 'licence-ciws', 'cb537c8dd671bc9e5e5662b441c25cc0', 'ciws-license-guidelines', '2008-10-19 09:50:01', 62, 1),
(3, 4, 5, 'content', 'introtext', '<h3>Utilisation, reproduction, distribution</h3> <p>L''utilisation, la reproduction ou la distribution des matériaux de ce site web ou de son contenu téléchargeable peuvent être soumis à des termes et conditions contenus dans des licences séparées. A l''exception où les présentes conditions d''utilisation seraient en conflit avec les précédentes licences ci-mentionnées, les présentes conditions d''utilisation s''appliquent. Les scripts de création de Cooperation-iws ainsi que l''interface web utilisateur, ("Cooperation-wui") sont assujetis à la licence <a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html">GNU General Public License version 2</a> ("GPL") ou supérieure.  L''utilisation, la reproduction ou la distribution des scripts de création de Cooperation-iws ainsi que de Cooperation-wui sont donc soumis aux termes et conditions de la GPL.</p> <h3>Limites de responsabilité</h3><p> Le contenu de ce site web ainsi que les matériaux téléchargeables sont distribués dans l''espoir qu''ils vous seront utiles, mais SANS AUCUNE GARANTIE, ni explicite ni implicite; sans même les garanties de commercialisation ou d''adaptation dans un but spécifique.  Se référer à la "GNU General Public License" pour plus de détails.  Vous devriez avoir reçu une copie de la "GNU General Public License" en même temps que ce contenu et ces matériaux; sinon, écrivez a la "Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA". http://www.gnu.org/licenses/gpl-howto.fr.html</p><p>La documentation de Cooperation-iws est distribuée selon les termes de la  <a href="http://creativecommons.org/licenses/by-nc-sa/2.5/" title="Creative Commons ">Creative Commons Attribution-Non-Commercial-Share-Alike License 2.5</a> ou selon les termes de ses auteurs respectifs. </p>', '7e9975b8722fdb6484806459fabfb659', '<h3> Use, duplication, distribution</h3> <p>Use, duplication or distribution of materials on this web site or its contents can be subject to the terms and conditions contained in separate licenses. With the exception where these terms and conditions are in conflict with previous licenses mentioned here, these terms and conditions apply. The scripts for creating Cooperation-iws and the web user interface, ( "Cooperation-wui") are subject to the GNU General Public License version 2 ( "GPL") or higher. Use, duplication or distribution of Cooperation-iws live scripts as well as Cooperation-wui are subject to the terms and conditions of the GPL.</p> <h3>Limitation of Liability</h3> The contents of this website and download the materials are distributed in the hope that they will be useful, but WITHOUT ANY WARRANTY, even without warranty of merchantability or fitness for a particular purpose. Refer to the "GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this content and these materials, otherwise write to the "Free Software Foundation, Inc.. , 675 Mass Ave, Cambridge, MA 02139, USA. " http://www.gnu.org/licenses/gpl-howto.fr.html Http://www.gnu.org/licenses/gpl-howto.fr.html<p>Cooperation-iws documentation is released under the terms of the <a href="http://creativecommons.org/licenses/by-nc-sa/2.5/" title="Creative Commons ">Creative Commons Attribution-Non-Commercial-Share-Alike License 2.5</a> or by the specific license of their respective copyright owners.</p><p>The Cooperation-iws licence has always been GPL.</p>', '2008-10-19 09:50:01', 62, 1),
(4, 4, 5, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-19 09:50:01', 62, 1),
(5, 4, 2, 'menu', 'name', 'Licence Ciws', '68ab569dff230c681cec7f52cbd526e1', 'Ciws License', '2008-10-19 09:50:48', 62, 1),
(6, 4, 2, 'menu', 'alias', 'licence-ciws', '2b83c2b4be2b6d7ad66287d724de2e92', 'ciws-license', '2008-10-19 09:50:48', 62, 1),
(7, 4, 2, 'menu', 'params', 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\n\n', 'bdcadc8bb155c88def7d340c5dcaaf0f', 'show_noauth=0\r\nshow_title=\r\nlink_titles=0\r\nshow_intro=1\r\nshow_section=0\r\nlink_section=0\r\nshow_category=0\r\nlink_category=0\r\nshow_author=1\r\nshow_create_date=1\r\nshow_modify_date=1\r\nshow_item_navigation=0\r\nshow_readmore=1\r\nshow_vote=0\r\nshow_icons=1\r\nshow_pdf_icon=1\r\nshow_print_icon=1\r\nshow_email_icon=1\r\nshow_hits=1\r\nfeed_summary=\r\npage_title=\r\nshow_page_title=1\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\n\r\n', '2008-10-19 09:50:48', 62, 1),
(8, 4, 2, 'menu', 'link', 'index.php?option=com_content&view=article&id=5', '9032ec55e40ba78164eac98de35f42b0', 'index.php?option=com_content&view=article&id=5', '2008-10-19 09:50:48', 62, 1),
(9, 4, 28, 'menu', 'name', 'A propos de Ciws', '1ecd3db6ef385d7410999bdbe57c7f62', 'About Cooperation-iws', '2008-10-19 09:51:28', 62, 1),
(10, 4, 28, 'menu', 'alias', 'a-propos-de-ciws', 'c4d31479c94aca3708ba1e9adcbd6145', 'about-ciws', '2008-10-19 09:51:28', 62, 1),
(11, 4, 28, 'menu', 'params', 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\n\n', 'bdcadc8bb155c88def7d340c5dcaaf0f', 'show_noauth=0\r\nshow_title=\r\nlink_titles=0\r\nshow_intro=1\r\nshow_section=0\r\nlink_section=0\r\nshow_category=0\r\nlink_category=0\r\nshow_author=1\r\nshow_create_date=1\r\nshow_modify_date=1\r\nshow_item_navigation=0\r\nshow_readmore=1\r\nshow_vote=0\r\nshow_icons=1\r\nshow_pdf_icon=1\r\nshow_print_icon=1\r\nshow_email_icon=1\r\nshow_hits=1\r\nfeed_summary=\r\npage_title=\r\nshow_page_title=1\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\n\r\n', '2008-10-19 09:51:28', 62, 1),
(12, 4, 28, 'menu', 'link', 'index.php?option=com_content&view=article&id=25', '6c4f1731abb455b01300f34f43ec3cce', 'index.php?option=com_content&view=article&id=25', '2008-10-19 09:51:28', 62, 1),
(13, 4, 1, 'menu', 'name', 'Accueil', '8cf04a9734132302f96da8e113e80ce5', 'Home', '2008-11-30 00:24:08', 62, 1),
(14, 4, 1, 'menu', 'alias', 'accueil', '106a6c241b8797f52e1e77317b96a201', 'home', '2008-11-30 00:24:08', 62, 1),
(15, 4, 1, 'menu', 'params', 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\npage_title=Bienvenue sur la page d''accueil\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\n\n', 'c5a15d58a0c6144492fd7221c401082a', 'num_leading_articles=1\r\nnum_intro_articles=4\r\nnum_columns=2\r\nnum_links=4\r\norderby_pri=\r\norderby_sec=front\r\nmulti_column_order=1\r\nshow_pagination=2\r\nshow_pagination_results=1\r\nshow_feed_link=1\r\nshow_noauth=0\r\nshow_title=\r\nlink_titles=0\r\nshow_intro=1\r\nshow_section=0\r\nlink_section=0\r\nshow_category=0\r\nlink_category=0\r\nshow_author=1\r\nshow_create_date=1\r\nshow_modify_date=1\r\nshow_item_navigation=0\r\nshow_readmore=1\r\nshow_vote=0\r\nshow_icons=1\r\nshow_pdf_icon=1\r\nshow_print_icon=1\r\nshow_email_icon=1\r\nshow_hits=1\r\nfeed_summary=\r\npage_title=Welcome to the front page\r\nshow_page_title=0\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\n\r\n', '2008-11-30 00:24:08', 62, 1),
(16, 4, 1, 'menu', 'link', 'index.php?option=com_content&view=frontpage', '2f791f200ff60956d42c607a5bd44303', 'index.php?option=com_content&view=frontpage', '2008-11-30 00:24:08', 62, 1),
(17, 4, 27, 'menu', 'name', 'Aperçu de Ciws', '8ac68def4f400443d65a0de648c7f3fc', 'Joomla! Overview', '2008-10-19 09:57:32', 62, 1),
(18, 4, 27, 'menu', 'alias', 'apercu-de-ciws', '76b2d78165ee15fbc1009f592ad497eb', 'joomla-overview', '2008-10-19 09:57:32', 62, 1),
(19, 4, 27, 'menu', 'params', 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\n\n', 'fea5438d5db8fe76d5bc7cd3faa5d7d3', 'pageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\nshow_noauth=0\r\nlink_titles=0\r\nshow_intro=1\r\nshow_section=0\r\nlink_section=0\r\nshow_category=0\r\nlink_category=0\r\nshow_author=1\r\nshow_create_date=1\r\nshow_modify_date=1\r\nshow_item_navigation=0\r\nshow_readmore=1\r\nshow_vote=0\r\nshow_icons=1\r\nshow_pdf_icon=1\r\nshow_print_icon=1\r\nshow_email_icon=1\r\nshow_hits=1\r\n\r\n', '2008-10-19 09:57:32', 62, 1),
(20, 4, 27, 'menu', 'link', 'index.php?option=com_content&view=article&id=19', '1d575f0b8dbb7f354dec410c20f57dd5', 'index.php?option=com_content&view=article&id=19', '2008-10-19 09:57:32', 62, 1),
(21, 4, 37, 'menu', 'name', 'En savoir plus', '1c02d4ff8f27c61ee80b63d09b3283f4', 'More about Joomla!', '2008-10-19 09:58:10', 62, 1),
(22, 4, 37, 'menu', 'alias', 'en-savoir-plus', '9a66a6988b34df461ed8b6077b7e4f57', 'more-about-joomla', '2008-10-19 09:58:10', 62, 1),
(23, 4, 37, 'menu', 'params', 'show_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\n\n', 'd62efb33c12b1cc0a5ce965f847ff3f8', 'show_page_title=1\r\nshow_description=0\r\nshow_description_image=0\r\nshow_categories=1\r\nshow_empty_categories=0\r\nshow_cat_num_articles=1\r\nshow_category_description=1\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\norderby=\r\nshow_noauth=0\r\nshow_title=1\r\nlink_titles=0\r\nshow_intro=1\r\nshow_section=0\r\nlink_section=0\r\nshow_category=0\r\nlink_category=0\r\nshow_author=1\r\nshow_create_date=1\r\nshow_modify_date=1\r\nshow_item_navigation=0\r\nshow_readmore=1\r\nshow_vote=0\r\nshow_icons=1\r\nshow_pdf_icon=1\r\nshow_print_icon=1\r\nshow_email_icon=1\r\nshow_hits=1', '2008-10-19 09:58:10', 62, 1),
(24, 4, 37, 'menu', 'link', 'index.php?option=com_content&view=section&id=4', '31be23d31ba6e4693e9f0edeccc2fc48', 'index.php?option=com_content&view=section&id=4', '2008-10-19 09:58:10', 62, 1),
(25, 4, 29, 'menu', 'name', 'Caractéristiques', '98f770b0af18ca763421bac22b4b6805', 'Features', '2008-10-19 10:00:02', 62, 1),
(26, 4, 29, 'menu', 'alias', 'caracteristiques', '9f034b63948763d489f944319c2eb3de', 'features', '2008-10-19 10:00:02', 62, 1),
(27, 4, 29, 'menu', 'params', 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\n\n', 'fea5438d5db8fe76d5bc7cd3faa5d7d3', 'pageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\nshow_noauth=0\r\nlink_titles=0\r\nshow_intro=1\r\nshow_section=0\r\nlink_section=0\r\nshow_category=0\r\nlink_category=0\r\nshow_author=1\r\nshow_create_date=1\r\nshow_modify_date=1\r\nshow_item_navigation=0\r\nshow_readmore=1\r\nshow_vote=0\r\nshow_icons=1\r\nshow_pdf_icon=1\r\nshow_print_icon=1\r\nshow_email_icon=1\r\nshow_hits=1\r\n\r\n', '2008-10-19 10:00:02', 62, 1),
(28, 4, 29, 'menu', 'link', 'index.php?option=com_content&view=article&id=22', 'd6a57ac3e71e5d5f12a64133b1d8fb5e', 'index.php?option=com_content&view=article&id=22', '2008-10-19 10:00:02', 62, 1),
(29, 4, 48, 'menu', 'name', 'Liens', '31ec580d48e4c3e4b53e599ed8ed5e3c', 'Web Links', '2008-10-19 10:00:44', 62, 1),
(30, 4, 48, 'menu', 'alias', 'liens', '112ad1a0e437b5083d75538fb932ed14', 'web-links', '2008-10-19 10:00:44', 62, 1),
(31, 4, 48, 'menu', 'params', 'image=-1\nimage_align=right\nshow_feed_link=1\npage_title=Weblinks\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\ntarget=\nlink_icons=\n\n', 'e9f072f277d40d1e73979a02cb953e13', 'page_title=Weblinks\r\nimage=-1\r\nimage_align=right\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\nshow_comp_description=1\r\ncomp_description=\r\nshow_link_hits=1\r\nshow_link_description=1\r\nshow_other_cats=1\r\nshow_headings=1\r\nshow_page_title=1\r\nlink_target=0\r\nlink_icons=\r\n\r\n', '2008-10-19 10:00:44', 62, 1),
(32, 4, 48, 'menu', 'link', 'index.php?option=com_weblinks&view=categories', 'e219e787e6de63afb6b597b4fcc643ba', 'index.php?option=com_weblinks&view=categories', '2008-10-19 10:00:44', 62, 1),
(33, 4, 49, 'menu', 'name', 'RSS des nouvelles', '903380ae8f67435f226f96ef2046df97', 'News Feeds', '2008-10-19 10:01:37', 62, 1),
(34, 4, 49, 'menu', 'alias', 'rss-des-nouvelles', 'a51d6453ba0558912c3351186c28bf40', 'news-feeds', '2008-10-19 10:01:37', 62, 1),
(35, 4, 49, 'menu', 'params', 'show_limit=1\nshow_comp_description=1\ncomp_description=\nimage=-1\nimage_align=right\npage_title=Newsfeeds\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', '7c6cb88fa8f4fe652dbacaf509fbe93d', 'show_page_title=1\r\npage_title=Newsfeeds\r\nshow_comp_description=1\r\ncomp_description=\r\nimage=-1\r\nimage_align=right\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\nshow_headings=1\r\nshow_name=1\r\nshow_articles=1\r\nshow_link=1\r\nshow_other_cats=1\r\nshow_cat_description=1\r\nshow_cat_items=1\r\nshow_feed_image=1\r\nshow_feed_description=1\r\nshow_item_description=1\r\nfeed_word_count=0\r\n\r\n', '2008-10-19 10:01:37', 62, 1),
(36, 4, 49, 'menu', 'link', 'index.php?option=com_newsfeeds&view=categories', '41d95e030f518ca45f48861a565bf881', 'index.php?option=com_newsfeeds&view=categories', '2008-10-19 10:01:37', 62, 1),
(37, 4, 50, 'menu', 'name', 'Les nouvelles', '3b3c60a9948c3610bb4e7dcf98fd822b', 'The News', '2008-10-19 10:02:03', 62, 1),
(38, 4, 50, 'menu', 'alias', 'les-nouvelles', 'df7c86741b4e17f4ce5d3ad03169fc8a', 'the-news', '2008-10-19 10:02:03', 62, 1),
(39, 4, 50, 'menu', 'params', 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\npage_title=The News\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=\nmulti_column_order=0\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\n\n', 'fa1156ce20cc0e9b7232117084996c16', 'show_page_title=1\r\npage_title=The News\r\nshow_description=0\r\nshow_description_image=0\r\nnum_leading_articles=1\r\nnum_intro_articles=4\r\nnum_columns=2\r\nnum_links=4\r\nshow_title=1\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\norderby_pri=\r\norderby_sec=\r\nshow_pagination=2\r\nshow_pagination_results=1\r\nshow_noauth=0\r\nlink_titles=0\r\nshow_intro=1\r\nshow_section=0\r\nlink_section=0\r\nshow_category=0\r\nlink_category=0\r\nshow_author=1\r\nshow_create_date=1\r\nshow_modify_date=1\r\nshow_item_navigation=0\r\nshow_readmore=1\r\nshow_vote=0\r\nshow_icons=1\r\nshow_pdf_icon=1\r\nshow_print_icon=1\r\nshow_email_icon=1\r\nshow_hits=1\r\n\r\n', '2008-10-19 10:02:03', 62, 1),
(40, 4, 50, 'menu', 'link', 'index.php?option=com_content&view=category&layout=blog&id=1', '38c3da9063fbb5a862e69197e2a70d45', 'index.php?option=com_content&view=category&layout=blog&id=1', '2008-10-19 10:02:03', 62, 1),
(41, 4, 18, 'menu', 'name', 'Nouvelles', 'dd1ba1872df91985ed1ca4cde2dfe669', 'News', '2008-10-19 10:02:25', 62, 1),
(42, 4, 18, 'menu', 'alias', 'nouvelles', '508c75c8507a2ae5223dfd2faeb98122', 'news', '2008-10-19 10:02:25', 62, 1),
(43, 4, 18, 'menu', 'params', 'page_title=News\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', '3d78a73d819b9b1c4687c818ee63ff56', 'show_page_title=1\r\npage_title=News\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\nshow_headings=1\r\nshow_name=1\r\nshow_articles=1\r\nshow_link=1\r\nshow_other_cats=1\r\nshow_cat_description=1\r\nshow_cat_items=1\r\nshow_feed_image=1\r\nshow_feed_description=1\r\nshow_item_description=1\r\nfeed_word_count=0\r\n\r\n', '2008-10-19 10:02:25', 62, 1),
(44, 4, 18, 'menu', 'link', 'index.php?option=com_newsfeeds&view=newsfeed&id=1&feedid=1', 'd9d29212224f29354971de252f501005', 'index.php?option=com_newsfeeds&view=newsfeed&id=1&feedid=1', '2008-10-19 10:02:25', 62, 1),
(45, 4, 12, 'menu', 'name', ' Forums Ciws', '4bc33f02a676469395c9ed3d1f62d08f', 'Ciws Forums', '2008-10-19 10:11:01', 62, 1),
(46, 4, 12, 'menu', 'alias', 'ciws-forums', '26ba0c2c636a05363add1d91fcd60a65', 'ciws-forums', '2008-10-19 10:11:01', 62, 1),
(47, 4, 12, 'menu', 'params', 'menu_image=-1\n\n', '3ef6831f9af5f28d2afd98718ec70745', 'menu_image=-1\r\n\r\n', '2008-10-19 10:11:01', 62, 1),
(48, 4, 12, 'menu', 'link', 'http://cooperation-iws.gensys-net.eu/forum/', '9d5de76d78ed080cad104201ece46e05', 'http://cooperation-iws.gensys-net.eu/forum/', '2008-10-19 10:11:01', 62, 1),
(49, 4, 13, 'menu', 'name', 'Aide en ligne Ciws', 'c4f0bc082685feb430585df6d6adf6a5', 'Ciws Help', '2008-10-19 10:12:49', 62, 1),
(50, 4, 13, 'menu', 'alias', 'aide-en-ligne-ciws', '1362e2278ef2da6b9b3f5b3005a20b14', 'ciws-help', '2008-10-19 10:12:49', 62, 1),
(51, 4, 13, 'menu', 'params', 'menu_image=-1\n\n', '3ef6831f9af5f28d2afd98718ec70745', 'menu_image=-1\r\n\r\n', '2008-10-19 10:12:49', 62, 1),
(52, 4, 13, 'menu', 'link', 'https://launchpad.net/cooperation-iws', 'eb613b541ba0c8856a80a717e85f73e4', 'https://launchpad.net/cooperation-iws', '2008-10-19 10:12:49', 62, 1),
(53, 4, 1, 'modules', 'title', 'Menu ', 'e404dd0bece5f7c53d80edaa70513eec', 'Main Menu', '2008-10-19 10:14:02', 62, 1),
(54, 4, 1, 'modules', 'params', 'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', '264e0c0d2871ab1bbab32938ee4ab348', 'menutype=mainmenu\r\nmoduleclass_sfx=_menu\r\n', '2008-10-19 10:14:02', 62, 1),
(55, 4, 31, 'modules', 'title', 'Ressources', 'ddcf50c29294d4414f3f7c1bbc892cb5', 'Resources', '2008-10-19 10:14:20', 62, 1),
(56, 4, 31, 'modules', 'params', 'menutype=othermenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', '7e9e3c16b309389b4daf6f09cbdca557', 'menutype=othermenu\r\nmenu_style=list\r\nstartLevel=0\r\nendLevel=0\r\nshowAllChildren=0\r\nwindow_open=\r\nshow_whitespace=0\r\ncache=1\r\ntag_id=\r\nclass_sfx=\r\nmoduleclass_sfx=_menu\r\nmaxdepth=10\r\nmenu_images=0\r\nmenu_images_align=0\r\nexpand_menu=0\r\nactivate_parent=0\r\nfull_active_id=0\r\nindent_image=0\r\nindent_image1=\r\nindent_image2=\r\nindent_image3=\r\nindent_image4=\r\nindent_image5=\r\nindent_image6=\r\nspacer=\r\nend_spacer=\r\n\r\n', '2008-10-19 10:14:20', 62, 1),
(57, 4, 21, 'modules', 'title', 'Qui est en ligne', '5abc69f0675d929dde320bf486030000', 'Who', '2008-10-19 10:14:39', 62, 1),
(58, 4, 21, 'modules', 'params', 'cache=0\nshowmode=0\nmoduleclass_sfx=\n\n', 'd7ef9d4c803fe7e25a83b95fc4e8cb63', 'online=1\r\nusers=1\r\nmoduleclass_sfx=', '2008-10-19 10:14:39', 62, 1),
(59, 4, 45, 'modules', 'title', 'Téléchargement', '801ab24683a4a8c433c6eb40c48bcd9d', 'Download', '2008-10-19 10:15:04', 62, 1),
(60, 4, 45, 'modules', 'params', 'moduleclass_sfx=\n\n', 'f714ad11b4cd424f0ff1b02a4a84dc6c', 'moduleclass_sfx=\r\n\r\n', '2008-10-19 10:15:04', 62, 1),
(61, 4, 16, 'modules', 'title', 'Sondage', '79d6f84dece4bb8ae0de03b43d3f5bc6', 'Polls', '2008-10-19 10:42:13', 62, 1),
(62, 4, 16, 'modules', 'params', 'id=15\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', '85675348ada631c7317f4d3cefedce6c', 'id=15\r\nmoduleclass_sfx=\r\ncache=1\r\ncache_time=900\r\n\r\n', '2008-10-19 10:42:13', 62, 1),
(63, 4, 19, 'modules', 'title', 'Dernières nouvelles', '099afb04ddf259fff6a50c50d7eae060', 'Latest News', '2008-10-20 14:18:17', 62, 1),
(64, 4, 19, 'modules', 'params', 'count=3\nordering=c_dsc\nuser_id=0\nshow_front=1\nsecid=\ncatid=\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 'f129cfd509ca769042e7d7a089cf0a93', 'count=3\r\nordering=m_dsc\r\nuser_id=0\r\nshow_front=1\r\nsecid=\r\ncatid=\r\nmoduleclass_sfx=\r\ncache=1\r\ncache_time=900\r\n\r\n', '2008-10-20 14:18:17', 62, 1),
(65, 4, 25, 'modules', 'title', 'Flash d''information', 'ce73b3f1ddef05e1ab9644fb98ff2de1', 'Newsflash', '2008-10-19 10:16:27', 62, 1),
(66, 4, 25, 'modules', 'params', 'catid=3\nlayout=default\nimage=0\nlink_titles=\nshowLastSeparator=1\nreadmore=0\nitem_title=0\nitems=\nmoduleclass_sfx=\ncache=0\ncache_time=900\n\n', '63b4d9b909ad109f732d374f449a5942', 'catid=3\r\nstyle=random\r\nitems=\r\nmoduleclass_sfx=', '2008-10-19 10:16:27', 62, 1),
(67, 4, 14, 'polls', 'title', 'Ciws est utilisé pour ?', 'fdc8e03efb1bcec2722a1fcda02ed1d1', 'Ciws is used for?', '2008-10-19 10:29:33', 62, 1),
(68, 4, 14, 'polls', 'alias', 'ciws-est-utilise-pour-', '9b1408a418ae92c28820356dc0aa44d8', 'ciws-is-used-for', '2008-10-19 10:29:33', 62, 1),
(69, 4, 4, 'poll_data', 'text', 'Internet', 'c8205c7636e728d448c2774e6a4a944b', 'Internet', '2008-10-19 10:31:53', 62, 1),
(70, 4, 2, 'poll_data', 'text', 'Intranet communautaire', 'd7326061dc773e83b09d00fe2d61708a', 'Community Intranet', '2008-10-19 10:30:22', 62, 1),
(71, 4, 3, 'poll_data', 'text', 'Intranet d''entreprise', '755a0fe1ea04342d343f5f851112141f', 'Enterprise intranet', '2008-10-19 10:30:44', 62, 1),
(72, 4, 1, 'poll_data', 'text', 'Intranet personnel', '19ee1a79f1a37a6fa71a2f463de6fef4', 'Personal Intranet', '2008-10-19 10:31:02', 62, 1),
(73, 4, 5, 'poll_data', 'text', 'Toutes les précédentes options !', 'a6f244cc91700737707cefcd24f806e9', 'All of the Above!', '2008-10-19 10:32:13', 62, 1),
(74, 4, 17, 'poll_data', 'text', 'Toutes les précédentes options !', '3562e862218c1d2d31ff3067f61e5673', 'All of the above !', '2008-10-19 10:35:47', 62, 1),
(75, 4, 14, 'poll_data', 'text', 'Intranet communautaire', 'd7326061dc773e83b09d00fe2d61708a', 'Community Intranet', '2008-10-19 10:35:58', 62, 1),
(76, 4, 15, 'poll_data', 'text', 'Intranet d''entreprise', '53ad387891206abd4cfda547238dc4c3', 'Enterprise Intranet', '2008-10-19 10:36:07', 62, 1),
(77, 4, 16, 'poll_data', 'text', 'Internet', 'c8205c7636e728d448c2774e6a4a944b', 'Internet', '2008-10-19 10:36:17', 62, 1),
(78, 4, 13, 'poll_data', 'text', 'Intranet personnel', '19ee1a79f1a37a6fa71a2f463de6fef4', 'Personal Intranet', '2008-10-19 10:36:28', 62, 1),
(79, 4, 15, 'polls', 'title', 'Ciws est utilisé pour ?', 'fdc8e03efb1bcec2722a1fcda02ed1d1', 'Ciws is used for?', '2008-10-19 10:40:50', 62, 1),
(80, 4, 15, 'polls', 'alias', 'ciws-est-utilise-pour-', '9b1408a418ae92c28820356dc0aa44d8', 'ciws-is-used-for', '2008-10-19 10:40:50', 62, 1),
(81, 4, 46, 'content', 'title', 'Téléchargement', '801ab24683a4a8c433c6eb40c48bcd9d', 'Download', '2008-10-19 10:53:45', 62, 1),
(82, 4, 46, 'content', 'alias', 'telechargement', 'fd456406745d816a45cae554c788e754', 'download', '2008-10-19 10:53:45', 62, 1),
(83, 4, 46, 'content', 'introtext', 'Voic la zone de téléchargement!', '2932456ca32d1401820623deb5b49b04', 'Here''s the download area!', '2008-10-19 10:53:45', 62, 1),
(84, 4, 46, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-19 10:53:45', 62, 1),
(85, 4, 53, 'menu', 'name', 'Téléchargement', '801ab24683a4a8c433c6eb40c48bcd9d', 'Download', '2008-10-19 10:54:15', 62, 1),
(86, 4, 53, 'menu', 'alias', 'telechargement', 'fd456406745d816a45cae554c788e754', 'download', '2008-10-19 10:54:15', 62, 1),
(87, 4, 53, 'menu', 'params', 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\n\n', '5abdcb8e4a1b658293691263ef4674d4', 'show_noauth=\r\nshow_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_item_navigation=\r\nshow_readmore=\r\nshow_vote=\r\nshow_icons=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nshow_hits=\r\nfeed_summary=\r\npage_title=\r\nshow_page_title=1\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\n\r\n', '2008-10-19 10:54:15', 62, 1),
(88, 4, 53, 'menu', 'link', 'index.php?option=com_content&view=article&id=46', '970a96db3d931bca4f600b60f52162a9', 'index.php?option=com_content&view=article&id=46', '2008-10-19 10:54:15', 62, 1),
(89, 4, 4, 'content', 'title', 'Ciws 0.5.2 est sortie', '3b0c25634a2accfd36cc0105f4af1f37', 'Ciws 0.5.2 released', '2008-10-20 13:48:41', 62, 1),
(90, 4, 4, 'content', 'alias', 'ciws-052-est-sortie', '4057528cbc0617864f4ab0e83f0bc0d6', 'newsflash-3', '2008-10-20 13:48:41', 62, 1),
(91, 4, 4, 'content', 'introtext', 'La version 0.5.2 de Cooperation-iws est sortie ! Allez voir les nouveautés sur <a href="http://cooperation-iws.gensys-net.eu">http://cooperation-iws.gensys-net.eu</a>.', '0ec74b54f05febf0831e01976ef1ee02', 'Cooperation-iws 0.5.2 released ! Check the new features on <a href="http://cooperation-iws.gensys-net.eu">http://cooperation-iws.gensys-net.eu</a>.', '2008-10-20 13:48:41', 62, 1),
(92, 4, 4, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-20 13:48:41', 62, 1),
(93, 4, 19, 'content', 'title', 'Aperçu de Ciws', '9292297cdbbba90ecec37a4731c10f4a', 'Ciws Overview', '2008-10-20 13:56:48', 62, 1),
(94, 4, 19, 'content', 'alias', 'apercu-de-ciws', '9501ac1f39452dcb3b0280ede017e871', 'ciws-overview', '2008-10-20 13:56:48', 62, 1),
(95, 4, 19, 'content', 'introtext', '<h3> Cooperation IWS est un projet de <strong>serveur web intranet nomade</strong>:  </h3> <ol><li class="level1"><div class="li"> Un <strong>serveur web</strong>, pour proposer des services d’hébergement de sites web (Blog - Traitement de texte, Wiki, Gestion électronique de documents, Forum, galleries d’images - retouche d’images , portail eLearning, …) destinés au travail collaboratif ou à l’ingénierie de la connaissance.</div> </li><li class="level1"><div class="li"> <strong>Intranet</strong>, pour disposer de ces services où l’on veut: chez soi, dans un cadre associatif ou un cadre professionnel, sans forcément publier le contenu sur le World Wide Web.</div> </li><li class="level1"><div class="li"> <strong>Nomade</strong>, pour emmener ces services avec soi sur une clef usb, un disque dur usb ou un cdrom / dvdrom.</div> </li></ol><h3><a name="cooperation-iws_est_libre" title="cooperation-iws_est_libre"></a>Cooperation-iws est libre</h3>   <p>  Cooperation-iws est <strong>gratuit</strong> et basé sur des logiciels <strong>open-source</strong> tels que Ubuntu ou Debian Linux. </p><h3><a name="audience" title="audience"></a></h3><h3><a name="publics_vises" title="publics_vises"></a>Publics visés</h3><p>Les serveurs Cooperation-iws sont disponibles en plusieurs versions:</p><h4>Les versions des Serveurs Ciws: <br /></h4> <div class="level2"> <ol><li class="level1"><strong>Ciws Groupware server</strong>: Une version Groupware, pour les petites entreprises ou les associations;</li><li class="level1"><strong>Ciws eLearning server</strong>: Une version eLearning pour les formateurs professionnels ou les institutions;</li><li class="level1"><strong>Ciws CMS server</strong>: Un serveur de gestion de contenu pour la publication ou la communication.</li><li class="level1"><strong>Ciws Social Writer server</strong>: Un serveur de contenu Web 2.0 et réseaux sociaux pour les rédacteurs.</li><li class="level1"><strong>Ciws Development server</strong>: Un serveur dédié au développement pour les équipes de conception.</li><li class="level1"><strong>Ciws Personal server</strong>: Un serveur Intranet Personnel pour les familles.</li></ol><h4>Les versions des Clients Ciws:</h4><ol><li class="level1"><strong>Ciws Client</strong>: Un client générique pour accéder au Serveur Ciws.</li><li class="level1"><strong>Ciws light Client</strong>: Un client générique léger pour accéder au serveur Ciws sur des terminaux à bas coût.</li></ol>  </div><p>&nbsp;</p><p>&nbsp;</p>', '9c25d68fd0524095c305d2005cc12d70', '<h3>Cooperation-iws is an Intranet Nomad Web Server project:</h3> <ol><li> A <strong>web</strong> <strong>server</strong>, to provide hosting services of web applications (Blog - words processor, Wiki, Forum, Electronic Documents Management, Pictures galleries - Pictures manipulation, eLearning portal, …) for collaborative work that contributes to knowledge management and/or knowledge engineering.</li><li><strong> Intranet</strong>, to provide these services where you want: at home, at association meetings, at professional meetings without requiring an internet connection or without the volonty to publish personnal items on the web .</li><li><strong> Nomad</strong>, to bring these services with you, on a cd/dvd, usb key, or usb hard drive.</li></ol><h3><a name="cooperation-iws_is_free" title="cooperation-iws_is_free"></a>Cooperation-iws is free</h3>   <p>  Cooperation-iws is <strong>free</strong> and is based on <strong>open-source</strong> softwares like Ubuntu or Debian Linux. </p><h3><a name="audience" title="audience"></a>Audience</h3><p>Cooperation-iws servers are available in several flavours. </p><h4>Ciws Servers flavours: <br /></h4> <div class="level2"> <ol><li class="level1"><strong>Ciws Groupware server</strong>: A groupware flavour, for small business or small associations;</li><li class="level1"><strong>Ciws eLearning server</strong>: An eLearning flavour for professional teacher or institutions teacher;</li><li class="level1"><strong>Ciws CMS server</strong>: A Content Management System server for publishing and communication.</li><li class="level1"><strong>Ciws Social Writer server</strong>: A Social and Internet 2.0 content management server for writers.</li><li class="level1"><strong>Ciws Development server</strong>: A development Server for design teams.</li><li class="level1"><strong>Ciws Personal server</strong>: A Personal intranet Server for families.</li></ol><h4>Ciws Clients flavours:</h4><ol><li class="level1"><strong>Ciws Client</strong>: A generic Client to access the Ciws Servers.</li><li class="level1"><strong>Ciws light Client</strong>: A generic Client to access Ciws Servers from low end terminals.</li></ol>  </div><p> </p><p> </p>', '2008-10-20 13:56:48', 62, 1),
(96, 4, 19, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-20 13:56:48', 62, 1),
(97, 4, 47, 'content', 'title', 'Questions générales sur Ciws', '364ac540f7dbba3cfbae4790f9a76a43', 'General questions about Ciws', '2008-10-20 14:00:13', 62, 1),
(98, 4, 47, 'content', 'alias', 'questions-generales-sur-ciws', 'ed41b04b9e4b12fceeb8ee07c86280a6', 'general-questions-about-ciws', '2008-10-20 14:00:13', 62, 1),
(99, 4, 47, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-20 14:00:13', 62, 1),
(100, 4, 47, 'content', 'introtext', '<h4><a name="qu_est_ce_qu_un_live_cd_ou_live_usb"></a>Qu''est ce qu''un Live CD ou Live USB ?</h4> <div class="level4"> Un Live CD est un système d''exploitation contenu sur un CDROM qui a la faculté de fonctionner sans rien installer sur la machine d''exécution. La technologie Live CD permet de booter directement à partir d''un CD en décompressant le système de fichiers dans la mémoire vive (la RAM). Ainsi les Live CD sont souvent utilisés pour tester des systèmes d''exploitation, car il n''y aucune manipulation, ni configuration à faire pour avoir un système opérationnel. L''inconvénient du Live CD est qu''il ne conserve pas les changements effectués lors des sessions d''utilisation. Un Live USB est un système d''exploitation contenu sur un périphérique de stockage USB (Clef ou disque dur), la technologie est la même que pour le Live CD, mis à part qu''il est possible de sauvegarder les changements grâce à un mode de fonctionnement “persistent”. C''est la technologie retenue pour utiliser Cooperation IWS. </div>  <h4><a name="les_modifications_que_j_effectue_sur_mon_serveur_cooperation-iws_vont-elles_etre_sauvegardees"></a>Les modifications que j''effectue sur mon serveur Cooperation-iws vont-elles être sauvegardées ?</h4> <div class="level4">  Si vous utilisez un Live CD, aucun changement n''est sauvegardé. C''est un mode lecture seule. <p>Si vous utilisez un Live USB les modifications effectuées sur les données de l''environnement lampp (le serveur d''applications web) situé dans /var ainsi que certains fichiers de configuration spécifiques seront sauvegardés. Ainsi votre environnemment de travail intranet est sauvegardé dans le temps. Toutes les modifications en dehors de votre environnement lampp seront perdues après chaque redémarrage. Les données critiques de l''environnement lampp sont sauvegardées au moyen de la persistence de la technologie live Ubuntu. En l''occurence, sur Cooperation IWS, la persistence est sur la partition /media/ciws-rw. Si vous voulez modifier des fichiers sur le coeur de votre Cooperation IWS (e.g apt-get install une application), vous devez le faire pendant la phase de création du Live CD. </p>  <p>Ainsi seule les données dignes d''intérêt sont sauvegardées et toute modification malencontreuse ou malfaisante du système hôte disparait après chaque redémarrage. </p>  </div>', 'b333677b91a1b6da47829eb490c79592', '<h4><a name="what_s_live_cd_or_live_usb" title="what_s_live_cd_or_live_usb"></a>What''s Live CD or Live USB ?</h4> <div class="level4"> A Live CD is an operating system contained on a CD-ROM that has the ability to operate without installing anything on the machine of execution. The technology allows Live CD to boot directly from a CD while decompressing in the memory (RAM) the files system . So the Live CD is often used to test operating systems, because there is no manipulation, no configuration to be done to have an operational system. The drawback of the Live CD is that it does not retain the changes made during the sessions of use. A Live USB is an operating system contained on a USB storage device (Key or HDD), the technology is the same as for the Live CD, apart that it is possible to save the changes through a persistent mode . This is the solution retained for Cooperation IWS. </div>  <h4><a name="the_changes_made_on_my_cooperation-iws_server_will_be_saved" title="the_changes_made_on_my_cooperation-iws_server_will_be_saved"></a>The changes made on my Cooperation-iws server will be saved ?</h4> <div class="level4">  If your are using a Live CD no changes are saved, it is a read only mode. <p>If you are using a Live USB, the change to the lampp environment (the web applications server) data located in /var/ as well as some specific configuration files will be saved. So your intranet working environment is saved through time. Any changes outside this specific data will be lost after every reboot. The var directory is saved with the USB live persistence technology. In this case, on Cooperation IWS, the persistence is on the partition /media/ciws-rw. If you want to modify core files (e-g apt-get install some application) in your Cooperation IWS, you need to do it during the customization of your installation. </p>  <p> The interest is that only changes of interest are saved and changes that could arm the core of your server are not saved. So you just need a reboot and you get again your environment, provided there was no modification on the lampp critical data situated on the /var partition. </p>  </div>', '2008-10-20 14:00:13', 62, 1),
(101, 4, 49, 'content', 'title', 'Comment booter sur un Live CD ou un Live Usb ?', '40ccc221d5afd880583d69058425ad87', 'How do I boot from Live CD or Live Usb?', '2008-10-20 14:00:55', 62, 1),
(102, 4, 49, 'content', 'alias', 'comment-booter-sur-un-live-cd-ou-un-live-usb-', 'b04f484180924892bbf209f9585dd6a8', 'how-do-i-boot-from-live-cd-or-live-usb', '2008-10-20 14:00:55', 62, 1),
(103, 4, 49, 'content', 'introtext', '<h4><a name="comment_booter_sur_un_live_cd_cooperation-iws"></a>Comment booter sur un  Live CD Cooperation-iws</h4> <div class="level4">  <p> Dans la plupart des PC, vous avez seulement besoin d''insérer le Live CD dans le lecteur de votre machine, puis de redémarrer. Si rien ne ce passe et que vous vous retrouvez dans votre environnement de travail habituel, cela signifie que le bios de votre machine n''est pas configuré pour booter en premier sur le lecteur de Cdrom.<br />Pour configurer votre bios, vous devrez presser un touche particulière au démarrage tel qu''indiqué sur votre écran. Ensuite vous devrez naviguer dans les menus avec votre clavier et choisir de démarrer / booter en premier sur votre lecteur de Cdrom. </p>  </div>  <h4><a name="comment_booter_sur_un_live_usb_cooperation-iws"></a>Comment booter sur un  Live USB Cooperation-iws</h4> <div class="level4">  <p> Généralement vous devrez indiquer à votre bios de booter en premier sur votre périphérique USB (clef ou disque dur).<br />Pour configurer votre bios, vous devrez presser un touche particulière au démarrage tel qu''indiqué sur votre écran. Ensuite vous devrez naviguer dans les menus avec votre clavier et choisir de démarrer / booter en premier sur votre périphérique USB. </p>  </div>', '9c2a168a8a53582f0398f8a32f9cec53', '<h4><a name="how_to_boot_from_cooperation-iws_live_cd"></a>How do I boot from Cooperation-iws Live CD</h4> <div class="level4">  <p> In most PC, you just have to insert the Live CD in your Computer tray and then reboot. If nothing happens and you stay in your normal environment, it means that your bios is not configure to boot first on Cdrom device. <br />To configure your bios, you need to press a specific key which is indicated on the screen at the start of your computer. You need then to naviguate in menu and choose to boot first on the CDROM device. </p>  </div>  <h4><a name="how_to_boot_from_cooperation-iws_live_usb"></a>How do I boot from Cooperation-iws Live USB</h4> <div class="level4">  <p> Generally you will have to tell your bios to boot first from the Live USB device (key or hard drive). <br />To configure your bios, you need to press a specific key which is indicated on the screen at the start of your computer. You need then to naviguate in menu and choose to boot first on your USB device. </p>  </div>', '2008-10-20 14:00:55', 62, 1),
(104, 4, 49, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-20 14:00:55', 62, 1),
(105, 4, 48, 'content', 'title', 'Quels sont les login / mots de passe par défaut  ?', '56062b371a694ecfa9f96eb8aeb02c45', 'What are the default logins / passwords ?', '2008-10-20 14:02:30', 62, 1),
(106, 4, 48, 'content', 'alias', 'quels-sont-les-login--mots-de-passe-par-defaut-', 'b52e1bc0fe062ea82b1138b601c65597', 'what-are-the-default-logins-passwords-', '2008-10-20 14:02:30', 62, 1),
(107, 4, 48, 'content', 'introtext', 'Les logins / mots de passe par défaut sont contenus dans un fichier texte nommé PASWWORD.txt sur le bureau de votre serveur Ciws.', '0309021e5a21746929fca5486736564c', 'Default login / passwords are stored on a text file called PASSWORDS.txt on the Desktop of the Ciws server.', '2008-10-20 14:02:30', 62, 1),
(108, 4, 48, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-20 14:02:30', 62, 1),
(109, 4, 25, 'content', 'title', 'Quels sont les pré-requis pour faire fonctionner un serveur', '36b2cc7f69e5d83d776a9041943bfe74', 'What are the requirements to run a Ciws server', '2008-10-20 14:05:59', 62, 1),
(110, 4, 25, 'content', 'alias', 'quels-sont-les-pre-requis-pour-faire-fonctionner-un-serveur', '89b3ff880a31c9160e53dc7851be6a5a', 'what-are-the-requirements-to-run-ciws-052', '2008-10-20 14:05:59', 62, 1),
(111, 4, 25, 'content', 'introtext', '<div class="level2">  <p> En fait, cela dépend de votre serveur Cooperation-iws. </p>  <p> Dans tous les cas vous avez besoin d''un processeur compatible Intel (i486 or later), d''un lecteur de CD/DVD bootable ou d''une carte mère supportant le boot USB. </p>  <p> Pour booter le Live CD, il faut 1Go de RAM. </p>  <p> Pour booter le Live DVD , il faut 1,5Go de RAM. </p>  <p> Pour booter un live USB, il faut 1Go de RAM. </p>  <p>&nbsp;</p>  </div>', '94aac486413bc408b8cd23835abff06d', '<div class="level2">  <p> In fact it depends of the contents of your Ciws server. </p>  <p> In every case you need a Intel-compatible CPU (i486 or later), bootable CD-ROM drive or Usb bootable motherboard. </p>  <p> To boot the demo Live CD, you need at least 1Gb RAM. </p>  <p> To boot the demo Live DVD, you need at least 1,5Gb RAM. </p>  <p> To boot demo USB, you need at least 1Gb RAM. </p>  <p>  But if you make your custom Cooperation-iws and if you only choose small applications (like blog <acronym title="Content Management System">CMS</acronym>), you might boot USB with 256Mb RAM.</p>  </div>  <h2><a name="where_can_i_get_cooperation-iws_cd_dvd" title="where_can_i_get_cooperation-iws_cd_dvd"></a></h2><a href="http://forum.joomla.org" title="The Joomla! Community Forums"></a>', '2008-10-20 14:05:59', 62, 1),
(112, 4, 25, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-20 14:05:59', 62, 1),
(113, 4, 22, 'content', 'title', 'Quoi de neuf dabs la 0.5.2 ?', '1aabace19ae0eedb181c9c7357972830', 'What', '2008-10-20 14:09:17', 62, 1),
(114, 4, 22, 'content', 'alias', 'quoi-de-neuf-dabs-la-052-', 'e27952d7ad270e26790ffed9b47b1860', 'whats-new-in-052', '2008-10-20 14:09:17', 62, 1);
INSERT INTO `jos_jf_content` (`id`, `language_id`, `reference_id`, `reference_table`, `reference_field`, `value`, `original_value`, `original_text`, `modified`, `modified_by`, `published`) VALUES
(115, 4, 22, 'content', 'introtext', 'La version 0.5.2 améliore de nombreux aspects des serveurs Ciws:<br /><p style="margin-bottom: 0in">Dans la 0.5.2 vous remarquerez:</p>    <ul><li>Un nouveau frontend pour les serveurs Ciws. </li><li><p style="margin-bottom: 0in">Ciws est désormais disponible en plusieurs versions: Ciws server et Ciws Client.</p>   </li><li>     <p style="margin-bottom: 0in"> Un nouveau portail de gestion de contenu pour http://cooperation-iws.gensys-net.eu.</p>   </li></ul>', 'c4dd19d5516149a34af82fde4f45ee34', 'The 0.5.2 release of Cooperation-iws improved many aspects of the servers: <br /><p style="margin-bottom: 0in">In Ciws 0.5.2, you''ll notice: </p>    <ul><li>New unified front-end to your Ciws Server. </li><li><p style="margin-bottom: 0in">Ciws comes now in different flavour: Ciws servers and Ciws client </p>   </li><li>     <p style="margin-bottom: 0in"> Cooperation-iws.gensys-net.eu new Content Management System aimed at spreading Ciws philosophy.</p>   </li></ul>', '2008-10-20 14:09:17', 62, 1),
(116, 4, 22, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-20 14:09:17', 62, 1),
(117, 4, 28, 'content', 'title', 'Comment installer un serveur Ciws ?', '5372eb06a63aa4698b995d829dd0bc5a', 'How do I install a Ciws server?', '2008-10-20 14:13:05', 62, 1),
(118, 4, 28, 'content', 'alias', 'comment-installer-un-serveur-ciws-', 'b7914ade8c917c55e44874a775c52e2e', 'how-do-i-install-ciws-server', '2008-10-20 14:13:05', 62, 1),
(119, 4, 28, 'content', 'introtext', '<p>Installer un serveur Ciws 0.5.2 est très facile:</p><p>Vous devez télécharger l''image iso de votre version de serveur Ciws, la graver et la booter. Pour l''installer sur un média Usb, cliquer sur l''installer live usb présent sur le bureau. Vous devriez aboutir à l''écran suivant:</p><p>&nbsp;</p><div style="text-align: center"><img src="http://cooperation-iws.gensys-net.eu/wiki/lib/exe/fetch.php?w=&h=&cache=cache&media=screenshots:en:capture-live-usb.png" border="0" width="514" height="450" /></div><p>&nbsp;</p><p> Choisisez votre média USB dans la boîte de dialogue, cliquer sur l''icône de droite éventuellement pour la détecter si elle ne l''est pas.</p><p>Choisissez le type de partition dot vous avez besoin et cliquez sur éxécuter ! </p><p>C''est tout !  </p>', '59724b7887fb6d9211c74987acb29eb1', '<p>Installing of Ciws server 0.5.2 is pretty easy. <br /><br />Download the iso image of a ciws server flavour, burn it and boot it.To install on Usb device, click on the Live Usb installer icon on the desktop.</p><p>You should get the following screen: </p><p> </p><div style="text-align: center"><img src="http://cooperation-iws.gensys-net.eu/wiki/lib/exe/fetch.php?w=&h=&cache=cache&media=screenshots:en:capture-live-usb.png" border="0" width="514" height="450" /></div><p> </p><p> </p><p>Choose your usb device in the target device field, click on the right icon to detect it if not detected.</p><p>Choose  what kind of persistent partition you need (ciws-rw for server) and click on execute !</p><p> That''s it. </p>', '2008-10-20 14:13:05', 62, 1),
(120, 4, 28, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-20 14:13:05', 62, 1),
(121, 4, 34, 'menu', 'name', 'Qoui de neuf dans la 0.5.2 ?', '6a4dae28fe708d9bb85cf4c61c5df352', 'What', '2008-10-20 14:14:42', 62, 0),
(122, 4, 34, 'menu', 'alias', 'qoui-de-neuf-dans-la-052-', 'ae4768beaa5390cf159f500372414de2', 'what-is-new-in-0-5-2', '2008-10-20 14:14:42', 62, 0),
(123, 4, 34, 'menu', 'params', 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\n\n', '7ea1cf91474f5e3036dd77c274f296ac', 'show_noauth=0\r\nshow_title=1\r\nlink_titles=0\r\nshow_intro=1\r\nshow_section=0\r\nlink_section=0\r\nshow_category=0\r\nlink_category=0\r\nshow_author=1\r\nshow_create_date=1\r\nshow_modify_date=1\r\nshow_item_navigation=0\r\nshow_readmore=1\r\nshow_vote=0\r\nshow_icons=1\r\nshow_pdf_icon=1\r\nshow_print_icon=1\r\nshow_email_icon=1\r\nshow_hits=1\r\nfeed_summary=\r\npage_title=\r\nshow_page_title=1\r\npageclass_sfx=\r\nmenu_image=-1\r\nsecure=0\r\n\r\n', '2008-10-20 14:14:42', 62, 0),
(124, 4, 34, 'menu', 'link', 'index.php?option=com_content&view=article&id=22', 'd6a57ac3e71e5d5f12a64133b1d8fb5e', 'index.php?option=com_content&view=article&id=22', '2008-10-20 14:14:42', 62, 0),
(125, 4, 1, 'content', 'introtext', '<h3>Cooperation IWS est un projet de serveur web intranet nomade:</h3> <ol><li> Un <strong>serveur web</strong>, pour proposer des services d’hébergement de sites web (Blog - Traitement de texte, Wiki, Gestion électronique de documents, Forum, galleries d’images - retouche d’images , portail eLearning, …) destinés au travail collaboratif ou à l’ingénierie de la connaissance.</li><li><strong> Intranet</strong>, pour disposer de ces services où l’on veut: chez soi, dans un cadre associatif ou un cadre professionnel, sans forcément publier le contenu sur le World Wide Web.</li><li><strong> Nomade</strong>, pour emmener ces services avec soi sur une clef usb, un disque dur usb ou un cdrom / dvdrom.</li></ol> <h3><strong>Cooperation-iws est distribué gratuitement sous licence open source.</strong></h3><p>&lt;?php </p><p>$xml_file="cooperation-wui-fr.xml"; </p><p>$tree = simplexml_load_file(''../''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree-&gt;item as $item) {    <br />                            $array_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);<br />                            $array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);<br />                            $array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);<br />                            $array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);<br />                            $array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_xml as $key =&gt; $row) {<br />                            $category[$key]  = $row[''0''];<br />                            $item_name[$key] = $row[''1''];<br />                            $item_desc[$key] = $row[''2''];<br />                            $item_url[$key] = $row[''3''];<br />                            $item_admin_url[$key] = $row[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($category, SORT_ASC, $item_name, SORT_ASC, $array_xml);<br /><br />?&gt;</p><h1>Applications</h1><p>&lt;?php<br /><br />                       $prev_category = "";<br />                        for($count_boucle=0; $count_boucle &lt;= $count_xml_elt ; $count_boucle++) {<br />                            $category= $array_xml[$count_boucle][0];<br />                            if ("$prev_category" != "$category"){<br />                                echo "&lt;hr&gt;&lt;br&gt;\\n&lt;h3&gt;&lt;a name=\\"".$count_boucle."\\"&gt;&lt;/a&gt;".$category."&lt;/h3&gt;&lt;br&gt;\\n";<br />                            }<br />                            $prev_category = $category;<br />                            $name = $array_xml[$count_boucle][1];<br />                            $desc = $array_xml[$count_boucle][2];<br />                            $url = $array_xml[$count_boucle][3];<br />                            $admin_url =$array_xml[$count_boucle][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\\n";<br />                           echo $desc."&lt;br&gt;&lt;br&gt;\\n";<br />                             echo "&lt;a href=\\"".$url."\\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\\"".$admin_url."\\"&gt;admin&lt;/a&gt;\\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt; <br />&lt;?php $tree_admin = simplexml_load_file(''../admin/''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree_admin-&gt;item as $item) {    <br />                            $array_admin_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_admin_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_admin_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_admin_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_admin_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_admin_xml[$count_xml_elt][0] = strval($array_admin_xml[$count_xml_elt][0]);<br />                            $array_admin_xml[$count_xml_elt][1] = strval($array_admin_xml[$count_xml_elt][1]);<br />                            $array_admin_xml[$count_xml_elt][2] = strval($array_admin_xml[$count_xml_elt][2]);<br />                            $array_admin_xml[$count_xml_elt][3] = strval($array_admin_xml[$count_xml_elt][3]);<br />                            $array_admin_xml[$count_xml_elt][4] = strval($array_admin_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_admin_xml as $key_admin =&gt; $row_admin) {<br />                            $item_admin_category[$key_admin]  = $row_admin[''0''];<br />                            $item_admin_name[$key_admin] = $row_admin[''1''];<br />                            $item_admin_desc[$key_admin] = $row_admin[''2''];<br />                            $item_url[$key_admin] = $row_admin[''3''];<br />                            $item_admin_admin_url[$key_admin] = $row_admin[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($item_admin_category, SORT_ASC, $item_admin_name, SORT_ASC, $array_admin_xml);<br /><br />?&gt;</p><h1>Administration</h1><p>&nbsp;</p><p>&lt;?php<br /><br />                       $prev_admin_category = "";</p><p>&nbsp;</p><p>                        for($count_boucle_admin=0; $count_boucle_admin &lt;= $count_xml_elt ; $count_boucle_admin++) {<br />                            $category_admin= $array_admin_xml[$count_boucle_admin][0];<br />                            if ("$prev_admin_category" != "$category_admin"){<br />                                echo "&lt;hr&gt;&lt;br&gt;\\n&lt;h3&gt;&lt;a name=\\"admin_".$count_boucle_admin."\\"&gt;&lt;/a&gt;".$category_admin."&lt;/h3&gt;&lt;br&gt;\\n";<br />                            }<br />                            $prev_admin_category = $category_admin;<br />                            $name = $array_admin_xml[$count_boucle_admin][1];<br />                            $desc = $array_admin_xml[$count_boucle_admin][2];<br />                            $url = $array_admin_xml[$count_boucle_admin][3];<br />                            $admin_url =$array_admin_xml[$count_boucle_admin][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\\n";<br />                            echo $desc."&lt;br&gt;&lt;br&gt;\\n";<br />                            echo "&lt;a href=\\"".$url."\\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\\"".$admin_url."\\"&gt;admin&lt;/a&gt;\\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt;         </p>', '1e292d3cbf222f124970378d008211f0', '<h3>Cooperation-iws is an Intranet Nomad Web Server project:</h3> <ol><li> A <strong>web</strong> <strong>server</strong>, to provide hosting services of web applications (Blog - words processor, Wiki, Forum, Electronic Documents Management, Pictures galleries - Pictures manipulation, eLearning portal, …) for collaborative work that contributes to knowledge management and/or knowledge engineering.</li><li><strong> Intranet</strong>, to provide these services where you want: at home, at association meetings, at professional meetings without requiring an internet connection or without the volonty to publish personnal items on the web .</li><li><strong> Nomad</strong>, to bring these services with you, on a cd/dvd, usb key, or usb hard drive.</li></ol><br /><h3>Cooperation-iws is distributed for free and under open source licence.</h3><p><?php </p><p>$xml_file="cooperation-wui.xml"; </p><p>$tree = simplexml_load_file(''../''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree->item as $item) {    <br />                            $array_xml[$count_xml_elt][0] = $item->item_category;<br />                            $array_xml[$count_xml_elt][1] = $item->item_name;<br />                            $array_xml[$count_xml_elt][2] = $item->item_desc;<br />                            $array_xml[$count_xml_elt][3] = $item->item_url;<br />                            $array_xml[$count_xml_elt][4] = $item->item_admin_url;<br />                            $array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);<br />                            $array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);<br />                            $array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);<br />                            $array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);<br />                            $array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_xml as $key => $row) {<br />                            $category[$key]  = $row[''0''];<br />                            $item_name[$key] = $row[''1''];<br />                            $item_desc[$key] = $row[''2''];<br />                            $item_url[$key] = $row[''3''];<br />                            $item_admin_url[$key] = $row[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($category, SORT_ASC, $item_name, SORT_ASC, $array_xml);<br /><br />?></p><h1>Applications</h1><p><?php<br /><br />                       $prev_category = "";<br />                        for($count_boucle=0; $count_boucle <= $count_xml_elt ; $count_boucle++) {<br />                            $category= $array_xml[$count_boucle][0];<br />                            if ("$prev_category" != "$category"){<br />                                echo "<br>\\n<h3><a name=\\"".$count_boucle."\\"></a>".$category."</h3><hr><br>\\n";<br />                            }<br />                            $prev_category = $category;<br />                            $name = $array_xml[$count_boucle][1];<br />                            $desc = $array_xml[$count_boucle][2];<br />                            $url = $array_xml[$count_boucle][3];<br />                            $admin_url =$array_xml[$count_boucle][4];<br />                            $url = str_replace (''localhost'', $HTTP_SERVER_VARS["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $HTTP_SERVER_VARS["SERVER_NAME"], $admin_url);<br /><br />                            echo "<b>".$name."</b><br>\\n";<br />                            echo $desc."<br><br>\\n";<br />                            echo "<a href=\\"".$url."\\">".$url."</a>";<br />                            if ($admin_url) {<br />                                echo " | <a href=\\"".$admin_url."\\">admin</a>\\n";<br />                            }<br />                            echo "<br><br><br>\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?> <br /><?php $tree_admin = simplexml_load_file(''../admin/''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree_admin->item as $item) {    <br />                            $array_admin_xml[$count_xml_elt][0] = $item->item_category;<br />                            $array_admin_xml[$count_xml_elt][1] = $item->item_name;<br />                            $array_admin_xml[$count_xml_elt][2] = $item->item_desc;<br />                            $array_admin_xml[$count_xml_elt][3] = $item->item_url;<br />                            $array_admin_xml[$count_xml_elt][4] = $item->item_admin_url;<br />                            $array_admin_xml[$count_xml_elt][0] = strval($array_admin_xml[$count_xml_elt][0]);<br />                            $array_admin_xml[$count_xml_elt][1] = strval($array_admin_xml[$count_xml_elt][1]);<br />                            $array_admin_xml[$count_xml_elt][2] = strval($array_admin_xml[$count_xml_elt][2]);<br />                            $array_admin_xml[$count_xml_elt][3] = strval($array_admin_xml[$count_xml_elt][3]);<br />                            $array_admin_xml[$count_xml_elt][4] = strval($array_admin_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_admin_xml as $key_admin => $row_admin) {<br />                            $item_admin_category[$key_admin]  = $row_admin[''0''];<br />                            $item_admin_name[$key_admin] = $row_admin[''1''];<br />                            $item_admin_desc[$key_admin] = $row_admin[''2''];<br />                            $item_url[$key_admin] = $row_admin[''3''];<br />                            $item_admin_admin_url[$key_admin] = $row_admin[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($item_admin_category, SORT_ASC, $item_admin_name, SORT_ASC, $array_admin_xml);<br /><br />?></p><h1>Administration</h1><p> </p><p><?php<br /><br />                       $prev_admin_category = "";</p><p> </p><p>                        for($count_boucle_admin=0; $count_boucle_admin <= $count_xml_elt ; $count_boucle_admin++) {<br />                            $category_admin= $array_admin_xml[$count_boucle_admin][0];<br />                            if ("$prev_admin_category" != "$category_admin"){<br />                                echo "<br>\\n<h3><a name=\\"admin_".$count_boucle_admin."\\"></a>".$category_admin."</h3><hr><br>\\n";<br />                            }<br />                            $prev_admin_category = $category_admin;<br />                            $name = $array_admin_xml[$count_boucle_admin][1];<br />                            $desc = $array_admin_xml[$count_boucle_admin][2];<br />                            $url = $array_admin_xml[$count_boucle_admin][3];<br />                            $admin_url =$array_admin_xml[$count_boucle_admin][4];<br />                            $url = str_replace (''localhost'', $HTTP_SERVER_VARS["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $HTTP_SERVER_VARS["SERVER_NAME"], $admin_url);<br /><br />                            echo "<b>".$name."</b><br>\\n";<br />                            echo $desc."<br>\\n";<br />                            echo "<a href=\\"".$url."\\">".$url."</a>";<br />                            if ($admin_url) {<br />                                echo " | <a href=\\"".$admin_url."\\">admin</a>\\n";<br />                            }<br />                            echo "<br><br><br>\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?>         </p>', '2008-10-25 08:13:08', 62, 1),
(126, 4, 1, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-10-25 08:13:08', 62, 1),
(127, 4, 42, 'modules', 'title', 'Sélection de la langue', 'a17b1b297ea6a1313e39a863f721b220', 'Language Selection', '2008-11-30 11:18:15', 62, 1),
(128, 4, 42, 'modules', 'params', 'type=dropdown\nshow_active=1\ninc_jf_css=1\nmoduleclass_sfx=\ncache_href=0\n\n', '476884607595365ab04da844c49b4a2b', 'type=dropdown\r\nshow_active=1\r\ninc_jf_css=1\r\nmoduleclass_sfx=\r\ncache_href=0\r\n\r\n', '2008-11-30 11:18:15', 62, 1),
(129, 4, 46, 'modules', 'title', 'Liste des applications', 'd70fc022d09a33f4044c81cd670a71b6', 'Applications list', '2008-10-20 15:57:53', 62, 1),
(130, 4, 46, 'modules', 'params', 'xml_file=0\n\n', 'd41d8cd98f00b204e9800998ecf8427e', '', '2008-10-20 15:57:53', 62, 1),
(131, 4, 48, 'modules', 'params', 'xml_file=cooperation-wui-fr.xml\n\n', '3950af8c794a263686850dd58f5761bd', 'xml_file=cooperation-wui.xml\r\n\r\n', '2008-10-20 20:05:21', 62, 1),
(132, 4, 49, 'modules', 'params', 'moduleclass_sfx=\nwidth=20\ntext=\nbutton=\nbutton_pos=right\nimagebutton=\nbutton_text=\nres_lang=fr-language\ncache=1\ncache_time=900\n\n', '473af5203a5c45d0aca35ce6fd4b3323', 'moduleclass_sfx=\r\nwidth=20\r\ntext=\r\nbutton=\r\nbutton_pos=right\r\nimagebutton=\r\nbutton_text=\r\nres_lang=en-language\r\ncache=1\r\ncache_time=900\r\n\r\n', '2008-10-20 16:54:00', 62, 0),
(133, 4, 49, 'modules', 'title', 'Recherche', '13348442cc6a27032d2b4aa28b75a5d3', 'Search', '2008-10-20 16:54:00', 62, 0),
(134, 4, 50, 'modules', 'params', 'moduleclass_sfx=\nwidth=20\ntext=\nbutton=\nbutton_pos=right\nimagebutton=\nbutton_text=\nres_lang=fr-language\ncache=1\ncache_time=900\n\n', '473af5203a5c45d0aca35ce6fd4b3323', 'moduleclass_sfx=\r\nwidth=20\r\ntext=\r\nbutton=\r\nbutton_pos=right\r\nimagebutton=\r\nbutton_text=\r\nres_lang=en-language\r\ncache=1\r\ncache_time=900\r\n\r\n', '2008-10-20 17:02:41', 62, 1),
(135, 4, 48, 'modules', 'title', 'Liste des applications', 'd70fc022d09a33f4044c81cd670a71b6', 'Applications list', '2008-10-20 20:05:21', 62, 1),
(136, 4, 1, 'content', 'title', 'Bienvenue sur Cooperation-iws', 'c2b7a15611c9b282067d53aee7f2a53e', 'Welcome to Cooperation-iws', '2008-10-25 08:13:08', 62, 1),
(137, 4, 1, 'content', 'alias', 'bienvenue-sur-cooperation-iws', 'bf75310d2ce82d9c43f4dd7d9576a4e7', 'welcome-to-cooperation-iws', '2008-10-25 08:13:08', 62, 1),
(138, 4, 50, 'content', 'title', 'Bienvenue sur Cooperation-iws !', '8645b541796089aeef9a5a470926af69', 'Welcome on Cooperation-iws web !', '2008-11-30 00:00:21', 62, 1),
(139, 4, 50, 'content', 'alias', 'welcome-on-cooperation-iws-web-', '44bdddfb4ffd4ebaded8128d278b4697', 'welcome-on-cooperation-iws-web-', '2008-11-30 00:00:21', 62, 1),
(140, 4, 50, 'content', 'introtext', '<p>Vous êtes maintenant en train de naviguer sur un serveur Intranet Cooperation-iws 0.7.0. </p><p> Plus d''information sur Cooperation-iws: <a href="http://cooperation-iws.gensys-net.eu">http://cooperation-iws.gensys-net.eu</a></p><p>&lt;?php </p><p>$xml_file="cooperation-wui-fr.xml"; </p><p>$tree = simplexml_load_file(''../''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree-&gt;item as $item) {    <br />                            $array_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);<br />                            $array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);<br />                            $array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);<br />                            $array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);<br />                            $array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_xml as $key =&gt; $row) {<br />                            $category[$key]  = $row[''0''];<br />                            $item_name[$key] = $row[''1''];<br />                            $item_desc[$key] = $row[''2''];<br />                            $item_url[$key] = $row[''3''];<br />                            $item_admin_url[$key] = $row[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($category, SORT_ASC, $item_name, SORT_ASC, $array_xml);<br /><br />?&gt;</p><h1>Applications</h1><p>&lt;?php<br /><br />                       $prev_category = "";<br />                        for($count_boucle=0; $count_boucle &lt;= $count_xml_elt ; $count_boucle++) {<br />                            $category= $array_xml[$count_boucle][0];<br />                            if ("$prev_category" != "$category"){<br />                                echo "&lt;br&gt;\\n&lt;h3&gt;&lt;a name=\\"".$count_boucle."\\"&gt;&lt;/a&gt;".$category."&lt;/h3&gt;&lt;hr&gt;&lt;br&gt;\\n";<br />                            }<br />                            $prev_category = $category;<br />                            $name = $array_xml[$count_boucle][1];<br />                            $desc = $array_xml[$count_boucle][2];<br />                            $url = $array_xml[$count_boucle][3];<br />                            $admin_url =$array_xml[$count_boucle][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\\n";<br />                            echo $desc."&lt;br&gt;&lt;br&gt;\\n";<br />                            echo "&lt;a href=\\"".$url."\\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\\"".$admin_url."\\"&gt;admin&lt;/a&gt;\\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt; <br />&lt;?php $tree_admin = simplexml_load_file(''../admin/''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree_admin-&gt;item as $item) {    <br />                            $array_admin_xml[$count_xml_elt][0] = $item-&gt;item_category;<br />                            $array_admin_xml[$count_xml_elt][1] = $item-&gt;item_name;<br />                            $array_admin_xml[$count_xml_elt][2] = $item-&gt;item_desc;<br />                            $array_admin_xml[$count_xml_elt][3] = $item-&gt;item_url;<br />                            $array_admin_xml[$count_xml_elt][4] = $item-&gt;item_admin_url;<br />                            $array_admin_xml[$count_xml_elt][0] = strval($array_admin_xml[$count_xml_elt][0]);<br />                            $array_admin_xml[$count_xml_elt][1] = strval($array_admin_xml[$count_xml_elt][1]);<br />                            $array_admin_xml[$count_xml_elt][2] = strval($array_admin_xml[$count_xml_elt][2]);<br />                            $array_admin_xml[$count_xml_elt][3] = strval($array_admin_xml[$count_xml_elt][3]);<br />                            $array_admin_xml[$count_xml_elt][4] = strval($array_admin_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_admin_xml as $key_admin =&gt; $row_admin) {<br />                            $item_admin_category[$key_admin]  = $row_admin[''0''];<br />                            $item_admin_name[$key_admin] = $row_admin[''1''];<br />                            $item_admin_desc[$key_admin] = $row_admin[''2''];<br />                            $item_url[$key_admin] = $row_admin[''3''];<br />                            $item_admin_admin_url[$key_admin] = $row_admin[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($item_admin_category, SORT_ASC, $item_admin_name, SORT_ASC, $array_admin_xml);<br /><br />?&gt;</p><h1>Administration</h1><p>&nbsp;</p><p>&lt;?php<br /><br />                       $prev_admin_category = "";</p><p>&nbsp;</p><p>                        for($count_boucle_admin=0; $count_boucle_admin &lt;= $count_xml_elt ; $count_boucle_admin++) {<br />                            $category_admin= $array_admin_xml[$count_boucle_admin][0];<br />                            if ("$prev_admin_category" != "$category_admin"){<br />                                echo "&lt;br&gt;\\n&lt;h3&gt;&lt;a name=\\"admin_".$count_boucle_admin."\\"&gt;&lt;/a&gt;".$category_admin."&lt;/h3&gt;&lt;hr&gt;&lt;br&gt;\\n";<br />                            }<br />                            $prev_admin_category = $category_admin;<br />                            $name = $array_admin_xml[$count_boucle_admin][1];<br />                            $desc = $array_admin_xml[$count_boucle_admin][2];<br />                            $url = $array_admin_xml[$count_boucle_admin][3];<br />                            $admin_url =$array_admin_xml[$count_boucle_admin][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "&lt;b&gt;".$name."&lt;/b&gt;&lt;br&gt;\\n";<br />                            echo $desc."&lt;br&gt;\\n";<br />                            echo "&lt;a href=\\"".$url."\\"&gt;".$url."&lt;/a&gt;";<br />                            if ($admin_url) {<br />                                echo " | &lt;a href=\\"".$admin_url."\\"&gt;admin&lt;/a&gt;\\n";<br />                            }<br />                            echo "&lt;br&gt;&lt;br&gt;&lt;br&gt;\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?&gt;         </p><p>&nbsp;</p>', 'c0012807c97f5a37cb1707c00d306962', '<p>You are now surfing on a Cooperation-iws Intranet server 0.7.0. </p><p> More info about Cooperation-iws: <a href="http://cooperation-iws.gensys-net.eu">http://cooperation-iws.gensys-net.eu</a></p><p><?php </p><p>$xml_file="cooperation-wui.xml"; </p><p>$tree = simplexml_load_file(''../''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree->item as $item) {    <br />                            $array_xml[$count_xml_elt][0] = $item->item_category;<br />                            $array_xml[$count_xml_elt][1] = $item->item_name;<br />                            $array_xml[$count_xml_elt][2] = $item->item_desc;<br />                            $array_xml[$count_xml_elt][3] = $item->item_url;<br />                            $array_xml[$count_xml_elt][4] = $item->item_admin_url;<br />                            $array_xml[$count_xml_elt][0] = strval($array_xml[$count_xml_elt][0]);<br />                            $array_xml[$count_xml_elt][1] = strval($array_xml[$count_xml_elt][1]);<br />                            $array_xml[$count_xml_elt][2] = strval($array_xml[$count_xml_elt][2]);<br />                            $array_xml[$count_xml_elt][3] = strval($array_xml[$count_xml_elt][3]);<br />                            $array_xml[$count_xml_elt][4] = strval($array_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_xml as $key => $row) {<br />                            $category[$key]  = $row[''0''];<br />                            $item_name[$key] = $row[''1''];<br />                            $item_desc[$key] = $row[''2''];<br />                            $item_url[$key] = $row[''3''];<br />                            $item_admin_url[$key] = $row[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($category, SORT_ASC, $item_name, SORT_ASC, $array_xml);<br /><br />?></p><h1>Applications</h1><p><?php<br /><br />                       $prev_category = "";<br />                        for($count_boucle=0; $count_boucle <= $count_xml_elt ; $count_boucle++) {<br />                            $category= $array_xml[$count_boucle][0];<br />                            if ("$prev_category" != "$category"){<br />                                echo "<br>\\n<h3><a name=\\"".$count_boucle."\\"></a>".$category."</h3><hr><br>\\n";<br />                            }<br />                            $prev_category = $category;<br />                            $name = $array_xml[$count_boucle][1];<br />                            $desc = $array_xml[$count_boucle][2];<br />                            $url = $array_xml[$count_boucle][3];<br />                            $admin_url =$array_xml[$count_boucle][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "<b>".$name."</b><br>\\n";<br />                            echo $desc."<br><br>\\n";<br />                            echo "<a href=\\"".$url."\\">".$url."</a>";<br />                            if ($admin_url) {<br />                                echo " | <a href=\\"".$admin_url."\\">admin</a>\\n";<br />                            }<br />                            echo "<br><br><br>\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?> <br /><?php $tree_admin = simplexml_load_file(''../admin/''.$xml_file);<br />                        $count_xml_elt=0;<br />                        foreach($tree_admin->item as $item) {    <br />                            $array_admin_xml[$count_xml_elt][0] = $item->item_category;<br />                            $array_admin_xml[$count_xml_elt][1] = $item->item_name;<br />                            $array_admin_xml[$count_xml_elt][2] = $item->item_desc;<br />                            $array_admin_xml[$count_xml_elt][3] = $item->item_url;<br />                            $array_admin_xml[$count_xml_elt][4] = $item->item_admin_url;<br />                            $array_admin_xml[$count_xml_elt][0] = strval($array_admin_xml[$count_xml_elt][0]);<br />                            $array_admin_xml[$count_xml_elt][1] = strval($array_admin_xml[$count_xml_elt][1]);<br />                            $array_admin_xml[$count_xml_elt][2] = strval($array_admin_xml[$count_xml_elt][2]);<br />                            $array_admin_xml[$count_xml_elt][3] = strval($array_admin_xml[$count_xml_elt][3]);<br />                            $array_admin_xml[$count_xml_elt][4] = strval($array_admin_xml[$count_xml_elt][4]);<br />                        $count_xml_elt++;<br />                        }<br />                        foreach ($array_admin_xml as $key_admin => $row_admin) {<br />                            $item_admin_category[$key_admin]  = $row_admin[''0''];<br />                            $item_admin_name[$key_admin] = $row_admin[''1''];<br />                            $item_admin_desc[$key_admin] = $row_admin[''2''];<br />                            $item_url[$key_admin] = $row_admin[''3''];<br />                            $item_admin_admin_url[$key_admin] = $row_admin[''4''];<br /><br /><br /><br />                        }<br />                        array_multisort($item_admin_category, SORT_ASC, $item_admin_name, SORT_ASC, $array_admin_xml);<br /><br />?></p><h1>Administration</h1><p> </p><p><?php<br /><br />                       $prev_admin_category = "";</p><p> </p><p>                        for($count_boucle_admin=0; $count_boucle_admin <= $count_xml_elt ; $count_boucle_admin++) {<br />                            $category_admin= $array_admin_xml[$count_boucle_admin][0];<br />                            if ("$prev_admin_category" != "$category_admin"){<br />                                echo "<br>\\n<h3><a name=\\"admin_".$count_boucle_admin."\\"></a>".$category_admin."</h3><hr><br>\\n";<br />                            }<br />                            $prev_admin_category = $category_admin;<br />                            $name = $array_admin_xml[$count_boucle_admin][1];<br />                            $desc = $array_admin_xml[$count_boucle_admin][2];<br />                            $url = $array_admin_xml[$count_boucle_admin][3];<br />                            $admin_url =$array_admin_xml[$count_boucle_admin][4];<br />                            $url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $url);<br />                            $admin_url = str_replace (''localhost'', $_SERVER["SERVER_NAME"], $admin_url);<br /><br />                            echo "<b>".$name."</b><br>\\n";<br />                            echo $desc."<br>\\n";<br />                            echo "<a href=\\"".$url."\\">".$url."</a>";<br />                            if ($admin_url) {<br />                                echo " | <a href=\\"".$admin_url."\\">admin</a>\\n";<br />                            }<br />                            echo "<br><br><br>\\n";<br /><br />                            }<br /><br />        <br /><br /><br /> ?>         </p><p> </p>', '2008-11-30 00:00:21', 62, 1);
INSERT INTO `jos_jf_content` (`id`, `language_id`, `reference_id`, `reference_table`, `reference_field`, `value`, `original_value`, `original_text`, `modified`, `modified_by`, `published`) VALUES
(141, 4, 50, 'content', 'attribs', 'created_by=62\ncreated_by_alias=\naccess=0\ncreated=\npublish_up=\npublish_down=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=\n\n', '56405df14c2814f631f9f82fcbfc75a2', 'show_title=\r\nlink_titles=\r\nshow_intro=\r\nshow_section=\r\nlink_section=\r\nshow_category=\r\nlink_category=\r\nshow_vote=\r\nshow_author=\r\nshow_create_date=\r\nshow_modify_date=\r\nshow_pdf_icon=\r\nshow_print_icon=\r\nshow_email_icon=\r\nlanguage=\r\nkeyref=\r\nreadmore=', '2008-11-30 00:00:21', 62, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_jf_tableinfo`
--

CREATE TABLE IF NOT EXISTS `jos_jf_tableinfo` (
  `id` int(11) NOT NULL auto_increment,
  `joomlatablename` varchar(100) NOT NULL default '',
  `tablepkID` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2445 ;

--
-- Dumping data for table `jos_jf_tableinfo`
--

INSERT INTO `jos_jf_tableinfo` (`id`, `joomlatablename`, `tablepkID`) VALUES
(2432, 'banner', 'bid'),
(2433, 'bannerclient', 'cid'),
(2434, 'categories', 'id'),
(2435, 'contact_details', 'id'),
(2436, 'content', 'id'),
(2437, 'menu', 'id'),
(2438, 'modules', 'id'),
(2439, 'newsfeeds', 'id'),
(2440, 'poll_data', 'id'),
(2441, 'polls', 'id'),
(2442, 'sections', 'id'),
(2443, 'users', 'id'),
(2444, 'weblinks', 'id');

-- --------------------------------------------------------

--
-- Table structure for table `jos_languages`
--

CREATE TABLE IF NOT EXISTS `jos_languages` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `active` tinyint(1) NOT NULL default '0',
  `iso` varchar(20) default NULL,
  `code` varchar(20) NOT NULL default '',
  `shortcode` varchar(20) default NULL,
  `image` varchar(100) default NULL,
  `fallback_code` varchar(20) NOT NULL default '',
  `params` text,
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `jos_languages`
--

INSERT INTO `jos_languages` (`id`, `name`, `active`, `iso`, `code`, `shortcode`, `image`, `fallback_code`, `params`, `ordering`) VALUES
(2, 'English (United Kingdom)', 1, 'en_GB.utf8, en_GB.UT', 'en-GB', 'en', '', '', '', 0),
(3, 'Español(Spanish Formal International)', 1, 'es_ES.UTF-8, spa_ES.', 'es-ES', 'es', '', '', '', 0),
(4, 'French (Fr)', 1, 'fr_FR.utf8, fr_FR.UT', 'fr-FR', 'fr', '', '', '', 0),
(5, 'Български (България)', 1, 'bg-BG.UTF-8, bg-BG.u', 'bg-BG', 'bg', '', '', '', 0),
(6, 'Malay (Bahasa Malaysia)', 1, 'malay.utf8, malay.UT', 'bm-MY', 'bm', '', '', '', 0),
(7, 'Catalan', 1, 'ca_ES.utf8, ca_ES.UT', 'ca-ES', 'ca', '', '', '', 0),
(8, 'Čeština (Česká republika)', 1, 'cs_CZ.utf8, cs_CZ.UT', 'cs-CZ', 'cs', '', '', '', 0),
(9, 'Cymraeg (Welsh)', 1, 'cy_GB.utf-8, cy_GB.u', 'cy-GB', 'cy', '', '', '', 0),
(10, 'Deutsch (DE-CH-AT)', 1, 'de_DE.UTF-8, de_CH.U', 'de-DE', 'de', '', '', '', 0),
(11, 'Greek', 1, 'el_GR.UTF-8, el_GR.U', 'el-GR', 'el', '', '', '', 0),
(12, 'Basque (Euskara estandarra)', 1, 'eu_ES.utf8, eu_ES.UT', 'eu-ES', 'eu', '', '', '', 0),
(13, 'Farsi', 1, 'fa_IR.utf8, fa, fars', 'fa-IR', 'fa', '', '', '', 0),
(14, 'Hebrew (Israel)', 1, 'he_IL.utf-8, heb_IL.', 'he-IL', 'he', '', '', '', 0),
(15, 'Hindi (India)', 1, 'hn-IN.utf8, hn-IN.UT', 'hn-IN', 'hn', '', '', '', 0),
(16, 'Hungarian (formal)', 1, 'hu-HU.utf-8, hu-HU.U', 'hu-HU', 'hu', '', '', '', 0),
(17, 'Íslenska(Iceland)', 1, 'is_IS.utf8, is_IS.UT', 'is-IS', 'is', '', '', '', 0),
(18, 'Italian (Italy)', 1, 'it_IT.utf8, it_IT.UT', 'it-IT', 'it', '', '', '', 0),
(19, 'Japanese(JP)', 1, 'jpn_JP, ja_JP.UTF8, ', 'ja-JP', 'ja', '', '', '', 0),
(20, 'Georgian (Georgia)', 1, 'ka_GE.utf8, ka_GE.UT', 'ka-GE', 'ka', '', '', '', 0),
(21, 'khmer (Kh)', 1, 'kh_KH.utf8, kh_KH.UT', 'kh-KH', 'kh', '', '', '', 0),
(22, 'Korean(Republic of Korea))', 1, 'ko_KR.utf8,ko_KR.utf', 'ko-KR', 'ko', '', '', '', 0),
(23, 'Latvian', 1, 'Latvian, lv_LV.UTF-8', 'lv-LV', 'lv', '', '', '', 0),
(24, 'Mongolian', 1, 'mn_MN.utf8, mn_MN.UT', 'mn-MN', 'mn', '', '', '', 0),
(25, 'marathi (India)', 1, 'mr-IN.utf8, mr-IN.UT', 'mr-IN', 'mr', '', '', '', 0),
(26, 'Norsk bokmål (Norway)', 1, 'no_NO.utf-8, nb_NO.u', 'nb-NO', 'nb', '', '', '', 0),
(27, 'Nepali Language', 1, 'ne-NP.utf8, ne-NP.UT', 'ne-NP', 'ne', '', '', '', 0),
(28, 'Nederlands (NL-BE)', 1, 'nl-NL.utf-8, nl-NL.U', 'nl-NL', 'nl', '', '', '', 0),
(29, 'Russian (CIS)', 1, 'ru_RU.utf8, ru_RU.UT', 'ru-RU', 'ru', '', '', '', 0),
(30, 'Sindhi(سنڌي)', 1, 'sd_PK.utf8, sd-PK.UT', 'sd-PK', 'sd', '', '', '', 0),
(31, 'Sinhala (Sri Lanka)', 1, 'si_LK.UTF-8, si, si_', 'si-LK', 'si', '', '', '', 0),
(32, 'Serbian Montenegro Latin', 1, 'sr_RS.utf8, sr_RS.UT', 'sr-ME', 'sr', '', '', '', 0),
(33, 'Serbian', 1, 'sr_RS.utf8, sr_RS.UT', 'sr-RS', 'sr', '', '', '', 0),
(34, 'Serbian Latin', 1, 'sr_YU.utf8, sr_YU.UT', 'sr-YU', 'sr', '', '', '', 0),
(35, 'Svenska (Sverige)', 1, 'sv_SE.UTF-8, sv_SE.u', 'sv-SE', 'sv', '', '', '', 0),
(36, 'Thai (ภาษาไทย)', 1, 'th_TH.UTF-8', 'th-TH', 'th', '', '', '', 0),
(37, 'Turkish (Turkiye)', 1, 'tr_TR.utf8, tr, tr_T', 'tr-TR', 'tr', '', '', '', 0),
(38, 'Ukrainian (Ukraine)', 1, 'uk_UA.UTF-8, uk_UA, ', 'uk-UA', 'uk', '', '', '', 0),
(39, 'Yoruba (Yo)', 1, 'yo_NG.utf8, yo_NG.UT', 'yo-NG', 'yo', '', '', '', 0),
(40, '简体中文', 1, 'zh_CN.utf8, zh, zho,', 'zh-CN', 'zh', '', '', '', 0),
(41, '繁體中文', 1, 'zh_TW.UTF8, zh_TW, z', 'zh-TW', 'zh', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(75) default NULL,
  `name` varchar(255) default NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL default '0',
  `rgt` int(11) unsigned NOT NULL default '0',
  `home` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=Welcome to the front page\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'mainmenu', 'Ciws License', 'ciws-license', 'index.php?option=com_content&view=article&id=5', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(41, 'mainmenu', 'FAQ', 'faq', 'index.php?option=com_content&view=section&id=3', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\nshow_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1', 0, 0, 0),
(11, 'othermenu', 'Joomla! Home', 'joomla-home', 'http://www.joomla.org', 'url', 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(12, 'othermenu', 'Ciws Forums', 'ciws-forums', 'http://cooperation-iws.gensys-net.eu/forum/', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(13, 'othermenu', 'Ciws Help', 'ciws-help', 'https://launchpad.net/cooperation-iws', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(14, 'othermenu', 'OSM Home', 'osm-home', 'http://www.opensourcematters.org', 'url', 0, 0, 0, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 4, 'menu_image=-1\n\n', 0, 0, 0),
(15, 'othermenu', 'Administrator', 'administrator', 'administrator/', 'url', 0, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(18, 'topmenu', 'News', 'news', 'index.php?option=com_newsfeeds&view=newsfeed&id=1&feedid=1', 'component', 0, 0, 11, 0, 3, 62, '2008-10-20 13:44:55', 0, 0, 0, 3, 'show_page_title=1\npage_title=News\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_other_cats=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 0, 0, 0),
(20, 'usermenu', 'Your Details', 'your-details', 'index.php?option=com_user&view=user&task=edit', 'component', 1, 0, 14, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(24, 'usermenu', 'Logout', 'logout', 'index.php?option=com_user&view=login', 'component', 1, 0, 14, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(38, 'keyconcepts', 'Content Layouts', 'content-layouts', 'index.php?option=com_content&view=article&id=24', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(27, 'mainmenu', 'Ciws Overview', 'ciws-overview', 'index.php?option=com_content&view=article&id=19', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(28, 'topmenu', 'About Cooperation-iws', 'about-ciws', 'index.php?option=com_content&view=article&id=19', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(29, 'topmenu', 'Features', 'features', 'index.php?option=com_content&view=article&id=22', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(30, 'topmenu', 'The Community', 'the-community', 'index.php?option=com_content&view=article&id=27', 'component', 0, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(34, 'mainmenu', 'What''s New in  0.5.2 ?', 'what-is-new-in-0-5-2', 'index.php?option=com_content&view=article&id=22', 'component', -2, 0, 20, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(40, 'keyconcepts', 'Extensions', 'extensions', 'index.php?option=com_content&view=article&id=26', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(37, 'mainmenu', 'More about Ciws', 'more-about-ciws', 'index.php?option=com_content&view=section&id=4', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\norderby=\norderby_sec=\nshow_feed_link=1\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(43, 'keyconcepts', 'Example Pages', 'example-pages', 'index.php?option=com_content&view=article&id=43', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(44, 'ExamplePages', 'Section Blog', 'section-blog', 'index.php?option=com_content&view=section&layout=blog&id=3', 'component', 1, 0, 20, 0, 1, 62, '2008-10-20 13:25:25', 0, 0, 0, 0, 'show_page_title=1\npage_title=Example of Section Blog layout (FAQ section)\nshow_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\nshow_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(45, 'ExamplePages', 'Section Table', 'section-table', 'index.php?option=com_content&view=section&id=3', 'component', 1, 0, 20, 0, 2, 62, '2008-10-20 13:25:15', 0, 0, 0, 0, 'show_page_title=1\npage_title=Example of Table Blog layout (FAQ section)\nshow_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\nshow_noauth=0\nshow_title=1\nnlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(46, 'ExamplePages', 'Category Blog', 'categoryblog', 'index.php?option=com_content&view=category&layout=blog&id=31', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=Example of Category Blog layout (FAQs/General category)\nshow_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\nshow_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(47, 'ExamplePages', 'Category Table', 'category-table', 'index.php?option=com_content&view=category&id=32', 'component', 1, 0, 20, 0, 4, 62, '2008-10-19 08:35:05', 0, 0, 0, 0, 'show_page_title=1\npage_title=Example of Category Table layout (FAQs/Languages category)\nshow_headings=1\nshow_date=0\ndate_format=\nfilter=1\nfilter_type=title\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_sec=\nshow_pagination=1\nshow_pagination_limit=1\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(48, 'mainmenu', 'Web Links', 'web-links', 'index.php?option=com_weblinks&view=categories', 'component', -2, 0, 4, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=Weblinks\nimage=-1\nimage_align=right\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 0, 0, 0),
(49, 'mainmenu', 'News Feeds', 'news-feeds', 'index.php?option=com_newsfeeds&view=categories', 'component', -2, 0, 11, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=Newsfeeds\nshow_comp_description=1\ncomp_description=\nimage=-1\nimage_align=right\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_other_cats=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 0, 0, 0),
(50, 'mainmenu', 'The News', 'the-news', 'index.php?option=com_content&view=category&layout=blog&id=1', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=The News\nshow_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\nshow_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(51, 'usermenu', 'Submit an Article', 'submit-an-article', 'index.php?option=com_content&view=article&layout=form', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 2, 0, '', 0, 0, 0),
(52, 'usermenu', 'Submit a Web Link', 'submit-a-web-link', 'index.php?option=com_weblinks&view=weblink&layout=form', 'component', 1, 0, 4, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 2, 0, '', 0, 0, 0),
(53, 'mainmenu', 'Download', 'download', 'index.php?option=com_content&view=article&id=46', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(75) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'usermenu', 'User Menu', 'A Menu for logged in Users'),
(3, 'topmenu', 'Top Menu', 'Top level navigation'),
(4, 'othermenu', 'Resources', 'Additional links'),
(5, 'ExamplePages', 'Example Pages', 'Example Pages'),
(6, 'keyconcepts', 'Key Concepts', 'This describes some critical information for new Users.');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(50) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  `control` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 5, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(16, 'Polls', '', 0, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_poll', 0, 0, 1, 'id=15\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(17, 'User Menu', '', 4, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=usermenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(18, 'Login Form', '', 8, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, 'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n', 1, 0, ''),
(19, 'Latest News', '', 0, 'user1', 0, '0000-00-00 00:00:00', 0, 'mod_latestnews', 0, 0, 1, 'count=3\nordering=m_dsc\nuser_id=0\nshow_front=1\nsecid=\ncatid=\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 1, 0, ''),
(20, 'Statistics', '', 6, 'left', 62, '2008-10-19 08:38:19', 0, 'mod_stats', 0, 0, 1, 'serverinfo=1\nsiteinfo=1\ncounter=1\nincrease=0\nmoduleclass_sfx=', 0, 0, ''),
(21, 'Who''s Online', '', 0, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_whosonline', 0, 0, 1, 'cache=0\nshowmode=0\nmoduleclass_sfx=\n\n', 0, 0, ''),
(22, 'Popular', '', 1, 'user2', 0, '0000-00-00 00:00:00', 0, 'mod_mostread', 0, 0, 1, 'cache=1', 0, 0, ''),
(23, 'Archive', '', 9, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_archive', 0, 0, 1, 'cache=1', 1, 0, ''),
(24, 'Sections', '', 10, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_sections', 0, 0, 1, 'cache=1', 1, 0, ''),
(25, 'Newsflash', '', 1, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_newsflash', 0, 0, 1, 'catid=3\r\nstyle=random\r\nitems=\r\nmoduleclass_sfx=', 0, 0, ''),
(26, 'Related Items', '', 11, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_related_items', 0, 0, 1, '', 0, 0, ''),
(28, 'Random Image', '', 9, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_random_image', 0, 0, 1, '', 0, 0, ''),
(29, 'Main', '', 0, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'menutype=mainmenu\nmenu_style=list_flat\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=-1\nindent_image2=-1\nindent_image3=-1\nindent_image4=-1\nindent_image5=-1\nindent_image6=-1\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(30, 'Banners', '', 1, 'footer', 0, '0000-00-00 00:00:00', 0, 'mod_banners', 0, 0, 0, 'target=1\ncount=1\ncid=1\ncatid=33\ntag_search=0\nordering=random\nheader_text=\nfooter_text=\nmoduleclass_sfx=\ncache=1\ncache_time=15\n\n', 1, 0, ''),
(31, 'Resources', '', 0, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(32, 'Wrapper', '', 12, 'left', 62, '2008-10-20 13:22:44', 0, 'mod_wrapper', 0, 0, 1, '', 0, 0, ''),
(33, 'Footer', '', 2, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 0, 'cache=1\n\n', 1, 0, ''),
(34, 'Feed Display', '', 13, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_feed', 0, 0, 1, '', 1, 0, ''),
(35, 'Breadcrumbs', '', 1, 'breadcrumb', 62, '2008-10-20 13:18:18', 1, 'mod_breadcrumbs', 0, 0, 1, 'moduleclass_sfx=\ncache=0\nshowHome=1\nhomeText=Home\nshowComponent=1\nseparator=\n\n', 1, 0, ''),
(36, 'Syndication', '', 3, 'syndicate', 0, '0000-00-00 00:00:00', 1, 'mod_syndicate', 0, 0, 0, '', 1, 0, ''),
(38, 'Advertisement', '', 3, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_banners', 0, 0, 1, 'count=4\r\nrandomise=0\r\ncid=0\r\ncatid=14\r\nheader_text=Featured Links:\r\nfooter_text=<a href="http://www.joomla.org">Ads by Joomla!</a>\r\nmoduleclass_sfx=_text\r\ncache=0\r\n\r\n', 0, 0, ''),
(39, 'Example Pages', '', 0, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'cache=1\nclass_sfx=\nmoduleclass_sfx=_menu\nmenutype=ExamplePages\nmenu_style=list_flat\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nfull_active_id=0\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nactivate_parent=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\nwindow_open=\n\n', 0, 0, ''),
(40, 'Key Concepts', '', 3, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=keyconcepts\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(41, 'Welcome to Joomla!', '<div style="padding: 5px"><p>Congratulations on choosing Joomla! as your content management system. We hope you are able to create a successful Web site with our program and maybe you will be able to give something back to the community later.</p><p>To make your start with Joomla! as smooth as possible, we want to give you some pointers to documentation, common questions and help on securing your server. A good place to start is the &quot;<a href="http://docs.joomla.org/beginners" target="_blank">Absolute Beginners Guide to Joomla!</a>&quot;.</p><p>For your most common questions the best place to start looking for answers is the <a href="http://help.joomla.org/component/option,com_easyfaq/Itemid,268/" target="_blank">Frequently Asked Questions (FAQ)</a> area.  If you are stuck on a particular screen in the Administration area of Joomla! (which is where you are now), then try clicking on the Help toolbar button which you will find on almost all screens.  This will take you to a page about that screen on our <a href="http://help.joomla.org" target="_blank">Help Site</a>.  If you still have questions then take a look on our <a href="http://forum.joomla.org" target="_blank">forum</a> which is most likely the biggest resource on Joomla! there is and you will find almost every question answered at least once, so please try using the search function before asking your question.</p><p>Security is a big concern for us, which is why we would like you to subscribe to the <a href="http://forum.joomla.org/viewforum.php?f=8" target="_blank">announcement forum</a> (by clicking on the Notify button) to always get the latest information on new releases for Joomla! You should also read the <a href="http://help.joomla.org/component/option,com_easyfaq/task,view/id,167/Itemid,268/" target="_blank">Joomla! Administrator''s Security Checklist</a> and regularly check the <a href="http://forum.joomla.org/viewforum.php?f=432" target="_blank">security forum</a>.</p><p>We hope you have much fun and success with Joomla! and hope to see you in the forum among the hundreds and thousands of contributors.</p><p>Your Joomla! team.<img alt="Smile" border="0" src="../plugins/editors/tinymce/jscripts/tiny_mce/plugins/emotions/images/smiley-smile.gif" title="Smile" /></p><p>P.S.: To remove this message, delete the &quot;Welcome to Joomla!&quot; Module in the Administrator screen of the Module Manager (on the Extensions menu).  Here is a <a href="index.php?option=com_modules&amp;client=1">quick link</a> to this screen.</p></div>', 1, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 2, 1, 'moduleclass_sfx=\n\n', 1, 1, ''),
(42, 'Language Selection', '', 0, 'banner', 0, '0000-00-00 00:00:00', 1, 'mod_jflanguageselection', 0, 0, 0, 'type=dropdown\nshow_active=1\ninc_jf_css=1\nmoduleclass_sfx=\ncache_href=0\n\n', 0, 0, ''),
(43, 'Direct Translation', '', 0, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_translate', 0, 2, 0, '', 0, 1, ''),
(45, 'Download', '<a class="media" href="http://developer.berlios.de/project/showfiles.php?group_id=9656" title="http://developer.berlios.de/project/showfiles.php?group_id=9656" rel="nofollow"><img src="images/folder_download.png" border="0" width="200" height="128" /></a>', 2, 'user2', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(48, 'Applications list', '', 0, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_listapp', 0, 0, 1, 'xml_file=cooperation-wui.xml\n\n', 0, 0, ''),
(50, 'Search', '', 0, 'user3', 0, '0000-00-00 00:00:00', 1, 'mod_search', 0, 0, 1, 'moduleclass_sfx=\nwidth=20\ntext=\nbutton=\nbutton_pos=left\nimagebutton=\nbutton_text=\nres_lang=en-language\ncache=1\ncache_time=900\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 1),
(1, 41),
(1, 48),
(16, 1),
(17, 0),
(18, 1),
(19, 1),
(19, 2),
(19, 27),
(21, 1),
(22, 1),
(22, 2),
(22, 4),
(22, 27),
(22, 36),
(25, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(38, 1),
(39, 43),
(39, 44),
(39, 45),
(39, 46),
(39, 47),
(40, 0),
(42, 0),
(45, 0),
(48, 0),
(50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_newsfeeds`
--

INSERT INTO `jos_newsfeeds` (`catid`, `id`, `name`, `alias`, `link`, `filename`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`, `rtl`) VALUES
(4, 1, 'Joomla! - Official News', 'joomla-official-news', 'http://feedproxy.google.com/JoomlaAnnouncements', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 8, 0),
(4, 2, 'Joomla! - Community News', 'joomla-community-news', 'http://feedproxy.google.com/JoomlaCommunityCoreTeamBlog', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 9, 0),
(6, 3, 'Linux Today', 'linux-today', 'http://linuxtoday.com/backend/my-netscape.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(5, 4, 'Business News', 'business-news', 'http://headlines.internet.com/internetnews/bus-news/news.rss', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(7, 5, 'Web Developer News', 'web-developer-news', 'http://headlines.internet.com/internetnews/wd-news/news.rss', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 3, 0),
(6, 6, 'Linux Central:New Products', 'linux-central-news-products', 'http://linuxcentral.com/backend/lcnew.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 4, 0),
(6, 7, 'Linux Central:Best Selling', 'linux-central-best-selling', 'http://linuxcentral.com/backend/lcbestns.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 5, 0),
(6, 8, 'Linux Central:Daily Specials', 'linux-central-daily-specials', 'http://linuxcentral.com/backend/lcspecialns.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 62, '2008-10-20 16:49:05', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 62, '2008-11-29 22:11:43', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE 2.0', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'theme=advanced\ncleanup=1\ncleanup_startup=0\nautosave=0\ncompressed=0\nrelative_urls=1\ntext_direction=ltr\nlang_mode=0\nlang_code=en\ninvalid_elements=applet\ncontent_css=1\ncontent_css_custom=\nnewlines=0\ntoolbar=top\nhr=1\nsmilies=1\ntable=1\nstyle=1\nlayer=1\nxhtmlxtras=0\ntemplate=0\ndirectionality=1\nfullscreen=1\nhtml_height=550\nhtml_width=750\npreview=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Jfdatabase', 'jfdatabase', 'system', 0, -100, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'System - Jfrouter', 'jfrouter', 'system', 0, -101, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(36, 'Content - Jfalternative', 'jfalternative', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(37, 'Search - Jfcategories', 'jfcategories', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(38, 'Search - Jfcontacts', 'jfcontacts', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(39, 'Search - Jfcontent', 'jfcontent', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(40, 'Search - Jfnewsfeeds', 'jfnewsfeeds', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(41, 'Search - Jfsections', 'jfsections', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(42, 'Search - Jfweblinks', 'jfweblinks', 'search', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(43, 'Joomfish - Missing_translation', 'missing_translation', 'joomfish', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(44, 'DirectPHP', 'DirectPHP', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enable_command_block=0\nblock_list=basename, chgrp, chmod, chown, clearstatcache, copy, delete, dirname, disk_free_space, disk_total_space, diskfreespace, fclose, feof, fflush, fgetc, fgetcsv, fgets, fgetss, file_exists, file_get_contents, file_put_contents, file, fileatime, filectime, filegroup, fileinode, filemtime, fileowner, fileperms, filesize, filetype, flock, fnmatch, fopen, fpassthru, fputcsv, fputs, fread, fscanf, fseek, fstat, ftell, ftruncate, fwrite, glob, lchgrp, lchown, link, linkinfo, lstat, move_uploaded_file, opendir, parse_ini_file, pathinfo, pclose, popen, readfile, readdir, readllink, realpath, rename, rewind, rmdir, set_file_buffer, stat, symlink, tempnam, tmpfile, touch, umask, unlink, fsockopen, system, exec, passthru, escapeshellcmd, pcntl_exec, proc_open, proc_close, mkdir, rmdir\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(11) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `jos_poll_data`
--

INSERT INTO `jos_poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(13, 15, 'Personal Intranet', 0),
(14, 15, 'Community Intranet', 0),
(15, 15, 'Enterprise Intranet', 0),
(16, 15, 'Internet', 0),
(17, 15, 'All of the above !', 0),
(18, 15, '', 0),
(19, 15, '', 0),
(20, 15, '', 0),
(21, 15, '', 0),
(22, 15, '', 0),
(23, 15, '', 0),
(24, 15, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `jos_poll_date`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `jos_polls`
--

INSERT INTO `jos_polls` (`id`, `title`, `alias`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(15, 'Ciws is used for?', 'ciws-is-used-for', 0, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(1, 'News', '', 'news', 'articles.jpg', 'content', 'right', 'Select a news topic from the list below, then select a news article to read.', 1, 0, '0000-00-00 00:00:00', 3, 0, 3, ''),
(3, 'FAQs', '', 'faqs', 'key.jpg', 'content', 'left', 'From the list below choose one of our FAQs topics, then select an FAQ to read. If you have a question which is not in this section, please contact us.', 1, 0, '0000-00-00 00:00:00', 5, 0, 27, ''),
(4, 'About Ciws', '', 'about-ciws', '', 'content', 'left', '', 1, 62, '2008-10-20 13:24:48', 2, 0, 16, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('admin', '1228235942', '7ab3b5c2429321070b812dc75059e409', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:26;s:19:"session.timer.start";i:1228235129;s:18:"session.timer.last";i:1228235942;s:17:"session.timer.now";i:1228235942;s:22:"session.client.browser";s:101:"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092816 Iceweasel/3.0.3 (Debian-3.0.3-3)";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:2:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:14:"admin@ciws.com";s:8:"password";s:65:"b192721871fc63fc37be3ab0dc5c3d69:mbGeGwZ9N1MFY93sirXLGezwNAjQ7PQe";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2008-10-18 08:49:03";s:13:"lastvisitDate";s:19:"2008-11-30 11:07:01";s:10:"activation";s:0:"";s:6:"params";s:56:"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:64:"/var/www/Cooperation-iws/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:1:"0";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"175690281b43e51c3daaa00279a00e37";}'),
('', '1228236029', '426e8d871a30735388d0a297cea2451c', 1, 0, '', 0, 0, '__default|a:7:{s:15:"session.counter";i:8;s:19:"session.timer.start";i:1228235115;s:18:"session.timer.last";i:1228235947;s:17:"session.timer.now";i:1228236029;s:22:"session.client.browser";s:101:"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092816 Iceweasel/3.0.3 (Debian-3.0.3-3)";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:2:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:5:"en-GB";}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:64:"/var/www/Cooperation-iws/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('siteground13', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'admin@ciws.com', 'b192721871fc63fc37be3ab0dc5c3d69:mbGeGwZ9N1MFY93sirXLGezwNAjQ7PQe', 'Super Administrator', 0, 1, 25, '2008-10-18 08:49:03', '2008-12-02 16:25:40', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_weblinks`
--

