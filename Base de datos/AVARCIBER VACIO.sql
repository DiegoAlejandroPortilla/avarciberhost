-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: monorail.proxy.rlwy.net    Database: railway
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_activo`
--

DROP TABLE IF EXISTS `act_activo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_activo` (
  `ACT_CODIGO` int NOT NULL AUTO_INCREMENT,
  `TAC_CODIGO` int NOT NULL,
  `ACT_ACT_CODIGO` int DEFAULT NULL,
  `ACT_FECHA_INICIO` datetime NOT NULL,
  `ACT_IDENTIFICACION` varchar(20) NOT NULL,
  `ACT_NOMBRE` varchar(50) NOT NULL,
  `ACT_DESCRIPCION` varchar(250) NOT NULL,
  `ACT_FECHA_INACTIVIDAD` datetime DEFAULT NULL,
  `ACT_OBSERVACION` text NOT NULL,
  `ACT_VALOR` int NOT NULL,
  PRIMARY KEY (`ACT_CODIGO`),
  KEY `FK_RELATIONSHIP_21` (`TAC_CODIGO`),
  KEY `FK_RELATIONSHIP_5` (`ACT_ACT_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_21` FOREIGN KEY (`TAC_CODIGO`) REFERENCES `tac_tipoactivo` (`TAC_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`ACT_ACT_CODIGO`) REFERENCES `act_activo` (`ACT_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_activo`
--

LOCK TABLES `act_activo` WRITE;
/*!40000 ALTER TABLE `act_activo` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_activo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ame_amenaza`
--

DROP TABLE IF EXISTS `ame_amenaza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ame_amenaza` (
  `AME_CODIGO` int NOT NULL AUTO_INCREMENT,
  `TIA_CODIGO` int DEFAULT NULL,
  `PRO_CODIGO` int DEFAULT NULL,
  `AME_FECHA_INICIO` datetime NOT NULL,
  `AME_IDENTIFICACION` varchar(20) NOT NULL,
  `AME_NOMBRE` varchar(50) NOT NULL,
  `AME_DESCRIPCION` varchar(250) NOT NULL,
  `AME_FEHCA_INACTIVIDAD` datetime NOT NULL,
  `AME_OBSERVACION` text NOT NULL,
  PRIMARY KEY (`AME_CODIGO`),
  KEY `FK_RELATIONSHIP_18` (`PRO_CODIGO`),
  KEY `FK_RELATIONSHIP_8` (`TIA_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_18` FOREIGN KEY (`PRO_CODIGO`) REFERENCES `pro_probabilidad` (`PRO_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`TIA_CODIGO`) REFERENCES `tia_tipoamenaza` (`TIA_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ame_amenaza`
--

LOCK TABLES `ame_amenaza` WRITE;
/*!40000 ALTER TABLE `ame_amenaza` DISABLE KEYS */;
/*!40000 ALTER TABLE `ame_amenaza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amv_amenazavulnerabilidad`
--

DROP TABLE IF EXISTS `amv_amenazavulnerabilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amv_amenazavulnerabilidad` (
  `VUL_CODIGO` int NOT NULL,
  `AME_CODIGO` int NOT NULL,
  `AMV_PROBABILIDAD` varchar(20) DEFAULT NULL,
  `AMV_FECHA_INICION` datetime DEFAULT NULL,
  `AMV_FECHA_INACTIVIDAD` datetime DEFAULT NULL,
  `AMV_VALOR_DANO_PROMEDIO` decimal(6,2) DEFAULT NULL,
  KEY `VUL_CODIGO` (`VUL_CODIGO`),
  KEY `AME_CODIGO` (`AME_CODIGO`),
  CONSTRAINT `amv_amenazavulnerabilidad_ibfk_1` FOREIGN KEY (`VUL_CODIGO`) REFERENCES `vul_vulnerabilidad` (`VUL_CODIGO`),
  CONSTRAINT `amv_amenazavulnerabilidad_ibfk_2` FOREIGN KEY (`AME_CODIGO`) REFERENCES `ame_amenaza` (`AME_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amv_amenazavulnerabilidad`
--

LOCK TABLES `amv_amenazavulnerabilidad` WRITE;
/*!40000 ALTER TABLE `amv_amenazavulnerabilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `amv_amenazavulnerabilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_categoria`
--

DROP TABLE IF EXISTS `cat_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cat_categoria` (
  `CAT_CODIGO` int NOT NULL AUTO_INCREMENT,
  `CAT_NOMBRE` varchar(50) NOT NULL,
  `CAT_DESCRIPCION` varchar(250) NOT NULL,
  PRIMARY KEY (`CAT_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_categoria`
--

LOCK TABLES `cat_categoria` WRITE;
/*!40000 ALTER TABLE `cat_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `con_contramedida`
--

DROP TABLE IF EXISTS `con_contramedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `con_contramedida` (
  `CON_CODIGO` int NOT NULL AUTO_INCREMENT,
  `CON_FECHA_INICIO` datetime NOT NULL,
  `CON_IDENTIFICACION` varchar(20) NOT NULL,
  `CON_NOMBRE` varchar(50) NOT NULL,
  `CON_DESCRIPCION` varchar(250) NOT NULL,
  `CON_OBSERVACION` text NOT NULL,
  `CON_FECHA_INACTIVIDAD` datetime NOT NULL,
  PRIMARY KEY (`CON_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `con_contramedida`
--

LOCK TABLES `con_contramedida` WRITE;
/*!40000 ALTER TABLE `con_contramedida` DISABLE KEYS */;
/*!40000 ALTER TABLE `con_contramedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `div_dimensionvaloracion`
--

DROP TABLE IF EXISTS `div_dimensionvaloracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `div_dimensionvaloracion` (
  `DIV_CODIGO` int NOT NULL AUTO_INCREMENT,
  `DIV_NOMBRE` varchar(50) NOT NULL,
  `DIV_DESCRIPCION` varchar(250) NOT NULL,
  PRIMARY KEY (`DIV_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `div_dimensionvaloracion`
--

LOCK TABLES `div_dimensionvaloracion` WRITE;
/*!40000 ALTER TABLE `div_dimensionvaloracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `div_dimensionvaloracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_empresa`
--

DROP TABLE IF EXISTS `emp_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_empresa` (
  `EMP_CODIGO` int NOT NULL AUTO_INCREMENT,
  `EMP_NOMBRE` varchar(50) NOT NULL,
  `EMP_DESCRIPCION` varchar(200) NOT NULL,
  `EMP_CAMPO` varchar(200) NOT NULL,
  `EMP_LOGO` longblob NOT NULL,
  PRIMARY KEY (`EMP_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_empresa`
--

LOCK TABLES `emp_empresa` WRITE;
/*!40000 ALTER TABLE `emp_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inc_incidente`
--

DROP TABLE IF EXISTS `inc_incidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inc_incidente` (
  `INC_CODIGO` int NOT NULL AUTO_INCREMENT,
  `INC_FECHA` datetime NOT NULL,
  `INC_IDENTIFICAION` varchar(20) NOT NULL,
  `INC_NOMBRE` varchar(50) NOT NULL,
  `INC_DESCRIPCION` varchar(250) NOT NULL,
  `INC_OBSERVACION` text NOT NULL,
  PRIMARY KEY (`INC_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_incidente`
--

LOCK TABLES `inc_incidente` WRITE;
/*!40000 ALTER TABLE `inc_incidente` DISABLE KEYS */;
/*!40000 ALTER TABLE `inc_incidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_probabilidad`
--

DROP TABLE IF EXISTS `pro_probabilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pro_probabilidad` (
  `PRO_CODIGO` int NOT NULL AUTO_INCREMENT,
  `AME_CODIGO` int DEFAULT NULL,
  `PRO_PROBABILIDAD` varchar(50) NOT NULL,
  `PRO_RANGOS` varchar(50) NOT NULL,
  `PRO_VALOR` varchar(50) NOT NULL,
  `PRO_FRECUENCIA` varchar(50) NOT NULL,
  PRIMARY KEY (`PRO_CODIGO`),
  KEY `FK_RELATIONSHIP_19` (`AME_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_19` FOREIGN KEY (`AME_CODIGO`) REFERENCES `ame_amenaza` (`AME_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_probabilidad`
--

LOCK TABLES `pro_probabilidad` WRITE;
/*!40000 ALTER TABLE `pro_probabilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_probabilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_11`
--

DROP TABLE IF EXISTS `relationship_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationship_11` (
  `VUL_CODIGO` int NOT NULL,
  `CON_CODIGO` int NOT NULL,
  PRIMARY KEY (`VUL_CODIGO`,`CON_CODIGO`),
  KEY `FK_RELATIONSHIP_15` (`CON_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_14` FOREIGN KEY (`VUL_CODIGO`) REFERENCES `vul_vulnerabilidad` (`VUL_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_15` FOREIGN KEY (`CON_CODIGO`) REFERENCES `con_contramedida` (`CON_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_11`
--

LOCK TABLES `relationship_11` WRITE;
/*!40000 ALTER TABLE `relationship_11` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_2`
--

DROP TABLE IF EXISTS `relationship_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationship_2` (
  `UNI_CODIGO` int NOT NULL,
  `ACT_CODIGO` int NOT NULL,
  PRIMARY KEY (`UNI_CODIGO`,`ACT_CODIGO`),
  KEY `FK_RELATIONSHIP_3` (`ACT_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`UNI_CODIGO`) REFERENCES `uni_unidad` (`UNI_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ACT_CODIGO`) REFERENCES `act_activo` (`ACT_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_2`
--

LOCK TABLES `relationship_2` WRITE;
/*!40000 ALTER TABLE `relationship_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_8`
--

DROP TABLE IF EXISTS `relationship_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationship_8` (
  `AME_CODIGO` int NOT NULL,
  `CAT_CODIGO` int NOT NULL,
  PRIMARY KEY (`AME_CODIGO`,`CAT_CODIGO`),
  KEY `FK_RELATIONSHIP_10` (`CAT_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`CAT_CODIGO`) REFERENCES `cat_categoria` (`CAT_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`AME_CODIGO`) REFERENCES `ame_amenaza` (`AME_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_8`
--

LOCK TABLES `relationship_8` WRITE;
/*!40000 ALTER TABLE `relationship_8` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_9`
--

DROP TABLE IF EXISTS `relationship_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationship_9` (
  `AME_CODIGO` int NOT NULL,
  `INC_CODIGO` int NOT NULL,
  PRIMARY KEY (`AME_CODIGO`,`INC_CODIGO`),
  KEY `FK_RELATIONSHIP_12` (`INC_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`AME_CODIGO`) REFERENCES `ame_amenaza` (`AME_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`INC_CODIGO`) REFERENCES `inc_incidente` (`INC_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_9`
--

LOCK TABLES `relationship_9` WRITE;
/*!40000 ALTER TABLE `relationship_9` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tac_tipoactivo`
--

DROP TABLE IF EXISTS `tac_tipoactivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tac_tipoactivo` (
  `TAC_CODIGO` int NOT NULL AUTO_INCREMENT,
  `TAC_DESCRIPCION` varchar(250) NOT NULL,
  PRIMARY KEY (`TAC_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tac_tipoactivo`
--

LOCK TABLES `tac_tipoactivo` WRITE;
/*!40000 ALTER TABLE `tac_tipoactivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tac_tipoactivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tia_tipoamenaza`
--

DROP TABLE IF EXISTS `tia_tipoamenaza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tia_tipoamenaza` (
  `TIA_CODIGO` int NOT NULL AUTO_INCREMENT,
  `TIA_DESCRIPCION` varchar(250) NOT NULL,
  PRIMARY KEY (`TIA_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tia_tipoamenaza`
--

LOCK TABLES `tia_tipoamenaza` WRITE;
/*!40000 ALTER TABLE `tia_tipoamenaza` DISABLE KEYS */;
/*!40000 ALTER TABLE `tia_tipoamenaza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvu_tipovulnerabilidad`
--

DROP TABLE IF EXISTS `tvu_tipovulnerabilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvu_tipovulnerabilidad` (
  `TVU_CODIGO` int NOT NULL AUTO_INCREMENT,
  `TVU_DESCRIPCION` varchar(250) NOT NULL,
  PRIMARY KEY (`TVU_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvu_tipovulnerabilidad`
--

LOCK TABLES `tvu_tipovulnerabilidad` WRITE;
/*!40000 ALTER TABLE `tvu_tipovulnerabilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvu_tipovulnerabilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uni_unidad`
--

DROP TABLE IF EXISTS `uni_unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uni_unidad` (
  `UNI_CODIGO` int NOT NULL AUTO_INCREMENT,
  `EMP_CODIGO` int DEFAULT NULL,
  `UNI_NOMBRE` varchar(50) NOT NULL,
  PRIMARY KEY (`UNI_CODIGO`),
  KEY `FK_RELATIONSHIP_16` (`EMP_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_16` FOREIGN KEY (`EMP_CODIGO`) REFERENCES `emp_empresa` (`EMP_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uni_unidad`
--

LOCK TABLES `uni_unidad` WRITE;
/*!40000 ALTER TABLE `uni_unidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `uni_unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usu_usuarios`
--

DROP TABLE IF EXISTS `usu_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usu_usuarios` (
  `USU_CODIGO` int NOT NULL AUTO_INCREMENT,
  `UNI_CODIGO` int DEFAULT NULL,
  `USU_NOMBRE` varchar(50) NOT NULL,
  `USU_APELLIDO` varchar(50) NOT NULL,
  `USU_ROL` varchar(50) NOT NULL,
  `USU_PASSWORD` varchar(200) NOT NULL,
  `USU_EMAIL` varchar(50) NOT NULL,
  PRIMARY KEY (`USU_CODIGO`),
  KEY `FK_RELATIONSHIP_20` (`UNI_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_20` FOREIGN KEY (`UNI_CODIGO`) REFERENCES `uni_unidad` (`UNI_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usu_usuarios`
--

LOCK TABLES `usu_usuarios` WRITE;
/*!40000 ALTER TABLE `usu_usuarios` DISABLE KEYS */;
INSERT INTO `usu_usuarios` VALUES (11,NULL,'Diego','Portilla','usuario','$2a$10$ZlJ1WmUYTOOFTVvSBBAZh.k1p9tQznL38al5HwHRC8Zpr0.lf6jsG','daportilla1@espe.edu.ec');
/*!40000 ALTER TABLE `usu_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vac_vulnerabilidadactivo`
--

DROP TABLE IF EXISTS `vac_vulnerabilidadactivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vac_vulnerabilidadactivo` (
  `VUL_CODIGO` int DEFAULT NULL,
  `ACT_CODIGO` int DEFAULT NULL,
  `VAC_COSTO` decimal(10,2) DEFAULT NULL,
  `VAC_FECHA_INICIO` timestamp NULL DEFAULT NULL,
  `VAC_FECHA_INACTIVIDAD` timestamp NULL DEFAULT NULL,
  KEY `VUL_CODIGO` (`VUL_CODIGO`),
  KEY `ACT_CODIGO` (`ACT_CODIGO`),
  CONSTRAINT `vac_vulnerabilidadactivo_ibfk_1` FOREIGN KEY (`VUL_CODIGO`) REFERENCES `vul_vulnerabilidad` (`VUL_CODIGO`),
  CONSTRAINT `vac_vulnerabilidadactivo_ibfk_2` FOREIGN KEY (`ACT_CODIGO`) REFERENCES `act_activo` (`ACT_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vac_vulnerabilidadactivo`
--

LOCK TABLES `vac_vulnerabilidadactivo` WRITE;
/*!40000 ALTER TABLE `vac_vulnerabilidadactivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vac_vulnerabilidadactivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vai_valorimpacto`
--

DROP TABLE IF EXISTS `vai_valorimpacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vai_valorimpacto` (
  `VAI_CODIGO` int NOT NULL AUTO_INCREMENT,
  `DIV_CODIGO` int DEFAULT NULL,
  `VUL_CODIGO` int DEFAULT NULL,
  `ACT_CODIGO` int DEFAULT NULL,
  `VAI_FECHA` datetime NOT NULL,
  `VAI_VALOR` decimal(10,2) NOT NULL,
  PRIMARY KEY (`VAI_CODIGO`),
  KEY `FK_RELATIONSHIP_4` (`ACT_CODIGO`),
  KEY `FK_RELATIONSHIP_6` (`DIV_CODIGO`),
  KEY `FK_RELATIONSHIP_7` (`VUL_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`ACT_CODIGO`) REFERENCES `act_activo` (`ACT_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`DIV_CODIGO`) REFERENCES `div_dimensionvaloracion` (`DIV_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`VUL_CODIGO`) REFERENCES `vul_vulnerabilidad` (`VUL_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vai_valorimpacto`
--

LOCK TABLES `vai_valorimpacto` WRITE;
/*!40000 ALTER TABLE `vai_valorimpacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `vai_valorimpacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `val_rangos`
--

DROP TABLE IF EXISTS `val_rangos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `val_rangos` (
  `VAL_CODIGO` int NOT NULL,
  `VAL_IMPACTO` int DEFAULT NULL,
  `VAL_RIESGO` int DEFAULT NULL,
  `VA_FRECUENCIA` text,
  `VA_IMPACTO` text,
  PRIMARY KEY (`VAL_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `val_rangos`
--

LOCK TABLES `val_rangos` WRITE;
/*!40000 ALTER TABLE `val_rangos` DISABLE KEYS */;
/*!40000 ALTER TABLE `val_rangos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `val_valoracion`
--

DROP TABLE IF EXISTS `val_valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `val_valoracion` (
  `VAL_CODIGO` int NOT NULL AUTO_INCREMENT,
  `AME_CODIGO` int NOT NULL,
  `VAL_IMPACTO` float NOT NULL,
  `VAL_RIESGO` int DEFAULT NULL,
  `VAL_FECHA_VALORACION` datetime DEFAULT NULL,
  `VA_FRECUENCIA` varchar(50) NOT NULL,
  `VA_COSTO` int NOT NULL,
  PRIMARY KEY (`VAL_CODIGO`),
  KEY `FK_RELATIONSHIP_17` (`AME_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_17` FOREIGN KEY (`AME_CODIGO`) REFERENCES `ame_amenaza` (`AME_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `val_valoracion`
--

LOCK TABLES `val_valoracion` WRITE;
/*!40000 ALTER TABLE `val_valoracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `val_valoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vul_vulnerabilidad`
--

DROP TABLE IF EXISTS `vul_vulnerabilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vul_vulnerabilidad` (
  `VUL_CODIGO` int NOT NULL AUTO_INCREMENT,
  `TVU_CODIGO` int DEFAULT NULL,
  `VUL_FECHA_INICIO` datetime NOT NULL,
  `VUL_IDENTIFICACION` varchar(20) NOT NULL,
  `VUL_NOMBRE` varchar(250) NOT NULL,
  `VUL_DESCRIPCION` varchar(250) NOT NULL,
  `VUL_OBSERVACION` text NOT NULL,
  `VUL_FECHA_INACTIVIDAD` datetime NOT NULL,
  PRIMARY KEY (`VUL_CODIGO`),
  KEY `FK_RELATIONSHIP_13` (`TVU_CODIGO`),
  CONSTRAINT `FK_RELATIONSHIP_13` FOREIGN KEY (`TVU_CODIGO`) REFERENCES `tvu_tipovulnerabilidad` (`TVU_CODIGO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vul_vulnerabilidad`
--

LOCK TABLES `vul_vulnerabilidad` WRITE;
/*!40000 ALTER TABLE `vul_vulnerabilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `vul_vulnerabilidad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-08 20:43:35
