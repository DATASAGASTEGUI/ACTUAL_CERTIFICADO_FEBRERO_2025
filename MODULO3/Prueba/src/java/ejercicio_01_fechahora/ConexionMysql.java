package ejercicio_01_fechahora;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionMysql {

    public static Connection obtenerConexion() {
        String url = "jdbc:mysql://127.0.0.1:3307/CITASMEDICA";
        String usuario = "root";
        String clave = "12345678";

        Connection conexion = null;
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ConexionMysql.class.getName()).log(Level.SEVERE, null, ex);
            }
            conexion = DriverManager.getConnection(url, usuario, clave);
            if (conexion != null) {
                System.out.println("OK: CONEXION");
            } else {
                System.out.println("ERROR: CONEXION");
            }
        } catch (SQLException e) {
            System.out.println("ERROR: CONEXION " + e.getMessage());
        }
        return conexion;
    }
}
