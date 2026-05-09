-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: lejos_de_casa
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(50) NOT NULL,
  `operacion` varchar(50) DEFAULT NULL,
  `usuario_db` varchar(100) DEFAULT NULL,
  `fecha_movimiento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,'Casas','INSERT','root@localhost','2026-03-19 05:06:59','Se creó nueva casa con ID: 11 para el propietario CURP011'),(2,'Casas','UPDATE','root@localhost','2026-03-19 05:06:59','Se actualizó el cupo a 6 y la imagen de la casa con ID: 5'),(3,'Casas','INSERT','root@localhost','2026-03-19 05:17:16','Alta exitosa de propiedad ID: 12 en region 01000'),(5,'Casas','INSERT','root@localhost','2026-03-23 15:47:03',NULL),(6,'Casas','INSERT','root@localhost','2026-03-23 15:49:00','Alta exitosa de propiedad ID: 13 en region 01000');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casas`
--

DROP TABLE IF EXISTS `casas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cupo` int NOT NULL,
  `tipo` enum('Una planta','Dos plantas','Otro tipo') NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `cuartos` int NOT NULL,
  `calle` varchar(100) NOT NULL,
  `num_interior` int NOT NULL,
  `id_region` varchar(10) NOT NULL,
  `id_propietario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_region` (`id_region`),
  KEY `id_propietario` (`id_propietario`),
  CONSTRAINT `casas_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`codigo_postal`),
  CONSTRAINT `casas_ibfk_2` FOREIGN KEY (`id_propietario`) REFERENCES `usuarios` (`curp`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casas`
--

