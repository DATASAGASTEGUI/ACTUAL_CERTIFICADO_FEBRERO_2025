package ejemplo0017;

import java.util.Scanner;

public class ValidarEntrada {
    static Scanner sc = new Scanner(System.in);
    public static double numero(String mensaje) {
        String patron = "[0-9]+\\.[0-9]{1,2}";
        double numero_d;
        String numero_s;
        boolean correcto;
        do {
            System.out.print(mensaje);
            numero_s = sc.next();
            correcto = numero_s.matches(patron);
            if(!correcto) {
               System.out.println("Entrada incorrecta. Vuelva a ingresa el dato");
            }
        }while(!correcto);
        numero_d = Double.parseDouble(numero_s);
        return numero_d;
    }
    
    public static char operacion(String mensaje) {
        String patron = "[+\\-*\\/^]";
        String operacion_s;
        char operacion_c;
        boolean correcto;
        do {
            System.out.println(mensaje);
            operacion_s = sc.next();
            correcto = operacion_s.matches(patron);
            if(!correcto) {
               System.out.println("Entrada incorrecta. Vuelva a ingresa el dato");
            }
        }while(!correcto);
        operacion_c = operacion_s.charAt(0);
        return operacion_c;
    }
}
