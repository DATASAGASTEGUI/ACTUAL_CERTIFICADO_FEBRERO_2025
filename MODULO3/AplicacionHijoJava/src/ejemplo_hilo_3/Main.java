package ejemplo_hilo_3;


import java.util.ArrayList;
import java.util.List;

public class Main {


    public static void main(String[] args) {
         final long startTime = System.currentTimeMillis();
        //***************INICIO**************
        List<Cliente> clientes1_al = new ArrayList<Cliente>();
        List<Thread> clientes2_al = new ArrayList<Thread>();
        
        for(int i=0; i<10; i++) {
            clientes1_al.add(new Cliente("Nombre: " + (i+1)));
        }
        
        for (int i = 0; i < clientes1_al.size(); i++) {
            clientes2_al.add(new Thread(clientes1_al.get(i)));
        }
        
        for(int i=0; i<clientes2_al.size(); i++) {
            clientes2_al.get(i).start();
        }
        //***************FINAL**************
        final long endTime = System.currentTimeMillis();
        
        System.out.println("Tiempo total de ejecución = " + (endTime - startTime)/1000.0 + " segundos");
        
        System.out.println("Esperando mi salida");

    }
    
}
