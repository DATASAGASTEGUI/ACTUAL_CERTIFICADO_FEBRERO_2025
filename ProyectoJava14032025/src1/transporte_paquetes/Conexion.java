package transporte_paquetes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    // ATRIBUTOS DE LA CLASE
    // 1. ENTRADA
    private String database;
    
    // 2. SALIDA
    private Connection conexion;

    // CONSTRUCTOR
    public Conexion(String database) {
        this.database = database;
    }
    
    // METODOS SET Y GET

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database;
    }
    
    public Connection getConexion() {
        String url = "jdbc:mysql://localhost:3307/" + this.database;
        String usuario = "root";
        String clave = "12345678";
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException ex) {
            conexion = null;
        }
        return conexion;
    }
}
