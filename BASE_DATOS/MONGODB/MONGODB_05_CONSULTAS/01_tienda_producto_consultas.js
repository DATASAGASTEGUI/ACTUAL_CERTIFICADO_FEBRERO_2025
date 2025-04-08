--------------------------------------------------------------------------------
(0001) MOSTRAR TODOS LOS DOCUMENTOS

db.producto.find();
--------------------------------------------------------------------------------
(0002) MOSTRAR TODOS LOS DOCUMENTOS ORDENADOS POR _ID ASC Y DESC

db.producto.find().sort({"_id": 1});       ASC
db.producto.find().sort({"_id": -1});      DESC
--------------------------------------------------------------------------------
(0003) BUSCAR UN DOCUMENTO POR EL NOMBRE DEL PRODUCTO

db.producto.find({"nombre": "Portátil HP Pavilion"});
--------------------------------------------------------------------------------
(0004) MOSTRAR LAS DISTINTAS CATEGORIAS QUE EXISTEN

db.producto.distinct("categorias") 
--------------------------------------------------------------------------------
(0005) MOSTRAR TODOS LOS DOCUMENTOS CUYO PRODUCTO PERTENEZCA A LA CATEGORIA
       FOTOGRAFIA

db.producto.find({"categorias": "fotografía"});
--------------------------------------------------------------------------------
(0006) MOSTRAR LA CANTIDAD TOTAL DE CATEGORIAS QUE EXISTEN

db.producto.distinct("categorias").length
--------------------------------------------------------------------------------
(0007) MOSTRAR LAS DISTINTAS CATEGORIAS QUE EXISTEN Y CUANTOS PRODUCTOS TIENE
       CADA CATEGORIA

db.producto.aggregate([
  {
    $group: {
      _id: "$categorias",
      totalProductos: { $sum: 1 }
    }
  }
])

Para mostrar las distintas categorías que existen y la cantidad de productos 
que tiene cada categoría en MongoDB, puedes usar la función de agregación 
aggregate() junto con el operador $group. 

Esta consulta agrupa los documentos por el campo "categorias" y luego cuenta 
el número de documentos en cada grupo. El resultado mostrará cada categoría 
única junto con la cantidad de productos que tiene.
--------------------------------------------------------------------------------
(0008)  MOSTRAR TODOS LOS DOCUMENTOS PERO SOLO  LOS  CAMPOS  NOMBRE Y CATEGORIAS

db.producto.find({},{nombre: 1, categorias: 1});

El campo _id por defecto siempre lo trae, para evitarlo se tendria que poner:

db.producto.find({},{nombre: 1, categorias: 1, _id: 0});

db.producto.find({},{nombre: 1, categorias: 1, _id: 0}).toArray();

db.producto.find({}, { nombre: 1, categorias: 1, _id: 0 }).forEach(function(doc) {
    printjson(doc);
});
--------------------------------------------------------------------------------
(0009) PORQUE TOARRAY NO TRAE TODO CUANDO ES MUY GRANDE LA CANTIDAD DE DATOS

El problema que estás experimentando podría estar relacionado con el límite de 
tamaño de lote de MongoDB. Por defecto, MongoDB limita el tamaño de los lotes d
e resultados para evitar la sobrecarga de memoria y mejorar el rendimiento. 
Cuando se ejecuta una consulta que devuelve muchos resultados, MongoDB los entrega
 en lotes más pequeños.

Para manejar este problema y obtener todos los resultados, puedes usar la función 
forEach() en lugar de toArray() en tu consulta. Aquí te muestro cómo hacerlo:

db.producto.find({}, { nombre: 1, categorias: 1, _id: 0 }).forEach(function(doc) {
    printjson(doc);
});

Al utilizar forEach(), MongoDB manejará automáticamente la paginación de los resultados
y te permitirá procesar todos los documentos en la colección, uno a la vez, sin afectar 
la memoria de manera significativa.

Ten en cuenta que esto imprimirá cada documento individualmente en la consola. 
Si necesitas procesar los resultados de alguna manera específica, puedes realizar 
esa lógica dentro de la función forEach().

--------------------------------------------------------------------------------
(0010) MOSTRAR TODOS LOS DOCUMENTOS PERO SOLO LOS CAMPOS PRECIO Y NOMBRE Y
       ORDENADOS POR EL PRECIO DE FORMA DESCENDENTE

db.producto.find({}, { precio: 1, nombre: 1 }).sort({"precio": -1});
--------------------------------------------------------------------------------
(0011) MOSTRAR TODOS LOS DOCUMENTOS PERO SOLO CON EL CAMPO NOMBRE Y SOLAMENTE
       2 DOCUMENTOS.

db.producto.find({}, {nombre: 1, _id: 0}).limit(2);

db.producto.find({}, {nombre: 1, _id: 1}).limit(2).sort({_id: 1});
--------------------------------------------------------------------------------
(0012) MOSTRAR TODOS LOS DOCUMENTOS PERO SOLO CON EL CAMPO NOMBRE Y SOLAMENTE
       10 DOCUMENTOS Y ORDENADOS POR EL NOMBRE.
	   
db.producto.find({}, {nombre: 1, _id: 1}).limit(10).sort({"nombre": 1,"_id": 1, }); ASC

db.producto.find({}, {nombre: 1, _id: 1}).limit(10).sort({_id: 1});
--------------------------------------------------------------------------------
(0013) MOSTRAR TODOS LOS DOCUMENTOS PERO SOLO EL CAMPO NOMBRE Y ORDENADO POR EL
       NOMBRE EN FORMA ASCENDENTE.

db.producto.find({}, {nombre: 1, _id: 0}).sort({nombre: 1});
--------------------------------------------------------------------------------
(0014) MOSTRAR LOS PRIMEROS 10 DOCUMENTOS ORDENADO POR EL _ID. SOLO MOSTRAR LOS
       CAMPOS _ID Y NOMBRE

db.producto.find({}, {nombre: 1, _id: 1}).sort({_id: 1}).limit(10);
--------------------------------------------------------------------------------
(0015)


db.producto.find({}, {nombre: 1, _id: 1}).sort({_id: 1}).limit(10).
--------------------------------------------------------------------------------
(0016)


from pymongo import MongoClient

# Establecer conexión con la base de datos
client = MongoClient('localhost', 27017)
db = client['nombre_de_tu_base_de_datos']  # Reemplaza 'nombre_de_tu_base_de_datos' con el nombre real de tu base de datos
collection = db['producto']

# Consulta
result = collection.find({}, {"nombre": 1, "_id": 1}).sort([("_id", 1)]).limit(10)

# Mostrar resultados
for document in result:
    print(document)
--------------------------------------------------------------------------------
(0017)


--------------------------------------------------------------------------------
(0018)


--------------------------------------------------------------------------------
(0019)


--------------------------------------------------------------------------------
(0020)


--------------------------------------------------------------------------------