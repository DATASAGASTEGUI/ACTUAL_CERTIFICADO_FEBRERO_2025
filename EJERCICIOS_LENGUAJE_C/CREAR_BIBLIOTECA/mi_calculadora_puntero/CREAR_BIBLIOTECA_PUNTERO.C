***********************************
***   ESTRUCTURA DEL PROYECTO   ***
***********************************
---------------------------------------------------------------------------------
Tu proyecto tendrá estos 3 archivos:

mi_calculadora/
├── main.c              --> Programa principal
├── operaciones.c       --> Código de las funciones sumar y restar
└── operaciones.h       --> Encabezado (header) con las declaraciones de funciones

Tendremos tres archivos:

operaciones.h → declaraciones de funciones

operaciones.c → implementación de funciones

main.c → menú y programa principal
--------------------------------------------------------------------------------
// operaciones.h

#ifndef OPERACIONES_H
#define OPERACIONES_H

void sumar(int a, int b, int *resultado);
void restar(int a, int b, int *resultado);
void multiplicar(int a, int b, int *resultado);
int dividir(int a, int b, float *resultado);  // Devuelve 0 si OK, -1 si división por cero
void potencia(int base, int exponente, int *resultado);

#endif
--------------------------------------------------------------------------------
// operaciones.c

#include "operaciones.h"

void sumar(int a, int b, int *resultado) {
    *resultado = a + b;
}

void restar(int a, int b, int *resultado) {
    *resultado = a - b;
}

void multiplicar(int a, int b, int *resultado) {
    *resultado = a * b;
}

int dividir(int a, int b, float *resultado) {
    if (b == 0) return -1;
    *resultado = (float)a / b;
    return 0;
}

void potencia(int base, int exponente, int *resultado) {
    *resultado = 1;
    for (int i = 0; i < exponente; i++) {
        *resultado *= base;
    }
}
--------------------------------------------------------------------------------
// main.c

#include <stdio.h>
#include <stdlib.h>
#include "operaciones.h"

int main() {
    int opcion, a, b, res;
    float resf;

    do {
        printf("\n=== CALCULADORA CON PUNTEROS ===\n");
        printf("1. Sumar\n");
        printf("2. Restar\n");
        printf("3. Multiplicar\n");
        printf("4. Dividir\n");
        printf("5. Potencia\n");
        printf("6. Salir\n");
        printf("Seleccione una opción: ");
        scanf("%d", &opcion);

        if (opcion >= 1 && opcion <= 5) {
            printf("Ingrese el primer número: ");
            scanf("%d", &a);
            printf("Ingrese el segundo número: ");
            scanf("%d", &b);
        }

        switch(opcion) {
            case 1:
                sumar(a, b, &res);
                printf("Resultado: %d\n", res);
                break;
            case 2:
                restar(a, b, &res);
                printf("Resultado: %d\n", res);
                break;
            case 3:
                multiplicar(a, b, &res);
                printf("Resultado: %d\n", res);
                break;
            case 4:
                if (dividir(a, b, &resf) == 0)
                    printf("Resultado: %.2f\n", resf);
                else
                    printf("❌ Error: División por cero\n");
                break;
            case 5:
                potencia(a, b, &res);
                printf("Resultado: %d\n", res);
                break;
            case 6:
                printf("👋 Saliendo del programa...\n");
                break;
            default:
                printf("❌ Opción inválida\n");
        }
    } while(opcion != 6);

    return 0;
}
--------------------------------------------------------------------------------
Compilar y ejecutar (en terminal)

Supongamos que estás en el mismo directorio:

gcc main.c operaciones.c -o calculadora

gcc operaciones.c main.c -o calculadora

calculadora
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------


--------------------------------------------------------------------------------



