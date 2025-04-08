package postgresql;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Principal {


    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/tienda";
        String usuario = "postgres";
        String clave = "12345678";
        
        Connection conexion = null;
        
        String query = "SELECT nombre, detalles->>'precio' AS precio " +
                     "FROM Producto " +
                     "WHERE (detalles->>'precio')::int > 1000";

        
        try {
             conexion = DriverManager.getConnection(url, usuario, clave);
             if(conexion != null) {
                System.out.println("OK: CONEXION");
                
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    String nombre = rs.getString(1);
                    String precio = rs.getString(2);
                    System.out.println(nombre + "\t" + precio);
                }
                
             }else {
                System.out.println("ERROR: CONEXION"); 
             }
        }catch(SQLException e) {
           System.out.println("ERROR: CONEXION " + e.getMessage());
        }
    }
    
}
