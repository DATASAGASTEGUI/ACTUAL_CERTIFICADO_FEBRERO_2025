***********************************
***   ESTRUCTURA DEL PROYECTO   ***
***********************************
---------------------------------------------------------------------------------
Tu proyecto tendrá estos 3 archivos:

mi_calculadora/
├── main.c              --> Programa principal
├── operaciones.c       --> Código de las funciones sumar y restar
└── operaciones.h       --> Encabezado (header) con las declaraciones de funciones
---------------------------------------------------------------------------------
Paso 1: Crear operaciones.h (archivo de cabecera)

// operaciones.h
#ifndef OPERACIONES_H
#define OPERACIONES_H

int sumar(int a, int b);
int restar(int a, int b);

#endif
---------------------------------------------------------------------------------
Paso 2: Crear operaciones.c (implementación de las funciones)

// operaciones.c
#include "operaciones.h"

int sumar(int a, int b) {
    return a + b;
}

int restar(int a, int b) {
    return a - b;
} 
---------------------------------------------------------------------------------
Paso 3: Crear main.c (programa principal con menú)

// main.c
#include <stdio.h>
#include <stdlib.h>
#include "operaciones.h"

int main() {
    int opcion, a, b, resultado;

    do {
        system("cls"); // Borra la pantalla en Windows
        printf("\n--- MENU ---\n");
        printf("1. Sumar\n");
        printf("2. Restar\n");
        printf("0. Salir\n");
        printf("Elige una opción: ");
        scanf("%d", &opcion);

        if (opcion == 1 || opcion == 2) {
            printf("Introduce el primer número: ");
            scanf("%d", &a);
            printf("Introduce el segundo número: ");
            scanf("%d", &b);

            if (opcion == 1) {
                resultado = sumar(a, b);
                printf("Resultado: %d\n", resultado);
            } else {
                resultado = restar(a, b);
                printf("Resultado: %d\n", resultado);
            }
        } else if (opcion != 0) {
            printf("Opción no válida.\n");
        }

    } while (opcion != 0);

    printf("Programa finalizado.\n");
    return 0;
}
---------------------------------------------------------------------------------
Paso 4: Compilar y enlazar los archivos

Abre tu terminal o consola en la carpeta donde están los archivos (mi_calculadora/) y escribe:

gcc -c operaciones.c     # Compila operaciones.c -> operaciones.o
gcc -c main.c            # Compila main.c -> main.o
gcc main.o operaciones.o -o calculadora  # Enlaza ambos y genera el ejecutable "calculadora"
---------------------------------------------------------------------------------
Paso 5: Ejecutar el programa

En la misma terminal:

./calculadora
---------------------------------------------------------------------------------
Resultado esperado
El programa mostrará un menú así:

--- MENU ---
1. Sumar
2. Restar
0. Salir
Elige una opción:
---------------------------------------------------------------------------------





