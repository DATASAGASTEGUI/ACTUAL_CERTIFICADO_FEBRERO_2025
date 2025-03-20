/*
Número aleatorio de un dado. Generar 10 números
*/
#include <stdio.h>  // printf, scanf
#include <stdlib.h> // srand, rand
#include <time.h>   // time

void imprimir_mayor_menor(int mayor, int menor) {
    printf("El mayor número de veces: %d\n", mayor);
    printf("El menor número de veces: %d\n", menor);
}

void imprimir_lados_menor(int c1, int c2, int c3, int c4, int c5, int c6, int menor) {
    printf("MOSTRAR TODOS LOS LADOS CON EL MENOR\n");
    printf("------------------------------------\n\n");
    if(c1 == menor) printf("Lado 1\n");
    if(c2 == menor) printf("Lado 2\n");
    if(c3 == menor) printf("Lado 3\n");
    if(c4 == menor) printf("Lado 4\n");
    if(c5 == menor) printf("Lado 5\n");
    if(c6 == menor) printf("Lado 6\n");
    printf("\n");
}

void imprimir_lados_mayor(int c1, int c2, int c3, int c4, int c5, int c6, int mayor) {
    printf("MOSTRAR TODOS LOS LADOS CON EL MAYOR\n");
    printf("------------------------------------\n\n");
    if(c1 == mayor) printf("Lado 1\n");
    if(c2 == mayor) printf("Lado 2\n");
    if(c3 == mayor) printf("Lado 3\n");
    if(c4 == mayor) printf("Lado 4\n");
    if(c5 == mayor) printf("Lado 5\n");
    if(c6 == mayor) printf("Lado 6\n");
    printf("\n");
}

int calcular_menor(int c1, int c2, int c3, int c4, int c5, int c6) {
    int menor = c1;
    if(c2 < menor) menor = c2;
    if(c3 < menor) menor = c3;
    if(c4 < menor) menor = c4;
    if(c5 < menor) menor = c5;
    if(c6 < menor) menor = c6;
    return menor;
}

int calcular_mayor(int c1, int c2, int c3, int c4, int c5, int c6) {
    int mayor = c1;
    if(c2 > mayor) mayor = c2;
    if(c3 > mayor) mayor = c3;
    if(c4 > mayor) mayor = c4;
    if(c5 > mayor) mayor = c5;
    if(c6 > mayor) mayor = c6;
    return mayor;
}

void resultado_cada_lado(int c1, int c2, int c3, int c4, int c5, int c6) {
    printf("\n\nRESULTADO POR CADA LADO\n");
    printf("-----------------------\n\n");
    printf("Lado 1: %d\n", c1);
    printf("Lado 2: %d\n", c2);
    printf("Lado 3: %d\n", c3);
    printf("Lado 4: %d\n", c4);
    printf("Lado 5: %d\n", c5);
    printf("Lado 6: %d\n", c6);
    printf("\n");
}

void calcular_contadores(int *c1, int *c2, int *c3, int *c4, int *c5, int *c6) {
    srand(time(NULL));
    printf("MOSTRAR TODOS LOS RESULTADOS DE LANZAR EL DADO\n");
    printf("----------------------------------------------\n\n");
    for(int i=0; i<1000; i=i+1) {
        int aleatorio = rand() % 6 + 1;   //[1, 6]
        printf("%d  ", aleatorio);
        if(aleatorio == 1) (*c1)++;
        if(aleatorio == 2) (*c2)++;
        if(aleatorio == 3) (*c3)++;
        if(aleatorio == 4) (*c4)++;
        if(aleatorio == 5) (*c5)++;
        if(aleatorio == 6) (*c6)++;
    }
}

int main() {
    int c1,c2,c3,c4,c5,c6;
    c1 = c2 = c3 = c4 = c5 = c6 = 0;

    system("cls");

    calcular_contadores(&c1, &c2, &c3, &c4, &c5, &c6);
    resultado_cada_lado(c1,c2,c3,c4,c5,c6);
    int mayor = calcular_mayor(c1,c2,c3,c4,c5,c6);
    int menor = calcular_menor(c1,c2,c3,c4,c5,c6);
    imprimir_lados_mayor(c1,c2,c3,c4,c5,c6,mayor);
    imprimir_lados_menor(c1,c2,c3,c4,c5,c6,menor);
    imprimir_mayor_menor(mayor, menor);

    system("pause");

    return 0;
}



