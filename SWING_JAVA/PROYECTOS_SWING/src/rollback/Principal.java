package rollback;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Principal {

    public static void main(String[] args) {
        cargarComboBoxOrigen();
    }

    public static Connection obtenerConexionMySql() {
        String url = "jdbc:mysql://localhost:3307/BANCO";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
        }
        return conexion;
    }

    public static void cargarComboBoxOrigen() {
        Connection conexion = obtenerConexionMySql();
        if (conexion != null) {
            JOptionPane.showMessageDialog(null, "OK: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
            String query = "SELECT id,nombre,saldo FROM Cuenta";
            try {
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nombre = rs.getString("nombre");
                    //double saldo = rs.getDouble(3);
                    System.out.println(id);
                    String cadena = id + " - " + nombre;
                    //cboOrigen.addItem("hola");

                }
                System.out.println("salio");
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "ERROR: QUERY " + e.getMessage(), "Mensaje", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(null, "ERROR: CONEXION", "Mensaje", JOptionPane.ERROR_MESSAGE);
        }
    }

}
