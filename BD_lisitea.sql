-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: lisitea
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_actividades`
--

DROP TABLE IF EXISTS `tbl_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_actividades` (
  `PK_id_actividades` int(11) NOT NULL,
  `VCH_campo_a` varchar(3500) NOT NULL,
  `BLB_campo_b` blob NOT NULL,
  `FK_id_seccion_c` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_actividades`),
  KEY `FK_id_seccion_c_idx` (`FK_id_seccion_c`),
  CONSTRAINT `FK_id_seccion_c` FOREIGN KEY (`FK_id_seccion_c`) REFERENCES `tbl_seccion_c` (`pk_id_seccion_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_actividades`
--

LOCK TABLES `tbl_actividades` WRITE;
/*!40000 ALTER TABLE `tbl_actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aprendizaje_esperado`
--

DROP TABLE IF EXISTS `tbl_aprendizaje_esperado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_aprendizaje_esperado` (
  `PK_id_aprendizaje_esperado` int(11) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  `FK_id_asignatura` int(11) NOT NULL,
  `FK_id_producto_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_aprendizaje_esperado`),
  KEY `FK_id_asignatura_3_idx` (`FK_id_asignatura`),
  KEY `FK_id_producto_esperado_2_idx` (`FK_id_producto_esperado`),
  CONSTRAINT `FK_id_asignatura_3` FOREIGN KEY (`FK_id_asignatura`) REFERENCES `tbl_asignatura` (`pk_id_asignatura`),
  CONSTRAINT `FK_id_producto_esperado_2` FOREIGN KEY (`FK_id_producto_esperado`) REFERENCES `tbl_producto_esperado` (`pk_id_producto_esperado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aprendizaje_esperado`
--

LOCK TABLES `tbl_aprendizaje_esperado` WRITE;
/*!40000 ALTER TABLE `tbl_aprendizaje_esperado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprendizaje_esperado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignatura`
--

DROP TABLE IF EXISTS `tbl_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_asignatura` (
  `PK_id_asignatura` int(11) NOT NULL,
  `FK_id_campo_disciplinar` int(11) NOT NULL,
  `VCH_nombre` varchar(20) NOT NULL,
  `VCH_clave` varchar(100) NOT NULL,
  PRIMARY KEY (`PK_id_asignatura`),
  KEY `FK_id_campo_disciplinar_idx` (`FK_id_campo_disciplinar`),
  CONSTRAINT `FK_id_campo_disciplinar_1` FOREIGN KEY (`FK_id_campo_disciplinar`) REFERENCES `tbl_campo_disciplinar` (`pk_id_campo_disciplinar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignatura`
--

LOCK TABLES `tbl_asignatura` WRITE;
/*!40000 ALTER TABLE `tbl_asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_campo_disciplinar`
--

DROP TABLE IF EXISTS `tbl_campo_disciplinar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_campo_disciplinar` (
  `PK_id_campo_disciplinar` int(11) NOT NULL,
  `VCH_nombre` varchar(100) NOT NULL,
  `VCH_clave` varchar(100) NOT NULL,
  PRIMARY KEY (`PK_id_campo_disciplinar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_campo_disciplinar`
--

LOCK TABLES `tbl_campo_disciplinar` WRITE;
/*!40000 ALTER TABLE `tbl_campo_disciplinar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_campo_disciplinar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_competencia_disciplinar`
--

DROP TABLE IF EXISTS `tbl_competencia_disciplinar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_competencia_disciplinar` (
  `PK_id_competencia_disciplinar` int(11) NOT NULL,
  `VCH_identificador` varchar(20) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_id_competencia_disciplinar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_competencia_disciplinar`
--

LOCK TABLES `tbl_competencia_disciplinar` WRITE;
/*!40000 ALTER TABLE `tbl_competencia_disciplinar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_competencia_disciplinar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_competencia_generica`
--

DROP TABLE IF EXISTS `tbl_competencia_generica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_competencia_generica` (
  `PK_id_competencia_generica` int(11) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  `INT_identificador` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_competencia_generica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_competencia_generica`
--

LOCK TABLES `tbl_competencia_generica` WRITE;
/*!40000 ALTER TABLE `tbl_competencia_generica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_competencia_generica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_competencia_generica_a`
--

DROP TABLE IF EXISTS `tbl_competencia_generica_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_competencia_generica_a` (
  `PK_id_competencia_generica_a` int(11) NOT NULL,
  `VCH_nombre` varchar(20) NOT NULL,
  `FLT_identificador` float(4,2) NOT NULL,
  `FK_competencia_generica` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_competencia_generica_a`),
  KEY `FK_competencia_generica_idx` (`FK_competencia_generica`),
  CONSTRAINT `FK_competencia_generica` FOREIGN KEY (`FK_competencia_generica`) REFERENCES `tbl_competencia_generica` (`pk_id_competencia_generica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_competencia_generica_a`
--

LOCK TABLES `tbl_competencia_generica_a` WRITE;
/*!40000 ALTER TABLE `tbl_competencia_generica_a` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_competencia_generica_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_competencia_profesional`
--

DROP TABLE IF EXISTS `tbl_competencia_profesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_competencia_profesional` (
  `PK_id_competencia_profesional` int(11) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_id_competencia_profesional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_competencia_profesional`
--

LOCK TABLES `tbl_competencia_profesional` WRITE;
/*!40000 ALTER TABLE `tbl_competencia_profesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_competencia_profesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_componente`
--

DROP TABLE IF EXISTS `tbl_componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_componente` (
  `PK_id_componente` int(11) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  `FK_id_asignatura` int(11) NOT NULL,
  `FK_id_producto_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_componente`),
  KEY `FK_producto_esperado_idx` (`FK_id_producto_esperado`),
  KEY `FK_id_asignatura_1_idx` (`FK_id_asignatura`),
  CONSTRAINT `FK_id_asignatura_1` FOREIGN KEY (`FK_id_asignatura`) REFERENCES `tbl_asignatura` (`pk_id_asignatura`),
  CONSTRAINT `FK_id_producto_esperado` FOREIGN KEY (`FK_id_producto_esperado`) REFERENCES `tbl_producto_esperado` (`pk_id_producto_esperado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_componente`
--

LOCK TABLES `tbl_componente` WRITE;
/*!40000 ALTER TABLE `tbl_componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cont_central`
--

DROP TABLE IF EXISTS `tbl_cont_central`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_cont_central` (
  `PK_id_cont_central` int(11) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  `FK_id_asignatura` int(11) NOT NULL,
  `FK_id_producto_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_cont_central`),
  KEY `FK_id_asignatura_5_idx` (`FK_id_asignatura`),
  KEY `FK_id_producto_esperado_4_idx` (`FK_id_producto_esperado`),
  CONSTRAINT `FK_id_asignatura_5` FOREIGN KEY (`FK_id_asignatura`) REFERENCES `tbl_asignatura` (`pk_id_asignatura`),
  CONSTRAINT `FK_id_producto_esperado_4` FOREIGN KEY (`FK_id_producto_esperado`) REFERENCES `tbl_producto_esperado` (`pk_id_producto_esperado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cont_central`
--

LOCK TABLES `tbl_cont_central` WRITE;
/*!40000 ALTER TABLE `tbl_cont_central` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cont_central` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cont_especifico`
--

DROP TABLE IF EXISTS `tbl_cont_especifico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_cont_especifico` (
  `PK_id_cont_especifico` int(11) NOT NULL,
  `FK_id_asignatura` int(11) NOT NULL,
  `VCH_descripcion` varchar(500) NOT NULL,
  `FK_id_producto_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_cont_especifico`),
  KEY `FK_id_asignatura_2_idx` (`FK_id_asignatura`),
  KEY `FK_id_producto_esperado_1_idx` (`FK_id_producto_esperado`),
  CONSTRAINT `FK_id_asignatura_2` FOREIGN KEY (`FK_id_asignatura`) REFERENCES `tbl_asignatura` (`pk_id_asignatura`),
  CONSTRAINT `FK_id_producto_esperado_1` FOREIGN KEY (`FK_id_producto_esperado`) REFERENCES `tbl_producto_esperado` (`pk_id_producto_esperado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cont_especifico`
--

LOCK TABLES `tbl_cont_especifico` WRITE;
/*!40000 ALTER TABLE `tbl_cont_especifico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cont_especifico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eje`
--

DROP TABLE IF EXISTS `tbl_eje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_eje` (
  `PK_id_eje` int(11) NOT NULL,
  `VCH_descripcion` varchar(150) NOT NULL,
  `FK_id_asignatura` int(11) NOT NULL,
  `FK_id_producto_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_eje`),
  KEY `FK_id_producto_esperado_3_idx` (`FK_id_producto_esperado`),
  KEY `FK_id_asignatura_idx` (`FK_id_asignatura`),
  CONSTRAINT `FK_id_asignatura_4` FOREIGN KEY (`FK_id_asignatura`) REFERENCES `tbl_asignatura` (`pk_id_asignatura`),
  CONSTRAINT `FK_id_producto_esperado_3` FOREIGN KEY (`FK_id_producto_esperado`) REFERENCES `tbl_producto_esperado` (`pk_id_producto_esperado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eje`
--

LOCK TABLES `tbl_eje` WRITE;
/*!40000 ALTER TABLE `tbl_eje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_eje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_espacio_fisico`
--

DROP TABLE IF EXISTS `tbl_espacio_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_espacio_fisico` (
  `PK_id_espacio_fisico` int(11) NOT NULL,
  `VCH_nombre` varchar(1100) NOT NULL,
  PRIMARY KEY (`PK_id_espacio_fisico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_espacio_fisico`
--

LOCK TABLES `tbl_espacio_fisico` WRITE;
/*!40000 ALTER TABLE `tbl_espacio_fisico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_espacio_fisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_especialidad`
--

DROP TABLE IF EXISTS `tbl_especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_especialidad` (
  `PK_id_especialidad` int(11) NOT NULL,
  `VCH_nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`PK_id_especialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_especialidad`
--

LOCK TABLES `tbl_especialidad` WRITE;
/*!40000 ALTER TABLE `tbl_especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_habil_socioeconomica`
--

DROP TABLE IF EXISTS `tbl_habil_socioeconomica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_habil_socioeconomica` (
  `PK_id_habil_socieconomica` int(11) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_id_habil_socieconomica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_habil_socioeconomica`
--

LOCK TABLES `tbl_habil_socioeconomica` WRITE;
/*!40000 ALTER TABLE `tbl_habil_socioeconomica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_habil_socioeconomica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nivel_taxonomico`
--

DROP TABLE IF EXISTS `tbl_nivel_taxonomico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_nivel_taxonomico` (
  `PK_id_nivel_taxonomico` int(11) NOT NULL,
  `INT_nivel` int(11) NOT NULL,
  `VCH_verbo` varchar(20) NOT NULL,
  PRIMARY KEY (`PK_id_nivel_taxonomico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nivel_taxonomico`
--

LOCK TABLES `tbl_nivel_taxonomico` WRITE;
/*!40000 ALTER TABLE `tbl_nivel_taxonomico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nivel_taxonomico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuario` (
  `PK_id_usuario` int(11) NOT NULL,
  `VCH_nombre` varchar(20) NOT NULL,
  `VCH_ap_paterno` varchar(20) NOT NULL,
  `VCH_ap_materno` varchar(20) NOT NULL,
  `VCH_curp` varchar(18) NOT NULL,
  `VCH_contrasenia` varchar(10) NOT NULL,
  `VCH_correo_electronico` varchar(25) NOT NULL,
  `INT_tipo_de_usuario` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--


LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `tbl_plantel`
--

DROP TABLE IF EXISTS `tbl_plantel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_plantel` (
  `PK_id_plantel` int(11) NOT NULL,
  `VCH_institucion` varchar(20) NOT NULL,
  `VCH_plantel` varchar(20) NOT NULL,
  `VCH_CCT` varchar(20) NOT NULL,
  PRIMARY KEY (`PK_id_plantel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_plantel`
--

LOCK TABLES `tbl_plantel` WRITE;
/*!40000 ALTER TABLE `tbl_plantel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_plantel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_planeacion`
--

DROP TABLE IF EXISTS `tbl_planeacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_planeacion` (
  `PK_id_planeacion` int(11) NOT NULL,
  `FK_id_plantel` int(11) NOT NULL,
  `FK_id_usuario` int(11) NOT NULL,
  `FK_id_seccion_a` int(11) NOT NULL,
  `FK_id_seccion_b` int(11) NOT NULL,
  `VCH_realizo` varchar(100) NOT NULL,
  PRIMARY KEY (`PK_id_planeacion`),
  KEY `FK_id_seleccion_a_idx` (`FK_id_seccion_a`),
  KEY `FK_id_seleccion_b_idx` (`FK_id_seccion_b`),
  KEY `FK_id_plantel_idx` (`FK_id_plantel`),
  KEY `FK_id_usuario_idx` (`FK_id_usuario`),
  CONSTRAINT `FK_id_seccion_a_1` FOREIGN KEY (`FK_id_seccion_a`) REFERENCES `tbl_seccion_a` (`pk_id_seccion_a`),
  CONSTRAINT `FK_id_seccion_b_1` FOREIGN KEY (`FK_id_seccion_b`) REFERENCES `tbl_seccion_b` (`pk_id_seccion_b`),
  CONSTRAINT `FK_id_plantel_1` FOREIGN KEY (`FK_id_plantel`) REFERENCES `tbl_plantel` (`pk_id_plantel`),
  CONSTRAINT `FK_id_usuario_1` FOREIGN KEY (`FK_id_usuario`) REFERENCES `tbl_usuario` (`pk_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_planeacion`
--

LOCK TABLES `tbl_planeacion` WRITE;
/*!40000 ALTER TABLE `tbl_planeacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_planeacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_producto_esperado`
--

DROP TABLE IF EXISTS `tbl_producto_esperado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_producto_esperado` (
  `PK_id_producto_esperado` int(11) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  `FK_id_asignatura` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_producto_esperado`),
  KEY `FK_id_asignatura_idx` (`FK_id_asignatura`),
  CONSTRAINT `FK_id_asignatura` FOREIGN KEY (`FK_id_asignatura`) REFERENCES `tbl_asignatura` (`pk_id_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_producto_esperado`
--

LOCK TABLES `tbl_producto_esperado` WRITE;
/*!40000 ALTER TABLE `tbl_producto_esperado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_producto_esperado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_a`
--

DROP TABLE IF EXISTS `tbl_seccion_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_a` (
  `PK_id_seccion_a` int(11) NOT NULL,
  `FK_id_campo_disciplinar` int(11) NOT NULL,
  `VCH_semestre` varchar(30) NOT NULL,
  `VCH_num_parcial` varchar(30) NOT NULL,
  `VCH_numero_planeacion` varchar(20) NOT NULL,
  `VCH_titulo_planeacion` varchar(50) NOT NULL,
  `INT_porcentaje` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_seccion_a`),
  KEY `FK_id_campo_disciplinar_idx` (`FK_id_campo_disciplinar`),
  CONSTRAINT `FK_id_campo_disciplinar` FOREIGN KEY (`FK_id_campo_disciplinar`) REFERENCES `tbl_campo_disciplinar` (`pk_id_campo_disciplinar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_a`
--

LOCK TABLES `tbl_seccion_a` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_a` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_aprendizaje`
--

DROP TABLE IF EXISTS `tbl_seccion_aprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_aprendizaje` (
  `PFK_id_seccion_b` int(11) NOT NULL,
  `PFK_id_aprendizaje_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_b`,`PFK_id_aprendizaje_esperado`),
  KEY `PFK_id_aprendizaje_esperado_idx` (`PFK_id_aprendizaje_esperado`),
  CONSTRAINT `PFK_id_aprendizaje_esperado` FOREIGN KEY (`PFK_id_aprendizaje_esperado`) REFERENCES `tbl_aprendizaje_esperado` (`pk_id_aprendizaje_esperado`),
  CONSTRAINT `PFK_id_seccion_b_3` FOREIGN KEY (`PFK_id_seccion_b`) REFERENCES `tbl_seccion_b` (`pk_id_seccion_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_aprendizaje`
--

LOCK TABLES `tbl_seccion_aprendizaje` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_aprendizaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_aprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_b`
--

DROP TABLE IF EXISTS `tbl_seccion_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_b` (
  `PK_id_seccion_b` int(11) NOT NULL,
  `VCH_proposito` varchar(300) NOT NULL,
  `FK_id_eje` int(11) NOT NULL,
  `FK_id_cont_central` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_seccion_b`),
  KEY `FK_id_cont_central_idx` (`FK_id_cont_central`),
  KEY `FK_id_eje_idx` (`FK_id_eje`),
  CONSTRAINT `FK_id_cont_central` FOREIGN KEY (`FK_id_cont_central`) REFERENCES `tbl_cont_central` (`PK_id_cont_central`),
  CONSTRAINT `FK_id_eje` FOREIGN KEY (`FK_id_eje`) REFERENCES `tbl_eje` (`pk_id_eje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_b`
--

LOCK TABLES `tbl_seccion_b` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_c`
--

DROP TABLE IF EXISTS `tbl_seccion_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_c` (
  `PK_id_seccion_c` int(11) NOT NULL,
  `FK_id_planeacion` int(11) NOT NULL,
  `VCH_tipo` varchar(11) NOT NULL,
  `INT_posicion` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_seccion_c`),
  KEY `FK_id_planeacion_idx` (`FK_id_planeacion`),
  CONSTRAINT `FK_id_planeacion` FOREIGN KEY (`FK_id_planeacion`) REFERENCES `tbl_planeacion` (`PK_id_planeacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_c`
--

LOCK TABLES `tbl_seccion_c` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_competenciad`
--

DROP TABLE IF EXISTS `tbl_seccion_competenciad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_competenciad` (
  `PK_id_seccion_competenciad` int(11) NOT NULL,
  `FK_id_seccion_b` int(11) NOT NULL,
  `FK_id_competencia_disciplinar` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_seccion_competenciad`),
  KEY `FK_id_seccion_b_idx` (`FK_id_seccion_b`),
  KEY `FK_id_competencia_disciplinar_idx` (`FK_id_competencia_disciplinar`),
  CONSTRAINT `FK_id_competencia_disciplinar` FOREIGN KEY (`FK_id_competencia_disciplinar`) REFERENCES `tbl_competencia_disciplinar` (`pk_id_competencia_disciplinar`),
  CONSTRAINT `FK_id_seccion_b_4` FOREIGN KEY (`FK_id_seccion_b`) REFERENCES `tbl_seccion_b` (`pk_id_seccion_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_competenciad`
--

LOCK TABLES `tbl_seccion_competenciad` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_competenciad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_competenciad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_competenciag`
--

DROP TABLE IF EXISTS `tbl_seccion_competenciag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_competenciag` (
  `PK_id_seccion_competenciag` int(11) NOT NULL,
  `FK_id_seccion_b` int(11) NOT NULL,
  `FK_id_competencia_generica` int(11) NOT NULL,
  `FK_id_competencia_generica_a` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_seccion_competenciag`),
  KEY `FK_id_competencia_generica_a_idx` (`FK_id_competencia_generica_a`),
  KEY `FK_id_competencia_generica_idx` (`FK_id_competencia_generica`),
  CONSTRAINT `FK_id_competencia_generica` FOREIGN KEY (`FK_id_competencia_generica`) REFERENCES `tbl_competencia_generica` (`pk_id_competencia_generica`),
  CONSTRAINT `FK_id_competencia_generica_a` FOREIGN KEY (`FK_id_competencia_generica_a`) REFERENCES `tbl_competencia_generica_a` (`pk_id_competencia_generica_a`),
  CONSTRAINT `FK_id_seccion_b_7` FOREIGN KEY (`FK_id_seccion_b`) REFERENCES `tbl_seccion_b` (`pk_id_seccion_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_competenciag`
--

LOCK TABLES `tbl_seccion_competenciag` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_competenciag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_competenciag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_competenciap`
--

DROP TABLE IF EXISTS `tbl_seccion_competenciap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_competenciap` (
  `PFK_id_seccion_b` int(11) NOT NULL,
  `PFK_id_competencia_profesional` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_b`,`PFK_id_competencia_profesional`),
  KEY `PFK_id_competencia_profesional_idx` (`PFK_id_competencia_profesional`),
  CONSTRAINT `PFK_id_competencia_profesional` FOREIGN KEY (`PFK_id_competencia_profesional`) REFERENCES `tbl_competencia_profesional` (`pk_id_competencia_profesional`),
  CONSTRAINT `PFK_id_seccion_b_5` FOREIGN KEY (`PFK_id_seccion_b`) REFERENCES `tbl_seccion_b` (`pk_id_seccion_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_competenciap`
--

LOCK TABLES `tbl_seccion_competenciap` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_competenciap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_competenciap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_componente`
--

DROP TABLE IF EXISTS `tbl_seccion_componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_componente` (
  `PFK_id_seccion_b` int(11) NOT NULL,
  `PFK_id_componente` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_b`,`PFK_id_componente`),
  KEY `PFK_id_componente_idx` (`PFK_id_componente`),
  CONSTRAINT `PFK_id_componente` FOREIGN KEY (`PFK_id_componente`) REFERENCES `tbl_componente` (`PK_id_componente`),
  CONSTRAINT `PFK_id_seccion_b_2` FOREIGN KEY (`PFK_id_seccion_b`) REFERENCES `tbl_seccion_b` (`pk_id_seccion_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_componente`
--

LOCK TABLES `tbl_seccion_componente` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_contenido`
--

DROP TABLE IF EXISTS `tbl_seccion_contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_contenido` (
  `PFK_id_seccion_b` int(11) NOT NULL,
  `PFK_id_cont_especifico` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_b`,`PFK_id_cont_especifico`),
  KEY `PFK_id_cont_especifico_idx` (`PFK_id_cont_especifico`),
  CONSTRAINT `PFK_id_cont_especifico` FOREIGN KEY (`PFK_id_cont_especifico`) REFERENCES `tbl_cont_especifico` (`pk_id_cont_especifico`),
  CONSTRAINT `PFK_id_seccion_b_1` FOREIGN KEY (`PFK_id_seccion_b`) REFERENCES `tbl_seccion_b` (`pk_id_seccion_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_contenido`
--

LOCK TABLES `tbl_seccion_contenido` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_contenido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_contenido` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tbl_seccion_d`
--

DROP TABLE IF EXISTS `tbl_seccion_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_d` (
  `PK_id_seccion_d` int(11) NOT NULL,
  `FK_id_planeacion` int(11) NOT NULL,
  `VCH_equipo` varchar(1100) NOT NULL,
  `VCH_material` varchar(1100) NOT NULL,
  `VCH_fuentes` varchar(1500) NOT NULL,
  PRIMARY KEY (`PK_id_seccion_d`),
  KEY `FK_id_planeacion_idx` (`FK_id_planeacion`),
  CONSTRAINT `FK_id_planeacion_1` FOREIGN KEY (`FK_id_planeacion`) REFERENCES `tbl_planeacion` (`PK_id_planeacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_d`
--

LOCK TABLES `tbl_seccion_d` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_e`
--

DROP TABLE IF EXISTS `tbl_seccion_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_e` (
  `PK_id_seccion_e` int(11) NOT NULL,
  `FK_id_planeacion` int(11) NOT NULL,
  `INT_numero` int(11) NOT NULL,
  `VCH_instrumento` varchar(150) NOT NULL,
  `INT_porcentaje` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_seccion_e`),
  KEY `FK_id_planeacion_idx` (`FK_id_planeacion`),
  CONSTRAINT `FK_id_planeacion_2` FOREIGN KEY (`FK_id_planeacion`) REFERENCES `tbl_planeacion` (`PK_id_planeacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_e`
--

LOCK TABLES `tbl_seccion_e` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_espacio`
--

DROP TABLE IF EXISTS `tbl_seccion_espacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_espacio` (
  `PFK_id_seccion_d` int(11) NOT NULL,
  `PFK_id_espacio_fisico` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_d`,`PFK_id_espacio_fisico`),
  KEY `PFK_id_espacio_fisico_idx` (`PFK_id_espacio_fisico`),
  CONSTRAINT `PFK_id_espacio_fisico` FOREIGN KEY (`PFK_id_espacio_fisico`) REFERENCES `tbl_espacio_fisico` (`PK_id_espacio_fisico`),
  CONSTRAINT `PFK_id_seccion_d` FOREIGN KEY (`PFK_id_seccion_d`) REFERENCES `tbl_seccion_d` (`PK_id_seccion_d`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_espacio`
--

LOCK TABLES `tbl_seccion_espacio` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_espacio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_espacio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_especialidad`
--

DROP TABLE IF EXISTS `tbl_seccion_especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_especialidad` (
  `PFK_id_especialidad` int(11) NOT NULL,
  `PFK_id_seccion_a` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_especialidad`,`PFK_id_seccion_a`),
  KEY `PFK_id_seccion_a_idx` (`PFK_id_seccion_a`),
  CONSTRAINT `PFK_id_especialidad` FOREIGN KEY (`PFK_id_especialidad`) REFERENCES `tbl_especialidad` (`pk_id_especialidad`),
  CONSTRAINT `PFK_id_seccion_a` FOREIGN KEY (`PFK_id_seccion_a`) REFERENCES `tbl_seccion_a` (`PK_id_seccion_a`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_especialidad`
--

LOCK TABLES `tbl_seccion_especialidad` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_especialidad` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tbl_seccion_habilidad`
--

DROP TABLE IF EXISTS `tbl_seccion_habilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_habilidad` (
  `PFK_id_seccion_b` int(11) NOT NULL,
  `PFK_id_habil_socieconomica` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_b`,`PFK_id_habil_socieconomica`),
  KEY `PFK_id_habil_socieconomica_idx` (`PFK_id_habil_socieconomica`),
  CONSTRAINT `PFK_id_habil_socieconomica` FOREIGN KEY (`PFK_id_habil_socieconomica`) REFERENCES `tbl_habil_socioeconomica` (`pk_id_habil_socieconomica`),
  CONSTRAINT `PFK_id_seccion_b_6` FOREIGN KEY (`PFK_id_seccion_b`) REFERENCES `tbl_seccion_b` (`pk_id_seccion_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_habilidad`
--

LOCK TABLES `tbl_seccion_habilidad` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_habilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_habilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_nivel`
--

DROP TABLE IF EXISTS `tbl_seccion_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_nivel` (
  `PFK_id_seccion_c` int(11) NOT NULL,
  `PFK_id_nivel_taxonomico` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_c`,`PFK_id_nivel_taxonomico`),
  KEY `PFK_id_seccion_c_idx` (`PFK_id_seccion_c`),
  KEY `PFK_id_nivel_taxonomico_idx` (`PFK_id_nivel_taxonomico`),
  CONSTRAINT `PFK_id_seccion_c` FOREIGN KEY (`PFK_id_seccion_c`) REFERENCES `tbl_seccion_c` (`pk_id_seccion_c`),
  CONSTRAINT `PFK_id_nivel_taxonomico` FOREIGN KEY (`PFK_id_nivel_taxonomico`) REFERENCES `tbl_nivel_taxonomico` (`pk_id_nivel_taxonomico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_nivel`
--

LOCK TABLES `tbl_seccion_nivel` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_nivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_producto`
--

DROP TABLE IF EXISTS `tbl_seccion_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_producto` (
  `PFK_id_seccion_b` int(11) NOT NULL,
  `PFK_id_producto_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_b`,`PFK_id_producto_esperado`),
  KEY `PFK_id_producto_esperado_idx` (`PFK_id_producto_esperado`),
  KEY `PFK_id_seccion_b_idx` (`PFK_id_seccion_b`),
  CONSTRAINT `PFK_id_producto_esperado` FOREIGN KEY (`PFK_id_producto_esperado`) REFERENCES `tbl_producto_esperado` (`pk_id_producto_esperado`),
  CONSTRAINT `PFK_id_seccion_b` FOREIGN KEY (`PFK_id_seccion_b`) REFERENCES `tbl_seccion_b` (`PK_id_seccion_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_producto`
--

LOCK TABLES `tbl_seccion_producto` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_titulo`
--

DROP TABLE IF EXISTS `tbl_seccion_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_titulo` (
  `PFK_id_seccion_e` int(11) NOT NULL,
  `PFK_id_titulo` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_e`,`PFK_id_titulo`),
  KEY `PFK_id_titulo_idx` (`PFK_id_titulo`),
  CONSTRAINT `PFK_id_seccion_e` FOREIGN KEY (`PFK_id_seccion_e`) REFERENCES `tbl_seccion_e` (`pk_id_seccion_e`),
  CONSTRAINT `PFK_id_titulo` FOREIGN KEY (`PFK_id_titulo`) REFERENCES `tbl_titulo` (`pk_id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_titulo`
--

LOCK TABLES `tbl_seccion_titulo` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_titulo`
--

DROP TABLE IF EXISTS `tbl_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_titulo` (
  `PK_id_titulo` int(11) NOT NULL,
  `VCH_descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`PK_id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_titulo`
--

LOCK TABLES `tbl_titulo` WRITE;
/*!40000 ALTER TABLE `tbl_titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_titulo` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `tbl_seccion_c_competencia_g`
--

DROP TABLE IF EXISTS `tbl_seccion_c_competencia_g`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_c_competencia_g` (
  `PFK_id_seccion_c` int(11) NOT NULL,
  `PFK_id_seccion_competenciag` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_c`,`PFK_id_seccion_competenciag`),
  KEY `PFK_id_seccion_c_idx` (`PFK_id_seccion_c`),
  KEY `PFK_id_seccion_competenciag_idx` (`PFK_id_seccion_competenciag`),
  CONSTRAINT `PFK_id_seccion_c_1` FOREIGN KEY (`PFK_id_seccion_c`) REFERENCES `tbl_seccion_c` (`pk_id_seccion_c`),
  CONSTRAINT `PFK_id_seccion_competenciag` FOREIGN KEY (`PFK_id_seccion_competenciag`) REFERENCES `tbl_seccion_competenciag` (`PK_id_seccion_competenciag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_c_competencia_g`
--

LOCK TABLES `tbl_seccion_c_competencia_g` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_c_competencia_g` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_c_competencia_g` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_c_competencia_d`
--

DROP TABLE IF EXISTS `tbl_seccion_c_competencia_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_c_competencia_d` (
  `PFK_id_seccion_c` int(11) NOT NULL,
  `PFK_id_seccion_competenciad` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_seccion_c`,`PFK_id_seccion_competenciad`),
  KEY `PFK_id_seccion_c_idx` (`PFK_id_seccion_c`),
  KEY `PFK_id_seccion_d_idx` (`PFK_id_seccion_competenciad`),
  CONSTRAINT `PFK_id_seccion_c_2` FOREIGN KEY (`PFK_id_seccion_c`) REFERENCES `tbl_seccion_c` (`pk_id_seccion_c`),
  CONSTRAINT `PFK_id_seccion_competenciad` FOREIGN KEY (`PFK_id_seccion_competenciad`) REFERENCES `tbl_seccion_competenciad` (`PK_id_seccion_competenciad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_c_competencia_d`
--

LOCK TABLES `tbl_seccion_c_competencia_d` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_c_competencia_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_c_competencia_d` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-07  5:21:08
