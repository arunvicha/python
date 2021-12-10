/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.19-log : Database - first
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`first` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `first`;

/*Table structure for table `coaches` */

DROP TABLE IF EXISTS `coaches`;

CREATE TABLE `coaches` (
  `coach_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `age` varchar(11) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `descr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `coaches` */

LOCK TABLES `coaches` WRITE;

insert  into `coaches`(`coach_id`,`login_id`,`fname`,`lname`,`place`,`phone`,`email`,`age`,`gender`,`descr`) values (1,2,'akash','philip','kaloor','1234567890','akash@gmail.com','27','male','tester');

UNLOCK TABLES;

/*Table structure for table `fan` */

DROP TABLE IF EXISTS `fan`;

CREATE TABLE `fan` (
  `fan_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dob` varchar(191) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `fan` */

LOCK TABLES `fan` WRITE;

insert  into `fan`(`fan_id`,`fname`,`lname`,`phone`,`email`,`dob`,`login_id`) values (1,'libi','niyas','9632580741','libi@gmail.com','12/12/12',10),(2,'jabir','kp','9874563210','jabi@gmail.com','13/12/12',11),(3,'','','','','',12),(4,'amal','m','9632580741','amal@gmail.com','12/12/12',13);

UNLOCK TABLES;

/*Table structure for table `fitnessreport` */

DROP TABLE IF EXISTS `fitnessreport`;

CREATE TABLE `fitnessreport` (
  `fitness_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `desr` varchar(50) DEFAULT NULL,
  `eligibility` varchar(50) DEFAULT NULL,
  `datetime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fitness_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `fitnessreport` */

LOCK TABLES `fitnessreport` WRITE;

insert  into `fitnessreport`(`fitness_id`,`player_id`,`desr`,`eligibility`,`datetime`) values (1,1,'test','Eligible','2021-03-11');

UNLOCK TABLES;

/*Table structure for table `games` */

DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_id` int(11) DEFAULT NULL,
  `againstteam` varchar(50) DEFAULT NULL,
  `datetime` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `games` */

LOCK TABLES `games` WRITE;

insert  into `games`(`game_id`,`venue_id`,`againstteam`,`datetime`,`status`) values (1,1,'blasters','2021-03-11T15:24','not started'),(3,3,'ffc','2021-03-11T17:26','not started');

UNLOCK TABLES;

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

LOCK TABLES `login` WRITE;

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values (1,'admin','admin','admin'),(2,'akash','akash','Coach'),(4,'pc','pc','physio'),(7,'sree','sree','player'),(8,'anju','anju','player'),(10,'libi','libi','fan'),(11,'jabi','jabi','fan'),(12,'','','fan'),(13,'amal','amal','fan'),(14,'filby','filby','player');

UNLOCK TABLES;

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) DEFAULT NULL,
  `reply` varchar(50) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `reciever_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `message` */

LOCK TABLES `message` WRITE;

insert  into `message`(`message_id`,`descr`,`reply`,`sender_id`,`reciever_id`,`datetime`) values (1,'hiiii','hello',4,2,'2021-03-11 00:00:00'),(2,'hiiii admin','hello',2,1,'2021-03-11 00:00:00'),(3,'hello','pending',2,1,'2021-03-11 00:00:00'),(4,'test','pending',2,1,'2021-03-11 00:00:00'),(5,'test','pending',2,1,'2021-03-11 00:00:00'),(6,'hi anjaly','h',7,8,'2021-03-11 18:09:14'),(7,'hi coach','hi',7,2,'2021-03-12 14:56:33'),(8,'hi anju','hi',7,8,'2021-03-12 15:00:05'),(9,'hi filby','g',7,14,'2021-03-12 15:07:07'),(10,'hhh','pending',14,7,'2021-03-12 16:03:42'),(11,'hi da','pending',8,14,'2021-03-13 09:25:28'),(12,'ggg','h',8,14,'2021-03-13 09:30:21'),(13,'ggjbc','s',8,14,'2021-03-13 09:33:45');

UNLOCK TABLES;

/*Table structure for table `physio` */

DROP TABLE IF EXISTS `physio`;

CREATE TABLE `physio` (
  `phy_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `age` varchar(11) DEFAULT NULL,
  `quali` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`phy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `physio` */

LOCK TABLES `physio` WRITE;

insert  into `physio`(`phy_id`,`login_id`,`fname`,`lname`,`place`,`phone`,`email`,`age`,`quali`) values (1,4,'vishak','pc','kaloor','1234567890','pc@gmail.com','29','bca');

UNLOCK TABLES;

/*Table structure for table `player` */

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `pro_pic` varchar(500) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `hname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `player` */

LOCK TABLES `player` WRITE;

insert  into `player`(`player_id`,`login_id`,`pro_pic`,`fname`,`lname`,`place`,`phone`,`email`,`dob`,`gender`,`hname`) values (1,7,'static/uploads/cf43361c-8781-421c-a86d-839f8f43c0c65c5cfb50f3190.jpg','sreejesh','sree','kaloor','1234567890','sree@gmail.com','2021-03-09','male','s'),(2,8,'static/uploads/9b66e691-767a-45f4-9749-f3f5f1844b3e5c6a5e8cad2b8.jpg','anjaly','thomas','kaloor','9876543212','anju@gmail.com','2021-03-11','female','s'),(4,14,'static/uploads/89ea342e-9da4-4881-9981-1239900eddc45c6a5e8cad2b8.jpg','filby','xaviour','kaloor','1234567890','filby@gmail.com','2021-03-12','female','s');

UNLOCK TABLES;

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `fan_id` int(11) DEFAULT NULL,
  `rated` int(11) DEFAULT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

LOCK TABLES `rating` WRITE;

insert  into `rating`(`rate_id`,`player_id`,`fan_id`,`rated`) values (1,1,2,5),(2,1,2,5);

UNLOCK TABLES;

/*Table structure for table `team` */

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `descr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `team` */

LOCK TABLES `team` WRITE;

insert  into `team`(`team_id`,`player_id`,`game_id`,`descr`) values (2,1,1,'aammmm'),(7,1,3,'ffcccc');

UNLOCK TABLES;

/*Table structure for table `training` */

DROP TABLE IF EXISTS `training`;

CREATE TABLE `training` (
  `training_id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `status` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`training_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `training` */

LOCK TABLES `training` WRITE;

insert  into `training`(`training_id`,`descr`,`datetime`,`status`) values (1,'test','2021-03-11 16:36:00','will begin soon');

UNLOCK TABLES;

/*Table structure for table `venues` */

DROP TABLE IF EXISTS `venues`;

CREATE TABLE `venues` (
  `venue_id` int(11) NOT NULL AUTO_INCREMENT,
  `venuename` varchar(50) DEFAULT NULL,
  `descr` varchar(500) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `venues` */

LOCK TABLES `venues` WRITE;

insert  into `venues`(`venue_id`,`venuename`,`descr`,`place`) values (1,'kaloor','kaloor descs','kaloor'),(3,'mugal','test','kaloor');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
