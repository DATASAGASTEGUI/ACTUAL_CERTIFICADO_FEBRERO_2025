package ejemplo04;

import java.util.List;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws InterruptedException {
        final long startTime = System.currentTimeMillis();
        //***************INICIO**************
        int numeroClientes = 100;

        Ventana ventana;
        Cliente cliente;
        Thread hilo;
        String nombre;

        List<Thread> hilos_al = new ArrayList<Thread>();

        for (int i = 0; i < numeroClientes; i++) {
            nombre = "Ventana " + String.valueOf(i + 1);
            ventana = new Ventana(nombre);
            ventana.setVisible(true);
            cliente = new Cliente(nombre, ventana);
            hilo = new Thread(cliente);
            hilos_al.add(hilo);
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
