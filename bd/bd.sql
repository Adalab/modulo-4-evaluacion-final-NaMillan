CREATE DATABASE  IF NOT EXISTS `plantshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plantshop`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 192.168.1.35    Database: plantshop
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `contactprofessionals`
--

DROP TABLE IF EXISTS `contactprofessionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactprofessionals` (
  `contactID` int NOT NULL AUTO_INCREMENT,
  `id` int DEFAULT NULL,
  `message` text,
  `messageStatus` enum('read','unread') DEFAULT 'unread',
  PRIMARY KEY (`contactID`),
  KEY `id` (`id`),
  CONSTRAINT `contactprofessionals_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactprofessionals`
--

LOCK TABLES `contactprofessionals` WRITE;
/*!40000 ALTER TABLE `contactprofessionals` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactprofessionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `favoriteID` int NOT NULL AUTO_INCREMENT,
  `id` int DEFAULT NULL,
  `plantID` int DEFAULT NULL,
  PRIMARY KEY (`favoriteID`),
  KEY `id` (`id`),
  KEY `plantID` (`plantID`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`plantID`) REFERENCES `plants` (`plantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plants`
--

DROP TABLE IF EXISTS `plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plants` (
  `plantID` int NOT NULL AUTO_INCREMENT,
  `plantName` varchar(100) DEFAULT NULL,
  `descriptionPlant` text,
  `careInstructions` text,
  `price` decimal(10,2) DEFAULT NULL,
  `imageURL` longtext,
  PRIMARY KEY (`plantID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plants`
--

LOCK TABLES `plants` WRITE;
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
INSERT INTO `plants` VALUES (9,'Suculenta Haworthia','Pequeña planta suculenta con hojas puntiagudas y rayas blancas.','Luz indirecta, riego moderado cada dos semanas',12.99,'https://img.freepik.com/foto-gratis/vista-lateral-manos-mujer-guantes-goma-ropa-blanca-sosteniendo-suculentas-o-cactus-macetas-otras-plantas-verdes_158595-7077.jpg?t=st=1709276450~exp=1709280050~hmac=3ed148dfb6535b6ab4fecdb941bb923416c78c190e185d23bd68827a2c764d08&w=996'),(10,'Ficus Lyrata','Árbol de hoja perenne con hojas grandes y brillantes.','Luz indirecta brillante, riego regular.',34.99,'https://img.freepik.com/foto-gratis/plantas-interior-estudio_23-2151022061.jpg?t=st=1709276983~exp=1709280583~hmac=5595d0b8830068e04aa49bd38336c40df8f91f2e0b1a0d5d463ba5d6dc5139fe&w=360'),(11,'Calathea Orbifolia','Planta de interior con hojas grandes y rayas verdes y blancas.','Sombra parcial, humedad alta, riego regular.',19.99,'https://img.freepik.com/foto-gratis/cerrar-mujer-sosteniendo-maceta_23-2148928446.jpg?t=st=1709277045~exp=1709280645~hmac=3e24dbc661b62a944cb03af31f00dd7e9794236318800230b8db8af20a423eab&w=996'),(12,'Monstera deliciosa','Planta tropical con hojas grandes y perforadas.','Luz indirecta, riego regular.',29.99,'https://img.freepik.com/foto-gratis/arreglo-minimo-hojas-tropicales_23-2148955688.jpg?t=st=1709277116~exp=1709280716~hmac=b3ec7039c3c3234f146a16c38ce58ba7818523b961dae3f3b117cd0e2f95fd82&w=360'),(13,'Pothos dorado','Planta de interior de rápido crecimiento con hojas verdes y amarillas.','Luz indirecta, riego ocasional.',9.99,'https://img.freepik.com/foto-gratis/naturaleza-muerta-plantas-interior_23-2151024963.jpg?t=st=1709277185~exp=1709280785~hmac=db847db714f4291b4e8befee08e95322508a0194bfe1a445833b6f0f0ef606e7&w=360');
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-01  9:57:40
