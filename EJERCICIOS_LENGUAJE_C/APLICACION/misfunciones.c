#include <stdio.h>
#include <string.h> //strcmp
#include "misfunciones.h" //prototipos de funciones

void opcion1()
{
    printf("[1] Decir si un número es positivo o negativo\n");
    printf("---------------------------------------------\n");
    int numero;
    printf("Ingrese un número: ");
    scanf("%d", &numero);
    if (numero > 0)
    {
        printf("El número es positivo.\n");
    }
    else if (numero < 0)
    {
        printf("El número es negativo.\n");
    }
    else
    {
        printf("El número es cero.\n");
    }
}

void opcion2()
{
    printf("[2] Mostrar el día de la semana según un número del 1 al 7\n");
    printf("----------------------------------------------------------\n");
    int diaSemana;
    printf("Ingrese un número del 1 al 7: ");
    scanf("%d", &diaSemana);
    switch (diaSemana)
    {
    case 1:
        printf("Es lunes.\n");
        break;
    case 2:
        printf("Es martes.\n");
        break;
    case 3:
        printf("Es miércoles.\n");
        break;
    case 4:
        printf("Es jueves.\n");
        break;
    case 5:
        printf("Es viernes.\n");
        break;
    case 6:
        printf("Es sábado.\n");
        break;
    case 7:
        printf("Es domingo.\n");
        break;
    default:
        printf("Número inválido.\n");
        break;
    }
}

void opcion3()
{
    printf("[3] Mostrar los números del 1 al 10 usando un bucle for\n");
    printf("-------------------------------------------------------\n");
    for (int i = 1; i <= 10; i++)
    {
        printf("%d ", i);
    }
    printf("\n");
}

void opcion4()
{
    printf("[4] Pedir números y los cuente hasta que el usuario ingrese -1\n");
    printf("--------------------------------------------------------------\n");
    int numero, contador = 0;
    while (1)
    {
        printf("Ingrese un número (-1 para terminar): ");
        scanf("%d", &numero);
        if (numero == -1)
            break;
        contador++;
    }
    printf("Se ingresaron %d números.\n", contador);
}

void opcion5()
{
    printf("[5] Pedir una contraseña hasta que el usuario escriba la correcta\n");
    printf("---------------------------------------------------------------\n");
    char contrasena[20] = "1234"; // Contraseña correcta
    char entrada[20];
    do
    {
        printf("Ingrese la contraseña: ");
        scanf("%s", entrada);
        if (strcmp(entrada, contrasena) == 0)
        {
            printf("Contraseña correcta.\n");
            break;
        }
        else
        {
            printf("Contraseña incorrecta. Intente de nuevo.\n");
        }
    } while (strcmp(entrada, contrasena) != 0);
}

void opcion5_1()
{
    printf("[5] Pedir una contraseña hasta que el usuario escriba la correcta\n");
    printf("---------------------------------------------------------------\n");
    char contrasena[20] = "1234"; // Contraseña correcta
    char entrada[20];
    do
    {
        printf("Ingrese la contraseña: ");
        scanf("%s", entrada);
        if (strcmp(entrada, contrasena) != 0)
        {
            printf("Contraseña incorrecta. Intente de nuevo.\n");
        }
    } while (strcmp(entrada, contrasena) != 0);
    printf("Contraseña correcta.\n");
}