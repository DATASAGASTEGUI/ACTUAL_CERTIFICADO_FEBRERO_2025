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
