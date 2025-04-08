-- ELIMINAR UN USUARIO CON TODOS SUS OBJETOS (TABLAS, VISTAS, SECUENCIAS ETC) DE PROPIEDAD DEL USUARIO
DROP USER FACTORIA CASCADE;

-- CREAR UN NUEVO USUARIO CON UNA CONTRASEÑA
CREATE USER FACTORIA IDENTIFIED BY 12345678;

-- EL ROL CONNECT PERMITE A UN USUARIO INICIAR SESION EN LA BASE DE DATOS
-- EL ROL RESOURCE PERMITE A UN USUARIO PERMISOS PARA CREAR Y MODIFICAR OBJETOS DE ESQUEMA, COMO TABLAS, VISTAS, SECUENCIAS ETC
-- EL ROL DBA OTORGA TODOS LOS PRIVILEGIOS ADMINISTRATIVOS A UN USUARIO
GRANT CONNECT,RESOURCE,DBA TO FACTORIA;

-- ESTE PRIVILEGIO PERMITE AL USUARIO USAR UN ESPACIO ILIMITADO EN TODOS LOS TABLESPACES DE LA BASE DE DATOS
GRANT UNLIMITED TABLESPACE TO FACTORIA;

-- MODIFICA EL PERFIL DEFAULT PARA QUE EL PARAMETRO PASSWORD_REUSE_TIME NO TENGA LIMITES. NO HAY RESTRICCIONES DE TIEMPO PARA LA REUTILIZACION DE CONTRASEÑAS
ALTER PROFILE DEFAULT LIMIT PASSWORD_REUSE_TIME UNLIMITED;

-- MODIFICA EL PERFIL DEFAULT PARA QUE EL PARAMETRO PASSWORD_LIFE_TIME NO TENGA LIMITES. LA CONTRASEÑA NUNCA EXPIRA
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

-- DESBLOQUEAR AL USUARIO FACTORIA POR SI ESTUBIERA BLOQUEADO
ALTER USER FACTORIA ACCOUNT UNLOCK;

-- INICIAR SESION CON EL USUARIO FACTORIA
CONNECT FACTORIA/12345678@LOCALHOST:1521/XEPDB1

-- CONFIGURAR EL FORMATO DE LA FECHA, COMO DEBE SER INGRESADA EN INSERT
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'; 

-- DESACTIVAR TEMPORALMENTE LA FUNCION DE SUSTITUCION DE VARIABLE EN TU SESION (&)
SET DEFINE OFF;

CREATE TABLE Director (
  idDirector INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE Oficina (
  idOficina  INTEGER      NOT NULL PRIMARY KEY,
  idDirector INTEGER      NOT NULL,
  ciudad     VARCHAR(20)  NOT NULL,
  region     VARCHAR(20)  NOT NULL,
  objetivo   NUMBER(10,2) NOT NULL,
  ventas     NUMBER(10,2) NOT NULL,
			 FOREIGN KEY (idDirector) REFERENCES Director(idDirector)
);

CREATE TABLE Vendedor (
  idVendedor     INTEGER      NOT NULL PRIMARY KEY,
  nombre         VARCHAR(20)  NOT NULL,
  edad           INTEGER      NOT NULL,
  idOficina      INTEGER         NULL,
  titulo         VARCHAR(20)  NOT NULL,
  contrato       DATE         NOT NULL,
  cuota          NUMBER(10,2)     NULL,
  ventas         NUMBER(10,2) NOT NULL,
  idVendedorJefe INTEGER          NULL,
			     FOREIGN KEY (idOficina) REFERENCES Oficina(idOficina),
                 FOREIGN KEY (idVendedorJefe) REFERENCES Vendedor(idVendedor)		 
);

CREATE TABLE Cliente (
  idCliente      INTEGER      NOT NULL PRIMARY KEY,
  empresa        VARCHAR(20)  NOT NULL,
  idVendedor     INTEGER      NOT NULL,
  limite_credito NUMBER(10,2) NOT NULL,
			     FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor)
);

