-- MySQL dump 10.13  Distrib 8.0.34, for macos14.0 (x86_64)
--
-- Host: 127.0.0.1    Database: second_hand_trading
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sh_address`
--

DROP TABLE IF EXISTS `sh_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consignee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `consignee_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人手机号',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `region_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `detail_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `default_flag` tinyint NOT NULL COMMENT '是否默认地址',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_address`
--

LOCK TABLES `sh_address` WRITE;
/*!40000 ALTER TABLE `sh_address` DISABLE KEYS */;
INSERT INTO `sh_address` VALUES (1,'user9','13011110009','江苏省','南通市','崇川区','花园一单元一号楼',1,10),(2,'user8','13011110008','江苏省','南通市','崇川区','888',1,9),(27,'MZ','13011110000','河南省','新乡市','原阳县','测试测试',1,1),(28,'1211111111','1212','天津市','市辖区','河东区','212',1,2),(29,'下雨','1788888888','天津市','市辖区','河西区','北京',1,3);
/*!40000 ALTER TABLE `sh_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_admin`
--

DROP TABLE IF EXISTS `sh_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `admin_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名字',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_number` (`account_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_admin`
--

LOCK TABLES `sh_admin` WRITE;
/*!40000 ALTER TABLE `sh_admin` DISABLE KEYS */;
INSERT INTO `sh_admin` VALUES (1,'admin','admin','超级管理员');
/*!40000 ALTER TABLE `sh_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_favorite`
--

DROP TABLE IF EXISTS `sh_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_favorite` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `create_time` datetime NOT NULL COMMENT '加入收藏的时间',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`idle_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_favorite`
--

LOCK TABLES `sh_favorite` WRITE;
/*!40000 ALTER TABLE `sh_favorite` DISABLE KEYS */;
INSERT INTO `sh_favorite` VALUES (42,'2021-09-02 07:21:59',9,80),(43,'2022-10-22 22:20:08',4,90),(44,'2023-01-08 10:23:09',3,93),(45,'2023-01-08 17:56:57',3,98),(46,'2023-01-08 17:58:11',3,97);
/*!40000 ALTER TABLE `sh_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_idle_item`
--

DROP TABLE IF EXISTS `sh_idle_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_idle_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `idle_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '闲置物名称',
  `idle_details` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `picture_list` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图集',
  `idle_price` decimal(10,2) NOT NULL COMMENT '价格',
  `idle_place` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发货地区',
  `idle_label` int NOT NULL COMMENT '分类标签',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `idle_status` tinyint NOT NULL COMMENT '状态（发布1、下架2、删除0）',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_idle_item`
--

LOCK TABLES `sh_idle_item` WRITE;
/*!40000 ALTER TABLE `sh_idle_item` DISABLE KEYS */;
INSERT INTO `sh_idle_item` VALUES (100,'考研单词书','考研英语单词书','[\"http://localhost:8080/image?imageName=file16978648724621003file16512155298881002考研单词书.jpg\"]',10.00,'杭州市',4,'2023-10-21 05:09:40',1,11);
/*!40000 ALTER TABLE `sh_idle_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_message`
--

DROP TABLE IF EXISTS `sh_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_message` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置主键id',
  `content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `to_user` bigint NOT NULL COMMENT '所回复的用户',
  `to_message` bigint DEFAULT NULL COMMENT '所回复的留言',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE,
  KEY `idle_id_index` (`idle_id`) USING BTREE,
  KEY `to_user_index` (`to_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_message`
--

LOCK TABLES `sh_message` WRITE;
/*!40000 ALTER TABLE `sh_message` DISABLE KEYS */;
INSERT INTO `sh_message` VALUES (34,1,27,'测试测试','2021-09-03 01:24:00',7,NULL),(35,2,3,'测试测试','2021-09-10 00:55:32',1,NULL),(36,2,82,'俺想要','2022-08-09 20:30:12',2,NULL),(37,4,90,'一寸光阴一寸金，寸金难买寸光阴。','2022-10-22 22:18:53',3,NULL),(38,2,97,'不错不错','2023-01-08 15:50:23',2,NULL),(39,2,95,'我喜欢这个自行车，请问怎么进行提货啊','2023-01-08 17:53:13',2,NULL),(40,3,98,'你这个电风扇很不错啊，我很喜欢','2023-01-08 17:56:46',2,NULL),(41,3,97,'喜欢','2023-01-08 17:58:40',2,38),(42,2,97,'眼光不错','2023-01-08 18:00:23',3,41),(43,11,100,'想要','2023-10-21 05:09:48',11,NULL);
/*!40000 ALTER TABLE `sh_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_order`
--

DROP TABLE IF EXISTS `sh_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物品主键id',
  `order_price` decimal(10,2) NOT NULL COMMENT '订单总价',
  `payment_status` tinyint NOT NULL COMMENT '支付状态',
  `payment_way` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint NOT NULL COMMENT '订单状态',
  `is_deleted` tinyint DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_order`
--

LOCK TABLES `sh_order` WRITE;
/*!40000 ALTER TABLE `sh_order` DISABLE KEYS */;
INSERT INTO `sh_order` VALUES (65,'166644845940310002',2,89,52.00,0,NULL,'2022-10-22 22:20:59',NULL,4,NULL),(66,'166644847386610003',2,90,100.00,0,NULL,'2022-10-22 22:21:13',NULL,4,NULL),(73,'167316390306810008',2,91,20.00,0,NULL,'2023-01-08 15:45:03',NULL,4,NULL),(74,'167316390677010009',2,90,100.00,0,NULL,'2023-01-08 15:45:06',NULL,4,NULL),(75,'167316391048610010',2,87,52.00,0,NULL,'2023-01-08 15:45:10',NULL,4,NULL),(76,'167317079822610011',2,91,20.00,0,NULL,'2023-01-08 17:39:58',NULL,0,NULL),(77,'167317080313310012',2,90,100.00,0,NULL,'2023-01-08 17:40:03',NULL,0,NULL),(78,'167317080721110013',2,87,52.00,0,NULL,'2023-01-08 17:40:07',NULL,0,NULL),(79,'167317197510610014',3,98,30.00,1,'支付宝','2023-01-08 17:59:35','2023-01-08 17:59:39',2,NULL);
/*!40000 ALTER TABLE `sh_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_order_address`
--

DROP TABLE IF EXISTS `sh_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_order_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `consignee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `orderId` (`order_id`) USING BTREE,
  KEY `order_id_index` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_order_address`
--

LOCK TABLES `sh_order_address` WRITE;
/*!40000 ALTER TABLE `sh_order_address` DISABLE KEYS */;
INSERT INTO `sh_order_address` VALUES (1,58,'user9','13011110009','江苏省南通市崇川区花园一单元一号楼'),(2,59,'user8','13011110008','江苏省南通市崇川区888'),(3,60,'user9','13011110009','江苏省南通市崇川区花园一单元一号楼'),(4,62,'MZ','13011110000','河南省新乡市原阳县测试测试'),(5,61,'MZ','13011110000','河南省新乡市原阳县测试测试'),(6,63,'1211111111','1212','天津市市辖区河东区212'),(7,64,'1211111111','1212','天津市市辖区河东区212'),(8,65,'1211111111','1212','天津市市辖区河东区212'),(9,66,'1211111111','1212','天津市市辖区河东区212'),(10,73,'1211111111','1212','天津市市辖区河东区212'),(11,74,'1211111111','1212','天津市市辖区河东区212'),(12,75,'1211111111','1212','天津市市辖区河东区212'),(13,76,'1211111111','1212','天津市市辖区河东区212'),(14,77,'1211111111','1212','天津市市辖区河东区212'),(15,78,'1211111111','1212','天津市市辖区河东区212'),(16,79,'下雨','1788888888','天津市市辖区河西区北京');
/*!40000 ALTER TABLE `sh_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sh_user`
--

DROP TABLE IF EXISTS `sh_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sh_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号（手机号）',
  `user_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `sign_in_time` datetime NOT NULL COMMENT '注册时间',
  `user_status` tinyint DEFAULT NULL COMMENT '状态（1代表封禁）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_number` (`account_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sh_user`
--

LOCK TABLES `sh_user` WRITE;
/*!40000 ALTER TABLE `sh_user` DISABLE KEYS */;
INSERT INTO `sh_user` VALUES (11,'zhangsan','123456','张三','http://localhost:8080/image?imageName=file16978643530321002avtor.jpg','2023-10-21 04:50:14',NULL);
/*!40000 ALTER TABLE `sh_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-21 13:21:27
