-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.31

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i_show`
--

DROP TABLE IF EXISTS `i_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `i_show` (
  `id_ishow` int unsigned NOT NULL AUTO_INCREMENT,
  `id_show` int unsigned NOT NULL,
  `room_number` int NOT NULL,
  `id_cinema` int unsigned NOT NULL,
  `show_date` date NOT NULL,
  `show_time` time NOT NULL,
  `price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_ishow`),
  KEY `room_number_cinema_idx` (`room_number`,`id_cinema`),
  KEY `id_show_idx` (`id_show`),
  CONSTRAINT `ishow_ibfk_1` FOREIGN KEY (`id_show`) REFERENCES `movie_show` (`id_show`),
  CONSTRAINT `ishow_ibfk_2` FOREIGN KEY (`room_number`, `id_cinema`) REFERENCES `room` (`room_number`, `id_cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id_movie` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `movie_description` text,
  `movie_category` enum('AKCJA','DOKUMENT','PRZYGODA','HORROR','KOMEDIA','KRYMINAŁ','DRAMAT','SCIENCE-FICTION','NO-CATEGORY') NOT NULL,
  `age_category` int NOT NULL,
  `length` int NOT NULL,
  PRIMARY KEY (`id_movie`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `id_ishow` FOREIGN KEY (`id_ishow`) REFERENCES `i_show` (`id_ishow`),
  CONSTRAINT `id_seat` FOREIGN KEY (`id_seat`) REFERENCES `seat` (`id_seat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `row_count` int unsigned NOT NULL,
  PRIMARY KEY (`room_number`,`id_cinema`),
  KEY `id_cinema_idx` (`id_cinema`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id_cinema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_ishow`) REFERENCES `i_show` (`id_ishow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'cinema'
--
/*!50003 DROP FUNCTION IF EXISTS `isReserved` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `isReserved`(tytul VARCHAR(30),data_seansu date,godzina INT,minuta INT,rzad INT,miejsce INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
			SET @idiShow = (SELECT id_ishow from i_show natural join movie_show natural join movie where i_show.show_date = data_seansu
																									AND hour(i_show.show_time) = godzina
																									AND minute(i_show.show_time) = minuta
																									AND movie.title = tytul);
			IF(@idiShow is not null) THEN
				SET @seat = (SELECT id_seat from seat where seat.seat_row = rzad and seat.seat_number = miejsce 
																				and room_number = (SELECT i_show.room_number from i_show where i_show.id_ishow = @idiShow)
																				and id_cinema = (SELECT i_show.id_cinema from i_show where i_show.id_ishow = @idiShow));
				IF(@seat is not null AND @seat not in (SELECT id_seat FROM reserved where reserved.id_ishow = @idiShow)) THEN
					RETURN 0;
				ELSE
					RETURN 1;
				END IF;
			END IF;
            RETURN 1;
       END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
                            IN password varchar(200)
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addiShow`(
								IN title VARCHAR(30),
                                IN room_number INT,
                                IN city VARCHAR(15),
                                IN street VARCHAR(15),
                                IN show_date date,
                                IN show_time time,
                                IN price DECIMAL(4,2),
                                IN soundtrack ENUM('NAPISY','DUBBING','LEKTOR_PL')
                            )
BEGIN
			SET @idShow = (SELECT id_show from movie_show natural join movie where movie.title = title and movie_show.soundtrack = soundtrack);
            
            IF (@idShow is not null) THEN
            
				SET @idCinema = (SELECT id_cinema from cinema natural join location where location.city = city and location.street = street);
                
                IF(@idCinema is not null) THEN
                
					SET @room = (SELECT room_number from room where room.id_cinema = @idCinema and room.room_number = room_number);
                    
                    IF(@room is not null) THEN
                    
						INSERT INTO i_show(id_show, room_number, id_cinema, show_date, show_time, price) VALUES (@idShow, @room, @idCinema, show_date, show_time, price);
                    
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
                            IN movie_category ENUM('AKCJA','DOKUMENT','PRZYGODA','HORROR','KOMEDIA','KRYMINAŁ','DRAMAT','SCIENCE-FICTION','NO-CATEGORY'),
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
                    INSERT INTO room(room_number, id_cinema, seat_count, row_count) VALUES (@id_room, @id_cinema, seat_count, row_count);
                    
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
			set @id_client = (SELECT client.id_client from client where client.email = email);
            DELETE FROM ticket WHERE ticket.id_client = @id_client;
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
            
				SET @idiShow = (SELECT id_ishow from i_show natural join movie_show natural join movie where 	i_show.show_date = data_seansu
																										AND hour(i_show.show_time) = godzina
                                                                                                        AND minute(i_show.show_time) = minuta
																										AND movie.title = tytul);
                
                IF(@idiShow is not null) THEN
                
					SET @seat = (SELECT id_seat from seat where seat.seat_row = rzad and seat.seat_number = miejsce 
																					and room_number = (SELECT i_show.room_number from i_show where i_show.id_ishow = @idiShow)
                                                                                    and id_cinema = (SELECT i_show.id_cinema from i_show where i_show.id_ishow = @idiShow));
                    
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

-- Dump completed on 2023-01-10  0:13:42
