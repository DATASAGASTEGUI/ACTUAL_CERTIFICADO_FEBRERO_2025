package ejemplo_mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMysql {

    public static Connection obtenerConexion() throws ClassNotFoundException {
        String url = "jdbc:mysql://127.0.0.1:3307/campusfp1";
        String usuario = "root";
        String clave = "12345678";

        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
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
