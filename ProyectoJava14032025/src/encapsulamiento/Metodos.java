package encapsulamiento;

public class Metodos {
   // Método de instancia (objeto) - No tiene static
   public int suma(int a, int b) {
       return a + b;
   }
   
   public int suma(int a, int b, int c) {
       return a+b+c;
   }
    
   // Método de clase - Si tiene static
   public static int resta(int a, int b) {
       return a - b;
   }
}
