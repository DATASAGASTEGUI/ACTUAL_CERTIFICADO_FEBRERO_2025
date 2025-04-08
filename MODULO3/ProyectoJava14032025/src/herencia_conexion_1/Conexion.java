package herencia_conexion_1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    // VARIABLES DE INSTANCIA
    private String protocolo;
    private String driver;
    private String serverName;
    private String userName;
    private String password;
    private int puerto;
    private String database;

    private Connection conexion;

    public Conexion() {
    }

    public Conexion(String protocolo, String driver, String serverName, String userName, String password, int puerto, String database) {
        this.protocolo = protocolo;
        this.driver = driver;
        this.serverName = serverName;
        this.userName = userName;
        this.password = password;
        this.puerto = puerto;
        this.database = database;
    }

    // METODOS SET Y GET (OBVIARLOS)
    public Connection getConexion() {
        return conexion;
    }

    public void setConexion() {
       String url = this.protocolo + "://" + 
                    serverName + ":" + puerto + "/" + database; 
       try {
           conexion = DriverManager.getConnection(url, userName, password);
       }catch(SQLException e) {
           conexion = null;
           System.out.println(e.getMessage());
       }
    }

}
