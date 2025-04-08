package ventana_basica;

import javax.swing.JFrame;

public class Ventana001 {

    public static void main(String[] args) {
        JFrame ventana = new JFrame("Primera Ventana");
        ventana.setVisible(true);
        ventana.setSize(100, 200); //Ancho, Alto
        ventana.setTitle("Cambiar Nombre");
        ventana.setLocation(100, 100);
    }
    
}
