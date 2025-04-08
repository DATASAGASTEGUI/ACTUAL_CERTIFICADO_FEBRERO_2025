package _0007_hilo;

public class Metodo {

    public static synchronized void proceso(String nombre, Ventana ventana) {
        for (long i = 0; i < 1000000; i++) {
            //System.out.println(nombre + " " + i);
            ventana.escribir(i);
        }
    }

}
