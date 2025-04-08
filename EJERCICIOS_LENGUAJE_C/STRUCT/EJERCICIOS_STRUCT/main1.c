#include <stdio.h>
#include <string.h> // Libreria para usar la funcion strcpy
// Crear un struct llamado persona que agrupara los tipos de datos nombre, edad, estatura
struct Persona {
    char nombre[50];
    int edad;
    float estatura;
};


int main() {
    struct Persona persona1; // Declarar una variable de tipo Persona 
    strcpy(persona1.nombre, "Juan Perez"); // Asignar un nombre a la persona
    persona1.edad = 30; // Asignar una edad a la persona
    persona1.estatura = 1.75; // Asignar una estatura a la persona
    printf("Nombre  : %s\n", persona1.nombre); // Imprimir el nombre de la persona
    printf("Edad    : %d\n", persona1.edad); // Imprimir la edadm de la persona
    printf("Estatura: %.2f\n", persona1.estatura); // Imprimir la estatura de la persona
    
    return 0;

}