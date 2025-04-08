package ejemplo0010;

import java.util.Locale;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        /*
        int x = 5;
        int[] numeros = {1,2,3,4,5,6,7};
        
        int[] numeros1 = new int[7];
        numeros1[0] = 1;
        numeros2[1] = 2;
        
        char[] letras = {'a','1','?'};
        
        String[] cadenas = {"Hola","Casa","Luis", "Hola Mundo"};
        */
        
        /*
        Estudiante e1 = new Estudiante("Luis",23,8.5);
        Estudiante e2 = new Estudiante("Miguel",22,6.3);
        Estudiante e3 = new Estudiante("Melissa",21,4.5);
        Estudiante e4 = new Estudiante("Fany",22,4.7);
        Estudiante e5 = new Estudiante("Gerson",21,9.5);
        Estudiante[] estudiantes = {e1,e2,e3,e4,e5};
        */
        Scanner sc = new Scanner(System.in);
        sc.useLocale(Locale.US); //Permite usar el . en lugar de la ,
        
        Estudiante[] estudiantes = new Estudiante[5];
        String nombre;


        boolean correcto;
        String patron;
        // LLENAR
        for(int i=0; i<5; i++) {
            System.out.println("Ingresar estudiante: " + (i+1));
            
            // VALIDAR EL NOMBRE
            patron = "[A-Za-záéíóúñÑ\\s]+";
            do {
                System.out.println("Ingresar nombre? ");
                nombre = sc.next();
                correcto = nombre.matches(patron);
                sc.nextLine(); // Limpiar buffer después de next()
                if(!correcto) {
                   System.out.println("Entrada incorrecta. Vuelva a ingresar el nombre correcto");
                }
            }while(!correcto);
            
            // VALIDAR LA EDAD
            String edad_s;
            int edad_i = 0;
            patron = "\\d{1,3}"; //4, 44,,222, 3333, ...
            do {
                System.out.println("Ingresar edad? ");
                edad_s = sc.next(); // "444444444444444444444444"
                correcto = edad_s.matches(patron) && Integer.parseInt(edad_s) > 0 &&
                        Integer.parseInt(edad_s) < 150;

                if(!correcto) {
                   System.out.println("Entrada incorrecta. Vuelva a ingresar la edad correcta");
                }
            }while(!correcto);
            edad_i = Integer.parseInt(edad_s);
            
            // VALIDAR CALIFICACION
            String calificacion_s;
            double calificacion_d;
            patron = "(10|10.00|10.0|[0-9](\\.\\d{1,2})?)";
            do {
                System.out.println("Ingresar calificacion? ");
                calificacion_s = sc.next();
                correcto = calificacion_s.matches(patron);
                if(!correcto) {
                   System.out.println("Entrada incorrecta. Vuelva a ingresar la calificación correcta");
                }
            }while(!correcto);
            calificacion_d = Double.parseDouble(calificacion_s);
            
            Estudiante e = new Estudiante(nombre,edad_i,calificacion_d);
            
            estudiantes[i] = e; // = Operador de asignacion, == Operador de comparacion  "1"==1 verdadero
        }
        // MOSTRAR
        for(int i=0; i<5; i++) {
            estudiantes[i].mostrarInformacion();
        }
    }
    
}
