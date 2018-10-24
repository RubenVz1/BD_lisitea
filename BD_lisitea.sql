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
  `FK_id_actividades_aprend` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_actividades`),
  KEY `FK_id_actividades_aprend_idx` (`FK_id_actividades_aprend`),
  CONSTRAINT `FK_id_actividades_aprend` FOREIGN KEY (`FK_id_actividades_aprend`) REFERENCES `tbl_actividades_aprend` (`pk_id_actividades_aprend`)
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
-- Table structure for table `tbl_habil_socioemocional`
--

DROP TABLE IF EXISTS `tbl_habil_socioemocional`;
SET character_set_client = utf8mb4 ;



CREATE TABLE `tbl_habil_socioemocional`
(
  `PK_id_habil_socioemocional` int(11) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_id_habil_socioemocional`)
) 



ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `tbl_habil_socioemocional` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nivel_taxonomico`
--

DROP TABLE IF EXISTS `tbl_nivel_taxonomico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_nivel_taxonomico` (
  `PK_id_nivel_taxonomico` int(11) NOT NULL,
  `TINT_nivel` tinyint(11) NOT NULL,
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
  `VCH_correo_electronico` varchar(40) NOT NULL,
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
SET character_set_client = utf8mb4 ;

CREATE TABLE `tbl_planeacion` 
(
  `PK_id_planeacion` int(11) NOT NULL,
  `FK_id_plantel` int(11) NOT NULL,
  `FK_id_datos_ident` int(11) NOT NULL,
  `FK_id_intenciones_form` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_planeacion`),
  KEY `FK_id_seleccion_a_idx` (`FK_id_datos_ident`),
  KEY `FK_id_seleccion_b_idx` (`FK_id_intenciones_form`),
  KEY `FK_id_plantel_idx` (`FK_id_plantel`),
  CONSTRAINT `FK_id_datos_ident_1` FOREIGN KEY (`FK_id_datos_ident`) REFERENCES `tbl_datos_ident` (`pk_id_datos_ident`),
  CONSTRAINT `FK_id_intenciones_form_1` FOREIGN KEY (`FK_id_intenciones_form`) REFERENCES `tbl_intenciones_form` (`pk_id_intenciones_form`),
  CONSTRAINT `FK_id_plantel_1` FOREIGN KEY (`FK_id_plantel`) REFERENCES `tbl_plantel` (`pk_id_plantel`)
)



ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `tbl_planeacion` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tbl_planeacion_usuario`;
SET character_set_client = utf8mb4 ;



CREATE TABLE `tbl_planeacion_usuario` 
(
  `PFK_id_planeacion` int(11) NOT NULL,
  `PFK_id_usuario` int(11) NOT NULL,
  `VCH_accion` varchar(15) NOT NULL,
  PRIMARY KEY (`PFK_id_planeacion`,`PFK_id_usuario`),
  KEY `PFK_id_planeacion_idx` (`PFK_id_planeacion`),
  KEY `PFK_id_usuario_idx` (`PFK_id_usuario`),
  CONSTRAINT `PFK_id_planeacion_1` FOREIGN KEY (`PFK_id_planeacion`) REFERENCES `tbl_planeacion` (`pk_id_planeacion`),
  CONSTRAINT `PFK_id_usuario_1` FOREIGN KEY (`PFK_id_usuario`) REFERENCES `tbl_usuario` (`pk_id_usuario`)
) 



ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `tbl_planeacion_usuario` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tbl_tipo_usuario`;
SET character_set_client = utf8mb4 ;



