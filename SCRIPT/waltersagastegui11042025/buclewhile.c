#include <stdio.h>
int main() {
	int numero;
	int s = 0;
	while(1) {
	   printf("Ingresar número entero? ");
	   scanf("%d", &numero);
	   
	   if(numero == 0) break;
	   
	   s = s + numero;
	}
	printf("Suma de los números igresados: %d", s); 
	
	return 0;
}