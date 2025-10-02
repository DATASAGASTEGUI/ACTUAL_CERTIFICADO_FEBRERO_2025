package mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Principal {

    public static void main(String[] args) {
       String url = "jdbc:mysql://localhost:3307/cliente_pedido_1_n";   //protocolo,ip,puerto  127.0.0.1
       String usuario = "root";
       String clave = "12345678";
       Connection conexion;
       try {
         conexion = DriverManager.getConnection(url,usuario,clave);
         if(conexion != null) {
            System.out.println("OK: CONEXION");
            
            
            
            
            
            
            
            
         }else {
            System.out.println("ERROR: CONEXION"); 
         }
       }catch(SQLException e) {
         System.out.println("ERROR" + e.getMessage());
       }    
       
    }
    
}
