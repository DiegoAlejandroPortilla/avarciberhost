-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: mapadecalor
-- ------------------------------------------------------
-- Server version	8.0.29

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
INSERT INTO `act_activo` VALUES (1,1,1,'2023-08-05 12:00:00','2513','Main-Frame Z10BC','Main-Frame Z10BC','2023-08-05 12:00:00','Sin observacion',300000),(2,2,1,'2023-08-05 12:00:00','2540','UNIDAD DE CARTUCHOS  ','UNIDAD DE CARTUCHOS  ','2023-08-05 12:00:00','Sin observacion',10000),(3,3,1,'2023-08-05 12:00:00','2539','UNIDAD DE CARTUCHOS 1 ','UNIDAD DE CARTUCHOS','2023-08-05 12:00:00','Sin observacion',10000),(4,4,1,'2023-08-05 12:00:00','2541','ALMACENAMIENTO  ','REPOSITORIO  ','2023-08-05 12:00:00','Sin observacion',5000000),(5,5,1,'2023-08-05 12:00:00','2497','SERVIDOR HMC  ','SERVIDOR  ','2023-08-05 12:00:00','Sin observacion',2000),(6,6,1,'2023-08-05 12:00:00',' ','AIRE DE PRESICION   ','AIRE DE PRESICION  ','2023-08-05 12:00:00','Sin observacion',25000),(7,7,1,'2023-08-05 12:00:00','2557','AIRE TIPO MOCHILA  ','AIRE TIPO MOCHILA ','2023-08-05 12:00:00','Sin observacion',8000),(8,8,1,'2023-08-05 12:00:00','2559','UPS ','UPS ','2023-08-05 12:00:00','Sin observacion',30000),(9,9,1,'2023-08-05 12:00:00',' ','SERVIDOR UNIX ','SERVIDOR UNIX ','2023-08-05 12:00:00','Sin observacion',4000),(10,10,1,'2023-08-05 12:00:00','0516','SERVER VTAPE ','SERVER VTAPE','2023-08-05 12:00:00','Sin observacion',2000),(11,11,1,'2023-08-05 12:00:00','2543','SWITCH DE PASO ','SWITCH DE PASO ','2023-08-05 12:00:00','Sin observacion',1000),(12,12,2,'2023-08-05 12:00:00','mor-pa','Consulta de Informacion de Empresas ','Aplicativo de Software que realiza la Consulta de Empresas por por Numero Patronal o Razon Social ','2023-08-05 12:00:00','Sin observacion',10000),(13,13,2,'2023-08-05 12:00:00','mor-pa','Ingreso de glosas','Aplicativo de Software que permite Ingresar ,validar y registrar informacion de  las Glosas y Títulos que tiene una empresa.','2023-08-05 12:00:00','Sin observacion',10000),(14,14,2,'2023-08-05 12:00:00','mor-pa','Liquidación de Glosas y Títulos de Crédito  ','Aplicativo de Software que realiza la Liquidación de la Glosa que fue Notificada a una empresa o la Liquidación de un Título de Crédito   ','2023-08-05 12:00:00','Sin observacion',10000),(15,15,2,'2023-08-05 12:00:00','mor-pa','Notificación  de Glosas  ','Aplicativo de Software que realiza Emisión y Notificación de una Glosa a una empresa por pagos no realizados al Afiliado, por concepto de Aportes, Fondos de Reserva o Descuentos   ','2023-08-05 12:00:00','Sin observacion',10000),(16,16,2,'2023-08-05 12:00:00','mor-pa ','Consulta de Glosas y Títulos de Crédito ','Aplicativo de Software que permite consultar los datos de las Glosas y Títulos que tiene una empresa.','2023-08-05 12:00:00','Sin observacion',10000),(17,17,2,'2023-08-05 12:00:00','mor-pa','Modificación de Aportes y descuentos en Glosas   ','Aplicativo de Software que permite modificar los Aportes y descuentos que se consideraron en la elaboración de una Glosa','2023-08-05 12:00:00','Sin observacion',10000),(18,18,2,'2023-08-05 12:00:00','mor-pa','Ingreso del Comprobante de pago de Abonos ','Aplicativo de Software que realiza el Registro del Comprobante de Pago del Abono que realiza la empresa por la Glosa que tiene. Contabilizar, desgloce de cuentas contables o registrar abonos ','2023-08-05 12:00:00','Sin observacion',10000),(19,19,2,'2023-08-05 12:00:00','mor-pa ','Emision de Títulos de Crédito','Aplicativo de Software que realiza la emision de Títulos de Crédito si la glosa no ha sido cancelada','2023-08-05 12:00:00','Sin observacion',10000),(20,20,2,'2023-08-05 12:00:00','contab','Consulta de plan de cuentas','Aplicativo de Software que consulta la información del PLAN GENERAL DE CUENTAS, con los movimientos mensuales y los saldos acumulados','2023-08-05 12:00:00','Sin observacion',10000),(21,21,2,'2023-08-05 12:00:00','contab','Ingreso de cargos empleados del IESS','Aplicativo de Software que crea, valida y registra la información de los cargos de los empleados del IESS','2023-08-05 12:00:00','Sin observacion',10000),(22,22,2,'2023-08-05 12:00:00','contab','Consulta de cuentas auxiliares  ','Aplicativo de Software que permite la disponibilidad de la información de las cuentas auxiliares deudoras y acreedoras','2023-08-05 12:00:00','Sin observacion',10000),(23,23,2,'2023-08-05 12:00:00','cred','Consulta historica de prestamos ','Aplicativo de Software que permite consultar los prestamos concedidos por el IESS y verificar el estado y sus pagos o abonos','2023-08-05 12:00:00','Sin observacion',10000),(24,24,2,'2023-08-05 12:00:00','cred','Consulta de cuenta corriente patronal de prestamos','Aplicativo de Software que permite consultar los pagos realizados por periodo de una determinada empresa','2023-08-05 12:00:00','Sin observacion',10000),(25,25,2,'2023-08-05 12:00:00','cred','Consulta de cuenta de planillas de prestamos ','Aplicativo de Software que permite consultar las planillas y las novedades ','2023-08-05 12:00:00','Sin observacion',10000),(26,26,2,'2023-08-05 12:00:00','cred','Liquidacion de prestamos ','Aplicativo de Software que realiza el calculo de liquidacion total o parcial de prestamos ','2023-08-05 12:00:00','Sin observacion',10000),(27,27,2,'2023-08-05 12:00:00','cred','Consulta historica de liquidaciones de prestamos ','Aplicativo de Software que permite consultar las liquidaciones historicas de prestamos del IESS','2023-08-05 12:00:00','Sin observacion',10000),(28,28,2,'2023-08-05 12:00:00','cred','Justifiacion  de Abonos','Aplicativos de Software que permite el ingreso de abonos de prestamos antiguos previo el documento justificativo certificado en tesoreria','2023-08-05 12:00:00','Sin observacion',10000),(29,29,2,'2023-08-05 12:00:00','cred','Control de tramites de levantamientos de hipoteca','Aplicativos de Software que permite el ingreso de novedades en el control de tramites de prestamos hipotecarios','2023-08-05 12:00:00','Sin observacion',10000),(30,30,2,'2023-08-05 12:00:00','cred','Califiacion estado de prestamo','Aplicativo de Software que califica el estado de un prestamo validando los abonos en la cta cte ','2023-08-05 12:00:00','Sin observacion',10000),(31,31,2,'2023-08-05 12:00:00','cred','Emision de Planillas de descuentos','Aplicativos batch  de Software que realiza la emision de planillas de descuentos de prestamos ','2023-08-05 12:00:00','Sin observacion',10000),(32,32,2,'2023-08-05 12:00:00','teso','Recaudacion de prestamos ','Aplicativo de Software que realiza la recaudacion de prestamos antiguos, ifis cerradas y pq especiales','2023-08-05 12:00:00','Sin observacion',10000),(33,33,2,'2023-08-05 12:00:00','teso','Consuta de comprobantes contabilizados','Aplicativo de Software que realiza la consulta de comprobantes contabilizados a nivel nacional ','2023-08-05 12:00:00','Sin observacion',10000),(34,34,2,'2023-08-05 12:00:00','teso','Control de Cajeros','Aplicativo de Software que realiza el control de cajeros recaudadores a nivel nacional ','2023-08-05 12:00:00','Sin observacion',10000),(35,35,2,'2023-08-05 12:00:00','teso','Consuta de recaudacion a nivel nacional','Aplicativo de Software que realiza la consulta de recaudacion de prestamos a nivel nacional en cada Hosts','2023-08-05 12:00:00','Sin observacion',10000),(36,36,2,'2023-08-05 12:00:00','teso','Impresos','Aplicativos de Software que realiza los Impresos de: Listado Auditor de Cajero y de contabilizacion de Tesoreria','2023-08-05 12:00:00','Sin observacion',10000),(37,37,2,'2023-08-05 12:00:00','teso','Consuta de recaudacion a nivel nacional','Aplicativo de Software que realiza la consulta de recaudacion de prestamos a nivel nacional en cada Hosts','2023-08-05 12:00:00','Sin observacion',10000),(38,38,2,'2023-08-05 12:00:00','teso','Consulta historica de  egresos del IESS','Aplicativo de Software que permite consultar archivos históricos de egresos realizados por el IESS por todos los servicios y prestaciones ','2023-08-05 12:00:00','Sin observacion',10000),(39,39,2,'2023-08-05 12:00:00','montepio','Ingreso de tramites','Aplicativo de Software que permite Crear, validar y registrar la información de los causantes de montepío.','2023-08-05 12:00:00','Sin observacion',10000),(40,40,2,'2023-08-05 12:00:00','montepio','Ingreso de Beneficiarios','Aplicativo de Software que permite Crear, validar y registrar la información de los beneficiarios de montepío.','2023-08-05 12:00:00','Sin observacion',10000),(41,41,2,'2023-08-05 12:00:00','montepio','Calificación de derechos de los beneficiarios de m','Aplicativo de Software que permite asignar a cada beneficiario de un grupo familiar una calificación para cobrar una pensión de montepío, considerando su parentesco con el causante fallecido, así como ciertas condiciones del beneficiario.','2023-08-05 12:00:00','Sin observacion',10000),(42,42,2,'2023-08-05 12:00:00','montepio','Liquidación de montepío ','Aplicativo de Software que permite la distribución de la renta inicial para el o los beneficiarios de este causante. ','2023-08-05 12:00:00','Sin observacion',10000),(43,43,2,'2023-08-05 12:00:00','montepio','Registrar boletines de egreso de montepío ','Aplicativo de Software que permite imprimir y grabar los datos del boletín de pago, proteccion  y su contabilizacion','2023-08-05 12:00:00','Sin observacion',10000),(44,44,2,'2023-08-05 12:00:00','pens','Liquidación,calculo y pago de Jubilaciones que no ','Aplicativo de Software que permite realizar la liquidación de Montepío a los beneficiarios del Afiliado fallecido','2023-08-05 12:00:00','Sin observacion',10000),(45,45,2,'2023-08-05 12:00:00','rrhh','Liquidación de Viáticos','Aplicativo de Software que automatiza el pago de Viáticos al personal del IESS que sale en comisión de servicios.','2023-08-05 12:00:00','Sin observacion',10000),(46,46,2,'2023-08-05 12:00:00','fr','Ingreso de planillas de FR por pago de glosas y ti','Aplicativo de Software que permite el ingreso de planillas cobradas en glosas y titulos  y su contabilizacion y la migracion a H.L. ','2023-08-05 12:00:00','Sin observacion',10000),(47,47,2,'2023-08-05 12:00:00','cesantia','Liquidacion de Boletines de Cesantia de afiliados ','Aplicativo de Software que permite elaborar el boletin de pago de Cesantía a Beneficiarios por Afiliados fallecidos con derecho a Cesantía y su contabilizacion','2023-08-05 12:00:00','Sin observacion',10000),(48,48,2,'2023-08-05 12:00:00','sistemas','Control de Operadores','Aplicativo de Software que permite autorizar a Supervisor y usuarios las transacciones , terminales y tiempo de extension','2023-08-05 12:00:00','Sin observacion',10000),(49,49,1,'2023-08-05 12:00:00','','Aplicativos alojados en el el sistema HOST','Aplicativos alojados en el el sistema HOST','2023-08-05 12:00:00','Sin observacion',10000),(50,3,NULL,'2023-08-21 00:00:00','','Diego','Diego',NULL,'Diego',6000);
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
INSERT INTO `ame_amenaza` VALUES (1,1,NULL,'2023-08-05 12:00:00','AME-001','Fraude','Fraude','2023-08-05 12:00:00','Sin observacion'),(2,1,NULL,'2023-08-05 12:00:00','AME-002','Sabotaje','Sabotaje','2023-08-05 12:00:00','Sin observacion'),(3,1,NULL,'2023-08-05 12:00:00','AME-003','Vandalismo','Vandalismo','2023-08-05 12:00:00','Sin observacion'),(4,1,NULL,'2023-08-05 12:00:00','AME-004','Robo (dispositivos, medios de almacenamiento y doc','Robo (dispositivos, medios de almacenamiento y documentos)','2023-08-05 12:00:00','Sin observacion'),(5,1,NULL,'2023-08-05 12:00:00','AME-005','Fuga de información / intercambio','Fuga de información / intercambio','2023-08-05 12:00:00','Sin observacion'),(6,1,NULL,'2023-08-05 12:00:00','AME-006','Acceso físico no autorizado / Entrada no autorizad','Acceso físico no autorizado / Entrada no autorizada a las instalaciones','2023-08-05 12:00:00','Sin observacion'),(7,1,NULL,'2023-08-05 12:00:00','AME-007','Coerción, extorsión o corrupción','Coerción, extorsión o corrupción','2023-08-05 12:00:00','Sin observacion'),(8,1,NULL,'2023-08-05 12:00:00','AME-008','Daños de la guerra','Daños de la guerra','2023-08-05 12:00:00','Sin observacion'),(9,1,NULL,'2023-08-05 12:00:00','AME-009','Ataque terrorista','Ataque terrorista','2023-08-05 12:00:00','Sin observacion'),(10,2,NULL,'2023-08-05 12:00:00','AME-010','Fuga de información / intercambio debido a un erro','Fuga de información / intercambio debido a un error humano','2023-08-05 12:00:00','Sin observacion'),(11,2,NULL,'2023-08-05 12:00:00','AME-011','Uso erróneo o administración de dispositivos y sis','Uso erróneo o administración de dispositivos y sistemas','2023-08-05 12:00:00','Sin observacion'),(12,2,NULL,'2023-08-05 12:00:00','AME-012','Usando información de una fuente no confiable','Usando información de una fuente no confiable','2023-08-05 12:00:00','Sin observacion'),(13,2,NULL,'2023-08-05 12:00:00','AME-013','Cambio involuntario de datos en un sistema de info','Cambio involuntario de datos en un sistema de información','2023-08-05 12:00:00','Sin observacion'),(14,2,NULL,'2023-08-05 12:00:00','AME-014','Diseño y planificación inadecuados o adaptación in','Diseño y planificación inadecuados o adaptación inadecuada','2023-08-05 12:00:00','Sin observacion'),(15,2,NULL,'2023-08-05 12:00:00','AME-015','Daños causados ​​por un tercero ','Daños causados ​​por un tercero ','2023-08-05 12:00:00','Sin observacion'),(16,2,NULL,'2023-08-05 12:00:00','AME-016','Daños resultantes de las pruebas de penetración','Daños resultantes de las pruebas de penetración','2023-08-05 12:00:00','Sin observacion'),(17,2,NULL,'2023-08-05 12:00:00','AME-017','Pérdida de información en la nube','Pérdida de información en la nube','2023-08-05 12:00:00','Sin observacion'),(18,2,NULL,'2023-08-05 12:00:00','AME-018','Pérdida de (integridad de) información sensible','Pérdida de (integridad de) información sensible','2023-08-05 12:00:00','Sin observacion'),(19,2,NULL,'2023-08-05 12:00:00','AME-019','Pérdida de dispositivos, medios de almacenamiento ','Pérdida de dispositivos, medios de almacenamiento y documentos','2023-08-05 12:00:00','Sin observacion'),(20,2,NULL,'2023-08-05 12:00:00','AME-020','Destrucción de registros','Destrucción de registros','2023-08-05 12:00:00','Sin observacion'),(21,3,NULL,'2023-08-05 12:00:00','AME-021','Desastres (terremotos naturales, inundaciones, des','Desastres (terremotos naturales, inundaciones, deslizamientos de tierra, tsunamis, lluvias intensas, fuertes nevadas, vientos fuertes)','2023-08-05 12:00:00','Sin observacion'),(22,3,NULL,'2023-08-05 12:00:00','AME-022','Fuego','Fuego','2023-08-05 12:00:00','Sin observacion'),(23,3,NULL,'2023-08-05 12:00:00','AME-023','Contaminación, polvo, corrosión','Contaminación, polvo, corrosión','2023-08-05 12:00:00','Sin observacion'),(24,3,NULL,'2023-08-05 12:00:00','AME-024','Golpe de trueno','Golpe de trueno','2023-08-05 12:00:00','Sin observacion'),(25,3,NULL,'2023-08-05 12:00:00','AME-025','Agua','Agua','2023-08-05 12:00:00','Sin observacion'),(26,3,NULL,'2023-08-05 12:00:00','AME-026','Explosion','Explosion','2023-08-05 12:00:00','Sin observacion'),(27,3,NULL,'2023-08-05 12:00:00','AME-027','Fuga de radiación peligrosa','Fuga de radiación peligrosa','2023-08-05 12:00:00','Sin observacion'),(28,3,NULL,'2023-08-05 12:00:00','AME-028','Condiciones climáticas desfavorables','Condiciones climáticas desfavorables','2023-08-05 12:00:00','Sin observacion'),(29,3,NULL,'2023-08-05 12:00:00','AME-029','Grandes eventos en el medio ambiente','Grandes eventos en el medio ambiente','2023-08-05 12:00:00','Sin observacion'),(30,3,NULL,'2023-08-05 12:00:00','AME-030','Amenazas desde el espacio / Tormenta electromagnét','Amenazas desde el espacio / Tormenta electromagnética','2023-08-05 12:00:00','Sin observacion'),(31,3,NULL,'2023-08-05 12:00:00','AME-031','Fauna silvestre','Fauna silvestre','2023-08-05 12:00:00','Sin observacion'),(32,4,NULL,'2023-08-05 12:00:00','AME-032','Fallo de dispositivos o sistemas','Fallo de dispositivos o sistemas','2023-08-05 12:00:00','Sin observacion'),(33,4,NULL,'2023-08-05 12:00:00','AME-033','Fallo o interrupción de los enlaces de comunicació','Fallo o interrupción de los enlaces de comunicación (redes de comunicación)','2023-08-05 12:00:00','Sin observacion'),(34,4,NULL,'2023-08-05 12:00:00','AME-034','Fallo o interrupción del suministro principal','Fallo o interrupción del suministro principal','2023-08-05 12:00:00','Sin observacion'),(35,4,NULL,'2023-08-05 12:00:00','AME-035','Fallo o interrupción de los proveedores de servici','Fallo o interrupción de los proveedores de servicios (cadena de suministro)','2023-08-05 12:00:00','Sin observacion'),(36,4,NULL,'2023-08-05 12:00:00','AME-036','Mal funcionamiento de los equipos (dispositivos o ','Mal funcionamiento de los equipos (dispositivos o sistemas)','2023-08-05 12:00:00','Sin observacion'),(37,5,NULL,'2023-08-05 12:00:00','AME-037','Pérdida de recursos','Pérdida de recursos','2023-08-05 12:00:00','Sin observacion'),(38,5,NULL,'2023-08-05 12:00:00','AME-038','Ausencia de personal','Ausencia de personal','2023-08-05 12:00:00','Sin observacion'),(39,5,NULL,'2023-08-05 12:00:00','AME-039','Huelga','Huelga','2023-08-05 12:00:00','Sin observacion'),(40,5,NULL,'2023-08-05 12:00:00','AME-040','Pérdida de servicios de apoyo','Pérdida de servicios de apoyo','2023-08-05 12:00:00','Sin observacion'),(41,5,NULL,'2023-08-05 12:00:00','AME-041','Corte de internet','Corte de internet','2023-08-05 12:00:00','Sin observacion'),(42,5,NULL,'2023-08-05 12:00:00','AME-042','Caída de la red','Caída de la red','2023-08-05 12:00:00','Sin observacion'),(43,6,NULL,'2023-08-05 12:00:00','AME-043','Conducción de guerra','Conducción de guerra','2023-08-05 12:00:00','Sin observacion'),(44,6,NULL,'2023-08-05 12:00:00','AME-044','Interceptando emisiones comprometedoras','Interceptando emisiones comprometedoras','2023-08-05 12:00:00','Sin observacion'),(45,6,NULL,'2023-08-05 12:00:00','AME-045','Intercepción de la información','Intercepción de la información','2023-08-05 12:00:00','Sin observacion'),(46,6,NULL,'2023-08-05 12:00:00','AME-046','Radiación interferente','Radiación interferente','2023-08-05 12:00:00','Sin observacion'),(47,6,NULL,'2023-08-05 12:00:00','AME-047','Repetición de mensajes','Repetición de mensajes','2023-08-05 12:00:00','Sin observacion'),(48,6,NULL,'2023-08-05 12:00:00','AME-048','Reconocimiento de redes, manipulación de tráfico d','Reconocimiento de redes, manipulación de tráfico de redes y recopilación de información','2023-08-05 12:00:00','Sin observacion'),(49,6,NULL,'2023-08-05 12:00:00','AME-049','Hombre en el medio / secuestro de sesión ','Hombre en el medio / secuestro de sesión ','2023-08-05 12:00:00','Sin observacion'),(50,7,NULL,'2023-08-05 12:00:00','AME-050','Robo de identidad (Fraude de identidad / Cuenta)','Robo de identidad (Fraude de identidad / Cuenta)','2023-08-05 12:00:00','Sin observacion'),(51,7,NULL,'2023-08-05 12:00:00','AME-051','Recepción de correos electrónicos no solicitados ','Recepción de correos electrónicos no solicitados ','2023-08-05 12:00:00','Sin observacion'),(52,7,NULL,'2023-08-05 12:00:00','AME-052','Negación de servicio','Negación de servicio','2023-08-05 12:00:00','Sin observacion'),(53,7,NULL,'2023-08-05 12:00:00','AME-053','Código malicioso / software / actividad','Código malicioso / software / actividad','2023-08-05 12:00:00','Sin observacion'),(54,7,NULL,'2023-08-05 12:00:00','AME-054','Ingeniería social','Ingeniería social','2023-08-05 12:00:00','Sin observacion'),(55,7,NULL,'2023-08-05 12:00:00','AME-055','Abuso de la fuga de información','Abuso de la fuga de información','2023-08-05 12:00:00','Sin observacion'),(56,7,NULL,'2023-08-05 12:00:00','AME-056','Generación y uso de certificados deshonestos','Generación y uso de certificados deshonestos','2023-08-05 12:00:00','Sin observacion'),(57,7,NULL,'2023-08-05 12:00:00','AME-057','Manipulación de hardware y software','Manipulación de hardware y software','2023-08-05 12:00:00','Sin observacion'),(58,7,NULL,'2023-08-05 12:00:00','AME-058','Manipulación de la información','Manipulación de la información','2023-08-05 12:00:00','Sin observacion'),(59,7,NULL,'2023-08-05 12:00:00','AME-059','Mal uso de las herramientas de auditoría','Mal uso de las herramientas de auditoría','2023-08-05 12:00:00','Sin observacion'),(60,7,NULL,'2023-08-05 12:00:00','AME-060','Uso indebido de los sistemas de información / info','Uso indebido de los sistemas de información / información (incluidas las aplicaciones móviles)','2023-08-05 12:00:00','Sin observacion'),(61,7,NULL,'2023-08-05 12:00:00','AME-061','Actividades no autorizadas','Actividades no autorizadas','2023-08-05 12:00:00','Sin observacion'),(62,7,NULL,'2023-08-05 12:00:00','AME-062','Instalación no autorizada de software','Instalación no autorizada de software','2023-08-05 12:00:00','Sin observacion'),(63,7,NULL,'2023-08-05 12:00:00','AME-063','Comprometiendo información confidencial (violacion','Comprometiendo información confidencial (violaciones de datos)','2023-08-05 12:00:00','Sin observacion'),(64,7,NULL,'2023-08-05 12:00:00','AME-064','Farsa','Farsa','2023-08-05 12:00:00','Sin observacion'),(65,7,NULL,'2023-08-05 12:00:00','AME-065','Actividad remota (ejecución)','Actividad remota (ejecución)','2023-08-05 12:00:00','Sin observacion'),(66,7,NULL,'2023-08-05 12:00:00','AME-066','Ataques dirigidos (APTs, etc.)','Ataques dirigidos (APTs, etc.)','2023-08-05 12:00:00','Sin observacion'),(67,7,NULL,'2023-08-05 12:00:00','AME-067','Fallo de proceso de negocio','Fallo de proceso de negocio','2023-08-05 12:00:00','Sin observacion'),(68,7,NULL,'2023-08-05 12:00:00','AME-068','Fuerza bruta','Fuerza bruta','2023-08-05 12:00:00','Sin observacion'),(69,7,NULL,'2023-08-05 12:00:00','AME-069','Abuso de autorizaciones','Abuso de autorizaciones','2023-08-05 12:00:00','Sin observacion'),(70,8,NULL,'2023-08-05 12:00:00','AME-070','Violación de leyes o reglamentos / incumplimiento ','Violación de leyes o reglamentos / incumplimiento de la legislación','2023-08-05 12:00:00','Sin observacion'),(71,8,NULL,'2023-08-05 12:00:00','AME-071','Incumplimiento de los requisitos contractuales','Incumplimiento de los requisitos contractuales','2023-08-05 12:00:00','Sin observacion'),(72,8,NULL,'2023-08-05 12:00:00','AME-072','Uso no autorizado de recursos protegidos por derec','Uso no autorizado de recursos protegidos por derechos de propiedad intelectual','2023-08-05 12:00:00','Sin observacion'),(73,8,NULL,'2023-08-05 12:00:00','AME-073','Abuso de datos personales','Abuso de datos personales','2023-08-05 12:00:00','Sin observacion'),(74,8,NULL,'2023-08-05 12:00:00','AME-074','Decisiones judiciales / órdenes judiciales','Decisiones judiciales / órdenes judiciales','2023-08-05 12:00:00','Sin observacion'),(75,4,NULL,'2023-08-05 12:00:00','AME-075','Fallo de software /aplicaciones o servicio','Fallo de software /aplicaciones o servicio','2023-08-05 12:00:00','Sin observacion');
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
INSERT INTO `amv_amenazavulnerabilidad` VALUES (1,2,'Muy Baja','2024-01-19 21:21:10',NULL,NULL),(4,3,'Muy Alta','2024-01-19 21:22:09',NULL,NULL),(4,6,'Alta','2024-01-19 21:22:09',NULL,NULL),(13,8,'Muy Alta','2024-01-23 20:12:37',NULL,NULL),(13,10,'Alta','2024-01-23 20:12:37',NULL,NULL),(20,18,'Muy Alta','2024-01-25 19:24:48',NULL,NULL),(20,41,'Muy Baja','2024-01-25 19:24:48',NULL,NULL),(1,2,'Muy Baja','2024-02-02 15:22:10',NULL,NULL),(13,4,'Media','2024-02-02 16:24:19',NULL,NULL),(13,8,'Baja','2024-02-02 16:24:19',NULL,NULL),(27,3,'Media','2024-02-02 16:26:00',NULL,NULL);
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
INSERT INTO `div_dimensionvaloracion` VALUES (1,'Disponibilidad','Es una de las dimensiones clave en la evaluación y calificación de sistemas o servicios, especialmente en el ámbito de la tecnología de la información y la informática.'),(2,'Integridad','La integridad se refiere a la calidad de la información o los datos que asegura que estos sean precisos, confiables y no hayan sido alterados de manera no autorizada o accidental.'),(3,'Confidencialidad','La confidencialidad se refiere a la protección y el control de acceso a la información sensible o privada, asegurando que solo las personas o entidades autorizadas puedan acceder a ella.');
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
INSERT INTO `pro_probabilidad` VALUES (9,1,'100','Muy Alto','MA','a diario'),(10,2,'10','Alto','A','mensualmente'),(11,3,'0.1','Bajo','B','cada varios años'),(12,4,'10','Alto','A','mensualmente'),(13,5,'10','Alto','A','mensualmente'),(14,6,'100','Muy Alto','MA','a diario'),(15,7,'10','Alto','A','mensualmente'),(16,8,'100','Muy Alto','MA','a diario'),(17,9,'100','Muy Alto','MA','a diario'),(18,10,'0.1','Bajo','B','cada varios años'),(19,11,'10','Alto','A','mensualmente'),(20,12,'10','Alto','A','mensualmente'),(21,13,'0.1','Bajo','B','cada varios años'),(22,14,'1','Medio','M','una vez al año'),(23,15,'10','Alto','A','mensualmente'),(24,16,'0.1','Bajo','B','cada varios años'),(25,17,'10','Alto','A','mensualmente'),(26,18,'10','Alto','A','mensualmente'),(27,19,'10','Alto','A','mensualmente'),(28,20,'100','Muy Alto','MA','a diario'),(29,21,'100','Muy Alto','MA','a diario'),(30,22,'100','Muy Alto','MA','a diario'),(31,23,'0.1','Bajo','B','cada varios años'),(32,24,'10','Alto','A','mensualmente'),(33,25,'0.1','Bajo','B','cada varios años'),(34,26,'10','Alto','A','mensualmente'),(35,27,'100','Muy Alto','MA','a diario'),(36,28,'10','Alto','A','mensualmente'),(37,29,'10','Alto','A','mensualmente'),(38,30,'100','Muy Alto','MA','a diario'),(39,31,'0.1','Bajo','B','cada varios años'),(40,32,'10','Alto','A','mensualmente'),(41,33,'10','Alto','A','mensualmente'),(42,34,'10','Alto','A','mensualmente'),(43,35,'10','Alto','A','mensualmente'),(44,36,'10','Alto','A','mensualmente'),(45,37,'0.1','Bajo','B','cada varios años'),(46,38,'0.1','Bajo','B','cada varios años'),(47,39,'10','Alto','A','mensualmente'),(48,40,'10','Alto','A','mensualmente'),(49,41,'10','Alto','A','mensualmente'),(50,42,'10','Alto','A','mensualmente'),(51,43,'100','Muy Alto','MA','a diario'),(52,44,'10','Alto','A','mensualmente'),(53,45,'10','Alto','A','mensualmente'),(54,46,'100','Muy Alto','MA','a diario'),(55,47,'10','Alto','A','mensualmente'),(56,48,'10','Alto','A','mensualmente'),(57,49,'10','Alto','A','mensualmente'),(58,50,'10','Alto','A','mensualmente'),(59,51,'0.1','Bajo','B','cada varios años'),(60,52,'10','Alto','A','mensualmente'),(61,53,'10','Alto','A','mensualmente'),(62,54,'10','Alto','A','mensualmente'),(63,55,'10','Alto','A','mensualmente'),(64,56,'10','Alto','A','mensualmente'),(65,57,'10','Alto','A','mensualmente'),(66,58,'10','Alto','A','mensualmente'),(67,59,'10','Alto','A','mensualmente'),(68,60,'10','Alto','A','mensualmente'),(69,61,'10','Alto','A','mensualmente'),(70,62,'10','Alto','A','mensualmente'),(71,63,'10','Alto','A','mensualmente'),(72,64,'10','Alto','A','mensualmente'),(73,65,'10','Alto','A','mensualmente'),(74,66,'100','Muy Alto','MA','a diario'),(75,67,'10','Alto','A','mensualmente'),(76,68,'10','Alto','A','mensualmente'),(77,69,'10','Alto','A','mensualmente'),(78,70,'10','Alto','A','mensualmente'),(79,71,'10','Alto','A','mensualmente'),(80,72,'10','Alto','A','mensualmente'),(81,73,'10','Alto','A','mensualmente'),(82,74,'10','Alto','A','mensualmente'),(83,75,'10','Alto','A','mensualmente');
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
INSERT INTO `tac_tipoactivo` VALUES (1,'Hardware'),(2,'Software'),(3,'Red'),(4,'Personal'),(5,'Sitio'),(6,'Estructura de la Organización');
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
INSERT INTO `tia_tipoamenaza` VALUES (1,'Ataque físico (deliberado / intencional) '),(2,'Daños involuntarios / pérdida de información o activos de TI  '),(3,'Desastres (naturales, ambientales)'),(4,' Fallos / Mal funcionamiento'),(5,'Cortes de Luz'),(6,'Escuchas / Interceptación / Secuestro'),(7,'Actividad/Abuso nefasto '),(8,'Legal');
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
INSERT INTO `tvu_tipovulnerabilidad` VALUES (1,'Hardware'),(2,'Software'),(3,'Red'),(4,'Personal'),(5,'Sitio'),(6,'Organizacion');
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
INSERT INTO `uni_unidad` VALUES (1,NULL,'UTIC'),(2,NULL,'Departamento de Ciencia de la Computación');
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
INSERT INTO `usu_usuarios` VALUES (1,1,'Angel','Pillajo','pasante','angel123','angelp@gmail.com'),(2,2,'Mario','Cruz','pasante','mario123','marioc@gmail.com'),(3,3,'Elena','Chamorro','pasante','elena123','elenac@gmail.com'),(4,4,'Sofia','Sanabria','pasante','sofia123','sofias@gmail.com'),(5,5,'Leticia','Perez','pasante','leticia123','leticiap@gmail.com'),(6,6,'Eugenio','Derbez','pasante','eugenio123','eugeniod@gmail.com'),(7,7,'Mishell','Caza','pasante','mishell123','mishellc@gmail.com'),(8,8,'Juan','Reyes','pasante','juan123','juanr@gmail.com'),(9,9,'Fernanda','Palacios','pasante','fernanda123','fernandap@gmail.com'),(10,10,'Ramiro','Paredes','pasante','ramiro123','ramirop@gmail.com'),(11,NULL,'Diego','Portilla','usuario','$2a$10$ZlJ1WmUYTOOFTVvSBBAZh.k1p9tQznL38al5HwHRC8Zpr0.lf6jsG','daportilla1@espe.edu.ec'),(12,NULL,'Diego','Portilla','usuario','$2a$10$7XEEu64rcFSL6Q9lgLjBqeXWpatNiq0DZQQPrK6gA06OhQfye.rge','portillavas@gmail.com'),(13,NULL,'Dylan','Hernández','usuario','$2a$10$/7AmRcgzyKeHtj.vaWUS4uCk2tRX0iRW8vVXjMbiojYWJuwPygdpq','dylanhernandez600@gmail.com'),(14,NULL,'Alejandro','Andrade','usuario','$2a$10$8HmDZhdPD7nNBsu81XehMuvUOSbGuEkQsOhat7S7n6c9gG9UxbihW','diego@gmail.com'),(15,NULL,'Fernando','Portilla','usuario','$2a$10$hqA1Cw6G9Oq6GDw0SBbpYeQbpuqG5cnCwK4xlzVNUwzAXrSTR43j2','portillavas1@gmail.com');
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
INSERT INTO `vac_vulnerabilidadactivo` VALUES (1,1,3000.00,'2024-01-21 05:40:47',NULL),(4,1,1.00,'2024-02-02 00:12:29',NULL),(4,2,600.00,'2024-01-21 07:10:44',NULL),(4,4,20.00,'2024-01-26 01:38:02',NULL),(4,7,1000.00,'2024-01-24 02:50:48',NULL),(20,8,9000.00,'2024-01-26 00:25:21',NULL);
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
INSERT INTO `vai_valorimpacto` VALUES (97,1,1,1,'2024-01-21 00:40:47',3.00),(98,2,1,1,'2024-01-21 00:40:47',2.00),(99,3,1,1,'2024-01-21 00:40:47',4.00),(100,1,4,2,'2024-01-21 02:10:45',3.00),(101,2,4,2,'2024-01-21 02:10:45',5.00),(102,3,4,2,'2024-01-21 02:10:45',3.00),(103,1,4,2,'2024-01-23 21:49:01',5.00),(104,2,4,2,'2024-01-23 21:49:01',4.00),(105,3,4,2,'2024-01-23 21:49:01',6.00),(106,1,4,7,'2024-01-23 21:50:48',4.00),(107,2,4,7,'2024-01-23 21:50:48',3.00),(108,3,4,7,'2024-01-23 21:50:48',5.00),(109,1,20,8,'2024-01-25 19:25:21',6.00),(110,2,20,8,'2024-01-25 19:25:21',5.00),(111,3,20,8,'2024-01-25 19:25:21',7.00),(112,1,4,4,'2024-01-25 20:38:02',4.00),(113,2,4,4,'2024-01-25 20:38:02',3.00),(114,3,4,4,'2024-01-25 20:38:02',6.00),(115,1,20,NULL,'2024-01-26 21:38:55',4.00),(116,2,20,NULL,'2024-01-26 21:38:55',3.00),(117,3,20,NULL,'2024-01-26 21:38:55',7.00),(118,1,13,NULL,'2024-01-26 21:41:18',6.00),(119,2,13,NULL,'2024-01-26 21:41:18',3.00),(120,3,13,NULL,'2024-01-26 21:41:18',7.00),(121,1,1,NULL,'2024-01-31 20:26:13',1.00),(122,2,1,NULL,'2024-01-31 20:26:13',1.00),(123,3,1,NULL,'2024-01-31 20:26:13',1.00),(124,1,1,NULL,'2024-01-31 20:29:35',1.00),(125,2,1,NULL,'2024-01-31 20:29:35',1.00),(126,3,1,NULL,'2024-01-31 20:29:35',1.00),(127,1,4,NULL,'2024-01-31 20:35:07',1.00),(128,2,4,NULL,'2024-01-31 20:35:07',1.00),(129,3,4,NULL,'2024-01-31 20:35:07',1.00),(130,1,1,NULL,'2024-01-31 20:35:50',6.00),(131,2,1,NULL,'2024-01-31 20:35:50',4.00),(132,3,1,NULL,'2024-01-31 20:35:50',6.00),(133,1,1,NULL,'2024-01-31 20:44:56',4.00),(134,2,1,NULL,'2024-01-31 20:44:56',7.00),(135,3,1,NULL,'2024-01-31 20:44:56',4.00),(136,1,1,NULL,'2024-01-31 23:55:01',4.00),(137,2,1,NULL,'2024-01-31 23:55:01',4.00),(138,3,1,NULL,'2024-01-31 23:55:01',5.00),(139,1,1,NULL,'2024-02-01 00:02:10',1.00),(140,2,1,NULL,'2024-02-01 00:02:10',1.00),(141,3,1,NULL,'2024-02-01 00:02:10',1.00),(142,1,1,NULL,'2024-02-01 00:02:55',5.00),(143,2,1,NULL,'2024-02-01 00:02:55',4.00),(144,3,1,NULL,'2024-02-01 00:02:55',4.00),(145,1,1,NULL,'2024-02-01 00:08:30',5.00),(146,2,1,NULL,'2024-02-01 00:08:30',4.00),(147,3,1,NULL,'2024-02-01 00:08:30',3.00),(148,1,1,NULL,'2024-02-01 00:11:26',4.00),(149,2,1,NULL,'2024-02-01 00:11:26',3.00),(150,3,1,NULL,'2024-02-01 00:11:26',4.00),(151,1,1,NULL,'2024-02-01 00:14:42',4.00),(152,2,1,NULL,'2024-02-01 00:14:42',3.00),(153,3,1,NULL,'2024-02-01 00:14:42',1.00),(154,1,4,NULL,'2024-02-01 00:17:12',4.00),(155,2,4,NULL,'2024-02-01 00:17:12',2.00),(156,3,4,NULL,'2024-02-01 00:17:12',5.00),(157,1,4,1,'2024-02-01 19:12:29',1.00),(158,2,4,1,'2024-02-01 19:12:29',1.00),(159,3,4,1,'2024-02-01 19:12:29',1.00),(160,1,4,2,'2024-02-01 19:27:49',3.00),(161,2,4,2,'2024-02-01 19:27:49',5.00),(162,3,4,2,'2024-02-01 19:27:49',1.00),(163,1,4,2,'2024-02-01 19:43:07',5.00),(164,2,4,2,'2024-02-01 19:43:07',3.00),(165,3,4,2,'2024-02-01 19:43:07',6.00);
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
INSERT INTO `val_rangos` VALUES (1,0,0,'Muy Baja','Despreciable'),(2,1,0,'Muy Baja','Despreciable'),(3,2,0,'Muy Baja','Despreciable'),(4,3,0,'Muy Baja','Despreciable'),(5,4,1,'Muy Baja','Bajo'),(6,5,1,'Muy Baja','Bajo'),(7,6,1,'Muy Baja','Bajo'),(8,7,2,'Muy Baja','Bajo'),(9,8,2,'Muy Baja','Bajo'),(10,9,3,'Muy Baja','Medio'),(11,10,3,'Muy Baja','Medio'),(12,0,0,'Baja','Despreciable'),(13,1,0,'Baja','Despreciable'),(14,2,1,'Baja','Bajo'),(15,3,1,'Baja','Bajo'),(16,4,2,'Baja','Bajo'),(17,5,2,'Baja','Bajo'),(18,6,3,'Baja','Medio'),(19,7,3,'Baja','Medio'),(20,8,5,'Baja','Medio'),(21,9,6,'Baja','Alto'),(22,10,6,'Baja','Alto'),(23,0,0,'Media','Despreciable'),(24,1,1,'Media','Bajo'),(25,2,1,'Media','Bajo'),(26,3,1,'Media','Bajo'),(27,4,2,'Media','Bajo'),(28,5,3,'Media','Medio'),(29,6,5,'Media','Medio'),(30,7,5,'Media','Medio'),(31,8,6,'Media','Alto'),(32,9,7,'Media','Alto'),(33,10,7,'Media','Alto'),(34,0,1,'Alta','Bajo'),(35,1,2,'Alta','Bajo'),(36,2,3,'Alta','Medio'),(37,3,4,'Alta','Medio'),(38,4,5,'Alta','Medio'),(39,5,5,'Alta','Medio'),(40,6,6,'Alta','Alto'),(41,7,8,'Alta','Alto'),(42,8,8,'Alta','Alto'),(43,9,9,'Alta','Muy Alto'),(44,10,10,'Alta','Daño Extremo'),(45,0,2,'Muy Alta','Bajo'),(46,1,3,'Muy Alta','Medio'),(47,2,5,'Muy Alta','Medio'),(48,3,6,'Muy Alta','Alto'),(49,4,8,'Muy Alta','Alto'),(50,5,8,'Muy Alta','Alto'),(51,6,9,'Muy Alta','Muy Alto'),(52,7,9,'Muy Alta','Muy Alto'),(53,8,9,'Muy Alta','Muy Alto'),(54,9,10,'Muy Alta','Daño Extremo'),(55,10,10,'Muy Alta','Daño Extremo');
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
INSERT INTO `vul_vulnerabilidad` VALUES (1,1,'2023-08-05 12:00:00','VUL-001','Mantenimiento insuficiente / instalación defectuosa de medios de almacenamiento','Mantenimiento','Sin observacion','2023-08-05 12:00:00'),(2,1,'2023-08-05 12:00:00','VUL-002','Falta de esquemas de reemplazo periódicos.','Falta','Sin observacion','2023-08-05 12:00:00'),(3,1,'2023-08-05 12:00:00','VUL-003','Susceptibilidad a la humedad, polvo, suciedad.','Susceptibilidad','Sin observacion','2023-08-05 12:00:00'),(4,1,'2023-08-05 12:00:00','VUL-004','Sensibilidad a la radiación electromagnética.','Sensibilidad','Sin observacion','2023-08-05 12:00:00'),(5,1,'2023-08-05 12:00:00','VUL-005','Falta de control de cambio de configuración eficiente','Falta','Sin observacion','2023-08-05 12:00:00'),(6,1,'2023-08-05 12:00:00','VUL-006','Susceptibilidad a las variaciones de tensión.','Susceptibilidad','Sin observacion','2023-08-05 12:00:00'),(7,1,'2023-08-05 12:00:00','VUL-007','Susceptibilidad a las variaciones de temperatura.','Susceptibilidad','Sin observacion','2023-08-05 12:00:00'),(8,1,'2023-08-05 12:00:00','VUL-008','Almacenamiento no protegido','Almacenamiento','Sin observacion','2023-08-05 12:00:00'),(9,1,'2023-08-05 12:00:00','VUL-009','Falta de cuidados a eliminacion desechos','Falta','Sin observacion','2023-08-05 12:00:00'),(10,1,'2023-08-05 12:00:00','VUL-010','Copia incontrolada','Copia','Sin observacion','2023-08-05 12:00:00'),(11,1,'2023-08-05 12:00:00','VUL-011','No posee mecanismo de respaldo','No posee','Sin observacion','2023-08-05 12:00:00'),(12,1,'2023-08-05 12:00:00','VUL-012','No posee alta disponibilidad','No posee','Sin observacion','2023-08-05 12:00:00'),(13,1,'2023-08-05 12:00:00','VUL-013','Falta de mecanismo de redundancia','Falta','Sin observacion','2023-08-05 12:00:00'),(14,1,'2023-08-05 12:00:00','VUL-014','Mantenimiento insuficiente / instalación defectuosa','Manteminiento','Sin observacion','2023-08-05 12:00:00'),(15,1,'2023-08-05 12:00:00','VUL-015','Falta de precaucion en las conexiones fisicas','Falta ','Sin observacion','2023-08-05 12:00:00'),(16,1,'2023-08-05 12:00:00','VUL-016','Falta de esquema de ampliar capacidad','Falta','Sin observacion','2023-08-05 12:00:00'),(17,1,'2023-08-05 12:00:00','VUL-017','Falla de equipos dependientes','Falla','Sin observacion','2023-08-05 12:00:00'),(18,1,'2023-08-05 12:00:00','VUL-018','Fallo de los componentes ','Fallo','Sin observacion','2023-08-05 12:00:00'),(19,2,'2023-08-05 12:00:00','VUL-019','Pruebas de software inexistentes o insuficientes','Pruebas','Sin observacion','2023-08-05 12:00:00'),(20,2,'2023-08-05 12:00:00','VUL-020','Errores conocidos en el software.','Errores','Sin observacion','2023-08-05 12:00:00'),(21,2,'2023-08-05 12:00:00','VUL-021','No \'logout\' al salir de la estación de trabajo','No logout','Sin observacion','2023-08-05 12:00:00'),(22,2,'2023-08-05 12:00:00','VUL-022','Eliminación o reutilización de medios de almacenamiento sin el correcto borrado','Eliminacion','Sin observacion','2023-08-05 12:00:00'),(23,2,'2023-08-05 12:00:00','VUL-023','Falta de pista de auditoria','Falta','Sin observacion','2023-08-05 12:00:00'),(24,2,'2023-08-05 12:00:00','VUL-024','Asignación errónea de derechos de acceso','Asignación','Sin observacion','2023-08-05 12:00:00'),(25,2,'2023-08-05 12:00:00','VUL-025','Software de amplia distribución','Software','Sin observacion','2023-08-05 12:00:00'),(26,2,'2023-08-05 12:00:00','VUL-026','Aplicando programas de aplicación a los datos incorrectos en términos de tiempo.','Aplicando','Sin observacion','2023-08-05 12:00:00'),(27,2,'2023-08-05 12:00:00','VUL-027','Interfaz de usuario complicada','Interfaz','Sin observacion','2023-08-05 12:00:00'),(28,2,'2023-08-05 12:00:00','VUL-028','Falta de documentacion técnica','Falta','Sin observacion','2023-08-05 12:00:00'),(29,2,'2023-08-05 12:00:00','VUL-029','Configuración incorrecta de parámetros','Configuración','Sin observacion','2023-08-05 12:00:00'),(30,2,'2023-08-05 12:00:00','VUL-030','Fechas incorrectas','Fechas','Sin observacion','2023-08-05 12:00:00'),(31,2,'2023-08-05 12:00:00','VUL-031','Falta de mecanismos de identificación y autenticación como la autenticación de usuarios.','Falta','Sin observacion','2023-08-05 12:00:00'),(32,2,'2023-08-05 12:00:00','VUL-032','Tablas de contraseñas no protegidas','Tablas','Sin observacion','2023-08-05 12:00:00'),(33,2,'2023-08-05 12:00:00','VUL-033','Mala gestión de contraseñas','Mala','Sin observacion','2023-08-05 12:00:00'),(34,2,'2023-08-05 12:00:00','VUL-034','Servicios innecesarios habilitados','Servicio','Sin observacion','2023-08-05 12:00:00'),(35,2,'2023-08-05 12:00:00','VUL-035','Software inmaduro o nuevo','Software','Sin observacion','2023-08-05 12:00:00'),(36,2,'2023-08-05 12:00:00','VUL-036','Especificaciones poco claras o incompletas para desarrolladores','Especificacion','Sin observacion','2023-08-05 12:00:00'),(37,2,'2023-08-05 12:00:00','VUL-037','Falta de control efectivo del cambio','Falta','Sin observacion','2023-08-05 12:00:00'),(38,2,'2023-08-05 12:00:00','VUL-038','Descarga incontrolada y uso de software.','Descarga','Sin observacion','2023-08-05 12:00:00'),(39,2,'2023-08-05 12:00:00','VUL-039','Falta de copias de respaldo','Falta','Sin observacion','2023-08-05 12:00:00'),(40,2,'2023-08-05 12:00:00','VUL-040','Falta de protección física del edificio, puertas y ventanas.','Falta','Sin observacion','2023-08-05 12:00:00'),(41,2,'2023-08-05 12:00:00','VUL-041','No se producen informes de gestión','No se produce','Sin observacion','2023-08-05 12:00:00'),(42,2,'2023-08-05 12:00:00','VUL-042','No posee un procedimiento de respaldo','No posee','Sin observacion','2023-08-05 12:00:00'),(43,2,'2023-08-05 12:00:00','VUL-043','Obsolecencia del Software','Obsolencencia','Sin observacion','2023-08-05 12:00:00'),(44,2,'2023-08-05 12:00:00','VUL-044','Presenta errores logicos el software','Errores','Sin observacion','2023-08-05 12:00:00'),(45,2,'2023-08-05 12:00:00','VUL-045','Inexistente ambiente de pruebas','Inexistente','Sin observacion','2023-08-05 12:00:00'),(46,2,'2023-08-05 12:00:00','VUL-046','No cuenta con mecanismos contra ataques informáticos','No cuenta','Sin observacion','2023-08-05 12:00:00'),(47,3,'2023-08-05 12:00:00','VUL-047','Falta de comprobante de envío o recepción de un mensaje.','Falta','Sin observacion','2023-08-05 12:00:00'),(48,3,'2023-08-05 12:00:00','VUL-048','Líneas de comunicación desprotegidas.','Líneas','Sin observacion','2023-08-05 12:00:00'),(49,3,'2023-08-05 12:00:00','VUL-049','Tráfico sensible no protegido','Tráfico','Sin observacion','2023-08-05 12:00:00'),(50,3,'2023-08-05 12:00:00','VUL-050','Presenta cableado deficiente ','Presenta','Sin observacion','2023-08-05 12:00:00'),(51,3,'2023-08-05 12:00:00','VUL-051','Punto único de fallo','Punto','Sin observacion','2023-08-05 12:00:00'),(52,3,'2023-08-05 12:00:00','VUL-052','Falta de identificación y autenticación del remitente y receptor.','Falta','Sin observacion','2023-08-05 12:00:00'),(53,3,'2023-08-05 12:00:00','VUL-053','Arquitectura de red insegura','Arquitectura','Sin observacion','2023-08-05 12:00:00'),(54,3,'2023-08-05 12:00:00','VUL-054','Transferencia de contraseñas en claro','Transferencia','Sin observacion','2023-08-05 12:00:00'),(55,3,'2023-08-05 12:00:00','VUL-055','Gestión inadecuada de la red (resistencia de enrutamiento)','Gestión','Sin observacion','2023-08-05 12:00:00'),(56,3,'2023-08-05 12:00:00','VUL-056','Conexiones de red pública sin protección.','Conexiones','Sin observacion','2023-08-05 12:00:00'),(57,3,'2023-08-05 12:00:00','VUL-057','Gestión inadecuado del accesos a Internet en las unidades de gestión','Gestión','Sin observacion','2023-08-05 12:00:00'),(58,3,'2023-08-05 12:00:00','VUL-058','Intermitencia en el trafico de la red ','Intermitencia','Sin observacion','2023-08-05 12:00:00'),(59,3,'2023-08-05 12:00:00','VUL-059','Falla de enlaces externos-terceros','Falla','Sin observacion','2023-08-05 12:00:00'),(60,4,'2023-08-05 12:00:00','VUL-060','Ausencia de personal','Ausencia','Sin observacion','2023-08-05 12:00:00'),(61,4,'2023-08-05 12:00:00','VUL-061','Procedimientos de reclutamiento inadecuados.','Procedimiento','Sin observacion','2023-08-05 12:00:00'),(62,4,'2023-08-05 12:00:00','VUL-062','Capacitación de seguridad insuficiente','Capacitación','Sin observacion','2023-08-05 12:00:00'),(63,4,'2023-08-05 12:00:00','VUL-063','Uso incorrecto de software y hardware','Uso incorrecto','Sin observacion','2023-08-05 12:00:00'),(64,4,'2023-08-05 12:00:00','VUL-064','Falta de conciencia de seguridad','Falta','Sin observacion','2023-08-05 12:00:00'),(65,4,'2023-08-05 12:00:00','VUL-065','Falta de mecanismos de seguimiento.','Falta','Sin observacion','2023-08-05 12:00:00'),(66,4,'2023-08-05 12:00:00','VUL-066','Trabajo no supervisado por personal externo o de limpieza.','Trabajo','Sin observacion','2023-08-05 12:00:00'),(67,4,'2023-08-05 12:00:00','VUL-067','Falta de políticas para el uso correcto de los medios de comunicación y mensajería de telecomunicaciones.','Falta','Sin observacion','2023-08-05 12:00:00'),(68,4,'2023-08-05 12:00:00','VUL-068','Falta de capacitación en la administración del activo','Falta','Sin observacion','2023-08-05 12:00:00'),(69,4,'2023-08-05 12:00:00','VUL-069','No existe la divulgacion adecuada del expertise adquirido','No existe','Sin observacion','2023-08-05 12:00:00'),(70,5,'2023-08-05 12:00:00','VUL-070','Uso inadecuado o descuidado del control de acceso físico a edificios y habitaciones','Uo inadecuado','Sin observacion','2023-08-05 12:00:00'),(71,5,'2023-08-05 12:00:00','VUL-071','Ubicación en un área susceptible a inundaciones.','Ubicación','Sin observacion','2023-08-05 12:00:00'),(72,5,'2023-08-05 12:00:00','VUL-072','Red eléctrica inestable','Red','Sin observacion','2023-08-05 12:00:00'),(73,5,'2023-08-05 12:00:00','VUL-073','Falta de protección física del edificio, puertas y ventanas.','Falta','Sin observacion','2023-08-05 12:00:00'),(74,5,'2023-08-05 12:00:00','VUL-074','Susceptible a incendios y altas temperaturas','Susceptible','Sin observacion','2023-08-05 12:00:00'),(75,5,'2023-08-05 12:00:00','VUL-075','Espacio fisico designado no reune condiciones tecnicas','Espacion fisico','Sin observacion','2023-08-05 12:00:00'),(76,5,'2023-08-05 12:00:00','VUL-076','Susceptibilidad a movimientos e impactos excesivos en la estructura del edificio','Susceptibilidad','Sin observacion','2023-08-05 12:00:00'),(77,6,'2023-08-05 12:00:00','VUL-077','Falta de trámite formal de registro de uso y anulación de registro.','Falta','Sin observacion','2023-08-05 12:00:00'),(78,6,'2023-08-05 12:00:00','VUL-078','Falta de proceso formal para la revisión de los derechos de acceso (supervisión)','Falta','Sin observacion','2023-08-05 12:00:00'),(79,6,'2023-08-05 12:00:00','VUL-079','Falta o insuficiente de las disposiciones (relativas a la seguridad) en los contratos con clientes y / o terceros','Falta','Sin observacion','2023-08-05 12:00:00'),(80,6,'2023-08-05 12:00:00','VUL-080','Falta de procedimiento de monitoreo de las instalaciones de procesamiento de información.','Falta','Sin observacion','2023-08-05 12:00:00'),(81,6,'2023-08-05 12:00:00','VUL-081','Falta de auditorias regulares (supervisión)','Falta','Sin observacion','2023-08-05 12:00:00'),(82,6,'2023-08-05 12:00:00','VUL-082','Falta de procedimientos de identificación y evaluación de riesgos.','Falta','Sin observacion','2023-08-05 12:00:00'),(83,6,'2023-08-05 12:00:00','VUL-083','Informes de falta de fallas registrados por el administrador y los registros del operador','Informes','Sin observacion','2023-08-05 12:00:00'),(84,6,'2023-08-05 12:00:00','VUL-084','Servicio inadecuado respuesta de mantenimiento','Servicio','Sin observacion','2023-08-05 12:00:00'),(85,6,'2023-08-05 12:00:00','VUL-085','Falta o falta de acuerdo de nivel de servicio','Falta','Sin observacion','2023-08-05 12:00:00'),(86,6,'2023-08-05 12:00:00','VUL-086','Falta de procedimiento de control de cambios.','Falta','Sin observacion','2023-08-05 12:00:00'),(87,6,'2023-08-05 12:00:00','VUL-087','Falta de procedimiento formal para el control de la documentación del SGSI.','Falta','Sin observacion','2023-08-05 12:00:00'),(88,6,'2023-08-05 12:00:00','VUL-088','Falta de procedimiento formal para la supervisión del registro del SGSI.','Falta','Sin observacion','2023-08-05 12:00:00'),(89,6,'2023-08-05 12:00:00','VUL-089','Falta de un proceso formal para la autorización de la información pública disponible.','Falta','Sin observacion','2023-08-05 12:00:00'),(90,6,'2023-08-05 12:00:00','VUL-090','Falta de asignación adecuada de las responsabilidades de seguridad de la información.','Falta','Sin observacion','2023-08-05 12:00:00'),(91,6,'2023-08-05 12:00:00','VUL-091','Falta de planes de continuidad.','Falta','Sin observacion','2023-08-05 12:00:00'),(92,6,'2023-08-05 12:00:00','VUL-092','Falta de política de uso del correo electrónico','Falta','Sin observacion','2023-08-05 12:00:00'),(93,6,'2023-08-05 12:00:00','VUL-093','Falta de procedimientos para introducir software en sistemas operativos.','Falta','Sin observacion','2023-08-05 12:00:00'),(94,6,'2023-08-05 12:00:00','VUL-094','Falta de registros en los registros de administrador y operador.','Falta','Sin observacion','2023-08-05 12:00:00'),(95,6,'2023-08-05 12:00:00','VUL-095','Falta de procedimientos para el manejo de información clasificada.','Falta','Sin observacion','2023-08-05 12:00:00'),(96,6,'2023-08-05 12:00:00','VUL-096','Falta de responsabilidades de seguridad de la información en las descripciones de los puestos.','Falta','Sin observacion','2023-08-05 12:00:00'),(97,6,'2023-08-05 12:00:00','VUL-097','Falta o insuficiencia de disposiciones (en materia de seguridad) seguridad de la información) en contratos con empleados','Falta','Sin observacion','2023-08-05 12:00:00'),(98,6,'2023-08-05 12:00:00','VUL-098','Falta de proceso disciplinario definido en caso de incidente de seguridad de la información.','Falta','Sin observacion','2023-08-05 12:00:00'),(99,6,'2023-08-05 12:00:00','VUL-099','Falta de política formal sobre el uso de computadoras móviles','Falta','Sin observacion','2023-08-05 12:00:00'),(100,6,'2023-08-05 12:00:00','VUL-100','Falta de control de los activos fuera de las instalaciones','Falta','Sin observacion','2023-08-05 12:00:00'),(101,6,'2023-08-05 12:00:00','VUL-101','Falta o insuficiente política de \'limpiar escritorio y pantalla\'','Falta','Sin observacion','2023-08-05 12:00:00'),(102,6,'2023-08-05 12:00:00','VUL-102','Falta de autorización para el procesamiento de la información.','Falta','Sin observacion','2023-08-05 12:00:00'),(103,6,'2023-08-05 12:00:00','VUL-103','Falta de mecanismos de monitoreo establecidos para violaciones de seguridad.','Falta','Sin observacion','2023-08-05 12:00:00'),(104,6,'2023-08-05 12:00:00','VUL-104','La falta de revisiones de gestión regulares','La falta','Sin observacion','2023-08-05 12:00:00'),(105,6,'2023-08-05 12:00:00','VUL-105','Falta de procedimientos para reportar debilidades de seguridad.','Falta','Sin observacion','2023-08-05 12:00:00'),(106,6,'2023-08-05 12:00:00','VUL-106','Falta de procedimientos de cumplimiento de los derechos de propiedad intelectual.','Falta','Sin observacion','2023-08-05 12:00:00'),(107,6,'2023-08-05 12:00:00','VUL-107','Falta socialización de politicas internas y externas','Falta','Sin observacion','2023-08-05 12:00:00'),(108,6,'2023-08-05 12:00:00','VUL-108','Falta de politica formal de cambio de credenciales','Falta','Sin observacion','2023-08-05 12:00:00'),(109,6,'2023-08-05 12:00:00','VUL-109','Falta de gestión en la disponibilidad de repuestos de equipos criticos','Falta','Sin observacion','2023-08-05 12:00:00'),(110,6,'2023-08-05 12:00:00','VUL-110','Falta de politicas internas de gestión y cumplimiento','Falta','Sin observacion','2023-08-05 12:00:00'),(111,6,'2023-08-05 12:00:00','VUL-111','Falta de garantía técnica de los equipos','Falta','Sin observacion','2023-08-05 12:00:00'),(112,6,'2023-08-05 12:00:00','VUL-112','Falta de licenciamiento vigente ','Falta','Sin observacion','2023-08-05 12:00:00'),(113,6,'2023-08-05 12:00:00','VUL-113','Falta de planes de recuperación','Falta','Sin observacion','2023-08-05 12:00:00'),(114,6,'2023-08-05 12:00:00','VUL-114','Falta de planes de contingencia','Falta','Sin observacion','2023-08-05 12:00:00'),(115,6,'2023-08-05 12:00:00','VUL-115','Falta de soporte preventivo y correctivo','Falta','Sin observacion','2023-08-05 12:00:00'),(116,6,'2023-08-05 12:00:00','VUL-116','Falta de mantenimiento y/o actualizaciones','Falta','Sin observacion','2023-08-05 12:00:00'),(117,6,'2023-08-05 12:00:00','VUL-117','Falta de planes de crecimiento y expansión de servicios de TI','Falta','Sin observacion','2023-08-05 12:00:00');
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

-- Dump completed on 2024-02-02 14:52:16
