package ejemplo_hilo_2;

import java.util.ArrayList;
import java.util.List;

public class Main {


    public static void main(String[] args) {
         final long startTime = System.currentTimeMillis();
        //***************INICIO**************
        List<Cliente> clientes_al = new ArrayList<Cliente>();
        for(int i=0; i<1000; i++) {
            clientes_al.add(new Cliente("Nombre: " + (i+1)));
        }
        

        for (int i = 0; i < clientes_al.size(); i++) {
            clientes_al.get(i).mirun();
        }
        //***************FINAL**************
        final long endTime = System.currentTimeMillis();
        
        System.out.println("Tiempo total de ejecución = " + (endTime - startTime)/1000.0 + " segundos");

    }
    
}
