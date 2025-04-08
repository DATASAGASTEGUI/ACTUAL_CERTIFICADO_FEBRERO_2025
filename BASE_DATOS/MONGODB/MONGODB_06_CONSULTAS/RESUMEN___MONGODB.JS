
****************
***   0001   *** BASE DE DATOS SQL VS BASE DE DATOS NOSQL
****************

-------------------------------------------------------------------------------
SQL (STRUCTURE QUERY LANGUAGE)
    (LENGAUJE DE CONSULTA ESTRUCTURADA)

Read
Insert
Update
Delete
-------------------------------------------------------------------------------
RDBMS (RELATIONAL DATABASE MANAGEMENT SYSTEM) 
      (SISTEMA ADMINISTRADOR DE BASE DE DATOS RELACIONAL)
	
DEFINICIO DE RDBMS
------------------	
Es un tipo de sistema de gestión de bases de datos que utiliza el modelo
relacional para organizar y gestionar datos. Aquí tienes algunos ejemplos
populares de RDBMS:	

EJEMPLOS DE RDBMS
-----------------

(1) MYSQL

Desarrollador: Oracle Corporation.
Descripción: MySQL es un sistema de gestión de bases de datos de código abierto muy popular. Es conocido por ser rápido, fiable y fácil de usar. Se utiliza ampliamente en aplicaciones web.

(2) ORACLE DATABASE

Desarrollador: Oracle Corporation.
Descripción: Oracle Database es un sistema de gestión de bases de datos empresarial que ofrece un rendimiento escalable y características avanzadas. Es utilizado en grandes empresas y organizaciones.

(3) MICROSOFT SQL SERVER

Desarrollador: Microsoft Corporation.
Descripción: SQL Server es un sistema de gestión de bases de datos desarrollado por Microsoft. Es utilizado en entornos empresariales y es compatible con sistemas operativos Windows.

(4) POSTGRESQL

Desarrollador: PostgreSQL Global Development Group.
Descripción: PostgreSQL es un sistema de gestión de bases de datos de código abierto y orientado a objetos. Es conocido por su conformidad con los estándares y su capacidad de extensión.

(5) SQLITE

Desarrollador: SQLite Consortium.
Descripción: SQLite es una biblioteca de gestión de bases de datos relacional que no requiere un servidor. Es ligero y se utiliza a menudo en aplicaciones integradas y en dispositivos móviles.

(6) IBM DB2

Desarrollador: IBM Corporation.
Descripción: Db2 es un sistema de gestión de bases de datos relacional desarrollado por IBM. Se utiliza en entornos empresariales y es conocido por su escalabilidad y capacidad de manejar grandes volúmenes de datos.

(7) MARIADB

Desarrollador: MariaDB Foundation.
Descripción: MariaDB es un sistema de gestión de bases de datos de código abierto que se bifurcó de MySQL. Ofrece compatibilidad con MySQL y se centra en la transparencia y la libertad del usuario.

Estos son solo algunos ejemplos de sistemas de gestión de bases de datos relacionales. La elección del RDBMS dependerá de los requisitos específicos de tu aplicación y del entorno en el que estés trabajando.
-------------------------------------------------------------------------------
Los datos se guardan en tablas, las cuales esta formado por filas y columnas.
Una base de datos es un conjunto de tablas relacionadas entre si.

Pais(idPais, nombre)
Pasajero(idPasajero,nombre,apaterno,amaterno,tipo_documento,num_documento,fecha_nacimiento,idPais,telefono, email,clave)
Pago(idPago,idReserva,fecha,idPasajero,monto,tipo_comprobante,num_comprobante,impuesto)

-------------------------------------------------------------------------------
BASE DE DATOS SQL
VENTAJAS
--------
Evitar la duplicidad de datos.
Mayor soporte: Al estar un mayor tiempo en el mercado la mayoria de sus problemas ya han sido solucionados los cuales se encuentran ya publicados en internet.
Atomicidad de la información
Sistema estandar bien definido (SQL)
-------------------------------------------------------------------------------
BASE DE DATOS NOSQL

No tienen una estructura bien definida para read, insert, update y delete para
lo cual se hace uso de APIs (Application Programming Interfaces) y cada api
tiene su propia documentación.

Cada base de datos trabaja bajo sus propias reglas.

Base de datos clave-valor
Base de datos de documentos
Base de datos orientado a datos

Las mas conocidas son: mongoDB, cassandra, redis, couchDB y neo4j

VENTAJAS BASE DE DATOS NOSQL
----------------------------
Versatilidad: Podemos agregar información o hacer cambios en el sistema¡ sin necesidad de agregar configuraciones extras

Soporta crecimiento horizontal: Al permitir estructuras distribuidas nos permite agregar nuevos nodos que balance la carga de trabajo. 

Permite guardar cualquier tipo de dato en cualquier momento sin pedir alguna verificación.

Permite hacer consultas utilizando JSON.
-------------------------------------------------------------------------------
DIFERENCIAS ENTRE BASE DE DATOS SQL VS BASE DE DATOS NOSQL

SQL

Son adecuados para base de datos no extremadamente grandes y que tengan una estructura
Capacidad escalar bajar
Son base de datos que estan centralizadas
Adaptación a los cambios: Cuando los cambios son pocos
Estandarización: Cuando tenemos un modelo de negocio bien definido no hay cambios en el modelo
Aplicaciones: Se utilizan en multiple proyectos de distintos tipos
Consistencia de los datos: Son consistentes al no buscar la rapidez se enfoca mas en la integridad de los datos.
Rapidez: Al ser estructuradas se consiguen menos rapidez.

NOSQL

Son adecuados para base de datos extremadamente grandes y que no tengan una estructura
Capacidad escalar alta (esta pensada en bigdata)
Son base de datos que estan distribuidas
Adaptación a los cambios: Cuando los cambios son elevados
Estandarización: Crecen de manera homogenea
Aplicaciones: Se emplean principalmente en proyectos de bigdata por ejemplo al manejar una gran cantidad de datos de una red social.
Consistencia de los datos: Al buscar la rapidez no se centra en la consistencia de los datos.
Rapidez: Al no ser estrucutradas se consigue mayor rapidez
-------------------------------------------------------------------------------
CUANDO UTILIZAR BASE DE DATOS SQL O BASE DE DATOS NOSQL

SQL

El volumen de los datos no tendrá un gran crecimiento. Por ejemplo sistemas de inventarios.
Cantidad de usuarios que acceden a la base de datos éste previsto. Saber cuantas personas van acceder a la base de datos.
Necesidades de procesamiento en un único servidor.

NOSQL

Crecimiento de base de datos de forma rápida. Por ejemplo aplicaciones moviles que usan aplicaciones de internet de las cosas que trabajan con sensores que estan recopilando datos en tiempo real o bigdata.

Múltiples accesos a la base de datos en distintas ocaciones.

Las necesidades de procesamiento no se puede prevenir. Cuando se necesita expandirse los datos muy rapidamente.


-------------------------------------------------------------------------------
****************
***   0002   *** TIPOS DE BASE DE DATOS NOSQL
****************

Base de datos Clave-Valor: Redis, Amazon DynamoDB
Base de datos Documentales: MongoDB, Elastic, Couchbase
Base de datos Grafos: Amazon Neptune, neo4j
Base de datos Columnas: Cassandra, Amazon Redshift, Apache Hbase


****************
***   0002   *** QUE ES MONGODB
****************

-------------------------------------------------------------------------------
QUE ES MONGODB

Es una base de datos nosql orientada a documentos.
Es de código abierto y escalable.
Diseñada para manejar grandes volumenes de datos con un alto rendimiento.
La empresa que desarrollo la base de datos mongodb tiene el mismo nombre mongodb.
Los documentos que se guardan en la base de datos mongodb son similares a una estrucutra json.
Los valores pueden ser de cualquier tipo cadenas, numeros, listas, subdocumentos entre otros.
La estructura de una colección pueden tener estructuras diferentes.
Las base de datos mongodb se pueden utilizar en estructuras modernas como: Aplicaciones Web, Aplicaciones Movil, Sistema de registros de eventos, Analisis de datos, Aplicaciones de IoT o también llamado internet de las cosas.
MongoDB tiene su propio lenguaje de consultas llamado "MongoDB Query" o por su abreviatura "MQL" 
-------------------------------------------------------------------------------
COMO FUNCIONA

SQL
---
DataBase: Aerolinea
Table: Usuario, Vuelo
Row: Nombre Edad
     Carlos 30
	 Carla  Nul



MongoDB
-------
DataBase: Aerolinea
Collection: Usuario, Vuelo
Document: {Nombre: 'Carlos', Edad: 30}
          {Nombre: 'Carla', Apellido: 'Grant'}    Esto es flexibilidad lo que en sql se puede hacer pero es mas complejo hacerlo.

-------------------------------------------------------------------------------
ESTRUCTURA DE UN JSON (BSON)

{
   "nombre": "Hugo",
   "edad": "40",
   "direccion":
              {
			     "pais": "Perú",
				 "ciudad": "Lima"
		      },
   "deporte":
            [
			    {"nombre": "Fútbol"},          subdocumentos
				{"nombre": "Natación"},
				{"nombre": "Voley"}
			]
}



}



-------------------------------------------------------------------------------
Distintos gestores de base de datos relacionales: SQL Server, MySQL, Oracle, entre otros


****************
***   0003   *** INSTALACION DE MONGODB
****************

--------------------------------------------------------------------------------
- DESCARGAR EL INSTALADOR DEL SERVIDOR MONGODB

* Ir a la siguiente url https://www.mongodb.com/es
* Luego al enlace del menú "Productos"
* Luego al enlace "Community Edition"
* Nos sale "MongDB Community Edition", abajo esta el botón "Download Community"
* Nos sale "Try MongoDB Community Edition" abajo "MongoDB Community Server Download" ir mas abajo
* Hacer clic en "Versión" --> Version: 7.0.9(current), Platform: Windows x64, Package(msi) 
* Finalmente en el botón "Download" lo que se descarga es un archivo .msi (Es un ejecutable)
* El archivo que se descargo es: mongodb-windows-x86_64-7.0.9-signed.msi
* Hacemos doble clic en el archivo mongodb-windows-x86_64-7.0.9-signed.msi y listo siguiente siguiente y se instala.
--------------------------------------------------------------------------------


MongoDB Sever	: Servidor
Mongo Shell		: Cliente   (Interface de JavaScript interactiva)            Es el cliente que interactuca con el servidor

Instalación como servicio
Instalación sin servicio


Los tres sistemas operativos: Windows, Linux, Mac



https://www.mongodb.com/try/download/shell


mongosh --help
mongosh --version

mongosh
test> help
test> show dbs                 Mostrar las base de datos
test> db.help()                Métodos que puedo ejecutar en la base de datos
test> db.getName()             Ejemplo de uso de uno de los métodos de la lista anterior: Nombre de la base de datos que estamos utilizando.

test> db                       Que base de datos estamos utilizando, en este caso es la base de datos llamada test que es una base de datos temporal.

test> use admin                Cambiamos a modo administrador. El prompto cambia de test> a admin>

admin> db.shutdownServer()     Apagar el servidor de mongodb
admin> show dbs                No debería responder porque el servidor esta apagado.
admin> quit                    Salir del mongo shell.


127.0.0.1:27017                Este es el puerto por defecto por donde sale el servidor. En otras palabras por donde se conecta el servidor mongodb. El 27017 es el puerto por defecto.

c:\mongosh                     Esto falla porque el servidor mongodb no esta levantado=iniciado


mongod --port 27018
mongosh --port 27018
-------------------------------------------------------------------------------
CONFIGURAR MONGO Shell



-------------------------------------------------------------------------------

****************
***   0004   ***   JSON
****************

-------------------------------------------------------------------------------
QUE ES UN JSON
--------------

La palabra json significa "JavaScript Object Notation" (Notación de Objetos de JavaScript, en español).
Es un formato ligero y versatil de intercambio de datos que es fácil de leer y escribir para los humanos, y fácil de interpretar y generar para las máquinas. Por eso es ampliamente utilizado en el desarrollo de software para el intercambio de información entre sistemas.
JSON se utiliza comúnmente para transmitir datos entre un servidor y una aplicación web como una alternativa a XML

CARACTERISTICAS DE JSON
-----------------------

(1) Estructura de Datos: JSON se basa en dos estructuras de datos principales:

Objetos: Conjuntos no ordenados de pares clave-valor, donde las claves son cadenas y los valores pueden ser objetos, matrices, números, cadenas, booleanos o null.
Arrays: Listas ordenadas de valores.

(2) Sintaxis Simple: La sintaxis de JSON es sencilla y fácil de entender. 

Aquí hay un ejemplo básico de un objeto JSON:

{
  "idAlumno": "A001",
  "nombre": "Luis",
  "edad": 25,
  "estatura": 1.72,
  "direccion": {"calle": "Juan de la Sierva 123", "ciudad": "Madrid", "pais": "España", "cp": 28035},
  "jobis": ["Ajedrez", "Leer", "Cine"]
  "casado": false,
  "formacion": null
}

Aquí hay un ejemplo básico de un arreglo de objetos JSON:

[
  {
    "idAlumno": "A001",
	"nombre": "Juan",
    "edad": 28
  },
  {
    "idAlumno": "A002",
    "nombre": "Maria",
    "edad": 35
  },
  {
    "idAlumno": "A003",
    "nombre": "Carlos",
    "edad": 22
  }
]

(3) Interoperabilidad: JSON se utiliza en una variedad de lenguajes de programación y es compatible con la mayoría de los lenguajes de programación modernos.

