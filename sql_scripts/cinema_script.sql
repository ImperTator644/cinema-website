-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.30

USE cinema;

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
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `id_cinema` int unsigned NOT NULL AUTO_INCREMENT,
  `id_location` int unsigned NOT NULL,
  PRIMARY KEY (`id_cinema`),
  KEY `id_location_idx` (`id_location`),
  CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `client_ibfk_1_idx` (`email`),
  CONSTRAINT `client_ibkf_1` FOREIGN KEY (`email`) REFERENCES `personal_data` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (7,'konrad.kczynski@student.pk.edu.pl'),(6,'lukasz.blicharz@student.pk.edu.pl');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_employee` int unsigned NOT NULL AUTO_INCREMENT,
  `id_manager` int unsigned DEFAULT NULL,
  `id_cinema` int unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `position` varchar(15) NOT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `id_manager_idx` (`id_manager`),
  KEY `id_cinema_idx` (`id_cinema`),
  KEY `employee_ibfk_3_idx` (`email`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`id_manager`) REFERENCES `employee` (`id_employee`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id_cinema`),
  CONSTRAINT `employee_ibkfk_3` FOREIGN KEY (`email`) REFERENCES `personal_data` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,2,5,'konrad.kczynski@pracownik.pl','PRACOWNIK'),(2,NULL,3,'zdzisiek1234@pracownik.pl','MANAGER');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iShow`
--

DROP TABLE IF EXISTS `iShow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iShow` (
  `id_ishow` int unsigned NOT NULL AUTO_INCREMENT,
  `id_show` int unsigned NOT NULL,
  `room_number` int DEFAULT NULL,
  `id_cinema` int unsigned NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_ishow`),
  KEY `room_number_cinema_idx` (`room_number`,`id_cinema`),
  KEY `id_show_idx` (`id_show`),
  CONSTRAINT `ishow_ibfk_1` FOREIGN KEY (`id_show`) REFERENCES `movie_show` (`id_show`),
  CONSTRAINT `ishow_ibfk_2` FOREIGN KEY (`room_number`, `id_cinema`) REFERENCES `room` (`room_number`, `id_cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iShow`
--

LOCK TABLES `iShow` WRITE;
/*!40000 ALTER TABLE `iShow` DISABLE KEYS */;
INSERT INTO `iShow` VALUES (1,2,1,2,'2022-12-10','12:05:03',1.50),(2,2,1,2,'2022-12-10','12:10:05',20.70),(3,2,3,2,'2022-12-10','13:01:10',11.20);
/*!40000 ALTER TABLE `iShow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id_location` int unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(15) NOT NULL,
  `street` varchar(15) NOT NULL,
  `number` varchar(5) NOT NULL,
  `zip_code` varchar(7) NOT NULL,
  PRIMARY KEY (`id_location`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Cracow','Celarowska','20','31-414'),(2,'Sunnyvale','Trailer park','420','69-420'),(3,'Caribbean','Pirates','6','01-011'),(4,'Rabka Zdroj','Bigos','9','93-234'),(5,'Raciborz','Ulanych','22','10-250'),(6,'Belgia','Wroclawska','250','300-400');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id_movie` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `movie_description` text,
  `movie_category` enum('AKCJA','DOKUMENT','PRZYGODA','HORROR','KOMEDIA','KRYMINAŁ','DRAMAT','SCIENCE-FICTION') DEFAULT NULL,
  `age_category` int NOT NULL,
  `length` int NOT NULL,
  PRIMARY KEY (`id_movie`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'DZIKA NOC','Kiedy pewna, bogata rodzina zostaje zakładnikami w Wigilię, przestępcy nie są przygotowani na niespodziewanego bojownika. Święty Mikołaj (w tej roli David Harbour, serial Stranger Things) jest na miejscu i ma zamiar pokazać, dlaczego Mikołaj nie będzie taki święty.','DRAMAT',15,112),(2,'DEMON SLAYER: MUGEN TRAIN','Po ukończeniu treningu rehabilitacyjnego, Tanjiro i jego towarzysze udają się na kolejną misję. W Nieskończonym Pociągu doszło do serii tajemniczych zniknięć ponad czterdziestu pasażerów. Tanjiro i Nezuko, wraz z Zenitsu i Inosuke, dołączą do jednego z najpotężniejszych szermierzy wśród Korpusu Zabójców Demonów - Filara Płomienia, Kyojuro Rengoku. Razem stawią czoła nieznanemu zagrożeniu.','SCIENCE-FICTION',12,120),(3,'KOBIETA NA DACHU','Mirka to sześćdziesięcioletnia położna. Jest świetna w swoim fachu, a jeszcze lepsza w ukrywaniu swoich potrzeb i uczuć. W domu też skupia się na innych - mężu i dorosłym synu. Czasem wymyka się na dach swojego bloku, żeby zapalić papierosa. To jedyna rzecz, jaką robi tylko dla siebie, aż do dnia, w którym napada na bank uzbrojona w niewielki nóż kuchenny. Czy wydarzenie to pozwoli, by Mirka spojrzała na swoje życie z innej perspektywy?','DRAMAT',15,97),(4,'MENU','Młoda para wybiera się na odległą wyspę, do ekskluzywnej restauracji. Okazuje się jednak, że nie wszystko jest takie jakim się wydaje a w menu czekają zaskakujące niespodzianki.','KOMEDIA',15,107),(5,'CHŁOPCY Z FERAJNY','Kilkunastoletni Henry i Tommy DeVito trafiają pod opiekę potężnego gangstera. Obaj szybko uczą się panujących w mafii reguł.','KRYMINAŁ',16,146),(6,'NAZNACZONY','Po upadku z drabiny chłopiec traci przytomność. Będąc w śpiączce, wchodzi do świata umarłych.','HORROR',16,103),(7,'SZKLANA PUŁAPKA','Policjant rozprawia się z niebezpiecznymi terrorystami, którzy opanowali biurowiec. Stawką jest życie wielu osób.','AKCJA',18,131),(8,'JUMANJI','Dwunastoletni Alan wraz z koleżanką rozpoczyna zabawę w tajemniczą grę Jumanji, która wciąga go do dżungli. Po latach zostaje uwolniony przez dwójkę rodzeństwa, Judy i Petera.','PRZYGODA',7,104),(9,'SÓL ZIEMI','Sebastiao Salgado przez 40 lat podróżował po świecie dokumentując ludzkość w okresie dramatycznych zmian.','DOKUMENT',13,110),(10,'AVATAR','Jake, sparaliżowany były komandos, zostaje wysłany na planetę Pandora, gdzie zaprzyjaźnia się z lokalną społecznością i postanawia jej pomóc.','SCIENCE-FICTION',12,162),(11,'THE ROOM','Życie poczciwego bankiera zostaje wywrócone do góry nogami w momencie, gdy jego narzeczona zaczyna się spotykać z ich najlepszym przyjacielem.','KOMEDIA',21,99),(12,'JOHNNY','Patryk włamuje się do domku w małym mieście. Wyrok sądu nakazuje mu prace społeczne w puckim hospicjum, gdzie poznaje niezwykłego ks. Jana Kaczkowskiego. Duchowny angażuje młodych chłopaków z zawodówki, na pozór twardych buntowników, w pomoc śmiertelnie chorym. W swojej pracy skupia się na bliskości, czułości i walce o relacje z drugim człowiekiem. Uczy empatii. A czyni to z hurtową ilością humoru, czym zyskuje ogromną popularność. Niedługo później Jan sam staje się pacjentem swojego hospicjum. Patryk zostaje postawiony w sytuacji, która zmieni całe jego życie.','DOKUMENT',15,119);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_show`
--

DROP TABLE IF EXISTS `movie_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_show` (
  `id_show` int unsigned NOT NULL AUTO_INCREMENT,
  `id_movie` int unsigned NOT NULL,
  `soundtrack` enum('NAPISY','DUBBING','LEKTOR_PL') NOT NULL,
  PRIMARY KEY (`id_show`),
  KEY `id_movie_idx` (`id_movie`),
  CONSTRAINT `movie_show_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_show`
--

LOCK TABLES `movie_show` WRITE;
/*!40000 ALTER TABLE `movie_show` DISABLE KEYS */;
INSERT INTO `movie_show` VALUES (1,1,'NAPISY'),(2,3,'DUBBING');
/*!40000 ALTER TABLE `movie_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_data`
--

DROP TABLE IF EXISTS `personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_data` (
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
INSERT INTO `personal_data` VALUES ('Konrad','Kaczynski','112','konrad.kczynski@pracownik.pl','2022-12-09','haski'),('Konrad','Kaczynski','112','konrad.kczynski@student.pk.edu.pl','2022-12-09','haski'),('Lukasz','Blicharz','997','lukasz.blicharz@student.pk.edu.pl','2022-12-09','kotki'),('Zygmunt','Ofiara','123456789','zdzisiek1234@pracownik.pl','2022-12-09','ofiaraja');
/*!40000 ALTER TABLE `personal_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserved`
--

DROP TABLE IF EXISTS `reserved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserved` (
  `id_seat` int unsigned NOT NULL,
  `id_ishow` int unsigned NOT NULL,
  PRIMARY KEY (`id_seat`,`id_ishow`),
  KEY `id_ishow_idx` (`id_ishow`),
  CONSTRAINT `id_ishow` FOREIGN KEY (`id_ishow`) REFERENCES `iShow` (`id_ishow`),
  CONSTRAINT `id_seat` FOREIGN KEY (`id_seat`) REFERENCES `seat` (`id_seat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved`
--

LOCK TABLES `reserved` WRITE;
/*!40000 ALTER TABLE `reserved` DISABLE KEYS */;
INSERT INTO `reserved` VALUES (20,3);
/*!40000 ALTER TABLE `reserved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_number` int NOT NULL,
  `id_cinema` int unsigned NOT NULL,
  `seat_count` int NOT NULL,
  PRIMARY KEY (`room_number`,`id_cinema`),
  KEY `id_cinema_idx` (`id_cinema`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id_cinema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,2,58),(1,4,126),(2,2,58),(2,4,78),(3,2,20);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_row` int NOT NULL,
  `seat_number` int NOT NULL,
  `room_number` int DEFAULT NULL,
  `id_cinema` int unsigned NOT NULL,
  `id_seat` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_seat`),
  KEY `room_number_cinema_idx` (`room_number`,`id_cinema`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`room_number`, `id_cinema`) REFERENCES `room` (`room_number`, `id_cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (5,4,3,2,1),(5,3,3,2,2),(5,2,3,2,3),(5,1,3,2,4),(4,4,3,2,5),(4,3,3,2,6),(4,2,3,2,7),(4,1,3,2,8),(3,4,3,2,9),(3,3,3,2,10),(3,2,3,2,11),(3,1,3,2,12),(2,4,3,2,13),(2,3,3,2,14),(2,2,3,2,15),(2,1,3,2,16),(1,4,3,2,17),(1,3,3,2,18),(1,2,3,2,19),(1,1,3,2,20);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id_client` int unsigned NOT NULL,
  `id_ishow` int unsigned NOT NULL,
  `discount` tinyint(1) NOT NULL,
  `id_seat` int unsigned NOT NULL,
  PRIMARY KEY (`id_client`,`id_ishow`,`id_seat`),
  KEY `id_ishow_idx` (`id_ishow`),
  KEY `id_client_idx` (`id_client`),
  KEY `id_seat_idx` (`id_seat`),
  CONSTRAINT `fk_ticket_seat1` FOREIGN KEY (`id_seat`) REFERENCES `seat` (`id_seat`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_ishow`) REFERENCES `iShow` (`id_ishow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (6,3,0,20);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cinema'
--
/*!50003 DROP PROCEDURE IF EXISTS `addCinema` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addCinema`(IN city VARCHAR(15), IN street VARCHAR(15))
BEGIN
			set @id_location = (SELECT location.id_location from location where location.city = city AND location.street = street);
            IF (@id_location is not null) THEN
				BEGIN
					IF (@id_location NOT IN (SELECT cinema.id_location from cinema)) THEN
						BEGIN
							INSERT INTO cinema(id_location) values (@id_location);
						END;
					END IF;
				END;
			END IF;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addClient`(IN name VARCHAR(30), 
							IN surname VARCHAR(30), 
                            IN phone_number VARCHAR(11),
                            IN email varchar(45),
                            IN date_of_birth date,
                            IN password varchar(30)
                            )
BEGIN
			SET @email = (SELECT personal_data.email from personal_data where personal_data.email = email);
            IF (@email is null) THEN
				INSERT into personal_data(name, surname, phone_number, email, date_of_birth, password)
                VALUES (name, surname, phone_number, email, date_of_birth, password);
				INSERT INTO client(email) values (email);
			END IF;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addEmployee`(
                            IN name VARCHAR(30), 
							IN surname VARCHAR(30), 
                            IN phone_number VARCHAR(11),
                            IN email varchar(45),
                            IN date_of_birth date,
                            IN password varchar(30),
                            IN city varchar(15),
                            IN street VARCHAR(15),
                            IN position VARCHAR(15)
                            )
BEGIN
			SET @id_cinema = (SELECT id_cinema from cinema natural join location where location.city=city AND location.street=street);
            SET @email = (SELECT personal_data.email from personal_data where personal_data.email = email);
            IF(@id_cinema is not null AND @email is null) THEN
				INSERT INTO personal_data(name, surname, phone_number, email, date_of_birth, password) VALUES (name, surname, phone_number, email, date_of_birth, password);
                INSERT INTO employee(id_cinema, email, position) VALUES (@id_cinema, email, position);
            END IF;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addiShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addiShow`(
								IN title VARCHAR(30),
                                IN room_number INT,
                                IN city VARCHAR(15),
                                IN street VARCHAR(15),
                                IN show_date date,
                                IN show_time time,
                                IN price DECIMAL(4,2)
                            )
BEGIN
			SET @idShow = (SELECT id_show from movie_show natural join movie where movie.title = title);
            
            IF (@idShow is not null) THEN
            
				SET @idCinema = (SELECT id_cinema from cinema natural join location where location.city = city and location.street = street);
                
                IF(@idCinema is not null) THEN
                
					SET @room = (SELECT room_number from room where room.id_cinema = @idCinema and room.room_number = room_number);
                    
                    IF(@room is not null) THEN
                    
						INSERT INTO iShow(id_show, room_number, id_cinema, show_date, show_time, price) VALUES (@idShow, @room, @idCinema, show_date, show_time, price);
                    
                    END IF;
                
                END IF;
                
            END IF;
            
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addLocation`(	IN city VARCHAR(15), 
								IN street VARCHAR(15),
								IN number VARCHAR(5),
								IN zip_code VARCHAR(7)
                            )
BEGIN
			SET @id_location = (SELECT id_location from location where location.city = city and location.street = street);
            IF (@id_location is null) THEN
				BEGIN
					INSERT INTO location(city, street, number, zip_code)
						VALUES (city, street, number, zip_code);
				END;
			END IF;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addManager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addManager`(
								IN email_employee varchar(45),
                                IN email_manager varchar(45)
                            )
BEGIN
			SET @email_p = (SELECT personal_data.email from personal_data where personal_data.email = email_employee);
            SET @email_m = (SELECT personal_data.email from personal_data where personal_data.email = email_manager);
            IF(@email_p is not null and @email_m is not null) THEN
				SET @id_m = (SELECT e.id_employee from employee e where e.email = email_manager);
				UPDATE employee
				SET id_manager = @id_m
                WHERE email = email_employee;
                
                UPDATE employee
				SET position = 'MANAGER'
                WHERE email = email_manager;
			END IF;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addMovie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMovie`(	IN title VARCHAR(30), 
							IN movie_description TEXT,
                            IN movie_category ENUM('AKCJA','DOKUMENT','PRZYGODA','HORROR','KOMEDIA','KRYMINAŁ','DRAMAT','SCIENCE-FICTION'),
                            IN age_category INT,
                            IN length INT
                            )
BEGIN
            IF (title not in (select movie.title from movie)) THEN
				BEGIN
					INSERT INTO movie(title, movie_description, movie_category, age_category, length)
						VALUES (title, movie_description, movie_category,age_category,length);
				END;
			END IF;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addMovieShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addMovieShow`(	IN title VARCHAR(30), 
								IN soundtrack ENUM('NAPISY','DUBBING','LEKTOR_PL')
                            )
BEGIN
			SET @id = (SELECT id_movie from movie where movie.title = title);
            IF (@id is not null 
				AND @id not in (SELECT id_movie from movie_show where movie_show.soundtrack = soundtrack)) THEN
				BEGIN
					INSERT INTO movie_show(id_movie, soundtrack)
						VALUES (@id, soundtrack);
				END;
			END IF;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addRoom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addRoom`(	IN city VARCHAR(15), IN street VARCHAR(15), IN seat_count INT, IN row_count INT)
BEGIN
			SET @id_cinema = (SELECT cinema.id_cinema from cinema natural join location where location.city = city and location.street = street);
            IF (@id_cinema is not null 
				AND seat_count > 10
                AND seat_count % row_count = 0) THEN
					SET @id_room = (SELECT max(room_number) from room where room.id_cinema = @id_cinema);
                    IF (@id_room is null) THEN 
							SET @id_room = 1; 
						ELSE 
							SET @id_room = @id_room + 1; 
                    END IF;
                    INSERT INTO room(room_number, id_cinema, seat_count) VALUES (@id_room, @id_cinema, seat_count);
                    
                    SET @row_num = row_count;
                    SET @seat_num = seat_count / row_count;
                    
                    rows_loop: LOOP
						IF (@row_num > 0) THEN
							seats: LOOP
								IF(@seat_num > 0) THEN
									INSERT INTO seat(seat_row, seat_number, room_number, id_cinema) VALUES (@row_num, @seat_num, @id_room, @id_cinema);
                                    SET @seat_num = @seat_num - 1;
                                    ITERATE seats;
                                END IF;
                                LEAVE seats;
							END LOOP seats;
                                
							SET @row_num = @row_num - 1;
                            SET @seat_num = seat_count / row_count;
							ITERATE rows_loop;
                        END IF;
                        LEAVE rows_loop;
					END LOOP rows_loop;
                    
			END IF;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteClient`(
                            IN email varchar(45)
                            )
BEGIN
			DELETE FROM client where client.email = email;
            DELETE FROM personal_data where personal_data.email = email;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEmployee`(
                            IN email varchar(45)
                            )
BEGIN
			DELETE FROM employee where employee.email = email;
            DELETE FROM personal_data where personal_data.email = email;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reserveTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reserveTicket`(
								IN email VARCHAR(45),
                                IN tytul VARCHAR(30),
                                IN data_seansu date,
                                IN godzina INT,
                                IN minuta INT,
                                IN rzad INT,
                                IN miejsce INT,
                                IN znizka TINYINT(1)
                            )
BEGIN
			SET @idKlienta = (SELECT id_client FROM client where client.email = email);
            
            IF (@idKlienta is not null) THEN
            
				SET @idiShow = (SELECT id_ishow from iShow natural join movie_show natural join movie where 	iShow.show_date = data_seansu
																										AND hour(iShow.show_time) = godzina
                                                                                                        AND minute(iShow.show_time) = minuta
																										AND movie.title = tytul);
                
                IF(@idiShow is not null) THEN
                
					SET @seat = (SELECT id_seat from seat where seat.seat_row = rzad and seat.seat_number = miejsce 
																					and room_number = (SELECT iShow.room_number from iShow where iShow.id_ishow = @idiShow)
                                                                                    and id_cinema = (SELECT iShow.id_cinema from iShow where iShow.id_ishow = @idiShow));
                    
                    IF(@seat is not null 
						AND @seat not in (SELECT id_seat FROM reserved where reserved.id_ishow = @idiShow)) THEN
                    
						INSERT INTO reserved(id_seat, id_ishow) VALUES (@seat, @idiShow);
                        INSERT INTO ticket(id_client, id_ishow, discount, id_seat) VALUES (@idKlienta, @idiShow, znizka, @seat);
                    
                    END IF;
                
                END IF;
                
            END IF;
            
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-10 13:18:24
