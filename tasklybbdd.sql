-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: taskly_db
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `teacher_id` int unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `short_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `full_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_courses_teacher_id_idx` (`teacher_id`),
  CONSTRAINT `fk_courses_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'cc167bb4-45f1-11f0-af55-99dd8a19e019',2,'Curso de SQL','Aprende SQL desde cero',NULL,NULL,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(2,'cc167fc4-45f1-11f0-af55-99dd8a19e019',5,'Curso de JavaScript','JavaScript para principiantes',NULL,NULL,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(3,'cc1680f0-45f1-11f0-af55-99dd8a19e019',2,'Curso de Git','Control de versiones con Git',NULL,NULL,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(4,'cc16819a-45f1-11f0-af55-99dd8a19e019',5,'Curso de HTML','Introducción al desarrollo web',NULL,NULL,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(5,'cc168230-45f1-11f0-af55-99dd8a19e019',2,'Curso de CSS','Estilos y diseño web',NULL,NULL,'2025-06-10 11:55:26','2025-06-10 11:55:26');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  `enrolled_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_student_course` (`student_id`,`course_id`),
  KEY `fk_enrollments_student_id_idx` (`student_id`),
  KEY `fk_enrollments_course_id_idx` (`course_id`),
  CONSTRAINT `fk_enrollments_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollments_student_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,1,'2025-06-10 11:55:26'),(2,1,2,'2025-06-10 11:55:26'),(3,3,1,'2025-06-10 11:55:26'),(4,3,4,'2025-06-10 11:55:26'),(5,4,5,'2025-06-10 11:55:26');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_posts`
--

DROP TABLE IF EXISTS `forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `thread_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_forum_posts_thread_id_idx` (`thread_id`),
  KEY `fk_forum_posts_user_id_idx` (`user_id`),
  CONSTRAINT `fk_forum_posts_thread_id` FOREIGN KEY (`thread_id`) REFERENCES `forum_threads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_forum_posts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_posts`
--

LOCK TABLES `forum_posts` WRITE;
/*!40000 ALTER TABLE `forum_posts` DISABLE KEYS */;
INSERT INTO `forum_posts` VALUES (1,'cc179490-45f1-11f0-af55-99dd8a19e019',1,2,'Puedes usar AND y OR. Ej: WHERE x=1 AND y=2','2025-06-10 11:55:26','2025-06-10 11:55:26'),(2,'cc17968e-45f1-11f0-af55-99dd8a19e019',2,5,'La principal diferencia es el manejo del this','2025-06-10 11:55:26','2025-06-10 11:55:26'),(3,'cc179760-45f1-11f0-af55-99dd8a19e019',3,2,'Stash guarda cambios temporales','2025-06-10 11:55:26','2025-06-10 11:55:26'),(4,'cc1797e2-45f1-11f0-af55-99dd8a19e019',4,5,'<article> sirve para contenido independiente','2025-06-10 11:55:26','2025-06-10 11:55:26'),(5,'cc17985a-45f1-11f0-af55-99dd8a19e019',5,2,'Grid es mejor para layouts grandes','2025-06-10 11:55:26','2025-06-10 11:55:26');
/*!40000 ALTER TABLE `forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_threads`
--

DROP TABLE IF EXISTS `forum_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_threads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `course_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_forum_threads_course_id_idx` (`course_id`),
  KEY `fk_forum_threads_user_id_idx` (`user_id`),
  CONSTRAINT `fk_forum_threads_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_forum_threads_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_threads`
--

LOCK TABLES `forum_threads` WRITE;
/*!40000 ALTER TABLE `forum_threads` DISABLE KEYS */;
INSERT INTO `forum_threads` VALUES (1,'cc177672-45f1-11f0-af55-99dd8a19e019',1,1,'Pregunta sobre SELECT','¿Cómo uso WHERE con múltiples condiciones?','2025-06-10 11:55:26','2025-06-10 11:55:26'),(2,'cc177834-45f1-11f0-af55-99dd8a19e019',2,3,'Duda sobre funciones JS','¿Qué diferencia hay entre funciones normales y flecha?','2025-06-10 11:55:26','2025-06-10 11:55:26'),(3,'cc177906-45f1-11f0-af55-99dd8a19e019',3,1,'¿Qué es Git stash?','No entiendo cómo funciona stash','2025-06-10 11:55:26','2025-06-10 11:55:26'),(4,'cc177988-45f1-11f0-af55-99dd8a19e019',4,3,'HTML semantic tags','¿Para qué sirve <article>?','2025-06-10 11:55:26','2025-06-10 11:55:26'),(5,'cc177a00-45f1-11f0-af55-99dd8a19e019',5,1,'CSS Grid vs Flexbox','¿Cuándo usar cada uno?','2025-06-10 11:55:26','2025-06-10 11:55:26');
/*!40000 ALTER TABLE `forum_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pomodoro`
--

DROP TABLE IF EXISTS `pomodoro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pomodoro` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `user_id` int unsigned NOT NULL,
  `duration_mins` int NOT NULL DEFAULT '25',
  `break_time` time NOT NULL DEFAULT '00:05:00',
  `is_completed` tinyint NOT NULL DEFAULT '0',
  `total_time` int NOT NULL DEFAULT '0' COMMENT 'Total time in minutes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_pomodoro_user_id_idx` (`user_id`),
  CONSTRAINT `fk_pomodoro_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pomodoro`
--

LOCK TABLES `pomodoro` WRITE;
/*!40000 ALTER TABLE `pomodoro` DISABLE KEYS */;
INSERT INTO `pomodoro` VALUES (1,'cc174ba2-45f1-11f0-af55-99dd8a19e019',1,25,'00:05:00',1,25,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(2,'cc174d8c-45f1-11f0-af55-99dd8a19e019',3,50,'00:10:00',1,50,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(3,'cc174e36-45f1-11f0-af55-99dd8a19e019',4,25,'00:05:00',0,0,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(4,'cc174ea4-45f1-11f0-af55-99dd8a19e019',1,25,'00:05:00',1,25,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(5,'cc174f12-45f1-11f0-af55-99dd8a19e019',3,25,'00:05:00',1,25,'2025-06-10 11:55:26','2025-06-10 11:55:26');
/*!40000 ALTER TABLE `pomodoro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_messages`
--

DROP TABLE IF EXISTS `private_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `private_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `sender_id` int unsigned NOT NULL,
  `receiver_id` int unsigned NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_private_messages_sender_id_idx` (`sender_id`),
  KEY `fk_private_messages_receiver_id_idx` (`receiver_id`),
  CONSTRAINT `fk_private_messages_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_private_messages_sender_id` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_messages`
--

LOCK TABLES `private_messages` WRITE;
/*!40000 ALTER TABLE `private_messages` DISABLE KEYS */;
INSERT INTO `private_messages` VALUES (1,'cc17b5e2-45f1-11f0-af55-99dd8a19e019',1,2,'Hola, tengo una duda del curso','2025-06-10 11:55:26','2025-06-10 11:55:26'),(2,'cc17b8bc-45f1-11f0-af55-99dd8a19e019',3,5,'¿Puedes revisar mi ejercicio?','2025-06-10 11:55:26','2025-06-10 11:55:26'),(3,'cc17b9b6-45f1-11f0-af55-99dd8a19e019',4,2,'Gracias por la clase','2025-06-10 11:55:26','2025-06-10 11:55:26'),(4,'cc17ba42-45f1-11f0-af55-99dd8a19e019',1,5,'¿Habrá clase el viernes?','2025-06-10 11:55:26','2025-06-10 11:55:26'),(5,'cc17bac4-45f1-11f0-af55-99dd8a19e019',3,2,'¿Podemos hacer una tutoría?','2025-06-10 11:55:26','2025-06-10 11:55:26');
/*!40000 ALTER TABLE `private_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtasks`
--

DROP TABLE IF EXISTS `subtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subtasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `task_id` int unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_completed` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_subtasks_task_id_idx` (`task_id`),
  CONSTRAINT `fk_subtasks_task_id` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtasks`
--

LOCK TABLES `subtasks` WRITE;
/*!40000 ALTER TABLE `subtasks` DISABLE KEYS */;
INSERT INTO `subtasks` VALUES (1,'cc172640-45f1-11f0-af55-99dd8a19e019',1,'Leer teoría SQL',0,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(2,'cc1728b6-45f1-11f0-af55-99dd8a19e019',1,'Practicar ejercicios',0,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(3,'cc172992-45f1-11f0-af55-99dd8a19e019',3,'Leer documentación MDN',0,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(4,'cc172a0a-45f1-11f0-af55-99dd8a19e019',4,'Leer parte 1',0,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(5,'cc172a6e-45f1-11f0-af55-99dd8a19e019',4,'Leer parte 2',0,'2025-06-10 11:55:26','2025-06-10 11:55:26');
/*!40000 ALTER TABLE `subtasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `user_id` int unsigned NOT NULL,
  `course_id` int unsigned DEFAULT NULL,
  `category` enum('custom','course_related') NOT NULL DEFAULT 'custom',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `due_date` datetime DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `is_urgent` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Para Matriz Eisenhower: 1 = Urgente, 0 = No Urgente',
  `is_important` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Para Matriz Eisenhower: 1 = Importante, 0 = No Importante',
  `priority_color` enum('neutral','yellow','red') NOT NULL DEFAULT 'neutral',
  `is_completed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_tasks_user_id_idx` (`user_id`),
  KEY `fk_tasks_course_id_idx` (`course_id`),
  CONSTRAINT `fk_tasks_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tasks_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'cc16fac6-45f1-11f0-af55-99dd8a19e019',1,1,'course_related','Repasar SELECT','Estudiar SELECT y WHERE',NULL,NULL,NULL,0,0,'neutral',0,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(2,'cc16ff12-45f1-11f0-af55-99dd8a19e019',1,NULL,'custom','Comprar café','Ir al súper',NULL,NULL,NULL,0,0,'neutral',0,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(3,'cc17000c-45f1-11f0-af55-99dd8a19e019',3,2,'course_related','Estudiar funciones JS','Revisar funciones flecha',NULL,NULL,NULL,0,0,'neutral',0,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(4,'cc1700b6-45f1-11f0-af55-99dd8a19e019',3,NULL,'custom','Leer blog de programación','Artículo de async/await',NULL,NULL,NULL,0,0,'neutral',0,'2025-06-10 11:55:26','2025-06-10 11:55:26'),(5,'cc17014c-45f1-11f0-af55-99dd8a19e019',4,NULL,'custom','Enviar email','Enviar recordatorio al equipo',NULL,NULL,NULL,0,0,'neutral',0,'2025-06-10 11:55:26','2025-06-10 11:55:26');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birth_date` date NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profile_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `notify_by_email` tinyint unsigned NOT NULL DEFAULT '1',
  `email_confirmed` tinyint unsigned NOT NULL DEFAULT '0',
  `random_number` varchar(6) DEFAULT NULL,
  `role` enum('general','student','teacher') NOT NULL DEFAULT 'general',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'cc162cc2-45f1-11f0-af55-99dd8a19e019','Ana','García','1995-08-12','ana@example.com','ana95','password123',NULL,1,0,NULL,'student','2025-06-10 11:55:26','2025-06-10 11:55:26'),(2,'cc163604-45f1-11f0-af55-99dd8a19e019','Luis','Martínez','1987-03-02','luis@example.com','luism','password123',NULL,1,0,NULL,'teacher','2025-06-10 11:55:26','2025-06-10 11:55:26'),(3,'cc16383e-45f1-11f0-af55-99dd8a19e019','Clara','López','1992-01-20','clara@example.com','claral','password123',NULL,1,0,NULL,'student','2025-06-10 11:55:26','2025-06-10 11:55:26'),(4,'cc163924-45f1-11f0-af55-99dd8a19e019','Pedro','Sánchez','1980-10-10','pedro@example.com','pedros','password123',NULL,1,0,NULL,'general','2025-06-10 11:55:26','2025-06-10 11:55:26'),(5,'cc1639f6-45f1-11f0-af55-99dd8a19e019','Laura','Ruiz','1990-11-05','laura@example.com','laurar','password123',NULL,1,0,NULL,'teacher','2025-06-10 11:55:26','2025-06-10 11:55:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10 13:58:43