(4) Ligero: Es más ligero en comparación con XML, lo que lo hace eficiente en la transmisión de datos a través de la red.

(5) Independiente del Lenguaje: JSON es independiente del lenguaje, lo que significa que puede ser utilizado por prácticamente cualquier lenguaje de programación.

EJEMPLO

FRONTEND               BACKEND
PHP      <---JSON--->  PYTHON

El intercambio de información se puede usar json, por lo que json es un formato independiente de los lenguajes de programación
-------------------------------------------------------------------------------
REPRESENTAR UN DOCUMENTO JSON

{
  "nombre": "Carla",
  "bebida": "Café Expreso",
  "cantidad": 2,
  "stock": 80,
  "disponible": true
}

REPRESENTAR VARIOS DOCUMENTOS JSON

[
    {
        "nombre" : "Jhon",
        "bebida" : "Café Americano ",
        "cantidad" : 3,
        "stock" : 0,
        "disponible" : false
    },
    {
        "nombre" : "Jhon",
        "bebidas" : "Café Latte ",
        "cantidad" : 1,
        "stock" : 15,
        "disponible" : true
    }
]
-------------------------------------------------------------------------------

****************
***   0005   ***   CONCEPTOS DE UNA BASE DE DATOS MONGODB
****************

			 MONGODB(NOSQL)                         MYSQL(SQL)
DataBase   : Conjunto de  Collections				DataBase : Conjunto de Tables (Tablas)      
Document   : Conjunto clave-valor                   Registro : Conjunto de Fields (Campos)       
Collection : Conjunto de Documents                  Tabla    : Conjunto de Rows   (Filas)


Primero se crea la base de datos
Luego se crea la coleccion
Por último se crea los documentos que tendra nuestra colección

***************
***   003   ***   CREAR UNA BASE DE DATOS MONGODB
***************

Levantar una consola cmd, para lo cual ejecutamos el archivo: DOS.BAT
Escribimos en el prompt dos: CLIENTE.BAT
El prompt ahora cambia a test>

Comandos que se puedes escribir en prompt test> db  (Ver en cual base de datos me encuentro"
											    show dbs (Ver las bases de datos que se instalan por defecto durante la instalacion de mogodb)


- VER EN CUAL BASE DE DATOS ME ENCUENTRO

test> db

El prompt ya me dice en que base me encuentro por lo que el comando db también dara el mismo resultado test.

- LAS BASES DE DATOS QUE SE INSTALAN POR DEFECTO DURANTE LA INSTALACION DE MONGODB

admin
config
local

Estas bases de datos son críticas y nunca hay que posicionarnos en ninguna de ellas y es por eso que cuando levantamos el shell de mogodb se posiciona por defecto en la base de datos test y esto se ve en el prompt test>

- ES OPCIONAL EL PONER EL PUNTO Y COMA AL FINAL DE UN COMANDO QUE SE ESCRIBA EN EL SHELL DE MONGODB

test> show dbs
test> show databases
test> show dbs;
test> show databases;

Estos 4 comandos hacen los mismo que es mostrar todas las base de datos que existen en mongodb. Cuando es la primera vez que se usa mongodb por defecto son 3: admin, config, local

- LIMPIAR PANTALLA DEL SHELL DE MONGODB

test> cls
test> cls;

- CREAR O CAMBIARSE A UNA BASE DE DATOS

test> use cafeteria01  ---> cafeteria01>

Pero ahora comprobaremos si se ha creado la base de datos cafeteria01  y el siguiente comando nos indica que aun no se ha creado porque sólo siguen aparecienco admin, config, local pero si se ha creado, lo que sucede que se ha creado en la memoria RAM es decir que todavía no se guardado en nuestro disco duro.

cafeteria01> show dbs

Ahora crearemos una colección con un documento y en ese momento ya se guarda en el disco la base de datos por lo que ya aparecería cuando hagamos "cafeteria01> show dbs"

cafeteria01> db.tipoCafe.inserteOne({
  "nombre": "Carla",
  "bebida": "Café Expreso",
  "cantidad": 2,
  "stock": 80,
  "disponible": true
})

- VER LAS COLECCIONES DENTRO DE UNA BASE DE DATOS

cafeteria01> show collections

- VER LOS DOCUMENTOS QUE SE ENCUENTRAN EN UNA COLECCION

cafeteria01> db.tipoCafe.find()

- ESCENARIO: CREAR UNA BASE DE DATOS LUEGO CREAR UNA COLECCION VACIA PARA QUE YA PODAMOS VERLO AL USAR EL COMANDO "show dbs" ES DECIR QUE YA ESTA GUARDADA LA BASE DE DATOS EN EL DISCO DURO

Debe crearse siempre a partir de test

cafeteria01> use test            					(Cambiar a una base de datos)
test> use cafeteria02            					(Crear una base de datos y al crearse también se cambia a dicha base de datos que estamos creando)
cafeteria02> db.createCollection("tipoCafe")        (Crear una coleccion vacia)
cafeteria02> show dbs                               (Ver la base de datos que hemos creado ya guardada en el disco duro)
cafeteria02> show collections                       (Ver las colecciones de una base de datos)
cafeteria02> db.tipoCafe.find()                     (Mostrar los documentos de una coleccion. Si no muestra nada como una linea en blanco es que es una coleccion vacia)

- INSERTAR UNA LISTA DE DOCUMENTOS EN UNA COLECCION

cafeteria02> db.tipoCafe.insertMany([
    {
        "nombre" : "Jhon",
        "bebida" : "Café Americano ",
        "cantidad" : 3,
        "stock" : 0,
        "disponible" : false
    },
    {
        "nombre" : "Jhon",
        "bebidas" : "Café Latte ",
        "cantidad" : 1,
        "stock" : 15,
        "disponible" : true
    }
])

- CREAR UNA VARIABLE Y VAMOS A GUARDAR EN DICHA VARIABLE UN DOCUMENTO, LUEGO USAREMOS DICHA VARIABLE PARA INSERTAR EL DOCUMENTO EN UNA COLECCION

El valor para _id le asignaremos de manera manual y debe ser único.
El valor de _id debe ser único por lo que si intentamos insertar otro documento con el mismo valor en _id nos arrojara un error de duplicidad de key

cafeteria02> var documento = {_id:1, nombre:"Alejandra", bebida: "Cappuccino", cantidad: 2, stock: 12, disponible: true}
cafeteria02> documento
cafeteria02> db.tipoCafe.insertOne(documento)
cafeteria02> db.tipoCafe.find()

- EL VALOR PARA UNA CLAVE _id PUEDE SER TAMBIEN DE OTRO TIPO NO SOLO NUMERICO Y SER DE DISTINTOS TIPOS PARA DICHA CLAVE

Como vemos algunos documentos _id tiene un valor numerico y ahora un valor cadena lo que es valido en mongodb

cafeteria02> db.tipoCafe.insertOne({_id: "Nuevo Id", nombre: "Gary", bebida: "Café Latte", cantidad: 1, stock: 15, disponible: true})

****************
***   0006   ***   JSON VS BSON
****************




****************
***   0007   ***   OPERACIONES CRUD
****************

Son las operaciones que se usan en una base de datos.

Create = Crear
Read = Leer
Update = Actualizar
Delete = Borrar

-------------------------------------------------------------------------------
CREATE

insertOne(data,options)
insertMany(data,options)

READ

find(filter,options)
findOne(filter,options)

UPDATE

updateOne(filter,data,options)
updateMany(filter,data,options)
replaceOne(filter,data,options)

DELETE

deleteOne(filter,options)
deleteMany(filter,options)
-------------------------------------------------------------------------------
READ

test> show dbs
test> use cafeteria02
cafeteria02> show collections
cafeteria02> db.tipoCafe.find()
cafeteria02> db.tipoCafe.find().pretty()      (Ordenar en versiones de mongodb mas antiguas)

CREATE

cafeteria02> db.tipoCafe.insertOne({nombre: "Ana", bebida: "Chocolate con Menta"})      (Podemos insertar documentos no estructurados es decir que no siguen la misma estructura de los documentos anteriores)
cafeteria02> db.tipoCafe.find()                                                         (Mostramos todos los documentos, se muestran el primero en entrar es el primero en salir)

UPDATE

cafeteria02> db.tipoCafe.updateOne({nombre: "Jhon"},{$set:{etiqueta: "Atendido"}})      (El campo etiqueta no existe entonces al no existir se crea)
                                                                                        (Busca el primer documento que encuentre por ser updateOne con la clave nombre y valor Jhon entonce le crea dicha clave con su valor sólo al primer documento que encuentra)
cafeteria02> db.tipoCafe.find()
																						
DELETE

cafeteria02> db.tipoCafe.deleteOne({_id: 1})  (Elimina sólo el primer documento que encuentre que tenga la clave _id con el valor 1)
cafeteria02> db.tipoCafe.find()

cafeteria02> db.tipoCafe.deleteOne({_id: "Nuevo Id"})
cafeteria02> db.tipoCafe.find()

cafeteria02> db.tipoCafe.deleteMany({})       (Eliminar todos los documentos de una colección)
cafeteria02> db.tipoCafe.find()               (Mostrar todos los documentos de una colección)
-------------------------------------------------------------------------------

****************
***   0008   ***   PROFUNDIZANDO SOBRE INSERTONE Y INSERMANY
****************

-------------------------------------------------------------------------------
test> use cafeteria02							(Usar la base de datos cafeteria02)
cafeteria02> show collections       			(Mostrar las colecciones de la base de datos cafeteria02)
cafeteria02> db.tipoCafe.find()     			(Mostrar todos los documentos de la colección tipoCafe)
cafeteria02> db.tipoCafe.insertOne({
  "nombre": "Carla",
  "bebida": "Café Expreso",
  "cantidad": 2,
  "stock": 80,
  "disponible": true
})												(Insertar un documento en la colección tipoCafe de la base de datos cafeteria02)

cafeteria02> db.tipoCafe.insertMany([
    {
        "nombre" : "Jhon",
        "bebida" : "Café Americano ",
        "cantidad" : 3,
        "stock" : 0,
        "disponible" : false
    },
    {
        "nombre" : "Jhon",
        "bebidas" : "Café Latte ",
        "cantidad" : 1,
        "stock" : 15,
        "disponible" : true
    },
	{
	    "nombre": "Ana",
		"bebidas": "Café Latte",
		"disponible": true
	}
])												(Insertar varios documentos en la coleccion tipoCafe de la base de datos cafeteria02)

cafeteria02> db.tipoCafe.find()					(Mostrar todos los documentos de la colección cafeteria02)
-------------------------------------------------------------------------------

****************
***   0009   ***   PROFUNDIZANDO SOBRE LA BUSQUEDA DE UN DOCUMENTO
****************

cafeteria02> db.tipoCafe.find()           				(Mostrar todos los documentos de la colección tipoCafe de la base de datos cafeteria02)
cafeteria02> db.tipoCafe.find({})         				(Este sentencia da lo mismo que la anterior ya que significa muestrame todos ya que no usa ningun filtro)

cafeteria02> db.tipoCafe.find().pretty()				(Usado en versiones mas antiguas de mongodb donde pretty se usaba para mostrar los documentos de una manera mas legible y no tan aglomerados en las versiones modernas de mongodb ya no es necesario usarlo ya que los documentos se muestran de manera mas legible)


cafeteria02> db.tipoCafe.find({nombre: "Frank"})  		(Mostrar todos los documentos que tengan la clave nombre con el valor "Frank" es decir es una busqueda con filtro)
cafeteria02> db.tipoCafe.find({nombre: "Carla"}) 
cafeteria02> db.tipoCafe.find({stock: 15})
cafeteria02> db.tipoCafe.find({disponible: false})

****************
***   0010   ***   PROFUNDIZANDO SOBRE UPDATEONE Y UPDATEMANY
****************

- ACTUALIZAR UN DOCUMENTO POR SU _ID YA QUE ESTE VALOR ES UNICO

Primero ver todos los documentos para obtener el _id: cafeteria02> db.tipoCafe.find()  --->

[
  {
    _id: ObjectId('659c7cf5fec81003ac970d97'),
    nombre: 'Carla',
    bebida: 'Café Expreso',
    cantidad: 2,
    stock: 80,
    disponible: true
  },
  {
    _id: ObjectId('659c7de5fec81003ac970d98'),
    nombre: 'Jhon',
    bebida: 'Café Americano ',
    cantidad: 3,
    stock: 0,
    disponible: false
  },
  {
    _id: ObjectId('659c7de5fec81003ac970d99'),
    nombre: 'Jhon',
    bebidas: 'Café Latte ',
    cantidad: 1,
    stock: 15,
    disponible: true
  },
  {
    _id: ObjectId('659c7de5fec81003ac970d9a'),
    nombre: 'Ana',
    bebidas: 'Café Latte',
    disponible: true
  }
]

Ahora que vemos el _id seleccionamos el primero el que tiene la clave nombre con el valor de Carla, y realizamos una actualización osea modificación:

cafeteria02> db.tipoCafe.updateOne({_id: ObjectId('659c7cf5fec81003ac970d97')},{$set: {etiqueta: "Atendido"}})             (Busca la clave etiqueta para cambiarle de valor pero al no encontrar la clave etiqueta lo agrega)

cafeteria02> db.tipoCafe.find({_id: ObjectId('659c7cf5fec81003ac970d97')}) --->

[
  {
    _id: ObjectId('659c7cf5fec81003ac970d97'),
    nombre: 'Carla',
    bebida: 'Café Expreso',
    cantidad: 2,
    stock: 80,
    disponible: true,
    etiqueta: 'Atendido'
  }
] 

cafeteria02> db.tipoCafe.updateOne({_id: ObjectId('659c7cf5fec81003ac970d97')},{$set: {etiqueta: "Atendido"}}) ---> 

{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 0,
  upsertedCount: 0
}

cafeteria02> db.tipoCafe.updateOne({disponible: true},{$set: {precio: 5}}) --->

{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,                Encontro 1 Aunque hay 3 pero como es updateOne solo modifica el primero que encuentre
  modifiedCount: 1,               Modifico 1
  upsertedCount: 0
}

- BUSCAMOS EL DOCUMENTO QUE COINCIDA CON EL _ID Y AL ENCONTRARLO VEO SI TIENE LA CLAVE NOMBRE Y SI LO TIENE PERO CON EL VALOR CARLA ENTONCES LO MODIFICO CON EL VALOR ISABEL.
cafegeria02> db.tipoCafe.updateOne({_id: ObjectId('659c7cf5fec81003ac970d97')},{$set: {nombre: "Isabel"}}) --->

{
  acknowledged: true,        El comando ha sido admitido
  insertedId: null,          No se han isertado _id
  matchedCount: 1,           Encontro 1
  modifiedCount: 1,          Modifico 1
  upsertedCount: 0
}

- ACTUALIZAR VARIOS DOCUMENTOS CON UPDATEMANY PERO TAMBIEN AGREGA CAMPOS SI ESTOS NO EXISTEN.

cafeteria02> db.tipoCafe.updateMany({nombre: "Jhon"},{$set: {etiqueta: "No atendido"}})           Encuentra dos documentos con la clave nombre con el valor Jhon entonces a los dos documentos le agrega la clave etiqueta con el valor "No atendido" por no existir en dichos documentos dicha clave entonces sirve para agregar en este caso por no encontrarse si hubieran existido los actualiza)   --->

