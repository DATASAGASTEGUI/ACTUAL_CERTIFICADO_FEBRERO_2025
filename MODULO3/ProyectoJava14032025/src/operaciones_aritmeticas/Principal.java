package operaciones_aritmeticas;

public class Principal {

    public static void main(String[] args) {
        /*
             suma, resta, multiplicacion, division
        Entrada: numero1, numero2 
        
        */
        /*
        System.out.println("Suma: " + sumar(5,6));
        
        OperacionesAritmeticas oa = new OperacionesAritmeticas();
        System.out.println("Suma: " + oa.suma());
        
        
        String cadena = "Hola Mundo";
        
        System.out.println("Longitud: " + cadena.length());
        System.out.println("Longitud: " + "Hola Mundo".length());
        System.exit(0);
        int z = 6;
        Integer w = 7;
        
        // TIPOS BASICOS
        // int short byte long
        
        z = w;
        
        int t = 89;
        String m = String.valueOf(t);
        */
        char[] letras = {'H','O','L','A'};
        String cadena1 = String.valueOf(letras);
        System.out.println("Cadena1: " + cadena1);
    }
    
    public static int sumar(int a, int b) {
        return a + b;
    }
}
