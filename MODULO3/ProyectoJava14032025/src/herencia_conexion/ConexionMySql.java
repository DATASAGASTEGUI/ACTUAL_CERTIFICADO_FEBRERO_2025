package herencia_conexion;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class ConexionMySql implements Conexion {
    // CONSTANTES
    private static final String PROTOCOLO = "jdbc:mysql";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String SERVERNAME = "localhost";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "12345678";
    private static final int  PUERTO = 3307;
   
    // VARIABLES DE INSTANCIA
    private Connection conexion;
    private String database;

    public ConexionMySql(String database) {
       this.database = database;
       this.setConexion(database);
    }
    
    
    

    @Override
    public Connection getConexion() {
        return this.conexion;
    }

    @Override
    public void setConexion(String database) {
       String url = PROTOCOLO + "://" + 
                    SERVERNAME + ":" + PUERTO + "/" + database; 
       try {
           conexion = DriverManager.getConnection(url, USERNAME, PASSWORD);
       }catch(SQLException e) {
           conexion = null;
       }
    }
}
