package herencia_conexion_1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionPostgreSql extends Conexion {

    public ConexionPostgreSql() {
    }

    public ConexionPostgreSql(String protocolo, String driver, String serverName, String userName, String password, int puerto, String database) {
        super(protocolo, driver, serverName, userName, password, puerto, database);
        this.setConexion();
    }

}