LOCK TABLES `casas` WRITE;
/*!40000 ALTER TABLE `casas` DISABLE KEYS */;
INSERT INTO `casas` VALUES (1,4,'Dos plantas','img1.jpg',3,'Roble',101,'01000','CURP001'),(2,2,'Una planta','img2.jpg',1,'Pino',202,'44100','CURP003'),(3,6,'Otro tipo','img3.jpg',4,'Cedro',303,'64000','CURP004'),(4,3,'Dos plantas','img4.jpg',2,'Sauce',404,'72000','CURP006'),(5,6,'Una planta','img5_new.jpg',3,'Palma',505,'97000','CURP008'),(6,2,'Una planta','img6.jpg',1,'Olmo',606,'01000','CURP009'),(7,8,'Dos plantas','img7.jpg',5,'Fresno',707,'44100','CURP011'),(8,4,'Dos plantas','img8.jpg',3,'Abeto',808,'64000','CURP013'),(9,3,'Una planta','img9.jpg',2,'Alamo',909,'72000','CURP014'),(10,6,'Otro tipo','img10.jpg',4,'Enebro',111,'97000','CURP001'),(11,2,'Una planta','loft_mty.jpg',1,'Calle Falsa',123,'64000','CURP011'),(12,5,'Dos plantas','img11.jpg',4,'Av. Siempre Viva',742,'01000','CURP011'),(13,5,'Dos plantas','img11.jpg',4,'Av.  bade de datos ',742,'01000','CURP011');
/*!40000 ALTER TABLE `casas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contrato_pdf` varchar(255) NOT NULL,
  `vigencia` datetime NOT NULL,
  `id_reserva` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `contrato_pdf` (`contrato_pdf`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES (1,'pdf_reserva_1.pdf','2024-05-07 23:59:59',1),(2,'pdf_reserva_2.pdf','2024-06-15 23:59:59',2),(3,'pdf_reserva_3.pdf','2024-03-05 23:59:59',3),(4,'pdf_reserva_4.pdf','2024-07-25 23:59:59',4),(5,'pdf_reserva_5.pdf','2024-08-10 23:59:59',5),(6,'pdf_reserva_6.pdf','2024-01-20 23:59:59',6),(7,'pdf_reserva_7.pdf','2024-09-12 23:59:59',7);
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('Efectivo','Tarjeta de debito','Tarjeta de credito') NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `estado` enum('Pagado','Pendiente') NOT NULL,
  `feche_pago` datetime NOT NULL,
  `id_reserva` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'Tarjeta de credito',4500.50,'Pagado','2024-04-28 10:00:00',1),(2,'Efectivo',2800.00,'Pagado','2024-06-05 15:30:00',2),(3,'Tarjeta de debito',6000.00,'Pagado','2024-02-25 09:15:00',3),(4,'Tarjeta de credito',3200.00,'Pendiente','2024-07-15 11:00:00',4),(5,'Tarjeta de debito',7500.00,'Pagado','2024-07-28 14:20:00',5),(6,'Efectivo',1950.00,'Pagado','2024-01-10 18:00:00',6),(7,'Tarjeta de credito',8900.00,'Pendiente','2024-09-01 12:00:00',7);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regiones`
--

DROP TABLE IF EXISTS `regiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regiones` (
  `codigo_postal` varchar(10) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_postal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiones`
--

LOCK TABLES `regiones` WRITE;
/*!40000 ALTER TABLE `regiones` DISABLE KEYS */;
INSERT INTO `regiones` VALUES ('01000','CDMX','Álvaro Obregón'),('44100','Jalisco','Guadalajara'),('64000','Nuevo León','Monterrey'),('72000','Puebla','Puebla'),('97000','Yucatán','Mérida');
/*!40000 ALTER TABLE `regiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseniascasas`
--

DROP TABLE IF EXISTS `reseniascasas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseniascasas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calificacion` int NOT NULL,
  `comentario` varchar(300) DEFAULT NULL,
  `id_casa` int NOT NULL,
  `id_calificador` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_casa` (`id_casa`),
  KEY `id_calificador` (`id_calificador`),
  CONSTRAINT `reseniascasas_ibfk_1` FOREIGN KEY (`id_casa`) REFERENCES `casas` (`id`),
  CONSTRAINT `reseniascasas_ibfk_2` FOREIGN KEY (`id_calificador`) REFERENCES `usuarios` (`curp`),
  CONSTRAINT `reseniascasas_chk_1` CHECK ((`calificacion` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseniascasas`
--

LOCK TABLES `reseniascasas` WRITE;
/*!40000 ALTER TABLE `reseniascasas` DISABLE KEYS */;
INSERT INTO `reseniascasas` VALUES (1,5,'La casa de CDMX está increíble, muy céntrica.',1,'CURP002','2026-03-02 09:33:03'),(2,4,'Un poco pequeña pero muy acogedora.',2,'CURP005','2026-03-02 09:33:03'),(3,3,'El aire acondicionado fallaba un poco.',3,'CURP007','2026-03-02 09:33:03'),(4,5,'Vistas espectaculares, volvería sin duda.',4,'CURP010','2026-03-02 09:33:03'),(5,2,'La limpieza dejó mucho que desear.',6,'CURP015','2026-03-02 09:33:03');
/*!40000 ALTER TABLE `reseniascasas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseniasusuario`
--

DROP TABLE IF EXISTS `reseniasusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseniasusuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calificacion` int NOT NULL,
  `comentario` varchar(300) DEFAULT NULL,
  `id_Usuario` varchar(20) NOT NULL,
  `id_calificador` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_Usuario` (`id_Usuario`),
  KEY `id_calificador` (`id_calificador`),
  CONSTRAINT `reseniasusuario_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuarios` (`curp`),
  CONSTRAINT `reseniasusuario_ibfk_2` FOREIGN KEY (`id_calificador`) REFERENCES `usuarios` (`curp`),
  CONSTRAINT `reseniasusuario_chk_1` CHECK ((`calificacion` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseniasusuario`
--

LOCK TABLES `reseniasusuario` WRITE;
/*!40000 ALTER TABLE `reseniasusuario` DISABLE KEYS */;
INSERT INTO `reseniasusuario` VALUES (1,5,'Excelente inquilina, dejó todo impecable.','CURP002','CURP001','2026-03-02 09:33:03'),(2,4,'Muy amable, aunque llegó un poco tarde al check-in.','CURP005','CURP003','2026-03-02 09:33:03'),(3,5,'Trato muy profesional y respetuoso.','CURP007','CURP004','2026-03-02 09:33:03'),(4,3,'Tuve problemas para contactarlo al final.','CURP010','CURP006','2026-03-02 09:33:03'),(5,5,'Huésped ejemplar.','CURP015','CURP009','2026-03-02 09:33:03');
/*!40000 ALTER TABLE `reseniasusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `estado` enum('Activo','Caducado') NOT NULL,
  `id_casa` int NOT NULL,
  `id_comprador` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_casa` (`id_casa`),
  KEY `id_comprador` (`id_comprador`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_casa`) REFERENCES `casas` (`id`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_comprador`) REFERENCES `usuarios` (`curp`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2024-05-01 14:00:00','2024-05-07 11:00:00','Activo',1,'CURP002'),(2,'2024-06-10 14:00:00','2024-06-15 11:00:00','Activo',2,'CURP005'),(3,'2024-03-01 14:00:00','2024-03-05 11:00:00','Caducado',3,'CURP007'),(4,'2024-07-20 14:00:00','2024-07-25 11:00:00','Activo',4,'CURP010'),(5,'2024-08-01 14:00:00','2024-08-10 11:00:00','Activo',5,'CURP012'),(6,'2024-01-15 14:00:00','2024-01-22 12:00:00','Caducado',6,'CURP015'),(7,'2024-09-05 14:00:00','2024-09-12 11:00:00','Activo',7,'CURP003');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `curp` varchar(20) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `rol` enum('vendedor','comprador','ambos') NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `calle` varchar(100) NOT NULL,
  `num_interior` int NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `municipio` varchar(50) NOT NULL,
  PRIMARY KEY (`curp`),
  UNIQUE KEY `curp` (`curp`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `telefono` (`telefono`),
  CONSTRAINT `usuarios_chk_1` CHECK ((`correo` like _utf8mb4'%@%.%'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('CURP001','Juan','Pérez','juan@mail.com','5550001','vendedor','2026-03-02 09:33:03','Av. Reforma',10,'01000','CDMX','Álvaro Obregón'),('CURP002','María','García','maria@mail.com','5550002','comprador','2026-03-02 09:33:03','Calle 5',20,'44100','Guadalajara','Guadalajara'),('CURP003','Carlos','Rodríguez','carlos@mail.com','5550003','ambos','2026-03-02 09:33:03','Hidalgo',5,'64000','Monterrey','Monterrey'),('CURP004','Ana','Martínez','ana@mail.com','5550004','vendedor','2026-03-02 09:33:03','Juárez',15,'72000','Puebla','Puebla'),('CURP005','Luis','Hernández','luis@mail.com','5550005','comprador','2026-03-02 09:33:03','Madero',8,'97000','Mérida','Mérida'),('CURP006','Elena','López','elena@mail.com','5550006','vendedor','2026-03-02 09:33:03','Constitución',12,'01000','CDMX','Álvaro Obregón'),('CURP007','Pedro','Sánchez','pedro@mail.com','5550007','comprador','2026-03-02 09:33:03','Independencia',3,'44100','Guadalajara','Guadalajara'),('CURP008','Sofía','Ramírez','sofia@mail.com','5550008','ambos','2026-03-02 09:33:03','Morelos',101,'64000','Monterrey','Monterrey'),('CURP009','Jorge','Flores','jorge@mail.com','555090','vendedor','2026-03-02 09:33:03','Serdán',45,'72000','Puebla','Puebla'),('CURP010','Lucía','Torres','lucia@mail.com','5550100','comprador','2026-03-02 09:33:03','Montejo',22,'97000','Mérida','Mérida'),('CURP011','Miguel','Vázquez','miguel@mail.com','5550111','vendedor','2026-03-02 09:33:03','Insurgentes',500,'01000','CDMX','Álvaro Obregón'),('CURP012','Laura','Gómez','laura@mail.com','5550112','comprador','2026-03-02 09:33:03','Vallarta',33,'44100','Guadalajara','Guadalajara'),('CURP013','Diego','Díaz','diego@mail.com','5550113','ambos','2026-03-02 09:33:03','Garza Sada',88,'64000','Monterrey','Monterrey'),('CURP014','Rosa','Morales','rosa@mail.com','5550114','vendedor','2026-03-02 09:33:03','Revolución',9,'72000','Puebla','Puebla'),('CURP015','Oscar','Reyes','oscar@mail.com','5550115','comprador','2026-03-02 09:33:03','Calle 60',110,'97000','Mérida','Mérida'),('CURP016','Jorge','','prueba@mail.com','5550116','comprador','2026-03-02 09:33:03','Calle 60',110,'97000','Mérida','Mérida');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_casas_clientes_ubicacion`
--

DROP TABLE IF EXISTS `vw_casas_clientes_ubicacion`;
/*!50001 DROP VIEW IF EXISTS `vw_casas_clientes_ubicacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_casas_clientes_ubicacion` AS SELECT 
 1 AS `protierario`,
 1 AS `id_casa`,
 1 AS `calle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_casas_disponibles`
--

DROP TABLE IF EXISTS `vw_casas_disponibles`;
/*!50001 DROP VIEW IF EXISTS `vw_casas_disponibles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_casas_disponibles` AS SELECT 
 1 AS `id_Casas_disponibles`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pagos_pendientes`
--

DROP TABLE IF EXISTS `vw_pagos_pendientes`;
/*!50001 DROP VIEW IF EXISTS `vw_pagos_pendientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pagos_pendientes` AS SELECT 
 1 AS `id_pago`,
 1 AS `cliente`,
 1 AS `telefono`,
 1 AS `direccion_casa`,
 1 AS `monto_deuda`,
 1 AS `inicio_estancia`,
 1 AS `fin_estancia`,
 1 AS `archivo_contrato`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_casas_clientes_ubicacion`
--

/*!50001 DROP VIEW IF EXISTS `vw_casas_clientes_ubicacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_casas_clientes_ubicacion` AS select `u`.`nombres` AS `protierario`,`casas`.`id` AS `id_casa`,`u`.`calle` AS `calle` from (`casas` join `usuarios` `u` on((`u`.`curp` = `casas`.`id_propietario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_casas_disponibles`
--

/*!50001 DROP VIEW IF EXISTS `vw_casas_disponibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_casas_disponibles` AS select `c`.`id` AS `id_Casas_disponibles` from `casas` `c` where `c`.`id` in (select `reservas`.`id_casa` from `reservas` where (`reservas`.`estado` = 'Activo')) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pagos_pendientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_pagos_pendientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pagos_pendientes` AS select `p`.`id` AS `id_pago`,`u`.`nombres` AS `cliente`,`u`.`telefono` AS `telefono`,`c`.`calle` AS `direccion_casa`,`p`.`cantidad` AS `monto_deuda`,`r`.`fecha_inicio` AS `inicio_estancia`,`r`.`fecha_fin` AS `fin_estancia`,`con`.`contrato_pdf` AS `archivo_contrato`,`p`.`estado` AS `estado` from ((((`pagos` `p` join `reservas` `r` on((`p`.`id_reserva` = `r`.`id`))) join `usuarios` `u` on((`r`.`id_comprador` = `u`.`curp`))) join `casas` `c` on((`r`.`id_casa` = `c`.`id`))) left join `contratos` `con` on((`r`.`id` = `con`.`id_reserva`))) where (`p`.`estado` = 'Pendiente') */;
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

-- Dump completed on 2026-03-26 17:25:01
