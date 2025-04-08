****************
***   0001   ***   ESQUEMA DE LA BASE DE DATOS
****************
-- ------------------------------
-- ESTRUCTURA DE LA BASE DE DATOS
-- ------------------------------

DROP USER HR CASCADE;
CREATE USER HR IDENTIFIED BY HR;
GRANT CONNECT,RESOURCE,dba TO HR;
GRANT UNLIMITED TABLESPACE TO HR;
ALTER PROFILE DEFAULT LIMIT PASSWORD_REUSE_TIME UNLIMITED;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

CONNECT HR/HR@LOCALHOST:1521/XEPDB1

-- Tabla de Departamentos
CREATE TABLE departamentos (
    departamento_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    ubicacion VARCHAR2(100),
    presupuesto_anual NUMBER(12,2)
);

-- Tabla de Empleados
CREATE TABLE empleados (
    empleado_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    apellido VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    salario NUMBER(10,2),
    fecha_contratacion DATE,
    departamento_id NUMBER REFERENCES departamentos(departamento_id),
    jefe_id NUMBER REFERENCES empleados(empleado_id)
);

-- Tabla de Proyectos
CREATE TABLE proyectos (
    proyecto_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL,
    descripcion VARCHAR2(500),
    fecha_inicio DATE,
    fecha_fin_estimada DATE,
    presupuesto NUMBER(15,2),
    departamento_responsable NUMBER REFERENCES departamentos(departamento_id)
);

-- Tabla de Asignación de Empleados a Proyectos
CREATE TABLE empleados_proyectos (
    empleado_id NUMBER REFERENCES empleados(empleado_id),
    proyecto_id NUMBER REFERENCES proyectos(proyecto_id),
    horas_asignadas NUMBER(5,2),
    rol VARCHAR2(50),
    PRIMARY KEY (empleado_id, proyecto_id)
);

-- Tabla de Historial Salarial
CREATE TABLE historial_salarial (
    historial_id NUMBER PRIMARY KEY,
    empleado_id NUMBER REFERENCES empleados(empleado_id),
    salario_anterior NUMBER(10,2),
    salario_nuevo NUMBER(10,2),
    fecha_cambio DATE,
    motivo VARCHAR2(200)
);

-- Tabla de Clientes
CREATE TABLE clientes (
    cliente_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL,
    direccion VARCHAR2(200),
    telefono VARCHAR2(20),
    email VARCHAR2(100),
    fecha_registro DATE
);

-- Tabla de Pedidos
CREATE TABLE pedidos (
    pedido_id NUMBER PRIMARY KEY,
    cliente_id NUMBER REFERENCES clientes(cliente_id),
    fecha_pedido DATE,
    estado VARCHAR2(20),
    total NUMBER(12,2)
);

-- Tabla de Productos
CREATE TABLE productos (
    producto_id NUMBER PRIMARY KEY,
    nombre VARCHAR2(200) NOT NULL,
    descripcion VARCHAR2(500),
    precio NUMBER(10,2),
    stock NUMBER(8),
    categoria VARCHAR2(50)
);

-- Tabla de Detalles de Pedido
CREATE TABLE detalles_pedido (
    detalle_id NUMBER PRIMARY KEY,
    pedido_id NUMBER REFERENCES pedidos(pedido_id),
    producto_id NUMBER REFERENCES productos(producto_id),
    cantidad NUMBER(8),
    precio_unitario NUMBER(10,2),
    descuento NUMBER(5,2)
);

-- Secuencias para IDs autoincrementales
CREATE SEQUENCE seq_departamentos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_empleados START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_proyectos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_historial START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_pedidos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_productos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_detalles START WITH 1 INCREMENT BY 1;

-- -----
-- DATOS
-- -----

-- Inserts corregidos con formato YYYY-MM-DD
-- Clientes
INSERT INTO clientes VALUES (seq_clientes.NEXTVAL, 'Corporación ABC', 'Calle Principal 123', '555-1234', 'contacto@abc.com', TO_DATE('2022-01-10', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_clientes.NEXTVAL, 'Empresa XYZ', 'Avenida Central 456', '555-5678', 'info@xyz.com', TO_DATE('2022-03-15', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_clientes.NEXTVAL, 'Tienda 123', 'Boulevard Norte 789', '555-9012', 'ventas@tienda123.com', TO_DATE('2022-05-20', 'YYYY-MM-DD'));

-- Empleados
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, 'Juan', 'Perez', 'jperez@empresa.com', 45000, TO_DATE('2018-06-15', 'YYYY-MM-DD'), 1, NULL);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, 'Maria', 'Gomez', 'mgomez@empresa.com', 55000, TO_DATE('2017-03-20', 'YYYY-MM-DD'), 2, 1);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, 'Carlos', 'Lopez', 'clopez@empresa.com', 38000, TO_DATE('2019-11-10', 'YYYY-MM-DD'), 1, 1);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, 'Ana', 'Martinez', 'amartinez@empresa.com', 62000, TO_DATE('2016-05-05', 'YYYY-MM-DD'), 3, NULL);
INSERT INTO empleados VALUES (seq_empleados.NEXTVAL, 'Luis', 'Rodriguez', 'lrodriguez@empresa.com', 48000, TO_DATE('2018-09-12', 'YYYY-MM-DD'), 2, 2);

