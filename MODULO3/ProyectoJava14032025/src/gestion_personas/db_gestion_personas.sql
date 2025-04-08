-- 1. Crear la base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS gestion_personas;

-- 2. Usar la base de datos
USE gestion_personas;

-- 3. Crear la tabla personas
CREATE TABLE IF NOT EXISTS personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Insertar datos de prueba
INSERT INTO personas (nombre, apellido, edad) VALUES
('Juan', 'Pérez', 28),
('María', 'Gómez', 32),
('Carlos', 'López', 25),
('Ana', 'Martínez', 30),
('Luis', 'Rodríguez', 22),
('Sofía', 'Hernández', 35),
('Pedro', 'García', 40),
('Laura', 'Díaz', 27);

CREATE TABLE IF NOT EXISTS usuarios(
    id INT auto_increment PRIMARY KEY,
    login VARCHAR(30),
    clave VARCHAR(20)
);

INSERT INTO usuarios(login, clave) VALUES('arturo','12345678');

