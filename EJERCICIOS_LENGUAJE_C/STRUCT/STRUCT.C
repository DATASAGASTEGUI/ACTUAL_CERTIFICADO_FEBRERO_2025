******************
***   STRUCT   ***
******************
--------------------------------------------------------------------------------
Esto es muy importante para organizar datos relacionados entre sí.

¿Qué es un struct?

Un struct (estructura) permite agrupar diferentes tipos de datos bajo un mismo nombre.

Por ejemplo, para representar una persona, puedes usar varios datos: nombre, edad y altura.
--------------------------------------------------------------------------------
Ejemplo 1: Definir e imprimir una estructura

Paso 1: Definir la estructura

#include <stdio.h>

struct Persona {
    char nombre[50];
    int edad;
    float altura;
};

Aquí creamos un nuevo tipo llamado struct Persona con tres campos.

Paso 2: Declarar una variable del tipo struct

int main() {
    struct Persona p1;

    // Asignamos valores
    strcpy(p1.nombre, "Carlos");
    p1.edad = 25;
    p1.altura = 1.75;

    // Mostramos los valores
    printf("Nombre: %s\n", p1.nombre);
    printf("Edad: %d\n", p1.edad);
    printf("Altura: %.2f\n", p1.altura);

    return 0;
}

Nota: Se necesita #include <string.h> para usar strcpy.

Salida:

Nombre: Carlos
Edad: 25
Altura: 1.75
--------------------------------------------------------------------------------
Ejemplo 2: Arreglo de estructuras

Paso 1: Crear varios objetos del tipo Persona

#include <stdio.h>
#include <string.h>

struct Persona {
    char nombre[50];
    int edad;
};

int main() {
    struct Persona personas[2];

    strcpy(personas[0].nombre, "Ana");
    personas[0].edad = 20;

    strcpy(personas[1].nombre, "Luis");
    personas[1].edad = 30;

    for (int i = 0; i < 2; i++) {
        printf("Persona %d: %s, Edad: %d\n", i + 1, personas[i].nombre, personas[i].edad);
    }

    return 0;
}
--------------------------------------------------------------------------------
Ejemplo 3: Pasar un struct a una función

#include <stdio.h>
#include <string.h>

struct Persona {
    char nombre[50];
    int edad;
};

void mostrarPersona(struct Persona p) {
    printf("Nombre: %s, Edad: %d\n", p.nombre, p.edad);
}

int main() {
    struct Persona p1;
    strcpy(p1.nombre, "Laura");
    p1.edad = 28;

    mostrarPersona(p1);

    return 0;
}
--------------------------------------------------------------------------------
Ejemplo 4: typedef para simplificar

#include <stdio.h>

typedef struct {
    char nombre[50];
    int edad;
} Persona;

int main() {
    Persona p;
    strcpy(p.nombre, "Pedro");
    p.edad = 35;

    printf("Nombre: %s, Edad: %d\n", p.nombre, p.edad);
    return 0;
}

Con typedef, ya no necesitas escribir struct cada vez.
--------------------------------------------------------------------------------
Estructuras anidadas
Punteros a estructuras
--------------------------------------------------------------------------------
1. Estructuras anidadas (estructura dentro de otra)

Ejemplo: Un Alumno con una Direccion

#include <stdio.h>
#include <string.h>

struct Direccion {
    char calle[50];
    int numero;
};

struct Alumno {
    char nombre[50];
    int edad;
    struct Direccion direccion;  // Aquí está la estructura anidada
};

int main() {
    struct Alumno alumno1;

    strcpy(alumno1.nombre, "Andrea");
    alumno1.edad = 21;
    strcpy(alumno1.direccion.calle, "Calle Luna");
    alumno1.direccion.numero = 123;

    printf("Nombre: %s\n", alumno1.nombre);
    printf("Edad: %d\n", alumno1.edad);
    printf("Dirección: %s %d\n", alumno1.direccion.calle, alumno1.direccion.numero);

    return 0;
}

