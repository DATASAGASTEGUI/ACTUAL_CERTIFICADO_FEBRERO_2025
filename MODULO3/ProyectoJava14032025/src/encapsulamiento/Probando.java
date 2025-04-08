package encapsulamiento;

public class Probando {

    public static void main(String[] args) {
       int x = 5;
       System.out.println("X: " + x);
       x = 10;
       System.out.println("X: " + x);
       
       final int y = 8;
       System.out.println("Y: " + y);
      //
      
       Promedio p = new Promedio();
       System.out.println("Peso PCP: " + Promedio.PCP);
       
       int radio = 5;
       double perimetro = 2 * Math.PI * radio;
       double area = Math.PI * Math.pow(radio,2);
       
    }
    
}
