
package sistema_test_ventana;

import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author RYZEN
 */
public class Principal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int cantidad = 5;
        int aleatorio;
        Set numeros = new TreeSet();
        for(;true;) {
            aleatorio = (int)(Math.random()*50 + 1);
            numeros.add(aleatorio);
            if(numeros.size() == cantidad) break;
            
            System.out.print(aleatorio+"  ");
        }
        System.out.println("NUMEROS DISTINTOS");
        for(Object n : numeros) {
            System.out.print((int)n + "  ");
        }
    }
    
}
