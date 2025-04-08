package ejemplo0014;

//import java.util.Locale;
import java.util.Scanner;

public class ValidarEntrada {

    static Scanner sc = new Scanner(System.in);
    //sc.useLocale(Locale.US); 

    public static String nombre() {
        // VALIDAR EL NOMBRE
        String patron = "[A-Za-záéíóúñÑ\\s]+";
        String nombre;
        boolean correcto;
        do {
            System.out.println("Ingresar nombre? ");
            nombre = sc.next();
            correcto = nombre.matches(patron);
            sc.nextLine(); // Limpiar buffer después de next()
            if (!correcto) {
                System.out.println("Entrada incorrecta. Vuelva a ingresar el nombre correcto");
            }
        } while (!correcto);
        return nombre;
    }

    public static int edad() {
        // VALIDAR LA EDAD
        String edad_s;
        int edad_i = 0;
        String patron = "\\d{1,3}";
        boolean correcto;
        do {
            System.out.println("Ingresar edad? ");
            edad_s = sc.next();
            correcto = edad_s.matches(patron) && Integer.parseInt(edad_s) > 0
                    && Integer.parseInt(edad_s) < 150;

            if (!correcto) {
                System.out.println("Entrada incorrecta. Vuelva a ingresar la edad correcta");
            }
        } while (!correcto);
        edad_i = Integer.parseInt(edad_s);
        return edad_i;
    }

    public static double calificacion() {
        // VALIDAR CALIFICACION
        String calificacion_s;
        double calificacion_d;
        String patron = "(10|10.00|10.0|[0-9](\\.\\d{1,2})?)";
        boolean correcto;
        do {
            System.out.println("Ingresar calificacion? ");
            calificacion_s = sc.next();
            correcto = calificacion_s.matches(patron);
            if (!correcto) {
                System.out.println("Entrada incorrecta. Vuelva a ingresar la calificación correcta");
            }
        } while (!correcto);
        calificacion_d = Double.parseDouble(calificacion_s);
        return calificacion_d;
    }
}
