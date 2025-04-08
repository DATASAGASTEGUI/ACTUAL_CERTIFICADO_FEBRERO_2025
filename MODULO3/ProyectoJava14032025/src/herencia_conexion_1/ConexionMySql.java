package herencia_conexion_1;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class ConexionMySql extends Conexion {

    public ConexionMySql() {
    }

    public ConexionMySql(String protocolo, String driver, String serverName, String userName, String password, int puerto, String database) {
        super(protocolo, driver, serverName, userName, password, puerto, database);
        this.setConexion();
    }
   
    
}
