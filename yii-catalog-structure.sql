-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 06, 2011 at 07:45 PM
-- Server version: 5.1.40
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alex-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `attr`
--

CREATE TABLE IF NOT EXISTS `attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `attr_group_id` int(10) unsigned NOT NULL,
  `is_main` tinyint(1) DEFAULT '0',
  `filter` tinyint(1) NOT NULL,
  `type` tinyint(3) unsigned DEFAULT '1',
  `pos` tinyint(3) unsigned DEFAULT '1',
  `template` varchar(250) DEFAULT NULL,
  `global_pos` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attr_attr_group1` (`attr_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attr_group`
--

CREATE TABLE IF NOT EXISTS `attr_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pos` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attr_group_category1` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attr_value`
--

CREATE TABLE IF NOT EXISTS `attr_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attr_id` int(10) unsigned NOT NULL,
  `value` varchar(1500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attr_value_attr1` (`attr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `root` int(10) unsigned DEFAULT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `alias` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `root` (`root`),
  KEY `lft` (`lft`),
  KEY `rgt` (`rgt`),
  KEY `level` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Table structure for table `good`
--

CREATE TABLE IF NOT EXISTS `good` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `brand_id` int(11) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `price` decimal(10,0) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_good_brand` (`brand_id`),
  KEY `fk_good_category1` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2025 ;

-- --------------------------------------------------------

--
-- Table structure for table `good_attr_val`
--

CREATE TABLE IF NOT EXISTS `good_attr_val` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(11) unsigned NOT NULL,
  `attr_value_id` int(10) unsigned DEFAULT NULL,
  `attr_id` int(10) unsigned DEFAULT NULL,
  `value` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_good_attr_val_good1` (`good_id`),
  KEY `fk_good_attr_val_attr_value1` (`attr_value_id`),
  KEY `fk_good_attr_val_attr1` (`attr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `good_image`
--

CREATE TABLE IF NOT EXISTS `good_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(250) NOT NULL,
  `good_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_good_image_good1` (`good_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `user_id` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`user_id`, `lastname`, `firstname`, `birthday`) VALUES
(1, 'Admin', 'Administrator', '0000-00-00'),
(2, 'Demo', 'Demo', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `profiles_fields`
--

CREATE TABLE IF NOT EXISTS `profiles_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `field_size` int(3) NOT NULL DEFAULT '0',
  `field_size_min` int(3) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(255) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `widget` varchar(255) NOT NULL DEFAULT '',
  `widgetparams` varchar(5000) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`widget`,`visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `profiles_fields`
--

INSERT INTO `profiles_fields` (`id`, `varname`, `title`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `widget`, `widgetparams`, `position`, `visible`) VALUES
(1, 'lastname', 'Last Name', 'VARCHAR', 50, 3, 1, '', '', 'Incorrect Last Name (length between 3 and 50 characters).', '', '', '', '', 1, 3),
(2, 'firstname', 'First Name', 'VARCHAR', 50, 3, 1, '', '', 'Incorrect First Name (length between 3 and 50 characters).', '', '', '', '', 0, 3),
(3, 'birthday', 'Birthday', 'DATE', 0, 0, 2, '', '', '', '', '0000-00-00', 'UWjuidate', '{"ui-theme":"redmond"}', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(10) unsigned NOT NULL,
  `user_id` int(10) NOT NULL,
  `value` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rating_desc`
--

CREATE TABLE IF NOT EXISTS `rating_desc` (
  `id` tinyint(3) unsigned NOT NULL,
  `desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating_desc`
--

INSERT INTO `rating_desc` (`id`, `desc`) VALUES
(1, 'ужасная модель'),
(2, 'плохая модель'),
(3, 'обычная модель'),
(4, 'хорошая модель'),
(5, 'отличная модель');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(4) unsigned NOT NULL,
  `positive` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `negative` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `using_experience` tinyint(4) unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  KEY `user_id` (`user_id`),
  KEY `rating` (`rating`),
  KEY `using_experience` (`using_experience`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL DEFAULT '',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `lastvisit` int(10) NOT NULL DEFAULT '0',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `activkey`, `createtime`, `lastvisit`, `superuser`, `status`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'webmaster@example.com', '9a24eff8c15a6a141ece27eb6947da0f', 1261146094, 1312627947, 1, 1),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@example.com', '099f825543f7850cc038b90aaff39fac', 1261146096, 1312549897, 0, 1),
(3, 'alex', 'fe01ce2a7fbac8fafaed7c982a04e229', '', '', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_exp_desc`
--

CREATE TABLE IF NOT EXISTS `user_exp_desc` (
  `id` tinyint(3) unsigned NOT NULL,
  `desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_exp_desc`
--

INSERT INTO `user_exp_desc` (`id`, `desc`) VALUES
(1, 'менее месяца'),
(2, 'несколько месяцев'),
(3, 'более года');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attr`
--
ALTER TABLE `attr`
  ADD CONSTRAINT `fk_attr_attr_group1` FOREIGN KEY (`attr_group_id`) REFERENCES `attr_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `attr_group`
--
ALTER TABLE `attr_group`
  ADD CONSTRAINT `fk_attr_group_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `attr_value`
--
ALTER TABLE `attr_value`
  ADD CONSTRAINT `fk_attr_value_attr1` FOREIGN KEY (`attr_id`) REFERENCES `attr` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `good`
--
ALTER TABLE `good`
  ADD CONSTRAINT `fk_good_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_good_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `good_attr_val`
--
ALTER TABLE `good_attr_val`
  ADD CONSTRAINT `good_attr_val_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `good_attr_val_ibfk_2` FOREIGN KEY (`attr_value_id`) REFERENCES `attr_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `good_attr_val_ibfk_3` FOREIGN KEY (`attr_id`) REFERENCES `attr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `good_image`
--
ALTER TABLE `good_image`
  ADD CONSTRAINT `good_image_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_5` FOREIGN KEY (`rating`) REFERENCES `rating_desc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ibfk_6` FOREIGN KEY (`using_experience`) REFERENCES `user_exp_desc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