CREATE TABLE `tbl_tipo_usuario` 
(
  `PK_id_tipo_usuario` int(11) NOT NULL,
  `VCH_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`PK_id_tipo_usuario`)
) 



ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `tbl_tipo_usuario` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tbl_cargo_revisor`;
SET character_set_client = utf8mb4 ;



CREATE TABLE `tbl_cargo_revisor` 
(
  `PK_id_cargo_revisor` int(11) NOT NULL,
  `VCH_nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`PK_id_cargo_revisor`)
) 



ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `tbl_cargo_revisor` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tbl_usuario_tipo`;
SET character_set_client = utf8mb4 ;



CREATE TABLE `tbl_usuario_tipo` 
(
  `PFK_id_usuario` int(11) NOT NULL,
  `PFK_id_tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_tipo_usuario`,`PFK_id_usuario`),
  KEY `PFK_id_tipo_usuario_idx` (`PFK_id_tipo_usuario`),
  KEY `PFK_id_usuario_idx` (`PFK_id_usuario`),
  CONSTRAINT `PFK_id_tipo_usuario_2` FOREIGN KEY (`PFK_id_tipo_usuario`) REFERENCES `tbl_tipo_usuario` (`pk_id_tipo_usuario`),
  CONSTRAINT `PFK_id_usuario_2` FOREIGN KEY (`PFK_id_usuario`) REFERENCES `tbl_usuario` (`pk_id_usuario`)
) 



ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `tbl_usuario_tipo` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `tbl_usuario_cargo`;
SET character_set_client = utf8mb4 ;



CREATE TABLE `tbl_usuario_cargo` 
(
  `PFK_id_usuario` int(11) NOT NULL,
  `PFK_id_cargo_revisor` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_cargo_revisor`,`PFK_id_usuario`),
  KEY `PFK_id_cargo_revisor_idx` (`PFK_id_cargo_revisor`),
  KEY `PFK_id_usuario_idx` (`PFK_id_usuario`),
  CONSTRAINT `PFK_id_cargo_revisor_1` FOREIGN KEY (`PFK_id_cargo_revisor`) REFERENCES `tbl_cargo_revisor` (`pk_id_cargo_revisor`),
  CONSTRAINT `PFK_id_usuario_3` FOREIGN KEY (`PFK_id_usuario`) REFERENCES `tbl_usuario` (`pk_id_usuario`)
) 



ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `tbl_usuario_cargo` WRITE;
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
-- Table structure for table `tbl_datos_ident`
--

DROP TABLE IF EXISTS `tbl_datos_ident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_datos_ident` (
  `PK_id_datos_ident` int(11) NOT NULL,
  `FK_id_campo_disciplinar` int(11) NOT NULL,
  `VCH_semestre` varchar(30) NOT NULL,
  `VCH_num_parcial` varchar(30) NOT NULL,
  `VCH_numero_planeacion` varchar(20) NOT NULL,
  `VCH_titulo_planeacion` varchar(50) NOT NULL,
  `TINT_porcentaje` tinyint(11) NOT NULL,
  PRIMARY KEY (`PK_id_datos_ident`),
  KEY `FK_id_campo_disciplinar_idx` (`FK_id_campo_disciplinar`),
  CONSTRAINT `FK_id_campo_disciplinar` FOREIGN KEY (`FK_id_campo_disciplinar`) REFERENCES `tbl_campo_disciplinar` (`pk_id_campo_disciplinar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datos_ident`
--

LOCK TABLES `tbl_datos_ident` WRITE;
/*!40000 ALTER TABLE `tbl_datos_ident` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_datos_ident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_aprendizaje`
--

DROP TABLE IF EXISTS `tbl_seccion_aprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_aprendizaje` (
  `PFK_id_intenciones_form` int(11) NOT NULL,
  `PFK_id_aprendizaje_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_form`,`PFK_id_aprendizaje_esperado`),
  KEY `PFK_id_aprendizaje_esperado_idx` (`PFK_id_aprendizaje_esperado`),
  CONSTRAINT `PFK_id_aprendizaje_esperado` FOREIGN KEY (`PFK_id_aprendizaje_esperado`) REFERENCES `tbl_aprendizaje_esperado` (`pk_id_aprendizaje_esperado`),
  CONSTRAINT `PFK_id_intenciones_form_3` FOREIGN KEY (`PFK_id_intenciones_form`) REFERENCES `tbl_intenciones_form` (`pk_id_intenciones_form`)
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
-- Table structure for table `tbl_intenciones_form`
--

DROP TABLE IF EXISTS `tbl_intenciones_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_intenciones_form` (
  `PK_id_intenciones_form` int(11) NOT NULL,
  `VCH_proposito` varchar(300) NOT NULL,
  `FK_id_eje` int(11) NOT NULL,
  `FK_id_cont_central` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_intenciones_form`),
  KEY `FK_id_cont_central_idx` (`FK_id_cont_central`),
  KEY `FK_id_eje_idx` (`FK_id_eje`),
  CONSTRAINT `FK_id_cont_central` FOREIGN KEY (`FK_id_cont_central`) REFERENCES `tbl_cont_central` (`PK_id_cont_central`),
  CONSTRAINT `FK_id_eje` FOREIGN KEY (`FK_id_eje`) REFERENCES `tbl_eje` (`pk_id_eje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_intenciones_form`
--

LOCK TABLES `tbl_intenciones_form` WRITE;
/*!40000 ALTER TABLE `tbl_intenciones_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_intenciones_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_actividades_aprend`
--

DROP TABLE IF EXISTS `tbl_actividades_aprend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_actividades_aprend` (
  `PK_id_actividades_aprend` int(11) NOT NULL,
  `FK_id_planeacion` int(11) NOT NULL,
  `VCH_tipo` varchar(11) NOT NULL,
  `TINT_posicion` tinyint(11) NOT NULL,
  PRIMARY KEY (`PK_id_actividades_aprend`),
  KEY `FK_id_planeacion_idx` (`FK_id_planeacion`),
  CONSTRAINT `FK_id_planeacion` FOREIGN KEY (`FK_id_planeacion`) REFERENCES `tbl_planeacion` (`PK_id_planeacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_actividades_aprend`
--

LOCK TABLES `tbl_actividades_aprend` WRITE;
/*!40000 ALTER TABLE `tbl_actividades_aprend` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_actividades_aprend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_actividades_aprendompetenciad`
--

DROP TABLE IF EXISTS `tbl_seccion_competenciad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_competenciad` (
  `PK_id_seccion_competenciad` int(11) NOT NULL,
  `FK_id_intenciones_form` int(11) NOT NULL,
  `FK_id_competencia_disciplinar` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_seccion_competenciad`),
  KEY `FK_id_intenciones_form_idx` (`FK_id_intenciones_form`),
  KEY `FK_id_competencia_disciplinar_idx` (`FK_id_competencia_disciplinar`),
  CONSTRAINT `FK_id_competencia_disciplinar` FOREIGN KEY (`FK_id_competencia_disciplinar`) REFERENCES `tbl_competencia_disciplinar` (`pk_id_competencia_disciplinar`),
  CONSTRAINT `FK_id_intenciones_form_4` FOREIGN KEY (`FK_id_intenciones_form`) REFERENCES `tbl_intenciones_form` (`pk_id_intenciones_form`)
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
  `FK_id_intenciones_form` int(11) NOT NULL,
  `FK_id_competencia_generica` int(11) NOT NULL,
  `FK_id_competencia_generica_a` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_seccion_competenciag`),
  KEY `FK_id_competencia_generica_a_idx` (`FK_id_competencia_generica_a`),
  KEY `FK_id_competencia_generica_idx` (`FK_id_competencia_generica`),
  CONSTRAINT `FK_id_competencia_generica` FOREIGN KEY (`FK_id_competencia_generica`) REFERENCES `tbl_competencia_generica` (`pk_id_competencia_generica`),
  CONSTRAINT `FK_id_competencia_generica_a` FOREIGN KEY (`FK_id_competencia_generica_a`) REFERENCES `tbl_competencia_generica_a` (`pk_id_competencia_generica_a`),
  CONSTRAINT `FK_id_intenciones_form_7` FOREIGN KEY (`FK_id_intenciones_form`) REFERENCES `tbl_intenciones_form` (`pk_id_intenciones_form`)
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
  `PFK_id_intenciones_form` int(11) NOT NULL,
  `PFK_id_competencia_profesional` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_form`,`PFK_id_competencia_profesional`),
  KEY `PFK_id_competencia_profesional_idx` (`PFK_id_competencia_profesional`),
  CONSTRAINT `PFK_id_competencia_profesional` FOREIGN KEY (`PFK_id_competencia_profesional`) REFERENCES `tbl_competencia_profesional` (`pk_id_competencia_profesional`),
  CONSTRAINT `PFK_id_intenciones_form_5` FOREIGN KEY (`PFK_id_intenciones_form`) REFERENCES `tbl_intenciones_form` (`pk_id_intenciones_form`)
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
  `PFK_id_intenciones_form` int(11) NOT NULL,
  `PFK_id_componente` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_form`,`PFK_id_componente`),
  KEY `PFK_id_componente_idx` (`PFK_id_componente`),
  CONSTRAINT `PFK_id_componente` FOREIGN KEY (`PFK_id_componente`) REFERENCES `tbl_componente` (`PK_id_componente`),
  CONSTRAINT `PFK_id_intenciones_form_2` FOREIGN KEY (`PFK_id_intenciones_form`) REFERENCES `tbl_intenciones_form` (`pk_id_intenciones_form`)
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
  `PFK_id_intenciones_form` int(11) NOT NULL,
  `PFK_id_cont_especifico` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_form`,`PFK_id_cont_especifico`),
  KEY `PFK_id_cont_especifico_idx` (`PFK_id_cont_especifico`),
  CONSTRAINT `PFK_id_cont_especifico` FOREIGN KEY (`PFK_id_cont_especifico`) REFERENCES `tbl_cont_especifico` (`pk_id_cont_especifico`),
  CONSTRAINT `PFK_id_intenciones_form_1` FOREIGN KEY (`PFK_id_intenciones_form`) REFERENCES `tbl_intenciones_form` (`pk_id_intenciones_form`)
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
-- Table structure for table `tbl_recursos`
--

DROP TABLE IF EXISTS `tbl_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_recursos` (
  `PK_id_recursos` int(11) NOT NULL,
  `FK_id_planeacion` int(11) NOT NULL,
  `VCH_equipo` varchar(1100) NOT NULL,
  `VCH_material` varchar(1100) NOT NULL,
  `VCH_fuentes` varchar(1500) NOT NULL,
  `TINT_nivel` tinyint(11) NOT NULL,
  `FK_id_espacio_fisico` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_recursos`),
  KEY `FK_id_planeacion_idx` (`FK_id_planeacion`),
  KEY `FK_id_espacio_fisico_idx` (`FK_id_espacio_fisico`),
  CONSTRAINT `FK_id_espacio_fisico_1` FOREIGN KEY (`FK_id_espacio_fisico`) REFERENCES `tbl_espacio_fisico` (`PK_id_espacio_fisico`),
  CONSTRAINT `FK_id_planeacion_1` FOREIGN KEY (`FK_id_planeacion`) REFERENCES `tbl_planeacion` (`PK_id_planeacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recursos`
--

LOCK TABLES `tbl_recursos` WRITE;
/*!40000 ALTER TABLE `tbl_recursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_instrumentos`
--

DROP TABLE IF EXISTS `tbl_instrumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_instrumentos` (
  `PK_id_instrumentos` int(11) NOT NULL,
  `FK_id_planeacion` int(11) NOT NULL,
  `TINT_numero` tinyint(11) NOT NULL,
  `VCH_instrumento` varchar(150) NOT NULL,
  `TINT_porcentaje` tinyint(11) NOT NULL,
  `FK_id_titulo` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_instrumentos`),
  KEY `FK_id_planeacion_idx` (`FK_id_planeacion`),
  KEY `FK_id_titulo_idx` (`FK_id_planeacion`),
  CONSTRAINT `FK_id_planeacion_2` FOREIGN KEY (`FK_id_planeacion`) REFERENCES `tbl_planeacion` (`PK_id_planeacion`),
  CONSTRAINT `FK_id_titulo_2` FOREIGN KEY (`FK_id_titulo`) REFERENCES `tbl_titulo` (`PK_id_titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_instrumentos`
--

LOCK TABLES `tbl_instrumentos` WRITE;
/*!40000 ALTER TABLE `tbl_instrumentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_instrumentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_espacio`
--

DROP TABLE IF EXISTS `tbl_seccion_espacio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_espacio` (
  `PFK_id_recursos` int(11) NOT NULL,
  `PFK_id_espacio_fisico` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_recursos`,`PFK_id_espacio_fisico`),
  KEY `PFK_id_espacio_fisico_idx` (`PFK_id_espacio_fisico`),
  CONSTRAINT `PFK_id_espacio_fisico` FOREIGN KEY (`PFK_id_espacio_fisico`) REFERENCES `tbl_espacio_fisico` (`PK_id_espacio_fisico`),
  CONSTRAINT `PFK_id_recursos` FOREIGN KEY (`PFK_id_recursos`) REFERENCES `tbl_recursos` (`PK_id_recursos`)
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
  `PFK_id_datos_ident` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_especialidad`,`PFK_id_datos_ident`),
  KEY `PFK_id_datos_ident_idx` (`PFK_id_datos_ident`),
  CONSTRAINT `PFK_id_especialidad` FOREIGN KEY (`PFK_id_especialidad`) REFERENCES `tbl_especialidad` (`pk_id_especialidad`),
  CONSTRAINT `PFK_id_datos_ident` FOREIGN KEY (`PFK_id_datos_ident`) REFERENCES `tbl_datos_ident` (`PK_id_datos_ident`)
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
SET character_set_client = utf8mb4 ;
/*-----------------------------------------------------------------------------------------*/


CREATE TABLE `tbl_seccion_habilidad`
(
  `PFK_id_intenciones_form` int(11) NOT NULL,
  `PFK_id_habil_socioemocional` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_form`,`PFK_id_habil_socioemocional`),
  KEY `PFK_id_habil_socioemocional_idx` (`PFK_id_habil_socioemocional`),
  CONSTRAINT `PFK_id_habil_socioemocional` FOREIGN KEY (`PFK_id_habil_socioemocional`) REFERENCES `tbl_habil_socioemocional` (`pk_id_habil_socioemocional`),
  CONSTRAINT `PFK_id_intenciones_form_6` FOREIGN KEY (`PFK_id_intenciones_form`) REFERENCES `tbl_intenciones_form` (`pk_id_intenciones_form`)
) 


/*-----------------------------------------------------------------------------------------*/
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `tbl_seccion_habilidad` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_nivel`
--

DROP TABLE IF EXISTS `tbl_seccion_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_nivel` (
  `PFK_id_actividades_aprend` int(11) NOT NULL,
  `PFK_id_nivel_taxonomico` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_actividades_aprend`,`PFK_id_nivel_taxonomico`),
  KEY `PFK_id_actividades_aprend_idx` (`PFK_id_actividades_aprend`),
  KEY `PFK_id_nivel_taxonomico_idx` (`PFK_id_nivel_taxonomico`),
  CONSTRAINT `PFK_id_actividades_aprend` FOREIGN KEY (`PFK_id_actividades_aprend`) REFERENCES `tbl_actividades_aprend` (`pk_id_actividades_aprend`),
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
  `PFK_id_intenciones_form` int(11) NOT NULL,
  `PFK_id_producto_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_form`,`PFK_id_producto_esperado`),
  KEY `PFK_id_producto_esperado_idx` (`PFK_id_producto_esperado`),
  KEY `PFK_id_intenciones_form_idx` (`PFK_id_intenciones_form`),
  CONSTRAINT `PFK_id_producto_esperado` FOREIGN KEY (`PFK_id_producto_esperado`) REFERENCES `tbl_producto_esperado` (`pk_id_producto_esperado`),
  CONSTRAINT `PFK_id_intenciones_form` FOREIGN KEY (`PFK_id_intenciones_form`) REFERENCES `tbl_intenciones_form` (`PK_id_intenciones_form`)
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
  `PFK_id_instrumentos` int(11) NOT NULL,
  `PFK_id_titulo` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_instrumentos`,`PFK_id_titulo`),
  KEY `PFK_id_titulo_idx` (`PFK_id_titulo`),
  CONSTRAINT `PFK_id_instrumentos` FOREIGN KEY (`PFK_id_instrumentos`) REFERENCES `tbl_instrumentos` (`pk_id_instrumentos`),
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
-- Table structure for table `tbl_seccion_competencia_g`
--

DROP TABLE IF EXISTS `tbl_seccion_competencia_g`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_competencia_g` (
  `PFK_id_actividades_aprend` int(11) NOT NULL,
  `PFK_id_seccion_competenciag` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_actividades_aprend`,`PFK_id_seccion_competenciag`),
  KEY `PFK_id_actividades_aprend_idx` (`PFK_id_actividades_aprend`),
  KEY `PFK_id_seccion_competenciag_idx` (`PFK_id_seccion_competenciag`),
  CONSTRAINT `PFK_id_actividades_aprend_1` FOREIGN KEY (`PFK_id_actividades_aprend`) REFERENCES `tbl_actividades_aprend` (`pk_id_actividades_aprend`),
  CONSTRAINT `PFK_id_seccion_competenciag` FOREIGN KEY (`PFK_id_seccion_competenciag`) REFERENCES `tbl_seccion_competenciag` (`PK_id_seccion_competenciag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_competencia_g`
--

LOCK TABLES `tbl_seccion_competencia_g` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_competencia_g` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_competencia_g` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion_competencia_d`
--

DROP TABLE IF EXISTS `tbl_seccion_competencia_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seccion_competencia_d` (
  `PFK_id_actividades_aprend` int(11) NOT NULL,
  `PFK_id_seccion_competenciad` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_actividades_aprend`,`PFK_id_seccion_competenciad`),
  KEY `PFK_id_actividades_aprend_idx` (`PFK_id_actividades_aprend`),
  KEY `PFK_id_seccion_competenciad_idx` (`PFK_id_seccion_competenciad`),
  CONSTRAINT `PFK_id_actividades_aprend_2` FOREIGN KEY (`PFK_id_actividades_aprend`) REFERENCES `tbl_actividades_aprend` (`pk_id_actividades_aprend`),
  CONSTRAINT `PFK_id_seccion_competenciad` FOREIGN KEY (`PFK_id_seccion_competenciad`) REFERENCES `tbl_seccion_competenciad` (`PK_id_seccion_competenciad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion_competencia_d`
--

LOCK TABLES `tbl_seccion_competencia_d` WRITE;
/*!40000 ALTER TABLE `tbl_seccion_competencia_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion_competencia_d` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-07  5:21:08
