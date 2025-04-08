package ejemplo0001;

public class Ejemplo5 {

    public static void main(String[] args) {
        String texto1 = "Hola Mundo";
        String texto2 = "Hola MUNDO";
        if(texto1.equals(texto2)) {
           System.out.println("SI IGUALES");
        }else {
           System.out.println("NO IGUALES"); 
        }
        
        if(texto1.equalsIgnoreCase(texto2)) {
           System.out.println("SI IGUALES");
        }else {
           System.out.println("NO IGUALES"); 
        } 
        
        // + operador concatenación ó operador aritmetico
        
        System.out.println(2 + "3");
        System.out.println(2 + 3);
        System.out.println((2 + 3) + "0");
        System.out.println("Hola" + 1 + true);
        System.out.println(1 + 2 + 3 + "A");
        System.out.println("A" + 1 + 2 + 3);
        System.out.println("" + 1 + 2 + 3 + "A");
        System.out.println("" + 1 + 2 + 3 + 'A');
    }
    
}
