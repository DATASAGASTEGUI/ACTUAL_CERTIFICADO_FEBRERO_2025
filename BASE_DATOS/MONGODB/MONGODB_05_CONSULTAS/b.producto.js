b.producto.find();

db.producto.find().sort({"nombre": 1});

db.producto.find({"nombre": "Portátil HP Pavilion"});

db.producto.distinct("categorias");

db.producto.distinct("nombre");

db.producto.find({"categorias": "fotografía"});

db.producto.find({"categorias": "fotografía"},{nombre:1,_id:0 });

db.producto.distinct("categorias").length

db.producto.aggregate([
  {
    $group: {
      _id: "$categorias",
      totalProductos: { $sum: 1 }
    }
  }
])

use('tienda');
db.producto.find({}, { nombre: 1, categorias: 1, _id: 0 }).forEach(function(doc) {
    printjson(doc);
});

db.producto.find({}, { nombre: 1, categorias: 1, _id: 0 });

db.producto.find({}, { precio: 1, nombre: 1 }).sort({"precio": -1});