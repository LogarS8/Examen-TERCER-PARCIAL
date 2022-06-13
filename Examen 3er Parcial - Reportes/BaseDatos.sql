CREATE DATABASE  IF NOT EXISTS `reg_reportes_inmuebles` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reg_reportes_inmuebles`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: reg_reportes_inmuebles
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `alu_id` int NOT NULL AUTO_INCREMENT,
  `alu_correo` varchar(45) COLLATE latin1_bin NOT NULL,
  `alu_contraseña` varchar(45) COLLATE latin1_bin NOT NULL,
  `alu_grado` int NOT NULL,
  `alu_turno` char(1) COLLATE latin1_bin NOT NULL,
  `alu_grupo` int NOT NULL,
  `alu_nombre` varchar(45) COLLATE latin1_bin NOT NULL,
  `alu_boleta` varchar(45) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'demian.ironhide@gmail.com','demian',5,'V',9,'Demian','2021090833'),(3,'demi@gmail.com','demi',3,'V',10,'Demiancito','20202020'),(4,'rodrigo@gmail.com','rodri',4,'V',7,'rodrigo','2021090909');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `asi_id` int unsigned NOT NULL AUTO_INCREMENT,
  `asi_nom` varchar(28) NOT NULL,
  PRIMARY KEY (`asi_id`),
  KEY `asi_nom` (`asi_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (3,'ADMON. PROY.'),(6,'BD'),(2,'LAB. 1'),(5,'LAB. 2'),(1,'POO'),(4,'PSW'),(7,'TEC. PERSONALES');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu`
--

DROP TABLE IF EXISTS `cpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpu` (
  `cpu_serial` varchar(28) NOT NULL,
  `cpu_descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cpu_serial`),
  KEY `cpu_descripcion` (`cpu_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

