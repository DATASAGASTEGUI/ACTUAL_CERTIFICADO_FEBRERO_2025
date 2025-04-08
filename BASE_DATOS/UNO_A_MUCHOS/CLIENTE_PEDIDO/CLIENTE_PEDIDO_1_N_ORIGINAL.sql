-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CLIENTE_PEDIDO_1_N
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CLIENTE_PEDIDO_1_N
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CLIENTE_PEDIDO_1_N` DEFAULT CHARACTER SET utf8 ;
USE `CLIENTE_PEDIDO_1_N` ;

-- -----------------------------------------------------
-- Table `CLIENTE_PEDIDO_1_N`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLIENTE_PEDIDO_1_N`.`Cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre_cliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLIENTE_PEDIDO_1_N`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLIENTE_PEDIDO_1_N`.`Pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `fecha_pedido` DATE NOT NULL,
  `total_pedido` DECIMAL(10,2) NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_Pedido_Cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `CLIENTE_PEDIDO_1_N`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
