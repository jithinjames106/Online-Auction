-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.2.3-falcon-alpha-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema `as`
--

CREATE DATABASE IF NOT EXISTS `as`;
USE `as`;

--
-- Definition of table `tb_auction`
--

DROP TABLE IF EXISTS `tb_auction`;
CREATE TABLE `tb_auction` (
  `auc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `reg_id` int(10) unsigned NOT NULL,
  `bid_amount` float NOT NULL,
  `biddate` datetime NOT NULL,
  PRIMARY KEY (`auc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_auction`
--

/*!40000 ALTER TABLE `tb_auction` DISABLE KEYS */;
INSERT INTO `tb_auction` (`auc_id`,`item_id`,`reg_id`,`bid_amount`,`biddate`) VALUES 
 (1,3,4,251,'2015-12-07 16:20:29'),
 (2,2,3,3589,'2015-12-07 16:26:19');
/*!40000 ALTER TABLE `tb_auction` ENABLE KEYS */;


--
-- Definition of table `tb_auction_category`
--

DROP TABLE IF EXISTS `tb_auction_category`;
CREATE TABLE `tb_auction_category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_auction_category`
--

/*!40000 ALTER TABLE `tb_auction_category` DISABLE KEYS */;
INSERT INTO `tb_auction_category` (`cat_id`,`cat_name`) VALUES 
 (1,'ELECTRONICS'),
 (2,'HOME APPLIENCES'),
 (3,'FASHION'),
 (4,'KITCHEN ');
/*!40000 ALTER TABLE `tb_auction_category` ENABLE KEYS */;


--
-- Definition of table `tb_auction_items`
--

DROP TABLE IF EXISTS `tb_auction_items`;
CREATE TABLE `tb_auction_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(500) NOT NULL,
  `min_price` float NOT NULL,
  `open_date` date NOT NULL,
  `open_time` time NOT NULL,
  `auction_status` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  `reg_id` int(10) unsigned NOT NULL,
  `itempic` varchar(500) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_tb_auction_items_1` (`cat_id`),
  KEY `FK_tb_auction_items_2` (`reg_id`),
  CONSTRAINT `FK_tb_auction_items_1` FOREIGN KEY (`cat_id`) REFERENCES `tb_auction_category` (`cat_id`),
  CONSTRAINT `FK_tb_auction_items_2` FOREIGN KEY (`reg_id`) REFERENCES `tb_register` (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_auction_items`
--

/*!40000 ALTER TABLE `tb_auction_items` DISABLE KEYS */;
INSERT INTO `tb_auction_items` (`item_id`,`item_name`,`min_price`,`open_date`,`open_time`,`auction_status`,`cat_id`,`reg_id`,`itempic`) VALUES 
 (1,'Fridge',15700,'2015-12-07','16:26:29',0,1,3,'Fridge.jpg'),
 (2,'Chair',3580,'2015-12-07','16:21:23',2,2,3,'Goliath kitchen chair.jpg'),
 (3,'Spoon',250,'2015-12-07','16:20:00',2,4,3,'662ML.jpg'),
 (4,'Nike Shoe',4500,'2015-12-07','16:25:22',0,3,3,'basketball-shoe.png'),
 (5,'Apple i phone 6 plus',56000,'2015-12-07','16:26:29',0,1,3,'Apple iphone 6 plus.jpg');
/*!40000 ALTER TABLE `tb_auction_items` ENABLE KEYS */;


--
-- Definition of table `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
CREATE TABLE `tb_login` (
  `login_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `reg_id` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`login_id`),
  KEY `FK_tb_login_1` (`reg_id`),
  CONSTRAINT `FK_tb_login_1` FOREIGN KEY (`reg_id`) REFERENCES `tb_register` (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_login`
--

/*!40000 ALTER TABLE `tb_login` DISABLE KEYS */;
INSERT INTO `tb_login` (`login_id`,`username`,`password`,`reg_id`,`status`) VALUES 
 (1,'admin@gmail.com','123',1,0),
 (2,'jithin@gmail.com','1234',2,1),
 (3,'john@gmail.com','1234',3,1),
 (4,'user@gmail.com','1234',4,1);
/*!40000 ALTER TABLE `tb_login` ENABLE KEYS */;


--
-- Definition of table `tb_register`
--

DROP TABLE IF EXISTS `tb_register`;
CREATE TABLE `tb_register` (
  `reg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_register`
--

/*!40000 ALTER TABLE `tb_register` DISABLE KEYS */;
INSERT INTO `tb_register` (`reg_id`,`fname`,`lname`,`address`,`phoneno`) VALUES 
 (1,'ADMIN','BIDnSHOP','ADMINISTRATOR\r\nBID N SHOP\r\nSOUTH CROSS','0123456789'),
 (2,'JITHIN','JAMES','JITHIN JAMES\r\nUSER','0123456788'),
 (3,'JOHN','T','JOHN T\r\nJAVA','123456777'),
 (4,'user',' user','SOUTH STREET \r\nCANADA','123456789');
/*!40000 ALTER TABLE `tb_register` ENABLE KEYS */;


--
-- Definition of table `tbl_winners`
--

DROP TABLE IF EXISTS `tbl_winners`;
CREATE TABLE `tbl_winners` (
  `winners_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auction_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`winners_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_winners`
--

/*!40000 ALTER TABLE `tbl_winners` DISABLE KEYS */;
INSERT INTO `tbl_winners` (`winners_id`,`auction_id`,`item_id`) VALUES 
 (1,1,3),
 (2,2,2);
/*!40000 ALTER TABLE `tbl_winners` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
