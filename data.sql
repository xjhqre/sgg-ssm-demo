/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 8.0.19 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ssm`;

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

CREATE TABLE `t_dept` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_dept` */

insert  into `t_dept`(`dept_id`,`dept_name`) values 
(1,'宣传部'),
(3,'技术部'),
(4,'开发部');

/*Table structure for table `t_emp` */

DROP TABLE IF EXISTS `t_emp`;

CREATE TABLE `t_emp` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `emp_gender` char(1) NOT NULL,
  `emp_email` varchar(255) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

/*Data for the table `t_emp` */

insert  into `t_emp`(`emp_id`,`emp_name`,`emp_gender`,`emp_email`,`dept_id`) values 
(10,'03e288','M','03e288@126.com',1),
(11,'583349','M','583349@126.com',1),
(12,'be4c610','M','be4c610@126.com',1),
(13,'c659b11','M','c659b11@126.com',1),
(14,'69b0a12','M','69b0a12@126.com',1),
(15,'c812313','M','c812313@126.com',1),
(16,'808c414','M','808c414@126.com',1),
(17,'1b1e615','M','1b1e615@126.com',1),
(18,'9d36d16','M','9d36d16@126.com',1),
(19,'c0ba217','M','c0ba217@126.com',1),
(20,'fe17418','M','fe17418@126.com',1),
(21,'755e019','M','755e019@126.com',1),
(22,'5aa9120','M','5aa9120@126.com',1),
(23,'bd0c721','M','bd0c721@126.com',1),
(24,'aa90322','M','aa90322@126.com',1),
(25,'edc7623','M','edc7623@126.com',1),
(26,'6b46524','M','6b46524@126.com',1),
(27,'f926625','M','f926625@126.com',1),
(28,'8e38126','M','8e38126@126.com',1),
(29,'5ddde27','M','5ddde27@126.com',1),
(30,'2c1a328','M','2c1a328@126.com',1),
(31,'94dd929','M','94dd929@126.com',1),
(32,'b79c630','M','b79c630@126.com',1),
(33,'c446c31','M','c446c31@126.com',1),
(34,'e6c4f32','M','e6c4f32@126.com',1),
(35,'a354d33','M','a354d33@126.com',1),
(36,'7642e34','M','7642e34@126.com',1),
(37,'3f50235','M','3f50235@126.com',1),
(38,'ee74e36','M','ee74e36@126.com',1),
(39,'e027537','M','e027537@126.com',1),
(40,'65a2838','M','65a2838@126.com',1),
(41,'f33f139','M','f33f139@126.com',1),
(42,'2d6e840','M','2d6e840@126.com',1),
(43,'1527f41','M','1527f41@126.com',1),
(44,'1802e42','M','1802e42@126.com',1),
(45,'6ee1c43','M','6ee1c43@126.com',1),
(46,'2574f44','M','2574f44@126.com',1),
(47,'bf04645','M','bf04645@126.com',1),
(48,'8027646','M','8027646@126.com',1),
(49,'864f047','M','864f047@126.com',1),
(50,'be19748','M','be19748@126.com',1),
(51,'623b049','M','623b049@126.com',1),
(52,'1ed0450','M','1ed0450@126.com',1),
(53,'0a64b51','M','0a64b51@126.com',1),
(54,'db94c52','M','db94c52@126.com',1),
(55,'c66d853','M','c66d853@126.com',1),
(56,'a6dcc54','M','a6dcc54@126.com',1),
(57,'61a0755','M','61a0755@126.com',1),
(58,'09be356','M','09be356@126.com',1),
(59,'3182e57','M','3182e57@126.com',1),
(60,'02bdb58','M','02bdb58@126.com',1),
(61,'2bbca59','M','2bbca59@126.com',1),
(62,'e30fa60','M','e30fa60@126.com',1),
(63,'b617c61','M','b617c61@126.com',1),
(64,'6befb62','M','6befb62@126.com',1),
(65,'ab87d63','M','ab87d63@126.com',1),
(66,'eb90364','M','eb90364@126.com',1),
(67,'decaa65','M','decaa65@126.com',1),
(68,'13f1466','M','13f1466@126.com',1),
(69,'9187167','M','9187167@126.com',1),
(70,'b370b68','M','b370b68@126.com',1),
(71,'7036d69','M','7036d69@126.com',1),
(72,'72dfe70','M','72dfe70@126.com',1),
(73,'cb16071','M','cb16071@126.com',1),
(74,'bc00472','M','bc00472@126.com',1),
(75,'b738a73','M','b738a73@126.com',1),
(76,'49e5174','M','49e5174@126.com',1),
(77,'dfef075','M','dfef075@126.com',1),
(78,'4fe5b76','M','4fe5b76@126.com',1),
(79,'8f7fd77','M','8f7fd77@126.com',1),
(80,'af15078','M','af15078@126.com',1),
(81,'1175279','M','1175279@126.com',1),
(82,'7981a80','M','7981a80@126.com',1),
(83,'fe40381','M','fe40381@126.com',1),
(84,'6b8b882','M','6b8b882@126.com',1),
(85,'b93a583','M','b93a583@126.com',1),
(86,'49b8084','M','49b8084@126.com',1),
(87,'8eea785','M','8eea785@126.com',1),
(88,'b47a386','M','b47a386@126.com',1),
(89,'0324187','M','0324187@126.com',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
