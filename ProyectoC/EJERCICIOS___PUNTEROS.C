/*
1.
CREAR UNA FUNCION PARA SUMAR DOS NUMEROS:

USAR UNA FUNCION QUE RECIBE LOS DOS NUMEROS
Y RETORNA EL RESULTADO POR VALOR

USAR UNA FUNCION QUE RECIBA LOS DOS NUMEROS
Y RETORNA EL RESULTADO POR REFERENCIA
*/
// FUNCION POR VALOR
int sumar_v(int n1, int n2) {
	return n1 + n2;
}
// FUNCION POR REFERENCIA
void sumar_r(int n1, int n2, int *s) {
	*s = n1 + n2;
}

// FUNCION POR REFERENCIA ME DEVUELVA LA SUMA Y LA RESTA
void sumar_restar_r(int n1, int n2, int *s, int *r) {
	 *s = n1 + n2;
	 *r = n1 - n2;
}

#include <stdio.h>
int main() {
	
	{
		printf("VERSION: POR VALOR\n");
		//Entrada
		int n1, n2;
		//Salida
		int suma;
		// Inicializar entrada
		n1 = 5;
		n2 = 7;
		suma = sumar_v(n1,n2);
		printf("Suma: %d\n", suma);
	}
	{
		printf("VERSION: POR REFERENCIA\n");
		//Entrada
		int n1, n2;
		//Salida
		int suma;
		// Inicializar entrada
		n1 = 5;
		n2 = 7;
		sumar_r(n1,n2,&suma);
		printf("Suma: %d\n", suma);		
	}
	{
		int n1=5, n2=7;
		int s;
		int r;
		sumar_restar_r(n1,n2,&s,&r);
		printf("Suma : %d\n", s);	
		printf("Resta: %d\n", r);	
	}
	
	
	return 0;
}