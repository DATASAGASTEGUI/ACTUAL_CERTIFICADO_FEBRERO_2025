package ejemplo0001;

import java.util.Scanner;

/*
Hacer un programa para convertir
una cantidad de dinero(entero) 
en billetes 1, 5, 10, 20, 50

101 = 2 billenes de 50
      1 billete  de 1

33 = 1 billete de 20
     1 billete de 10
     3 billenes de 1
*/

public class Ejemplo1 {

    public static void main(String[] args) {
      // DECLARAR VARIABLES Y OBJETOS
      int dinero; //Variable por valor
      int billete50, billete20, billete10, billete5, billete1;
      Scanner sc = new Scanner(System.in); //Variable por referencia
      // ENTRADA
      System.out.print("Ingresar el dinero a convertir? ");
      dinero = sc.nextInt();
      // PROCESO
      billete50 = dinero / 50; //2
      dinero = dinero % 50; //1         Resto
      
      billete20 = dinero / 20; //0
      dinero = dinero % 20; //1         Resto
      
      billete10 = dinero / 10;
      dinero = dinero % 10; //1         Resto
      
      billete5 = dinero / 5;
      dinero = dinero % 5; //1          Resto
      
      billete1 = dinero / 1;
      dinero = dinero % 1;  //0         Resto 
      // SALIDA
      System.out.println("Billlete 50: " + billete50);
      System.out.println("Billlete 20: " + billete20);
      System.out.println("Billlete 10: " + billete10);
      System.out.println("Billlete  5: " + billete5);
      System.out.println("Billlete  1: " + billete1);
    }
}
