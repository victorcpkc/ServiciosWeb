CREATE DATABASE  IF NOT EXISTS `UACM` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `UACM`;
-- MySQL dump 10.13  Distrib 5.7.9, for linux-glibc2.5 (x86_64)
--
-- Host: 127.0.0.1    Database: UACM
-- ------------------------------------------------------
-- Server version	5.6.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areaConcentracion`
--

DROP TABLE IF EXISTS `areaConcentracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areaConcentracion` (
  `idareaConcentracion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idareaConcentracion`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areaConcentracion`
--

LOCK TABLES `areaConcentracion` WRITE;
/*!40000 ALTER TABLE `areaConcentracion` DISABLE KEYS */;
INSERT INTO `areaConcentracion` VALUES (1,'Promocion Cultural'),(2,'Mexico y America Latina en el mundo global'),(3,'Sujetos sociales e identidades particulares'),(4,'Sociedad y politica'),(5,'Sistema politica e instituciones'),(6,'Administracion'),(7,'Ciencias del lenguaje'),(8,'Historia de la literatura'),(9,'Destrezas profesionales'),(10,'Incentiva y produccion de textos'),(11,'Historia de las filosofias'),(12,'Historia de las ideas'),(13,'Filosofia teorica'),(14,'Filosofia practica'),(15,'Logica y epistemologia'),(16,'Tecnologia de base de datos'),(17,'Inteligencia artificial'),(18,'Sistemas moviles y embebidos'),(19,'Aplicaciones web');
/*!40000 ALTER TABLE `areaConcentracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `creditos` int(11) NOT NULL,
  `noMaterias` int(11) NOT NULL,
  `tipoArea_idtipoArea` int(11) NOT NULL,
  `duracion_idtable1` int(11) NOT NULL,
  PRIMARY KEY (`idcarrera`),
  KEY `fk_carrera_tipoArea1_idx` (`tipoArea_idtipoArea`),
  KEY `fk_carrera_duracion1_idx` (`duracion_idtable1`),
  CONSTRAINT `fk_carrera_duracion1` FOREIGN KEY (`duracion_idtable1`) REFERENCES `duracion` (`idtable1`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrera_tipoArea1` FOREIGN KEY (`tipoArea_idtipoArea`) REFERENCES `tipoArea` (`idtipoArea`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Arte y patromonio cultural',340,89,1,2),(2,'Ciencia politica y administracion urbana',336,62,1,2),(3,'Ciencias sociales',330,49,1,3),(4,'Comunicación y cultura',380,69,1,3),(5,'Creación Literaria',410,116,1,3),(6,'Filosofía e historia de las ideas',356,109,1,2),(7,'Historia y sociedad contemporanea',341,54,1,2),(8,'Ciencias genómicas',345,39,2,2),(9,'Ing en sistemas de transporte urbano',400,83,2,1),(10,'Ing en sistemas electronicos industriales',395,88,2,1),(11,'Ing en software',411,54,2,3),(12,'Ing sistemas electronicos',395,88,2,1),(13,'Ing en sistemas energeticos',410,60,2,1),(14,'Modelacion matematica',330,63,2,3),(15,'Ciencias ambientales y cambio climatico',578,50,3,3),(16,'Nutricion y salud',374,44,3,2),(17,'Promocion de la salud',378,62,3,2),(18,'Protección civil y gestión de riesgos',404,24,3,3);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreraAreaConcentracion`
--

DROP TABLE IF EXISTS `carreraAreaConcentracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carreraAreaConcentracion` (
  `carrera_idcarrera` int(11) NOT NULL,
  `areaConcentracion_idareaConcentracion` int(11) NOT NULL,
  KEY `fk_table1_carrera_idx` (`carrera_idcarrera`),
  KEY `fk_carreraArea_areaConcentracion1_idx` (`areaConcentracion_idareaConcentracion`),
  CONSTRAINT `fk_carreraArea_areaConcentracion1` FOREIGN KEY (`areaConcentracion_idareaConcentracion`) REFERENCES `areaConcentracion` (`idareaConcentracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_carrera` FOREIGN KEY (`carrera_idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreraAreaConcentracion`
--

LOCK TABLES `carreraAreaConcentracion` WRITE;
/*!40000 ALTER TABLE `carreraAreaConcentracion` DISABLE KEYS */;
INSERT INTO `carreraAreaConcentracion` VALUES (1,1),(2,2),(2,3),(2,4),(2,5),(2,6),(5,7),(5,8),(5,9),(5,10),(6,11),(6,12),(6,13),(6,14),(6,15),(11,16),(11,17),(11,18),(11,19);
/*!40000 ALTER TABLE `carreraAreaConcentracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duracion`
--

DROP TABLE IF EXISTS `duracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duracion` (
  `idtable1` int(11) NOT NULL AUTO_INCREMENT,
  `duracion` int(11) NOT NULL,
  `tipoPeriodo_idtipoPeriodo` int(11) NOT NULL,
  PRIMARY KEY (`idtable1`),
  KEY `fk_duracion_tipoPeriodo1_idx` (`tipoPeriodo_idtipoPeriodo`),
  CONSTRAINT `fk_duracion_tipoPeriodo1` FOREIGN KEY (`tipoPeriodo_idtipoPeriodo`) REFERENCES `tipoPeriodo` (`idtipoPeriodo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duracion`
--

LOCK TABLES `duracion` WRITE;
/*!40000 ALTER TABLE `duracion` DISABLE KEYS */;
INSERT INTO `duracion` VALUES (1,6,1),(2,8,1),(3,10,1);
/*!40000 ALTER TABLE `duracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoArea`
--

DROP TABLE IF EXISTS `tipoArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoArea` (
  `idtipoArea` int(11) NOT NULL AUTO_INCREMENT,
  `nombreArea` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoArea`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoArea`
--

LOCK TABLES `tipoArea` WRITE;
/*!40000 ALTER TABLE `tipoArea` DISABLE KEYS */;
INSERT INTO `tipoArea` VALUES (1,'Colegio de Humanidades y Ciencias Sociales '),(2,'Colegio de Ciencias y Humanidades'),(3,'Colegio de Ciencia y Tecnología');
/*!40000 ALTER TABLE `tipoArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoPeriodo`
--

DROP TABLE IF EXISTS `tipoPeriodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoPeriodo` (
  `idtipoPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPeriodo` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipoPeriodo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoPeriodo`
--

LOCK TABLES `tipoPeriodo` WRITE;
/*!40000 ALTER TABLE `tipoPeriodo` DISABLE KEYS */;
INSERT INTO `tipoPeriodo` VALUES (1,'Semestre'),(2,'Trimestre');
/*!40000 ALTER TABLE `tipoPeriodo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05  0:50:32
CREATE DATABASE  IF NOT EXISTS `ofertaUNAM` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ofertaUNAM`;
-- MySQL dump 10.13  Distrib 5.7.9, for linux-glibc2.5 (x86_64)
--
-- Host: 127.0.0.1    Database: ofertaUNAM
-- ------------------------------------------------------
-- Server version	5.6.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Areas`
--

DROP TABLE IF EXISTS `Areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Areas` (
  `id_area` int(11) NOT NULL,
  `nombre_area` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Areas`
--

LOCK TABLES `Areas` WRITE;
/*!40000 ALTER TABLE `Areas` DISABLE KEYS */;
INSERT INTO `Areas` VALUES (1,'Ciencias Físico-Matemáticas'),(2,'Ciencias Biológicas y de la Salud'),(3,'Ciencias Sociales'),(4,'Humanidades y Artes');
/*!40000 ALTER TABLE `Areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carreras`
--

DROP TABLE IF EXISTS `Carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carreras` (
  `id_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(100) DEFAULT NULL,
  `num_materias` int(11) DEFAULT NULL,
  `num_creditos` int(11) DEFAULT NULL,
  `num_periodos` int(11) DEFAULT NULL,
  `tiempo_realizacion_prom` double DEFAULT NULL,
  `Escuelas_id_escuela` int(11) NOT NULL,
  `Areas_id_area` int(11) NOT NULL,
  `Periodos_id_area` int(11) NOT NULL,
  PRIMARY KEY (`id_carrera`),
  KEY `fk_Carreras_Escuelas1_idx` (`Escuelas_id_escuela`),
  KEY `fk_Carreras_Areas1_idx` (`Areas_id_area`),
  KEY `fk_Carreras_Periodos1_idx` (`Periodos_id_area`),
  CONSTRAINT `fk_Carreras_Areas1` FOREIGN KEY (`Areas_id_area`) REFERENCES `Areas` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carreras_Escuelas1` FOREIGN KEY (`Escuelas_id_escuela`) REFERENCES `Escuelas` (`id_escuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carreras_Periodos1` FOREIGN KEY (`Periodos_id_area`) REFERENCES `Periodos` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carreras`
--

LOCK TABLES `Carreras` WRITE;
/*!40000 ALTER TABLE `Carreras` DISABLE KEYS */;
INSERT INTO `Carreras` VALUES (1,'Arquitectura',51,392,10,5,1,1,1),(2,'Arquitectura del Paisaje',62,362,10,5,1,1,1),(3,'Diseño Industrial',58,355,10,5,1,1,1),(4,'Urbanismo',76,384,10,5,1,1,1),(5,'Arte y Diseño',79,346,8,4,2,4,1),(6,'Artes Visuales',60,388,8,4,2,4,1),(7,'Diseño y Comunicación Visual',80,406,8,4,2,4,1),(8,'Actuaría',39,438,8,4,3,1,1),(9,'Biología',37,390,8,4,3,2,1),(10,'Ciencias de la Computación',35,380,8,4,3,1,1),(11,'Ciencias de la Tierra',35,403,8,4,3,1,1),(12,'Física',43,418,9,4.5,3,1,1),(13,'Física Biomédica',46,403,8,4,3,1,1),(14,'Matemáticas',32,352,8,4,3,1,1),(15,'Matemáticas Aplicadas',40,412,8,4,3,1,1),(16,'Antropología',50,402,8,4,4,3,1),(17,'Ciencias de la Comunicación',41,376,9,4.5,4,3,1),(18,'iencias Políticas y Administración Pública',45,360,9,4.5,4,3,1),(19,'Relaciones Internacionales',45,360,9,4.5,4,3,1),(20,'Sociología',40,311,8,4,4,3,1),(21,'Administración',49,408,8,4,5,3,1),(22,'Contaduría',52,432,8,4,5,3,1),(23,'Informática',50,408,8,4,5,3,1),(24,'Derecho',68,450,10,5,6,3,1),(25,'Economía',60,366,10,5,7,3,1),(26,'Actuaría',40,438,8,4,8,1,1),(27,'Arquitectura',73,442,10,5,8,1,1),(28,'Ciencias Políticas y Administración Pública',41,334,9,4.5,8,3,1),(29,'Comunicación',41,346,9,4.5,8,3,1),(30,'Derecho',53,446,10,5,8,3,1),(31,'Diseño Gráfico',61,357,9,4.5,8,4,1),(32,'Economía',59,414,10,5,8,3,1),(33,'Enseñanza de Inglés como Lengua Extranjera',32,325,8,4,8,4,1),(34,'Enseñanza de Inglés',52,392,9,4.5,8,4,1),(35,'Filosofía',48,382,8,4,8,4,1),(36,'Historia',46,356,8,4,8,4,1),(37,'Ingeniería Civil',54,422,9,4.5,8,1,1),(38,'Lengua y Literaturas Hispánicas',48,370,8,4,8,4,1),(39,'Matemáticas aplicadas y computación',36,398,9,4.5,8,1,1),(40,'Pedagogía',49,315,8,4,8,4,1),(41,'Relaciones Internacionales',42,344,9,4.5,8,3,1),(42,'Sociología',59,315,9,4.5,8,3,1),(43,'Arquitectura',64,421,10,5,9,1,1),(44,'Comunicación y Periodismo',46,319,8,4,9,3,1),(45,'Derecho',48,430,10,5,9,3,1),(46,'Diseño Industrial',55,408,10,5,9,1,1),(47,'Economía',64,361,9,4.5,9,3,1),(48,'Ingeniería Civil',55,420,9,4.5,9,1,1),(49,'Ingeniería Eléctrica Eléctronica',41,350,9,4.5,9,1,1),(50,'Ingeniería en Computación',43,402,9,4.5,9,1,1),(51,'Ingeniería Industrial',45,374,8,4,9,1,1),(52,'Ingeniería Mecánica',43,356,8,4,9,1,1),(53,'Pedagogía',55,316,8,4,9,4,1),(54,'Planificación para el Desarrollo Agropecuario',55,426,8,4,9,3,1),(55,'Relaciones Internacionales',46,368,8,4,9,3,1),(56,'Sociología',37,306,8,4,9,3,1),(57,'Administración',48,404,9,4.5,10,3,1),(58,'Bioquímica Diagnóstica',47,370,8,4,10,2,1),(59,'Contaduría',53,416,9,4.5,10,3,1),(60,'Diseño y Comunicación Visual',64,430,9,4.5,10,4,1),(61,'Farmacia',46,372,8,4,10,2,1),(62,'Informática',52,431,9,4.5,10,3,1),(63,'Ingeniería Agrícola',62,449,10,5,10,2,1),(64,'Ingeniería en Alimentos',50,400,9,4.5,10,2,1),(65,'Ingeniería en Telecomunicaciones, Sistemas y Electrónica',48,412,9,4.5,10,1,1),(66,'Ingeniería Industrial',50,406,9,4.5,10,1,1),(67,'Ingeniería Mecánica Eléctrica',53,416,9,4.5,10,1,1),(68,'Ingeniería Química',61,405,9,4.5,10,1,1),(69,'Medicina Veterinaria y Zootecnia',64,417,10,5,10,2,1),(70,'Química',49,404,9,4.5,10,2,1),(71,'Química Industrial',56,371,8,4,10,2,1),(72,'Tecnología',30,408,8,4,10,1,1),(73,'Biología',41,448,8,4,11,2,1),(74,'Cirujano Dentista',52,495,8,4,11,2,1),(75,'Enfermería',25,425,8,4,11,2,1),(76,'Medicina',40,442,10,5,11,2,1),(77,'Optometría',51,438,8,4,11,2,1),(78,'Psicología',45,313,8,4,11,2,1),(79,'Biología',49,385,8,4,12,2,1),(80,'Cirujano Dentista',27,438,8,4,12,2,1),(81,'Desarrollo Comunitario para el Envejecimiento',45,358,8,4,12,3,1),(82,'Enfermería',15,377,8,4,12,2,1),(83,'Ingeniería Química',37,430,9,4.5,12,1,1),(84,'Medicina',28,449,10,5,12,2,1),(85,'Psicología',20,340,8,4,12,2,1),(86,'Química Farmacéutico Biológica',32,441,9,4.5,12,2,1),(87,'Bibliotecología y Estudios de la Información',51,360,8,4,13,4,1),(88,'Desarrollo y Gestión Interculturales',40,304,6,3,13,4,1),(89,'Estudios Latinoamericanos',54,308,8,4,13,4,1),(90,'Filosofía',48,300,8,4,13,4,1),(91,'Geografía',56,315,8,4,13,3,1),(92,'Historia',52,304,8,4,13,4,1),(93,'Lengua y Literaturas Hispánicas',62,308,8,4,13,4,1),(94,'Lengua y Literaturas Modernas (Letras Alemanas, Francesas, Inglesas, Italianas o Portuguesas)',48,344,8,4,13,4,1),(95,'Letras Clásicas',53,364,9,4.5,13,4,1),(96,'Literatura Dramática y Teatro',54,320,8,4,13,4,1),(97,'Pedagogía',48,330,8,4,13,4,1),(98,'Ingeniería Civil',48,398,9,4.5,14,1,1),(99,'Ingeniería de Minas y Metalurgia',54,429,10,5,14,1,1),(100,'Ingeniería Eléctrica Electrónica',48,400,9,4.5,14,1,1),(101,'Ingeniería en Computación',50,408,9,4.5,14,1,1),(102,'Ingeniería en Sistemas Biomédicos',53,430,10,5,14,1,1),(103,'Ingeniería en Telecomunicaciones',51,410,9,4.5,14,1,1),(104,'Ingeniería Geofísica',53,432,10,5,14,1,1),(105,'Ingeniería Geológica',54,431,10,5,14,1,1),(106,'Ingeniería Geomática',42,353,8,4,14,1,1),(107,'Ingeniería Industrial',50,412,9,4.5,14,1,1),(108,'Ingeniería Mecatrónica',51,421,10,5,14,1,1),(109,'Ingeniería Mecánica',48,406,9,4.5,14,1,1),(110,'Ingeniería Petrolera',56,450,10,5,14,1,1),(111,'Etnomusicología',52,356,8,4,15,4,1),(112,'Música - Canto',71,438,8,4,15,4,1),(113,'Música - Composición',51,387,8,4,15,4,1),(114,'Música - Educación Musical',62,366,8,4,15,4,1),(115,'Música - Instrumentista',55,416,8,4,15,4,1),(116,'Música - Piano',50,344,8,4,15,4,1),(117,'Ciencia Forense',59,365,9,4.5,16,2,1),(118,'Fisioterapia',62,376,9,4.5,16,2,1),(119,'Investigación Biomédica Básica',27,339,8,4,16,2,1),(120,'Medicina',57,431,10,5,16,2,1),(121,'Medicina Veterinaria y Zootecnia',50,450,10,5,17,2,1),(122,'Cirujano Dentista',43,441,10,5,18,2,1),(123,'Psicología',30,360,8,4,19,2,1),(124,'Ingeniería Química',45,405,9,4.5,20,1,1),(125,'Ingeniería Química Metalúrgica',46,426,9,4.5,20,1,1),(126,'Química',51,345,9,4.5,20,2,1),(127,'Química de Alimentos',42,397,9,4.5,20,2,1),(128,'Química Farmacéutico Biológica',49,417,9,4.5,20,2,1),(129,'Enfermería',44,391,8,4,21,2,1),(130,'Enfermería y Obstetricia',31,403,8,4,21,2,1),(131,'Administración Agropecuaria',53,368,8,4,22,3,1),(132,'Ciencias Agrogenómicas',40,360,8,4,22,2,1),(133,'Desarrollo Territorial',54,368,8,4,22,3,1),(134,'Desarrollo y Gestión Interculturales',38,304,6,3,22,4,1),(135,'Economía Industrial',54,432,8,4,22,3,1),(136,'Fisioterapia',61,376,8,4,22,2,1),(137,'Odontología',58,371,8,4,22,2,1),(138,'Administración de Archivos y Gestión Documental',67,392,8,4,23,4,1),(139,'Arte y Diseño',79,346,8,4,23,4,1),(140,'Ciencia de Materiales Sustentables',52,386,8,4,23,1,1),(141,'Ciencias Ambientales',55,394,8,4,23,2,1),(142,'Ecología',65,429,8,4,23,2,1),(143,'Estudios Sociales y Gestión Local',57,369,8,4,23,3,1),(144,'Geociencias',54,396,8,4,23,1,1),(145,'Geohistoria',60,408,8,4,23,4,1),(146,'Historia del Arte',54,315,8,4,23,4,1),(147,'Literatura Intercultural',72,412,8,4,23,4,1),(148,'Tecnologías para la Información en Ciencias',52,373,8,4,23,1,1),(149,'Trabajo Social',48,366,9,4.5,24,3,1),(150,'Ciencias Genómicas',48,384,8,4,25,2,1),(151,'Tecnología',27,408,8,4,26,1,1),(152,'Nanotecnología',46,308,8,4,27,1,1),(153,'Desarrollo y Gestión Interculturales',36,304,6,3,28,4,1),(154,'Cinematografía',46,356,8,4,29,4,1),(155,'Teatro y Actuación',55,356,8,4,30,4,1),(156,'Ingeniería en Energías Renovables',42,356,8,4,31,1,1),(157,'Manejo Sustentable de Zonas Costeras',36,400,8,4,32,2,1);
/*!40000 ALTER TABLE `Carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Escuelas`
--

DROP TABLE IF EXISTS `Escuelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Escuelas` (
  `id_escuela` int(11) NOT NULL,
  `nombre_escuela` varchar(60) DEFAULT NULL,
  `Universidades_id_universidad` int(11) NOT NULL,
  PRIMARY KEY (`id_escuela`),
  KEY `fk_Escuelas_Universidades_idx` (`Universidades_id_universidad`),
  CONSTRAINT `fk_Escuelas_Universidades` FOREIGN KEY (`Universidades_id_universidad`) REFERENCES `Universidades` (`id_universidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escuelas`
--

LOCK TABLES `Escuelas` WRITE;
/*!40000 ALTER TABLE `Escuelas` DISABLE KEYS */;
INSERT INTO `Escuelas` VALUES (1,'Facultad de Arquitectura',1),(2,'Facultad de Artes y Diseño',1),(3,'Facultad de Ciencias',1),(4,'Facultad de Ciencias Politicas y Sociales',1),(5,'Facultad de Contaduría y Administración',1),(6,'Facultad de Derecho',1),(7,'Facultad de Economía',1),(8,'Facultad de Estudios Superiores Acatlán',1),(9,'Facultad de Estudios Superiores Aragón',1),(10,'Facultad de Estudios Superiores Cuautitlán',1),(11,'Facultad de Estudios Superiores Iztacala',1),(12,'Facultad de Estudios Superiores Zaragoza',1),(13,'Facultad de Filosofía y Letras',1),(14,'Facultad de Ingeniería',1),(15,'Facultad de Música',1),(16,'Facultad de Medicina',1),(17,'Facultad de Medicina Veterinaria y Zootecnia',1),(18,'Facultad de Odontología',1),(19,'Facultad de Psicología',1),(20,'Facultad de Química',1),(21,'Escuela Nacional de Enfermería y Obstetricia',1),(22,'Escuela Nacional de Estudios Superiores Unidad León',1),(23,'Escuela Nacional de Estudios Superiores, Unidad Morelia',1),(24,'Escuela Nacional de Trabajo Social',1),(25,'Centro de Ciencias Genómicas',1),(26,'Centro de Física Aplicada y Tecnología Avanzada',1),(27,'Centro de Nanociencias y Nanotecnología',1),(28,'Centro Peninsular en Humanidades y en Ciencias Sociales',1),(29,'Centro Universitario de Estudios Cinematográficos',1),(30,'Centro Universitario de Teatro',1),(31,'Instituto de Energías Renovables',1),(32,'Unidad Multidisciplinaria de Docencia e Investigación',1);
/*!40000 ALTER TABLE `Escuelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Periodos`
--

DROP TABLE IF EXISTS `Periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Periodos` (
  `id_area` int(11) NOT NULL,
  `nombre_periodo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Periodos`
--

LOCK TABLES `Periodos` WRITE;
/*!40000 ALTER TABLE `Periodos` DISABLE KEYS */;
INSERT INTO `Periodos` VALUES (1,'Semestre'),(2,'Cuatrimestre'),(3,'Trimestre');
/*!40000 ALTER TABLE `Periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Universidades`
--

DROP TABLE IF EXISTS `Universidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Universidades` (
  `id_universidad` int(11) NOT NULL,
  `acronimo_universidad` varchar(45) DEFAULT NULL,
  `nombre_universidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_universidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Universidades`
--

LOCK TABLES `Universidades` WRITE;
/*!40000 ALTER TABLE `Universidades` DISABLE KEYS */;
INSERT INTO `Universidades` VALUES (1,'UNAM','Universidad Nacional Autónoma de México'),(2,'UAM','Universidad Autónoma Metropolitana'),(3,'IPN','Instituto Pólitecnico Nacional'),(4,'UAEM','Universidad Autónoma del Estado de Mexico'),(5,'UACM','Universidad Autónoma de la Ciudad de México');
/*!40000 ALTER TABLE `Universidades` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05  0:50:32
CREATE DATABASE  IF NOT EXISTS `ofertaUAEM` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ofertaUAEM`;
-- MySQL dump 10.13  Distrib 5.7.9, for linux-glibc2.5 (x86_64)
--
-- Host: 127.0.0.1    Database: ofertaUAEM
-- ------------------------------------------------------
-- Server version	5.6.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_concentracion_has_carreras`
--

DROP TABLE IF EXISTS `area_concentracion_has_carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_concentracion_has_carreras` (
  `Area_Concentracion_id_Area` int(11) NOT NULL,
  `Carreras_id_Carrera` int(11) NOT NULL,
  PRIMARY KEY (`Area_Concentracion_id_Area`,`Carreras_id_Carrera`),
  KEY `fk_Area_Concentracion_has_Carreras_Carreras1_idx` (`Carreras_id_Carrera`),
  KEY `fk_Area_Concentracion_has_Carreras_Area_Concentracion1_idx` (`Area_Concentracion_id_Area`),
  CONSTRAINT `fk_Area_Concentracion_has_Carreras_Area_Concentracion1` FOREIGN KEY (`Area_Concentracion_id_Area`) REFERENCES `areaconcentracion` (`id_Area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Area_Concentracion_has_Carreras_Carreras1` FOREIGN KEY (`Carreras_id_Carrera`) REFERENCES `carreras` (`idCarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_concentracion_has_carreras`
--

LOCK TABLES `area_concentracion_has_carreras` WRITE;
/*!40000 ALTER TABLE `area_concentracion_has_carreras` DISABLE KEYS */;
INSERT INTO `area_concentracion_has_carreras` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(6,10),(6,11),(6,12),(6,13),(2,14),(6,15),(1,16),(5,17),(3,18);
/*!40000 ALTER TABLE `area_concentracion_has_carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areaconcentracion`
--

DROP TABLE IF EXISTS `areaconcentracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areaconcentracion` (
  `id_Area` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Area`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areaconcentracion`
--

LOCK TABLES `areaconcentracion` WRITE;
/*!40000 ALTER TABLE `areaconcentracion` DISABLE KEYS */;
INSERT INTO `areaconcentracion` VALUES (1,'Ingeniería y Tecnología'),(2,'Artes, Educación y Humanidades'),(3,'Ciencias Sociales y Administrativas'),(4,'Arquitectura, Diseño y Urbanismo'),(5,'Ciencias Agropecuarias'),(6,'Ciencias Naturales y Exactas');
/*!40000 ALTER TABLE `areaconcentracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carreras` (
  `idCarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCarrera` varchar(50) DEFAULT NULL,
  `numCreditos` int(11) DEFAULT NULL,
  `tipoPeriodo` varchar(45) DEFAULT NULL,
  `duracion` float DEFAULT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Ingeniería Civil',450,'semestre',10),(2,'Ingeniería En Electrónica',438,'semestre',10),(3,'Ingeniería Mecánica',448,'semestre',10),(4,'Ingeniería En Sistemas Energéticos Sustentables',432,'semestre',10),(5,'Ingeniería En Sistemas Inteligentes',439,'semestre',10),(6,'Ingeniería En Sistemas y Comunicaciones',414,'semestre',10),(7,'Ingeniería Industrial',414,'semestre',10),(8,'Ingeniería En Software',374,'semestre',10),(9,'Ingeniería Manufactura y Construcción',406,'semestre',10),(10,'Licenciatura en Biotecnología',435,'semestre',10),(11,'Licenciatura En Biología',453,'semestre',9),(12,'Licenciatura En Física',453,'semestre',9),(13,'Química',382,'semestre',9),(14,'Licenciatura En Música',415,'semestre',9),(15,'Licenciatura En Bioingeniería Médica',444,'semestre',9),(16,'Ingeniería Química',400,'semestre',9),(17,'Técnico Superior Universitario en Arboricultultura',193,'semestre',8),(18,'Licenciatura en Gastronomía',448,'semestre',9);
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05  0:50:32
CREATE DATABASE  IF NOT EXISTS `ofertaUAM` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ofertaUAM`;
-- MySQL dump 10.13  Distrib 5.7.9, for linux-glibc2.5 (x86_64)
--
-- Host: 127.0.0.1    Database: ofertaUAM
-- ------------------------------------------------------
-- Server version	5.6.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_concentracion`
--

DROP TABLE IF EXISTS `area_concentracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_concentracion` (
  `id_Area` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Area`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_concentracion`
--

LOCK TABLES `area_concentracion` WRITE;
/*!40000 ALTER TABLE `area_concentracion` DISABLE KEYS */;
INSERT INTO `area_concentracion` VALUES (1,'Restauración Ambiental'),(2,'Gestión Ambiental'),(3,'Ingeniería Sustentable'),(4,'Ingeniería en Construcción'),(5,'Ingeniería en Estructuras'),(6,'Ingeniería en Geotecnia '),(7,'Ingeniería en Hidráulica'),(8,'Sistemas de Información'),(9,'Algoritmos e Inteligencia Artificial '),(10,'Seguridad y redes de Computadoras'),(11,'Sistemas Embebidos '),(12,'Sistemas Científicos'),(13,'Sistemas Multimedia '),(14,'Enfoque de Programación'),(15,'Enfoque de negocios '),(16,'Maquinas Eléctricas'),(17,'Sistemas Eléctricos de Potencia '),(18,'Energías Alternativas'),(19,'Redes de Computadoras'),(20,'Instrumentación y Control'),(21,'Telecomunicacaciones'),(22,'Mecatrónica'),(23,'Energia'),(24,'Instrumentación y Equipo'),(25,'Tecnología de Materiales'),(26,'Producción y Manufactura'),(27,'Gestión Industrial '),(28,'Producción'),(29,'Procesos Metalúrgicos '),(30,'Materiales y Procesos'),(31,'Diseño y Equipos '),(32,'Biotecnología '),(33,'Materiales '),(34,'Evolucion'),(35,'Ciencia Nanomateriales'),(36,'FarmacoQuímica'),(37,'FisicoQuímica'),(38,'Análisis Químicos'),(39,'Didactica de la Química'),(40,'Orientación Compu'),(41,'Estadistica y Finanzas'),(42,'Sistemas No Lineales'),(43,'Fisica-Matematica'),(44,'Economía y Finanzas'),(45,'Estadistica'),(46,'Gestión y Asuntos Públicos'),(47,'Promoción Industrial'),(48,'Sistemas Financieros'),(49,'Instituciones y Desarrollo'),(50,'Conocimiento y Competitividad'),(51,'Acción Pública y Gestión'),(52,'Marketing'),(53,'Finanzas'),(54,'Formación Profesional Decisores'),(55,'Dirección Estratégica'),(56,'Administración de Personal'),(57,'Políticas Públicas'),(58,'Enfoques Contemporaneos'),(59,'Bloque Aproximación Explicativa'),(60,'Comunicación Organizaciones'),(61,'Comunicación Educativa'),(62,'Comunicación de las Ciencias'),(63,'Comunicación Política'),(64,'Régimen de Derecho'),(65,'Ciencias Penales'),(66,'Derecho del Trabajo'),(67,'Economia Politica'),(68,'Economía Aplicada'),(69,'Crecimiento y Desarrollo'),(70,'Economía del Desarrollo'),(71,'Economía Internacional'),(72,'Economía Financiera'),(73,'Economía Industrial'),(74,'Territotio y Economía'),(75,'Instituciones y Gobernabilidad'),(76,'Cultura e Identidad'),(77,'Ambiente y Territorio'),(78,'Epistemología'),(79,'Filosofía'),(80,'Sistemas Filosóficos');
/*!40000 ALTER TABLE `area_concentracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_concentracion_has_carreras`
--

DROP TABLE IF EXISTS `area_concentracion_has_carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_concentracion_has_carreras` (
  `id_Area` int(11) NOT NULL,
  `id_Carrera` int(11) NOT NULL,
  PRIMARY KEY (`id_Area`,`id_Carrera`),
  KEY `fk_Area_Concentracion_has_Carreras_Carreras1_idx` (`id_Carrera`),
  KEY `fk_Area_Concentracion_has_Carreras_Area_Concentracion1_idx` (`id_Area`),
  CONSTRAINT `fk_Area_Concentracion_has_Carreras_Area_Concentracion1` FOREIGN KEY (`id_Area`) REFERENCES `area_concentracion` (`id_Area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Area_Concentracion_has_Carreras_Carreras1` FOREIGN KEY (`id_Carrera`) REFERENCES `carreras` (`id_Carrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_concentracion_has_carreras`
--

LOCK TABLES `area_concentracion_has_carreras` WRITE;
/*!40000 ALTER TABLE `area_concentracion_has_carreras` DISABLE KEYS */;
INSERT INTO `area_concentracion_has_carreras` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,2),(7,2),(8,3),(9,3),(10,3),(11,3),(8,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,8),(17,8),(18,8),(11,9),(19,9),(20,9),(21,9),(22,9),(23,9),(23,12),(24,12),(25,12),(24,14),(25,14),(26,14),(27,14),(22,15),(23,15),(28,15),(29,16),(30,16),(31,17),(32,17),(33,17),(34,17),(35,25),(36,25),(37,25),(38,25),(39,25),(40,35),(41,35),(42,35),(43,35),(40,36),(44,36),(45,36),(46,39),(47,39),(48,39),(49,40),(50,40),(51,40),(52,41),(53,41),(54,41),(55,41),(56,41),(57,41),(58,44),(59,44),(60,53),(61,53),(62,53),(63,53),(64,57),(65,57),(66,57),(67,64),(68,64),(69,64),(67,65),(70,65),(71,65),(72,65),(73,65),(74,69),(75,69),(76,69),(77,69),(78,70),(79,70),(80,70);
/*!40000 ALTER TABLE `area_concentracion_has_carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carreras` (
  `id_Carrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(45) DEFAULT NULL,
  `no_creditos` int(11) DEFAULT NULL,
  `tipo_periodo` varchar(45) DEFAULT NULL,
  `duracion_promedio` float DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'Ingeniería Ambiental',480,'trimestre',12,'Azcapotzalco'),(2,'Ingeniería Civil ',478,'trimestre',12,'Azcapotzalco'),(3,'Ingeniería en Computación',475,'trimestre',12,'Azcapotzalco'),(4,'Ingeniería en Computación',461,'trimestre',12,'Cuajimalpa'),(5,'Ingeniería Biológica ',500,'Trimestral',12,'Cuajimalpa'),(6,'Ingeniería Biomédica',518,'Trimestral',12,'Iztapalapa'),(7,'Ingeniería Bioquímica Industrial',498,'Trimestral',12,'Iztapalapa'),(8,'Ingeniería Eléctrica',478,'Trimestral',12,'Azcapotzalco'),(9,'Ingeniería Electrónica',474,'Trimestral',12,'Azcapotzalco'),(10,'Ingeniería Electrónica',500,'Trimestral',12,'Iztapalapa'),(11,'Ingeniería en Energía',508,'Trimestral',12,'Iztapalapa'),(12,'Ingeniería Física',472,'Trimestral',12,'Azcapotzalco'),(13,'Ingeniería Hidrológica',493,'Trimestral',12,'Iztapalapa'),(14,'Ingeniería Industrial',480,'Trimestral',12,'Azcapotzalco'),(15,'Ingeniería Mecánica',472,'Trimestral',12,'Azcapotzalco'),(16,'Ingeniería Metalúrgica',480,'Trimestral',12,'Azcapotzalco'),(17,'Ingeniería Química',480,'Trimestral',12,'Azcapotzalco'),(18,'Ingeniería Química',486,'Trimestral',12,'Iztapalapa'),(19,'Ingeniería en Recursos Hídricos',450,'Trimestral',12,'Lerma'),(20,'Tecnologías y Sistemas de Información',459,'Trimestral',12,'Cuajimalpa'),(21,'Sociología',424,'Trimestral',12,'Xochimilco'),(22,'Sociología',458,'Trimestral',12,'Iztapalapa'),(23,'Sociología',444,'Trimestral',12,'Azcapotzalco'),(24,'Química Farmacéutica Biológica',567,'Trimestral',12,'Xochimilco'),(25,'Química',467,'Trimestral',12,'Iztapalapa'),(26,'Psicologia Social',482,'Trimestral',12,'Iztapalapa'),(27,'Psicologia',424,'Trimestral',12,'Xochimilco'),(28,'Producción Animal',491,'Trimestral',12,'Iztapalapa'),(29,'Politicas Públicas',462,'Trimestral',12,'Lerma'),(30,'Politica y Gestión Social',440,'Trimestral',12,'Xochimilco'),(31,'Planeación Territorial',591,'Trimestral',12,'Xochimilco'),(32,'Nutrición Humana',473,'Trimestral',12,'Xochimilco'),(33,'Medicina Veterinaria',472,'Trimestral',12,'Xochimilco'),(34,'Medicina',503,'Trimestral',12,'Xochimilco'),(35,'Matemáticas Aplicadas',433,'Trimestral',12,'Cuajimalpa'),(36,'Matemáticas',483,'Trimestral',12,'Iztapalapa'),(37,'Linguistica',418,'Trimestral',12,'Iztapalapa'),(38,'Letras Hispanas',438,'Trimestral',12,'Iztapalapa'),(39,'Administración',546,'Trimestral',12,'Azcapotzalco'),(40,'Administración',441,'Trimestral',12,'Cuajimalpa'),(41,'Administración',452,'Trimestral',12,'Iztapalapa'),(42,'Administración',424,'Trimestral',12,'Xochimilco'),(43,'Agronomia',511,'Trimestral',12,'Xochimilco'),(44,'Antropologia Social',414,'Trimestral',12,'Iztapalapa'),(45,'Arquitectura',532,'Trimestral',12,'Azcapotzalco'),(46,'Arquitectura',543,'Trimestral',12,'Xochimilco'),(47,'Arte y Comunicaciones',427,'Trimestral',12,'Lerma'),(48,'Biología',509,'Trimestral',12,'Iztapalapa'),(49,'Biología',535,'Trimestral',12,'Xochimilco'),(50,'Biología Ambiental',476,'Trimestral',12,'Lerma'),(51,'Biología Experimental',476,'Trimestral',12,'Iztapalapa'),(52,'Biología Molecular',476,'Trimestral',12,'Cuajimalpa'),(53,'Ciencias Comunicación',429,'Trimestral',12,'Cuejimalpa'),(54,'Ciencias Políticas',456,'Trimestral',12,'Iztapalapa'),(55,'Computación',477,'Trimestral',12,'Iztapalapa'),(56,'Comunicación Social',424,'Trimestral',12,'Cuajimalpa'),(57,'Derecho',464,'Trimestral',12,'Azcapotzalco'),(58,'Derecho',499,'Trimestral',12,'Cuajimalpa'),(59,'Diseño',411,'Trimestral',12,'Cuajimalpa'),(60,'Diseño Gráfico',535,'Trimestral',12,'Azcapotzalco'),(61,'Diseño Gráfico',508,'Trimestral',12,'Xochimilco'),(62,'Diseño Industrial',544,'Trimestral',12,'Azcapotzalco'),(63,'Diseño Industrial',585,'Trimestral',12,'Xochimilco'),(64,'Economia',510,'Trimestral',12,'Azcapotzalco'),(65,'Economia',451,'Trimestral',12,'Iztapalapa'),(66,'Economia',424,'Trimestral',12,'Xochimilco'),(67,'Enfermeria',534,'Trimestral',12,'Xochimilco'),(68,'Estomatología',508,'Trimestral',12,'Xochimilco'),(69,'Estudios Socioterritoriales',456,'Trimestral',12,'Cuajimalpa'),(70,'Filosofia',416,'Trimestral',12,'Iztapalapa'),(71,'Física',508,'Trimestral',12,'Iztapalapa'),(72,'Geografia Humana',508,'Trimestral',12,'Iztapalapa'),(73,'Historia',458,'Trimestral',12,'Iztapalapa'),(74,'Hidrobiología',491,'Trimestral',12,'Iztapalapa'),(75,'Humanidades',434,'Trimestral',12,'Cuajimalpa');
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05  0:50:32
CREATE DATABASE  IF NOT EXISTS `ofertaIPN` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ofertaIPN`;
-- MySQL dump 10.13  Distrib 5.7.9, for linux-glibc2.5 (x86_64)
--
-- Host: 127.0.0.1    Database: ofertaIPN
-- ------------------------------------------------------
-- Server version	5.6.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_concentracion`
--

DROP TABLE IF EXISTS `area_concentracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_concentracion` (
  `idarea_concentracion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idarea_concentracion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_concentracion`
--

LOCK TABLES `area_concentracion` WRITE;
/*!40000 ALTER TABLE `area_concentracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_concentracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `duracion` int(11) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `tipo_periodo` varchar(12) NOT NULL DEFAULT 'Semestre',
  `escuela` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Biólogo',9,NULL,'Semestre','encb'),(2,'Ingeniero Bioquímico',9,NULL,'Semestre','encb'),(3,'Ingeniero en Sistemas Ambientales',9,NULL,'Semestre','encb'),(4,'Químico Bacteriólogo Parasitólogo',9,NULL,'Semestre','encb'),(5,'Químico Farmacéutico Industrial',9,NULL,'Semestre','encb'),(6,'Licenciatura en Médico Cirujano y Homeópata',10,NULL,'Semestre','enmh'),(7,'Licenciatura en Médico Cirujano y Partero',10,NULL,'Semestre','enmh'),(8,'PECCLE',10,NULL,'Semestre','eseo'),(9,'Licenciatura en Enfermería y Obstetricia',10,NULL,'Semestre','eseo'),(10,'Licenciatura en Enfermería',10,NULL,'Semestre','eseo'),(11,'Educación Continua',10,NULL,'Semestre','eseo'),(12,'Carrera Médico Cirujano y Partero',11,NULL,'Semestre','esm'),(13,'Licenciatura en Odontología',9,NULL,'Semestre','cics-sto'),(14,'Licenciatura en Optometría',9,NULL,'Semestre','cics-sto'),(15,'Licenciatura en Psicología',9,NULL,'Semestre','cics-sto'),(16,'Contador Público',8,NULL,'Semestre','escasto'),(17,'Lic. Relaciones Comerciales',8,NULL,'Semestre','escasto'),(18,'Lic. Negocios Internacionales',8,NULL,'Semestre','escasto'),(19,'Lic. Comercio Internacional',8,NULL,'Semestre','escasto'),(20,'Licenciatura en Economía',8,NULL,'Semestre','ese'),(21,'Licenciatura en Turismo',8,NULL,'Semestre','est'),(22,'Ingeniería Mecánica',9,NULL,'Semestre','esime'),(23,'Ingenieria en Robótica Industrial',9,NULL,'Semestre','esime'),(24,'Ingeniería en Sistemas Automotrices',9,NULL,'Semestre','esime'),(25,'Ingeniería En Comunicaciones y Electrónica',9,NULL,'Semestre','esime'),(26,'Ingeniería en Computación',9,NULL,'Semestre','esime'),(27,'Ingeniería en Control y Automatización',9,NULL,'Semestre','esime'),(28,'Ingeniería en Metalurgia y Materiales',9,NULL,'Semestre','esique'),(29,'Ingeniería Química Industrial',9,NULL,'Semestre','esique'),(30,'Ingeniería Química Petrolera',9,NULL,'Semestre','esique'),(31,'Ingeniería en Matemática',9,NULL,'Semestre','esfim'),(32,'Licenciatura en Física y Matemáticas',9,NULL,'Semestre','esfim');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera_area_concentracion`
--

DROP TABLE IF EXISTS `carrera_area_concentracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera_area_concentracion` (
  `idcarrera` int(11) NOT NULL,
  `idarea_concentracion` int(11) NOT NULL,
  PRIMARY KEY (`idcarrera`,`idarea_concentracion`),
  KEY `fk_carrera_has_area_concentracion_area_concentracion1_idx` (`idarea_concentracion`),
  KEY `fk_carrera_has_area_concentracion_carrera_idx` (`idcarrera`),
  CONSTRAINT `fk_carrera_has_area_concentracion_area_concentracion1` FOREIGN KEY (`idarea_concentracion`) REFERENCES `area_concentracion` (`idarea_concentracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrera_has_area_concentracion_carrera` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera_area_concentracion`
--

LOCK TABLES `carrera_area_concentracion` WRITE;
/*!40000 ALTER TABLE `carrera_area_concentracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera_area_concentracion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05  0:50:33
