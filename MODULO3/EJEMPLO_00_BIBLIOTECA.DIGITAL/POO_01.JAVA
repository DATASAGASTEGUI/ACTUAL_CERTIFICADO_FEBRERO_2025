--------------------------------------------------------------------------------
ENUNCIADO DEL EJERCICIO DE POO EN JAVA
--------------------------------------------------------------------------------
Sistema de Gestión de una Biblioteca Digital

La Biblioteca “LecturaFácil” desea desarrollar una aplicación para gestionar sus 
contenidos digitales y físicos. Los materiales disponibles pueden ser libros, 
revistas, y audiolibros. Cada uno de estos materiales comparte ciertas 
características comunes pero también posee propiedades particulares.

- Requisitos funcionales:

Crear una clase abstracta MaterialBiblioteca que contenga atributos comunes como:

idMaterial (String)

titulo (String)

autor (String)

anioPublicacion (int)

E incluir métodos abstractos como:

public abstract void mostrarInformacion();

Crear las clases hijas:

Libro con atributos adicionales: numeroPaginas y genero.

Revista con atributos: numeroEdicion y mesPublicacion.

Audiolibro con atributos: duracionMinutos y narrador.

Aplicar sobrecarga de constructores para cada tipo de material.

Implementar una interfaz Prestable con métodos:

prestar()

devolver()

estaPrestado()

Solo los Libros y Revistas pueden ser prestados.

Usar una colección (ArrayList) para almacenar múltiples materiales.

Permitir mediante un menú (por consola):

Añadir un nuevo material.

Listar todos los materiales.

Buscar por título.

Prestar o devolver un material si aplica.

Mostrar solo materiales prestados.

Eliminar un material por su ID.

Usar encapsulamiento: todos los atributos deben ser private y deben tener getters y setters.

Aplicar polimorfismo:

Llamar a mostrarInformacion() sin importar el tipo de material.
--------------------------------------------------------------------------------
- Objetivos del ejercicio:
--------------------------------------------------------------------------------
Abstraer entidades reales a clases.

Aplicar herencia para evitar duplicación de código.

Utilizar interfaces para definir comportamientos comunes.

Aplicar encapsulamiento y buenas prácticas de diseño.

Demostrar polimorfismo con listas heterogéneas.

Practicar manejo de colecciones y flujos de entrada/salida por consola.
--------------------------------------------------------------------------------
ESQUELETO DEL PROYECTO: Biblioteca Digital
--------------------------------------------------------------------------------
                         +-------------------------+
                         |   <<abstract>>          |
                         |   MaterialBiblioteca    |
                         +-------------------------+
                         | - id: int               |
                         | - titulo: String        |
                         | - autor: String         |
                         | - disponible: boolean   |
                         +-------------------------+
                         | +prestar(): void        |
                         | +devolver(): void       |
                         | +mostrarInformacion()   |
                         +-------------------------+
                                   ▲
        ┌──────────────────────────┼───────────────────────────┐
        │                          │                           │
+------------------+    +------------------+         +------------------+
|      Libro        |    |     Revista      |         |   Audiolibro     |
+------------------+    +------------------+         +------------------+
| - numPaginas: int|    | - edicion: int   |         | - duracion: int  |
+------------------+    +------------------+         +------------------+
| +mostrarInfo()   |    | +mostrarInfo()   |         | +mostrarInfo()   |
+------------------+    +------------------+         +------------------+
        ▲                       ▲
        │                       │
   implements             implements
        │                       │
   +------------------------------+
   |         Prestable           |
   +------------------------------+
   | +prestar(): void            |
   | +devolver(): void           |
   +------------------------------+

+---------------------+
|     Biblioteca      |
+---------------------+
| - materiales: List  |
+---------------------+
| +agregarMaterial()  |
| +listarMateriales() |
| +buscarMaterial()   |
| +prestarMaterial()  |
| +devolverMaterial() |
+---------------------+

+----------------+
|     Main       |
+----------------+
| main(String[]) |
+----------------+
--------------------------------------------------------------------------------
Explicación por Componentes
--------------------------------------------------------------------------------
- MaterialBiblioteca (clase abstracta)

Representa un recurso genérico.

Define atributos comunes: id, titulo, autor, disponible.

Contiene métodos: prestar(), devolver() y mostrarInformacion() (abstracto).

- Libro, Revista, Audiolibro (subclases)

Heredan de MaterialBiblioteca.

Implementan mostrarInformacion().

Libro y Revista implementan Prestable.

- Prestable (interfaz)

Define el comportamiento prestar() y devolver().

Solo materiales físicos como Libro y Revista pueden prestarse.

- Biblioteca (gestor)

Contiene una lista de materiales.

Métodos:

agregarMaterial()

listarMateriales()

buscarMaterialPorId()

prestarMaterial() y devolverMaterial()

- Main (menú principal)

Permite al usuario interactuar:

Agregar materiales

Listar

Buscar por ID

Prestar y devolver
--------------------------------------------------------------------------------
REQUISITOS FUNCIONALES
--------------------------------------------------------------------------------
Los requisitos funcionales son especificaciones claras de lo que un sistema debe 
hacer. En otras palabras, describen las funciones o comportamientos del software
desde el punto de vista del usuario o del sistema.

- ¿Qué incluyen los requisitos funcionales?

Los requisitos funcionales responden a preguntas como:

¿Qué funciones debe realizar el sistema?

¿Qué acciones puede ejecutar el usuario?

¿Qué procesos debe ejecutar automáticamente el sistema?

- Ejemplos de requisitos funcionales (para un sistema de biblioteca):

El sistema debe permitir registrar nuevos libros.

El sistema debe permitir buscar materiales por título o autor.

El sistema debe permitir prestar y devolver libros.

El sistema debe guardar los datos de los materiales en un archivo.

El sistema debe permitir que el usuario visualice la lista completa de materiales disponibles.

- Diferencia con requisitos no funcionales

Tipo de Requisito	Ejemplo

Funcional	El sistema debe permitir registrar un nuevo usuario.
No funcional	El sistema debe cargar los datos en menos de 2 segundos.

- ¿Por qué son importantes?

Sirven como guía para el desarrollo del sistema.

Ayudan a garantizar que el software cumpla con las necesidades del usuario.

Permiten validar y verificar que el sistema hace lo que se espera.
