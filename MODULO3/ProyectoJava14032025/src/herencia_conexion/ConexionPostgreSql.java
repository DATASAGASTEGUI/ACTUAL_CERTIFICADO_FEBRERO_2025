package herencia_conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionPostgreSql implements Conexion {
    // CONSTANTES

    private static final String PROTOCOLO = "jdbc:postgresql";
    private static final String DRIVER = "org.postgresql.Driver";
    private static final String SERVERNAME = "localhost";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "12345678";
    private static final int PUERTO = 5432;

    // VARIABLES DE INSTANCIA
    private Connection conexion;
    private String database;

    public ConexionPostgreSql(String database) {
        this.database = database;
        this.setConexion(database);
    }

    @Override
    public Connection getConexion() {
        return this.conexion;
    }

    @Override
    public void setConexion(String database) {
        String url = PROTOCOLO + "://"
                + SERVERNAME + ":" + PUERTO + "/" + database;
        try {
            conexion = DriverManager.getConnection(url, USERNAME, PASSWORD);
        } catch (SQLException e) {
            conexion = null;
        }
    }

}
