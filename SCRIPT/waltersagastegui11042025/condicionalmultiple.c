#include <stdio.h>

int main() {
	float nota;
	
	do {
       printf("Ingresar su nota? ");
	   scanf("%f", &nota);	
	   
	   if(!(nota >= 0 && nota <= 10)) {
		  printf("Nota no valida. Vuelva a ingresar nota\n");
	   }
	}while(!(nota >= 0 && nota <= 10));
	
	if(nota >= 0 && nota < 5) {
	   printf("Desaprobado\n");
	} else if(nota >= 5 && nota < 7) {
	   printf("Aprobado\n");
	} else if(nota >= 7 && nota < 9) {
	   printf("Notable\n");
	} else if(nota >= 9 && nota < 10) {
	   printf("Sobresaliente\n");
	} 
	
	
	return 0;
}

/*
[0,5>  desaprobado 
[5,7>  aprobado
[7,9>  notable
[9,10] sobresaliente

*/