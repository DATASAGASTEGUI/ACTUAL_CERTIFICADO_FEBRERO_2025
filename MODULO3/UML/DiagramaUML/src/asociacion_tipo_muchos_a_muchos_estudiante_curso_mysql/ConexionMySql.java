package asociacion_tipo_muchos_a_muchos_estudiante_curso_mysql;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class ConexionMySql {
    
    public static Connection getConexion() {
        String url = "jdbc:mysql://localhost:3307/gestion_matriculas";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url, usuario,clave);
        }catch(SQLException e) {
            conexion = null;
        }
        return conexion;
    }
    
}
