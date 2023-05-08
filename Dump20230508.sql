CREATE DATABASE  IF NOT EXISTS `book_store` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `book_store`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: book_store
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'William',NULL,'Gibson'),(2,'Philip ','K.','Dick '),(3,'Eric',NULL,'Matthes'),(4,'Al',NULL,'Sweigart'),(5,'Brian',NULL,'Ward'),(6,'Martin',NULL,'Kleppmann'),(7,'David',NULL,'Thomas'),(8,'James','F.','Kurose'),(9,'Andrew','S.','Tanenbaum'),(10,'Frank',NULL,'Herbert');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_authors`
--

DROP TABLE IF EXISTS `book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_authors` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `fk_author` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_authors`
--

LOCK TABLES `book_authors` WRITE;
/*!40000 ALTER TABLE `book_authors` DISABLE KEYS */;
INSERT INTO `book_authors` VALUES (1,1),(2,1),(3,2),(4,3),(5,4),(6,5),(7,6),(8,7),(9,8),(10,9),(11,10);
/*!40000 ALTER TABLE `book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_genres`
--

DROP TABLE IF EXISTS `book_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_genres` (
  `book_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`genre_id`),
  KEY `fk_genre` (`genre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_genres`
--

LOCK TABLES `book_genres` WRITE;
/*!40000 ALTER TABLE `book_genres` DISABLE KEYS */;
INSERT INTO `book_genres` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,3),(7,4),(8,4),(9,5),(10,6),(11,1);
/*!40000 ALTER TABLE `book_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `fk_publisher` (`publisher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Neuromancer','8576573008','1984-07-01',1),(2,'Monalise Overdrive','8576573024','1988-07-05',1),(3,'Blade Runner','8576574403','1968-05-20',1),(4,'Python Crash Course','9781718502703','2022-12-22',2),(5,'Automate the Boring Stuff with Python','9781593279929','2019-11-10',2),(6,'How Linux Works','9781718500402','2021-04-25',2),(7,'Designing Data-Intensive Application','9781491903100','2017-04-12',3),(8,'The Pragmatic Programmer','9780135956977','2019-09-10',3),(9,'Redes de Computadores e a Internet','8581436773','2013-08-12',4),(10,'Sistemas Operacionais Modernos','8543005671','2015-12-07',4),(11,'Duna: livro 1 ','857657313','2065-08-19',4);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre` varchar(255) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `fk_parent` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Ficção Científica',NULL),(2,'Python',NULL),(3,'Linux & BSD',NULL),(4,'Programação',NULL),(5,'Redes de computadores',NULL),(6,'Ciência da Computação',NULL);
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Aleph'),(2,'No Starch'),(3,'Oreilley'),(4,'Pearson');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08  5:22:28
