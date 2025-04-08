package misrc.modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionSqlite {

    public static Connection obtenerConexion() {
        String url = "jdbc:sqlite:C:\\CERTIFICADO_27022025_MODULO1\\MODULO3\\Maven_MVC_BaseDatos\\src\\main\\webapp\\colegio.sqlite3";
        String usuario = "";
        String clave = "";

        Connection conexion = null;
        try {
            Class.forName("org.sqlite.JDBC");
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (Exception e) {
            conexion = null;
        }
        return conexion;
    }
}
