package mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PrincipalMenu {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String opcion;
        Connection conexion = null;
        while (true) {
            System.out.println("MENU");
            System.out.println("----");
            System.out.println("[1] Comprobar conexion database");
            System.out.println("[2] Mostrar las base de datos en el servidor(mysql)");
            System.out.println("[3] Salir");

            System.out.print("Ingresar opción? ");
            opcion = sc.next();

            switch (opcion) {
                case "1":
                    String url = "jdbc:mysql://localhost:3307/cliente_pedido_1_N";//protocolo,ip,puerto  127.0.0.1
                    String usuario = "root";
                    String clave = "12345678";
                    
                    try {
                        conexion = DriverManager.getConnection(url, usuario, clave);
                        if (conexion != null) {
                            System.out.println("OK: CONEXION");
                        } else {
                            System.out.println("ERROR: CONEXION");
                        }
                    } catch (SQLException e) {
                        System.out.println("ERROR" + e.getMessage());
                    }
                    break;
                case "2": 
                    String query = "describe cliente";
                    try {
                        PreparedStatement ps = conexion.prepareStatement(query);
                        ResultSet r = ps.executeQuery();
                        while(r.next()) {
                            String field = r.getString("Field");
                            String type = r.getString("Type");
                            System.out.println(field + "\t" + type);
                            
                        }
                        
                        
                        
                        
                        
                    }catch(SQLException e) {
                        System.out.println("Error");
                    }
                    
                    break;
                case "3": System.exit(0);
            }
        }
    }

}

