package ejemplo0010;

import java.util.Scanner;

public class ValidarBoolean {

    public static void main(String[] args) {
        String casado_s; //true o false
        boolean casado_b = true;
        Scanner sc = new Scanner(System.in);
        String patron = "true|verdadero|1|casado|false|falso|0|soltero";
        boolean correcto;

        do {
            System.out.println("Ingrese si es casado (true/false): ");
            casado_s = sc.next().toLowerCase();
            correcto = casado_s.matches(patron);
            if (!correcto) {
                System.out.println("Entrada incorrecta. Vuelva a ingresar el dato");
            }
        } while (!correcto);
        if (casado_s.equals("true")
                || casado_s.equals("verdaero")
                || casado_s.equals("1")
                || casado_s.equals("casado")) {
            casado_b = true;
        }
        if (casado_s.equals("false")
                || casado_s.equals("falso")
                || casado_s.equals("0")
                || casado_s.equals("soltero")) {
            casado_b = false;
        }

        System.out.println("Conversión: " + casado_b);
    }

}
