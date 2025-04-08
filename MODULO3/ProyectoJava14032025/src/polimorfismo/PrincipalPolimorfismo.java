package polimorfismo;

import java.util.ArrayList;
import java.util.List;

public class PrincipalPolimorfismo {

    public static void main(String[] args) {
       Cuadrado c = new Cuadrado(5);
       
       List<FigurasGeometricas> figuras = new ArrayList<>();
       figuras.add(c);
       for(FigurasGeometricas f: figuras) {
           System.out.println("Area: " + f.area());
       }
    }
    
}