LOCK TABLES `cpu` WRITE;
/*!40000 ALTER TABLE `cpu` DISABLE KEYS */;
INSERT INTO `cpu` VALUES ('CPU001','Computadora Negra Dell'),('CPU002','Computadora Negra Hp'),('CPU003','Computadora Negra Hp'),('CPU004','Computadora Negra Hp'),('CPU005','Computadora Negra Hp'),('CPU006','Computadora Negra Hp');
/*!40000 ALTER TABLE `cpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `equ_etiqueta` varchar(10) NOT NULL,
  `cpu_serial` varchar(20) NOT NULL,
  `tec_id` varchar(20) NOT NULL,
  `mou_id` varchar(20) NOT NULL,
  `mar_id` int unsigned NOT NULL,
  `mon_id` varchar(20) NOT NULL,
  PRIMARY KEY (`equ_etiqueta`),
  KEY `cpu_serial` (`cpu_serial`),
  KEY `tec_id` (`tec_id`),
  KEY `mou_id` (`mou_id`),
  KEY `mar_id` (`mar_id`),
  KEY `mon_id` (`mon_id`),
  CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`cpu_serial`) REFERENCES `cpu` (`cpu_serial`),
  CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`tec_id`) REFERENCES `teclados` (`tec_id`),
  CONSTRAINT `equipo_ibfk_3` FOREIGN KEY (`mou_id`) REFERENCES `mouses` (`mou_id`),
  CONSTRAINT `equipo_ibfk_4` FOREIGN KEY (`mar_id`) REFERENCES `marcas` (`mar_id`),
  CONSTRAINT `equipo_ibfk_5` FOREIGN KEY (`mon_id`) REFERENCES `monitores` (`mon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES ('LBD1','CPU001','TECLADO001','MOUSE001',1,'MONITOR001'),('LBD2','CPU002','TECLADO002','MOUSE002',2,'MONITOR002'),('LDS1','CPU003','TECLADO003','MOUSE003',3,'MONITOR003'),('LDS2','CPU004','TECLADO004','MOUSE004',1,'MONITOR004'),('LNT1','CPU005','TECLADO005','MOUSE005',2,'MONITOR005');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `est_id` int unsigned NOT NULL AUTO_INCREMENT,
  `est_nom` varchar(128) NOT NULL,
  PRIMARY KEY (`est_id`),
  KEY `est_nom` (`est_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (2,'Atendiendo'),(1,'En Espera'),(3,'Solucionado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorios`
--

DROP TABLE IF EXISTS `laboratorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorios` (
  `lab_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lab_nom` varchar(28) NOT NULL,
  PRIMARY KEY (`lab_id`),
  KEY `lab_nom` (`lab_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorios`
--

LOCK TABLES `laboratorios` WRITE;
/*!40000 ALTER TABLE `laboratorios` DISABLE KEYS */;
INSERT INTO `laboratorios` VALUES (4,'A4.0'),(1,'LBD'),(2,'LDS'),(3,'LNT');
/*!40000 ALTER TABLE `laboratorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquinas`
--

DROP TABLE IF EXISTS `maquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquinas` (
  `maq_id` int NOT NULL AUTO_INCREMENT,
  `maq_salon` varchar(45) NOT NULL,
  `maq_unidad` varchar(45) NOT NULL,
  `maq_numero` int NOT NULL,
  `id_alu` int NOT NULL,
  PRIMARY KEY (`maq_id`),
  KEY `alu_id_idx` (`id_alu`),
  CONSTRAINT `alu_id` FOREIGN KEY (`id_alu`) REFERENCES `alumnos` (`alu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquinas`
--

LOCK TABLES `maquinas` WRITE;
/*!40000 ALTER TABLE `maquinas` DISABLE KEYS */;
INSERT INTO `maquinas` VALUES (27,'LBD','POO',2,3),(28,'LBD','LPTII',30,3),(29,'LBD','APTII',12,3),(30,'LBD','PSW',12,4),(31,'LNV','LPTIII',22,4),(32,'4.0','BD',11,4),(33,'LDS','TPPC',10,4);
/*!40000 ALTER TABLE `maquinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `mar_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mar_nom` varchar(128) NOT NULL,
  PRIMARY KEY (`mar_id`),
  KEY `mar_nom` (`mar_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (3,'Acer'),(1,'Dell'),(2,'Hp');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitores`
--

DROP TABLE IF EXISTS `monitores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitores` (
  `mon_id` varchar(28) NOT NULL,
  `mon_descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mon_id`),
  KEY `mon_descripcion` (`mon_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitores`
--

LOCK TABLES `monitores` WRITE;
/*!40000 ALTER TABLE `monitores` DISABLE KEYS */;
INSERT INTO `monitores` VALUES ('MONITOR001','Monitor Dell'),('MONITOR002','Monitor Dell'),('MONITOR003','Monitor Dell'),('MONITOR004','Monitor Dell'),('MONITOR005','Monitor Dell'),('MONITOR006','Monitor Hp');
/*!40000 ALTER TABLE `monitores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mouses`
--

DROP TABLE IF EXISTS `mouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mouses` (
  `mou_id` varchar(28) NOT NULL,
  `mou_descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mou_id`),
  KEY `mou_descripcion` (`mou_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mouses`
--

LOCK TABLES `mouses` WRITE;
/*!40000 ALTER TABLE `mouses` DISABLE KEYS */;
INSERT INTO `mouses` VALUES ('MOUSE001','Mouse Dell'),('MOUSE002','Mouse Dell'),('MOUSE003','Mouse Dell'),('MOUSE004','Mouse Dell'),('MOUSE005','Mouse Dell'),('MOUSE006','Mouse Hp');
/*!40000 ALTER TABLE `mouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridades`
--

DROP TABLE IF EXISTS `prioridades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prioridades` (
  `pri_id` int unsigned NOT NULL AUTO_INCREMENT,
  `pri_nom` varchar(128) NOT NULL,
  PRIMARY KEY (`pri_id`),
  KEY `pri_nom` (`pri_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridades`
--

LOCK TABLES `prioridades` WRITE;
/*!40000 ALTER TABLE `prioridades` DISABLE KEYS */;
INSERT INTO `prioridades` VALUES (1,'Alta'),(3,'Baja'),(2,'Media');
/*!40000 ALTER TABLE `prioridades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `pro_id` int unsigned NOT NULL AUTO_INCREMENT,
  `pro_numempleado` int unsigned NOT NULL,
  `pro_nombre` varchar(25) NOT NULL,
  `pro_appat` varchar(25) NOT NULL,
  `pro_apmat` varchar(25) NOT NULL,
  `sex_id` int unsigned NOT NULL,
  `pro_fnacimiento` date DEFAULT NULL,
  `pro_email` varchar(100) NOT NULL,
  `pro_contrasena` varchar(30) NOT NULL,
  `pro_creatat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pro_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `pro_email` (`pro_email`),
  KEY `pro_numempleado` (`pro_numempleado`),
  KEY `pro_nombre` (`pro_nombre`),
  KEY `sex_id` (`sex_id`),
  CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`sex_id`) REFERENCES `sexos` (`sex_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,20210901,'Ian','Ayala','Gonzalez',1,'2004-10-13','ayala.gonzalez.ian@gmail.com','99310675','2022-06-10 16:28:47',1),(2,20210902,'Maria','Suarez','Marquez',2,'2005-01-19','example@gmail.com','131022','2022-06-10 16:28:47',1),(3,23,'Demian','Fajardo','Alvarez',1,'2005-06-25','demian.ironhide@gmail.com','demiandemian','2022-06-10 16:32:51',1);
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `rep_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lab_id` int unsigned NOT NULL,
  `rep_fechahora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `equ_etiqueta` varchar(10) NOT NULL,
  `pro_nombre` varchar(25) NOT NULL,
  `pro_numempleado` int unsigned NOT NULL,
  `asi_id` int unsigned DEFAULT NULL,
  `rep_problema` varchar(255) NOT NULL,
  `rep_estado` enum('Funcional','No Funcional') DEFAULT NULL,
  `pri_id` int unsigned NOT NULL,
  `est_id` int unsigned DEFAULT NULL,
  `tecn_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`rep_id`),
  KEY `lab_id` (`lab_id`),
  KEY `rep_fechahora` (`rep_fechahora`),
  KEY `equ_etiqueta` (`equ_etiqueta`),
  KEY `pro_nombre` (`pro_nombre`),
  KEY `pro_numempleado` (`pro_numempleado`),
  KEY `asi_id` (`asi_id`),
  KEY `rep_problema` (`rep_problema`),
  KEY `rep_estado` (`rep_estado`),
  KEY `pri_id` (`pri_id`),
  KEY `est_id` (`est_id`),
  KEY `tecn_id` (`tecn_id`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `laboratorios` (`lab_id`),
  CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`equ_etiqueta`) REFERENCES `equipos` (`equ_etiqueta`),
  CONSTRAINT `reportes_ibfk_3` FOREIGN KEY (`pro_nombre`) REFERENCES `profesores` (`pro_nombre`),
  CONSTRAINT `reportes_ibfk_4` FOREIGN KEY (`pro_numempleado`) REFERENCES `profesores` (`pro_numempleado`),
  CONSTRAINT `reportes_ibfk_5` FOREIGN KEY (`asi_id`) REFERENCES `asignaturas` (`asi_id`),
  CONSTRAINT `reportes_ibfk_6` FOREIGN KEY (`pri_id`) REFERENCES `prioridades` (`pri_id`),
  CONSTRAINT `reportes_ibfk_7` FOREIGN KEY (`est_id`) REFERENCES `estados` (`est_id`),
  CONSTRAINT `reportes_ibfk_8` FOREIGN KEY (`tecn_id`) REFERENCES `tecnicos` (`tecn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,1,'2022-06-10 16:28:51','LBD1','Ian',20210901,1,'Presenta Pantallazos azules y error al hacer click','Funcional',1,1,1),(2,3,'2022-06-10 16:28:51','LDS2','Maria',20210902,4,'Error al boton de encendio','No Funcional',2,1,2);
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexos`
--

DROP TABLE IF EXISTS `sexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexos` (
  `sex_id` int unsigned NOT NULL AUTO_INCREMENT,
  `sex_nom` varchar(28) NOT NULL,
  PRIMARY KEY (`sex_id`),
  KEY `sex_nom` (`sex_nom`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexos`
--

LOCK TABLES `sexos` WRITE;
/*!40000 ALTER TABLE `sexos` DISABLE KEYS */;
INSERT INTO `sexos` VALUES (2,'Femenino'),(1,'Masculino');
/*!40000 ALTER TABLE `sexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teclados`
--

DROP TABLE IF EXISTS `teclados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teclados` (
  `tec_id` varchar(28) NOT NULL,
  `tec_descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tec_id`),
  KEY `tec_descripcion` (`tec_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teclados`
--

LOCK TABLES `teclados` WRITE;
/*!40000 ALTER TABLE `teclados` DISABLE KEYS */;
INSERT INTO `teclados` VALUES ('TECLADO001','Teclado Dell Gris'),('TECLADO002','Teclado Dell Gris'),('TECLADO003','Teclado Dell Gris'),('TECLADO004','Teclado Dell Gris'),('TECLADO005','Teclado Dell Gris'),('TECLADO006','Teclado Hp Gris');
/*!40000 ALTER TABLE `teclados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicos`
--

DROP TABLE IF EXISTS `tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnicos` (
  `tecn_id` int unsigned NOT NULL AUTO_INCREMENT,
  `tecn_nombrec` varchar(128) NOT NULL,
  PRIMARY KEY (`tecn_id`),
  KEY `tecn_nombrec` (`tecn_nombrec`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicos`
--

LOCK TABLES `tecnicos` WRITE;
/*!40000 ALTER TABLE `tecnicos` DISABLE KEYS */;
INSERT INTO `tecnicos` VALUES (3,'Belen Morales Pelaez'),(2,'Jesus Tenorio Davila'),(1,'Sebastian Lopez Carrazco');
/*!40000 ALTER TABLE `tecnicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-12  0:47:38
