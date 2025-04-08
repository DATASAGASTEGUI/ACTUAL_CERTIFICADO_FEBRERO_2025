package ventana_basica;

import javax.swing.JFrame;

public class Ventana002 extends JFrame {
    
    Ventana002(String titulo) {
       this.setTitle(titulo);
       this.setSize(100,200);
       this.setVisible(true);
    }

    public static void main(String[] args) {
        Ventana002 ventana = new Ventana002("Ventana");
        
    }
    
}
