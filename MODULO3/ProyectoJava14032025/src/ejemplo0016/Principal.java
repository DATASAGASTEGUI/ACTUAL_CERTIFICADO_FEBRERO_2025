package ejemplo0016;

import biblioteca.Entrada;


public class Principal {

    public static void main(String[] args) {
        /*
        Scanner sc = new Scanner(System.in);
        int edad;
        System.out.println("Ingresar edad? ");
        edad = sc.nextInt();
*/
        /*
        int edad = Entrada.entradaEdad("Ingresa tu edad?");
        
        int n = 2;
        double r = Math.sqrt(2);
        
        int base = 2;
        int exponente = 3;
        double x = Math.pow(base, exponente);
        */
        /*
        System.out.println("Ejemplo Cadenas");
        String cadena1 = "Hola";
        String cadena2 = "HOLA";
        
        if(cadena1.equalsIgnoreCase(cadena2)) { 
           System.out.println("Si son iguales");
        }else {
           System.out.println("No son iguales"); 
        }
        
        if("hola".equalsIgnoreCase("HOLA")) { 
           System.out.println("Si son iguales");
        }else {
           System.out.println("No son iguales"); 
        }
*/
        
        /*
        String x = "12345";
        int y = Integer.parseInt(x);
        int z = y * y;
        
        String w = String.valueOf(z);
        */
        
        String x = "FF";
        int y = Integer.parseInt(x,16);
        System.out.println("y: " + y);
    }
    
}
