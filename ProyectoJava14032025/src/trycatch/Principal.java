package trycatch;

import java.util.Scanner;

public class Principal {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int edad;
        while(true) {
            try {
                System.out.print("Ingrese la edad de una persona? ");
                edad = sc.nextInt();
                break;
            }catch(Exception e) {
                System.out.println("ERROR");
                sc.next(); // Consumir la entrada inválida para evitar bucle infinito
            }
        }
    }
}
    

