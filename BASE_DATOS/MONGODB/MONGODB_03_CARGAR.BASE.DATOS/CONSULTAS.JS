-- MOSTRAR EL NUMERO DE LIBROS DISPONIBLES Y NO DISPONIBLES

db.libros.aggregate([
  { $group: {                                    
      _id: "$disponible",                             
      totalVentas: { $sum: "$precio" },           
      cantidadVentas: { $sum: 1 }                 
  }},
  { $sort: { totalVentas: -1 } }                  
]);

// SALIDA

[
  { _id: true, totalVentas: 81.47, cantidadVentas: 4 },
  { _id: false, totalVentas: 18.75, cantidadVentas: 1 }
]

- ELIMINAR CAMPOS DE UN DOCUMENTO (POR EJEMPLO EL CAMPO RESEÑA)

db.libros.updateMany(
  {},       // SIN FILTRO
  { $unset: { reseñas: []} }
);

- ELIMINAR EL CAMPO DISPONIBLE PARA TODOS LOS LIBROS CON MAS DE 300 PAGINAS

db.libros.updateMany(
  {paginas: {$gt: 300}},
  {$unset: { disponible: ""}}
);