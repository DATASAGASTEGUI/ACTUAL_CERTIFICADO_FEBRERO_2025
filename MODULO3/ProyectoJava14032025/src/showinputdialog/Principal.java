package showinputdialog;

import javax.swing.JOptionPane;

public class Principal {

    public static void main(String[] args) {
        while(true) {
            try {
                String n1 = JOptionPane.showInputDialog("Introducir número 1? ");
                String n2 = JOptionPane.showInputDialog("Introducir número 2? ");
                int r = Integer.parseInt(n1) + Integer.parseInt(n2);
                JOptionPane.showMessageDialog(null, "Suma: " + r, "Información",
                        JOptionPane.INFORMATION_MESSAGE);
                break;
            }catch(Exception e) {
                JOptionPane.showMessageDialog(null, "Entrada incorrecta", "Error", 
                                  JOptionPane.ERROR_MESSAGE);
            }
        }
    }

}
