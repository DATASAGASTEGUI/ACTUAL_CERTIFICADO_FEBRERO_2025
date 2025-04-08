*******************
***   CADENAS   ***
*******************
--------------------------------------------------------------------------------
(1) Hacer  un  programa que ingrese letra por letra desde el teclado, terminando
    el ingreso cuando haya ingresaoo un enter(cambio de línea \n).

#include <stdio.h> //printf, scanf
#define MAX 300
int main() {
    char letra;
    char texto[MAX];
    int i = 0;
    
    printf("Ingresar un texto? ");
    while(1) {
        letra = getchar();
        
        if(letra == '\n') break;
        
        texto[i] = letra; 
        i++;    
    }
    texto[i] = '\0';
    
    printf("Texto ingresado: %s", texto);
    
    return 0;
}	
--------------------------------------------------------------------------------
(2) Hacer un programa que determine si una palabra ingresada desde el teclado es
    Palidromo o no.
	
// VERSION 1

#include <stdio.h> //printf, scanf
#include <string.h> //strlen
#define MAX 30
int main() {
    char palabra[MAX];
    int longitud;
    int bandera = 1;
    printf("Ingrese una palabra? ");
    scanf("%s", palabra);
    longitud = strlen(palabra);
    for(int i=0, j=longitud-1; i<=longitud/2; i++,j--) {
        if(palabra[i] != palabra[j]) {
            bandera = 0;
            break;
        }
    }
    printf("Resultado: %s", bandera == 1? "Es Palidromo":"No Es Palidromo");
    /*
    a r r a  = 4           4/2 = 2
    r e c o c e r = 7      7/2 = 3
    */
    return 0;
}

// VERSION 2

#include <stdio.h> //printf, scanf
#include <string.h> //strlen
#define MAX 30
int main() {
    char palabra[MAX];
    char alreves[MAX];
    
    int longitud;
    int bandera = 1;
    printf("Ingrese una palabra? ");
    scanf("%s", palabra);
    
    longitud = strlen(palabra);
    int i,j;
    for(i=longitud-1,j=0; i>=0; i--,j++) {
        alreves[j] = palabra[i];
    }
    alreves[j] = '\0';
    if(strcmp(palabra,alreves) == 0) {
       printf("Es Palidromo");
    }else {
       printf("No Es Palidromo");
    }

    /*
    a r r a  = 4           4/2 = 2
    r e c o c e r = 7      7/2 = 3
    */
    return 0;
}
--------------------------------------------------------------------------------
(3) Hacer un programa que  determine  si  un texto ingresado desde el teclado es
    Palidromo o no.
	
#include <stdio.h>
#include <string.h>
#define MAX 200
int main() {
	char texto[MAX];
	char palabra[MAX];
	
	printf("Ingresar un texto? ");
	fgets(texto, sizeof(texto), stdin);
	
	texto[strcspn(texto,"\n")] = '\0';
	
	int j = 0;
	for(int i=0; texto[i] != '\0'; i++) {
	    if(texto[i] != ' ') {
		   palabra[j] = texto[i];
		   j++;
		}
	}
	
	palabra[j] = '\0';
	
	int n = strlen(palabra);
	
	int bandera = 1;
	for(int i=0, j=n-1; i < n/2; i++, j--) {
		if(palabra[i] != palabra[j]) {     
		   bandera = 0;
		   break;
		}
	}
	
	printf("%s", bandera == 1 ? "Es Palidromo" : "No Es Palidromo");

	return 0;
}
	
/*
A mi loca Colima

AmilocaColima
amilocacolima
*/
--------------------------------------------------------------------------------
(4) Hacer un programa que lea letra por letra una entrada de un texto, y finalizará
    la entrada cuando presione enter(\n).
	
#include <stdio.h>
#define MAX 200
int main() {
	char texto[MAX];
	char letra;
    int i = 0;	
	
	printf("Ingrese un texto letra por letra? ");
	while(1) {
		letra = getchar();
		if(letra == '\n') break;
		texto[i] = letra;
		i++;
	}
	texto[i] = '\0';
	printf("Texto Ingresado: %s", texto);
	
	return 0;
}
--------------------------------------------------------------------------------
(5) Hacer un programa que lea letra por letra una entrada de un texto y no 
    permita el ingreso de vacoles para el texto.
	
#include <stdio.h>
#define MAX 200
int main() {
	char texto[MAX];
	char letra;
    int i = 0;	
	
	printf("Ingrese un texto letra por letra? ");
	while(1) {
		letra = getchar();
		if(letra == '\n') break;
		
		if(!(letra == 'a' || letra == 'e' || letra == 'i'|| letra == 'o'|| letra == 'u' || letra == ' ')) {
		    texto[i] = letra;
		    i++;
		}
	}
	texto[i] = '\0';
	printf("Texto Ingresado: %s", texto);
	
	return 0;
}
--------------------------------------------------------------------------------
(6) Recorrer una cadena

#include <stdio.h>
#include <string.h>

int main() {
	char texto[13] = "En un puerto";
	int n = strlen(texto);
	for(int i=0; i<n; i++) {
		printf("%c\n",texto[i]);
	}
	
	char texto1[] = "Hola Mundo";
	printf("%c", texto1[0]);
	return 0;
}
--------------------------------------------------------------------------------
******************
***   BUCLES   ***
******************
--------------------------------------------------------------------------------
(1) Hacer un programa para convertir un número decimal a binario.

// VERSION 1

#include <stdio.h>
int main() {
    int numero;
    int d;
    
    printf("Ingresar un número entero en decimal? ");
    scanf("%d", &numero);
	
	while(numero > 0) {
	   d = numero % 2;
	   printf("%d", d);
	   numero = numero / 2;
	}
	
	return 0;
}

// VERSION 2: GUARDAR EL NUMERO BINARIO EN UNA VARIABLE

#include <stdio.h>
#include <math.h> //pow, sqrt
int main() {
    int numero;
    int d;
	int binario = 0;
	int exponente = 0;
    
    printf("Ingresar un número entero en decimal? ");
    scanf("%d", &numero);
	
	while(numero > 0) {
	   d = numero % 2;
	   binario = binario + d * pow(10,exponente++);
	   numero = numero / 2;
	}
	printf("%d", binario);
	
	return 0;
}

-------------------
(2) Obtener los dígitos de un número decimal

#include <stdio.h>

int main() {
	int decimal;
	int digito;
	
	printf("Ingresar un número decimal? ");
	scanf("%d", &decimal);
	
	while(decimal > 0) {
		digito = decimal % 10;
		printf("%d\n", digito);
		decimal = decimal / 10; 
	}
	
	return 0;
}








    16 8 4 2 1
	 1 1 1 1 1


