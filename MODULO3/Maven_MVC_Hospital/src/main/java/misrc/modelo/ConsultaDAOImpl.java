package misrc.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConsultaDAOImpl implements ConsultaDAO {

    @Override
    public List<Consulta> obtenerTodosObjetosConsulta(Connection conexion) {
        List<Consulta> consultas = new ArrayList<>();
        String query = "SELECT * FROM Consulta";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String numeroConsulta = rs.getString("numeroConsulta");
                String fecha = rs.getString("fecha");
                String nombreMedico = rs.getString("nombreMedico");
                String deinpr = rs.getString("deinpr");
                String procedencia = rs.getString("procedencia");

                Consulta consulta = new Consulta(numeroConsulta, fecha, nombreMedico, deinpr, procedencia);

                consultas.add(consulta);
            }

        } catch (SQLException e) {
            System.out.println("Error: Query Select");
            consultas = null;
        }
        return consultas;
    }

}
