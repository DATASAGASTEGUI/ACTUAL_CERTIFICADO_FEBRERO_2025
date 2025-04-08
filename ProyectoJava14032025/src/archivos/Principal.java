package archivos;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Principal {

    public static void main(String[] args) {
        metodo2();
    }

    public static void metodo1() {
        File f = new File("H:\\LLEVAR1\\OneDrive - UNED\\Documentos\\archivo.txt");
        try {
            if (f.createNewFile()) {
                System.out.println("OK");
            } else {
                System.out.println("Error al crear el archivo");
            }
        } catch (IOException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public static void metodo2() {
        String[] nombres = {"María", "Juan", "Carmen", "Vanessa"};
        File f;
        try {
            for (String nombre : nombres) {
                f = new File("H:\\LLEVAR1\\OneDrive - UNED\\Documentos\\" + nombre + ".txt");
                if(!f.exists()) {
                    if (f.createNewFile()) {
                        System.out.println("OK");
                    } else {
                        System.out.println("Error al crear el archivo");
                    }
                }else {
                    if(f.delete()) {
                        if (f.createNewFile()) {
                            System.out.println("OK");
                        } else {
                            System.out.println("Error al crear el archivo 1");
                        }
                    }
                }
            }
        } catch (IOException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }
}