Importante: Se accede a la estructura interna con . como si fuera un campo más.
--------------------------------------------------------------------------------
2. Punteros a estructuras

Ejemplo: Usando punteros y el operador ->

#include <stdio.h>
#include <string.h>

struct Persona {
    char nombre[50];
    int edad;
};

int main() {
    struct Persona p1;
    struct Persona *ptr;

    strcpy(p1.nombre, "Mario");
    p1.edad = 40;

    ptr = &p1;  // El puntero apunta a p1

    // Acceso con puntero y operador ->
    printf("Nombre: %s\n", ptr->nombre);
    printf("Edad: %d\n", ptr->edad);

    // También se puede modificar:
    ptr->edad = 41;
    printf("Nueva Edad: %d\n", p1.edad);

    return 0;
}
🧠 Importante:

ptr->edad es equivalente a (*ptr).edad, pero más cómodo de escribir.
--------------------------------------------------------------------------------
Un array de estructuras con punteros y después cómo guardar esa información en un archivo.

1. Array de estructuras con punteros

Ejemplo: Lista de estudiantes

#include <stdio.h>
#include <string.h>

struct Estudiante {
    char nombre[50];
    int edad;
};

int main() {
    struct Estudiante lista[3];
    struct Estudiante *ptr;

    // Rellenamos los datos
    strcpy(lista[0].nombre, "Juan");
    lista[0].edad = 20;

    strcpy(lista[1].nombre, "Luisa");
    lista[1].edad = 22;

    strcpy(lista[2].nombre, "Diego");
    lista[2].edad = 19;

    // Usamos puntero para recorrer el array
    for (int i = 0; i < 3; i++) {
        ptr = &lista[i];
        printf("Estudiante %d:\n", i + 1);
        printf("Nombre: %s\n", ptr->nombre);
        printf("Edad: %d\n\n", ptr->edad);
    }

    return 0;
}
--------------------------------------------------------------------------------
2. Guardar estructuras en un archivo de texto

Ejemplo: Guardar los estudiantes en un archivo

#include <stdio.h>
#include <string.h>

struct Estudiante {
    char nombre[50];
    int edad;
};

int main() {
    struct Estudiante lista[2] = {
        {"Laura", 23},
        {"Carlos", 21}
    };

    FILE *archivo = fopen("estudiantes.txt", "w");

    if (archivo == NULL) {
        printf("Error al abrir el archivo.\n");
        return 1;
    }

    for (int i = 0; i < 2; i++) {
        fprintf(archivo, "Nombre: %s, Edad: %d\n", lista[i].nombre, lista[i].edad);
    }

    fclose(archivo);
    printf("Datos guardados en 'estudiantes.txt'\n");

    return 0;
}

Esto genera un archivo llamado estudiantes.txt con este contenido:

Nombre: Laura, Edad: 23
Nombre: Carlos, Edad: 21
--------------------------------------------------------------------------------
Leer estructuras desde un archivo

Supongamos que tenemos este archivo llamado estudiantes.txt:

Laura 23
Carlos 21

Cada línea contiene el nombre y la edad de un estudiante, separados por espacio.

Código en C para leer los datos y guardarlos en un array de struct

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Estudiante {
    char nombre[50];
    int edad;
};

int main() {
    FILE *archivo = fopen("estudiantes.txt", "r");
    if (archivo == NULL) {
        printf("No se pudo abrir el archivo.\n");
        return 1;
    }

    struct Estudiante lista[100];  // hasta 100 estudiantes
    int contador = 0;

    // Leemos línea por línea
    while (fscanf(archivo, "%s %d", lista[contador].nombre, &lista[contador].edad) == 2) {
        contador++;
    }

    fclose(archivo);

    // Mostramos lo leído
    printf("Estudiantes leídos del archivo:\n");
    for (int i = 0; i < contador; i++) {
        printf("Nombre: %s, Edad: %d\n", lista[i].nombre, lista[i].edad);
    }

    return 0;
}

