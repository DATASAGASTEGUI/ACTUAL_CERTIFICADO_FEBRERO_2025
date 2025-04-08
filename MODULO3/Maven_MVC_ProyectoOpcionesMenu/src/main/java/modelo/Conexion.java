package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    public static Connection obtenerConexionSqlite(String rutaAbsolutaBD) {
        // Obteniendo ruta absoluta desde el ServletContext
        String url = "jdbc:sqlite:" + rutaAbsolutaBD;
        String usuario = "";
        String clave = "";

        Connection conexion = null;
        try {
            Class.forName("org.sqlite.JDBC");
            conexion = DriverManager.getConnection(url);
        } catch (Exception e) {
            conexion = null;
        }
        return conexion;
    }
}
