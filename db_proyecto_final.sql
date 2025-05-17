-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_proyecto_final
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_proyecto_final
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_proyecto_final` DEFAULT CHARACTER SET utf8 ;
USE `db_proyecto_final` ;

-- -----------------------------------------------------
-- Table `db_proyecto_final`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `birth_date` DATE NOT NULL,
  `gender` VARCHAR(2) NOT NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(320) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `is_notified_by_email` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyecto_final`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `db_proyecto_final`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyecto_final`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`task` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `is_notified_by_email` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_task_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_task_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_task_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `db_proyecto_final`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_task_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `db_proyecto_final`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyecto_final`.`unique_task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`unique_task` (
  `task_id` INT UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `time_start` TIME NOT NULL,
  `time_end` TIME NOT NULL,
  INDEX `fk_unique_task_task1_idx` (`task_id` ASC) VISIBLE,
  PRIMARY KEY (`task_id`),
  CONSTRAINT `fk_unique_task_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `db_proyecto_final`.`task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_proyecto_final`.`recurrent_task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_proyecto_final`.`recurrent_task` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `day_of_the_week` ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
  `time_start` TIME NOT NULL,
  `time_end` TIME NOT NULL,
  `task_id` INT UNSIGNED NOT NULL,
  INDEX `fk_recurrent_task_task1_idx` (`task_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_recurrent_task_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `db_proyecto_final`.`task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
