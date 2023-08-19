CREATE DATABASE  IF NOT EXISTS `reserva_vuelo_copia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reserva_vuelo_copia`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: reserva_vuelo
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `aerolinea`
--

DROP TABLE IF EXISTS `aerolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aerolinea` (
  `ID_aerolinea` int NOT NULL AUTO_INCREMENT,
  `nombre_aerolinea` varchar(30) NOT NULL,
  `ID_aeronave` int NOT NULL,
  PRIMARY KEY (`ID_aerolinea`),
  KEY `FK_ID_aeronave` (`ID_aeronave`),
  CONSTRAINT `FK_ID_aeronave` FOREIGN KEY (`ID_aeronave`) REFERENCES `flota` (`ID_aeronave`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerolinea`
--

LOCK TABLES `aerolinea` WRITE;
/*!40000 ALTER TABLE `aerolinea` DISABLE KEYS */;
INSERT INTO `aerolinea` VALUES (1,'LATAM',1),(2,'LATAM',2),(3,'LATAM',3),(4,'LATAM',4),(5,'JetSmart',1),(6,'JetSmart',2);
/*!40000 ALTER TABLE `aerolinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto` (
  `ID_aeropuerto` int NOT NULL AUTO_INCREMENT,
  `codigo_IATA` varchar(3) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `pais` varchar(30) NOT NULL,
  `coordenada` point NOT NULL,
  PRIMARY KEY (`ID_aeropuerto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto`
--

LOCK TABLES `aeropuerto` WRITE;
/*!40000 ALTER TABLE `aeropuerto` DISABLE KEYS */;
INSERT INTO `aeropuerto` VALUES (1,'GRU','San Pablo','Brasil',0x0000000001010000009A931799806F37C09A9658198D3C47C0),(2,'BOG','Bogota','Colombia',0x000000000101000000B91803EB38CE1240FB95CE87678952C0),(3,'LIM','Lima','Peru',0x000000000101000000D5AF743E3C0B28C04D4EED0C534753C0),(4,'SCL','Santiago de Chile','Chile',0x0000000001010000004D4BAC8C46B240C04D4BAC8C46B251C0),(5,'MVD','Montevideo','Uruguay',0x0000000001010000004D4BAC8C46B240C04D4BAC8C46B251C0);
/*!40000 ALTER TABLE `aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiento` (
  `ID_asiento` int NOT NULL AUTO_INCREMENT,
  `tipo_asiento` varchar(20) NOT NULL,
  `precio_asiento` float NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_asiento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
INSERT INTO `asiento` VALUES (1,'VIP',9,1),(2,'Adelante',6,1),(3,'Medio',4,1),(4,'Posterior',2,1),(5,'Aleatorio',0,1);
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aviso`
--

DROP TABLE IF EXISTS `aviso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviso` (
  `ID_aviso` int NOT NULL AUTO_INCREMENT,
  `ID_cliente` int NOT NULL,
  `tipo_aviso` varchar(100) NOT NULL,
  `fecha_hora_aviso` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_aviso`),
  KEY `FK_ID_cliente_aviso` (`ID_cliente`),
  CONSTRAINT `FK_ID_cliente_aviso` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviso`
--

LOCK TABLES `aviso` WRITE;
/*!40000 ALTER TABLE `aviso` DISABLE KEYS */;
INSERT INTO `aviso` VALUES (1,1,'confirmacion de vuelo','2023-01-14 09:00:00'),(2,2,'alerta de precios','2023-01-14 09:10:00'),(3,3,'promociones','2023-01-14 09:20:00'),(4,4,'confirmacion de vuelo','2023-01-14 09:25:00');
/*!40000 ALTER TABLE `aviso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido_paterno` varchar(60) NOT NULL,
  `apellido_materno` varchar(60) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `pasaporte` varchar(20) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Fernando','Martinez','Rodriguez','45119518','A3542D','+59194225544','f.martinez@hotmail.com'),(2,'Paula','Paulos','Chirinos','39557854','B4512L','+59892147756','m.paul.34@gmail.com'),(3,'Mauricio','Quintero','Diaz','65124897','A3445D','+59895126648','q.m.1987@hotmail.com'),(4,'Fernanda','Masias','Rosinelli','49875895','B8265G','+59695156347','f.masias@hotmail.com'),(5,'Camila','Alvarez','Cueva','71139582','K3445L','+59199426611','camila_24@hotmail.com'),(6,'Patricio','Vitale','Hoyos','70953687','A3446B','+59899441251','vitale.p@gmail.com'),(7,'Mariana','Hoyos','Saavedra','64119857','A3455L','+596991754369','marianita@gmail.com'),(8,'Katherine','Romero','Soto','70149547','K4524L','+59199127645','kath.r.18@hotmail.com'),(9,'Andres','Quintero','Roca','45119452','A9542D','+598999215948','andres_69@gmail.com'),(10,'Felipe','Guerrero','Perez','71985426','K6445L','+59195166743','guerrero.265@hotmail.com'),(11,'Kelly','Francia','Rivera','70139247','K125L','+591999851236','k_sk@gmail.com'),(12,'Pedro','Mora','Aguilar','45517518','A1542D','+59194425534','p.mora@hotmail.com'),(13,'Martina','Guichon','Quintero','75517519','L1672R','+59199825534','marti_15@gmail.com'),(14,'Andres','Rivera','Gutierrez','60551851','K8542D','+59894425524','andy@hotmail.com'),(15,'Julieta','Cepeda','Brito','43228516','K9542D','+59899628514','cjuli@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `ID_comentario` int NOT NULL AUTO_INCREMENT,
  `ID_cliente` int NOT NULL,
  `mensaje` varchar(120) NOT NULL,
  `fecha_hora_comentario` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_comentario`),
  KEY `FK_ID_cliente_comentario` (`ID_cliente`),
  CONSTRAINT `FK_ID_cliente_comentario` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,1,'excelente servicio de la aerolinea, disfrute el vuelo','2023-01-16 09:00:00'),(2,3,'me gusta la flexibilidad de la web para comprar el boleto','2023-01-17 11:13:00');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `ID_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido_paterno` varchar(60) NOT NULL,
  `apellido_materno` varchar(60) NOT NULL,
  `cargo` varchar(60) NOT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `salario` float DEFAULT NULL,
  PRIMARY KEY (`ID_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Marcos','Rivero','Suarez','analista de datos','2021-02-05',2500),(2,'Rosario','Fuentes','Medina','recursos humanos','2018-01-18',1800),(3,'Laura','Romero','Sosa','supervisora de atencion al cliente','2022-01-19',1500),(4,'Santiago','Trindade','Cubillas','desarrollador ATI','2021-02-20',2500),(5,'Stephanie','Gogh','Fernandez','Desarrolladora UX','2023-01-17',1200),(6,'Kary','Francia','Vasquez','analista de negocios','2023-02-19',2500);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipaje`
--

DROP TABLE IF EXISTS `equipaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipaje` (
  `ID_equipaje` int NOT NULL AUTO_INCREMENT,
  `tipo_equipaje` varchar(20) NOT NULL,
  `cantidad_equipaje` int NOT NULL,
  `peso_kg` int DEFAULT NULL,
  `precio_equipaje` float NOT NULL,
  PRIMARY KEY (`ID_equipaje`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipaje`
--

LOCK TABLES `equipaje` WRITE;
/*!40000 ALTER TABLE `equipaje` DISABLE KEYS */;
INSERT INTO `equipaje` VALUES (1,'Mano',1,5,0),(2,'Carry_on',2,15,45),(3,'Grande',3,36,100),(4,'Extragrande',3,40,115);
/*!40000 ALTER TABLE `equipaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escala`
--

DROP TABLE IF EXISTS `escala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escala` (
  `ID_escala` int NOT NULL AUTO_INCREMENT,
  `descripcion_escala` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_escala`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escala`
--

LOCK TABLES `escala` WRITE;
/*!40000 ALTER TABLE `escala` DISABLE KEYS */;
INSERT INTO `escala` VALUES (1,'sin escalas'),(2,'1 escala'),(3,'2 escalas'),(4,'3 escalas');
/*!40000 ALTER TABLE `escala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flota`
--

DROP TABLE IF EXISTS `flota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flota` (
  `ID_aeronave` int NOT NULL AUTO_INCREMENT,
  `tipo_aeronave` varchar(30) NOT NULL,
  `cantidad_asiento` int NOT NULL,
  PRIMARY KEY (`ID_aeronave`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flota`
--

LOCK TABLES `flota` WRITE;
/*!40000 ALTER TABLE `flota` DISABLE KEYS */;
INSERT INTO `flota` VALUES (1,'Airbus 321',220),(2,'Airbus 320',170),(3,'Boeing 787',247),(4,'Boeing 777',400),(5,'Airbus 320-271N',186);
/*!40000 ALTER TABLE `flota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_accion_registro`
--

DROP TABLE IF EXISTS `log_accion_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_accion_registro` (
  `ID_log_accion_registro` int NOT NULL AUTO_INCREMENT,
  `fecha_transaccion` date DEFAULT NULL,
  `hora_transaccion` time DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `tabla` varchar(100) DEFAULT NULL,
  `registro` varchar(1000) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_log_accion_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_accion_registro`
--

LOCK TABLES `log_accion_registro` WRITE;
/*!40000 ALTER TABLE `log_accion_registro` DISABLE KEYS */;
INSERT INTO `log_accion_registro` VALUES (1,'2023-08-07','22:03:15','actualizacion','flota','Nuevo registro actualizado: 4Boeing 777400','root@localhost'),(2,'2023-08-07','22:03:15','insercion','flota','Nuevo registro insertado: 5Airbus 320-271N186','root@localhost'),(3,'2023-08-07','22:03:15','insercion','cliente','Nuevo registro insertado: 11KellyFranceRivera70139247K125L+591999851236k_sk@gmail.com','root@localhost'),(4,'2023-08-07','22:03:15','actualizacion','cliente','Nuevo registro actualizado: 11KellyFranciaRivera70139247K125L+591999851236k_sk@gmail.com','root@localhost'),(5,'2023-08-07','22:03:15','insercion','empleado','Nuevo registro insertado: 5StephanieGoghFernandezDesarrolladora UX2023-01-171200','root@localhost'),(6,'2023-08-07','22:03:15','actualizacion','empleado','Nuevo registro actualizado: 3LauraRomeroSosasupervisora de atencion al cliente2022-01-191500','root@localhost'),(7,'2023-08-07','22:03:15','eliminacion','promocion','Registro eliminado: 26san valentin30% dcto en el vuelo de ida0.32023-02-132023-02-15','root@localhost'),(9,'2023-08-07','22:03:33','insercion','empleado','Nuevo registro insertado: 6KaryFranciaVasquezanalista de negocios2023-02-192500','root@localhost'),(10,'2023-08-07','22:03:33','insercion','cliente','Nuevo registro insertado: 12PedroMoraAguilar45517518A1542D+59194425534p.mora@hotmail.com','root@localhost'),(11,'2023-08-07','22:03:33','insercion','cliente','Nuevo registro insertado: 13MartinaGuichonQuintero75517519L1672R+59199825534marti_15@gmail.com','root@localhost'),(12,'2023-08-07','22:03:33','insercion','cliente','Nuevo registro insertado: 14AndresRiveraGutierrez60551851K8542D+59894425524andy@hotmail.com','root@localhost'),(13,'2023-08-07','22:03:33','insercion','cliente','Nuevo registro insertado: 15JulietaCepedaBrito43228516K9542D+59899628514cjuli@gmail.com','root@localhost');
/*!40000 ALTER TABLE `log_accion_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_aeropuerto`
--

DROP TABLE IF EXISTS `log_aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_aeropuerto` (
  `ID_log_aeropuerto` int NOT NULL AUTO_INCREMENT,
  `ID_aeropuerto` int NOT NULL,
  `fecha_transaccion` date DEFAULT NULL,
  `hora_transaccion` time DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `registro` varchar(1000) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_log_aeropuerto`),
  KEY `FK_ID_aeropuerto_log` (`ID_aeropuerto`),
  CONSTRAINT `FK_ID_aeropuerto_log` FOREIGN KEY (`ID_aeropuerto`) REFERENCES `aeropuerto` (`ID_aeropuerto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_aeropuerto`
--

LOCK TABLES `log_aeropuerto` WRITE;
/*!40000 ALTER TABLE `log_aeropuerto` DISABLE KEYS */;
INSERT INTO `log_aeropuerto` VALUES (1,1,'2023-08-07','22:03:15','actualizacion','Nuevo registro actualizado: 1GRUSan PabloBrasil','root@localhost'),(2,5,'2023-08-07','22:03:15','insercion','Nuevo registro insertado: 5MVDMontevideoUruguay','root@localhost');
/*!40000 ALTER TABLE `log_aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `ID_pago` int NOT NULL AUTO_INCREMENT,
  `metodo_pago` varchar(50) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `hora_pago` time DEFAULT NULL,
  PRIMARY KEY (`ID_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'tarjeta de credito','2022-11-04','01:22:00'),(2,'tarjeta debito','2022-11-13','15:49:00'),(3,'paypal','2022-11-16','09:21:00'),(4,'tarjeta de credito','2022-11-26','03:27:00'),(5,'paypal','2022-11-28','00:25:00'),(6,'tarjeta de credito','2022-12-05','21:19:00'),(7,'tarjeta de credito','2022-12-08','22:51:00'),(8,'tarjeta de credito','2022-12-11','01:03:00'),(9,'tarjeta debito','2022-12-13','23:38:00'),(10,'tarjeta debito','2022-12-24','06:19:00');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion` (
  `ID_promocion` int NOT NULL AUTO_INCREMENT,
  `ID_aerolinea` int NOT NULL,
  `campania_promocion` varchar(50) NOT NULL,
  `descripcion_promocion` varchar(120) NOT NULL,
  `descuento` float NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`ID_promocion`),
  KEY `FK_ID_aerolinea_promo` (`ID_aerolinea`),
  CONSTRAINT `FK_ID_aerolinea_promo` FOREIGN KEY (`ID_aerolinea`) REFERENCES `aerolinea` (`ID_aerolinea`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` VALUES (1,2,'fin de semana','20% dcto en el vuelo de ida',0.2,'2023-02-10','2023-02-12');
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `ID_reserva` int NOT NULL AUTO_INCREMENT,
  `ID_vuelo` int NOT NULL,
  `ID_servicio` int NOT NULL,
  `ID_cliente` int NOT NULL,
  `fecha_reserva` date NOT NULL,
  `hora_reserva` time NOT NULL,
  `ID_pago` int NOT NULL,
  PRIMARY KEY (`ID_reserva`),
  KEY `FK_ID_vuelo` (`ID_vuelo`),
  KEY `FK_ID_servicio` (`ID_servicio`),
  KEY `FK_ID_cliente` (`ID_cliente`),
  KEY `FK_ID_pago` (`ID_pago`),
  CONSTRAINT `FK_ID_cliente` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_pago` FOREIGN KEY (`ID_pago`) REFERENCES `pago` (`ID_pago`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_servicio` FOREIGN KEY (`ID_servicio`) REFERENCES `servicio` (`ID_servicio`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_vuelo` FOREIGN KEY (`ID_vuelo`) REFERENCES `vuelo` (`ID_vuelo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,1,3,1,'2022-11-04','01:18:00',1),(2,2,4,2,'2022-11-13','15:45:00',2),(3,3,5,3,'2022-11-16','09:17:00',3),(4,4,2,4,'2022-11-26','03:24:00',4),(5,2,3,5,'2022-11-28','00:19:00',5),(6,2,1,6,'2022-12-05','21:15:00',6),(7,3,3,7,'2022-12-08','22:48:00',7),(8,4,5,8,'2022-12-11','00:59:00',8),(9,1,4,9,'2022-12-13','23:35:00',9),(10,1,2,10,'2022-12-24','06:17:00',10);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `ID_servicio` int NOT NULL AUTO_INCREMENT,
  `descripcion_servicio` varchar(120) NOT NULL,
  `ID_asiento` int NOT NULL,
  `ID_equipaje` int NOT NULL,
  PRIMARY KEY (`ID_servicio`),
  KEY `FK_ID_asiento` (`ID_asiento`),
  KEY `FK_ID_equipaje` (`ID_equipaje`),
  CONSTRAINT `FK_ID_asiento` FOREIGN KEY (`ID_asiento`) REFERENCES `asiento` (`ID_asiento`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_equipaje` FOREIGN KEY (`ID_equipaje`) REFERENCES `equipaje` (`ID_equipaje`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'basico',5,1),(2,'basico+carry_on',5,2),(3,'basico+carry_on+grande',5,3),(4,'basico+carry_on+extragrande',5,4),(5,'posterior+mano',4,1);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_flota_aerolinea`
--

DROP TABLE IF EXISTS `vista_flota_aerolinea`;
/*!50001 DROP VIEW IF EXISTS `vista_flota_aerolinea`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_flota_aerolinea` AS SELECT 
 1 AS `aerolinea`,
 1 AS `aeronave`,
 1 AS `cantidad de asientos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ingresos_por_aerolinea`
--

DROP TABLE IF EXISTS `vista_ingresos_por_aerolinea`;
/*!50001 DROP VIEW IF EXISTS `vista_ingresos_por_aerolinea`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ingresos_por_aerolinea` AS SELECT 
 1 AS `aerolinea`,
 1 AS `ingresos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ingresos_por_ruta`
--

DROP TABLE IF EXISTS `vista_ingresos_por_ruta`;
/*!50001 DROP VIEW IF EXISTS `vista_ingresos_por_ruta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ingresos_por_ruta` AS SELECT 
 1 AS `ruta`,
 1 AS `ingresos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_reserva`
--

DROP TABLE IF EXISTS `vista_reserva`;
/*!50001 DROP VIEW IF EXISTS `vista_reserva`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_reserva` AS SELECT 
 1 AS `nombre`,
 1 AS `apellidos`,
 1 AS `correo`,
 1 AS `aerolinea`,
 1 AS `origen`,
 1 AS `destino final`,
 1 AS `escalas`,
 1 AS `equipaje`,
 1 AS `asiento`,
 1 AS `fecha`,
 1 AS `precio_final`,
 1 AS `pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_reserva_mayor_500dolares`
--

DROP TABLE IF EXISTS `vista_reserva_mayor_500dolares`;
/*!50001 DROP VIEW IF EXISTS `vista_reserva_mayor_500dolares`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_reserva_mayor_500dolares` AS SELECT 
 1 AS `nombre`,
 1 AS `apellidos`,
 1 AS `correo`,
 1 AS `aerolinea`,
 1 AS `origen`,
 1 AS `destino final`,
 1 AS `escalas`,
 1 AS `equipaje`,
 1 AS `asiento`,
 1 AS `fecha`,
 1 AS `precio_final`,
 1 AS `pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_vuelos_programados`
--

DROP TABLE IF EXISTS `vista_vuelos_programados`;
/*!50001 DROP VIEW IF EXISTS `vista_vuelos_programados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_vuelos_programados` AS SELECT 
 1 AS `aerolinea`,
 1 AS `aeronave`,
 1 AS `origen`,
 1 AS `destino final`,
 1 AS `escalas`,
 1 AS `Salida programada`,
 1 AS `Llegada Programada`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `ID_vuelo` int NOT NULL AUTO_INCREMENT,
  `ID_aerolinea` int NOT NULL,
  `origen` int NOT NULL,
  `destino_final` int NOT NULL,
  `ID_escala` int NOT NULL,
  `fecha_hora_salida_real` datetime DEFAULT NULL,
  `fecha_hora_salida_programada` datetime DEFAULT NULL,
  `fecha_hora_llegada_real` datetime DEFAULT NULL,
  `fecha_hora_llegada_programada` datetime DEFAULT NULL,
  `precio_vuelo` float NOT NULL,
  PRIMARY KEY (`ID_vuelo`),
  KEY `FK_origen` (`origen`),
  KEY `FK_destino_final` (`destino_final`),
  KEY `FK_ID_aerolinea` (`ID_aerolinea`),
  KEY `FK_ID_escala` (`ID_escala`),
  CONSTRAINT `FK_destino_final` FOREIGN KEY (`destino_final`) REFERENCES `aeropuerto` (`ID_aeropuerto`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_aerolinea` FOREIGN KEY (`ID_aerolinea`) REFERENCES `aerolinea` (`ID_aerolinea`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ID_escala` FOREIGN KEY (`ID_escala`) REFERENCES `escala` (`ID_escala`) ON UPDATE CASCADE,
  CONSTRAINT `FK_origen` FOREIGN KEY (`origen`) REFERENCES `aeropuerto` (`ID_aeropuerto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (1,2,3,2,1,'2023-01-15 09:43:00','2023-01-15 09:30:00','2023-01-15 13:32:00','2023-01-15 13:35:00',600),(2,1,3,1,2,'2023-01-15 09:29:00','2023-01-15 09:30:00','2023-01-15 18:41:00','2023-01-15 18:45:00',650),(3,5,3,4,3,'2023-01-15 10:04:00','2023-01-15 10:00:00','2023-01-15 12:30:00','2023-01-15 12:30:00',220),(4,6,3,2,1,'2023-01-15 10:33:00','2023-01-15 10:30:00','2023-01-15 14:34:00','2023-01-15 14:35:00',550);
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `vista_flota_aerolinea`
--

/*!50001 DROP VIEW IF EXISTS `vista_flota_aerolinea`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_flota_aerolinea` AS select `aer`.`nombre_aerolinea` AS `aerolinea`,`f`.`tipo_aeronave` AS `aeronave`,`f`.`cantidad_asiento` AS `cantidad de asientos` from (`aerolinea` `aer` join `flota` `f` on((`aer`.`ID_aeronave` = `f`.`ID_aeronave`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ingresos_por_aerolinea`
--

/*!50001 DROP VIEW IF EXISTS `vista_ingresos_por_aerolinea`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ingresos_por_aerolinea` AS select `aer`.`nombre_aerolinea` AS `aerolinea`,sum(((`a`.`precio_asiento` + `e`.`precio_equipaje`) + `v`.`precio_vuelo`)) AS `ingresos` from (((((`vuelo` `v` join `reserva` `r` on((`r`.`ID_vuelo` = `v`.`ID_vuelo`))) join `servicio` `s` on((`r`.`ID_servicio` = `s`.`ID_servicio`))) join `asiento` `a` on((`s`.`ID_asiento` = `a`.`ID_asiento`))) join `equipaje` `e` on((`s`.`ID_equipaje` = `e`.`ID_equipaje`))) join `aerolinea` `aer` on((`aer`.`ID_aerolinea` = `v`.`ID_aerolinea`))) group by `aerolinea` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ingresos_por_ruta`
--

/*!50001 DROP VIEW IF EXISTS `vista_ingresos_por_ruta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ingresos_por_ruta` AS select concat(`ae1`.`codigo_IATA`,'-',`ae2`.`codigo_IATA`) AS `ruta`,sum(((`a`.`precio_asiento` + `e`.`precio_equipaje`) + `v`.`precio_vuelo`)) AS `ingresos` from ((((((`vuelo` `v` join `aeropuerto` `ae1` on((`ae1`.`ID_aeropuerto` = `v`.`origen`))) join `aeropuerto` `ae2` on((`ae2`.`ID_aeropuerto` = `v`.`destino_final`))) join `reserva` `r` on((`r`.`ID_vuelo` = `v`.`ID_vuelo`))) join `servicio` `s` on((`r`.`ID_servicio` = `s`.`ID_servicio`))) join `asiento` `a` on((`s`.`ID_asiento` = `a`.`ID_asiento`))) join `equipaje` `e` on((`s`.`ID_equipaje` = `e`.`ID_equipaje`))) group by `ruta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_reserva`
--

/*!50001 DROP VIEW IF EXISTS `vista_reserva`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_reserva` AS select `c`.`nombre` AS `nombre`,concat(`c`.`apellido_paterno`,' ',`c`.`apellido_materno`) AS `apellidos`,`c`.`correo` AS `correo`,`aerolinea`.`nombre_aerolinea` AS `aerolinea`,`ae1`.`codigo_IATA` AS `origen`,`ae2`.`codigo_IATA` AS `destino final`,`esc`.`descripcion_escala` AS `escalas`,`s`.`descripcion_servicio` AS `equipaje`,`a`.`tipo_asiento` AS `asiento`,`r`.`fecha_reserva` AS `fecha`,((`a`.`precio_asiento` + `e`.`precio_equipaje`) + `v`.`precio_vuelo`) AS `precio_final`,`p`.`metodo_pago` AS `pago` from ((((((((((`reserva` `r` join `cliente` `c` on((`r`.`ID_cliente` = `c`.`ID_cliente`))) join `vuelo` `v` on((`r`.`ID_vuelo` = `v`.`ID_vuelo`))) join `aeropuerto` `ae1` on((`ae1`.`ID_aeropuerto` = `v`.`origen`))) join `aeropuerto` `ae2` on((`ae2`.`ID_aeropuerto` = `v`.`destino_final`))) join `escala` `esc` on((`esc`.`ID_escala` = `v`.`ID_escala`))) join `aerolinea` on((`aerolinea`.`ID_aerolinea` = `v`.`ID_aerolinea`))) join `servicio` `s` on((`r`.`ID_servicio` = `s`.`ID_servicio`))) join `asiento` `a` on((`s`.`ID_asiento` = `a`.`ID_asiento`))) join `equipaje` `e` on((`s`.`ID_equipaje` = `e`.`ID_equipaje`))) join `pago` `p` on((`r`.`ID_pago` = `p`.`ID_pago`))) order by `r`.`fecha_reserva` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_reserva_mayor_500dolares`
--

/*!50001 DROP VIEW IF EXISTS `vista_reserva_mayor_500dolares`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_reserva_mayor_500dolares` AS select `c`.`nombre` AS `nombre`,concat(`c`.`apellido_paterno`,' ',`c`.`apellido_materno`) AS `apellidos`,`c`.`correo` AS `correo`,`aerolinea`.`nombre_aerolinea` AS `aerolinea`,`ae1`.`codigo_IATA` AS `origen`,`ae2`.`codigo_IATA` AS `destino final`,`esc`.`descripcion_escala` AS `escalas`,`s`.`descripcion_servicio` AS `equipaje`,`a`.`tipo_asiento` AS `asiento`,`r`.`fecha_reserva` AS `fecha`,((`a`.`precio_asiento` + `e`.`precio_equipaje`) + `v`.`precio_vuelo`) AS `precio_final`,`p`.`metodo_pago` AS `pago` from ((((((((((`reserva` `r` join `cliente` `c` on((`r`.`ID_cliente` = `c`.`ID_cliente`))) join `vuelo` `v` on((`r`.`ID_vuelo` = `v`.`ID_vuelo`))) join `aeropuerto` `ae1` on((`ae1`.`ID_aeropuerto` = `v`.`origen`))) join `aeropuerto` `ae2` on((`ae2`.`ID_aeropuerto` = `v`.`destino_final`))) join `escala` `esc` on((`esc`.`ID_escala` = `v`.`ID_escala`))) join `aerolinea` on((`aerolinea`.`ID_aerolinea` = `v`.`ID_aerolinea`))) join `servicio` `s` on((`r`.`ID_servicio` = `s`.`ID_servicio`))) join `asiento` `a` on((`s`.`ID_asiento` = `a`.`ID_asiento`))) join `equipaje` `e` on((`s`.`ID_equipaje` = `e`.`ID_equipaje`))) join `pago` `p` on((`r`.`ID_pago` = `p`.`ID_pago`))) where (((`a`.`precio_asiento` + `e`.`precio_equipaje`) + `v`.`precio_vuelo`) > 500) order by `r`.`fecha_reserva` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_vuelos_programados`
--

/*!50001 DROP VIEW IF EXISTS `vista_vuelos_programados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_vuelos_programados` AS select `aer`.`nombre_aerolinea` AS `aerolinea`,`f`.`tipo_aeronave` AS `aeronave`,`ae1`.`codigo_IATA` AS `origen`,`ae2`.`codigo_IATA` AS `destino final`,`esc`.`descripcion_escala` AS `escalas`,`v`.`fecha_hora_salida_programada` AS `Salida programada`,`v`.`fecha_hora_llegada_programada` AS `Llegada Programada` from (((((`vuelo` `v` join `aerolinea` `aer` on((`v`.`ID_aerolinea` = `aer`.`ID_aerolinea`))) join `flota` `f` on((`aer`.`ID_aeronave` = `f`.`ID_aeronave`))) join `aeropuerto` `ae1` on((`ae1`.`ID_aeropuerto` = `v`.`origen`))) join `aeropuerto` `ae2` on((`ae2`.`ID_aeropuerto` = `v`.`destino_final`))) join `escala` `esc` on((`esc`.`ID_escala` = `v`.`ID_escala`))) */;
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

-- Dump completed on 2023-08-07 22:05:26
