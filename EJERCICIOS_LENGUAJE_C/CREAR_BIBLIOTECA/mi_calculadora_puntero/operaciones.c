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
