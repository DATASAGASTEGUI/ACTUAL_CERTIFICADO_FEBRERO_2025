package ejemplo0017;

import java.util.Scanner;

public class Principal0 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        //DECLARACION DE TIPOS
        //1. Entrada
        double n1, n2; 
        char operacion;
        //2. Salida
        double resultado;
        //ENTRADA
        n1 = ValidarEntrada.numero("Ingresar número 1? ");
        n2 = ValidarEntrada.numero("Ingresar número 2? ");
        operacion = ValidarEntrada.operacion("Ingresar operación (+-/*^)? ");
        //PROCESO
        switch(operacion) {
            case '+' -> resultado = n1 + n2;
            case '-' -> resultado = n1 - n2;
            case '*' -> resultado = n1 * n2;
            case '/' -> resultado = n1 / n2;
            case '^' -> resultado = Math.pow(n1, n2);
        }
        //SALIDA
        System.out.printf("Resultado: %.2f", resultado);
   }
}