{
  acknowledged: true,
  insertedId: null,
  matchedCount: 2,                   Encontro 2 documentos
  modifiedCount: 2,                  Modifico 2 documentos
  upsertedCount: 0
}

****************
***   0011   ***  APRENDIENDO SOBRE FIND() Y CURSOR OBJECT (35)
****************

(1) CREAR UNA COLECCION

--------------------------------------------------------------------------------
* Crear la colección durante la inserción de  los  documentos  haremos  uso  del
  archivo 03-empleados.json que tiene todos los documentos.
  
* En este ejemplo empleado es la colección que se crea en el mismo  instante que
  insertamos los documentos es decir no usamos  el  método  de primero  crear la
  colección y luego insertar los documentos.
  
* Cuando  hacemos  uso  de  find()  hace  uso  del  objeto cursor, find trae los
  primeros 20 documentos pero si tenemos mas de 20 documentos lo que hace find()
  es llamar al objeto cursor y lo que hace el  objeto  cursor  es devolvernos de
  20 en 20 y así completar todos los  documentos  que  tenga  la  colección pero
  esto se hace usando el comando it.  
--------------------------------------------------------------------------------

(2) COMANDO PARA CREAR LA COLECCION

test>use cafetera02

cafetera02>db.empleado.insertMany([
    {
        "nombre": "Mike Smith",
        "email": "smith@example.com"
    },
    {
        "nombre": "Johnson Gomez",
        "email": "johnson@example.com"
    },
    {
        "nombre": "Williams Evans",
        "email": "williams@example.com"
    },
    {
        "nombre": "Brown Phillips",
        "email": "brown@example.com"
    },
    {
        "nombre": "Jones Turner",
        "email": "jones@example.com"
    },
    {
        "nombre": "Garcia Diaz",
        "email": "garcia@example.com"
    },
    {
        "nombre": "Miller Cruz",
        "email": "miller@example.com"
    },
    {
        "nombre": "Davis Collins",
        "email": "davis@example.com"
    },
    {
        "nombre": "Rodriguez Cook",
        "email": "rodriguez@example.com"
    },
    {
        "nombre": "Martinez Cooper",
        "email": "martinez@example.com"
    },
    {
        "nombre": "Hernandez Bailey",
        "email": "hernandez@example.com"
    },
    {
        "nombre": "Alan Lopez ",
        "email": "alan@example.com"
    },
    {
        "nombre": "Joe Gonzalez ",
        "email": "joe@example.com"
    },
    {
        "nombre": "Wilson kim",
        "email": "wilson@example.com"
    },
    {
        "nombre": "Anderson Ramos",
        "email": "anderson@example.com"
    },
    {
        "nombre": "Thomas Watson",
        "email": "thomas@example.com"
    },
    {
        "nombre": "Taylor Ruiz",
        "email": "taylor@example.com"
    },
    {
        "nombre": "Jackson Myers",
        "email": "jackson@example.com"
    },
    {
        "nombre": "Martin Sanders",
        "email": "martin@example.com"
    },
    {
        "nombre": "Lee Jimenez",
        "email": "lee@example.com"
    },
    {
        "nombre": "Clark Foster",
        "email": "clark@example.com"
    },
    {
        "nombre": "Scott Russell",
        "email": "scott@example.com"
    },
    {
        "nombre": "Lewis Coleman",
        "email": "lewis@example.com"
    }
]);

RESULTADO


{
  acknowledged: true,							  El comando fue admitido correctamente
  insertedIds: {
    '0': ObjectId('65a5fcf864c87b9e4513481c'),    Para cada documento insertado se le asigno un identificador único 
    '1': ObjectId('65a5fcf864c87b9e4513481d'),
    '2': ObjectId('65a5fcf864c87b9e4513481e'),
    '3': ObjectId('65a5fcf864c87b9e4513481f'),
    '4': ObjectId('65a5fcf864c87b9e45134820'),
    '5': ObjectId('65a5fcf864c87b9e45134821'),
    '6': ObjectId('65a5fcf864c87b9e45134822'),
    '7': ObjectId('65a5fcf864c87b9e45134823'),
    '8': ObjectId('65a5fcf864c87b9e45134824'),
    '9': ObjectId('65a5fcf864c87b9e45134825'),
    '10': ObjectId('65a5fcf864c87b9e45134826'),
    '11': ObjectId('65a5fcf864c87b9e45134827'),
    '12': ObjectId('65a5fcf864c87b9e45134828'),
    '13': ObjectId('65a5fcf864c87b9e45134829'),
    '14': ObjectId('65a5fcf864c87b9e4513482a'),
    '15': ObjectId('65a5fcf864c87b9e4513482b'),
    '16': ObjectId('65a5fcf864c87b9e4513482c'),
    '17': ObjectId('65a5fcf864c87b9e4513482d'),
    '18': ObjectId('65a5fcf864c87b9e4513482e'),
    '19': ObjectId('65a5fcf864c87b9e4513482f'),
    '20': ObjectId('65a5fcf864c87b9e45134830'),
    '21': ObjectId('65a5fcf864c87b9e45134831'),
    '22': ObjectId('65a5fcf864c87b9e45134832')   Son 23 documentos ya que empieza en 0
  }
}

(3) COMANDO PARA MOSTRAR TODOS LOS DOCUMENTOS INSERTADOS

cafetera02>db.empleado.find();

RESULTADO

[
  { exit, press Ctrl+C again or Ctrl+D or type .exit)
    _id: ObjectId('65a5fcf864c87b9e4513481c'),
    nombre: 'Mike Smith',
    email: 'smith@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513481d'),
    nombre: 'Johnson Gomez',
    email: 'johnson@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513481e'),
    nombre: 'Williams Evans',
    email: 'williams@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513481f'),
    nombre: 'Brown Phillips',
    email: 'brown@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134820'),
    nombre: 'Jones Turner',
    email: 'jones@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134821'),
    nombre: 'Garcia Diaz',
    email: 'garcia@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134822'),
    nombre: 'Miller Cruz',
    email: 'miller@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134823'),
    nombre: 'Davis Collins',
    email: 'davis@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134824'),
    nombre: 'Rodriguez Cook',
    email: 'rodriguez@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134825'),
    nombre: 'Martinez Cooper',
    email: 'martinez@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134826'),
    nombre: 'Hernandez Bailey',
    email: 'hernandez@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134827'),
    nombre: 'Alan Lopez ',
    email: 'alan@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134828'),
    nombre: 'Joe Gonzalez ',
    email: 'joe@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134829'),
    nombre: 'Wilson kim',
    email: 'wilson@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482a'),
    nombre: 'Anderson Ramos',
    email: 'anderson@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482b'),
    nombre: 'Thomas Watson',
    email: 'thomas@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482c'),
    nombre: 'Taylor Ruiz',
    email: 'taylor@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482d'),
    nombre: 'Jackson Myers',
    email: 'jackson@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482e'),
    nombre: 'Martin Sanders',
    email: 'martin@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482f'),
    nombre: 'Lee Jimenez',
    email: 'lee@example.com'
  }
]
Type "it" for more                                   Con el comando it podemos seguir viendo los documentos restantes (it=iterar de 20 en 20)

cafeteria02>it                                       Nos trae los 3 documentos restantes que faltaba. El orden es
                                                     primero en entrar primero en salir por lo que  último en entrar ultimo en salir

[
  {
    _id: ObjectId('65a5fcf864c87b9e45134830'),
    nombre: 'Clark Foster',
    email: 'clark@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134831'),
    nombre: 'Scott Russell',
    email: 'scott@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134832'),      Este fue el último en entrar por lo tanto último en salir
    nombre: 'Lewis Coleman',
    email: 'lewis@example.com'
  }
]

(4) COMANDO PARA FORZAR Y TRAER TODOS LOS DOCUMENTOS  Y NO DE 20 EN 20

* Tener cuidado porque si la colección tuviera millnes de documentos saturamos la RAM.

cafetera02>db.empleado.find().toArray();

RESULTADO

[
  {
    _id: ObjectId('65a5fcf864c87b9e4513481c'),
    nombre: 'Mike Smith',
    email: 'smith@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513481d'),
    nombre: 'Johnson Gomez',
    email: 'johnson@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513481e'),
    nombre: 'Williams Evans',
    email: 'williams@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513481f'),
    nombre: 'Brown Phillips',
    email: 'brown@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134820'),
    nombre: 'Jones Turner',
    email: 'jones@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134821'),
    nombre: 'Garcia Diaz',
    email: 'garcia@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134822'),
    nombre: 'Miller Cruz',
    email: 'miller@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134823'),
    nombre: 'Davis Collins',
    email: 'davis@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134824'),
    nombre: 'Rodriguez Cook',
    email: 'rodriguez@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134825'),
    nombre: 'Martinez Cooper',
    email: 'martinez@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134826'),
    nombre: 'Hernandez Bailey',
    email: 'hernandez@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134827'),
    nombre: 'Alan Lopez ',
    email: 'alan@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134828'),
    nombre: 'Joe Gonzalez ',
    email: 'joe@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134829'),
    nombre: 'Wilson kim',
    email: 'wilson@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482a'),
    nombre: 'Anderson Ramos',
    email: 'anderson@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482b'),
    nombre: 'Thomas Watson',
    email: 'thomas@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482c'),
    nombre: 'Taylor Ruiz',
    email: 'taylor@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482d'),
    nombre: 'Jackson Myers',
    email: 'jackson@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482e'),
    nombre: 'Martin Sanders',
    email: 'martin@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e4513482f'),
    nombre: 'Lee Jimenez',
    email: 'lee@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134830'),
    nombre: 'Clark Foster',
    email: 'clark@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134831'),
    nombre: 'Scott Russell',
    email: 'scott@example.com'
  },
  {
    _id: ObjectId('65a5fcf864c87b9e45134832'),        Hemos forzado a que traiga todos los documentos 
    nombre: 'Lewis Coleman',
    email: 'lewis@example.com'
  }
]                                                     El corchete indica que los trae todos dentro de un array(vector) de un sólo tiron.   
                                                      Esto es peligroso traer todo si fuera que la colección tuviera millones saturamos la RAM.        

(5) ITERAR DOCUMENTO POR DOCUMENTO CON EL FOREACH Y PARA ESO ALTERAMOS EL CURSOR

cafetera02>db.empleado.find().forEach((cafeData)=>{printjson(cafeData)});      Itera uno por uno usando una función flecha de javascript dado que mongodb
                                                                               esta basado en javascript pero se puede usar otros lenguajes también dependerá
																			   de las librerias que usemos.

RESULTADO

* Trae los documentos uno por uno como vemos no hay un corchete al inicio ni al final
  indicativo que itera de uno en uno desde el objeto cursor es decir los trae de uno
  en uno y vemos que no estan separados por como por el hecho que los trae individualmente
  y los va mostrando uno por uno de esta manera no consume memoria RAM porque trae uno y lo muestra, luego trae otro y lo muestra
  una vez mostrado la RAM se libera.
  
*  En cambio cuando trae todo una array con todos los documentos ese array puede estar formado por millones de documentos y satura la ram
  se libera la ram cuando se muestra pero antes ya podriamos haber saturado la ram.
  
* En cambio si lo trae uno por uno no consumimos ram porque en la medida que trae uno lo muestra y se libera la ram luego viene otro
  ocupa la ram se muestra y se libera luego la ram este resultado lo podemos pasar a una aplicación web ya depende de lo que se necesite.

