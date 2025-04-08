package encapsulamiento;

public class PrincipalMetodos {

    public static void main(String[] args) {
       int a = 5;
       int b = 6;
       
       Metodos objeto = new Metodos();
       System.out.println("Suma: " + objeto.suma(a, b));
       
       System.out.println("Resta: " + Metodos.resta(a, b));
    }
    
}
