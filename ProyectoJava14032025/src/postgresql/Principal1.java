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
        
        String query = "SELECT nombre, detalles FROM Producto";
                    

        
        try {
             conexion = DriverManager.getConnection(url, usuario, clave);
             if(conexion != null) {
                System.out.println("OK: CONEXION");
                
                PreparedStatement ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                    String nombre = rs.getString(1);
                    String detalles = (String)rs.getString(2).toString();
                    System.out.println(nombre + "\t" + detalles);
                }
                
             }else {
                System.out.println("ERROR: CONEXION"); 
             }
        }catch(SQLException e) {
           System.out.println("ERROR: CONEXION " + e.getMessage());
        }
    }
    
}