{
  _id: ObjectId('65a5fcf864c87b9e4513481c'),
  nombre: 'Mike Smith',
  email: 'smith@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e4513481d'),
  nombre: 'Johnson Gomez',
  email: 'johnson@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e4513481e'),
  nombre: 'Williams Evans',
  email: 'williams@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e4513481f'),
  nombre: 'Brown Phillips',
  email: 'brown@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134820'),
  nombre: 'Jones Turner',
  email: 'jones@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134821'),
  nombre: 'Garcia Diaz',
  email: 'garcia@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134822'),
  nombre: 'Miller Cruz',
  email: 'miller@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134823'),
  nombre: 'Davis Collins',
  email: 'davis@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134824'),
  nombre: 'Rodriguez Cook',
  email: 'rodriguez@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134825'),
  nombre: 'Martinez Cooper',
  email: 'martinez@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134826'),
  nombre: 'Hernandez Bailey',
  email: 'hernandez@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134827'),
  nombre: 'Alan Lopez ',
  email: 'alan@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134828'),
  nombre: 'Joe Gonzalez ',
  email: 'joe@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134829'),
  nombre: 'Wilson kim',
  email: 'wilson@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e4513482a'),
  nombre: 'Anderson Ramos',
  email: 'anderson@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e4513482b'),
  nombre: 'Thomas Watson',
  email: 'thomas@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e4513482c'),
  nombre: 'Taylor Ruiz',
  email: 'taylor@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e4513482d'),
  nombre: 'Jackson Myers',
  email: 'jackson@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e4513482e'),
  nombre: 'Martin Sanders',
  email: 'martin@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e4513482f'),
  nombre: 'Lee Jimenez',
  email: 'lee@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134830'),
  nombre: 'Clark Foster',
  email: 'clark@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134831'),
  nombre: 'Scott Russell',
  email: 'scott@example.com'
}
{
  _id: ObjectId('65a5fcf864c87b9e45134832'),
  nombre: 'Lewis Coleman',
  email: 'lewis@example.com'
}

****************
***   0012   ***  APRENDIENDO SOBR PROJECTION (36)
****************

(1) QUE ES PROJECTION(PROYECCION)

--------------------------------------------------------------------------------
* La proyeccion nos permite trae solo los campos que necesitemos de un documento
  ya que aveces no es necesario traer todos los campos de un documento  sólo los
  que necesitemos y esto tambien evita  que  saturemos  la   RAM con información
  inecesaria que no usaremos.
--------------------------------------------------------------------------------

(2) EJEMPLO DE PROYECCION

- EN LA BASE DE DATOS

{
  "nombre": "Carla",
  "bebida": "Café Expreso",
  "cantidad": 2,
  "stock": 80,
  "disponible": true
}

- EN LA APLICACION QUIZAS SOLO NECESITAMOS DEL NOMBRE Y CANTIDAD

{
  "nombre": "Carla",
  "cantidad": 2
}

(3) COMANDO PARA USAR LA PROYECCION

cafetera02>db.empleado.find();   				//Mostrar todos los documentos de la colección.
cafetera02>db.empleado.find({},{nombre: 1}); 	//Esto es la proyección el primer {} indica traeme todos los documentos y el segundo {nombre: 1} 1 indica sólo
                                                  traeme el campo nombre y los demás campos no.
												  
												  
--------------------------------------------------------------------------------												  
db.empleado.find({}, {nombre: 1, email: 1});

En este comando, se han añadido ambos campos, "nombre" y "email", al objeto de
proyección. El 1 junto a cada campo indica que se deben incluir en los
resultados. Ahora, al ejecutar este comando, obtendrás documentos que contienen
tanto el campo "nombre" como el campo "email" de la colección "empleado".
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
db.empleado.find({}, {nombre: 1});	

Por lo tanto, el comando busca todos los documentos en la colección "empleado" y
devuelve solo el campo "nombre" de cada uno de ellos. Es una forma de realizar
una proyección, es decir, seleccionar campos específicos de los documentos en
lugar de recuperar todo el documento.
En este caso, se está indicando que solo se debe devolver el campo "nombre" de
los documentos encontrados, y el valor 1 significa que se debe incluir el campo
en los resultados y 0 para excluirlo.
Si ponemos nombre: 2 no es valido para la proyección de campos.
El campo _id es un campo especial que siempre nos va a devolver.											  
--------------------------------------------------------------------------------

(4) COMANDO PARA EXCLUIR EL CAMPO _ID 

cafetera02>db.empleado.find({},{nombre: 1, _id: 0});

* Se puede agregar también email: 0 pero ya es obvio así que no se pone pero
  no pasa nada si se pone así:
  
  cafetera02>db.empleado.find({},{nombre: 1, _id: 0, email: 0});
  
* Recordar que it es el objeto cursor

****************
***   0013   ***  ENTENDIENDO DOCUMENTOS EMBEBIDOS Y ARRAYS (37)
****************

(1) DOCUMENTO EMBEBIDO

* Significa documento dentro de otro documento
* Un documento incia y cierra con una llaves.
* En este ejemplo los campos que guardan un documento: aditionaInfo, phone, address.
* En mongodb podemos tener hasta 100 niveles de anidamiento este es un número dificil de superar ya que normalmente hablamos de hasta 3 o 4 niveles de anidamiento.

* El tamaño máximo del documento es de 16 megabytes y esto es razonable ya que es dificil que un documento que es texto supere los 16 megabytes o sea 16.777.216 de caracteres para un documento.

{
  _id: ObjectId(...),
  firstName: "John",
  lastName: "King",
  email: "john.king@abc.com",
  salary: 3000,
  aditionaInfo: {
                  age: 30,
				  gender: male
				},
  address: {
             street: "Upper Street",
			 house: "No 1",
			 city: "New York",
			 country: "USA",
			 phone: {
			          type: "Home",
					  number: 111-000-000
					}
		   }
}

(2) ARRAYS

* Los corchetes asen mensión a un array o matriz 
* En un array podemos guardar valores o documentos

{
  _id: ObjectId(...),
  name: "Joe Bookereader",
  addresses: [
               {
			     street: "123 Fake Street",
				 city: "Faketon",
				 state: "MA",
				 zip: "12345"
			   },
			   {
			     street: "1 Some Other Street",
				 city: "Boston",
				 state: "MA",
				 zip: "12345"
			   }
             ]
}



}

****************
***   0014   ***  TRABAJANDO CON DOCUMENTOS EMBEBIDOS (38)
****************

- INSERTAR MUCHOS DOCUMENTOS

cafetera02>db.tipoCafe.insertMany([
  {
    _id: ObjectId('659c7cf5fec81003ac970d97'),
    nombre: 'Isabel',
    bebida: 'Café Expreso',
    cantidad: 2,
    stock: 80,
    disponible: true,
    etiqueta: 'Atendido',
    precio: 5
  },
  {
    _id: ObjectId('659c7de5fec81003ac970d98'),
    nombre: 'Jhon',
    bebida: 'Café Americano ',
    cantidad: 3,
    stock: 0,
    disponible: false,
    etiqueta: 'No atendido'
  },
  {
    _id: ObjectId('659c7de5fec81003ac970d99'),
    nombre: 'Jhon',
    bebidas: 'Café Latte ',
    cantidad: 1,
    stock: 15,
    disponible: true,
    etiqueta: 'No atendido'
  },
  {
    _id: ObjectId('659c7de5fec81003ac970d9a'),
    nombre: 'Ana',
    bebidas: 'Café Latte',
    disponible: true
  }
]);

- MOSTRAR TODOS LOS DOCUMENTOS							

cafetera02>db.empleado.find();

- ACTUALIZAR MUCHOS DOCUMENTOS

* Como la condicion es {} signfica actualiza todos los documentos y sino estan los añade.

cafetera02>db.tipoCafe.updateMany({},{$set: {venta: {pago: "Efectivo", monto:5}}});

RESULTADO

{
  acknowledged: true,
  insertedId: null,               
  matchedCount: 4,                 Coincidencia 4
  modifiedCount: 4,                Modificado 4
  upsertedCount: 0
}

- ACTUALIZAR EL DOCUMENTO QUE AGREGAMOS ANTERIORMENTE AÑADIENDO UN DOCUMENTO EMBEBIDO
  SI LOS CAMPOS PAGO Y MONTO EXISTE LOS VA ACTUALIZAR AGREGANDO EL CAMPO DETALLE

cafetera02>db.tipoCafe.updateMany({},{$set: {venta: {pago: "Efectivo", monto:5, detalle: {responsable: "Cristian Donayre"}}}});

RESULTADO

{
  acknowledged: true,
  insertedId: null,          
  matchedCount: 4,            Encontrado 4
  modifiedCount: 4,           Modificado 4
  upsertedCount: 0
}

****************
***   0015   *** TRABAJANDO CON ARRAYS (39)
****************

cafetera02>db.empleado.find();

- ACTUALIZAR SOLO UN EMPLEADO

cafetera02>db.empleado.updateOne({nombre: "Lewis Coleman"},{$set: {diaLaborable: ["Lunes","Martes","Miercoles","Jueves","Viernes"]}});

RESULTADO

{
  acknowledged: true,
  insertedId: null,        
  matchedCount: 1,        Encontro 1 
  modifiedCount: 1,       Actualizao 1
  upsertedCount: 0
}

- BUSCAR UN DOCUMENTO POR SU CAMPO NOMBRE

cafetera02>db.empleado.find({nombre: "Lewis Coleman"});

RESULTADO