CREATE TABLE Producto (
  idFabrica    VARCHAR(20)  NOT NULL,
  idProducto   VARCHAR(20)  NOT NULL,
  descripcion  VARCHAR(20)  NOT NULL,
  precio       NUMBER(10,2) NOT NULL,
  existencia   INTEGER      NOT NULL,
               PRIMARY KEY (idFabrica, idProducto)
);

CREATE TABLE Pedido (
  idPedido     INTEGER      NOT NULL PRIMARY KEY,
  idVendedor   INTEGER      NOT NULL,
  idCliente    INTEGER      NOT NULL,
  idFabrica    VARCHAR(20)  NOT NULL,
  idProducto   VARCHAR(20)  NOT NULL,
  fecha_pedido DATE         NOT NULL,
  cantidad     INTEGER      NOT NULL,
  importe      NUMBER(10,2) NOT NULL,
			   FOREIGN KEY (idVendedor) REFERENCES Vendedor(idVendedor),
			   FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
			   FOREIGN KEY (idFabrica, idProducto) REFERENCES Producto(idFabrica, idProducto)
);

INSERT INTO Director(idDirector) VALUES (104);
INSERT INTO Director(idDirector) VALUES (105);
INSERT INTO Director(idDirector) VALUES (106);
INSERT INTO Director(idDirector) VALUES (108);

INSERT INTO Oficina(idOficina, idDirector, ciudad, region, objetivo, ventas) VALUES(12,104,'Chicago','Este',800000,735042);
INSERT INTO Oficina(idOficina, idDirector, ciudad, region, objetivo, ventas) VALUES(13,105,'Atlanta','Este',350000,367911);
INSERT INTO Oficina(idOficina, idDirector, ciudad, region, objetivo, ventas) VALUES(11,106,'New York','Este',575000,692637);
INSERT INTO Oficina(idOficina, idDirector, ciudad, region, objetivo, ventas) VALUES(21,108,'Los Angeles','Oeste',725000,835915);
INSERT INTO Oficina(idOficina, idDirector, ciudad, region, objetivo, ventas) VALUES(22,108,'Denver','Oeste',300000,186042);

INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(104,'Bob Smith',33,12,'Dir ventas','1987-05-19',200000,142594,NULL);
INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(105,'Bill Adams',37,13,'Rep ventas','1988-02-12',350000,367911,NULL);
INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(106,'Sam  Clark',52,11,'VP ventas','1988-06-14',275000,299912,NULL);
INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(107,'Nancy Angelli',49,22,'Rep Ventas','1988-11-14',300000,186042,106);				
INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(108,'Larry Fitch',62,21,'Dir ventas','1989-10-12',350000,361865,NULL);
INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(109,'Mary Jones',31,11,'Rep ventas','1999-10-12',300000,392725,106);
INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(110,'Tom Snyder',41,NULL,'Rep ventas','1990-10-13',NULL,75985,108);						
INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(101,'Dan Roberts',45,12,'Rep ventas','1986-10-20',300000,305673,108);
INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(102,'Sue Smith',48,21,'Rep ventas','1986-12-10',350000,474050,104);
INSERT INTO Vendedor(idVendedor, nombre, edad, idOficina, titulo, contrato, cuota, ventas, idVendedorJefe) VALUES(103,'Paul Cruz',29,12,'Rep ventas','1987-03-01',275000,286775,105);

INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2111,'JCP Inc.',103,50000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2102,'First Corp.',101,65000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2103,'Acme Mfg.',105,50000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2123,'Carter & Sons',102,40000); 
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2107,'Ace INTernational',110,35000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2115,'Smithson Corp.',101,20000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2101,'Jones Mfg.',106,65000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2112,'Zetacorp',108,50000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2121,'QMA Assoc.',103,45000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2114,'Orion Corp',102,20000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2124,'Peter Brothers',107,40000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2108,'Holm & Landis',109,55000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2117,'J.P. Sinclair',106,35000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2122,'Three-Way Lines',105,30000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2120,'Rico Enterprises',102,50000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2106,'Fred Lewis Corp.',102,65000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2119,'Solomon Inc.',109,25000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2118,'Midwest Systems',108,60000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2113,'Ian & Schmidt',104,20000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2109,'Chen Associates',103,25000);
INSERT INTO Cliente(idCliente, empresa, idVendedor, limite_credito) VALUES(2105,'AAA Investments',101,45000);

INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('REI','2A45C','Union Trinquete',79,210);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('ACI','4100Y','Desmontador',2750,25);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('QSA','XK47','Reductor',355,38);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('BIC','41672','Placa',180,0);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('IMM','779C','Abrazadera 900-Lb',1875,9);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('ACI','41003','Articulo Tipo 3',107,207);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('ACI','41004','Articulo Tipo 4',117,139);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('BIC','41003','Tirador',652,3);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('IMM','887P','Perno Abrazadera',250,24);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('QSA','XK48','Reductor',134,203);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('REI','2A44L','Bisagra Izqda.',4500,12);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('FEA','112','Cubierta',148,115);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('IMM','887H','Soporte Abrazadera',54,223);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('BIC','41089','Reten',225,78);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('ACI','41001','Articulo Tipo 1',55,277);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('IMM','775C','Abrazadera 500-Lb',1425,5);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('ACI','4100Z','Montador',2500,28);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('QSA','XK48A','Reductor',117,37);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('ACI','41002','Articulo Tipo 2',76,167);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('REI','2A44R','Bisagra Dcha.',4500,12);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('IMM','773C','Abrazadera 300-Lb',975,28);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('ACI','4100X','Ajustador',25,37);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('FEA','114','Bancada Motor',243,15);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('IMM','887X','Reten Abrazadera',475,32);
INSERT INTO Producto(idFabrica, idProducto, descripcion, precio, existencia)  VALUES('REI','2A44G','Pasador Bisagra',350,14);

INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112961,106,2117,'REI','2A44L','1989-12-17',7,31500);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113012,105,2111,'ACI','41003','1990-01-11',35,3745);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112989,106,2101,'FEA','114','1990-01-03',6,1458);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113051,108,2118,'QSA','XK47','1990-02-10',4,1420);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112968,101,2102,'ACI','41004','1989-10-12',34,3978);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(110036,110,2107,'ACI','4100Z','1990-01-30',9,22500);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113045,108,2112,'REI','2A44R','1990-02-02',10,45000);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112963,105,2103,'ACI','41004','1989-12-17',28,3276);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113013,108,2118,'BIC','41003','1990-01-14',1,652);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113058,109,2108,'FEA','112','1990-02-23',10,1480);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112997,107,2124,'BIC','41003','1990-01-08',1,652);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112983,105,2103,'ACI','41004','1989-12-27',6,702);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113024,108,2114,'QSA','XK47','1990-01-21',20,7100);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113062,107,2124,'FEA','114','1990-02-24',10,2430);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112979,102,2114,'ACI','4100Z','1989-10-12',6,15000);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113027,105,2103,'ACI','41002','1990-01-22',54,4104);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113007,108,2112,'IMM','773C','1990-01-08',3,2925);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113069,107,2109,'IMM','775C','1990-03-02',22,31350);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113034,110,2107,'REI','2A45C','1990-01-29',8,632);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112992,108,2118,'ACI','41002','1989-11-04',10,760);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112975,103,2111,'REI','2A44G','1989-10-12',6,2100);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113055,101,2108,'ACI','4100X','1990-02-15',6,150);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113048,102,2120,'IMM','779C','1990-02-10',2,3750);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112993,102,2106,'REI','2A45C','1989-01-04',24,1896);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113065,102,2106,'QSA','XK47','1990-02-27',6,2130);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113003,109,2108,'IMM','779C','1990-01-25',3,5625);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113049,108,2118,'QSA','XK47','1990-02-10',2,776);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(112987,105,2103,'ACI','4100Y','1989-12-31',11,27500);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113057,103,2111,'ACI','4100X','1990-02-18',24,600);
INSERT INTO Pedido(idPedido, idVendedor, idCliente, idFabrica, idProducto, fecha_pedido, cantidad, importe)  VALUES(113042,101,2113,'REI','2A44R','1990-02-02',5,22500); 

-- ACTIVAR LA FUNCIN DE SUSTITUCION DE VARIABLE EN TU SESION
SET DEFINE ON;
