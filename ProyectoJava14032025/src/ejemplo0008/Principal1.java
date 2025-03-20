package ejemplo0008;

/*
Generar 1000 números aleatorios con el radio

Circulo  Radio   Perimetro   Area
---------------------------------
1           5         
2          10
3        3413
...
*/

public class Principal1 {

    public static void main(String[] args) {
       int radio;
       // GENERAR 1000 NUMEROS ALEATORIOS [10-100]
       for(int i=1; i<=1000; i++) {
           radio = (int)(Math.random() * 91 + 10);
           CalculoPerimetroAreaCirculo c = new CalculoPerimetroAreaCirculo(radio);
           System.out.printf("%d\t%d\t%.2f\t%.2f\n",i,radio,c.getP(),c.getA());
       }
       
       
    }
    
}
