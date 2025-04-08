package biblioteca;

import java.util.Scanner;


public class Entrada {
   public static int entradaEdad(String mensaje) {
       Scanner sc = new Scanner(System.in);
       int edad;
       System.out.println(mensaje);
       edad = sc.nextInt();
       return edad;
   } 
}