Cosas importantes:

fscanf(archivo, "%s %d", ...) lee una palabra (sin espacios) y un número.

El bucle se ejecuta mientras se puedan leer correctamente dos valores por línea.

Asume que los nombres no tienen espacios. Si quieres nombres con espacios, se puede hacer con fgets() + sscanf().
--------------------------------------------------------------------------------
Vamos ahora a ver cómo trabajar con archivos binarios en C para guardar y leer estructuras.

Esto es útil cuando quieres:

Guardar datos de manera más compacta.

Leer y escribir más rápido.

Evitar que se editen fácilmente (como con un .txt).

Guardar estructuras en un archivo binario (fwrite)

Estructura del estudiante

#include <stdio.h>
#include <string.h>

struct Estudiante {
    char nombre[50];
    int edad;
};

int main() {
    struct Estudiante lista[2] = {
        {"Sofia", 24},
        {"Luis", 20}
    };

    FILE *archivo = fopen("estudiantes.dat", "wb");  // modo binario escritura

    if (archivo == NULL) {
        printf("No se pudo abrir el archivo.\n");
        return 1;
    }

    fwrite(lista, sizeof(struct Estudiante), 2, archivo);  // guarda los 2 registros
    fclose(archivo);

    printf("Datos guardados en 'estudiantes.dat'\n");

    return 0;
}

Leer estructuras desde archivo binario (fread)

#include <stdio.h>

struct Estudiante {
    char nombre[50];
    int edad;
};

int main() {
    struct Estudiante lista[100];
    int cantidad = 0;

    FILE *archivo = fopen("estudiantes.dat", "rb");  // modo binario lectura

    if (archivo == NULL) {
        printf("No se pudo abrir el archivo.\n");
        return 1;
    }

    // fread devuelve cuántos elementos leyó
    cantidad = fread(lista, sizeof(struct Estudiante), 100, archivo);
    fclose(archivo);

    printf("Estudiantes leídos:\n");
    for (int i = 0; i < cantidad; i++) {
        printf("Nombre: %s, Edad: %d\n", lista[i].nombre, lista[i].edad);
    }

    return 0;
}

Diferencias con texto

Texto (.txt)					Binario (.dat)
Más fácil de leer/edit			Más compacto y seguro
Más lento en archivos grandes	Más rápido
Ideal para exportar				Ideal para uso interno del programa
--------------------------------------------------------------------------------
Vamos a hacer un pequeño programa en C con un menú interactivo en consola, donde puedes:

Añadir estudiantes (se guardan en un archivo binario).

Leer y mostrar todos los estudiantes guardados.

Salir del programa.

Código completo con menú y uso de archivo binario

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Estudiante {
    char nombre[50];
    int edad;
};

// Función para añadir un estudiante al archivo
void agregarEstudiante() {
    struct Estudiante nuevo;

    printf("Introduce el nombre del estudiante: ");
    scanf(" %[^\n]", nuevo.nombre);  // lee cadena con espacios
    printf("Introduce la edad: ");
    scanf("%d", &nuevo.edad);

    FILE *archivo = fopen("estudiantes.dat", "ab");  // abrir en modo binario (añadir)
    if (archivo == NULL) {
        printf("No se pudo abrir el archivo.\n");
        return;
    }

    fwrite(&nuevo, sizeof(struct Estudiante), 1, archivo);
    fclose(archivo);

    printf("Estudiante guardado correctamente.\n");
}

// Función para mostrar todos los estudiantes del archivo
void mostrarEstudiantes() {
    struct Estudiante lista[100];
    int cantidad = 0;

    FILE *archivo = fopen("estudiantes.dat", "rb");
    if (archivo == NULL) {
        printf("No hay datos aún.\n");
        return;
    }

    cantidad = fread(lista, sizeof(struct Estudiante), 100, archivo);
    fclose(archivo);

    printf("\n📚 Lista de estudiantes:\n");
    for (int i = 0; i < cantidad; i++) {
        printf("Nombre: %s | Edad: %d\n", lista[i].nombre, lista[i].edad);
    }
    printf("\n");
}

