-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema UNO_A_UNO
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema UNO_A_UNO
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UNO_A_UNO` DEFAULT CHARACTER SET utf8 ;
USE `UNO_A_UNO` ;

-- -----------------------------------------------------
-- Table `UNO_A_UNO`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNO_A_UNO`.`Empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `cargo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNO_A_UNO`.`NumeroSeguridadSocial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNO_A_UNO`.`NumeroSeguridadSocial` (
  `nss` VARCHAR(11) NOT NULL,
  `id_empleado` INT NOT NULL,
  PRIMARY KEY (`nss`),
  INDEX `fk_NumeroSeguridadSocial_Empleado_idx` (`id_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_NumeroSeguridadSocial_Empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `UNO_A_UNO`.`Empleado` (`id_empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
