-- -----------------------------------------------------
-- (1) SCHEMA: BIBLIOTECA
-- -----------------------------------------------------

-- ELIMINAR LA BASE DE DATOS SI EXISTE

DROP DATABASE IF EXISTS BIBLIOTECA;

-- CREAR LA BASE DE DATOS SI NO EXISTE

CREATE DATABASE IF NOT EXISTS BIBLIOTECA;

-- SELECCIONAR LA BASE DE DATOS PARA SU USO

USE BIBLIOTECA;

-- TABLA AUTHOR

CREATE TABLE `author` (
  `author_id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(100)     NOT NULL,
  `nationality` VARCHAR(100)     DEFAULT NULL,
                PRIMARY KEY (`author_id`),
                UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4;

-- TABLA BOOK

CREATE TABLE `book` (
  `book_id`     INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id`   INT UNSIGNED DEFAULT NULL,
  `title`       VARCHAR(100)     NOT NULL,
  `year`        INT              NOT NULL DEFAULT 1900,
  `language`    VARCHAR(2)       NOT NULL COMMENT 'ISO 639-1 Language code (2 chars)',
  `cover_url`   VARCHAR(500)     DEFAULT NULL,
  `price`       DOUBLE           DEFAULT NULL,
  `sellable`    TINYINT(1)       NOT NULL DEFAULT 0,
  `copies`      INT              NOT NULL DEFAULT 1,
  `description` TEXT,
                PRIMARY KEY (`book_id`),
                UNIQUE KEY `unique_title_language` (`title`, `language`),
                CONSTRAINT `fk_book_author` FOREIGN KEY (`author_id`) REFERENCES `author`(`author_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4;

-- TABLA CLIENT

CREATE TABLE `client` (
  `client_id`  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`       VARCHAR(50)      DEFAULT NULL,
  `email`      VARCHAR(100)     NOT NULL,
  `birthdate`  DATE             DEFAULT NULL,
  `gender`     ENUM('M','F')    DEFAULT NULL,
  `active`     TINYINT(1)       NOT NULL DEFAULT 1,
  `created_at` TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
               PRIMARY KEY (`client_id`),
               UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

-- TABLA TRANSACTION

CREATE TABLE `transaction` (
  `transaction_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id`        INT UNSIGNED NOT NULL,
  `client_id`      INT UNSIGNED NOT NULL,
  `type`           ENUM('lend','sell') NOT NULL,
  `created_at`     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished`       TINYINT(1) NOT NULL DEFAULT 0,
                   PRIMARY KEY (`transaction_id`),
                   CONSTRAINT `fk_transaction_book` FOREIGN KEY (`book_id`) REFERENCES `book`(`book_id`) ON DELETE CASCADE,
                   CONSTRAINT `fk_transaction_client` FOREIGN KEY (`client_id`) REFERENCES `client`(`client_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;