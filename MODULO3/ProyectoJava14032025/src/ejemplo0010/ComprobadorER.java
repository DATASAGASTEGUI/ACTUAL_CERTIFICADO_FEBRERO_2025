package ejemplo0010;

import java.util.Scanner;

public class ComprobadorER {

    public static void main(String[] args) {
       String patron = "20([01][0-9]|2[0-4])";
       String entrada;
       Scanner sc = new Scanner(System.in);
       boolean correcto;
       do {
           System.out.println("Ingrese el número? ");
           entrada = sc.next();
           correcto = entrada.matches(patron);
           if(!correcto) {
              System.out.println("Entrada incorrecta. Vuelva a ingresar el dato");
           }
       }while(!correcto); //Falso
       System.out.println("Correcto");
       System.out.println("Gracias por su visita");
    }
    
}
