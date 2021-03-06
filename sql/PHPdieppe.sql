-- MySQL Script generated by MySQL Workbench
-- Thu Apr  5 15:31:10 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PHPDieppe
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PHPDieppe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PHPDieppe` DEFAULT CHARACTER SET utf8 ;
USE `PHPDieppe` ;

-- -----------------------------------------------------
-- Table `PHPDieppe`.`t_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`t_roles` (
  `id_role` INT NOT NULL AUTO_INCREMENT,
  `rollabel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_role`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`t_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`t_users` (
  `id_users` INT NOT NULL AUTO_INCREMENT,
  `usename` VARCHAR(45) NOT NULL,
  `usefirstname` VARCHAR(80) NULL,
  `usemail` VARCHAR(160) NOT NULL,
  `userpassword` CHAR(40) NOT NULL,
  `id_role` INT NOT NULL,
  PRIMARY KEY (`id_users`, `id_role`),
  INDEX `fk_t_users_t_roles_idx` (`id_role` ASC),
  CONSTRAINT `fk_t_users_t_roles`
    FOREIGN KEY (`id_role`)
    REFERENCES `PHPDieppe`.`t_roles` (`id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`t_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`t_article` (
  `id_article` INT NOT NULL AUTO_INCREMENT,
  `ARTtitle` VARCHAR(45) NOT NULL,
  `ARTchapo` VARCHAR(45) NULL,
  `ARTcontent` TEXT NULL,
  `ARTdatetime` DATETIME NULL,
  `t_users_id_users` INT NOT NULL,
  `t_users_id_role` INT NOT NULL,
  PRIMARY KEY (`id_article`, `t_users_id_users`, `t_users_id_role`),
  INDEX `fk_t_article_t_users1_idx` (`t_users_id_users` ASC, `t_users_id_role` ASC),
  CONSTRAINT `fk_t_article_t_users1`
    FOREIGN KEY (`t_users_id_users` , `t_users_id_role`)
    REFERENCES `PHPDieppe`.`t_users` (`id_users` , `id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`T_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`T_categories` (
  `id_categorie` INT NOT NULL AUTO_INCREMENT,
  `CATlabel` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_categorie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PHPDieppe`.`t_article_has_T_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PHPDieppe`.`t_article_has_T_categories` (
  `t_article_id_article` INT NOT NULL,
  `t_article_t_users_id_users` INT NOT NULL,
  `t_article_t_users_id_role` INT NOT NULL,
  `T_categories_id_categorie` INT NOT NULL,
  PRIMARY KEY (`t_article_id_article`, `t_article_t_users_id_users`, `t_article_t_users_id_role`, `T_categories_id_categorie`),
  INDEX `fk_t_article_has_T_categories_T_categories1_idx` (`T_categories_id_categorie` ASC),
  INDEX `fk_t_article_has_T_categories_t_article1_idx` (`t_article_id_article` ASC, `t_article_t_users_id_users` ASC, `t_article_t_users_id_role` ASC),
  CONSTRAINT `fk_t_article_has_T_categories_t_article1`
    FOREIGN KEY (`t_article_id_article` , `t_article_t_users_id_users` , `t_article_t_users_id_role`)
    REFERENCES `PHPDieppe`.`t_article` (`id_article` , `t_users_id_users` , `t_users_id_role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_article_has_T_categories_T_categories1`
    FOREIGN KEY (`T_categories_id_categorie`)
    REFERENCES `PHPDieppe`.`T_categories` (`id_categorie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
