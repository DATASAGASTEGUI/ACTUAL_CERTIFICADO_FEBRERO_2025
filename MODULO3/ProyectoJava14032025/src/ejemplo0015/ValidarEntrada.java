package ejemplo0015;

import java.util.Scanner;

public class ValidarEntrada {
       static Scanner sc = new Scanner(System.in);
       public static double coordenada(String mensaje) {
        // VALIDAR COORDENADA CARTESIANA
        String coordenada_s;
        double coordenada_d;
        String patron = "[0-9]+\\.[0-9]{1,2}";
        boolean correcto;
        do {
            System.out.println(mensaje);
            coordenada_s = sc.next();
            correcto = coordenada_s.matches(patron);
            if (!correcto) {
                System.out.println("Entrada incorrecta. Vuelva a ingresar la coordenada correcta");
            }
        } while (!correcto);
        coordenada_d = Double.parseDouble(coordenada_s);
        return coordenada_d;
    } 
}
