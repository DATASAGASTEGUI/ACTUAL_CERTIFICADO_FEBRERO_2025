package ejemplo0001;

import java.util.Scanner;

/*
Hacer un programa para determinar la letra
que le corresponde a un DNI
*/

public class Ejemplo2 {

    public static void main(String[] args) {
        // DECLARACION VARIABLES 
                        //0    1    2    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17   18   19   20   21   22
        char[] letras = {'T', 'R', 'W', 'A', 'G', 'M', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'C', 'K', 'E'};
        Scanner sc = new Scanner(System.in);
        int dni;
        char letra;
        // ENTRADA
        System.out.print("Ingrese su DNI? ");
        dni = sc.nextInt();
        // PROCESA
        letra = letras[dni % 23];
        // SALIDA
        System.out.println("El DNI " + dni + " es la letra " + letra);
    }
}
