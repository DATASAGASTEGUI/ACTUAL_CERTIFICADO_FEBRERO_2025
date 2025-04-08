package ejemplo0017;

import java.util.Scanner;

public class Principal1 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        //DECLARACION DE TIPOS
        double n1, n2; 
        char operacion;
        
        double resultado;
        //ENTRADA
        n1 = ValidarEntrada.numero("Ingresar número 1? ");
        n2 = ValidarEntrada.numero("Ingresar número 2? ");
        operacion = ValidarEntrada.operacion("Ingresar operación (+-/*^)? ");
        OperacionAritmetica oa = new OperacionAritmetica(n1,n2,operacion);
        System.out.println("Resultado: " + oa.getResultado());
    }
    
}
