#include <stdio.h>

int main() {
	int numero;
	
	printf("Ingresar número entero? ");
	scanf("%d", &numero);
	
	if(numero % 2 == 0) {
	   printf("El número %d es Par\n", numero);
	}else {
	   printf("El número %d es Impar\n", numero);
	}
	
	return 0;
}