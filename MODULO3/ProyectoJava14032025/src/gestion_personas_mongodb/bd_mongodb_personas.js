use GESTION_PERSONAS;

db.Persona.drop();

// 5. Insertar registros en la colección "Persona"
db.Persona.insertMany([
  { nombre: 'Juan', apellido: 'Pérez', edad: 28 },
  { nombre: 'María', apellido: 'Gómez', edad: 32 },
  { nombre: 'Carlos', apellido: 'López', edad: 25 },
  { nombre: 'Ana', apellido: 'Martínez', edad: 30 },
  { nombre: 'Luis', apellido: 'Rodríguez', edad: 22 },
  { nombre: 'Sofía', apellido: 'Hernández', edad: 35 },
  { nombre: 'Pedro', apellido: 'García', edad: 40 },
  { nombre: 'Laura', apellido: 'Díaz', edad: 27 },
  { nombre: 'Diego', apellido: 'Torres', edad: 31 },
  { nombre: 'Elena', apellido: 'Ramírez', edad: 29 },
  { nombre: 'Javier', apellido: 'Vargas', edad: 33 },
  { nombre: 'Camila', apellido: 'Flores', edad: 26 },
  { nombre: 'Andrés', apellido: 'Mendoza', edad: 24 },
  { nombre: 'Valeria', apellido: 'Castillo', edad: 36 },
  { nombre: 'Miguel', apellido: 'Silva', edad: 38 },
  { nombre: 'Lucía', apellido: 'Morales', edad: 23 },
  { nombre: 'Fernando', apellido: 'Ortega', edad: 41 },
  { nombre: 'Daniela', apellido: 'Rivas', edad: 28 },
  { nombre: 'Tomás', apellido: 'Cruz', edad: 34 },
  { nombre: 'Isabella', apellido: 'Navarro', edad: 21 },
  { nombre: 'Ricardo', apellido: 'Peña', edad: 37 },
  { nombre: 'Gabriela', apellido: 'Herrera', edad: 30 },
  { nombre: 'Emilio', apellido: 'Reyes', edad: 39 },
  { nombre: 'Natalia', apellido: 'Soto', edad: 27 },
  { nombre: 'Hugo', apellido: 'Campos', edad: 32 },
  { nombre: 'Renata', apellido: 'Aguilar', edad: 25 },
  { nombre: 'Iván', apellido: 'Medina', edad: 33 },
  { nombre: 'Alejandra', apellido: 'Luna', edad: 29 },
  { nombre: 'Sebastián', apellido: 'Iglesias', edad: 26 },
  { nombre: 'Paula', apellido: 'Romero', edad: 31 },
  { nombre: 'Marco', apellido: 'Vega', edad: 24 },
  { nombre: 'Clara', apellido: 'León', edad: 22 },
  { nombre: 'Adrián', apellido: 'Mora', edad: 35 },
  { nombre: 'Daniel', apellido: 'Fuentes', edad: 38 },
  { nombre: 'Julia', apellido: 'Salas', edad: 23 },
  { nombre: 'Mateo', apellido: 'Delgado', edad: 36 },
  { nombre: 'Antonia', apellido: 'Carrillo', edad: 28 },
  { nombre: 'Álvaro', apellido: 'Miranda', edad: 40 },
  { nombre: 'Florencia', apellido: 'Benítez', edad: 30 },
  { nombre: 'Benjamín', apellido: 'Ponce', edad: 27 },
  { nombre: 'Carla', apellido: 'Escobar', edad: 34 },
  { nombre: 'Martín', apellido: 'Campos', edad: 25 },
  { nombre: 'Estefanía', apellido: 'Ríos', edad: 29 },
  { nombre: 'Gonzalo', apellido: 'Acosta', edad: 31 },
  { nombre: 'Josefina', apellido: 'Mejía', edad: 24 },
  { nombre: 'Cristian', apellido: 'Guerrero', edad: 33 },
  { nombre: 'Nicole', apellido: 'Solís', edad: 26 },
  { nombre: 'Mauricio', apellido: 'Arias', edad: 35 },
  { nombre: 'Mónica', apellido: 'Correa', edad: 32 },
  { nombre: 'Fabián', apellido: 'Villar', edad: 39 },
  { nombre: 'Patricia', apellido: 'Núñez', edad: 28 },
  { nombre: 'Oscar', apellido: 'Santana', edad: 37 },
  { nombre: 'Rocío', apellido: 'Suárez', edad: 30 },
  { nombre: 'Santiago', apellido: 'Bravo', edad: 27 },
  { nombre: 'Carmen', apellido: 'Alonso', edad: 23 },
  { nombre: 'Bruno', apellido: 'Valenzuela', edad: 34 },
  { nombre: 'Lorena', apellido: 'Pizarro', edad: 31 }
]);

// 6. Verificar la inserción de los registros
print("Documentos insertados:");
printjson(db.Persona.find().toArray());


db.Persona.insertOne({_id: 1, nombre: 'Arturo', apellido: 'Lescano', edad: 28 });
db.Persona.insertOne({_id: 'P1', nombre: 'Ramón', apellido: 'Lescano', edad: 28 });



