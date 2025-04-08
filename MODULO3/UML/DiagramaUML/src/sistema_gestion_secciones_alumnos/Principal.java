package sistema_gestion_secciones_alumnos;

import java.io.IOException;
import java.util.List;
import java.util.Scanner;

public class Principal {
    static Scanner sc = new Scanner(System.in);
    static GestorSistemaSeccionesAlumnos gs;
    static List<Alumno> alumnos = null;
    
    public static void main(String[] args) {
        String opcion = "";
        String rutaNombreArchivo = "C:\\Users\\Curso Tarde\\Documents\\datos_alumnos.csv";
        alumnos = Data.obtenerTodosObjetosAlumno(rutaNombreArchivo);
        gs = new GestorSistemaSeccionesAlumnos(alumnos);
        while(true) {
            cls();
            menu();
            opcion = sc.next();
            switch(opcion) {
                case "1": cls(); opcion1(); pause();
                case "0": cls(); 
                          System.out.println("Gracias por su visita");
                          pause();
            }
        }
        
        
        
    }
    
    public static void menu() {
        System.out.println("MENU");
        System.out.println("[1] Mostrar todos los alumnos con sus notas y promedio");
        System.out.println("[0] Salir");
        
        System.out.print("Ingresar su opción? ");
    }
    
    public static void opcion1() {
       System.out.println("[1] Mostrar todos los alumnos con sus notas y promedio");
       System.out.println("------------------------------------------------------");
       gs.mostrarTodosAlumnosConNotasPromedio();
         
    }
    
    private static void pause() {
        try {
            System.out.print("\nPresiona una tecla para continuar...");
            System.in.read();
        } catch (IOException e) {
        }
    }

    private static void cls() {
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    }    
    
}
