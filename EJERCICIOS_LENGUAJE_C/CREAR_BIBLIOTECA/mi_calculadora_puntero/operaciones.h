#ifndef OPERACIONES_H
#define OPERACIONES_H

void sumar(int a, int b, int *resultado);
void restar(int a, int b, int *resultado);
void multiplicar(int a, int b, int *resultado);
int dividir(int a, int b, float *resultado);  // Devuelve 0 si OK, -1 si división por cero
void potencia(int base, int exponente, int *resultado);

#endif