[
  {
    _id: ObjectId('65a5fcf864c87b9e45134832'),
    nombre: 'Lewis Coleman',
    email: 'lewis@example.com',
    diaLaborable: [ 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes' ]
  }
]

****************
***   0016   ***  ACCEDIENDO A LA ESTRUCTURA DE DATOS (40)
****************

cafetera02>db.empleado.find({nombre: "Lewis Coleman"}).diaLaborable  ESTO NO TRAE NADA PORQUE DEBEMOS USAR FINDONE

cafetera02>db.empleado.findOne({nombre: "Lewis Coleman"}).diaLaborable

RESULTADO:

[ 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes' ]


- BUSCAR UN DOCUMENTO CON UN FILTRO

cafetera02>db.empleado.find({diaLaborable: "Jueves"});

RESULTADO

[
  {
    _id: ObjectId('65a5fcf864c87b9e45134832'),
    nombre: 'Lewis Coleman',
    email: 'lewis@example.com',
    diaLaborable: [ 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes' ]
  }
]

- MOSTRAR SOLO LOS DOCUMENTOS CUYO PAGO TENGAN EL VALOR EFECTIVO  iCOLECCION TIPOCAFE)

cafetera02>db.tipoCafe.find({"venta.pago": "Efectivo"});

- MOSTRAR SOLO LOS DOCUMENTOS CUYO RESPONSABLE ES CRISTIAN DONAYRE
																	
cafetera02>db.tipoCafe.find({"venta.detalle.responsable": "Cristian Donayre});


****************
***   0017   ***  TAREA 1: OPERACIONES CRUD BASICAS (DESPUES DE 40)
****************

Crear una base de datos colegio.
Crear una colección llamada estudiante.
Insertar documentos: Insertar 3 documentos siguiendo la estructura siguiente:
Actualizar un documento cambiando el nombre y edad
Realizar la busqueda del campo "nota" del documento anidado
Eliminar un documento específico.

[
  {
	"nombre": "Karen",
	"apellido": "Díaz",
	"edad": 7,
	"calificaciones": [
	    {"nota": 15, "tipo": "Examen"} ,
		{"nota": 18, "tipo": "Práctica"} ,
		{"nota": 17, "tipo": "Tarea"}
	]
  }

]

****************
***   0018   ***  CUESTIONARIO: OPERACIONES CRUD BASICAS (DESPUES DE 40)
****************

- INDICA VERDADERO O FALSO SI LA SIGUIENTE SINTAXIS JSON ES CORRECTA

{
  "nombre": "John",
  "edad": 22,
  "email": "jhon@example.com"
}

RESPUESTA: VERDADERO
		
- MARQUE "VERDADERO" O "FALSO" LA SIGUIENTE PREGUNTA:
  CUANDO CREAMOS UNA BASE DE DATOS EN EL SERVIDOR MONGODB CON EL COMANDO use <nombre base de datos>,
  LA BASE DE DATOS NUEVA SE HA CREADO Y MONGODB LO HA ALMACENADO EN NUESTRO DISCO DURO SIN HABERLE
  INSERTADO NINGUN DOCUMENTO Y SIN CREARLE UNA COLECCION
  
RESPUESTA: FALSO

MongoDB solo crea la base de datos si se insertan datos o se crean una colección, si no se hace
ninguno de ellos entonces lo guarda entonces en memoria RAM y no se escribe en disco duro.

La base de datos se almacena en nuestro disco duro siempre que insertemos datos o creemos una
coleccion en blanco, caso contrario se guarda en memoria RAM.

- MARQUE LA RESPUESTA CORRECTA:
  QUE COMANDO SE UTILIZA PARA PODER LISTAR LAS COLECCIONES(COLLECTION) QUE SE ENCUENTRA EN
  NUESTRA BASE DE DATOS)
  
RESPUESTA: show collections;

- MARQUE LA RESPUESTA CORRECTA:
  QUE COMANDO SE UTILIZA PARA PODER CREAR UNA COLECCION(COLLECTION) EN BLANCO DENTRO DE NUESTRA
  BASE DE DATOS.               
							
RESPUESTA: db.createCollection("dbprobando");

****************
***   0019   ***  RECURSOS ADICIONALES (41)
****************

Hola estimado estudiante

te comparto unos link sobre la documentación y/o artículos sobre Mongodb  para que puedas seguir profundizando tus conocimientos.



Introducción a MongoDB:

https://www.mongodb.com/docs/manual/introduction/



Operaciones CRUD en MongoDB:

https://www.mongodb.com/docs/manual/crud/



Te espero en la siguiente clase!

****************
***   0020   ***   DESCRIPCION DEL MODULO (42)						SECCION 5: PROFUNDIZANDO EN LAS OPERACIONES CREATE
****************

CREAR DOCUMENTOS
APRENDIENDO LOS METODOS INSERT()
TRABAJANDO CON ORDERED "INSERTS"
QUE ES ATOMICITY Y COMO AYUDA EN LA INSERCION DE DATOS
INSTALANDO HERRAMIENTAS DE MONGODB DATABASE
IMPORTAR DATOS EN MONGODB

****************
***   0021   ***   CREAR DOCUMENTOS EN MONGODB (43)
****************

insertOne()  ---> db.<collectionName>.insertOne({field: "value"})
insertMany() ---> db.<collectionName>.insertMany([
												   {field: "value"},
												   {field: "value"}
                                                ])
												
insert() ---> Este método esta en desuso.

mongoimport ---> Me permite importar archivos json y cargar todos los documentos que se encuentran dentro del archivo hacia nuestro servidor de mongodb

****************
***   0022   ***   APRENDIENDO LOS METODOS INSERT()  (44) 
****************

- MOSTRAR TODAS LAS BASES DE DATOS EN MONGODB

show dbs;

- CREAR O CAMBIAR DE BASE DE DATOS EN MONGODB

use market;

- PARA QUE SE CREE LA BASE DE DATOS EN EL DISCO INSERTAMOS UN DOCUMENTO

market>db.compra.insertOne({nombre: "Fernando", fruta: ["Fresa", "Uva", "Mango"]});

RESULTADO

{
  acknowledged: true,                                      El comando ha sido admitido correctamente
  insertedId: ObjectId('65ab608bd8384437329d9e79')         Se han insertado 1 id
}

- MOSTRAR TODOS LOS DOCUMENTOS DE UNA COLECCION

market>db.compra.find();

RESULTADO

[
  {
    _id: ObjectId('65ab608bd8384437329d9e79'),
    nombre: 'Fernando',
    fruta: [ 'Fresa', 'Uva', 'Mango' ]
  }
]

- LIMPIAR PANTALLA

market>cls

- INSERTAR MULTIPLES DOCUMENTOS

market>db.compra.insertMany([
							  {nombre: "Fred", fruta: ["Papaya","Platano"]},
							  {nombre: "Oscar", fruta: ["Platano", "Kiwi"]}
                           ]);

RESULTADO

{
  acknowledged: true,                                    El comando ha sido admitido correctamente
  insertedIds: {                                         Se han insertado 2 id uno por cada documento
    '0': ObjectId('65ab646ed8384437329d9e7a'),
    '1': ObjectId('65ab646ed8384437329d9e7b')
  }
}

- MOSTRAR TODOS LOS DOCUMENTOS DE UNA COLECCION

market>db.compra.find();

RESULTADO

[
  {
    _id: ObjectId('65ab608bd8384437329d9e79'),
    nombre: 'Fernando',
    fruta: [ 'Fresa', 'Uva', 'Mango' ]
  },
  {
    _id: ObjectId('65ab646ed8384437329d9e7a'),
    nombre: 'Fred',
    fruta: [ 'Papaya', 'Platano' ]
  },
  {
    _id: ObjectId('65ab646ed8384437329d9e7b'),
    nombre: 'Oscar',
    fruta: [ 'Platano', 'Kiwi' ]
  }
]
 
****************
***   0023   ***   TRABAJANDO CON ORDERED "INSERTS" (45) ---> INSERCIONES ORDENADAS  
****************

--------------------------------------------------------------------------------
* El método insertOne() no adminten las inserciones ordenadas.

* El método insertMany() si admiten las inserciones ordenadas.

insertMany() ---> 
db.<collectionName>.insertMany([
								 {field: "value"},
								 {field: "value"}
                               ],
							   {ordered:<boolean>}
							  );
--------------------------------------------------------------------------------
- INSERTAR DOCUMENTOS A UNA COLECCION

* La creacion de la coleccion y la insersicion de documentos al mismo tiempo
* Ingresaremos el id manualmente
* El id puede ser de cualquier tipo en este caso seran cadenas
* La colección va ser de frutas

market>db.fruta.insertMany([
							{_id: "papaya", nombre: "Papaya"},
							{_id: "fresa", nombre: "Fresa"},
							{_id: "kiwi", nombre: "Kiwi"}
			               ]);
						   
RESULTADO

{
  acknowledged: true,                                             El comando ha sido admitido correctamente
  insertedIds: { '0': 'papaya', '1': 'fresa', '2': 'kiwi' }       Se han insertado 3 id uno para cada documento
}
--------------------------------------------------------------------------------
- MOSTRAR TODOS LOS DOCUMENTOS

market>db.fruta.find();	

[
  { _id: 'Papaya', nombre: 'Papaya' },
  { _id: 'Fresa', nombre: 'Fresa' },
  { _id: 'Kiwi', nombre: 'Kiwi' }
]
--------------------------------------------------------------------------------
- INSERTAMOS NUEVOS DOCUMENTOS A UNA COLECCION

* Si una insercion falla porque el id esta ya duplicado a partir de ahí ya los
  documentos que siguen dejan de insertarse pero los primeros antes del fallo
  se insertan sin problema.
  
market>db.fruta.insertMany([
							{_id: "platano", nombre: "Platano"},   Se inserta
							{_id: "fresa", nombre: "Fresa"},       A partir de aquí deja de insertarse porque el id ya existe
							{_id: "uva", nombre: "Uva"},
							{_id: "mango", nombre: "Mango"}
			               ]);
--------------------------------------------------------------------------------
- MOSTRAR TODOS LOS DOCUMENTOS DE UNA COLECCION						   

market>db.fruta.find();

RESULTADO

[
  { _id: 'Papaya', nombre: 'Papaya' },
  { _id: 'Fresa', nombre: 'Fresa' },
  { _id: 'Kiwi', nombre: 'Kiwi' },
  { _id: 'platano', nombre: 'Platano' }
]
--------------------------------------------------------------------------------
- HACER QUE MONGODB SI ENCUENTRA UN ID DUPLICADO SE SALTE EL ERROR PARA PODER
  SEGUIR INSERTANDO LOS DEMAS Y EVITAR QUE A PARTIR DE AHÍ NO DEJE INGRESAR
  POR DICHO ERROR.
  
* El ordered: true, donde true es el por defecto no deja ingresar si encuentra
  el duplicado el id, entonces ponemos false para que deje ingresar los demás
  y el error no detenga los ingresos de los demás.

market>db.fruta.insertMany([
					        {_id: "platano", nombre: "Platano"},   
					        {_id: "fresa", nombre: "Fresa"},      
					        {_id: "uva", nombre: "Uva"},
					        {_id: "mango", nombre: "Mango"}
			               ],
					       {ordered: false}
					      );  
--------------------------------------------------------------------------------

												

****************
***   0024   ***   QUE ES ATOMICITY (46)   
****************

* Las Operaciones CRUD en MongoDB son Atómicas en los niveles de documentos
  (incluido documentos embebidos)

(REVISAR EN CHATGPT PARA ENTENDERLO AUN NO LO ENTIENDO)

****************
***   0025   ***   INSTALANDO HERRAMIENTAS DE MONGODB DATABASE (47)
****************

* Información sobre la herramienta "mongo import"

https://www.mongodb.com/docs/database-tools/mongoimport/

* La herramienta "mongo import" es importante porque permite importar
  documentos que estan dentro de un archivo json.
  
* Seleccionamos el instalador para Windos y el enlace "MongoDB Download Center"

https://www.mongodb.com/try/download/database-tools?tck=docs_databasetools
https://www.mongodb.com/try/download/shell

* Descargue este archivo

mongodb-database-tools-windows-x86_64-100.9.4.zip

El enlace del anterior archivo es:

https://www.mongodb.com/try/download/database-tools

Mas abajo buscamos el apartado: 

MongoDB Command Line Database Tools Download

Del apartado anterior descargamos el archivo .zip para windows
 

****************
***   0026   ***   DESCARGAR E INSTALAR LA HERRAMIENTA MONGODB DATABASE PARA WINDOWS (48) 
****************

--------------------------------------------------------------------------------
- DESCARGAR LA HERRAMIENTA

  "MongoDB Command Line Database Tools Download"

  Ir a la siguiente url
  https://www.mongodb.com/try/download/database-tools
  Mas abajo buscamos el apartado: 
  MongoDB Command Line Database Tools Download
  Del apartado anterior descargamos el archivo .zip para windows
  Descargue este archivo
  mongodb-database-tools-windows-x86_64-100.9.4.zip

* MOVER LOS ARCHIVOS DE LA HERRAMIENTA ANTERIOR HACIA MONGODB

  Los archivos .exe en bin de este .zip
  mongodb-database-tools-windows-x86_64-100.9.4.zip
  Se deben copiar a esta ruta
  C:\Program Files\MongoDB\Server\7.0\bin 
--------------------------------------------------------------------------------

****************
***   0027   ***   IMPORTAR DATOS QUE ESTAN EN UN ARCHIVO JSON HACIA MONGODB (49)  
****************

* El "mongoimport" tiene muchas opciones:

--host=<hostname><:port>, -h=<hostname><:port>   Default: localhost:27017
--port=<port>	Default:27017
--db=<database>, -d=<database>
--collection=<collection>, -c=<collection>
--jsonArray  INDICAMOS A MONGODB QUE EXISTE DOCUMENTOS EMBEBIDOS Y TAMBIEN ARRAYS
--drop    SI EXISTE LA BASE DE DATOS LA ELIMINA Y LA VUELVE A CREAR

mongoimport <fileName>.json -d <databaseName> -c <collectionName> --jsonArray -- drop

* Levantar una consola cmd y navego con cd hasta donde este el archivo product.json

* Comando para importar los documentos desde un json hacia el servidor mongodb

F:\TRABAJANDO\PROJECTS___MONGODB\MONGODB_TEXTO\JSON>mongoimport product.json -d product -c productData --jsonArray --drop
F:\TRABAJANDO\PROJECTS___MONGODB\MONGODB_TEXTO\JSON>mongoimport consulta.json -d salud -c consulta --jsonArray --drop
F:\TRABAJANDO\PROJECTS___MONGODB\MONGODB_TEXTO\JSON>mongoimport Retail-product.json -d retail -c product --jsonArray --drop

RESULTADO

2024-01-20T09:36:09.864+0100    connected to: mongodb://localhost/        SE HA CONECTADO SATISFACTORIAMENTE AL SERVIDOR MONGODB
2024-01-20T09:36:10.066+0100    dropping: product.productData             HA CREADO LA BASE DE DATOS PRODUCT Y LA COLECCION PRODUCTDATA
2024-01-20T09:36:10.167+0100    30 document(s) imported successfully. 0 document(s) failed to import.  SE HAN IMPORTADO 30 DOCUMENTOS SATISFACTORIAMENTE


2024-02-11T01:42:05.314+0100    connected to: mongodb://localhost/
2024-02-11T01:42:05.505+0100    dropping: retail.product
2024-02-11T01:42:05.549+0100    63 document(s) imported successfully. 0 document(s) failed to import.

- AHORA NOS CONECTAMOS CON EL CLIENTE SHELL A MONGODB PARA VER LOS DOCUMENTOS INSERTADOS

O:\TRABAJANDO\PROJECTS___MONGODB\MATERIAL>mongosh
test>show dbs
test>use product
product>show collections
product>db.productData.find()

****************
***   0028   ***   RECURSOS ADICIONALES (50)  
****************

Recursos adicionales
Hola estimado estudiante

te comparto unos link sobre la documentación y/o artículos sobre Mongodb  para que puedas seguir profundizando tus conocimientos.



Métodos "insert()":

https://www.mongodb.com/docs/manual/reference/method/db.collection.insertOne/

https://www.mongodb.com/docs/manual/reference/method/db.collection.insertMany/



Atomicity:

https://www.mongodb.com/docs/manual/core/write-operations-atomicity/



mongoimport:

https://www.mongodb.com/docs/database-tools/mongoimport/



Te espero en la siguiente clase!


****************
***   0029   ***   
****************

db.product.find()                                     Nos devuelve todos los documentos de 20 en 20 con it vamos pidiendo los siguientes 20
db.product.find().toArray()                           Me lo muestra en una lista sólo funciona con find no con findOne

db.product.findOne()                                  Nos devuelve sólo un documento el primero que se inserto.


db.product.find({unitsInStock: 0})                    Sólo nos devuelve un documento el primero que encuentre que coincida
db.product.findOne({unitsInStock: 0}))                Nos devuelve 4 documento todos los que coincidan

- MOSTRAR LOS DOCUMENTOS QUE TENEMOS EN LA SUCURSAL DE ALABAMA (FILTRO)

db.product.find({branchOffice: "Alabama"})            Nos muestra los productos que tenemos en sucursal de Alabama pero también en otras ciudades

- MOSTRAR LOS PRODUCTOS QUE UNICAMENTE TENEMOS EN LA SUCURSAL DE ALABAMA  (ES DECIR QUE NO COMPARTA CON OTRA SUCURSAL)

db.product.find({branchOffice: ["Alabama"]})

- MOSTRAR LOS PRDUCTOS QUE UNICAMENTE TENEMOS EN LA SUCURSAL DE "ALABAMA" Y "CALIFORNIA"  (ES DECIR SOLO LISTAS CON DICHA DOS CIUDADES)

db.product.find({branchOffice: ["Alabama", "Californai"]})

- MOSTRAR LOS PRODUCTOS QUE SE ENCUENTRAN EN DESCUENTO CON UN 18%(0.18) EN EL DIA VIERNES(FRIDAY) (DOCUMENTO EMBEBIDO)  (ACCEDER A DOCUMENTOS EMBEBIDOS)

db.product.find({"discountDay.Friday": 0.18})



db.product.find({"categories.suppliers.phone":  '(171) 555-2222'})

- 



****************
***   0030   ***   
****************


****************
***   0031   ***   
****************


****************
***   0032   ***   
****************

var cursor = db.consulta.find();
while(cursor.hasNext()) {
    printjson(cursor.next());
}

****************
***   0033   ***   CONSULTANDO INFORMACION DENTRO DE UN ARRAY O SUB-DOCUMENTO
****************

- CONSULTAR LOS PRODUCTOS QUE SEAN DE LA MARCA SAMSUNG

db.producto.find({"caracteristicas.marca": "Samsung"});

- CONSULTAR LOS PRODUCTOS QUE ESTEN EN LA CATEGORIA DE INFORMATICA

db.producto.find({"categorias": "informática"});

- IMPLEMENTACION EN PYTHON

conexion = pymongo.MongoClient("mongodb://localhost:27017/")
db = conexion["01_tienda"]  
coleccion = db["producto"]
resultados = coleccion.find({"caracteristicas.marca": "Samsung"})
for producto in resultados:
    print(producto)

****************
***   0034   ***  METODO, FILTRO Y OPERADORES 
****************

- OPERADORES DE COMPARACION

$eq: Equivalente a ==
$ne: Equivalente a !=
$gt: Mayor que >
$gte: Mayor o igual que >=
$lt: Menor que <
$lte: Menor o igual que <=
$in: Equivalente a IN en SQL
$nin: No está en, equivalente a NOT IN en SQL

- MOSTRAR TODOS LOS PRODUCTOS MAYORES A 800 EUROS

db.producto.find({"precio": {$gt: 800}});

- MOSTRAR LOS PRODUCTOS QUE ESTEN EN UN INVENTARIO DE 10 O 15 UNIDADES

db.producto.find({"inventario": {"$in": [10, 15]}});

- MOSTRAR LOS PRODUCTOS  QUE NO ESTAN EN UN INVENTARIO DE 10 O 15 UNIDADES

db.producto.find({"inventario": {"$nin": [10, 15]}});

- MOSTRAR LOS PRODUCTOS QUE ESTEN EN EL RANGO DE PRECIO [800,1000]

db.producto.find({"precio": {"$gte": 800, "$lte": 1000}});

- MOSTRAR LOS PRODUCTOS QUE ESTEN EN EL RANGO DE PRECIO [500,1000] Y SEAN DE LA MARCA DELL

db.producto.find({"precio": {"$gte": 500, "$lte": 1000}, "caracteristicas.marca": "Dell"});

- MOSTRAR LOS PRODUCTOS QUE TENGAN EL PRECIO DE 1200 Y DE LA MARCA APPLE

db.producto.find({"precio": {"$eq": 1200}, "caracteristicas.marca": "Apple"});

****************
***   0035   ***   EXPRESION REGULAR  Y OPERADORES LOGICOS
****************

- OPERADOR PARA EXPRESION REGULAR

$regex

La opción "i" se utiliza para que la búsqueda sea insensible a mayúsculas y minúsculas, es decir, coincidirá con "camiseta", "Camiseta", "CAMISETA", etc.

- OPERADORES LOGICOS

OPERADOR	
DESCRIPCION													
EJEMPLO

$and		
Realiza una operación lógica AND en una lista de expresiones; selecciona documentos que cumplen todas las expresiones.
db.collection.find({"$and": [{"campo1": valor1}, {"campo2": valor2}]})

$or			
Realiza una operación lógica OR en una lista de expresiones; selecciona documentos que cumplen al menos una expresión.
db.collection.find({"$or": [{"campo1": valor1}, {"campo2": valor2}]})

$not		
Niega una expresión de consulta; selecciona documentos que no cumplen con la expresión.
db.collection.find({"campo": {"$not": {"$eq": valor}}})

$nor		
Realiza una operación lógica NOR en una lista de expresiones; selecciona documentos que no cumplen con ninguna expresión.	
db.collection.find({"$nor": [{"campo1": valor1}, {"campo2": valor2}]})

- MOSTRAR TODOS LOS PRODUCTOS QUE SEAN MONITOR

db.producto.find({"nombre": {"$regex": "monitor", "$options": "i"}});

- MOSTRAR TODOS LOS PRODUCTOS QUE SEAN MONITOR O TABLETA

db.producto.find({"$or": [{"nombre": {"$regex": "monitor", "$options": "i"}}, {"nombre": {"$regex": "tableta", "$options": "i"}}]});

db.producto.find({"$or": [{"nombre": {"$regex": "monitor", "$options": "i"}}, {"nombre": {"$regex": "tableta", "$options": "i"}}]}).count();

- CUANTOS PRODUCTOS SON MONITOR

db.producto.find({"nombre": {"$regex": "monitor", "$options": "i"}}).count();

- MOSTRAR LOS PRODUCTOS QUE TENGAN EL PRECIO DE 1200 Y DE LA MARCA APPLE

db.producto.find({"precio": {"$eq": 1200}, "caracteristicas.marca": "Apple"});
db.producto.find({"$and": [{"precio": {"$eq": 1200}},{"caracteristicas.marca": "Apple"}]});

- MOSTRAR LOS PRODUCTOS QUE PERTENEZCAN A LA VEZ A LA CATEGORIA ELECTRONICA E INFORMATICA

db.producto.find({"$and": [{"categorias": {"$regex": "electrónica", "$options": "i"}},{"categorias": {"$regex": "informática", "$options": "i"}}]});
db.producto.find({"$and": [{"categorias": {"$regex": "electrónica", "$options": "i"}},{"categorias": {"$regex": "informática", "$options": "i"}}]}).count();

- MOSTRAR LOS PRODUCTOS QUE TENGAN UN PRECIO DE 1200 O 1000. DEBE MOSTRAR SOLO LOS CAMPOS _ID, NOMBRE Y PRECIO

'precio': 1200
'precio': 1000
'$or': [{},{}]
'$or': [{'precio': 1200},{'precio': 1000}]

db.producto.find({},{})
db.producto.find({'$or': [{'precio': 1200},{'precio': 1000}]},{'_id': 1, 'nombre': 1, 'precio': 1});

- MOSTRAR LOS PRODUCTOS QUE SEAN DE LA MARCA DELL O APPLE. DEBE MOSTRAR SOLO LOS CAMPOS _ID, NOMBRE Y MARCA

'caracteristicas.marca': 'Dell'
'caracteristicas.marca': 'Apple'

'$or': [{},{}]
'$or': [{'caracteristicas.marca': 'Dell'},{'caracteristicas.marca': 'Apple'}]

'_id': 1, 'nombre': 1, 'caracteristicas.marca':1

db.producto.find({},{})
db.producto.find({'$or': [{'caracteristicas.marca': 'Dell'},{'caracteristicas.marca': 'Apple'}]},{'_id': 1, 'nombre': 1, 'caracteristicas.marca':1});

db.producto.find({'$or': [{'caracteristicas.marca': 'Dell'},{'caracteristicas.marca': 'Apple'}]},{'_id': 1, 'nombre': 1, 'caracteristicas.marca':1}).count();

****************
***   0036   ***   OPERADOR $EXISTS  
****************

Cuando el valor <booleano> es True, $exists muestra los documentos que contiene el campo
incluidos los documentos donde el valor del campo es null. Si <boolean> es false, la consulta
devuelve los documentos que no contienen el campo.

- MOSTRAR TODOS LOS PRODUCTOS QUE TENGAN EL CAMPO PANTALLA 

SINTAXIS: VALOR DEL CAMPO
{$exists: true}   
FILTRO: CAMPO-VALOR
'caracteristicas.pantalla': {$exists: true}
OPCION
nombre: 1, caracteristicas.pantalla: 1
db.producto.find({},{})

db.producto.find({caracteristicas.pantalla: {$exists: true}},{});        ERROR
db.producto.find({'caracteristicas.pantalla': {$exists: true}},{});      OK
db.producto.find({"caracteristicas.pantalla": {$exists: true}},{});      OK


db.producto.find({'caracteristicas.pantalla': {$exists: true}},{nombre: 1, 'caracteristicas.pantalla': 1});      OK   campo compuesto entre comillas siempre

- MOSTRAR LOS PRODUCTOS QUE TENGAN EL CAMPO PANTALLA  Y SEA DE 11 PULGADAS

'caracteristicas.pantalla': {$exists: true, $gt: 13}
db.producto.find({},{})
db.producto.find({'caracteristicas.pantalla': {$exists: true, $eq: '11 pulgadas'}},{'caracteristicas.pantalla': 1});

- OTRAS CONSULTAS

1. MOSTRAR LOS EMPLEADOS QUE TENGAN EL CAMPO "EDAD(AGE)", EXCEPTO LOS QUE TENGAN UN VALOR "NULL"

db.employee.find({age: {$exists: true, $ne: null}})

2. MOSTRAR LOS EMPLEADOS QUE NO TENGAN EL CAMPO "EDAD(AGE)"

db.employee.find({age: {$exists: false}})

****************
***   0037   ***   OPERADOR $TYPE   
****************

--------------------------------------------------------------------------------
Selecciona  los  documentos  donde  el  valor  del campo es un tipo de dato BSON
especificado. $type  es  bastante  útil  cuando  la colección  es  compleja y la
predicción de los tipos de datos de cualquier campo es imposible.
--------------------------------------------------------------------------------

https://www.mongodb.com/docs/manual/reference/operator/query/type/#std-label-query-type-examples

- MOSTRAR LOS EMPLEADOS DONDE EL TIPO DE DATO DEL CAMPO "HOMEPHONE" SEA ENTERO

  02_retail_employee.json
  DataBase  : 02_retail
  Collection: employee

  campo: {$type: "number"}

use 02_retail;
db.employee.find({homePhone: {$type: "number"}},{homePhone: 1, _id: 0});           ALIAS QUE AGRUPA VARIOS TIPOS
                                                                                   number: double, 32-bit integer, 64-bit integer, decimal

db.employee.find({homePhone: {$type: 16}});                 NUMBER DEL TIPO: 32-bit integer
db.employee.find({homePhone: {$type: "int"}});				ALIAS DEL TIPO : 32-bit integer 

- MOSTRAR LOS EMPLEADOS DONDE EL TIPO DE DATO DEL CAMPO "HOMEPHONE" SEA CADENA(STRING)

db.employee.find({homePhone: {$type: "string"}},{homePhone: 1, _id: 0});
db.employee.find({homePhone: {$type: 2}},{homePhone: 1, _id: 0});

- MOSTRAR LOS EMPLEADOS DONDE EL TIPO DE DATO DEL CAMPO "HOMEPHONE" SEA NULO(NULL)

db.employee.find({},{})
homePhone: {$type: "null"}
homePhone: 1, _id: 0

db.employee.find({homePhone: {$type: "null"}},{homePhone: 1, _id: 0});
db.employee.find({homePhone: {$type: 10}},{homePhone: 1, _id: 0});

- MOSTRAR LOS EMPLEADOS DONDE EL TIPO DE DATO DEL CAMPO "HOMEPHONE" SEA ENTERO(INT) Y CADENA(STRING)

db.employee.find({},{})
homePhone: {$type: ["number","string"]}
homePhone: 1, _id: 0

db.employee.find({homePhone: {$type: ["number","string"]}},{homePhone: 1, _id: 0});
db.employee.find({homePhone: {$type: [16,2]}},{homePhone: 1, _id: 0});

****************
***   0038   ***   TIPOS DE DATOS BSON  
****************

--------------------------------------------------------------------------------
El formato BSON (Binary JSON) es un formato de almacenamiento y transferencia de
datos  similar  a JSON, pero  con  soporte  para  tipos  de  datos adicionales y
eficiencia binaria. Aquí  tienes  algunos  ejemplos  de  tipos  de  datos   BSON
especificados:
--------------------------------------------------------------------------------

(01) Double: Números de punto flotante de doble precisión.

{ "precio": 19.99 }

(02) String: Cadenas de texto UTF-8.

{ "nombre": "Juan Pérez" }

(03) Object: Documentos anidados BSON.

{ "direccion": { "calle": "Calle Principal", "ciudad": "Ciudad Principal" } }

(04) Array: Listas ordenadas de valores.

{ "numeros": [1, 2, 3, 4, 5] }

(05) Binary Data: Datos binarios.

{ "imagen": { "$binary": "..." } }

(06) ObjectId: Identificador único de 12 bytes.

{ "_id": ObjectId("507f1f77bcf86cd799439011") }

(07) Boolean: Valores booleanos (true o false).

{ "activo": true }

(08) Date: Fecha y hora.

{ "fecha": ISODate("2024-02-23T12:00:00Z") }

(09) Null: Valor nulo.

{ "campo": null }

(10) Regular Expression: Expresiones regulares.

{ "expresion_regular": { "$regex": "^Hello", "$options": "i" } }

(11) Timestamp: Marca de tiempo de 64 bits.

{ "timestamp": Timestamp(1645641600, 1) }

(12) Int32: Enteros de 32 bits.

{ "cantidad": 10 }

(13) Int64: Enteros de 64 bits.

{ "poblacion_mundial": NumberLong("7760000000") }

(14) Decimal128: Números decimales de 128 bits.

{ "monto": NumberDecimal("123.456") }

(15) MinKey y MaxKey: Valores mínimos y máximos posibles.

{ "minimo": MinKey(), "maximo": MaxKey() }


****************
***   0039   ***   OPERADORES DE EVALUACION   
****************

$regex: Selecciona documentos donde los valores coinciden con una expresión regular
{<field>:{$regex:/pattern/,$options:'<options>'}}
{<field>:{$regex:'pattern',$options:'<options>'}}
{<field>:{$regex:/pattern/<options>}}

$expr: Permite el uso de expresiones de agregación dentro del lenguaje de consulta
{$expr:{<expression>}}

$mod: Realiza una operación de módulo sobre el valor de un campo y selecciona documentos con un resultado especificado
{field:{$mod:[divisor,remainder]}}

--------------------------------------------------------------------------------
$regex  Proporciona  funciones  de  expresiones  regulares para coincidencias de
patrones en las consultas. O en otras palabras, este operador se usa para buscar
la cadena dada en la colección especificada. Es útil cuando no sabemos el  valor
del campo exacto que estamos buscando en el documento.
--------------------------------------------------------------------------------

- MOSTRAR LOS EMPLEADOS QUE LES GUSTA "VIAJAR" A TRAVES DEL CAMPO  "DESCRIPTION"
  SE PUEDE REALIZAR LA BUSQUEDA CON LA PALABRA CLAVE "TRAVEL".
  
db.employee.find({description:"travel"},{});    Esto no da ningún resultado ya que no existe ningun campo description con el valor "travel"

db.employee.find({},{})
description: {$regex: "travel"}
description: 1, _id: 0

db.employee.find({description: {$regex: "travel"}},{description: 1, _id: 0});

- MOSTRAR TODOS LOS EMPLEADOS QUE SE DEDIQUEN A "ATENCION AL CLIENTE(CUSTOMER SUPPORT)",
  A TRAVES DEL CAMPO "TITLE" SE PUEDE REALIZAR LA BUSQUEDA CON LA PALABRA
  CLAVE "SUPPORT"

db.employee.find({title: {$regex: "Support"}},{title: 1, _id: 0});                Solo los que coincide exactamente con la palabra tanto en mayuscula como minuscula
db.employee.find({title: {$regex: "Support", $options: "i"}},{title: 1, _id: 0}); Que no haga distinción entre mayusculas y minusculas

- MOSTRAR TODOS LOS DOCUMENTOS DE AQUELLOS EMPLEADOS CUYO NOMBRE COMIENZA CON LA LETRA "A",
  A TRAVES DEL CAMPO "FIRSTNAME" SE PUEDE REALIZAR LA BUSQUEDA 

db.employee.find({firstName: {$regex: "^A"}},{firstName: 1, _id: 0});         Los que inicien en A
db.employee.find({firstName: {$regex: "^And"}},{firstName: 1, _id: 0});       Los que comiencen con And


db.employee.find({firstName: {$regex: "A$", $options: "i"}},{firstName: 1, _id: 0});         Los que terminen en A sin importar mayuscula de minuscula
                                                                                             El símbolo $ representa el final de la cadena en una expresión regular.

db.employee.find({firstName: {$regex: ".*dr.*", $options: "i"}},{firstName: 1, _id: 0});     Que contenga la cadena "dr" en cualquier parte del nombre
                                                                                             El .* antes y después de "dr" permite que haya cualquier cantidad de caracteres antes y después de "dr".
																							 
- MOSTRAR TODOS LOS DOCUMENTOS DE AQUELLOS EMPLEADOS CUYO NOMBRE TERMINAN CON LA LETRA "Y",A TRAVES DEL CAMPO FIRSTNAME SE PUEDE REALIZAR LA BUSQUEDA

db.employee.find({firstName: {$regex: "y$", $options: "i"}},{firstName: 1, _id: 0}); 	

--------------------------------------------------------------------------------
OPERADOR DE EVALUACION SIN UTILIZAR $REGEX
Podemos hacer coincidencia de patrones sin usar el operador $regex. Simplemente,
usando un objeto de expresión regular para especificar una expresión regular.

db.employee.find({description: /travel/},{description: 1, _id: 0});
--------------------------------------------------------------------------------

****************
***   0040   ***   OPERADOR DE EVALUACION $EXPR  
****************

--------------------------------------------------------------------------------
$expr   Puede   crear   expresiones   de  consulta que comparen campos del mismo
documento.
--------------------------------------------------------------------------------

delay: 4        (Número de tardanzas que tiene)
tolerance: 10   (Máximo número de tardanzas que puede realizar)

- MOSTRAR LOS EMPLEADOS DONDE LA "TARDANZA(DELAY) SEA MENOR A LA TOLERANCIA(TOLERANCE)

db.employee.find({},{})
$expr: {$lt: ["delay","tolerance"]}
delay: 1, tolerance: 1, _id: 0

db.employee.find({$expr: {$lt: ["$delay","$tolerance"]}},{delay: 1, tolerance: 1, _id: 0});

- MOSTRAR LOS EMPLEADOS DONDE LA "TARDANZA(DELAY)" ES MAYOR A LA "TOLERANCIA(TOLERANCE)"

db.employee.find({$expr: {$gt: ["$delay","$tolerance"]}},{delay: 1, tolerance: 1, _id: 0});

- MOSTRAR LOS EMPLEADOS DONDE LA "TARDANZA(DELAY)" ES IGUAL A LA "TOLERANCIA(TOLERANCE)"

db.employee.find({$expr: {$eq: ["$delay","$tolerance"]}},{delay: 1, tolerance: 1, _id: 0});

****************
***   0041   ***   OPERADOR DE EVALUACION $MOD  
****************

--------------------------------------------------------------------------------
$mod Devuelve el   error si  la  matriz de [divisor, resto] contiene menos o más
de dos elementos.
--------------------------------------------------------------------------------

- MOSTRAR LOS EMPLEADOS QUE TIENEN AÑOS PARES

db.employee.find({age: {$mod: [2,0]}},{age: 1, _id: 0});     Si pone 2.5 tomará sólo el 2 tener cuiado 

- MOSTRAR LOS EMPLEADOS QUE TIENEN AÑOS IMPARES

db.employee.find({age: {$mod: [2,1]}},{age: 1, _id: 0});

****************
***   0042   ***   OPERADORES ARRAY   
****************

--------------------------------------------------------------------------------
$all 
Coincide con matrices que  contienen  todos  los  elementos  especificados en la
consulta.

{<field>: {$all:[<value>,<value2>...]}}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
$elemMatch
Selecciona documentos si el elemento en el campo de la matriz coincide con todas
las condiciones $elemeMatch especificadas.

{<field>:{$elemMatch:{<query1>,<query2>,...}}}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
$size
Selecciona documentos si el campo de matriz tiene un tamaño especificado.

db.collection.find({field:{$size:2}});
--------------------------------------------------------------------------------

****************
***   0043   ***   BUSCAQUEDA CLASICA EN UN ARRAY  
****************

- MOSTRAR LOS EMPLEADOS QUE TIENEN COMO "PASATIEMPO(HOBBIE) BAILE(DANCE)

(1)

db.employee.find({},{})
hobbies: {title: "Dance", frequency: 3}
employeeID: 1, hobbies: 1, _id: 0

db.employee.find({hobbies: {title: "Dance", frequency: 3}},{employeeID: 1, hobbies: 1, _id: 0});

(2)

'hobbies.title': 'Dance'     Condición
db.employee.find({'hobbies.title': 'Dance'},{employeeID: 1, hobbies: 1, _id: 0});


****************
***   0044   ***   OPERADOR ARRAY: $ALL   
****************

--------------------------------------------------------------------------------
$all
Selecciona los documentos donde el valor de un campo es una matriz que  contiene
todos los elementos especificados. Además , el  operador   $all   también brinda
soporte para hacer coincidir matrices anidadas si está presente  en  algún campo
--------------------------------------------------------------------------------

state: Los estados en la que trabaja cada empleado

- MOSTRAR LOS EMPLEADOS QUE TRABAJAN EN EL "ESTADO(STATE)" DE "FLORIDA Y OHIO"
  SIN IMPORTAR EL ORDEN DE LOS ESTADOS EN EL ARRAY.
  
db.employee.find({state: ["Florida","Ohio"]},{employeeID: 1, state: 1, _id: 0});  Solo me trae lo que coincidan exactamente con la lista por lo que no es la solución

Haremos tres formas distintas de llegar al mismo resultado
  
(1) Solución con el operador $all

db.employee.find({},{})
Condición     : state: {$all: ["Florida", "Ohio"]}
Campos a traer: employeeID: 1, state: 1, _id: 0

db.employee.find({state: {$all: ["Florida", "Ohio"]}},{employeeID: 1, state: 1, _id: 0});  Esta si es la solución

(2) Solución con el operador $and equivalente al $all

Condición     : $and: [{state: "Florida"}, {state: "Ohio"}]
Campos a traer: employeeID: 1, state: 1, _id: 0
db.employee.find({$and: [{state: "Florida"}, {state: "Ohio"}]},{employeeID: 1, state: 1, _id: 0});

(3) Solución con el operador $in equivalente al $all
  
Condición     : state: {$in: ["Florida","Ohio"]}
Campos a traer: employeeID: 1, state: 1, _id: 0

db.employee.find({state: {$in: ["Florida","Ohio"]}},{employeeID: 1, state: 1, _id: 0});

****************
***   0045   ***   OPERADOR ARRAY: $ELEMMATCH   
****************

score: Calificación de cada empleado dado por el cliente 
       Es un array [80, 90, 95]
hobbies: Pasatiempo de cada empleado y con que frecuencia a la semana lo practica
		 Es un array que tiene subdocumentos
--------------------------------------------------------------------------------
$elemMatch
Muestra los documentos que  contienen  un  campo Matriz(Array)  con  al menos un
elemento que coincide con todos los criterios de consulta especificados.
--------------------------------------------------------------------------------

- MOSTRAR LOS EMPLEADOS QUE TENGAN UNA "CALIFICACION(SCORE)" MAYOR O IGUAL A 90
  Y MENOR QUE 95.
  
db.employee.find({},{})
  
Condición     : score: {$elemMatch: {$gte: 90, $lt: 95}}             Mayor o igual a 90 y menor a 95    Por ejemplo 80 90 95. En esta lista 90 cumple entonces muestra el documento
Campos a traer:  employeeID: 1, score: 1, _id: 0
db.employee.find({score: {$elemMatch: {$gte: 90, $lt: 95}}},{employeeID: 1, score: 1, _id: 0});

- MOSTRAR LOS EMPLEADOS QUE PRACTIQUEN EL DEPORTE DE "VOLEY" Y TENGAN UNA FRECUENCIA
  (FREQUENCY) MAYOR O IGUAL 3 VECES A LA SEMANA.

(1) Solucion usando el operador $and    (Parece una solución pero no lo es trae algunos que no cumplen por ejemplo frequency:4 y frequency: 2 elije porque cumple 4 pero es de Golf en empleado 4

Condición     : $and: [{"hobbies.title": "Voley"},{"hobbies.frequency": {$gte: 3}}]
Campos a traer: employeeID: 1, hobbies: 1, _id: 0
db.employee.find({ $and: [{"hobbies.title": "Voley"},{"hobbies.frequency": {$gte: 3}}]},{employeeID: 1, hobbies: 1, _id: 0});

(2) Solución correcta usando el operador $elemMatch

Condición     : hobbies: {$elemMatch: {title: "Voley", frequency: {$gte: 3}}}
Campos a traer: employeeID: 1, hobbies: 1, _id: 0
db.employee.find({hobbies: {$elemMatch: {title: "Voley", frequency: {$gte: 3}}}},{employeeID: 1, hobbies: 1, _id: 0});

--------------------------------------------------------------------------------
CONDICION DE CONSULTA UNICA
Si especifica una única <query(consulta)> condicional en la expresión $elemMatch
y no  estamos  utilizando  los  operadores  $not  o  $ne  dentro  de $elemMatch, 
$elemMatch puede ser omitido.
--------------------------------------------------------------------------------

- MOSTRAR LOS EMPLEADOS QUE PRACTIQUEN EL DEPORTE DE "BAILE(DANCE)".

(1)

Condición     : hobbies: {$elemMatch: {title: "Dance"}}
Campos a traer: employeeID: 1, hobbies: 1, _id: 0
db.employee.find({hobbies: {$elemMatch: {title: "Dance"}}},{employeeID: 1, hobbies: 1, _id: 0});

(2)

En este caso no es necesario el operador $elemMatch de 1 y se puede sóo solucionar como en 2 porque es condicion de consulta única

db.employee.find({"hobbies.title": "Dance"},{employeeID: 1, hobbies: 1, _id: 0});

****************
***   0046   ***   OPERADOR ARRAY: $SIZE 
****************

--------------------------------------------------------------------------------
$size
Se utiliza para obtener el documento que tiene un campo de matriz (Array) de  un
tamaño específico.
--------------------------------------------------------------------------------

- MOSTRAR LOS EMPLEADOS QUE TIENEN 2 "PASATIEMPOS(HOBBIES)"

Condición     : hobbies: {$size: 2}        Debe haber 2 documentos en la lista
Campos a traer: employeeID: 1, hobbies: 1, _id: 0
db.employee.find({hobbies: {$size: 2}},{employeeID: 1, hobbies: 1, _id: 0});

- MOSTRAR LOS EMPLEADOS QUE TRABAJAN EN 3 "ESTADOS(STATE)"

Condición     : state: {$size: 3}        Debe haber 3 cadenas en la lista
Campos a traer: employeeID: 1, state: 1, _id: 0
db.employee.find({state: {$size: 3} },{employeeID: 1, state: 1, _id: 0});


****************
***   0047   ***   APRENDIENDO CURSORES & METODOS
****************

find : Nos devuelve  un cursor. Los cursores nos traen los documentos en bloques de 20 en 20. Si queremos traer el siguiente bloque de documentos hacemos uso del comando "it".
El cursor es un puntero que tiene almacenada la consulta por lo que si queremos seguir traendo bloques a traves de la red se escribe el comando "it". Si usamos algún driver
o controlador que nos permite mongoDB podemos controlar la cantidad de documentos
que nos trae el cursor en cada bloque por ejempls los 10 primeros documentos por lo
que podemos controlar manualmente la cantidad de documentos de cada bloque. 
Cuando trabajamos con un driver el cursor trabaja de manera diferente por lo
que la mayoria de los driver tienen para el cursor un método llamado next() al
cual podemos llamar para que el cursor trabaje de manera diferente es decir en lugar
de traer los documentos de 20 en 20 traiga una cantidad según nuestras necesidades
particulares.
findOne: No nos devuelve un cursor

--------------------------------------------------------------------------------
El método del cursor .next() se usa para devolver el siguiente documento  en  un
cursor.
--------------------------------------------------------------------------------

db. product.find().next() nos devuelve el primer documentro a traves del cursor
cada vez que ejecutamos nos traer siempre el mismo primer documento pero si
lo almacenamos en una variable funciona de otra manera para los cual usaremos
javascript.

const dataCursor = db.product.find()
dataCursor.next()   Nos trae un documento
dataCursor.next()   Nos trae otro documento distinto al anterior
dataCursor.next()   Nos trae otro documento distinto al anterior y asi sucesivamente

Así es como trabaja el cursor 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
El método del cursor .forEach() itera el cursor para aplicar una función
JavaScript a cada documento desde el cursor.

Sintaxis:

db.collection.find().forEach(<function>)

Ejemplo:

dataCursor.forEach(data => {printjson(data)})    Nos trae todos los documentos de uno en uno
                                                 recorremos todos los documentos del cursor
												 realidad se guarda la referencia del cursor
												 y traemos de uno en uno desde esa referencia
												 documento por documento
												 
dataCursor.next()     Nos da error porque ya hemos traido todos los documentos
                      desde ese cursor osea desde esa referencia de cursor
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
El método .hasNext() devuelve "true" si el cursor se puede iterar, y "false" si
no hay documentos a iterar.

dataCursor.hasNext()     Nos da false porque nuestra constante que guarda la referencia
                         al cursor nos dice que no tiene mas documentos que iterar es decir el cursor esta agotado
						 
const dataCursor = db.product.find()
dataCursor.hasNext()          Ahora ya nos da verdadero hay documentos por iterar desde el cursor
--------------------------------------------------------------------------------

****************
***   0048   ***   METODO CURSOR SORT()  
****************

El método cursor sort() especifica el orden en que la consulta devuelve documentos coincidentes

- ORDENAR DE MANERA ASCENDENTE/DESCENDENTE LOS PRODUCTOS POR EL "ID"

db.product.find().sort({id: 1})     Te trae de manera ascendente de 20 en 20 pero los primeros 20 son demanera descendente por eso traera los primeros 20 documentos desde el id: 1 al id: 20

db.product.find().sort({id: -1})    De manera descendente

- ORDENAR DE MANERA ASCENDENTE/DESCENDENTE LOS PRODUCTOS POR EL "NOMBRE" DEL PRODUCTO(PRODUCTNAME)

db.product.find().sort({productName: 1})                   Ascendente por el campo productName
db.product.find().sort({productName: -1})                  Descendente por el campo productName

- ORDENAR DE MANERA ASCENDENTE/DESCENDENTE LOS PRODUCTOS POR EL NOMBRE DEL PROVEEDOR(CONTACTNAME)

El campo a ordenar es un subdocumento que esta en una lista. Para llegar al campo a ordenar hay que indicar la ruta de anidamiento.

db.product.find().sort({})
'categories.suppliers.contactName': 1

db.product.find().sort({'categories.suppliers.contactName': 1})

db.product.find({},{'categories.suppliers.contactName': 1, _id: 0}).sort({'categories.suppliers.contactName': 1})

****************
***   0049   ***   METODO CURSOR TOARRAY()  
****************

--------------------------------------------------------------------------------
El método cursor toArray() devuelve una matriz que contiene todos los documentos de un cursor. El método
itera completamente el cursor, cargando todos los documentos en la RAM hasta agotar el cursor.
--------------------------------------------------------------------------------

- MOSTRAR TODOS LOS "EMPLEADOS(EMPLOYEE)" A TRAVES DEL METODO CURSOR "TOARRAY()"

db.employee.find().toArray()                      Itera completamente todo el cursor es decir nos trae una lista con todos los documentos peligroso satura la RAM

****************
***   0050   ***   METODO CUSOR SKIP()  
****************

El método cursor skip() nos permite controlar dónde comienza a devolver los resultados

- MOSTRAR LOS PRODUCTOS ORDENADOS DE MANERA ASCENDENTE POR EL "ID" Y OMITIR LOS 10 PRIMEROS PRODUCTOS

db.product.find().sort({id: 1}).skip(10);


****************
***   0051   ***   METODO CUSOR LIMIT();   
****************

El método cursor limit() nos permite especificar que el número máximo de documentos que nos devolverá el cursor

- MOSTRAR LOS PRODUCTOS ORDENADOS DE MANERA ASCENDENTE POR EL "ID", OMITIR LOS 10 PRIMEROS PRODUCTOS Y SOLO MOSTRAR
  SOLO LOS PROXIMOS 15 PRODUCTOS.
  
db.product.find().sort({id: 1}).skip(10).limit(15)  

****************
***   0052   ***   METODO CUSOR COUNT();   
****************

El método cursor count() cuenta el número de documentos a los que hace refencia un cursor.

Sintaxis:

db.collection.find(<query>).count()

- CONTAR LA CANTIDAD DE PRODUCTOS QUE TENEMOS

db.product.find().count()     Cuenta la cantidad de documentos y nos da 63

- CONTAR LOS PRODUCTOS ORDENADOS DE MANERA ASCENDENTE POR EL "ID", OMITIR LOS 10 PRIMEROS PRODUCTOS Y SOLO MOSTRAR
  LOS PROXIMOS 15 PRODUCTOS
  
Con limit estamos llamando a los proximos 15 documentos.

db.product.find().sort({id: 1}).skip(10).limit(15).count();   Nos da 15


****************
***   0053   ***   METODO CUSOR PRETTY();   
****************

El método cursor pretty() configurar el cursor para mostrar los resultados en un formato fácil de leer.

- MOSTRAR TODOS LOS PRODUCTOS.

db.product.find().pretty();     Para versiones anteriores para mostrar documentos de manera legible pero actualmente y a los muestra legibles

****************
***   0054   ***   PROYECCION DE CAMPOS SIMPLES Y EMBEBIDOS 
****************

Especifica campos devueltos por una operacion. Aveces no es necesario traer todos los campos a traves de la red.

db.product.find({},{})
Campos a traer: productName: 1, quantityPerUnit: 1, unitPrice: 1, unitsInStock: 1, _id: 0

db.product.find({},{productName: 1, quantityPerUnit: 1, unitPrice: 1, unitsInStock: 1, _id: 0})

- MOSTRAR UN CAMPO EMBEBIDO

db.product.find({},{})
Campos a traer: productName: 1, quantityPerUnit: 1, unitPrice: 1, unitsInStock: 1, _id: 0, 'categories.categoryName': 1

db.product.find({},{productName: 1, quantityPerUnit: 1, unitPrice: 1, unitsInStock: 1, _id: 0, 'categories.categoryName': 1})


****************
***   0055   ***   OPERADOR DE PROYECCION $
****************

El operador de proyección $ limita el contenido de una matriz(array) para devolver el primer elemento que coincida con la condición
de la consulta matriz(array)

Utilizamos el operador $ en el documento de proyeccion del metodo find() o findOne() cuando solo necesitamos un elmento particular
de la matriz(array) en documentos seleccionados.

Sintaxis:

db.collection.find({<array>:<condition>...},{"<array.$>":1})
db.collection.find({<array.field>:<condition>...},{"<array.$>":1})

- MOSTRAR LOS EMPLEADOS QUE TENGAN UN PUNTAJE(SCORE) MAYOR O IGUAL A 80, SOLO SE DEBE MOSTRAR EL PRIMER ELEMENTO DE LA MATRIZ
QUE CUMPLA CON LA CONDICION. UTILIZAR PROYECCIONES.


db.employee.find({},{})
Condición           : score: {$gte: 80}
Traer solo lo campos: 'score.$': 1

db.employee.find({score: {$gte: 80}},{'score.$': 1}).sort({employeeID: 1})

Me voy ahora solo traer algunos campos

db.employee.find({score: {$gte: 80}},{_id: 0, employeeID: 1, firstName: 1, 'score.$': 1}).sort({employeeID: 1})

- MOSTRAR LOS EMPLEADOS DONDE LA FRECUENCIA(FREQUENCY) DE SU PASATIEMPO(HOBBIES) SEA MAYOR A 3, SOLO SE DEBE
MOSTRAR EL PRIMER ELEMENTO DE LA MATRIZ QUE CUMPLA CON LA CONDICION. UTILIZAR PROYECCIONES.

$ indica el primer el elemento de la lista o matriz o array que coincida.

db.employee.find({},{})
Condición     :  'hobbies.frequency': {$gt: 3}
Campos a traer:  _id: 0, employeeID: 1, firstName: 1, 'hobbies.$': 1

db.employee.find({'hobbies.frequency': {$gt: 3}},{_id: 0, employeeID: 1, firstName: 1, 'hobbies.$': 1}).sort({employeeID: 1})

****************
***   0056   ***   OPERADOR DE PROYECCION $ELEMMATCH
****************

El operador de proyeccion $elemmatch similar al operador $, también limita el contenido de una matriz al primer
elemento que se ajusta a la restricción dada.

Sintaxis:

db.collection.find({<array>:<condition>...}, {"<array>.$elemMatch": ($elemMatch operator)}}

- MOSTRAR LOS EMPLEADOS QUE TENGAN EL CARGO(TITLE) DE REPRESENTANTE DE VENTAS(SALES REPRESENTATIVE) Y
QUE REALICEN EL PASATIEMPO(HOBBIE) DE BAILE(DANCE). UTILIZAR PROYECCIONES.

db.employee.find({},{})
Condición (filtro)         :  title: "Sales Representative"
Campos a traer (proyeccion):  _id: 0, employeeID: 1, firstName: 1, title: 1, hobbies: {$elemMatch: {title: "Dance"}}   Nos traiga el primer elemento de la matriz siempre que el title tenga el valor Dance

db.employee.find({title: "Sales Representative"},{_id: 0, employeeID: 1, firstName: 1, title: 1, hobbies: {$elemMatch: {title: "Dance"}}}).sort({employeeID: 1});

Si el campo title coincide sólo nos trae dichos campos pero no el de la matriz si no cumple (por eso me trae el empleado 4) el operador $ no lo traería pero el operador $elemMatch si lo trae.

****************
***   0057   ***   OPERADOR DE PROYECCION $SLICE     
****************

El operador de proyección $slice decide la recuperación de una cantidad de elementos de una matriz(array) que devuelve una consulta.

Sintaxis:

db.collection.find({field: value},{array:{$slice:count|[skip,limit]}})

- MOSTRAR LAS DOS PRIMERAS CALIFICACIONES(SCORE) DE LOS EMPLEADOS

db.employee.find({},{})
Condición (filtro)         :  
Campos a traer (proyeccion):  score: {$slice: 2}    Nos traer solo los dos primeros valores de la matriz(array)

db.employee.find({},{score: {$slice: 2}}).sort({employeeID: 1});

db.employee.find({},{_id:0, emplyeeID: 1, score: {$slice: 2}}).sort({employeeID: 1});

- MOSTRAR LAS DOS ULTIMAS CALIFICACIONES(SCORE) DE LOS EMPLEADOS

db.employee.find({},{})
Condición (filtro)         :  
Campos a traer (proyeccion):  score: {$slice: -2}  Nos trae solo los dos ultimos valores de la matriz(array)  es igual al anterior solo cambia 2 por -2

db.employee.find({},{score: {$slice: -2}}).sort({employeeID: 1});

db.employee.find({},{_id:0, employeeID: 1, score: {$slice: -2}}).sort({employeeID: 1});

- MOSTRAR EL SEGUNDO Y TERCER CALIFICACION(SCORE) DE LOS EMPLEADOS

db.employee.find({},{})
Condición (filtro)         :  
Campos a traer (proyeccion):  score: {$slice: [1, 3]}    Omite el 1 primer valor y limita hasta el 3er valor de la matriz

db.employee.find({},{score: {$slice: [1, 3]}}).sort({employeeID: 1});

db.employee.find({},{_id:0, employeeID: 1, score: {$slice: [1, 3]}}).sort({employeeID: 1});

- MOSTRAR LAS DOS PRIMERAS CALIFICACION(SCORE) DE LOS EMPLEADOS QUE TENGAN EN CARGO DE REPRESENTANTE DE VENTAS(SALES REPRESENTATIVE)

db.employee.find({},{})
Condición (filtro)         :  title: "Sales Representative"
Campos a traer (proyeccion):  _id:0, employeeID: 1, score: {$slice: 2}       Solo sus dos primeras calificaciones

db.employee.find({title: "Sales Representative"},{score: {$slice: 2}})

db.employee.find({title: "Sales Representative"},{_id:0, employeeID: 1, score: {$slice: 2}})




****************
***   0058   ***   
****************


****************
***   0059   ***   
****************


****************
***   0060   ***   
****************


****************
***   0056   ***   
****************


















