#include <stdio.h>

/*

nombre  edad  estatura  dirección
                        calle número

nombre  edad  estatura  calle número                        
*/

struct Direccion {
    char calle[50];
    int numero;
};

struct Persona {
    char nombre[50];
    int edad;
    float estatura;
    struct Direccion direccion; // Agregar la estructura Direccion dentro de Persona
                                // Esto permite que cada persona tenga una dirección asociadadentro de ella.
};

void mostrarPersona(struct Persona persona[], int longitud) {
    for(int i=0; i<longitud; i++) {
        printf("Persona : %d\n", i+1); 
        printf("Nombre  : %s\n",   persona[i].nombre);
        printf("Edad    : %d\n",   persona[i].edad);
        printf("Estatura: %.2f\n", persona[i].estatura);
        printf("Calle   : %s\n", persona[i].direccion.calle);
        printf("Número  : %d\n", persona[i].direccion.numero);
    }
}

int main() {
    struct Persona persona[2]; // Declarar un arreglo de tipo Persona para almacenar 2 personas
    int i;
    // Pedir datos para las personas y almacenarlos en el arreglo
    for(int i=0; i<2; i++) {
        printf("Ingrese el nombre de la persona %d: ", i+1);
        scanf("%s", persona[i].nombre); // Leer el nombre de la persona
        printf("Ingrese la edad de la persona %d: ", i+1);
        scanf("%d", &persona[i].edad); // Leer la edad de la persona
        printf("Ingrese la estatura de la persona %d: ", i+1);
        scanf("%f", &persona[i].estatura); // Leer la estatura de la persona
        printf("Ingrese la calle de la persona %d: ", i+1);
        scanf("%s", persona[i].direccion.calle); // Leer la calle de la persona
        printf("Ingrese el numero de la persona %d: ", i+1);
        scanf("%d", &persona[i].direccion.numero); // Leer el numero de la persona
 
    }
    // Mostrar los datos de las personas almacenados en el arreglo
    mostrarPersona(persona, 2); // Llamar a la funcion para mostrar los datos de las personas   
    

    return 0; // Fin del programa
}