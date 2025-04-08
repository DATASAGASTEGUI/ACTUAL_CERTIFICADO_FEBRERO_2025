package ejemplo06;

public class Metodo {

    public static synchronized void proceso(String nombre) {
        for (long i = 0; i < 100000; i++) {
            System.out.println(nombre + " " + i);
        }
    }

}
