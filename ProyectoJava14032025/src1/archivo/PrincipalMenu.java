package archivo;

import java.util.Scanner;

public class PrincipalMenu {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String opcion;
        String archivo = "C:\\Users\\Curso Tarde\\Documents\\datos.txt";
        while (true) {
            System.out.println("MENU\n");
            System.out.println("[1] Cantida de palabras");
            System.out.println("[2] Cantidad de palabras distintas");
            System.out.println("[3] Preguntar por una palabra y mostrar cuantas existen");
            System.out.println("[4] De las palabras distints cuantas hay de cada una");
            System.out.println("[5] Salir");

            System.out.print("Ingrese su opción? ");
            opcion = sc.next();

            switch (opcion) {
                case "1":
                    //System.out.println("Opción 1");
                    MetodoMenu.cantidadPalabras(archivo);
                    break;
                case "2":
                    System.out.println("Opción 2");
                    MetodoMenu.palabrasDistintas(archivo);
                    break;
                case "3":
                    //System.out.println("Opción 3");
                    MetodoMenu.contarRepeticionPalabra(archivo);
                    break;
                case "4":
                    System.out.println("Opción 4");
                    MetodoMenu.contarPalabrasDisintas(archivo);
                    break;
                case "5":
                    System.exit(0);
                    break;
                default:
                    System.out.println("Opción no válida. Vuelva a ingresar opción");
            }

        }
    }

}
