// Conectar a la base de datos (si no estás ya conectado)
use mibiblioteca;

// Eliminar la colección existente (opcional - solo si quieres empezar desde cero)
db.libros.drop();

// Insertar 30 registros de libros que coincidan con la estructura Java
db.libros.insertMany([
  {
    "titulo": "El Principito",
    "autor": "Antoine de Saint-Exupéry",
    "añoPublicacion": 1943,
    "generos": ["Fábula", "Literatura infantil"],
    "precio": 15.99
  },
  {
    "titulo": "1984",
    "autor": "George Orwell",
    "añoPublicacion": 1949,
    "generos": ["Ciencia ficción", "Distopía"],
    "precio": 19.99
  },
  {
    "titulo": "Cien años de soledad",
    "autor": "Gabriel García Márquez",
    "añoPublicacion": 1967,
    "generos": ["Realismo mágico", "Novela"],
    "precio": 22.50
  },
  {
    "titulo": "Don Quijote de la Mancha",
    "autor": "Miguel de Cervantes",
    "añoPublicacion": 1605,
    "generos": ["Novela", "Sátira", "Aventura"],
    "precio": 29.99
  },
  {
    "titulo": "Orgullo y prejuicio",
    "autor": "Jane Austen",
    "añoPublicacion": 1813,
    "generos": ["Novela romántica", "Drama"],
    "precio": 14.95
  },
  {
    "titulo": "Matar a un ruiseñor",
    "autor": "Harper Lee",
    "añoPublicacion": 1960,
    "generos": ["Novela", "Drama"],
    "precio": 18.75
  },
  {
    "titulo": "El Gran Gatsby",
    "autor": "F. Scott Fitzgerald",
    "añoPublicacion": 1925,
    "generos": ["Novela", "Tragedia"],
    "precio": 16.50
  },
  {
    "titulo": "Ulises",
    "autor": "James Joyce",
    "añoPublicacion": 1922,
    "generos": ["Novela modernista", "Ficción experimental"],
    "precio": 24.99
  },
  {
    "titulo": "En busca del tiempo perdido",
    "autor": "Marcel Proust",
    "añoPublicacion": 1913,
    "generos": ["Novela", "Autobiografía"],
    "precio": 34.95
  },
  {
    "titulo": "Rebelión en la granja",
    "autor": "George Orwell",
    "añoPublicacion": 1945,
    "generos": ["Sátira", "Distopía"],
    "precio": 12.99
  },
  {
    "titulo": "El señor de los anillos",
    "autor": "J. R. R. Tolkien",
    "añoPublicacion": 1954,
    "generos": ["Fantasía", "Aventura"],
    "precio": 39.99
  },
  {
    "titulo": "Harry Potter y la piedra filosofal",
    "autor": "J. K. Rowling",
    "añoPublicacion": 1997,
    "generos": ["Fantasía", "Aventura"],
    "precio": 21.95
  },
  {
    "titulo": "Crónica de una muerte anunciada",
    "autor": "Gabriel García Márquez",
    "añoPublicacion": 1981,
    "generos": ["Novela", "Realismo mágico"],
    "precio": 17.50
  },
  {
    "titulo": "Rayuela",
    "autor": "Julio Cortázar",
    "añoPublicacion": 1963,
    "generos": ["Novela", "Experimental"],
    "precio": 23.75
  },
  {
    "titulo": "Ficciones",
    "autor": "Jorge Luis Borges",
    "añoPublicacion": 1944,
    "generos": ["Cuentos", "Ficción especulativa"],
    "precio": 19.25
  },
  {
    "titulo": "La sombra del viento",
    "autor": "Carlos Ruiz Zafón",
    "añoPublicacion": 2001,
    "generos": ["Misterio", "Novela gótica"],
    "precio": 20.99
  },
  {
    "titulo": "Los juegos del hambre",
    "autor": "Suzanne Collins",
    "añoPublicacion": 2008,
    "generos": ["Ciencia ficción", "Distopía"],
    "precio": 16.95
  },
  {
    "titulo": "El código Da Vinci",
    "autor": "Dan Brown",
    "añoPublicacion": 2003,
    "generos": ["Misterio", "Suspense"],
    "precio": 18.50
  },
  {
    "titulo": "El alquimista",
    "autor": "Paulo Coelho",
    "añoPublicacion": 1988,
    "generos": ["Novela", "Ficción espiritual"],
    "precio": 14.99
  },
  {
    "titulo": "Crimen y castigo",
    "autor": "Fiódor Dostoyevski",
    "añoPublicacion": 1866,
    "generos": ["Novela psicológica", "Ficción filosófica"],
    "precio": 17.25
  },
  {
    "titulo": "Anna Karenina",
    "autor": "León Tolstói",
    "añoPublicacion": 1877,
    "generos": ["Novela", "Drama"],
    "precio": 21.50
  },
  {
    "titulo": "Moby Dick",
    "autor": "Herman Melville",
    "añoPublicacion": 1851,
    "generos": ["Aventura", "Novela épica"],
    "precio": 19.95
  },
  {
    "titulo": "Las aventuras de Huckleberry Finn",
    "autor": "Mark Twain",
    "añoPublicacion": 1884,
    "generos": ["Novela", "Aventura"],
    "precio": 15.25
  },
  {
    "titulo": "Drácula",
    "autor": "Bram Stoker",
    "añoPublicacion": 1897,
    "generos": ["Terror", "Gótico"],
    "precio": 16.75
  },
  {
    "titulo": "Frankenstein",
    "autor": "Mary Shelley",
    "añoPublicacion": 1818,
    "generos": ["Terror", "Gótico", "Ciencia ficción"],
    "precio": 14.50
  },
  {
    "titulo": "El retrato de Dorian Gray",
    "autor": "Oscar Wilde",
    "añoPublicacion": 1890,
    "generos": ["Novela filosófica", "Gótico"],
    "precio": 13.99
  },
  {
    "titulo": "La metamorfosis",
    "autor": "Franz Kafka",
    "añoPublicacion": 1915,
    "generos": ["Novela corta", "Existencialismo"],
    "precio": 10.95
  },
  {
    "titulo": "1984",
    "autor": "George Orwell",
    "añoPublicacion": 1949,
    "generos": ["Ciencia ficción", "Distopía", "Política"],
    "precio": 22.99
  },
  {
    "titulo": "Un mundo feliz",
    "autor": "Aldous Huxley",
    "añoPublicacion": 1932,
    "generos": ["Ciencia ficción", "Distopía"],
    "precio": 18.25
  },
  {
    "titulo": "Fahrenheit 451",
    "autor": "Ray Bradbury",
    "añoPublicacion": 1953,
    "generos": ["Ciencia ficción", "Distopía"],
    "precio": 16.50
  },
  {
    "titulo": "El hobbit",
    "autor": "J. R. R. Tolkien",
    "añoPublicacion": 1937,
    "generos": ["Fantasía", "Aventura"],
    "precio": 24.95
  }
]);

// Verificar la inserción
print("Total de libros insertados: " + db.libros.countDocuments());

// Mostrar algunos registros
print("\nPrimeros 5 libros:");
db.libros.find().limit(5).pretty();