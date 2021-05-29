-- MySQL dump 10.13  Distrib 8.0.23, for osx10.16 (x86_64)
--
-- Host: localhost    Database: desafio21dias
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `tipo` tinyint DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Danilo','323232','34343434',1),(3,'Lana','333323223','3232232',2),(4,'danilo desafio 21 dias','33333333333','(11)9999-9999',2);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes_enderecos`
--

DROP TABLE IF EXISTS `clientes_enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_enderecos` (
  `cliente_id` int NOT NULL,
  `endereco_id` int NOT NULL,
  KEY `id_idx` (`cliente_id`),
  KEY `id_idx1` (`endereco_id`),
  CONSTRAINT `clientes_clientes_enderecos` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `enderecos_clientes_enderecos` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_enderecos`
--

LOCK TABLES `clientes_enderecos` WRITE;
/*!40000 ALTER TABLE `clientes_enderecos` DISABLE KEYS */;
INSERT INTO `clientes_enderecos` VALUES (1,1),(1,2),(3,1);
/*!40000 ALTER TABLE `clientes_enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) NOT NULL,
  `numero` int NOT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `complemento` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,'Rua primavera',111,'000000-99','São Bento','ba',''),(2,'Rua primavera',33,'000000-99','São Bento','ba','');
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `identificacao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Leandro','3233222','001'),(2,'Pamela','344421','002'),(3,'Wagner','8953999','003'),(4,'Rafael Marques','(11)9999-9999','004'),(5,'Rafa El','(11)9999-9999',NULL),(6,'Maria','(11)9999-9999',NULL);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor_total` float NOT NULL,
  `data_pedido` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_entrega` datetime DEFAULT NULL,
  `observacao` text,
  `endereco_id` int NOT NULL,
  `forma_de_pagamento` varchar(100) NOT NULL,
  `cliente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enderecos_pedidos_idx` (`endereco_id`),
  KEY `clientes_pedidos_idx` (`cliente_id`),
  CONSTRAINT `clientes_pedidos` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `enderecos_pedidos` FOREIGN KEY (`endereco_id`) REFERENCES `enderecos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (2,45,'2021-05-16 06:56:33',NULL,NULL,1,'a vista',1),(3,36,'2021-05-17 05:59:00',NULL,NULL,1,'parcelado',3),(4,10,'2021-05-18 05:59:00',NULL,NULL,1,'a vista',1),(5,5,'2021-05-18 05:59:00',NULL,NULL,1,'parcelado',1),(6,0,'2021-05-18 05:59:00',NULL,NULL,1,'a vista',3),(7,210,'2021-05-18 05:59:00',NULL,NULL,1,'a vista',3);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_produtos`
--

DROP TABLE IF EXISTS `pedidos_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `valor` float NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `produtos_pedidos_produtos_idx` (`produto_id`),
  KEY `pedidos_pedidos_produtos_idx` (`pedido_id`),
  CONSTRAINT `pedidos_pedidos_produtos` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  CONSTRAINT `produtos_pedidos_produtos` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_produtos`
--

LOCK TABLES `pedidos_produtos` WRITE;
/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
INSERT INTO `pedidos_produtos` VALUES (2,2,1,10,1),(3,2,2,35,1),(4,3,1,10,2),(5,6,1,11,5),(6,7,1,12,10),(7,7,1,10,2),(8,7,2,35,1),(9,7,1,10,1),(11,7,1,12,1),(12,7,1,13,1);
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_insert_valor_total_pedido` AFTER INSERT ON `pedidos_produtos` FOR EACH ROW BEGIN
	declare valor_calculado float;

	set valor_calculado = (select sum(pp.valor * pp.quantidade) from pedidos_produtos pp where pp.pedido_id = NEW.pedido_id);
    
	update  pedidos set valor_total = valor_calculado where id = NEW.pedido_id;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_update_valor_total_pedido` AFTER UPDATE ON `pedidos_produtos` FOR EACH ROW BEGIN
	declare valor_calculado float;

	set valor_calculado = (select sum(pp.valor * pp.quantidade) from pedidos_produtos pp where pp.pedido_id = NEW.pedido_id);
    
	update  pedidos set valor_total = valor_calculado where id = NEW.pedido_id;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_delete_valor_total_pedido` AFTER DELETE ON `pedidos_produtos` FOR EACH ROW BEGIN
	declare valor_calculado float;

	set valor_calculado = (select sum(pp.valor * pp.quantidade) from pedidos_produtos pp where pp.pedido_id = OLD.pedido_id);
    
	update  pedidos set valor_total = valor_calculado where id = OLD.pedido_id;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `valor` float NOT NULL,
  `quantidade` int NOT NULL,
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Alcool em gel','Um alcool para acabar as bactérias',10,5,'2021-05-16 06:51:32','2021-05-16 06:51:32'),(2,'Garrafa do torne-se um programador','Uma garrafa linda para que você possa se hidratar nos momentos em que estiver programamando',35,100,'2021-05-16 06:53:00','2021-05-16 06:53:00'),(3,'Camiseta do torne-se um programador','Este é o nosso manto sagrada',45,200,'2021-05-16 06:53:49','2021-05-16 06:53:49');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wp_relatorio_clientes_pedidos`
--

DROP TABLE IF EXISTS `wp_relatorio_clientes_pedidos`;
/*!50001 DROP VIEW IF EXISTS `wp_relatorio_clientes_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wp_relatorio_clientes_pedidos` AS SELECT 
 1 AS `cliente_id`,
 1 AS `nome`,
 1 AS `telefone`,
 1 AS `pedido_id`,
 1 AS `data_pedido`,
 1 AS `valor_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `wp_relatorio_clientes_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `wp_relatorio_clientes_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wp_relatorio_clientes_pedidos` AS select `clientes`.`id` AS `cliente_id`,`clientes`.`nome` AS `nome`,`clientes`.`telefone` AS `telefone`,`pedidos`.`id` AS `pedido_id`,`pedidos`.`data_pedido` AS `data_pedido`,`pedidos`.`valor_total` AS `valor_total` from ((`clientes` join `pedidos` on((`pedidos`.`cliente_id` = `clientes`.`id`))) join `pedidos_produtos` on((`pedidos_produtos`.`pedido_id` = `pedidos`.`id`))) limit 2000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-29  7:12:07
