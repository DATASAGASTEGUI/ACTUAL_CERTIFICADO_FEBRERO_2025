package ejemplo0002;

import java.util.Scanner;

public class Ejemplo2 {

    public static void main(String[] args) {
       //DECLARAR VARIABLES
       Scanner sc = new Scanner(System.in);
       String dni, nombres, apellidos;
       int edad;
       double estatura;
       char sexo;
       boolean casado;
       //ENTRADA
        System.out.println("Ingrese dni: ");
        dni = sc.next(); 
        sc.nextLine(); // Limpiar buffer después de next()

        System.out.println("Ingrese nombres: ");
        nombres = sc.nextLine();

        System.out.println("Ingrese apellidos: ");
        apellidos = sc.nextLine();

        System.out.println("Ingrese edad: ");
        edad = sc.nextInt();
        sc.nextLine(); // Limpiar buffer después de nextInt()

        System.out.println("Ingrese estatura: ");
        estatura = sc.nextDouble();
        sc.nextLine(); // Limpiar buffer después de nextDouble()

        System.out.println("Ingrese estado civil (true/false): ");
        casado = sc.nextBoolean();
        sc.nextLine(); // Limpiar buffer después de nextBoolean()

        System.out.println("Ingrese sexo (M/F): ");
        sexo = sc.next().charAt(0);// "M" -> 'M' 

        sc.close(); // Cerrar Scanner para liberar recursos    
       
       Alumno alumno = new Alumno(dni,nombres,apellidos,
                                  edad,estatura,casado,sexo);
       
       System.out.println(alumno); //toString()
       System.out.println(alumno.miPresentacion());
    }
    
}
