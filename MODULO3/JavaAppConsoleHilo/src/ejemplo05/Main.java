package ejemplo05;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) throws InterruptedException {
         final long startTime = System.currentTimeMillis();
        //***************INICIO**************
        Conexion1 c = new Conexion1(true,"hospital");
        Connection conexion = c.getConexion();
        OperacionesCrud ocrud = new OperacionesCrud(conexion);
        
        int numeroClientes = 100;


        List<Thread> hilos_al = new ArrayList<Thread>();

        for (int i = 0; i < numeroClientes; i++) {
            String nombre = "Ventana " + String.valueOf(i + 1);
            Ventana ventana = new Ventana(nombre);
            ventana.setVisible(true);
            Cliente cliente = new Cliente(ocrud, ventana);
            hilos_al.add(new Thread(cliente));
        }

        for (int i = 0; i < numeroClientes; i++) {
            hilos_al.get(i).start();
        }

        for (int i = 0; i < numeroClientes; i++) {
            hilos_al.get(i).join();
        }
        //***************FINAL**************
        final long endTime = System.currentTimeMillis();

        System.out.println("Tiempo total de ejecución = " + (endTime - startTime) / 1000.0 + " segundos");
    }
    
}