int main() {
    int opcion;

    do {
        printf("\n===== MENÚ =====\n");
        printf("1. Agregar estudiante\n");
        printf("2. Mostrar estudiantes\n");
        printf("3. Salir\n");
        printf("Selecciona una opción: ");
        scanf("%d", &opcion);

        switch (opcion) {
            case 1:
                agregarEstudiante();
                break;
            case 2:
                mostrarEstudiantes();
                break;
            case 3:
                printf("Saliendo del programa...\n");
                break;
            default:
                printf("Opción no válida. Intenta de nuevo.\n");
        }

    } while (opcion != 3);

    return 0;
}

Cosas importantes del código:

Usa fopen("estudiantes.dat", "ab") para añadir sin borrar los anteriores.

Usa scanf(" %[^\n]", ...) para leer cadenas con espacios.

Puedes guardar hasta 100 registros en este ejemplo, pero puedes usar malloc si quieres hacerlo dinámico.
--------------------------------------------------------------------------------
Vamos a ampliar el programa para que puedas:

Agregar estudiantes
Mostrar todos los estudiantes
Buscar un estudiante por nombre
Modificar un estudiante existente
Salir

Código completo actualizado

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Estudiante {
    char nombre[50];
    int edad;
};

// Función para añadir un estudiante
void agregarEstudiante() {
    struct Estudiante nuevo;

    printf("Introduce el nombre del estudiante: ");
    scanf(" %[^\n]", nuevo.nombre);
    printf("Introduce la edad: ");
    scanf("%d", &nuevo.edad);

    FILE *archivo = fopen("estudiantes.dat", "ab");
    if (archivo == NULL) {
        printf("No se pudo abrir el archivo.\n");
        return;
    }

    fwrite(&nuevo, sizeof(struct Estudiante), 1, archivo);
    fclose(archivo);
    printf("✅ Estudiante guardado correctamente.\n");
}

// Función para mostrar estudiantes
void mostrarEstudiantes() {
    struct Estudiante e;
    FILE *archivo = fopen("estudiantes.dat", "rb");

    if (archivo == NULL) {
        printf("No hay datos aún.\n");
        return;
    }

    printf("\n📚 Lista de estudiantes:\n");
    while (fread(&e, sizeof(struct Estudiante), 1, archivo) == 1) {
        printf("Nombre: %s | Edad: %d\n", e.nombre, e.edad);
    }

    fclose(archivo);
}

// Función para buscar un estudiante por nombre
void buscarEstudiante() {
    char nombreBuscado[50];
    struct Estudiante e;
    int encontrado = 0;

    printf("Introduce el nombre a buscar: ");
    scanf(" %[^\n]", nombreBuscado);

    FILE *archivo = fopen("estudiantes.dat", "rb");
    if (archivo == NULL) {
        printf("No hay datos disponibles.\n");
        return;
    }

    while (fread(&e, sizeof(struct Estudiante), 1, archivo) == 1) {
        if (strcmp(e.nombre, nombreBuscado) == 0) {
            printf("🎯 Estudiante encontrado: %s, Edad: %d\n", e.nombre, e.edad);
            encontrado = 1;
            break;
        }
    }

    if (!encontrado) {
        printf("❌ Estudiante no encontrado.\n");
    }

    fclose(archivo);
}

