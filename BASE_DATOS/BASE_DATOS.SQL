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

















