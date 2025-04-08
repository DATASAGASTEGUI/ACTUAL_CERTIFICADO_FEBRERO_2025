package ventana_basica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PrincipalPostgresql {

    public static void main(String[] args) {
       Connection conexion = obtenerConexionPostgresql();
       if(conexion != null) {
          JOptionPane.showMessageDialog(null, "OK: CONEXION", "Mensaje", JOptionPane.INFORMATION_MESSAGE);   
          String query = "SELECT * FROM PRODUCTO";
          try {
              PreparedStatement ps = conexion.prepareStatement(query);
              ResultSet rs = ps.executeQuery();
              while(rs.next()) {
                  int id = rs.getInt(1);
                  String nombre = rs.getString(2);
                  String detalles = rs.getString(3);
                  System.out.println(id + "\t" + nombre + "\t" + detalles);
              }
          }catch(SQLException e) {
              JOptionPane.showMessageDialog(null, "ERROR: QUERY", "Mensaje", JOptionPane.ERROR_MESSAGE);    
          }
       }else {
          JOptionPane.showMessageDialog(null, "ERROR: CONEXION", "Mensaje", JOptionPane.ERROR_MESSAGE);    
       }
    }
    
    public static Connection obtenerConexionPostgresql() {
        String url = "jdbc:postgresql://localhost:5432/tienda";
        String usuario = "postgres";
        String clave = "12345678";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
        }
        return conexion;
    }
    
}