// Función para modificar un estudiante por nombre
void modificarEstudiante() {
    char nombreModificar[50];
    struct Estudiante e;
    int encontrado = 0;

    FILE *archivo = fopen("estudiantes.dat", "r+b"); // lectura/escritura binaria
    if (archivo == NULL) {
        printf("No se pudo abrir el archivo.\n");
        return;
    }

    printf("Introduce el nombre del estudiante que deseas modificar: ");
    scanf(" %[^\n]", nombreModificar);

    while (fread(&e, sizeof(struct Estudiante), 1, archivo) == 1) {
        if (strcmp(e.nombre, nombreModificar) == 0) {
            printf("Estudiante actual: %s, Edad: %d\n", e.nombre, e.edad);

            printf("Introduce el nuevo nombre: ");
            scanf(" %[^\n]", e.nombre);
            printf("Introduce la nueva edad: ");
            scanf("%d", &e.edad);

            // Retrocede al inicio de la estructura para sobrescribirla
            fseek(archivo, -sizeof(struct Estudiante), SEEK_CUR);
            fwrite(&e, sizeof(struct Estudiante), 1, archivo);

            printf("✅ Estudiante modificado correctamente.\n");
            encontrado = 1;
            break;
        }
    }

    if (!encontrado) {
        printf("❌ Estudiante no encontrado.\n");
    }

    fclose(archivo);
}

int main() {
    int opcion;

    do {
        printf("\n======= MENÚ =======\n");
        printf("1. Agregar estudiante\n");
        printf("2. Mostrar estudiantes\n");
        printf("3. Buscar estudiante\n");
        printf("4. Modificar estudiante\n");
        printf("5. Salir\n");
        printf("Selecciona una opción: ");
        scanf("%d", &opcion);

        switch (opcion) {
            case 1: agregarEstudiante(); break;
            case 2: mostrarEstudiantes(); break;
            case 3: buscarEstudiante(); break;
            case 4: modificarEstudiante(); break;
            case 5: printf("👋 Saliendo del programa...\n"); break;
            default: printf("❌ Opción no válida.\n");
        }

    } while (opcion != 5);

    return 0;
}
Ahora el programa permite:
Leer/guardar en archivo binario (estudiantes.dat)

Buscar por nombre (strcmp)

Modificar directamente dentro del archivo (fseek)
--------------------------------------------------------------------------------
Vamos a añadir la opción de eliminar un estudiante por nombre. Como no se puede borrar directamente desde un archivo binario, la técnica más común es:

🔁 Leer todos los datos → copiar a un nuevo archivo solo los que no se van a eliminar → reemplazar el archivo original.

Versión actualizada con opción 6: Eliminar estudiante
Añade esta nueva función al código:


void eliminarEstudiante() {
    char nombreEliminar[50];
    struct Estudiante e;
    int eliminado = 0;

    printf("Introduce el nombre del estudiante a eliminar: ");
    scanf(" %[^\n]", nombreEliminar);

    FILE *original = fopen("estudiantes.dat", "rb");
    FILE *temporal = fopen("temp.dat", "wb");

    if (original == NULL || temporal == NULL) {
        printf("❌ No se pudo abrir el archivo.\n");
        return;
    }

    while (fread(&e, sizeof(struct Estudiante), 1, original) == 1) {
        if (strcmp(e.nombre, nombreEliminar) != 0) {
            fwrite(&e, sizeof(struct Estudiante), 1, temporal);
        } else {
            eliminado = 1;
        }
    }

    fclose(original);
    fclose(temporal);

    // Reemplaza el archivo original por el temporal
    remove("estudiantes.dat");
    rename("temp.dat", "estudiantes.dat");

    if (eliminado) {
        printf("✅ Estudiante eliminado correctamente.\n");
    } else {
        printf("❌ Estudiante no encontrado.\n");
    }
}
Actualiza el main:
Agrega el caso 6 en el menú:


        printf("6. Eliminar estudiante\n");
Y en el switch:


            case 6: eliminarEstudiante(); break;
Resultado final del menú:

======= MENÚ =======
1. Agregar estudiante
2. Mostrar estudiantes
3. Buscar estudiante
4. Modificar estudiante
5. Salir
6. Eliminar estudiante
--------------------------------------------------------------------------------




