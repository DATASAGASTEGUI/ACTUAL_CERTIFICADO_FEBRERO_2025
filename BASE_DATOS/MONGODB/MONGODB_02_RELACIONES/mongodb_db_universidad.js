// Selección o creación de la base de datos
use universidad;

// 1. Persona - Pasaporte (Uno a Uno)
db.persona.insertOne({
    _id: 1,
    nombre: "Ana",
    pasaporte: {
        id: 101,
        numero: "X1234567"
    }
});

// 2. Autor - Libros (Uno a Muchos)
db.autor.insertOne({
    _id: 1,
    nombre: "Gabriel García Márquez",
    libros: [
        { id: 1, titulo: "Cien años de soledad" },
        { id: 2, titulo: "El coronel no tiene quien le escriba" }
    ]
});

// 3. Estudiantes - Cursos (Muchos a Muchos con referencias)

// Cursos
db.curso.insertMany([
    {
        _id: 1,
        nombre: "Matemáticas"
    },
    {
        _id: 2,
        nombre: "Física"
    }
]);

// Estudiantes
db.estudiante.insertMany([
    {
        _id: 1,
        nombre: "Carlos",
        cursos: [1, 2]  // Referencias a _id de curso
    },
    {
        _id: 2,
        nombre: "Lucía",
        cursos: [1]     // Referencia a _id de curso
    }
]);