-- Proyectos
INSERT INTO proyectos VALUES (seq_proyectos.NEXTVAL, 'Sistema de Ventas', 'Desarrollo de nuevo sistema de ventas online', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-06-30', 'YYYY-MM-DD'), 120000, 2);
INSERT INTO proyectos VALUES (seq_proyectos.NEXTVAL, 'Campaña Publicitaria', 'Campaña de marketing para nuevo producto', TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), 75000, 4);
INSERT INTO proyectos VALUES (seq_proyectos.NEXTVAL, 'Optimización Financiera', 'Proyecto para optimizar procesos financieros', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 90000, 5);

-- Historial Salarial
INSERT INTO historial_salarial VALUES (seq_historial.NEXTVAL, 2, 50000, 55000, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Aumento por desempeño');
INSERT INTO historial_salarial VALUES (seq_historial.NEXTVAL, 5, 45000, 48000, TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'Ajuste salarial');

-- Pedidos
INSERT INTO pedidos VALUES (seq_pedidos.NEXTVAL, 1, TO_DATE('2023-03-05', 'YYYY-MM-DD'), 'Completado', 2400);
INSERT INTO pedidos VALUES (seq_pedidos.NEXTVAL, 2, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'En proceso', 1250);
INSERT INTO pedidos VALUES (seq_pedidos.NEXTVAL, 3, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 'Pendiente', 700);

-- Departamentos
INSERT INTO departamentos VALUES (seq_departamentos.NEXTVAL, 'Ventas', 'Piso 1', 500000);
INSERT INTO departamentos VALUES (seq_departamentos.NEXTVAL, 'IT', 'Piso 2', 750000);
INSERT INTO departamentos VALUES (seq_departamentos.NEXTVAL, 'RRHH', 'Piso 1', 300000);
INSERT INTO departamentos VALUES (seq_departamentos.NEXTVAL, 'Marketing', 'Piso 3', 450000);
INSERT INTO departamentos VALUES (seq_departamentos.NEXTVAL, 'Finanzas', 'Piso 3', 600000);

-- Asignación de empleados a proyectos
INSERT INTO empleados_proyectos VALUES (2, 1, 20, 'Desarrollador Líder');
INSERT INTO empleados_proyectos VALUES (5, 1, 15, 'Desarrollador Backend');
INSERT INTO empleados_proyectos VALUES (1, 2, 10, 'Consultor');
INSERT INTO empleados_proyectos VALUES (3, 2, 25, 'Coordinador');
INSERT INTO empleados_proyectos VALUES (4, 3, 5, 'Auditor');

-- Historial Salarial
INSERT INTO historial_salarial VALUES (seq_historial.NEXTVAL, 2, 50000, 55000, TO_DATE('01/01/2023', 'DD/MM/YYYY'), 'Aumento por desempeño');
INSERT INTO historial_salarial VALUES (seq_historial.NEXTVAL, 5, 45000, 48000, TO_DATE('15/02/2023', 'DD/MM/YYYY'), 'Ajuste salarial');

-- Productos
INSERT INTO productos VALUES (seq_productos.NEXTVAL, 'Laptop Elite', 'Laptop de alta gama para profesionales', 1200, 50, 'Tecnología');
INSERT INTO productos VALUES (seq_productos.NEXTVAL, 'Teléfono Inteligente', 'Último modelo con cámara profesional', 800, 100, 'Tecnología');
INSERT INTO productos VALUES (seq_productos.NEXTVAL, 'Mesa Ejecutiva', 'Mesa de oficina de madera maciza', 450, 20, 'Mobiliario');
INSERT INTO productos VALUES (seq_productos.NEXTVAL, 'Silla Ergonómica', 'Silla de oficina con soporte lumbar', 250, 30, 'Mobiliario');

-- Detalles de pedido
INSERT INTO detalles_pedido VALUES (seq_detalles.NEXTVAL, 1, 1, 2, 1200, 0);
INSERT INTO detalles_pedido VALUES (seq_detalles.NEXTVAL, 2, 3, 1, 450, 0);
INSERT INTO detalles_pedido VALUES (seq_detalles.NEXTVAL, 2, 4, 2, 250, 50);
INSERT INTO detalles_pedido VALUES (seq_detalles.NEXTVAL, 3, 2, 1, 800, 100);

COMMIT;