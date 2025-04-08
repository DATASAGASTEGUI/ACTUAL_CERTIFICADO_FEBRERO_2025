package transporte_paquetes;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Date;

public class Consultas {

    // ATRIBUTOS DE LA CLASE
    private Connection conexion;

    // CONSTRUCTOR
    public Consultas(Connection conexion) {
        this.conexion = conexion;
    }

    public void mostrarCantidadPaquetesPorProvincia() {
        String query = "SELECT Paquete.id_provincia, nombre_provincia, COUNT(*) AS numero_paquetes\n"
                + "FROM Paquete\n"
                + "JOIN Provincia ON Paquete.id_provincia = Provincia.id_provincia\n"
                + "GROUP BY Paquete.id_provincia";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id_provincia = rs.getInt(1);
                String nombreProvincia = rs.getString(2);
                int numeroPaquetes = rs.getInt(3);
                System.out.printf("%5d %-10s %5d\n", id_provincia, nombreProvincia, numeroPaquetes);
            }

        } catch (SQLException e) {
            System.out.println("Error: Query Select");
        }
    }

    public void mostrarCantidadPaquetesDeUnaProvinciaCualquier(String provincia) {
        String query = "SELECT Paquete.id_provincia, nombre_provincia, COUNT(*) AS numero_paquetes\n"
                + "FROM Paquete\n"
                + "JOIN Provincia ON Paquete.id_provincia = Provincia.id_provincia\n"
                + "GROUP BY Paquete.id_provincia";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id_provincia = rs.getInt(1);
                String nombreProvincia = rs.getString(2);
                int numeroPaquetes = rs.getInt(3);
                if (nombreProvincia.equalsIgnoreCase(provincia)) {
                    System.out.printf("%5d %-10s %5d\n", id_provincia, nombreProvincia, numeroPaquetes);
                }
            }

        } catch (SQLException e) {
            System.out.println("Error: Query Select");
        }
    }

    public void mostrarFechaCondujoCamion() {
        String query = "SELECT matricula, fecha\n"
                + "FROM Camion_has_Camionero\n"
                + "ORDER BY matricula;";
        
        try {
              PreparedStatement ps = conexion.prepareStatement(query);
              ResultSet rs = ps.executeQuery();
              while(rs.next()) {
                  String matricula = rs.getString(1);
                  Date fecha = rs.getDate(2);
                  
                  System.out.println(matricula + "\t" + fecha.toString());
              }
            
        }catch(SQLException e) {
            
        }

    }

}
