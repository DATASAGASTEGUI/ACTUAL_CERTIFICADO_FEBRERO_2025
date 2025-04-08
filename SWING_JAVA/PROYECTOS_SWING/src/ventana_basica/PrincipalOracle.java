package ventana_basica;

import java.sql.Connection;

public class PrincipalOracle {

    public static void main(String[] args) {
        Connection conexion = VentanaBaseDatos.obtenerConexionOracle();
        if(conexion != null) {
            System.out.println("OK: CONEXION");
        }else {
            System.out.println("ERROR: CONEXION"); 
        }
    }
    
}
