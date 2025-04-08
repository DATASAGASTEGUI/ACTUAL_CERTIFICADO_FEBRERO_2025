package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    public static Connection obtenerConexionMysql() {
        String url = "jdbc:mysql://localhost:3307/CAMPUSFP";
        String usuario = "root";
        String clave = "12345678";  

        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (Exception e) {
            conexion = null;
        }
        return conexion;
    }
}
