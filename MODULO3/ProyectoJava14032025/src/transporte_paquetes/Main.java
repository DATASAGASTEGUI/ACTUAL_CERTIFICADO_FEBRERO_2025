package transporte_paquetes;

import java.sql.Connection;

public class Main {

    public static void main(String[] args) {
        Conexion objeto = new Conexion("TRANSPORTE_PAQUETES");
        Connection conexion = objeto.getConexion();
        if(conexion != null) {
           Consultas consultas = new Consultas(conexion);
           //consultas.mostrarCantidadPaquetesPorProvincia();
           //consultas.mostrarCantidadPaquetesDeUnaProvinciaCualquier("Sevilla");
           consultas.mostrarFechaCondujoCamion();
        }else {
           System.out.println("Error: Conexion");
        }
    }
}
