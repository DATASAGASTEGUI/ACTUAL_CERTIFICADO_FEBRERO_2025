-- DISEÑO

-- -----------------------------------------------------
-- Schema CLIENTE_PEDIDO_1_N
-- -----------------------------------------------------

DROP DATABASE IF EXISTS CLIENTE_PEDIDO_1_N;
CREATE SCHEMA IF NOT EXISTS CLIENTE_PEDIDO_1_N DEFAULT CHARACTER SET utf8 ;
USE CLIENTE_PEDIDO_1_N ;

-- -----------------------------------------------------
-- Table Cliente
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Cliente (
  id_cliente     INT NOT NULL AUTO_INCREMENT,
  nombre_cliente VARCHAR(45) NOT NULL,
                 PRIMARY KEY (id_cliente)
)ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table Pedido
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Pedido (
  id_pedido    INT           NOT NULL AUTO_INCREMENT,
  fecha_pedido DATE          NOT NULL,
  total_pedido DECIMAL(10,2) NOT NULL,
  id_cliente   INT           NOT NULL,
               PRIMARY KEY (id_pedido),
  FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
)ENGINE = InnoDB;

-- DATA

INSERT INTO Cliente (id_cliente, nombre_cliente) VALUES
(1, 'Luis'),
(2, 'Miguel'),
(3, 'Carmen');

INSERT INTO Pedido (id_pedido, fecha_pedido, total_pedido, id_cliente) VALUES
(1, '2025-01-01', 234.88, 1),
(2, '2025-01-02', 1244.89, 1),
(3, '2025-01-01', 3453.23, 2),
(4, '2025-01-01', 2343.34, 3);

-- CONSULTAS

-- 4. MOSTRAR EL DEPARMENTO DONDE TRABAJA EL EMPLEADO 2
-- SELECT id_departamento FROM Empleado WHERE id_empleado = 2;


SELECT 
    c.nombre_cliente,
	p.id_pedido
FROM 
    Cliente c
JOIN 
    Pedido p ON c.id_cliente = p.id_cliente
WHERE 
    c.id_cliente = 1;
	


