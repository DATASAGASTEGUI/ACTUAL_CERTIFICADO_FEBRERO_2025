// Selección o creación de la base de datos
use factoria;

// 1. Cliente - Pasaporte (Uno a Uno), Cliente - Pedido (Uno a Muchos)
db.cliente.insertMany(
[
{
    _id: 2111,
    nombre_empresa: "JCP Inc.",
	limite_credito: 50000,
    pasaporte: {
        id: 1,
        numero: "X1234567"
    },
	pedidos: [
	    {id: 113012, fecha:"1990-01-11", cantidad: 35},
		{id: 112975, fecha:"1989-10-12", cantidad: 6}
	],
	productos: ["P1"]
},
{
    _id: 2102,
    nombre_empresa: "First Corp.",
	limite_credito: 65000,
    pasaporte: {
        id: 2,
        numero: "Y1234567"
    },
	pedidos: [
		{id: 112968, fecha:"1989-10-12", cantidad: 34}
	],
	productos: ["P1","P2"]
}
]);

db.producto.insertMany(
[{_id: "P1", descripcion: "Lápiz"},
 {_id: "P2", descripcion: "Cuaderno"}
]);

-- ---------
-- CONSULTAS
-- ---------

-- 1: Uno a Uno: Mostrar todos los clientes con su pasaporte

db.cliente.find({},{nombre_empresa:1, "pasaporte.numero": 1})
// SALIDA
[
  {
    _id: 2111,
    nombre_empresa: 'JCP Inc.',
    pasaporte: { numero: 'X1234567' }
  },
  {
    _id: 2102,
    nombre_empresa: 'First Corp.',
    pasaporte: { numero: 'Y1234567' }
  }
]

-- 2: Uno a Muchos: Mostrar los pedidos por cliente

db.cliente.find({},{nombre_empresa:1, pedidos: 1})

// SALIDA

[
  {
    _id: 2111,
    nombre_empresa: 'JCP Inc.',
    pedidos: [
      { id: 113012, fecha: '1990-01-11', cantidad: 35 },
      { id: 112975, fecha: '1989-10-12', cantidad: 6 }
    ]
  },
  {
    _id: 2102,
    nombre_empresa: 'First Corp.',
    pedidos: [ { id: 112968, fecha: '1989-10-12', cantidad: 34 } ]
  }
]

-- 3: Muchos a Muchos: Mostrar los productos(hijos) por cliente(padre)

db.cliente.aggregate([
  {
    $lookup: {
      from: "producto",
      localField: "productos",
      foreignField: "_id",
      as: "detalle_productos"
    }
  },
  {
    $project: {
      nombre_empresa: 1,
	  _id: 0,
      productos: "$detalle_productos.descripcion"
    }
  }
]);

// SALIDA

[
  { nombre_empresa: 'JCP Inc.', productos: [ 'Lápiz' ] },
  { nombre_empresa: 'First Corp.', productos: [ 'Lápiz', 'Cuaderno' ] }
]

