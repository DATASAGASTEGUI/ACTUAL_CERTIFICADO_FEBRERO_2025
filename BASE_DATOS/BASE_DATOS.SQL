DEFINICIONES
------------

DATO: 3, VIERNES, JUAN, DULCE 
Representación simbolica: Letras, dígitos, imagen.


INFORMACION O CONOCIMIENTO

EDAD_INFANTE = 3

METADATOS: DESCRIPCIONES DEL DATO
RANGO: 0 - 9
TIPO DATOS: ENTERO

REGISTRO:
ID_INFANTE (PK)
EDAD
NOMBRE
ESTATURA: 1.72 (ATOMICO)
DIRECCION: NUMERO-CALLE-CODIGO_POSTAL (NO ATOMICO)

TABLA: CONJUNTO DE REGISTROS
BASE DATOS = CONJUNTO DE TABLAS

INFORMACION = ATRIBUTO + DATO

NORMALIZACION (FORMA DE OPTIMIZAR UNA BASE DE DATOS)
-------------
EVITAMOS REDUNDANCIA
MANTER LA INTEGRIDAD DE LOS DATOS

MODELO ENTIDAD RELACION
-----------------------

ALUMNO                             
------                             
ID_ALUMNO NOMBRE DIRECCION  
A1        Luis   yyyyyyy   

ASIGNATURAS
-----------
ID_CURSO DESCRIPCION
C1       Matemática
C2       Física
C3       Religión
C4       CINCIAS NATURALES

MATRICULA
---------
ID_ALUMNO ID_CURSO
A1        C1
A1        C2
A1        C3

SQL: LENGUAJE DE CONSULTA ESTRUCTURADA

---------------------------------------------------------------------------------
DOCUMENTO DE PEDIDO A NORMALIZAR
--------------------------------
Id_Pedido: ------
Nombre-Cliente   Teléfono: 1 ------
------                     2 ------

Id_Producto Producto Cantidad Precio-Unitario Nombre-Proveedor Teléfono-Proveedor
------      ------   ------   ------          ------           ------
------      ------   ------   ------          ------           ------
------      ------   ------   ------          ------           ------ 
--------------------------------------------------------------------------------- 

1 FORMA NOMRAL
--------------
No tiene campos repetidos

2 FORMA NORMAL
--------------
Conseguir dependencia funcional completa
(Eliminar las dependencias parciales)

3 FORMA NORMAL
--------------
ELIMINAR LA TRANSITIVIDAD
(CAMPOS NO CLAVES DEPENDEN DE OTROS CAMPOS NO CLAVE)

Tabla original (sin normalizar):
Una tienda guarda los siguientes datos de sus ventas en una sola tabla:

VentaID | ClienteNombre | ClienteTel | Producto1 | Precio1 | Producto2 | Precio2
1 		| Ana Pérez 	| 123456789 | Ratón 	 | 20 	   | Teclado   | 30
2 		| Juan López 	| 987654321 | Monitor 	 | 150     | NULL      | NULL


Tu reto:
Paso 1 (1FN): Quita columnas repetidas o con múltiples valores por fila.

Paso 2 (2FN): Separa los datos que no dependan completamente de la clave primaria.

Paso 3 (3FN): Elimina dependencias transitivas (por ejemplo, precio de productos).

PedidoID | FechaPedido | ClienteNombre | ClienteEmail | Producto1 | Precio1 | Producto2 | Precio2 | Producto3 | Precio3
101 | 2025-04-01 | Laura Gómez | laura@gmail.com | Silla | 50 | Mesa | 150 | NULL | NULL
102 | 2025-04-02 | Pedro Ramírez | pedro@gmail.com | Lámpara | 30 | Silla | 50 | Escritorio | 200
103 | 2025-04-03 | Ana Torres | ana@gmail.com | Mesa | 150 | NULL | NULL | NULL | NULL



TIPOS DE RELACIONES ENTRE ENTIDADES
-----------------------------------
UNO A UNO
UNO A MUCHOS
MUCHOS A MUCHOS

UNO A UNO
---------

Empleado              NumeroSeguridadSocial
1                     1
1                     1
--------------------------------------------------------------------------------
Coche(id_coche,matricula, marca, modelo, color,precio_venta)
Cliente(id_cliente,nif,nombre,direccion,ciudad,telefono)
Revision(id_revision,descripcion)  
         1           "Cambio de filtro"
		 2           "Cambio de Aceite"
		 3           "Cambio de Frenos u otros"

Cliente     Coche (Uno a Muchos)
1           1..N
1           1

Revision    Coche (Muchos A Muchos)
1           1..N
1..N        1




--------------------------------------------------------------------------------


















