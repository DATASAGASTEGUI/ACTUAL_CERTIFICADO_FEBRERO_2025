package ejemplo0007;
/*
Convertir coordena cartesiana a polar.
*/

import java.util.Scanner;

public class Principal {

    public static void main(String[] args) {
        // DECLARAR VARIABLES
        double x, y, radio, angulo;
        Scanner sc = new Scanner(System.in);
        
        // ENTRADA
        System.out.println("Ingresar coordenada cartesiana x? ");
        x = sc.nextDouble();
        System.out.println("Ingresar coordenada cartesiana y? ");
        y = sc.nextDouble();
        
        // PROCESO
        radio = Math.sqrt(x*x + y*y);
        //radio = Math.sqrt(Math.pow(x,2) + Math.pow(x,2));
        angulo = Math.atan2(y, x);
        
        // SALIDA
        //System.out.println("Radio : " + radio);
        //System.out.println("Angulo: " + angulo * 180 / Math.PI);
        System.out.printf("Radio  : %7.2f\n", radio);
        System.out.printf("Angulo : %7.2f\n", angulo * 180 / Math.PI);
    }
    
}
