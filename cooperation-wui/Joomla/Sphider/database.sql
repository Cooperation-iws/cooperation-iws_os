-- phpMyAdmin SQL Dump
-- version 2.11.3deb1ubuntu1.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mar 04 Novembre 2008 à 11:02
-- Version du serveur: 5.0.51
-- Version de PHP: 5.2.4-2ubuntu5.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `Sphider`
--
CREATE DATABASE `Sphider` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Sphider`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL auto_increment,
  `category` text,
  `parent_num` int(11) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `categories`
--


-- --------------------------------------------------------

--
-- Structure de la table `domains`
--

CREATE TABLE IF NOT EXISTS `domains` (
  `domain_id` int(11) NOT NULL auto_increment,
  `domain` varchar(255) default NULL,
  PRIMARY KEY  (`domain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `domains`
--


-- --------------------------------------------------------

--
-- Structure de la table `keywords`
--

CREATE TABLE IF NOT EXISTS `keywords` (
  `keyword_id` int(11) NOT NULL auto_increment,
  `keyword` varchar(30) NOT NULL,
  PRIMARY KEY  (`keyword_id`),
  UNIQUE KEY `kw` (`keyword`),
  KEY `keyword` (`keyword`(10))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `keywords`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword0`
--

CREATE TABLE IF NOT EXISTS `link_keyword0` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword0`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword1`
--

CREATE TABLE IF NOT EXISTS `link_keyword1` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword1`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword2`
--

CREATE TABLE IF NOT EXISTS `link_keyword2` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword2`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword3`
--

CREATE TABLE IF NOT EXISTS `link_keyword3` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword3`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword4`
--

CREATE TABLE IF NOT EXISTS `link_keyword4` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword4`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword5`
--

CREATE TABLE IF NOT EXISTS `link_keyword5` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword5`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword6`
--

CREATE TABLE IF NOT EXISTS `link_keyword6` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword6`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword7`
--

CREATE TABLE IF NOT EXISTS `link_keyword7` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword7`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword8`
--

CREATE TABLE IF NOT EXISTS `link_keyword8` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword8`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyword9`
--

CREATE TABLE IF NOT EXISTS `link_keyword9` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyword9`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyworda`
--

CREATE TABLE IF NOT EXISTS `link_keyworda` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyworda`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keywordb`
--

CREATE TABLE IF NOT EXISTS `link_keywordb` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keywordb`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keywordc`
--

CREATE TABLE IF NOT EXISTS `link_keywordc` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keywordc`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keywordd`
--

CREATE TABLE IF NOT EXISTS `link_keywordd` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keywordd`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keyworde`
--

CREATE TABLE IF NOT EXISTS `link_keyworde` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keyworde`
--


-- --------------------------------------------------------

--
-- Structure de la table `link_keywordf`
--

CREATE TABLE IF NOT EXISTS `link_keywordf` (
  `link_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `weight` int(3) default NULL,
  `domain` int(4) default NULL,
  KEY `linkid` (`link_id`),
  KEY `keyid` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `link_keywordf`
--


-- --------------------------------------------------------

--
-- Structure de la table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `link_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL,
  `url` varchar(255) NOT NULL,
  `title` varchar(200) default NULL,
  `description` varchar(255) default NULL,
  `fulltxt` mediumtext,
  `indexdate` date default NULL,
  `size` float default NULL,
  `md5sum` varchar(32) default NULL,
  `visible` int(11) default '0',
  `level` int(11) default NULL,
  PRIMARY KEY  (`link_id`),
  KEY `url` (`url`),
  KEY `md5key` (`md5sum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `links`
--


-- --------------------------------------------------------

--
-- Structure de la table `pending`
--

CREATE TABLE IF NOT EXISTS `pending` (
  `site_id` int(11) default NULL,
  `temp_id` varchar(32) default NULL,
  `level` int(11) default NULL,
  `count` int(11) default NULL,
  `num` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pending`
--


-- --------------------------------------------------------

--
-- Structure de la table `query_log`
--

CREATE TABLE IF NOT EXISTS `query_log` (
  `query` varchar(255) default NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `elapsed` float default NULL,
  `results` int(11) default NULL,
  KEY `query_key` (`query`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `query_log`
--


-- --------------------------------------------------------

--
-- Structure de la table `site_category`
--

CREATE TABLE IF NOT EXISTS `site_category` (
  `site_id` int(11) default NULL,
  `category_id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `site_category`
--


-- --------------------------------------------------------

--
-- Structure de la table `sites`
--

CREATE TABLE IF NOT EXISTS `sites` (
  `site_id` int(11) NOT NULL auto_increment,
  `url` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `short_desc` text,
  `indexdate` date default NULL,
  `spider_depth` int(11) default '2',
  `required` text,
  `disallowed` text,
  `can_leave_domain` tinyint(1) default NULL,
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `sites`
--

INSERT INTO `sites` (`site_id`, `url`, `title`, `short_desc`, `indexdate`, `spider_depth`, `required`, `disallowed`, `can_leave_domain`) VALUES
(1, 'http://localhost/', '', '', NULL, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `temp`
--

CREATE TABLE IF NOT EXISTS `temp` (
  `link` varchar(255) default NULL,
  `level` int(11) default NULL,
  `id` varchar(32) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `temp`
--

