/* This file ensure the db is populated with dummy-data */
CREATE DATABASE IF NOT EXISTS `assignment_tracker`;
USE `assignment_tracker`;
-- =================================================================
-- SECURITY FIX: Create a dedicated app user instead of using root
-- =================================================================
CREATE USER IF NOT EXISTS 'appuser' @'127.0.0.1' IDENTIFIED BY 'apppass';
GRANT ALL PRIVILEGES ON assignment_tracker.* TO 'appuser' @'127.0.0.1';
FLUSH PRIVILEGES;
-- =================================================================
-- ------------------------------------------------------
-- 1. CREATE PARENT TABLE FIRST (courses)
-- ------------------------------------------------------
DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `courses` (
  `courseID` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE = InnoDB AUTO_INCREMENT = 18 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */
;
INSERT INTO `courses`
VALUES (1, 'Programming for Data Analytics'),
  (3, 'Backend Web Dev I'),
  (4, 'Programming for Data Analytics II'),
  (5, 'Backend Web Dev II'),
  (6, 'Graduate Seminar'),
  (7, 'Frontend Web Dev I'),
  (8, 'Restored Gospel of Jesus Christ'),
  (9, 'Frontend Web Dev II'),
  (11, 'Programming with Classes (using Python)'),
  (14, 'Programming with Functions'),
  (17, 'English Language II');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */
;
UNLOCK TABLES;
-- ------------------------------------------------------
-- 2. CREATE CHILD TABLE SECOND (assignments)
-- ------------------------------------------------------
DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `assignments` (
  `assignmentID` int NOT NULL AUTO_INCREMENT,
  `Description` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `courseID` int NOT NULL,
  PRIMARY KEY (`assignmentID`),
  KEY `courseID` (`courseID`),
  CONSTRAINT `courseID` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */
;
INSERT INTO `assignments`
VALUES (1, 'Quiz 2 this week', 1),
  (3, 'To Do List Project', 3),
  (4, 'Jupyter Notebook Assignment I', 4),
  (5, 'Reflection assignment', 8),
  (6, 'Data Research Project', 4),
  (
    7,
    'Learn How to build APIs with Node &amp; Express',
    3
  ),
  (8, 'Todo List Project', 5),
  (9, 'Midterm Project - MVC Design', 5),
  (10, 'Presentation - 15 minute virtual Zoom', 6),
  (
    11,
    'Write a research paper on the perspectives of student learning remotely during the COVID-19 pandemic and submit',
    6
  ),
  (13, 'Data Research Project', 1),
  (14, 'Quiz 2', 1),
  (16, 'Submit Assignment for Wellness App', 11);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */
;
UNLOCK TABLES;