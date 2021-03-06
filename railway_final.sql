-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Locality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Locality` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Locality` (
  `locality_id` INT NOT NULL AUTO_INCREMENT,
  `locality_name` VARCHAR(45) NULL,
  PRIMARY KEY (`locality_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Station` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Station` (
  `station_id` INT NOT NULL AUTO_INCREMENT,
  `station_name` VARCHAR(45) NULL,
  `Locality_locality_id` INT NOT NULL,
  PRIMARY KEY (`station_id`),
  INDEX `fk_Station_Locality1_idx` (`Locality_locality_id` ASC) VISIBLE,
  CONSTRAINT `fk_Station_Locality1`
    FOREIGN KEY (`Locality_locality_id`)
    REFERENCES `mydb`.`Locality` (`locality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Route` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Route` (
  `route_id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `route_name` VARCHAR(45) NULL,
  PRIMARY KEY (`route_id`, `start_date`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Arrives`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Arrives` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Arrives` (
  `Station_station_id` INT NOT NULL,
  `Route_route_id` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  PRIMARY KEY (`Station_station_id`, `Route_route_id`),
  INDEX `fk_Station_has_Route_Route1_idx` (`Route_route_id` ASC) VISIBLE,
  INDEX `fk_Station_has_Route_Station1_idx` (`Station_station_id` ASC) VISIBLE,
  CONSTRAINT `fk_Station_has_Route_Station1`
    FOREIGN KEY (`Station_station_id`)
    REFERENCES `mydb`.`Station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Station_has_Route_Route1`
    FOREIGN KEY (`Route_route_id`)
    REFERENCES `mydb`.`Route` (`route_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Departs` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Departs` (
  `Station_station_id` INT NOT NULL,
  `Route_route_id` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  PRIMARY KEY (`Station_station_id`, `Route_route_id`),
  INDEX `fk_Station_has_Route_Route2_idx` (`Route_route_id` ASC) VISIBLE,
  INDEX `fk_Station_has_Route_Station2_idx` (`Station_station_id` ASC) VISIBLE,
  CONSTRAINT `fk_Station_has_Route_Station2`
    FOREIGN KEY (`Station_station_id`)
    REFERENCES `mydb`.`Station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Station_has_Route_Route2`
    FOREIGN KEY (`Route_route_id`)
    REFERENCES `mydb`.`Route` (`route_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Route` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Route` (
  `route_id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `route_name` VARCHAR(45) NULL,
  PRIMARY KEY (`route_id`, `start_date`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Locality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Locality` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Locality` (
  `locality_id` INT NOT NULL AUTO_INCREMENT,
  `locality_name` VARCHAR(45) NULL,
  PRIMARY KEY (`locality_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Station` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Station` (
  `station_id` INT NOT NULL AUTO_INCREMENT,
  `station_name` VARCHAR(45) NULL,
  `Locality_locality_id` INT NOT NULL,
  PRIMARY KEY (`station_id`),
  INDEX `fk_Station_Locality1_idx` (`Locality_locality_id` ASC) VISIBLE,
  CONSTRAINT `fk_Station_Locality1`
    FOREIGN KEY (`Locality_locality_id`)
    REFERENCES `mydb`.`Locality` (`locality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Arrival`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Arrival` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Arrival` (
  `station_id` INT NOT NULL,
  `route_id` INT NOT NULL,
  `route_start_date` DATE NOT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`station_id`, `route_id`, `route_start_date`),
  INDEX `fk_Station_has_Route_Route3_idx` (`route_id` ASC, `route_start_date` ASC) VISIBLE,
  INDEX `fk_Station_has_Route_Station3_idx` (`station_id` ASC) VISIBLE,
  CONSTRAINT `fk_Station_has_Route_Station3`
    FOREIGN KEY (`station_id`)
    REFERENCES `mydb`.`Station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Station_has_Route_Route3`
    FOREIGN KEY (`route_id` , `route_start_date`)
    REFERENCES `mydb`.`Route` (`route_id` , `start_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Departure` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Departure` (
  `station_id` INT NOT NULL,
  `route_id` INT NOT NULL,
  `route_start_date` DATE NOT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`station_id`, `route_id`, `route_start_date`),
  INDEX `fk_Station_has_Route_Route4_idx` (`route_id` ASC, `route_start_date` ASC) VISIBLE,
  INDEX `fk_Station_has_Route_Station4_idx` (`station_id` ASC) VISIBLE,
  CONSTRAINT `fk_Station_has_Route_Station4`
    FOREIGN KEY (`station_id`)
    REFERENCES `mydb`.`Station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Station_has_Route_Route4`
    FOREIGN KEY (`route_id` , `route_start_date`)
    REFERENCES `mydb`.`Route` (`route_id` , `start_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Train`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Train` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Train` (
  `train_id` INT NOT NULL AUTO_INCREMENT,
  `route_id` INT NOT NULL,
  `route_start_date` DATE NOT NULL,
  PRIMARY KEY (`train_id`, `route_id`, `route_start_date`),
  INDEX `fk_Train_Route1_idx` (`route_id` ASC, `route_start_date` ASC) VISIBLE,
  CONSTRAINT `fk_Train_Route1`
    FOREIGN KEY (`route_id` , `route_start_date`)
    REFERENCES `mydb`.`Route` (`route_id` , `start_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carriage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Carriage` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Carriage` (
  `carriage_id` INT NOT NULL AUTO_INCREMENT,
  `train_id` INT NOT NULL,
  `route_id` INT NOT NULL,
  `route_start_date` DATE NOT NULL,
  `carriage_num` INT NULL,
  PRIMARY KEY (`carriage_id`, `train_id`, `route_id`, `route_start_date`),
  INDEX `fk_Carriage_Train1_idx` (`train_id` ASC, `route_id` ASC, `route_start_date` ASC) VISIBLE,
  CONSTRAINT `fk_Carriage_Train1`
    FOREIGN KEY (`train_id` , `route_id` , `route_start_date`)
    REFERENCES `mydb`.`Train` (`train_id` , `route_id` , `route_start_date`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Seat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Seat` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Seat` (
  `seat_num` INT NOT NULL AUTO_INCREMENT,
  `train_id` INT NOT NULL,
  `route_id` INT NOT NULL,
  `route_start_date` DATE NOT NULL,
  `carriage_id` INT NOT NULL,
  PRIMARY KEY (`seat_num`, `train_id`, `route_id`, `route_start_date`, `carriage_id`),
  INDEX `fk_Seat_Carriage1_idx` (`train_id` ASC, `route_id` ASC, `route_start_date` ASC, `carriage_id` ASC) VISIBLE,
  CONSTRAINT `fk_Seat_Carriage1`
    FOREIGN KEY (`train_id` , `route_id` , `route_start_date` , `carriage_id`)
    REFERENCES `mydb`.`Carriage` (`train_id` , `route_id` , `route_start_date` , `carriage_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ticket` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ticket` (
  `ticket_id` INT NOT NULL AUTO_INCREMENT,
  `train_id` INT NOT NULL,
  `route_id` INT NOT NULL,
  `route_start_date` DATE NOT NULL,
  `carriage_id` INT NOT NULL,
  `seat_num` INT NOT NULL,
  `station_from` INT NOT NULL,
  `station_to` INT NOT NULL,
  PRIMARY KEY (`ticket_id`, `train_id`, `route_id`, `route_start_date`, `carriage_id`, `seat_num`, `station_from`, `station_to`),
  INDEX `fk_Ticket_Seat1_idx` (`train_id` ASC, `route_id` ASC, `route_start_date` ASC, `carriage_id` ASC, `seat_num` ASC) VISIBLE,
  INDEX `fk_Ticket_Station1_idx` (`station_from` ASC) VISIBLE,
  INDEX `fk_Ticket_Station2_idx` (`station_to` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Seat1`
    FOREIGN KEY (`train_id` , `route_id` , `route_start_date` , `carriage_id` , `seat_num`)
    REFERENCES `mydb`.`Seat` (`train_id` , `route_id` , `route_start_date` , `carriage_id` , `seat_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Station1`
    FOREIGN KEY (`station_from`)
    REFERENCES `mydb`.`Station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Station2`
    FOREIGN KEY (`station_to`)
    REFERENCES `mydb`.`Station` (`station_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Passenger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Passenger` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Passenger` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(64) NULL,
  `phone#` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
