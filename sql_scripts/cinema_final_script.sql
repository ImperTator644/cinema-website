-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (24,'admin@admin'),(23,'k@com'),(22,'test@com');
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
-- Dumping data for table `i_show`
--

LOCK TABLES `i_show` WRITE;
/*!40000 ALTER TABLE `i_show` DISABLE KEYS */;
INSERT INTO `i_show` VALUES (1,2,2,6,'2022-12-10','12:05:03',1.50),(2,2,1,6,'2022-12-10','12:10:05',20.70),(3,2,1,5,'2022-12-10','13:01:10',11.20),(4,3,1,5,'2023-01-13','19:50:00',12.90);
/*!40000 ALTER TABLE `i_show` ENABLE KEYS */;
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
  `movie_category` enum('AKCJA','DOKUMENT','PRZYGODA','HORROR','KOMEDIA','KRYMINAŁ','DRAMAT','SCIENCE-FICTION','NO-CATEGORY') NOT NULL,
  `age_category` int NOT NULL,
  `length` int NOT NULL,
  PRIMARY KEY (`id_movie`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'DZIKA NOC','Kiedy pewna, bogata rodzina zostaje zakładnikami w Wigilię, przestępcy nie są przygotowani na niespodziewanego bojownika. Święty Mikołaj (w tej roli David Harbour, serial Stranger Things) jest na miejscu i ma zamiar pokazać, dlaczego Mikołaj nie będzie taki święty.','DRAMAT',15,112),(2,'DEMON SLAYER: MUGEN TRAIN','Po ukończeniu treningu rehabilitacyjnego, Tanjiro i jego towarzysze udają się na kolejną misję. W Nieskończonym Pociągu doszło do serii tajemniczych zniknięć ponad czterdziestu pasażerów. Tanjiro i Nezuko, wraz z Zenitsu i Inosuke, dołączą do jednego z najpotężniejszych szermierzy wśród Korpusu Zabójców Demonów - Filara Płomienia, Kyojuro Rengoku. Razem stawią czoła nieznanemu zagrożeniu.','SCIENCE-FICTION',12,120),(3,'KOBIETA NA DACHU','Mirka to sześćdziesięcioletnia położna. Jest świetna w swoim fachu, a jeszcze lepsza w ukrywaniu swoich potrzeb i uczuć. W domu też skupia się na innych - mężu i dorosłym synu. Czasem wymyka się na dach swojego bloku, żeby zapalić papierosa. To jedyna rzecz, jaką robi tylko dla siebie, aż do dnia, w którym napada na bank uzbrojona w niewielki nóż kuchenny. Czy wydarzenie to pozwoli, by Mirka spojrzała na swoje życie z innej perspektywy?','DRAMAT',15,97),(4,'MENU','Młoda para wybiera się na odległą wyspę, do ekskluzywnej restauracji. Okazuje się jednak, że nie wszystko jest takie jakim się wydaje a w menu czekają zaskakujące niespodzianki.','KOMEDIA',15,107),(5,'CHŁOPCY Z FERAJNY','Kilkunastoletni Henry i Tommy DeVito trafiają pod opiekę potężnego gangstera. Obaj szybko uczą się panujących w mafii reguł.','KRYMINAŁ',16,146),(6,'NAZNACZONY','Po upadku z drabiny chłopiec traci przytomność. Będąc w śpiączce, wchodzi do świata umarłych.','HORROR',16,103),(7,'SZKLANA PUŁAPKA','Policjant rozprawia się z niebezpiecznymi terrorystami, którzy opanowali biurowiec. Stawką jest życie wielu osób.','AKCJA',18,131),(8,'JUMANJI','Dwunastoletni Alan wraz z koleżanką rozpoczyna zabawę w tajemniczą grę Jumanji, która wciąga go do dżungli. Po latach zostaje uwolniony przez dwójkę rodzeństwa, Judy i Petera.','PRZYGODA',7,104),(9,'SÓL ZIEMI','Sebastiao Salgado przez 40 lat podróżował po świecie dokumentując ludzkość w okresie dramatycznych zmian.','DOKUMENT',13,110),(10,'AVATAR','Jake, sparaliżowany były komandos, zostaje wysłany na planetę Pandora, gdzie zaprzyjaźnia się z lokalną społecznością i postanawia jej pomóc.','SCIENCE-FICTION',12,162),(11,'THE ROOM','Życie poczciwego bankiera zostaje wywrócone do góry nogami w momencie, gdy jego narzeczona zaczyna się spotykać z ich najlepszym przyjacielem.','KOMEDIA',21,99),(12,'JOHNNY','Patryk włamuje się do domku w małym mieście. Wyrok sądu nakazuje mu prace społeczne w puckim hospicjum, gdzie poznaje niezwykłego ks. Jana Kaczkowskiego. Duchowny angażuje młodych chłopaków z zawodówki, na pozór twardych buntowników, w pomoc śmiertelnie chorym. W swojej pracy skupia się na bliskości, czułości i walce o relacje z drugim człowiekiem. Uczy empatii. A czyni to z hurtową ilością humoru, czym zyskuje ogromną popularność. Niedługo później Jan sam staje się pacjentem swojego hospicjum. Patryk zostaje postawiony w sytuacji, która zmieni całe jego życie.','DOKUMENT',15,119),(13,'John Pedro','','SCIENCE-FICTION',5,156),(14,'Dupa Jana','','NO-CATEGORY',5,156),(15,'Jana dupa','','NO-CATEGORY',5,156),(16,'Chuj Ci na kurwe','','DRAMAT',7,124),(17,'Wal sie na cyce','Walimy sie na cyce spadówa mam robote','PRZYGODA',18,29),(18,'Krowa ','','AKCJA',12,123),(19,'Inna krowa rowa','Inna krowa ma rowa','NO-CATEGORY',13,58);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_show`
--

LOCK TABLES `movie_show` WRITE;
/*!40000 ALTER TABLE `movie_show` DISABLE KEYS */;
INSERT INTO `movie_show` VALUES (1,1,'NAPISY'),(2,3,'DUBBING'),(3,10,'NAPISY');
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
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
INSERT INTO `personal_data` VALUES ('admin','admin','admin','admin@admin','1999-01-01','$2a$10$ifAWw9jUyXFO46N/oaIgVO.x5qzjQ2KtckCBJUTw0UAYWQEzG03gi'),('Konrad','Kaczyński','4206969','k@com','2023-01-17','$2a$10$sDyi09xJ.UnjR5dQ4Wo7peWQtyzhIx7SGcvj0fMWf7/h.r4.m0CJG'),('Konrad','Kaczynski','112','konrad.kczynski@pracownik.pl','2022-12-09','haski'),('test','test','test','test@com','2023-01-21','$2a$10$Uwd0XH8Si.iu7fkPONxeqegQfEKdM7mbIkGN6nGzTHNw64sO3M6vO'),('Zygmunt','Ofiara','123456789','zdzisiek1234@pracownik.pl','2022-12-09','ofiaraja');
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
  CONSTRAINT `id_ishow` FOREIGN KEY (`id_ishow`) REFERENCES `i_show` (`id_ishow`),
  CONSTRAINT `id_seat` FOREIGN KEY (`id_seat`) REFERENCES `seat` (`id_seat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved`
--

LOCK TABLES `reserved` WRITE;
/*!40000 ALTER TABLE `reserved` DISABLE KEYS */;
INSERT INTO `reserved` VALUES (359,1),(360,1),(240,2),(72,3);
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
  `row_count` int unsigned NOT NULL,
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
INSERT INTO `room` VALUES (1,5,100,5),(1,6,120,6),(2,6,120,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (5,20,1,5,21),(5,19,1,5,22),(5,18,1,5,23),(5,17,1,5,24),(5,16,1,5,25),(5,15,1,5,26),(5,14,1,5,27),(5,13,1,5,28),(5,12,1,5,29),(5,11,1,5,30),(5,10,1,5,31),(5,9,1,5,32),(5,8,1,5,33),(5,7,1,5,34),(5,6,1,5,35),(5,5,1,5,36),(5,4,1,5,37),(5,3,1,5,38),(5,2,1,5,39),(5,1,1,5,40),(4,20,1,5,41),(4,19,1,5,42),(4,18,1,5,43),(4,17,1,5,44),(4,16,1,5,45),(4,15,1,5,46),(4,14,1,5,47),(4,13,1,5,48),(4,12,1,5,49),(4,11,1,5,50),(4,10,1,5,51),(4,9,1,5,52),(4,8,1,5,53),(4,7,1,5,54),(4,6,1,5,55),(4,5,1,5,56),(4,4,1,5,57),(4,3,1,5,58),(4,2,1,5,59),(4,1,1,5,60),(3,20,1,5,61),(3,19,1,5,62),(3,18,1,5,63),(3,17,1,5,64),(3,16,1,5,65),(3,15,1,5,66),(3,14,1,5,67),(3,13,1,5,68),(3,12,1,5,69),(3,11,1,5,70),(3,10,1,5,71),(3,9,1,5,72),(3,8,1,5,73),(3,7,1,5,74),(3,6,1,5,75),(3,5,1,5,76),(3,4,1,5,77),(3,3,1,5,78),(3,2,1,5,79),(3,1,1,5,80),(2,20,1,5,81),(2,19,1,5,82),(2,18,1,5,83),(2,17,1,5,84),(2,16,1,5,85),(2,15,1,5,86),(2,14,1,5,87),(2,13,1,5,88),(2,12,1,5,89),(2,11,1,5,90),(2,10,1,5,91),(2,9,1,5,92),(2,8,1,5,93),(2,7,1,5,94),(2,6,1,5,95),(2,5,1,5,96),(2,4,1,5,97),(2,3,1,5,98),(2,2,1,5,99),(2,1,1,5,100),(1,20,1,5,101),(1,19,1,5,102),(1,18,1,5,103),(1,17,1,5,104),(1,16,1,5,105),(1,15,1,5,106),(1,14,1,5,107),(1,13,1,5,108),(1,12,1,5,109),(1,11,1,5,110),(1,10,1,5,111),(1,9,1,5,112),(1,8,1,5,113),(1,7,1,5,114),(1,6,1,5,115),(1,5,1,5,116),(1,4,1,5,117),(1,3,1,5,118),(1,2,1,5,119),(1,1,1,5,120),(6,20,1,6,121),(6,19,1,6,122),(6,18,1,6,123),(6,17,1,6,124),(6,16,1,6,125),(6,15,1,6,126),(6,14,1,6,127),(6,13,1,6,128),(6,12,1,6,129),(6,11,1,6,130),(6,10,1,6,131),(6,9,1,6,132),(6,8,1,6,133),(6,7,1,6,134),(6,6,1,6,135),(6,5,1,6,136),(6,4,1,6,137),(6,3,1,6,138),(6,2,1,6,139),(6,1,1,6,140),(5,20,1,6,141),(5,19,1,6,142),(5,18,1,6,143),(5,17,1,6,144),(5,16,1,6,145),(5,15,1,6,146),(5,14,1,6,147),(5,13,1,6,148),(5,12,1,6,149),(5,11,1,6,150),(5,10,1,6,151),(5,9,1,6,152),(5,8,1,6,153),(5,7,1,6,154),(5,6,1,6,155),(5,5,1,6,156),(5,4,1,6,157),(5,3,1,6,158),(5,2,1,6,159),(5,1,1,6,160),(4,20,1,6,161),(4,19,1,6,162),(4,18,1,6,163),(4,17,1,6,164),(4,16,1,6,165),(4,15,1,6,166),(4,14,1,6,167),(4,13,1,6,168),(4,12,1,6,169),(4,11,1,6,170),(4,10,1,6,171),(4,9,1,6,172),(4,8,1,6,173),(4,7,1,6,174),(4,6,1,6,175),(4,5,1,6,176),(4,4,1,6,177),(4,3,1,6,178),(4,2,1,6,179),(4,1,1,6,180),(3,20,1,6,181),(3,19,1,6,182),(3,18,1,6,183),(3,17,1,6,184),(3,16,1,6,185),(3,15,1,6,186),(3,14,1,6,187),(3,13,1,6,188),(3,12,1,6,189),(3,11,1,6,190),(3,10,1,6,191),(3,9,1,6,192),(3,8,1,6,193),(3,7,1,6,194),(3,6,1,6,195),(3,5,1,6,196),(3,4,1,6,197),(3,3,1,6,198),(3,2,1,6,199),(3,1,1,6,200),(2,20,1,6,201),(2,19,1,6,202),(2,18,1,6,203),(2,17,1,6,204),(2,16,1,6,205),(2,15,1,6,206),(2,14,1,6,207),(2,13,1,6,208),(2,12,1,6,209),(2,11,1,6,210),(2,10,1,6,211),(2,9,1,6,212),(2,8,1,6,213),(2,7,1,6,214),(2,6,1,6,215),(2,5,1,6,216),(2,4,1,6,217),(2,3,1,6,218),(2,2,1,6,219),(2,1,1,6,220),(1,20,1,6,221),(1,19,1,6,222),(1,18,1,6,223),(1,17,1,6,224),(1,16,1,6,225),(1,15,1,6,226),(1,14,1,6,227),(1,13,1,6,228),(1,12,1,6,229),(1,11,1,6,230),(1,10,1,6,231),(1,9,1,6,232),(1,8,1,6,233),(1,7,1,6,234),(1,6,1,6,235),(1,5,1,6,236),(1,4,1,6,237),(1,3,1,6,238),(1,2,1,6,239),(1,1,1,6,240),(6,20,2,6,241),(6,19,2,6,242),(6,18,2,6,243),(6,17,2,6,244),(6,16,2,6,245),(6,15,2,6,246),(6,14,2,6,247),(6,13,2,6,248),(6,12,2,6,249),(6,11,2,6,250),(6,10,2,6,251),(6,9,2,6,252),(6,8,2,6,253),(6,7,2,6,254),(6,6,2,6,255),(6,5,2,6,256),(6,4,2,6,257),(6,3,2,6,258),(6,2,2,6,259),(6,1,2,6,260),(5,20,2,6,261),(5,19,2,6,262),(5,18,2,6,263),(5,17,2,6,264),(5,16,2,6,265),(5,15,2,6,266),(5,14,2,6,267),(5,13,2,6,268),(5,12,2,6,269),(5,11,2,6,270),(5,10,2,6,271),(5,9,2,6,272),(5,8,2,6,273),(5,7,2,6,274),(5,6,2,6,275),(5,5,2,6,276),(5,4,2,6,277),(5,3,2,6,278),(5,2,2,6,279),(5,1,2,6,280),(4,20,2,6,281),(4,19,2,6,282),(4,18,2,6,283),(4,17,2,6,284),(4,16,2,6,285),(4,15,2,6,286),(4,14,2,6,287),(4,13,2,6,288),(4,12,2,6,289),(4,11,2,6,290),(4,10,2,6,291),(4,9,2,6,292),(4,8,2,6,293),(4,7,2,6,294),(4,6,2,6,295),(4,5,2,6,296),(4,4,2,6,297),(4,3,2,6,298),(4,2,2,6,299),(4,1,2,6,300),(3,20,2,6,301),(3,19,2,6,302),(3,18,2,6,303),(3,17,2,6,304),(3,16,2,6,305),(3,15,2,6,306),(3,14,2,6,307),(3,13,2,6,308),(3,12,2,6,309),(3,11,2,6,310),(3,10,2,6,311),(3,9,2,6,312),(3,8,2,6,313),(3,7,2,6,314),(3,6,2,6,315),(3,5,2,6,316),(3,4,2,6,317),(3,3,2,6,318),(3,2,2,6,319),(3,1,2,6,320),(2,20,2,6,321),(2,19,2,6,322),(2,18,2,6,323),(2,17,2,6,324),(2,16,2,6,325),(2,15,2,6,326),(2,14,2,6,327),(2,13,2,6,328),(2,12,2,6,329),(2,11,2,6,330),(2,10,2,6,331),(2,9,2,6,332),(2,8,2,6,333),(2,7,2,6,334),(2,6,2,6,335),(2,5,2,6,336),(2,4,2,6,337),(2,3,2,6,338),(2,2,2,6,339),(2,1,2,6,340),(1,20,2,6,341),(1,19,2,6,342),(1,18,2,6,343),(1,17,2,6,344),(1,16,2,6,345),(1,15,2,6,346),(1,14,2,6,347),(1,13,2,6,348),(1,12,2,6,349),(1,11,2,6,350),(1,10,2,6,351),(1,9,2,6,352),(1,8,2,6,353),(1,7,2,6,354),(1,6,2,6,355),(1,5,2,6,356),(1,4,2,6,357),(1,3,2,6,358),(1,2,2,6,359),(1,1,2,6,360);
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
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_ishow`) REFERENCES `i_show` (`id_ishow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (22,1,0,359),(22,1,0,360),(22,2,0,240),(24,3,1,72);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

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
