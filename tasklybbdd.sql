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
  `description` text,
  `planning` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `course_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'bermuda-diamond.svg',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_courses_teacher_id_idx` (`teacher_id`),
  CONSTRAINT `fk_courses_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'d1cf78b0-4c1f-11f0-bd0b-c24f467165a7',1,'Programación Avanzada en Python','Conceptos avanzados y buenas prácticas en Python.','[]','flat-mountains.svg','2025-06-18 08:39:59','2025-06-25 11:21:56'),(2,'d1cf7ec8-4c1f-11f0-bd0b-c24f467165a7',2,'Diseño de Bases de Datos Relacionales','Desde el modelo entidad-relación hasta la normalización.','[]','bermuda-triangle.svg','2025-06-18 08:39:59','2025-06-25 11:22:36'),(3,'d1cf8058-4c1f-11f0-bd0b-c24f467165a7',3,'Introducción a Docker y Kubernetes','Contenedores y orquestación para desarrolladores.','[]','scattered-forcefields.svg','2025-06-18 08:39:59','2025-06-25 11:22:36'),(4,'d1cf813e-4c1f-11f0-bd0b-c24f467165a7',1,'Machine Learning con Scikit-Learn','Aprende a crear modelos predictivos en Python.','[\n  {\n    \"title\": \"Principios de diseño web\",\n    \"sections\": [\n      { \"title\": \"Teoría del color\" },\n      { \"title\": \"Tipografía\" },\n      { \"title\": \"Diseño responsivo\" }\n    ]\n  },\n  {\n    \"title\": \"HTML5 moderno\",\n    \"sections\": [\n      { \"title\": \"Estructura básica\" },\n      { \"title\": \"Elementos semánticos\" },\n      { \"title\": \"Formularios y validación\" }\n    ]\n  },\n  {\n    \"title\": \"CSS avanzado\",\n    \"sections\": [\n      { \"title\": \"Flexbox\" },\n      { \"title\": \"CSS Grid\" },\n      { \"title\": \"Animaciones y transiciones\" }\n    ]\n  }\n]','scattered-forcefields.svg','2025-06-18 08:39:59','2025-06-28 15:40:38'),(5,'d1cf821a-4c1f-11f0-bd0b-c24f467165a7',2,'Desarrollo Frontend con React.js','Crea interfaces de usuario interactivas y modernas.','[]','bermuda-triangle.svg','2025-06-18 08:39:59','2025-06-25 11:22:36'),(6,'d1cf82e2-4c1f-11f0-bd0b-c24f467165a7',3,'Ciberseguridad para Principiantes','Fundamentos de la seguridad informática.','[]','flat-mountains.svg','2025-06-18 08:39:59','2025-06-25 11:22:36'),(7,'d1cf83aa-4c1f-11f0-bd0b-c24f467165a7',1,'Testing de Software con Pytest','Asegura la calidad de tu código con tests automatizados.','[]','bermuda-triangle.svg','2025-06-18 08:39:59','2025-06-25 11:22:36'),(8,'d1cf847c-4c1f-11f0-bd0b-c24f467165a7',2,'Cloud Computing con AWS','Introducción a los servicios de Amazon Web Services.','[]','bermuda-diamond.svg','2025-06-18 08:39:59','2025-06-25 11:22:36'),(9,'d1cf854e-4c1f-11f0-bd0b-c24f467165a7',3,'Desarrollo de APIs REST con Node.js','Crea APIs robustas y escalables con Express.','[]','flat-mountains.svg','2025-06-18 08:39:59','2025-06-25 11:22:36'),(10,'d1cf8616-4c1f-11f0-bd0b-c24f467165a7',1,'Análisis de Datos con Pandas','Manipulación y análisis de datos de forma eficiente.','[]','scattered-forcefields.svg','2025-06-18 08:39:59','2025-06-25 11:22:36'),(11,'6895f317-a5e1-4cd5-90de-f3a2d7e7317d',1,'nfdsjf','faksdjflsakfdjlk','[]','scattered-forcefields.svg','2025-06-23 10:44:02','2025-06-23 10:44:02'),(12,'d7ab76cf-e10c-464c-9993-0a250470da19',1,'EFDSFSAs','FDSAFSAF','[]','e6eb86d6ebd98f9eed25c4607d62c937.png','2025-06-23 10:59:35','2025-06-25 11:47:00'),(13,'748dbc8e-0fe2-4acd-b395-f616384e368d',1,'FBVXBVC','BVXCVBXCVB','[]','flat-mountains.svg','2025-06-23 10:59:53','2025-06-23 10:59:53');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_random_course_image` BEFORE INSERT ON `courses` FOR EACH ROW BEGIN
    -- Si la URL de la imagen del curso es NULL (o si se omite en el INSERT)
    IF NEW.course_image_url IS NULL THEN
        -- Asigna una de las cuatro imágenes de forma aleatoria
        SET NEW.course_image_url = ELT(FLOOR(1 + RAND() * 4),
            'bermuda-diamond.svg',
            'bermuda-triangle.svg',
            'flat-mountains.svg',
            'scattered-forcefields.svg'
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_set_default_planning` BEFORE INSERT ON `courses` FOR EACH ROW BEGIN
    IF NEW.planning IS NULL THEN
        SET NEW.planning = '[]';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,4,1,'2025-06-18 08:39:59'),(2,5,2,'2025-06-18 08:39:59'),(3,6,3,'2025-06-18 08:39:59'),(4,7,4,'2025-06-18 08:39:59'),(5,8,5,'2025-06-18 08:39:59'),(6,9,6,'2025-06-18 08:39:59'),(7,10,7,'2025-06-18 08:39:59'),(8,4,8,'2025-06-18 08:39:59'),(9,5,9,'2025-06-18 08:39:59'),(10,6,10,'2025-06-18 08:39:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_posts`
--

LOCK TABLES `forum_posts` WRITE;
/*!40000 ALTER TABLE `forum_posts` DISABLE KEYS */;
INSERT INTO `forum_posts` VALUES (1,'d1d06130-4c1f-11f0-bd0b-c24f467165a7',1,1,'No pasa nada vale','2025-06-18 08:39:59','2025-06-20 06:22:35'),(2,'d1d06310-4c1f-11f0-bd0b-c24f467165a7',2,2,'Exacto. La desnormalización es una técnica válida para optimizar lecturas.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(3,'d1d063c4-4c1f-11f0-bd0b-c24f467165a7',3,3,'Ese error suele ser por el shebang del script que intentas ejecutar. Revisa tu Dockerfile.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(4,'d1d06446-4c1f-11f0-bd0b-c24f467165a7',4,1,'No pasa nada vale','2025-06-18 08:39:59','2025-06-20 06:22:35'),(5,'d1d064be-4c1f-11f0-bd0b-c24f467165a7',5,2,'Usa `useEffect` casi siempre. `useLayoutEffect` es para casos raros donde necesitas leer el DOM antes del renderizado.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(6,'d1d06536-4c1f-11f0-bd0b-c24f467165a7',6,3,'Usa una librería como DOMPurify en el frontend antes de renderizar el HTML.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(7,'d1d065a4-4c1f-11f0-bd0b-c24f467165a7',7,2,'Una VPC (Virtual Private Cloud) es tu propia red aislada dentro de la nube de AWS.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(8,'d1d0661c-4c1f-11f0-bd0b-c24f467165a7',8,3,'Necesitas instalar y configurar el paquete `cors` en tu aplicación de Express.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(9,'d1d0669e-4c1f-11f0-bd0b-c24f467165a7',9,1,'No pasa nada vale','2025-06-18 08:39:59','2025-06-20 06:22:35'),(10,'d1d0672a-4c1f-11f0-bd0b-c24f467165a7',10,3,'Sí, el orden es crucial. Se ejecutan secuencialmente.','2025-06-18 08:39:59','2025-06-18 08:39:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_threads`
--

LOCK TABLES `forum_threads` WRITE;
/*!40000 ALTER TABLE `forum_threads` DISABLE KEYS */;
INSERT INTO `forum_threads` VALUES (1,'d1d03f70-4c1f-11f0-bd0b-c24f467165a7',1,4,'Duda con decoradores en Python','No entiendo cómo pasar argumentos a un decorador.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(2,'d1d0413c-4c1f-11f0-bd0b-c24f467165a7',2,5,'¿Tercera Forma Normal (3NF) es siempre necesaria?','He leído que a veces se desnormaliza por rendimiento.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(3,'d1d041fa-4c1f-11f0-bd0b-c24f467165a7',3,6,'Error al levantar un contenedor','Me sale un error \"standard_init_linux.go:211: exec user process caused\"','2025-06-18 08:39:59','2025-06-18 08:39:59'),(4,'d1d0429a-4c1f-11f0-bd0b-c24f467165a7',4,7,'Mejor forma de visualizar datos de un modelo','¿Matplotlib o Seaborn para un RandomForest?','2025-06-18 08:39:59','2025-06-18 08:39:59'),(5,'d1d0431c-4c1f-11f0-bd0b-c24f467165a7',5,8,'¿useEffect o useLayoutEffect?','¿Cuándo debería usar useLayoutEffect sobre useEffect?','2025-06-18 08:39:59','2025-06-18 08:39:59'),(6,'d1d0439e-4c1f-11f0-bd0b-c24f467165a7',6,9,'Duda sobre XSS Almacenado','¿Cómo se sanitiza la entrada del usuario correctamente?','2025-06-18 08:39:59','2025-06-18 08:39:59'),(7,'d1d04420-4c1f-11f0-bd0b-c24f467165a7',7,10,'¿Qué es una VPC en AWS?','No entiendo la diferencia con una red local.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(8,'d1d04498-4c1f-11f0-bd0b-c24f467165a7',8,4,'Problema con CORS en mi API REST','Recibo un error de \"Access-Control-Allow-Origin\" desde el frontend.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(9,'d1d0451a-4c1f-11f0-bd0b-c24f467165a7',9,5,'¿Cómo unir dos DataFrames en Pandas?','Quiero hacer algo similar a un LEFT JOIN de SQL.','2025-06-18 08:39:59','2025-06-18 08:39:59'),(10,'d1d0459c-4c1f-11f0-bd0b-c24f467165a7',10,6,'Duda sobre middlewares en Express','¿El orden de los middlewares importa?','2025-06-18 08:39:59','2025-06-18 08:39:59');
/*!40000 ALTER TABLE `forum_threads` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtasks`
--

LOCK TABLES `subtasks` WRITE;
/*!40000 ALTER TABLE `subtasks` DISABLE KEYS */;
INSERT INTO `subtasks` VALUES (1,'d1d01b58-4c1f-11f0-bd0b-c24f467165a7',1,'Implementar función fibonacci con generador',0,'2025-06-18 08:39:59','2025-06-18 08:39:59'),(2,'d1d01d56-4c1f-11f0-bd0b-c24f467165a7',1,'Escribir tests para la función',0,'2025-06-18 08:39:59','2025-06-18 08:39:59'),(3,'d1d01e0a-4c1f-11f0-bd0b-c24f467165a7',2,'Identificar entidades y atributos',0,'2025-06-18 08:39:59','2025-06-18 08:39:59'),(4,'d1d01e82-4c1f-11f0-bd0b-c24f467165a7',2,'Definir relaciones y cardinalidad',0,'2025-06-18 08:39:59','2025-06-18 08:39:59'),(5,'d1d01ee6-4c1f-11f0-bd0b-c24f467165a7',3,'Ver videos sobre Docker Compose',0,'2025-06-18 08:39:59','2025-06-18 08:39:59'),(6,'d1d01f54-4c1f-11f0-bd0b-c24f467165a7',4,'Manejar valores nulos en la columna \"Age\"',0,'2025-06-18 08:39:59','2025-06-18 08:39:59'),(7,'d1d01fb8-4c1f-11f0-bd0b-c24f467165a7',5,'Crear formulario con email y password',0,'2025-06-18 08:39:59','2025-06-18 08:39:59'),(8,'d1d0201c-4c1f-11f0-bd0b-c24f467165a7',6,'Probar con ejemplos de OWASP',0,'2025-06-18 08:39:59','2025-06-18 08:39:59'),(9,'d1d02080-4c1f-11f0-bd0b-c24f467165a7',7,'Crear una instancia EC2 para las pruebas',0,'2025-06-18 08:39:59','2025-06-18 08:39:59'),(10,'d1d020e4-4c1f-11f0-bd0b-c24f467165a7',8,'Documentar las rutas con Postman',0,'2025-06-18 08:39:59','2025-06-18 08:39:59');
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
  `due_date` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `is_urgent` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Para Matriz Eisenhower: 1 = Urgente, 0 = No Urgente',
  `is_important` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Para Matriz Eisenhower: 1 = Importante, 0 = No Importante',
  `is_completed` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_tasks_user_id_idx` (`user_id`),
  KEY `fk_tasks_course_id_idx` (`course_id`),
  CONSTRAINT `fk_tasks_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tasks_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'d1cff254-4c1f-11f0-bd0b-c24f467165a7',4,1,'course_related','Entregar Práctica 1 de Python','Realizar los ejercicios sobre generadores.','2025-07-15','09:00:00','11:00:00',1,1,0,'2025-06-18 08:39:59','2025-07-06 09:31:11'),(2,'d1cff510-4c1f-11f0-bd0b-c24f467165a7',5,2,'course_related','Diseñar Diagrama E-R','Crear el diagrama para el proyecto final.','2025-07-18','15:00:00','17:30:00',1,0,0,'2025-06-18 08:39:59','2025-07-06 09:31:11'),(3,'d1cff632-4c1f-11f0-bd0b-c24f467165a7',6,NULL,'custom','Ver tutorial de Express.js','Video sobre middlewares.','2025-07-20','19:00:00','20:00:00',0,1,0,'2025-06-18 08:39:59','2025-07-06 09:31:11'),(4,'d1cff6d2-4c1f-11f0-bd0b-c24f467165a7',7,4,'course_related','Limpiar dataset de Titanic','Aplicar técnicas de preprocesamiento.','2025-07-22','10:00:00','12:00:00',0,0,0,'2025-06-18 08:39:59','2025-07-06 09:31:11'),(5,'d1cff768-4c1f-11f0-bd0b-c24f467165a7',8,5,'course_related','Crear componente de Login','Usar hooks de estado en React.','2025-07-25','16:00:00','18:00:00',1,1,0,'2025-06-18 08:39:59','2025-07-06 09:31:11'),(6,'d1cff7f4-4c1f-11f0-bd0b-c24f467165a7',9,6,'course_related','Investigar sobre inyección SQL','Entender los mecanismos de prevención.','2025-07-28','11:00:00','12:30:00',1,0,0,'2025-06-18 08:39:59','2025-07-06 09:31:11'),(7,'d1cff880-4c1f-11f0-bd0b-c24f467165a7',10,7,'course_related','Configurar un Security Group en AWS','Abrir puertos 80 y 443.','2025-08-01','14:00:00','15:00:00',0,1,0,'2025-06-18 08:39:59','2025-07-06 09:31:11'),(8,'d1cff902-4c1f-11f0-bd0b-c24f467165a7',4,8,'course_related','Definir endpoints para API de usuarios','Crear rutas GET, POST, PUT, DELETE.','2025-08-05','09:30:00','11:30:00',1,1,0,'2025-06-18 08:39:59','2025-07-06 09:31:11'),(9,'d1cff998-4c1f-11f0-bd0b-c24f467165a7',5,NULL,'custom','Leer documentación de Pandas','Capítulo sobre GroupBy.','2025-08-10','20:00:00','21:00:00',0,0,0,'2025-06-18 08:39:59','2025-07-06 09:31:11'),(10,'d1cffa24-4c1f-11f0-bd0b-c24f467165a7',6,10,'course_related','Ver tutorial de Express.js','Video sobre middlewares.','2025-08-12','18:00:00','19:00:00',0,1,0,'2025-06-18 08:39:59','2025-07-06 09:31:11');
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
  `profile_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default_user_profile.svg',
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'d1ceef94-4c1f-11f0-bd0b-c24f467165a7','Carlos','Gómez','1985-05-15','0483acb493fcabc362dbc8703614ae6d10679dc14e55762d896550ba4f640b33','carlosg','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'teacher','2025-06-18 08:39:59','2025-06-18 10:46:21'),(2,'d1cf185c-4c1f-11f0-bd0b-c24f467165a7','Sofía','Hernández','1991-09-23','0868afd07f147ea48baf114caceb089239fffa8ae08f647756baa844651ca523','sofiah','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'teacher','2025-06-18 08:39:59','2025-06-18 10:46:21'),(3,'d1cf1b4a-4c1f-11f0-bd0b-c24f467165a7','Javier','Díaz','1988-12-01','70ea0d82a66f0aba8949d1b0aff09d3cfe93e06133f92f0c1dc32502a03e4044','javierd','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'teacher','2025-06-18 08:39:59','2025-06-18 10:46:21'),(4,'d1cf1c3a-4c1f-11f0-bd0b-c24f467165a7','Mariana','Pérez','1998-07-30','6b06b0432a873f90070a54ef4cbd65d18bb54a820b20be8b9c7bb94bed09e1bb','marianap','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'student','2025-06-18 08:39:59','2025-06-18 10:46:21'),(5,'d1cf1d2a-4c1f-11f0-bd0b-c24f467165a7','Juan','Ramírez','1999-02-18','baeebdce8783528dac9e7d15588b17d0f8698ee627ca701f1194be8f10e03732','juanr','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'student','2025-06-18 08:39:59','2025-06-18 10:46:21'),(6,'d1cf1de8-4c1f-11f0-bd0b-c24f467165a7','Valentina','Torres','2000-04-11','33932c636ac8fc6a63c22ff423795f4a0f8f7f3e5d61524734c7e068e8156ca1','valentinat','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'student','2025-06-18 08:39:59','2025-06-18 10:46:21'),(7,'d1cf1eec-4c1f-11f0-bd0b-c24f467165a7','Mateo','Flores','1997-11-03','a3ffebc193fdba1082233ded99d248fece947368c3d59d9b054601973d691f4a','mateof','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'student','2025-06-18 08:39:59','2025-06-18 10:46:21'),(8,'d1cf1fb4-4c1f-11f0-bd0b-c24f467165a7','Camila','Acosta','2001-08-25','b2ac2dbf770bcd206f6c56eccff5964f5d9efe5cf349d3c0bf363f100c120809','camilaa','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'student','2025-06-18 08:39:59','2025-06-18 10:46:21'),(9,'d1cf2072-4c1f-11f0-bd0b-c24f467165a7','Daniel','Rojas','1999-06-07','532030cd48c0f04dc8a97e4acb71cfc3c9df102ec9e46f53e7f3085086e5168e','danielr','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'student','2025-06-18 08:39:59','2025-06-18 10:46:21'),(10,'d1cf2126-4c1f-11f0-bd0b-c24f467165a7','Isabella','Morales','2002-03-14','517006bebd4ee2f402366e709e9b777eddccbff7fdc5f8a74833ca94c1deaf5c','isabellam','$2b$08$UVDlqAVSrVCx4Ioc4oxRzOuNadCyUO9GluQlYUZBO1OaCYG7dUBhW','default_user_profile.svg',1,1,NULL,'student','2025-06-18 08:39:59','2025-06-18 10:46:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'taskly_db'
--

--
-- Dumping routines for database 'taskly_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 15:40:50
