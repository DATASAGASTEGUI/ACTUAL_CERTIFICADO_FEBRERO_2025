package gestion_personas;

import javax.swing.JOptionPane;
import java.sql.Connection;

public class Login {

    public static void main(String[] args) {
        Connection conexion = Conexion.getConexion();
        Crud crud = new Crud(conexion);
        int contador = 0;
        String cambio = "";

        while (true) {
            String login = JOptionPane.showInputDialog("Ingrese su Login? ");
            String clave = JOptionPane.showInputDialog("Ingrese su Clave? ");
            
            if (crud.validarUsuario(login, clave)) {
                if (login.equals("arturo")) {
                    //cambio = login;
                    
                    //boolean agregar, boolean eliminar, boolean editar,
                    //boolean cargar, boolean limpiar, boolean salir
                    new VentanaGestionPersonas(true, false, true, true, true, true).setVisible(true);
                }

                if (login.equals("lucho")) {
                    new VentanaGestionPersonas(false, true, false, true, true, true).setVisible(true);
                }
            } else {
                JOptionPane.showMessageDialog(null, "Credenciales Incorrectas.", "Advertencia",
                        JOptionPane.WARNING_MESSAGE);
                contador++;
                if(contador == 3) {
                   break;
                }
                
            }

        }

    }

}
