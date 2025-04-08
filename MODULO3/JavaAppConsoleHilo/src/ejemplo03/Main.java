package ejemplo03;

import java.util.List;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws InterruptedException {
        final long startTime = System.currentTimeMillis();
        //***************INICIO**************
        Ventana vluis = new Ventana("Luis");
        Ventana vmiguel = new Ventana("Miguel");
        Ventana vcarlos = new Ventana("Carlos");
        
        vluis.setVisible(true);
        vmiguel.setVisible(true);
        vcarlos.setVisible(true);
        
        Cliente luis = new Cliente("Luis",vluis);
        Cliente miguel = new Cliente("Miguel",vmiguel);
        Cliente carlos = new Cliente("Carlos",vcarlos);

        List<Thread> hilos_al = new ArrayList<Thread>();

        hilos_al.add(new Thread(luis));
        hilos_al.add(new Thread(miguel));
        hilos_al.add(new Thread(carlos));

        for (int i = 0; i < hilos_al.size(); i++) {
            hilos_al.get(i).start();
        }

        for (int i = 0; i < hilos_al.size(); i++) {
            hilos_al.get(i).join();
        }
        //***************FINAL**************
        final long endTime = System.currentTimeMillis();

        System.out.println("Tiempo total de ejecución = " + (endTime - startTime) / 1000.0 + " segundos");

    }

}
