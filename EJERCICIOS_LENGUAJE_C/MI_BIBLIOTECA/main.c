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
                system("pause");
            } else {
                resultado = restar(a, b);
                printf("Resultado: %d\n", resultado);
                system("pause");
            }
        } else if (opcion != 0) {
            printf("Opción no válida.\n");
            system("pause");
        }

    } while (opcion != 0);

    printf("Programa finalizado.\n");
    return 0;
}