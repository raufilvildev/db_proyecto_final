-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_proyecto_final
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_proyecto_final
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_proyecto_final` DEFAULT CHARACTER SET utf8mb3 ;
USE `db_proyecto_final` ;

-- -----------------------------------------------------
-- Table `db_proyecto_final`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `last_name` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `birth_date` DATE NOT NULL,
  `gender` VARCHAR(2) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `email` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `username` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `password` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `notify_by_email` TINYINT UNSIGNED NOT NULL DEFAULT '1',
  `email_confirmed` TINYINT UNSIGNED NOT NULL DEFAULT '0',
  `random_number` VARCHAR(6) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_proyecto_final`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `db_proyecto_final`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_proyecto_final`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`task` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `url` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `is_notified_by_email` TINYINT UNSIGNED NOT NULL DEFAULT '1',
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_task_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_task_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_task_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `db_proyecto_final`.`category` (`id`),
  CONSTRAINT `fk_task_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `db_proyecto_final`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_proyecto_final`.`recurrent_task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`recurrent_task` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `day_of_the_week` ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL,
  `time_start` TIME NOT NULL,
  `time_end` TIME NOT NULL,
  `task_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recurrent_task_task1_idx` (`task_id` ASC) VISIBLE,
  CONSTRAINT `fk_recurrent_task_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `db_proyecto_final`.`task` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_proyecto_final`.`unique_task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`unique_task` (
  `task_id` INT UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `time_start` TIME NOT NULL,
  `time_end` TIME NOT NULL,
  PRIMARY KEY (`task_id`),
  INDEX `fk_unique_task_task1_idx` (`task_id` ASC) VISIBLE,
  CONSTRAINT `fk_unique_task_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `db_proyecto_final`.`task` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
