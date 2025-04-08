-- ---------------------
-- ESTRUCTURA BASE DATOS
-- ---------------------

-- Eliminar la base de datos si ya existe
DROP DATABASE IF EXISTS BDPRUEBA1;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS BDPRUEBA1;

-- Usar la base de datos creada
USE BDPRUEBA1;

-- Crear la tabla Employee
CREATE TABLE Employee (
    employee_id INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    position    VARCHAR(50)  NOT NULL
);

-- Crear la tabla SocialSecurityNumber
CREATE TABLE SocialSecurityNumber (
    ssn         VARCHAR(11) NOT NULL PRIMARY KEY,
    employee_id INT         NOT NULL UNIQUE,  -- Relaciona 1:1 con Employee
                
	CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE
);

-- ------
--  DATOS
-- ------

-- Insertar empleados
INSERT INTO Employee (name, position) VALUES
('John Doe', 'Manager'),
('Jane Smith', 'Engineer'),
('Michael Johnson', 'Developer'),
('Emily Davis', 'HR Specialist'),
('Daniel Brown', 'Designer'),
('Sophia Wilson', 'Marketing Manager'),
('James Miller', 'Sales Executive'),
('Olivia Taylor', 'Product Manager'),
('Liam Anderson', 'Data Analyst'),
('Mia Thomas', 'Software Tester'),
('Ethan Harris', 'Consultant'),
('Charlotte Martin', 'Support Engineer'),
('Alexander Lee', 'System Administrator'),
('Amelia Moore', 'Content Writer'),
('Benjamin Thompson', 'DevOps Engineer'),
('Isabella Scott', 'UX/UI Designer'),
('Lucas White', 'IT Specialist'),
('Ava King', 'Business Analyst'),
('Henry Wright', 'Accountant'),
('Mason Green', 'Project Manager'),
('Ella Baker', 'Legal Advisor');

-- Insertar números de seguridad social
INSERT INTO SocialSecurityNumber (ssn, employee_id) VALUES
('123-45-6789', 1),
('987-65-4321', 2),
('111-22-3333', 3),
('444-55-6666', 4),
('777-88-9999', 5),
('222-33-4444', 6),
('555-66-7777', 7),
('888-99-1111', 8),
('333-44-5555', 9),
('666-77-8888', 10),
('999-00-1111', 11),
('111-22-4444', 12),
('222-33-5555', 13),
('333-44-6666', 14),
('444-55-7777', 15),
('555-66-8888', 16),
('666-77-9999', 17),
('777-88-1111', 18),
('888-99-2222', 19),
('999-00-3333', 20),
('111-22-5555', 21);

