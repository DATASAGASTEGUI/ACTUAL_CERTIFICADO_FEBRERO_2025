-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DEPARTAMENTO_EMPLEADO_1_N
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DEPARTAMENTO_EMPLEADO_1_N
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DEPARTAMENTO_EMPLEADO_1_N` DEFAULT CHARACTER SET utf8 ;
USE `DEPARTAMENTO_EMPLEADO_1_N` ;

-- -----------------------------------------------------
-- Table `DEPARTAMENTO_EMPLEADO_1_N`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEPARTAMENTO_EMPLEADO_1_N`.`Departamento` (
  `id_departamento` INT NOT NULL AUTO_INCREMENT,
  `nombre_departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_departamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DEPARTAMENTO_EMPLEADO_1_N`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DEPARTAMENTO_EMPLEADO_1_N`.`Empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre_empleado` VARCHAR(45) NOT NULL,
  `id_departamento` INT NOT NULL,
  PRIMARY KEY (`id_empleado`),
  INDEX `fk_Empleado_Departamento_idx` (`id_departamento` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Departamento`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `DEPARTAMENTO_EMPLEADO_1_N`.`Departamento` (`id_departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
