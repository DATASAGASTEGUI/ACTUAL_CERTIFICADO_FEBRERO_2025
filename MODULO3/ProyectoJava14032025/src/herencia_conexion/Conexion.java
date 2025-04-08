package herencia_conexion;

import java.sql.Connection;

public interface Conexion {
    
    public Connection getConexion();
    public void setConexion(String database);
    
}
