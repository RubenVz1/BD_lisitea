-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: lisitea2
-- ------------------------------------------------------
-- Server version	8.0.12

DROP DATABASE IF EXISTS base_de_datos;

CREATE DATABASE base_de_datos;

USE base_de_datos;

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
-- Table structure for table `tbl_actividad`
--

DROP TABLE IF EXISTS `tbl_actividad`;
SET character_set_client = utf8mb4;
CREATE TABLE `tbl_actividad` (
  `PK_id_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_campo_a` varchar(3500) NOT NULL,
  `BLB_campo_b` blob NOT NULL,
  PRIMARY KEY (`PK_id_actividad`)
);


--
-- Dumping data for table `tbl_actividad`
--

LOCK TABLES `tbl_actividad` WRITE;
/*!40000 ALTER TABLE `tbl_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_actividades_aprendizaje`
--

DROP TABLE IF EXISTS `tbl_actividades_aprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_actividades_aprendizaje` (
  `PK_id_actividades_aprendizaje` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_planeacion` int(11) NOT NULL,
  `FK_id_actividad` int(11) NOT NULL,
  `FK_id_nivel_taxonomico` int(11) NOT NULL,
  `VCH_tipo` int(11) NOT NULL,
  `TINT_posicion` tinyint(1) NOT NULL,
  `VCH_producto` varchar(200) NOT NULL,
  `VCH_tipo_instrumento` varchar(20) NOT NULL,
  `VCH_instrumento` varchar(150) NOT NULL,
  `VCH_indicador` varchar(200) NOT NULL,
  PRIMARY KEY (`PK_id_actividades_aprendizaje`),
  KEY `FK_id_planeacion_idx` (`FK_id_planeacion`),
  KEY `FK_id_actividad_idx` (`FK_id_actividad`),
  KEY `FK_id_nivel_taxonomico_idx` (`FK_id_nivel_taxonomico`),
  CONSTRAINT `FK_id_nivel_taxonomico` FOREIGN KEY (`FK_id_nivel_taxonomico`) REFERENCES `tbl_nivel_taxonomico` (`pk_id_nivel_taxonomico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_actividad` FOREIGN KEY (`FK_id_actividad`) REFERENCES `tbl_actividad` (`pk_id_actividad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_planeacion` FOREIGN KEY (`FK_id_planeacion`) REFERENCES `tbl_planeacion` (`PK_id_planeacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_actividades_aprendizaje`
--

LOCK TABLES `tbl_actividades_aprendizaje` WRITE;
/*!40000 ALTER TABLE `tbl_actividades_aprendizaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_actividades_aprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_actividades_competencia`
--

DROP TABLE IF EXISTS `tbl_actividades_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_actividades_competencia` (
  `PFK_id_actividades_aprendizaje` int(11) NOT NULL,
  `PFK_id_intenciones_competencia` int(11) NOT NULL,
  `VCH_seccion` varchar(20) NOT NULL,
  PRIMARY KEY (`PFK_id_actividades_aprendizaje`,`PFK_id_intenciones_competencia`),
  KEY `PFK_id_intenciones_competencia_idx` (`PFK_id_intenciones_competencia`),
  CONSTRAINT `PFK_id_actividades_aprendizaje` FOREIGN KEY (`PFK_id_actividades_aprendizaje`) REFERENCES `tbl_actividades_aprendizaje` (`pk_id_actividades_aprendizaje`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_intenciones_competencia` FOREIGN KEY (`PFK_id_intenciones_competencia`) REFERENCES `tbl_intenciones_competencia` (`PK_id_intenciones_competencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_actividades_competencia`
--

LOCK TABLES `tbl_actividades_competencia` WRITE;
/*!40000 ALTER TABLE `tbl_actividades_competencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_actividades_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aprendizaje_esperado`
--

DROP TABLE IF EXISTS `tbl_aprendizaje_esperado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_aprendizaje_esperado` (
  `PK_id_aprendizaje_esperado` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_id_aprendizaje_esperado`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aprendizaje_esperado`
--

LOCK TABLES `tbl_aprendizaje_esperado` WRITE;
/*!40000 ALTER TABLE `tbl_aprendizaje_esperado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprendizaje_esperado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aprendizaje_producto`
--

DROP TABLE IF EXISTS `tbl_aprendizaje_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_aprendizaje_producto` (
  `PFK_id_producto_esperado` int(11) NOT NULL,
  `PFK_id_aprendizaje_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_aprendizaje_esperado`,`PFK_id_producto_esperado`),
  KEY `PFK_id_producto_esperado_idx` (`PFK_id_producto_esperado`),
  CONSTRAINT `PFK_id_aprendizaje_esperado2` FOREIGN KEY (`PFK_id_aprendizaje_esperado`) REFERENCES `tbl_aprendizaje_esperado` (`pk_id_aprendizaje_esperado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_producto_esperado2` FOREIGN KEY (`PFK_id_producto_esperado`) REFERENCES `tbl_producto_esperado` (`pk_id_producto_esperado`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aprendizaje_producto`
--

LOCK TABLES `tbl_aprendizaje_producto` WRITE;
/*!40000 ALTER TABLE `tbl_aprendizaje_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprendizaje_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignatura`
--

DROP TABLE IF EXISTS `tbl_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_asignatura` (
  `PK_id_asignatura` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_campo_disciplinar` int(11) NOT NULL,
  `VCH_nombre` varchar(100) NOT NULL,
  `VCH_clave` varchar(20) NOT NULL,
  `TINT_semestre` tinyint(1) NOT NULL,
  PRIMARY KEY (`PK_id_asignatura`),
  KEY `FK_id_campo_disciplinar_idx` (`FK_id_campo_disciplinar`),
  CONSTRAINT `FK_id_campo_disciplinar_1` FOREIGN KEY (`FK_id_campo_disciplinar`) REFERENCES `tbl_campo_disciplinar` (`pk_id_campo_disciplinar`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignatura`
--

LOCK TABLES `tbl_asignatura` WRITE;
/*!40000 ALTER TABLE `tbl_asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_campo_competencia`
--

DROP TABLE IF EXISTS `tbl_campo_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_campo_competencia` (
  `PFK_id_competencia` int(11) NOT NULL,
  `PFK_id_campo_disciplinar` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_campo_disciplinar`,`PFK_id_competencia`),
  KEY `PFK_id_competencia_idx` (`PFK_id_competencia`),
  CONSTRAINT `PFK_id_campo_disciplinar` FOREIGN KEY (`PFK_id_campo_disciplinar`) REFERENCES `tbl_campo_disciplinar` (`pk_id_campo_disciplinar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_competencia` FOREIGN KEY (`PFK_id_competencia`) REFERENCES `tbl_competencia` (`pk_id_competencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_campo_competencia`
--

LOCK TABLES `tbl_campo_competencia` WRITE;
/*!40000 ALTER TABLE `tbl_campo_competencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_campo_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_atributo`
--

DROP TABLE IF EXISTS `tbl_atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_atributo` (
  `PK_id_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_descripcion` varchar(250) NOT NULL,
  `FLT_identificador` float DEFAULT NULL,
  `FK_id_competencia` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_atributo`),
  KEY `FK_id_competencia_idx` (`FK_id_competencia`),
  CONSTRAINT `FK_id_competencia` FOREIGN KEY (`FK_id_competencia`) REFERENCES `tbl_competencia` (`pk_id_competencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_atributo`
--

LOCK TABLES `tbl_atributo` WRITE;
/*!40000 ALTER TABLE `tbl_atributo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_atributo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_campo_disciplinar`
--

DROP TABLE IF EXISTS `tbl_campo_disciplinar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_campo_disciplinar` (
  `PK_id_campo_disciplinar` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_nombre` varchar(100) NOT NULL,
  `VCH_clave` varchar(100) NOT NULL,
  PRIMARY KEY (`PK_id_campo_disciplinar`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_campo_disciplinar`
--

LOCK TABLES `tbl_campo_disciplinar` WRITE;
/*!40000 ALTER TABLE `tbl_campo_disciplinar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_campo_disciplinar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_competencia`
--

DROP TABLE IF EXISTS `tbl_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_competencia` (
  `PK_id_competencia` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_identificador` varchar(20) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  `VCH_tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`PK_id_competencia`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_competencia`
--

LOCK TABLES `tbl_competencia` WRITE;
/*!40000 ALTER TABLE `tbl_competencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_componente`
--

DROP TABLE IF EXISTS `tbl_componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_componente` (
  `PK_id_componente` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_eje` int(11) NOT NULL,
  `VCH_descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_id_componente`),
  KEY `FK_id_eje_idx` (`FK_id_eje`),
  CONSTRAINT `FK_id_eje_1` FOREIGN KEY (`FK_id_eje`) REFERENCES `tbl_eje` (`pk_id_eje`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_componente`
--

LOCK TABLES `tbl_componente` WRITE;
/*!40000 ALTER TABLE `tbl_componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contenido_central`
--

DROP TABLE IF EXISTS `tbl_contenido_central`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_contenido_central` (
  `PK_id_contenido_central` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_descripcion` varchar(250) NOT NULL,
  `FK_id_componente` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_contenido_central`),
  KEY `FK_id_componente_idx` (`FK_id_componente`),
  CONSTRAINT `FK_id_componente` FOREIGN KEY (`FK_id_componente`) REFERENCES `tbl_componente` (`PK_id_componente`) ON DELETE CASCADE ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contenido_central`
--

LOCK TABLES `tbl_contenido_central` WRITE;
/*!40000 ALTER TABLE `tbl_contenido_central` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contenido_central` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contenido_especifico`
--

DROP TABLE IF EXISTS `tbl_contenido_especifico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_contenido_especifico` (
  `PK_id_contenido_especifico` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`PK_id_contenido_especifico`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contenido_especifico`
--

LOCK TABLES `tbl_contenido_especifico` WRITE;
/*!40000 ALTER TABLE `tbl_contenido_especifico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contenido_especifico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contenido_aprendizaje`
--

DROP TABLE IF EXISTS `tbl_contenido_aprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_contenido_aprendizaje` (
  `PFK_id_aprendizaje_esperado` int(11) NOT NULL,
  `PFK_id_contenido_especifico` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_contenido_especifico`,`PFK_id_aprendizaje_esperado`),
  KEY `PFK_id_aprendizaje_esperado_idx` (`PFK_id_aprendizaje_esperado`),
  CONSTRAINT `PFK_id_aprendizaje_esperado1` FOREIGN KEY (`PFK_id_aprendizaje_esperado`) REFERENCES `tbl_aprendizaje_esperado` (`pk_id_aprendizaje_esperado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_contenido_especifico1` FOREIGN KEY (`PFK_id_contenido_especifico`) REFERENCES `tbl_contenido_especifico` (`pk_id_contenido_especifico`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contenido_aprendizaje`
--

LOCK TABLES `tbl_contenido_aprendizaje` WRITE;
/*!40000 ALTER TABLE `tbl_contenido_aprendizaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contenido_aprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contenido_contenido`
--

DROP TABLE IF EXISTS `tbl_contenido_contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_contenido_contenido` (
  `PFK_id_contenido_especifico` int(11) NOT NULL,
  `PFK_id_contenido_central` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_contenido_central`,`PFK_id_contenido_especifico`),
  KEY `PFK_id_contenido_especifico_idx` (`PFK_id_contenido_especifico`),
  CONSTRAINT `PFK_id_contenido_central3` FOREIGN KEY (`PFK_id_contenido_central`) REFERENCES `tbl_contenido_central` (`pk_id_contenido_central`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_contenido_especifico3` FOREIGN KEY (`PFK_id_contenido_especifico`) REFERENCES `tbl_contenido_especifico` (`pk_id_contenido_especifico`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contenido_contenido`
--

LOCK TABLES `tbl_contenido_contenido` WRITE;
/*!40000 ALTER TABLE `tbl_contenido_contenido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contenido_contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_datos_asignatura`
--

DROP TABLE IF EXISTS `tbl_datos_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_datos_asignatura` (
  `PFK_id_datos_identificacion` int(11) NOT NULL,
  `PFK_id_asignatura` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_datos_identificacion`,`PFK_id_asignatura`),
  KEY `PFK_id_asignatura_idx` (`PFK_id_asignatura`),
  CONSTRAINT `PFK_id_asignatura2` FOREIGN KEY (`PFK_id_asignatura`) REFERENCES `tbl_asignatura` (`pk_id_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_datos_identificacion1` FOREIGN KEY (`PFK_id_datos_identificacion`) REFERENCES `tbl_datos_identificacion` (`PK_id_datos_identificacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datos_asignatura`
--

LOCK TABLES `tbl_datos_asignatura` WRITE;
/*!40000 ALTER TABLE `tbl_datos_asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_datos_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_datos_identificacion`
--

DROP TABLE IF EXISTS `tbl_datos_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_datos_identificacion` (
  `PK_id_datos_identificacion` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_semestre` varchar(30) NOT NULL,
  `VCH_numero_parcial` varchar(30) NOT NULL,
  `VCH_numero_planeacion` varchar(20) NOT NULL,
  `VCH_titulo_planeacion` varchar(50) NOT NULL,
  `TINT_porcentaje` tinyint(1) NOT NULL,
  PRIMARY KEY (`PK_id_datos_identificacion`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datos_identificacion`
--

LOCK TABLES `tbl_datos_identificacion` WRITE;
/*!40000 ALTER TABLE `tbl_datos_identificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_datos_identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_datos_submodulo`
--

DROP TABLE IF EXISTS `tbl_datos_submodulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_datos_submodulo` (
  `PFK_id_datos_identificacion` int(11) NOT NULL,
  `PFK_id_submodulo` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_datos_identificacion`,`PFK_id_submodulo`),
  KEY `PFK_id_submodulo_idx` (`PFK_id_submodulo`),
  CONSTRAINT `PFK_id_datos_identificacion_3` FOREIGN KEY (`PFK_id_datos_identificacion`) REFERENCES `tbl_datos_identificacion` (`PK_id_datos_identificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_submodulo_3` FOREIGN KEY (`PFK_id_submodulo`) REFERENCES `tbl_submodulo` (`pk_id_submodulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datos_submodulo`
--

LOCK TABLES `tbl_datos_submodulo` WRITE;
/*!40000 ALTER TABLE `tbl_datos_submodulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_datos_submodulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eje`
--

DROP TABLE IF EXISTS `tbl_eje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_eje` (
  `PK_id_eje` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`PK_id_eje`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eje`
--

LOCK TABLES `tbl_eje` WRITE;
/*!40000 ALTER TABLE `tbl_eje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_eje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignatura_eje`
--

DROP TABLE IF EXISTS `tbl_asignatura_eje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_asignatura_eje` (
  `PFK_id_eje` int(11) NOT NULL,
  `PFK_id_asignatura` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_asignatura`,`PFK_id_eje`),
  KEY `PFK_id_eje_idx` (`PFK_id_eje`),
  CONSTRAINT `PFK_id_asignatura_1` FOREIGN KEY (`PFK_id_asignatura`) REFERENCES `tbl_asignatura` (`pk_id_asignatura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_eje_1` FOREIGN KEY (`PFK_id_eje`) REFERENCES `tbl_eje` (`pk_id_eje`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignatura_eje`
--

LOCK TABLES `tbl_asignatura_eje` WRITE;
/*!40000 ALTER TABLE `tbl_asignatura_eje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asignatura_eje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_submodulo_eje`
--

DROP TABLE IF EXISTS `tbl_submodulo_eje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_submodulo_eje` (
  `PFK_id_eje` int(11) NOT NULL,
  `PFK_id_submodulo` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_submodulo`,`PFK_id_eje`),
  KEY `PFK_id_eje_idx` (`PFK_id_eje`),
  CONSTRAINT `PFK_id_submodulo` FOREIGN KEY (`PFK_id_submodulo`) REFERENCES `tbl_submodulo` (`pk_id_submodulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_eje` FOREIGN KEY (`PFK_id_eje`) REFERENCES `tbl_eje` (`pk_id_eje`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_submodulo_eje`
--

LOCK TABLES `tbl_submodulo_eje` WRITE;
/*!40000 ALTER TABLE `tbl_submodulo_eje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_submodulo_eje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_espacio_fisico`
--

DROP TABLE IF EXISTS `tbl_espacio_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_espacio_fisico` (
  `PK_id_espacio_fisico` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_nombre` varchar(1100) NOT NULL,
  PRIMARY KEY (`PK_id_espacio_fisico`)
) ;
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
  `PK_id_especialidad` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`PK_id_especialidad`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_especialidad`
--

LOCK TABLES `tbl_especialidad` WRITE;
/*!40000 ALTER TABLE `tbl_especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_habilidad_socioemocional`
--

DROP TABLE IF EXISTS `tbl_habilidad_socioemocional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_habilidad_socioemocional` (
  `PK_id_habilidad_socioemocional` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_id_habilidad_socioemocional`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_habilidad_socioemocional`
--

LOCK TABLES `tbl_habilidad_socioemocional` WRITE;
/*!40000 ALTER TABLE `tbl_habilidad_socioemocional` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_habilidad_socioemocional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_intenciones_competencia`
--

DROP TABLE IF EXISTS `tbl_intenciones_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_intenciones_competencia` (
  `PK_id_intenciones_competencia` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_intenciones_formativas` int(11) NOT NULL,
  `FK_id_competencia` int(11) NOT NULL,
  `VCH_seccion` varchar(20) NOT NULL,
  PRIMARY KEY (`PK_id_intenciones_competencia`),
  KEY `FK_id_intenciones_formativas3_idx` (`FK_id_intenciones_formativas`),
  CONSTRAINT `FK_id_intenciones_formativas3` FOREIGN KEY (`FK_id_intenciones_formativas`) REFERENCES `tbl_intenciones_formativas` (`pk_id_intenciones_formativas`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_intenciones_competencia`
--

LOCK TABLES `tbl_intenciones_competencia` WRITE;
/*!40000 ALTER TABLE `tbl_intenciones_competencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_intenciones_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_instrumentos`
--

DROP TABLE IF EXISTS `tbl_instrumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_instrumentos` (
  `PK_id_instrumentos` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_planeacion` int(11) NOT NULL,
  `TINT_numero` tinyint(1) NOT NULL,
  `VCH_instrumento` varchar(150) NOT NULL,
  `TINT_porcentaje` tinyint(1) NOT NULL,
  `FK_id_titulo` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_instrumentos`),
  KEY `FK_id_planeacion1_idx` (`FK_id_planeacion`),
  KEY `FK_id_titulo1_idx` (`FK_id_titulo`),
  CONSTRAINT `FK_id_planeacion1` FOREIGN KEY (`FK_id_planeacion`) REFERENCES `tbl_planeacion` (`PK_id_planeacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_titulo1` FOREIGN KEY (`FK_id_titulo`) REFERENCES `tbl_titulo` (`pk_id_titulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_instrumentos`
--

LOCK TABLES `tbl_instrumentos` WRITE;
/*!40000 ALTER TABLE `tbl_instrumentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_instrumentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_intenciones_aprendizaje`
--

DROP TABLE IF EXISTS `tbl_intenciones_aprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_intenciones_aprendizaje` (
  `PFK_id_intenciones_formativas` int(11) NOT NULL,
  `PFK_id_aprendizaje_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_formativas`,`PFK_id_aprendizaje_esperado`),
  KEY `PFK_id_aprendizaje_esperado_idx` (`PFK_id_aprendizaje_esperado`),
  CONSTRAINT `PFK_id_aprendizaje_esperado4` FOREIGN KEY (`PFK_id_aprendizaje_esperado`) REFERENCES `tbl_aprendizaje_esperado` (`pk_id_aprendizaje_esperado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_intenciones_formativas4` FOREIGN KEY (`PFK_id_intenciones_formativas`) REFERENCES `tbl_intenciones_formativas` (`pk_id_intenciones_formativas`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_intenciones_aprendizaje`
--

LOCK TABLES `tbl_intenciones_aprendizaje` WRITE;
/*!40000 ALTER TABLE `tbl_intenciones_aprendizaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_intenciones_aprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_intenciones_componente`
--

DROP TABLE IF EXISTS `tbl_intenciones_componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_intenciones_componente` (
  `PFK_id_intenciones_formativas` int(11) NOT NULL,
  `PFK_id_componente` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_formativas`,`PFK_id_componente`),
  KEY `PFK_id_componente3_idx` (`PFK_id_componente`),
  CONSTRAINT `PFK_id_componente3` FOREIGN KEY (`PFK_id_componente`) REFERENCES `tbl_componente` (`pk_id_componente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_intenciones_formativas3` FOREIGN KEY (`PFK_id_intenciones_formativas`) REFERENCES `tbl_intenciones_formativas` (`pk_id_intenciones_formativas`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_intenciones_componente`
--

LOCK TABLES `tbl_intenciones_componente` WRITE;
/*!40000 ALTER TABLE `tbl_intenciones_componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_intenciones_componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_intenciones_contenido`
--

DROP TABLE IF EXISTS `tbl_intenciones_contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_intenciones_contenido` (
  `PFK_id_intenciones_formativas` int(11) NOT NULL,
  `PFK_id_contenido_especifico` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_formativas`,`PFK_id_contenido_especifico`),
  KEY `PFK_id_contenido_especifico_idx` (`PFK_id_contenido_especifico`),
  CONSTRAINT `PFK_id_contenido_especifico2` FOREIGN KEY (`PFK_id_contenido_especifico`) REFERENCES `tbl_contenido_especifico` (`pk_id_contenido_especifico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_intenciones_formativas2` FOREIGN KEY (`PFK_id_intenciones_formativas`) REFERENCES `tbl_intenciones_formativas` (`pk_id_intenciones_formativas`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_intenciones_contenido`
--

LOCK TABLES `tbl_intenciones_contenido` WRITE;
/*!40000 ALTER TABLE `tbl_intenciones_contenido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_intenciones_contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_intenciones_formativas`
--

DROP TABLE IF EXISTS `tbl_intenciones_formativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_intenciones_formativas` (
  `PK_id_intenciones_formativas` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_proposito` varchar(300) NOT NULL,
  `FK_id_eje` int(11) NOT NULL,
  `FK_id_contenido_central` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_intenciones_formativas`),
  KEY `FK_id_eje1_idx` (`FK_id_eje`),
  KEY `FK_id_contenido_central1_idx` (`FK_id_contenido_central`),
  CONSTRAINT `FK_id_contenido_central1` FOREIGN KEY (`FK_id_contenido_central`) REFERENCES `tbl_contenido_central` (`pk_id_contenido_central`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_eje1` FOREIGN KEY (`FK_id_eje`) REFERENCES `tbl_eje` (`pk_id_eje`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_intenciones_formativas`
--

LOCK TABLES `tbl_intenciones_formativas` WRITE;
/*!40000 ALTER TABLE `tbl_intenciones_formativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_intenciones_formativas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_intenciones_habilidad`
--

DROP TABLE IF EXISTS `tbl_intenciones_habilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_intenciones_habilidad` (
  `PFK_id_intenciones_formativas` int(11) NOT NULL,
  `PFK_habilidad_socioemocional` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_formativas`,`PFK_habilidad_socioemocional`),
  KEY `PFK_habilidad_socioemocional6_idx` (`PFK_habilidad_socioemocional`),
  CONSTRAINT `PFK_habilidad_socioemocional6` FOREIGN KEY (`PFK_habilidad_socioemocional`) REFERENCES `tbl_habilidad_socioemocional` (`PK_id_habilidad_socioemocional`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_intenciones_formativas6` FOREIGN KEY (`PFK_id_intenciones_formativas`) REFERENCES `tbl_intenciones_formativas` (`pk_id_intenciones_formativas`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_intenciones_habilidad`
--

LOCK TABLES `tbl_intenciones_habilidad` WRITE;
/*!40000 ALTER TABLE `tbl_intenciones_habilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_intenciones_habilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_intenciones_producto`
--

DROP TABLE IF EXISTS `tbl_intenciones_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_intenciones_producto` (
  `PFK_id_intenciones_formativas` int(11) NOT NULL,
  `PFK_id_producto_esperado` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_intenciones_formativas`,`PFK_id_producto_esperado`),
  KEY `PFK_id_producto_esperado4_idx` (`PFK_id_producto_esperado`),
  CONSTRAINT `PFK_id_intenciones_formativas5` FOREIGN KEY (`PFK_id_intenciones_formativas`) REFERENCES `tbl_intenciones_formativas` (`pk_id_intenciones_formativas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_producto_esperado5` FOREIGN KEY (`PFK_id_producto_esperado`) REFERENCES `tbl_producto_esperado` (`pk_id_producto_esperado`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_intenciones_producto`
--

LOCK TABLES `tbl_intenciones_producto` WRITE;
/*!40000 ALTER TABLE `tbl_intenciones_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_intenciones_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nivel_taxonomico`
--

DROP TABLE IF EXISTS `tbl_nivel_taxonomico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_nivel_taxonomico` (
  `PK_id_nivel_taxonomico` int(11) NOT NULL AUTO_INCREMENT,
  `TINT_nivel` tinyint(1) NOT NULL,
  `VCH_verbo` varchar(20) NOT NULL,
  PRIMARY KEY (`PK_id_nivel_taxonomico`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nivel_taxonomico`
--

LOCK TABLES `tbl_nivel_taxonomico` WRITE;
/*!40000 ALTER TABLE `tbl_nivel_taxonomico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nivel_taxonomico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_planeacion`
--

DROP TABLE IF EXISTS `tbl_planeacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_planeacion` (
  `PK_id_planeacion` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_planeacion_contenedor` int(11) NOT NULL,
  `FK_id_plantel` int(11) NOT NULL,
  `FK_datos_identificacion` int(11) ,
  `FK_id_intenciones_formativas` int(11) ,
  PRIMARY KEY (`PK_id_planeacion`),
  KEY `FK_id_planeacion_contenedor_idx` (`FK_id_planeacion_contenedor`),
  KEY `FK_id_plantel_idx` (`FK_id_plantel`),
  KEY `FK_datos_identificacion_idx` (`FK_datos_identificacion`),
  KEY `FK_id_intenciones_formativas_idx` (`FK_id_intenciones_formativas`),
  CONSTRAINT `FK_datos_identificacion` FOREIGN KEY (`FK_datos_identificacion`) REFERENCES `tbl_datos_identificacion` (`PK_id_datos_identificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_intenciones_formativas` FOREIGN KEY (`FK_id_intenciones_formativas`) REFERENCES `tbl_intenciones_formativas` (`pk_id_intenciones_formativas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_planeacion_contenedor` FOREIGN KEY (`FK_id_planeacion_contenedor`) REFERENCES `tbl_planeacion_contenedor` (`pk_id_planeacion_contenedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_plantel` FOREIGN KEY (`FK_id_plantel`) REFERENCES `tbl_plantel` (`pk_id_plantel`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_planeacion`
--

LOCK TABLES `tbl_planeacion` WRITE;
/*!40000 ALTER TABLE `tbl_planeacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_planeacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_planeacion_contenedor`
--

DROP TABLE IF EXISTS `tbl_planeacion_contenedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_planeacion_contenedor` (
  `PK_id_planeacion_contenedor` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`PK_id_planeacion_contenedor`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_planeacion_contenedor`
--

LOCK TABLES `tbl_planeacion_contenedor` WRITE;
/*!40000 ALTER TABLE `tbl_planeacion_contenedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_planeacion_contenedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_planeacion_usuario`
--

DROP TABLE IF EXISTS `tbl_planeacion_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_planeacion_usuario` (
  `PFK_id_planeacion_contenedor` int(11) NOT NULL,
  `PFK_id_usuario` int(11) NOT NULL,
  `VCH_accion` varchar(20) NOT NULL,
  PRIMARY KEY (`PFK_id_planeacion_contenedor`,`PFK_id_usuario`),
  KEY `PFK_id_usuario_idx` (`PFK_id_usuario`),
  CONSTRAINT `PFK_id_planeacion_contenedor3` FOREIGN KEY (`PFK_id_planeacion_contenedor`) REFERENCES `tbl_planeacion_contenedor` (`pk_id_planeacion_contenedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_usuario3` FOREIGN KEY (`PFK_id_usuario`) REFERENCES `tbl_usuario` (`pk_id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_planeacion_usuario`
--

LOCK TABLES `tbl_planeacion_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_planeacion_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_planeacion_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_plantel`
--

DROP TABLE IF EXISTS `tbl_plantel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_plantel` (
  `PK_id_Plantel` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_institucion` varchar(20) NOT NULL,
  `VCH_plantel` varchar(20) NOT NULL,
  `VCH_CCT` varchar(20) NOT NULL,
  PRIMARY KEY (`PK_id_Plantel`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_plantel`
--

LOCK TABLES `tbl_plantel` WRITE;
/*!40000 ALTER TABLE `tbl_plantel` DISABLE KEYS */;
INSERT INTO `tbl_plantel` VALUES (0,'Colegio de Estudios Científicos y Tecnológicos del Estado de México','Tequixquiac','15ETC0042H');
/*!40000 ALTER TABLE `tbl_plantel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_producto_esperado`
--

DROP TABLE IF EXISTS `tbl_producto_esperado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_producto_esperado` (
  `PK_id_producto_esperado` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`PK_id_producto_esperado`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_producto_esperado`
--

LOCK TABLES `tbl_producto_esperado` WRITE;
/*!40000 ALTER TABLE `tbl_producto_esperado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_producto_esperado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_recursos`
--

DROP TABLE IF EXISTS `tbl_recursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_recursos` (
  `PK_id_recursos` int(11) NOT NULL AUTO_INCREMENT,
  `FK_id_planeacion` int(11) NOT NULL,
  `VCH_N_equipo` varchar(1100) DEFAULT NULL,
  `VCH_N_material` varchar(1100) DEFAULT NULL,
  `VCH_N_fuentes` varchar(1500) DEFAULT NULL,
  `TINT_N_nivel` tinyint(1) DEFAULT NULL,
  `FK_id_espacio_fisico` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_recursos`),
  KEY `FK_id_planeacion2_idx` (`FK_id_planeacion`),
  KEY `FK_id_espacio_fisico2_idx` (`FK_id_espacio_fisico`),
  CONSTRAINT `FK_id_espacio_fisico2` FOREIGN KEY (`FK_id_espacio_fisico`) REFERENCES `tbl_espacio_fisico` (`PK_id_espacio_fisico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_planeacion2` FOREIGN KEY (`FK_id_planeacion`) REFERENCES `tbl_planeacion` (`PK_id_planeacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recursos`
--

LOCK TABLES `tbl_recursos` WRITE;
/*!40000 ALTER TABLE `tbl_recursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_recursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modulo`
--

DROP TABLE IF EXISTS `tbl_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_modulo` (
  `PK_id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_nombre` varchar(100) NOT NULL,
  `VCH_clave` varchar(20) NOT NULL,
  `FK_id_especialidad` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_modulo`),
  KEY `FK_id_especialidad_idx` (`FK_id_especialidad`),
  CONSTRAINT `FK_id_especialidad` FOREIGN KEY (`FK_id_especialidad`) REFERENCES `tbl_especialidad` (`pk_id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modulo`
--

LOCK TABLES `tbl_modulo` WRITE;
/*!40000 ALTER TABLE `tbl_modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_submodulo`
--

DROP TABLE IF EXISTS `tbl_submodulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_submodulo` (
  `PK_id_submodulo` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_nombre` varchar(100) NOT NULL,
  `VCH_clave` varchar(20) NOT NULL,
  `FK_id_modulo` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_submodulo`),
  KEY `FK_id_modulo_idx` (`FK_id_modulo`),
  CONSTRAINT `FK_id_modulo` FOREIGN KEY (`FK_id_modulo`) REFERENCES `tbl_modulo` (`pk_id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_submodulo`
--

LOCK TABLES `tbl_submodulo` WRITE;
/*!40000 ALTER TABLE `tbl_submodulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_submodulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_especialidad_competencia`
--

DROP TABLE IF EXISTS `tbl_especialidad_competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_especialidad_competencia` (
  `PFK_id_competencia` int(11) NOT NULL,
  `PFK_id_especialidad` int(11) NOT NULL,
  PRIMARY KEY (`PFK_id_especialidad`,`PFK_id_competencia`),
  KEY `PFK_id_competencia_idx` (`PFK_id_competencia`),
  CONSTRAINT `PFK_id_competencia_2` FOREIGN KEY (`PFK_id_competencia`) REFERENCES `tbl_competencia` (`pk_id_competencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PFK_id_especialidad_2` FOREIGN KEY (`PFK_id_especialidad`) REFERENCES `tbl_especialidad` (`pk_id_especialidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_especialidad_competencia`
--

LOCK TABLES `tbl_especialidad_competencia` WRITE;
/*!40000 ALTER TABLE `tbl_especialidad_competencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_especialidad_competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_usuario`
--

DROP TABLE IF EXISTS `tbl_tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_tipo_usuario` (
  `PK_id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`PK_id_tipo_usuario`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_usuario`
--

LOCK TABLES `tbl_tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_titulo`
--

DROP TABLE IF EXISTS `tbl_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_titulo` (
  `PK_id_titulo` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`PK_id_titulo`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_titulo`
--

LOCK TABLES `tbl_titulo` WRITE;
/*!40000 ALTER TABLE `tbl_titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuario` (
  `PK_id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `VCH_nombre` varchar(20) NOT NULL,
  `VCH_ap_paterno` varchar(20) NOT NULL,
  `VCH_ap_materno` varchar(20) NOT NULL,
  `VCH_curp` varchar(18) NOT NULL,
  `VCH_contrasenia` varchar(10) NOT NULL,
  `VCH_correo_electronico` varchar(40) NOT NULL,
  `FK_id_tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`PK_id_usuario`),
  KEY `FK_id_tipo_usuario_idx` (`FK_id_tipo_usuario`),
  CONSTRAINT `FK_id_tipo_usuario` FOREIGN KEY (`FK_id_tipo_usuario`) REFERENCES `tbl_tipo_usuario` (`pk_id_tipo_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

insert into tbl_tipo_usuario(VCH_nombre) values("Revisor");
insert into tbl_tipo_usuario(VCH_nombre) values("Administrador");
insert into tbl_tipo_usuario(VCH_nombre) values("Profesor");
insert into tbl_tipo_usuario(VCH_nombre) values("Capturista");
insert into tbl_tipo_usuario(VCH_nombre) values("Supervisor");

insert into tbl_usuario values(1,"Ruben","Vazquez","Osorio","vaoh980202","pass","mail@mail.com",1);
insert into tbl_usuario values(2,"Jose","Hernandez","Villegas","soyputo123","1234j1234","joselin@mail.com",2);
insert into tbl_usuario values(3,"Victor","Cuevas","Lopez","victor029238123","soygay","victor@mail.com",3);
insert into tbl_usuario values(4,"Jose Tristan","Garcilazo","Diaz","curpdetristan","soygay","tristan@mail.com",3);
insert into tbl_usuario values(5,"Edgar","Fagardo","Rojas","curpdeedgar","soygay","fagardo@mail.com",3);
insert into tbl_usuario values(6,"Isaac","Celis","Vargas","CELIS12ADD","micontra","celis@mail.com",4);
insert into tbl_usuario values(7,"John","Ruiz","Reyes","John123124124","contrajohn","jonny@mail.com",5);

insert into tbl_campo_disciplinar(VCH_nombre,VCH_clave) values ("MATEMATICAS","10982-S");
insert into tbl_campo_disciplinar(VCH_nombre,VCH_clave) values ("IDIOMAS","10982-A");
insert into tbl_campo_disciplinar(VCH_nombre,VCH_clave) values ("FISICA","10982-D");

insert into tbl_asignatura(FK_id_campo_disciplinar,VCH_nombre,VCH_clave,TINT_semestre) values (1,"Algebra","clave1232",2);
insert into tbl_asignatura(FK_id_campo_disciplinar,VCH_nombre,VCH_clave,TINT_semestre) values (1,"Calculo I","clave123432",2);
insert into tbl_asignatura(FK_id_campo_disciplinar,VCH_nombre,VCH_clave,TINT_semestre) values (1,"Calculo II","clave123432",3);
insert into tbl_asignatura(FK_id_campo_disciplinar,VCH_nombre,VCH_clave,TINT_semestre) values (2,"Ingles","clave12",2);
insert into tbl_asignatura(FK_id_campo_disciplinar,VCH_nombre,VCH_clave,TINT_semestre) values (2,"Español","clave12",2);
insert into tbl_asignatura(FK_id_campo_disciplinar,VCH_nombre,VCH_clave,TINT_semestre) values (3,"Fisica I","clave232",3);
insert into tbl_asignatura(FK_id_campo_disciplinar,VCH_nombre,VCH_clave,TINT_semestre) values (3,"Fisico II","clave23432",4);

insert into tbl_especialidad(VCH_nombre) values ("Programacion");
insert into tbl_especialidad(VCH_nombre) values ("Administracion");

insert into tbl_modulo(VCH_nombre,VCH_clave,FK_id_especialidad) values ("Programacion Orientada a Objetos","clavePoo",1);            
insert into tbl_modulo(VCH_nombre,VCH_clave,FK_id_especialidad) values ("Programacion Estructurada","claveEstruct",1);   
insert into tbl_modulo(VCH_nombre,VCH_clave,FK_id_especialidad) values ("Administracion modulo 1","modAdm1",2);   
insert into tbl_modulo(VCH_nombre,VCH_clave,FK_id_especialidad) values ("Administracion modulo 2","modAdm2",2);         
insert into tbl_modulo(VCH_nombre,VCH_clave,FK_id_especialidad) values ("Administracion modulo 3","modAdm3",2);   

insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 1 de POO","modPoo1",1);
insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 2 de POO","modPoo2",1);
insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 1 de P. Estrcuturada","modestruct1",2);
insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 1 de Administracion modulo 1","sub1mod1",3);
insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 2 de Administracion modulo 1","sub2mod1",3);
insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 1 de Administracion modulo 2","sub1mod2",4);
insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 2 de Administracion modulo 2","sub2mod2",4);
insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 3 de Administracion modulo 2","sub1mod2",4);
insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 4 de Administracion modulo 2","sub2mod2",4);
insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 1 de Administracion modulo 3","sub1mod3",5);

insert into tbl_eje(VCH_descripcion) values("Eje 1: Este es el eje perteneciente al submodulo 1 de POO");
insert into tbl_eje(VCH_descripcion) values("Eje 2: Este es el eje perteneciente al submodulo 2 de POO");
insert into tbl_eje(VCH_descripcion) values("Eje 3: Este es el eje perteneciente al submodulo 1 de P. Estrcuturada");
insert into tbl_eje(VCH_descripcion) values("Eje 4: Este es el eje perteneciente a Submodulo 1 de Administracion modulo 1");
insert into tbl_eje(VCH_descripcion) values("Eje 5: Este es el eje perteneciente a Submodulo 2 de Administracion modulo 1");
insert into tbl_eje(VCH_descripcion) values("Eje 6: Este es el eje perteneciente a Submodulo 1 de Administracion modulo 2");
insert into tbl_eje(VCH_descripcion) values("Eje 7: Este es el eje perteneciente a Submodulo 2 de Administracion modulo 2");
insert into tbl_eje(VCH_descripcion) values("Eje 8: Este es el eje perteneciente a Submodulo 3 de Administracion modulo 2");
insert into tbl_eje(VCH_descripcion) values("Eje 9: Este es el eje perteneciente a Submodulo 4 de Administracion modulo 2");
insert into tbl_eje(VCH_descripcion) values("Eje 10: Este es el eje perteneciente a Submodulo 1 de Administracion modulo 3");
insert into tbl_eje(VCH_descripcion) values("Del pensamiento aritmético al lenguaje algebraico");
insert into tbl_eje(VCH_descripcion) values("Eje 12: Este es el eje perteneciente a Calculo I");
insert into tbl_eje(VCH_descripcion) values("Eje 13: Este es el eje perteneciente a Calculo II");
insert into tbl_eje(VCH_descripcion) values("Eje 14: Este es el eje perteneciente a Ingles");
insert into tbl_eje(VCH_descripcion) values("Eje 15: Este es el eje perteneciente a Español");
insert into tbl_eje(VCH_descripcion) values("Eje 16: Este es el eje perteneciente a Fisica I");
insert into tbl_eje(VCH_descripcion) values("Eje 17: Este es el eje perteneciente a Fisica Il");

insert into tbl_asignatura_eje values(11,1);
insert into tbl_asignatura_eje values(12,2);
insert into tbl_asignatura_eje values(13,3);
insert into tbl_asignatura_eje values(14,4);
insert into tbl_asignatura_eje values(15,5);
insert into tbl_asignatura_eje values(16,6);
insert into tbl_asignatura_eje values(17,7);

insert into tbl_submodulo_eje values(1,1);
insert into tbl_submodulo_eje values(2,2);
insert into tbl_submodulo_eje values(3,3);
insert into tbl_submodulo_eje values(4,4);
insert into tbl_submodulo_eje values(5,5);
insert into tbl_submodulo_eje values(6,6);
insert into tbl_submodulo_eje values(7,7);
insert into tbl_submodulo_eje values(8,8);
insert into tbl_submodulo_eje values(9,9);
insert into tbl_submodulo_eje values(10,10);

insert into tbl_componente(fk_id_eje,VCH_descripcion) values(1,"Componente_1:Pertenece a Eje 1");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(1,"Componente_2:Pertenece a Eje 1");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(2,"Componente_1:Pertenece a Eje 2");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(2,"Componente_2:Pertenece a Eje 2");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(2,"Componente_3:Pertenece a Eje 2");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(3,"Componente_1:Pertenece a Eje 3");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(4,"Componente_1:Pertenece a Eje 4");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(4,"Componente_2:Pertenece a Eje 4");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(5,"Componente_1:Pertenece a Eje 5");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(6,"Componente_1:Pertenece a Eje 6");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(6,"Componente_2:Pertenece a Eje 6");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(6,"Componente_3:Pertenece a Eje 6");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(7,"Componente_1:Pertenece a Eje 7");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(7,"Componente_2:Pertenece a Eje 7");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(8,"Componente_1:Pertenece a Eje 8");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(9,"Componente_1:Pertenece a Eje 9");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(9,"Componente_2:Pertenece a Eje 9");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(10,"Componente_1:Pertenece a Eje 10");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(11,"Patrones,simbolización y generalización: elementos del Algebra Basica.");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(12,"Componente_1:Pertenece a Eje 12");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(13,"Componente_1:Pertenece a Eje 13");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(13,"Componente_2:Pertenece a Eje 13");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(14,"Componente_1:Pertenece a Eje 14");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(15,"Componente_1:Pertenece a Eje 15");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(15,"Componente_2:Pertenece a Eje 15");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(16,"Componente_1:Pertenece a Eje 16");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(17,"Componente_1:Pertenece a Eje 17");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(17,"Componente_2:Pertenece a Eje 17");
insert into tbl_componente(fk_id_eje,VCH_descripcion) values(17,"Componente_3:Pertenece a Eje 17");

insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",1);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",1);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",2);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",3);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",3);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",4);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",4);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",5);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",5);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",6);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",7);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",7);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",8);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",9);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",10);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",11);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",11);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 3",11);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",12);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",13);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",14);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",14);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",15);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",15);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",16);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",17);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",18);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",18);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Uso de las variables y las expresiones algebraicas.",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Usos de los números y sus propiedades.",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Conceptos básicos del lenguaje algebraico.",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("De los patrones numéricos a la simbolización algebraica.",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Sucesiones y series numéricas.",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Variación lineal como introducción a la relación funcional.",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Variación proporcional.",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Tratamiento de lo lineal y lo no lineal (normalmente cuadrático).",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("El trabajo simbólico.",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Representación y resolución de sistemas de ecuaciones lineales",19);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",20);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",21);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",22);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",22);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",23);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",23);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 3",23);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",24);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",25);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",25);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",26);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",27);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",28);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 2",28);
insert into tbl_contenido_central(VCH_descripcion,fk_id_componente) values("Contenido central 1",29);

insert into tbl_contenido_especifico(VCH_descripcion) values ("La variable como número generalizado, incógnita y relación de dependencia funcional: ¿cuándo y por qué son diferentes?, ¿qué caracteriza a cada una? Ejemplos concretos y creación de ejemplos.");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Tratamiento algebraico de enunciados verbales – “los problemas en palabras”: ¿cómo expreso matemáticamente un problema?, ¿qué tipo de simbolización es pertinente para pasar de la aritmética al álgebra?");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Interpretación de las expresiones algebraicas y de su evaluación numérica. Operaciones algebraicas. ¿Por qué la simbolización algebraica es útil en situaciones contextuales?");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Sucesiones y series numéricas particulares (números triangulares y números cuadrados, sucesiones aritméticas y geométricas), representadas mediante dibujos, tablas y puntos en el plano. Con base en comportamientos numérico, ¿qué cambia, cómo y cuánto cambia? Un análisis variacional de los patrones numéricos.");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Lo lineal y lo no lineal. Representaciones discretas de gráficas contiguas: ¿qué caracteriza a una relación de comportamiento lineal?, ¿cómo se relacionan las variables en una relación lineal?, ¿cómo se relacionan las variables en una relación no lineal?, ¿cómo se diferencian? ");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Sobre el uso de tasas, razones, proporciones y variación proporcional directa como caso particular de la función lineal entre dos variables: ¿qué magnitudes se relacionan?, ¿cómo es el comportamiento de dicha relación?");
insert into tbl_contenido_especifico(VCH_descripcion) values ("La proporcionalidad y sus propiedades numéricas, geométricas y su representación algebraica. Se sugiere tratar con situaciones cotidianas antropométricas y de mezclas (colores y sabores): ¿qué es lo que se mantiene constante en una relación proporcional?");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Operaciones con polinomios y factorizaciones básicas de trinomios (productos notables). Se sugiere apoyarse de los modelos geométricos materiales y simbólicos) para el cuadrado del binomio.");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Resolución de ecuaciones lineales en contextos diversos: ¿qué caracteriza a la solución? ");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Sistemas de ecuaciones lineales con dos variables, en estrecha conexión con la función lineal: ¿qué caracteriza al punto de intersección?, ¿siempre existe solución?");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Ecuaciones cuadráticas en una variable y su relación con la función cuadrática. Interpretación geométrica y algebraica de las raíces. Tratamiento transversal con el tiro parabólico y los máximos y mínimos de una función cuadrática. ¿Cómo se interpreta la solución de una ecuación lineal y las soluciones de una ecuación cuadrática?");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 1");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 2");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 3");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 4");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico B12CV");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico ASD12333AAAAAAAAAA");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico B");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico C");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 7");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 8");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 9");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 12");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico ad");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico cacscsa");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico asdasdasd");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 122");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico asdqqqqw");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico asddazz");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico dsdASD21");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 12223123");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 3232323");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 1232");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico 422323");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico wwwwwww");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico aaaaaaa");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico bbbbbbb");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico ccccccc");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico ddddddd");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico eeeeeee");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico fffffff");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico ggggggg");
insert into tbl_contenido_especifico(VCH_descripcion) values ("Contendo_especifico hhhhhhh");

insert into tbl_contenido_contenido values (12,1);
insert into tbl_contenido_contenido values (12,2);
insert into tbl_contenido_contenido values (12,3); 
insert into tbl_contenido_contenido values (13,1);
insert into tbl_contenido_contenido values (13,2);
insert into tbl_contenido_contenido values (13,3);
insert into tbl_contenido_contenido values (14,1);
insert into tbl_contenido_contenido values (14,2);
insert into tbl_contenido_contenido values (14,3);  
insert into tbl_contenido_contenido values (15,4);
insert into tbl_contenido_contenido values (15,5);
insert into tbl_contenido_contenido values (16,4);
insert into tbl_contenido_contenido values (16,5);
insert into tbl_contenido_contenido values (17,4);
insert into tbl_contenido_contenido values (17,5);
insert into tbl_contenido_contenido values (18,6);
insert into tbl_contenido_contenido values (18,7);
insert into tbl_contenido_contenido values (18,8);
insert into tbl_contenido_contenido values (18,9);
insert into tbl_contenido_contenido values (19,10);
insert into tbl_contenido_contenido values (19,11);
insert into tbl_contenido_contenido values (19,12);
insert into tbl_contenido_contenido values (19,13);
insert into tbl_contenido_contenido values (20,14);
insert into tbl_contenido_contenido values (20,15);
insert into tbl_contenido_contenido values (20,16);
insert into tbl_contenido_contenido values (21,14);
insert into tbl_contenido_contenido values (21,15);
insert into tbl_contenido_contenido values (21,16);
insert into tbl_contenido_contenido values (22,14);
insert into tbl_contenido_contenido values (22,15);
insert into tbl_contenido_contenido values (22,16);
insert into tbl_contenido_contenido values (23,17);
insert into tbl_contenido_contenido values (23,18);
insert into tbl_contenido_contenido values (23,19);
insert into tbl_contenido_contenido values (23,20);
insert into tbl_contenido_contenido values (23,21);
insert into tbl_contenido_contenido values (24,17);
insert into tbl_contenido_contenido values (24,18);
insert into tbl_contenido_contenido values (24,19);
insert into tbl_contenido_contenido values (24,20);
insert into tbl_contenido_contenido values (24,21);
insert into tbl_contenido_contenido values (25,22);
insert into tbl_contenido_contenido values (25,23);
insert into tbl_contenido_contenido values (25,24);
insert into tbl_contenido_contenido values (25,25);
insert into tbl_contenido_contenido values (25,26);
insert into tbl_contenido_contenido values (25,27);
insert into tbl_contenido_contenido values (25,28);
insert into tbl_contenido_contenido values (26,22);
insert into tbl_contenido_contenido values (26,23);
insert into tbl_contenido_contenido values (26,24);
insert into tbl_contenido_contenido values (26,25);
insert into tbl_contenido_contenido values (26,26);
insert into tbl_contenido_contenido values (26,27);
insert into tbl_contenido_contenido values (26,28);
insert into tbl_contenido_contenido values (27,39);
insert into tbl_contenido_contenido values (27,40);
insert into tbl_contenido_contenido values (27,41);
insert into tbl_contenido_contenido values (27,42);
insert into tbl_contenido_contenido values (27,43);
insert into tbl_contenido_contenido values (28,39);
insert into tbl_contenido_contenido values (28,40);
insert into tbl_contenido_contenido values (28,41);
insert into tbl_contenido_contenido values (28,42);
insert into tbl_contenido_contenido values (28,43);
insert into tbl_contenido_contenido values (29,44);
insert into tbl_contenido_contenido values (29,45);
insert into tbl_contenido_contenido values (29,46);
insert into tbl_contenido_contenido values (29,47);
insert into tbl_contenido_contenido values (30,44);
insert into tbl_contenido_contenido values (30,45);
insert into tbl_contenido_contenido values (30,46);
insert into tbl_contenido_contenido values (30,47);
insert into tbl_contenido_contenido values (31,48);
insert into tbl_contenido_contenido values (31,49);
insert into tbl_contenido_contenido values (31,50);
insert into tbl_contenido_contenido values (31,47);
insert into tbl_contenido_contenido values (32,48);
insert into tbl_contenido_contenido values (32,49);
insert into tbl_contenido_contenido values (32,50);
insert into tbl_contenido_contenido values (32,47);
insert into tbl_contenido_contenido values (33,48);
insert into tbl_contenido_contenido values (33,49);
insert into tbl_contenido_contenido values (33,50);
insert into tbl_contenido_contenido values (33,47);
insert into tbl_contenido_contenido values (34,48);
insert into tbl_contenido_contenido values (34,49);
insert into tbl_contenido_contenido values (34,50);
insert into tbl_contenido_contenido values (34,47);
insert into tbl_contenido_contenido values (1,29);
insert into tbl_contenido_contenido values (1,30);
insert into tbl_contenido_contenido values (1,31);
insert into tbl_contenido_contenido values (2,29);
insert into tbl_contenido_contenido values (2,30);
insert into tbl_contenido_contenido values (2,31);
insert into tbl_contenido_contenido values (3,29);
insert into tbl_contenido_contenido values (3,30);
insert into tbl_contenido_contenido values (3,31);
insert into tbl_contenido_contenido values (4,32);
insert into tbl_contenido_contenido values (4,33);
insert into tbl_contenido_contenido values (5,32);
insert into tbl_contenido_contenido values (5,33);
insert into tbl_contenido_contenido values (6,34);
insert into tbl_contenido_contenido values (6,35);
insert into tbl_contenido_contenido values (6,36);
insert into tbl_contenido_contenido values (7,34);
insert into tbl_contenido_contenido values (7,35);
insert into tbl_contenido_contenido values (7,36);
insert into tbl_contenido_contenido values (8,37);
insert into tbl_contenido_contenido values (8,38);
insert into tbl_contenido_contenido values (9,37);
insert into tbl_contenido_contenido values (9,38);
insert into tbl_contenido_contenido values (10,37);
insert into tbl_contenido_contenido values (10,38);
insert into tbl_contenido_contenido values (11,37);
insert into tbl_contenido_contenido values (11,38);

insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Transitan del pensamiento aritmético al lenguaje algebraico.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Desarrollan un lenguaje algebraico, un sistema simbólico para la generalización y la representación.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Expresan de forma coloquial y escrita fenómenos de su vida cotidiana con base en prácticas como: simplificar, sintetizar, expresar, verbalizar, relacionar magnitudes, generalizar patrones, representar mediante símbolos, comunicar ideas, entre otras.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Reconoce la existencia de las variables y distinguen sus usos como número general, como incógnita y como relación funcional.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Interpreta y expresan algebraicamente propiedades de fenómenos de su entorno cotidiano.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Evalúa expresiones algebraicas en diversos contextos numéricos.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Reconocen patrones de comportamiento entre magnitudes.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Formula de manera coloquial escrita (retórica), numérica y gráficamente patrones de comportamiento.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Expresa, mediante símbolos, fenómenos de su vida cotidiana.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Reconoce fenómenos con comportamiento lineal o no lineal.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Diferencia los cocientes.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Representa, gráficamente, fenómenos de variación constante en dominios discretos.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Expresa, de forma coloquial y escrita, fenómenos de proporcionalidad directa de su vida cotidiana con base en prácticas como: comparar, equivaler, medir, construir unidades de medida, entre otras.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Caracteriza una relación proporcional directa.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Resignifica en contexto al algoritmo de la regla de tres simple.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Expresa, de manera simbólica, fenómenos de naturaleza proporcional en el marco de su vida cotidiana.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Simboliza y generalizan fenómenos lineales y fenómenos cuadráticos mediante el empleo de variables.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Opera y factorizan polinomios de grado pequeño.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Significa, gráfica y algebraicamente, las soluciones de una ecuación.");
insert into tbl_aprendizaje_esperado(VCH_descripcion) values ("Interpreta la solución de un sistema de ecuaciones lineales");

insert into tbl_contenido_aprendizaje values (1,1);
insert into tbl_contenido_aprendizaje values (2,1);
insert into tbl_contenido_aprendizaje values (3,1);
insert into tbl_contenido_aprendizaje values (4,1);
insert into tbl_contenido_aprendizaje values (5,1);
insert into tbl_contenido_aprendizaje values (6,1);
insert into tbl_contenido_aprendizaje values (1,2);
insert into tbl_contenido_aprendizaje values (2,2);
insert into tbl_contenido_aprendizaje values (3,2);
insert into tbl_contenido_aprendizaje values (4,2);
insert into tbl_contenido_aprendizaje values (5,2);
insert into tbl_contenido_aprendizaje values (6,2);
insert into tbl_contenido_aprendizaje values (1,3);
insert into tbl_contenido_aprendizaje values (2,3);
insert into tbl_contenido_aprendizaje values (3,3);
insert into tbl_contenido_aprendizaje values (4,3);
insert into tbl_contenido_aprendizaje values (5,3);
insert into tbl_contenido_aprendizaje values (6,3);
insert into tbl_contenido_aprendizaje values (7,4);
insert into tbl_contenido_aprendizaje values (7,5);
insert into tbl_contenido_aprendizaje values (8,4);
insert into tbl_contenido_aprendizaje values (8,5);
insert into tbl_contenido_aprendizaje values (9,4);
insert into tbl_contenido_aprendizaje values (9,5);
insert into tbl_contenido_aprendizaje values (10,4);
insert into tbl_contenido_aprendizaje values (10,5);
insert into tbl_contenido_aprendizaje values (11,4);
insert into tbl_contenido_aprendizaje values (11,5);
insert into tbl_contenido_aprendizaje values (12,4);
insert into tbl_contenido_aprendizaje values (12,5);
insert into tbl_contenido_aprendizaje values (13,6);
insert into tbl_contenido_aprendizaje values (13,7);
insert into tbl_contenido_aprendizaje values (14,6);
insert into tbl_contenido_aprendizaje values (14,7);
insert into tbl_contenido_aprendizaje values (15,6);
insert into tbl_contenido_aprendizaje values (15,7);
insert into tbl_contenido_aprendizaje values (16,6);
insert into tbl_contenido_aprendizaje values (16,7);
insert into tbl_contenido_aprendizaje values (17,8);
insert into tbl_contenido_aprendizaje values (17,9);
insert into tbl_contenido_aprendizaje values (17,10);
insert into tbl_contenido_aprendizaje values (17,11);
insert into tbl_contenido_aprendizaje values (18,8);
insert into tbl_contenido_aprendizaje values (18,9);
insert into tbl_contenido_aprendizaje values (18,10);
insert into tbl_contenido_aprendizaje values (18,11);
insert into tbl_contenido_aprendizaje values (19,8);
insert into tbl_contenido_aprendizaje values (19,9);
insert into tbl_contenido_aprendizaje values (19,10);
insert into tbl_contenido_aprendizaje values (19,11);
insert into tbl_contenido_aprendizaje values (20,8);
insert into tbl_contenido_aprendizaje values (20,9);
insert into tbl_contenido_aprendizaje values (20,10);
insert into tbl_contenido_aprendizaje values (20,11);

insert into tbl_producto_esperado(VCH_descripcion) values ("Abordar situaciones en las que se distinga la variable como incógnita, como número generalizado y como relación de dependencia.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Generalizar comportamientos de fenómenos y construir patrones.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Representar y expresar simbólicamente enunciados verbales de actividades matemáticas.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Usar estrategias variacionales (comparar, seriar, estimar) para diferenciar comportamientos lineales y no lineales.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Caracterizar los fenómenos de variación constante.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Representar gráficamente fenómenos de variación constante.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Explicar el algoritmo de la regla de tres con más de un argumento.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Construir unidades de medida a partir de establecer una relación específica entre magnitudes.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Interpretar la solución de un sistema de ecuaciones lineales, analítica y gráficamente.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Expresar las soluciones de ecuaciones cuadráticas.");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 1");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 2");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 3");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 44");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 12");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 21");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 56");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 75");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 322");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo 1444");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo a12");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo fse4");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo qeq11");
insert into tbl_producto_esperado(VCH_descripcion) values ("Producto esperadooo abb");

insert into tbl_aprendizaje_producto values (1,1);
insert into tbl_aprendizaje_producto values (1,2);
insert into tbl_aprendizaje_producto values (1,3);
insert into tbl_aprendizaje_producto values (1,4);
insert into tbl_aprendizaje_producto values (1,5);
insert into tbl_aprendizaje_producto values (1,6);
insert into tbl_aprendizaje_producto values (2,1);
insert into tbl_aprendizaje_producto values (2,2);
insert into tbl_aprendizaje_producto values (2,3);
insert into tbl_aprendizaje_producto values (2,4);
insert into tbl_aprendizaje_producto values (2,5);
insert into tbl_aprendizaje_producto values (2,6);
insert into tbl_aprendizaje_producto values (3,1);
insert into tbl_aprendizaje_producto values (3,2);
insert into tbl_aprendizaje_producto values (3,3);
insert into tbl_aprendizaje_producto values (3,4);
insert into tbl_aprendizaje_producto values (3,5);
insert into tbl_aprendizaje_producto values (3,6);
insert into tbl_aprendizaje_producto values (4,7);
insert into tbl_aprendizaje_producto values (4,8);
insert into tbl_aprendizaje_producto values (4,9);
insert into tbl_aprendizaje_producto values (4,10);
insert into tbl_aprendizaje_producto values (4,11);
insert into tbl_aprendizaje_producto values (4,12);
insert into tbl_aprendizaje_producto values (5,7);
insert into tbl_aprendizaje_producto values (5,8);
insert into tbl_aprendizaje_producto values (5,9);
insert into tbl_aprendizaje_producto values (5,10);
insert into tbl_aprendizaje_producto values (5,11);
insert into tbl_aprendizaje_producto values (5,12);
insert into tbl_aprendizaje_producto values (6,7);
insert into tbl_aprendizaje_producto values (6,8);
insert into tbl_aprendizaje_producto values (6,9);
insert into tbl_aprendizaje_producto values (6,10);
insert into tbl_aprendizaje_producto values (6,11);
insert into tbl_aprendizaje_producto values (6,12);
insert into tbl_aprendizaje_producto values (7,13);
insert into tbl_aprendizaje_producto values (7,14);
insert into tbl_aprendizaje_producto values (7,15);
insert into tbl_aprendizaje_producto values (7,16);
insert into tbl_aprendizaje_producto values (8,13);
insert into tbl_aprendizaje_producto values (8,14);
insert into tbl_aprendizaje_producto values (8,15);
insert into tbl_aprendizaje_producto values (8,16);
insert into tbl_aprendizaje_producto values (9,17);
insert into tbl_aprendizaje_producto values (9,18);
insert into tbl_aprendizaje_producto values (9,19);
insert into tbl_aprendizaje_producto values (9,20);
insert into tbl_aprendizaje_producto values (10,17);
insert into tbl_aprendizaje_producto values (10,18);
insert into tbl_aprendizaje_producto values (10,19);
insert into tbl_aprendizaje_producto values (10,20);

insert into tbl_espacio_fisico(VCH_nombre) values ("Area 1: Cancha de futbol");
insert into tbl_espacio_fisico(VCH_nombre) values ("Area 2: Cancha de bascketball");
insert into tbl_espacio_fisico(VCH_nombre) values ("Area 3: Patio de juegos");
insert into tbl_espacio_fisico(VCH_nombre) values ("Area 4: Patio trasero");
insert into tbl_espacio_fisico(VCH_nombre) values ("Area 5: Patio delantero");

insert into tbl_titulo(VCH_descripcion) values ("Usos de la variable.");
insert into tbl_titulo(VCH_descripcion) values ("Resolución de ecuaciones de primer grado con una incógnita.");
insert into tbl_titulo(VCH_descripcion) values ("Ejercicio de metacognicion.");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 4");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 5");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 6");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 7");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 8");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 9");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 10");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 11");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 12");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 13");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 14");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 15");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 16");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 17");
insert into tbl_titulo(VCH_descripcion) values ("Titulo 18");

insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(1,"repetir");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(1,"registrar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(1,"memorizar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(2,"interpretar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(2,"traducir");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(3,"distinguir");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(3,"examinar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(4,"aplicar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(4,"emplear");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(4,"utilizar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(4,"practicar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(5,"planear");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(5,"proponer");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(5,"definir");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(5,"combinar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(6,"juzgar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(6,"evaluar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(6,"clasificar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(6,"estimar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(6,"valorar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(3,"separar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(4,"usar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(5,"dirigir");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(5,"preparar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(1,"citar");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(1,"tabular");
insert into tbl_nivel_taxonomico(TINT_nivel,VCH_verbo) values(1,"examinar");

insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 1");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("Construye T");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 2");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 3");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 4");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 5");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 6");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 7");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 8");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 9");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 10");
insert into tbl_habilidad_socioemocional(VCH_descripcion) values("habilidad socioemocinal 11");

insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("4","Escucha, interpreta y emite mensajes pertinentes en distintos contextos mediante la utilización de medios, códigos y herramientas apropiados.","Generica");
insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("7","Aprende por iniciativa e interés propio a lo largo de la vida.","Generica");
insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("5","Desarrolla innovaciones y propone soluciones a problemas a partir de métodos establecidos.","Generica");
insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("8","Participa y colabora de manera efectiva en equipos diversos.","Generica");
insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("M1","Construye e interpreta modelos matemáticos mediante la aplicación de procedimientos aritméticos, algebraicos, geométricos y variacionales, para la comprensión y análisis de situaciones reales, hipotéticas o formales.","Disciplinar");
insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("M8","Interpreta tablas, gráficas, mapas, diagramas y textos con símbolos matemáticos y científicos.","Disciplinar");
insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("M6","Cuantifica, representa y contrasta experimental o matemáticamente magnitudes del espacio que lo rodea.","Disciplinar");
insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("M3","Explica e interpreta los resultados obtenidos mediante procedimientos matemáticos y los contrasta con modelos establecidos o situaciones reales.","Disciplinar");
insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("M4","Argumenta la solución obtenida de un problema, con métodos numéricos, gráficos, analíticos y variacionales, mediante el lenguaje verbal y matemático.","Disciplinar");
insert into tbl_competencia(VCH_identificador,VCH_descripcion,VCH_tipo) values("M2","Formula y resuelve problemas matemáticos aplicando enfoques.","Disciplinar");

insert into tbl_atributo(VCH_descripcion,FLT_identificador,FK_id_competencia) values("Expresa ideas y conceptos mediante representaciones lingüísticas, matemáticas o gráficas",4.1,1);
insert into tbl_atributo(VCH_descripcion,FLT_identificador,FK_id_competencia) values("Define metas y da seguimiento a sus procesos de construcción del conocimiento.",7.1,2);
insert into tbl_atributo(VCH_descripcion,FLT_identificador,FK_id_competencia) values("Ordena información de acuerdo a categorías, jerarquías y relaciones.",5.2,3);
insert into tbl_atributo(VCH_descripcion,FLT_identificador,FK_id_competencia) values("Sigue instrucciones y procedimientos de manera reflexiva, comprendiendo como cada uno de sus pasos contribuye al alcance de un objetivo.",5.1,3);

insert into tbl_campo_competencia values(1,5);
insert into tbl_campo_competencia values(1,6);
insert into tbl_campo_competencia values(1,7);
insert into tbl_campo_competencia values(1,8);
insert into tbl_campo_competencia values(1,9);
insert into tbl_campo_competencia values(1,10);

insert into tbl_planeacion_contenedor values (1);
insert into tbl_planeacion_contenedor values (2);
insert into tbl_planeacion_contenedor values (3);

insert into tbl_planeacion_usuario values (1,3,"realizo");
insert into tbl_planeacion_usuario values (2,4,"realizo");
insert into tbl_planeacion_usuario values (3,5,"realizo");

insert into tbl_datos_identificacion values (1,"5to semestre","segundo parcial","1 de 2","planeacion para hacer menos burros a los alumnos","50");
insert into tbl_datos_identificacion values (2,"3to semestre","tercerp parcial","1 de 2","planeacion de tercero","30");
insert into tbl_datos_identificacion values (3,"1to semestre","primero parcial","1 de 2","planeacion de primero ","20");

insert into tbl_datos_asignatura values (1,1);
insert into tbl_datos_asignatura values (2,2);
insert into tbl_datos_submodulo values (3,1);

insert into tbl_planeacion values (1,1,0,1,0);
insert into tbl_planeacion values (2,2,0,2,0);
insert into tbl_planeacion values (3,2,0,3,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-01 12:01:17

/*insert into tbl_submodulo(VCH_nombre,VCH_clave,FK_id_modulo) values("Submodulo 1 de POO","modPoo1",1);
insert into tbl_submodulo_eje values(1,1);

insert into tbl_eje(VCH_descripcion) values("************");

select PK_id_eje
from tbl_eje
order by PK_id_eje desc
limit 1;

insert into tbl_submodulo_eje values(ultimo_id_de_eje,id_guardado_de_submodulo);*/