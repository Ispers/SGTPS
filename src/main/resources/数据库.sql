/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.26-log : Database - db_school_mall3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_school_mall3` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_school_mall3`;

/*Table structure for table `admin_user` */

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(4) DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `admin_user` */

insert  into `admin_user`(`admin_user_id`,`login_user_name`,`login_password`,`nick_name`,`locked`) values (1,'admin','e10adc3949ba59abbe56e057f20f883e','李四',0),(2,'admin1','e10adc3949ba59abbe56e057f20f883e','新蜂01',0),(3,'newbee-admin2','e10adc3949ba59abbe56e057f20f883e','新蜂02',0);

/*Table structure for table `carousel` */

DROP TABLE IF EXISTS `carousel`;

CREATE TABLE `carousel` (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页轮播图主键id',
  `carousel_url` varchar(100) NOT NULL DEFAULT '' COMMENT '轮播图',
  `redirect_url` varchar(100) NOT NULL DEFAULT '''##''' COMMENT '点击后的跳转地址(默认不跳转)',
  `carousel_rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int(11) NOT NULL DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`carousel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `carousel` */

insert  into `carousel`(`carousel_id`,`carousel_url`,`redirect_url`,`carousel_rank`,`is_deleted`,`create_time`,`create_user`,`update_time`,`update_user`) values (2,'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/banner1.png','https://juejin.im/book/5da2f9d4f265da5b81794d48/section/5da2f9d6f265da5b794f2189',13,1,'2023-02-18 00:00:00',0,'2023-02-28 17:32:06',0),(8,'http://localhost:8080/upload/20200628_17081564.png','##',0,1,'2023-02-28 17:08:16',0,'2023-02-28 17:08:50',0),(15,'http://localhost:8080/upload/20201011_17535619.jpg','##',0,1,'2023-02-11 17:53:59',0,'2023-02-11 17:55:41',0),(16,'http://localhost:8080/upload/20230227_10575173.jpg','##',0,0,'2023-02-11 17:55:26',0,'2023-02-27 10:57:56',0),(17,'http://localhost:8080/upload/20201013_09253989.jpg','##',0,1,'2023-02-13 09:25:40',0,'2023-02-13 09:25:58',0),(18,'http://localhost:8080/upload/20230227_11022945.jpeg','##',0,0,'2023-02-27 11:00:19',0,'2023-02-27 11:00:19',0);

/*Table structure for table `goods_category` */

DROP TABLE IF EXISTS `goods_category`;

CREATE TABLE `goods_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '分类级别(1-一级分类 2-二级分类 3-三级分类)',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父分类id',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int(11) DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

/*Data for the table `goods_category` */

insert  into `goods_category`(`category_id`,`category_level`,`parent_id`,`category_name`,`category_rank`,`is_deleted`,`create_time`,`create_user`,`update_time`,`update_user`) values (112,2,65,'玩具',0,0,'2023-02-12 17:45:34',0,'2023-02-12 17:45:34',0),(113,2,65,'生活用品',0,0,'2023-02-12 17:45:44',0,'2023-02-12 17:45:44',0),(114,2,65,'其他',0,0,'2023-02-12 17:45:51',0,'2023-02-12 17:45:51',0),(115,1,0,'数码',0,0,'2023-02-25 20:50:46',0,'2023-02-27 10:40:22',0),(116,1,0,'服装',0,0,'2023-02-25 20:50:54',0,'2023-02-27 10:40:09',0),(117,2,115,'手机',0,0,'2023-02-25 20:51:27',0,'2023-02-27 10:40:43',0),(119,2,116,'男装',0,0,'2023-02-25 20:51:56',0,'2023-02-27 10:42:12',0),(120,3,119,'物品6',0,0,'2023-02-25 20:52:06',0,'2023-02-25 20:52:06',0),(121,2,115,'耳机',0,0,'2023-02-27 10:38:40',0,'2023-02-27 10:38:40',0),(122,3,121,'无线耳机',0,0,'2023-02-27 11:02:05',0,'2023-02-27 11:05:13',0),(123,3,121,'有线耳机',0,0,'2023-02-27 11:03:09',0,'2023-02-27 11:03:09',0),(124,3,117,'测试3',0,0,'2023-03-07 21:16:00',0,'2023-03-07 22:17:22',0),(125,3,117,'测试2',1,0,'2023-03-07 22:16:04',0,'2023-03-07 22:16:04',0);

/*Table structure for table `goods_info` */

DROP TABLE IF EXISTS `goods_info`;

CREATE TABLE `goods_info` (
  `goods_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品表主键id',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名',
  `goods_intro` varchar(200) NOT NULL DEFAULT '' COMMENT '商品简介',
  `goods_category_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联分类id',
  `goods_cover_img` varchar(200) NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品主图',
  `goods_carousel` varchar(500) NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品轮播图',
  `goods_detail_content` text NOT NULL COMMENT '商品详情',
  `original_price` int(11) NOT NULL DEFAULT '1' COMMENT '商品价格',
  `selling_price` int(11) NOT NULL DEFAULT '1' COMMENT '商品实际售价',
  `stock_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存数量',
  `tag` varchar(20) NOT NULL DEFAULT '' COMMENT '商品标签',
  `goods_sell_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品上架状态 0-下架 1-上架',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '添加者主键id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品添加时间',
  `update_user` int(11) NOT NULL DEFAULT '0' COMMENT '修改者主键id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品修改时间',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10905 DEFAULT CHARSET=utf8;

/*Data for the table `goods_info` */

insert  into `goods_info`(`goods_id`,`goods_name`,`goods_intro`,`goods_category_id`,`goods_cover_img`,`goods_carousel`,`goods_detail_content`,`original_price`,`selling_price`,`stock_num`,`tag`,`goods_sell_status`,`create_user`,`create_time`,`update_user`,`update_time`) values (10903,'耳机','11',123,'http://localhost:8080/upload/20230227_11044130.jpeg','http://localhost:8080/upload/20230227_11044130.jpeg','111',1,1,99,'11',0,0,'2023-02-25 20:57:02',0,'2023-04-25 20:45:52'),(10904,'华为p40','手机',118,'http://localhost:8080/upload/20230227_11012861.jpg','http://localhost:8080/upload/20230227_11012861.jpg','222',1,1,9997,'222',0,0,'2023-02-25 20:58:15',0,'2023-03-05 22:08:12');

/*Table structure for table `index_config` */

DROP TABLE IF EXISTS `index_config`;

CREATE TABLE `index_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '首页配置项主键id',
  `config_name` varchar(50) NOT NULL DEFAULT '' COMMENT '显示字符(配置搜索时不可为空，其他可为空)',
  `config_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-搜索框热搜 2-搜索下拉框热搜 3-(首页)热销商品 4-(首页)新品上线 5-(首页)为你推荐',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品id 默认为0',
  `redirect_url` varchar(100) NOT NULL DEFAULT '##' COMMENT '点击后的跳转地址(默认不跳转)',
  `config_rank` int(11) NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  `update_user` int(11) DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `index_config` */

insert  into `index_config`(`config_id`,`config_name`,`config_type`,`goods_id`,`redirect_url`,`config_rank`,`is_deleted`,`create_time`,`create_user`,`update_time`,`update_user`) values (20,'11',5,1,'##',0,1,'2023-02-18 18:22:48',0,'2023-02-18 18:22:48',0);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单表主键id',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户主键id',
  `total_price` int(11) NOT NULL DEFAULT '1' COMMENT '订单总价',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态:0.未支付,1.支付成功,-1:支付失败',
  `pay_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.无 1.支付宝支付 2.微信支付',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
  `extra_info` varchar(100) NOT NULL DEFAULT '' COMMENT '订单body',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `user_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `user_address` varchar(100) NOT NULL DEFAULT '' COMMENT '收货人收货地址',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`order_id`,`order_no`,`user_id`,`total_price`,`pay_status`,`pay_type`,`pay_time`,`order_status`,`extra_info`,`user_name`,`user_phone`,`user_address`,`is_deleted`,`create_time`,`update_time`) values (26,'16024982733381542',1,1248,1,1,'2023-02-12 18:25:20',1,'','','','杭州市西湖区xx小区x幢419 十三 137xxxx2703',0,'2023-02-12 18:24:33','2023-02-12 18:25:20'),(28,'16025517607857229',12,888,1,1,'2023-02-13 09:16:06',4,'','','','四川省成都青羊区清江中路40号',0,'2023-02-13 09:16:00','2023-02-13 09:16:41'),(29,'16780250276133910',13,1,1,2,'2023-03-05 22:04:44',1,'','','','山东省济南市东山花园',0,'2023-03-05 22:02:23','2023-03-05 22:04:44'),(30,'16780253076241116',13,1,0,0,NULL,0,'','','','山东省济南市东山花园',0,'2023-03-05 22:07:03','2023-03-05 22:07:03'),(31,'16781112871996019',13,1,0,0,NULL,0,'','','','山东省济南市东山花园',0,'2023-03-06 21:59:59','2023-03-06 21:59:59'),(32,'16781951234415347',13,1,0,0,NULL,0,'','','','山东省济南市东山花园',0,'2023-03-07 21:17:15','2023-03-07 21:17:15'),(33,'16812883384291852',13,1,0,0,NULL,0,'','','','山东省济南市东山花园',0,'2023-04-12 16:30:44','2023-04-12 16:30:44');

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单关联购物项主键id',
  `order_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '下单时商品的名称(订单快照)',
  `goods_cover_img` varchar(200) NOT NULL DEFAULT '' COMMENT '下单时商品的主图(订单快照)',
  `selling_price` int(11) NOT NULL DEFAULT '1' COMMENT '下单时商品的价格(订单快照)',
  `goods_count` int(11) NOT NULL DEFAULT '1' COMMENT '数量(订单快照)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

/*Data for the table `order_item` */

insert  into `order_item`(`order_item_id`,`order_id`,`goods_id`,`goods_name`,`goods_cover_img`,`selling_price`,`goods_count`,`create_time`) values (36,22,10898,'户外单车','http://localhost:8080/upload/20200628_17535990.jpg',899,3,'2023-02-28 17:57:54'),(42,26,10900,'迪奥口红','http://localhost:8080/upload/20201011_2143256.jpeg',180,2,'2023-02-12 18:24:33'),(43,26,10899,'华为P30 至尊版','http://localhost:8080/upload/20200629_10505733.jpg',888,1,'2023-02-12 18:24:33'),(46,28,10899,'华为P30 至尊版','http://localhost:8080/upload/20200629_10505733.jpg',888,1,'2023-02-13 09:16:00'),(47,29,10904,'华为p40','http://localhost:8080/upload/20230227_11012861.jpg',1,1,'2023-03-05 22:02:23'),(48,30,10904,'华为p40','http://localhost:8080/upload/20230227_11012861.jpg',1,1,'2023-03-05 22:07:03'),(49,31,10904,'华为p40','http://localhost:8080/upload/20230227_11012861.jpg',1,1,'2023-03-06 21:59:59'),(50,32,10903,'耳机','http://localhost:8080/upload/20230227_11044130.jpeg',1,1,'2023-03-07 21:17:15'),(51,33,10904,'华为p40','http://localhost:8080/upload/20230227_11012861.jpg',1,1,'2023-04-12 16:30:44');

/*Table structure for table `shopping_cart_item` */

DROP TABLE IF EXISTS `shopping_cart_item`;

CREATE TABLE `shopping_cart_item` (
  `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物项主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `goods_count` int(11) NOT NULL DEFAULT '1' COMMENT '数量(最大为5)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`cart_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

/*Data for the table `shopping_cart_item` */

insert  into `shopping_cart_item`(`cart_item_id`,`user_id`,`goods_id`,`goods_count`,`is_deleted`,`create_time`,`update_time`) values (69,9,10895,1,1,'2023-02-13 15:05:18','2023-02-13 15:05:18'),(70,10,10897,1,0,'2023-02-15 16:20:48','2023-02-15 16:21:19'),(71,11,10898,3,1,'2023-02-28 17:56:25','2023-02-28 17:57:23'),(77,1,10900,2,1,'2023-02-12 18:23:08','2023-02-12 18:23:27'),(78,1,10899,1,1,'2023-02-12 18:23:15','2023-02-12 18:23:15'),(79,12,10897,2,1,'2023-02-13 09:12:06','2023-02-13 09:13:02'),(80,12,10898,1,1,'2023-02-13 09:12:19','2023-02-13 09:12:19'),(81,12,10899,1,1,'2023-02-13 09:15:54','2023-02-13 09:15:54'),(82,13,10904,1,1,'2023-02-27 10:31:25','2023-02-27 10:43:24'),(83,13,10904,1,1,'2023-03-05 22:02:16','2023-03-05 22:02:16'),(84,13,10903,1,1,'2023-03-05 22:03:38','2023-03-05 22:03:38'),(85,13,10904,1,1,'2023-03-05 22:03:58','2023-03-05 22:05:34'),(86,13,10904,1,1,'2023-03-05 22:04:31','2023-03-05 22:08:23'),(87,13,10903,1,1,'2023-03-05 22:08:02','2023-03-05 22:08:02'),(88,13,10904,1,1,'2023-03-06 21:59:44','2023-03-06 21:59:44'),(89,13,10903,1,1,'2023-03-07 21:04:54','2023-03-07 21:13:39'),(90,13,10904,1,1,'2023-04-12 16:13:52','2023-04-12 16:13:52'),(91,13,10904,1,0,'2023-04-12 16:43:05','2023-04-12 16:51:28');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_name` varchar(11) NOT NULL DEFAULT '' COMMENT '登陆名称(默认为手机号)',
  `password_md5` varchar(32) NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
  `introduce_sign` varchar(100) NOT NULL DEFAULT '' COMMENT '个性签名',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '收货地址',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '注销标识字段(0-正常 1-已注销)',
  `locked_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`nick_name`,`login_name`,`password_md5`,`introduce_sign`,`address`,`is_deleted`,`locked_flag`,`create_time`) values (1,'十三','13700002703','e10adc3949ba59abbe56e057f20f883e','我不怕千万人阻挡，只怕自己投降','杭州市西湖区xx小区x幢419 十三 137xxxx2703',0,0,'2023-02-18 18:18:11'),(6,'测试用户1','13711113333','dda01dc6d334badcd031102be6bee182','测试用户1','上海浦东新区XX路XX号 999 137xxxx7797',0,0,'2023-02-18 18:18:11'),(7,'测试用户2测试用户2测试用户2测试用户2','13811113333','dda01dc6d334badcd031102be6bee182','测试用户2','杭州市西湖区xx小区x幢419 十三 137xxxx2703',0,0,'2023-02-18 18:18:11'),(8,'测试用户3','13911113333','dda01dc6d334badcd031102be6bee182','测试用户3','杭州市西湖区xx小区x幢419 十三 137xxxx2703',0,0,'2023-02-18 18:18:11'),(9,'18386666666','18386666666','e10adc3949ba59abbe56e057f20f883e','','成都市清江西路23号',0,0,'2023-02-18 18:18:11'),(10,'13305503333','13305503333','e10adc3949ba59abbe56e057f20f883e','','北京故宫',0,0,'2023-02-18 18:18:11'),(11,'1999999..','19999999999','e10adc3949ba59abbe56e057f20f883e','面对疾风吧','成都市清江西路23号111',0,0,'2023-02-28 17:55:37'),(12,'18380557998','18380557998','e10adc3949ba59abbe56e057f20f883e','','四川省成都青羊区清江中路40号',0,0,'2023-02-13 09:11:07'),(13,'15589569821','15589569821','e10adc3949ba59abbe56e057f20f883e','','山东省济南市东山花园',0,0,'2023-02-27 10:31:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
