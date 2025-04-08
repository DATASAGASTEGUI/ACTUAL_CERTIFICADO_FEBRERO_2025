package proyecto;

import java.io.IOException;
import java.util.Arrays;

public class SerieNatural { // ABRIR CLASE

    public static void main(String[] args) { // ABRIR MAIN
        for (int i = 1; i <= 5; i++) {
            System.out.println(i);
        }

        pause();
    } // CERRAR MAIN

    public static void pause() {
        try {
            System.out.print("\n\nPresiona una tecla para continuar...");
            System.in.read();
        } catch (IOException ex) {
        }
    }
} // CERRAR CLASE
