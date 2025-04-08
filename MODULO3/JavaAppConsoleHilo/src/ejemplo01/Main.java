package ejemplo01;

import java.util.List;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws InterruptedException {
        
        final long startTime = System.currentTimeMillis();
        //***************INICIO**************
        Cliente luis = new Cliente("Luis");
        Cliente miguel = new Cliente("Miguel");
        Cliente carlos = new Cliente("Carlos");

        List<Cliente> clientes_al = new ArrayList<Cliente>();

        clientes_al.add(luis);
        clientes_al.add(miguel);
        clientes_al.add(carlos);

        for (int i = 0; i < clientes_al.size(); i++) {
            clientes_al.get(i).mirun();
        }
        //***************FINAL**************
        final long endTime = System.currentTimeMillis();
        
        System.out.println("Tiempo total de ejecución = " + (endTime - startTime)/1000.0 + " segundos");

    }

}
