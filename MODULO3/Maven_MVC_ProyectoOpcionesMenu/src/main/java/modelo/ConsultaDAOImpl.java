package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConsultaDAOImpl implements ConsultaDAO {

    @Override
    public List<String> obtenerNombresMedicos(Connection conexion) {
        List<String> medicos = new ArrayList<>();
        String query = "SELECT DISTINCT nombreMedico FROM Consulta ORDER BY nombreMedico";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                medicos.add(rs.getString("nombreMedico"));
                System.out.println(rs.getString(1));
            }
        } catch (SQLException e) {
            medicos = null;
        }
        return medicos;
    }

    @Override
    public List<Consulta> obtenerCantidadConsultasPorMedico(Connection conexion) {
        List<Consulta> consultaspormedico = new ArrayList<>();
        String query = "SELECT nombreMedico, COUNT(*) AS Cantidad \n"
                + "FROM Consulta\n"
                + "GROUP BY nombreMedico\n"
                + "ORDER BY nombreMedico;";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                consultaspormedico.add(new Consulta(rs.getString("nombreMedico"),
                        rs.getInt("Cantidad")
                ));
            }
        } catch (SQLException e) {
            consultaspormedico = null;
        }
        return consultaspormedico;
    }

    @Override
    public List<Consulta> obtenerTodasConsultasDeUnMedico(Connection conexion, String nombreMedico) {
        List<Consulta> consultasdeunmedico = new ArrayList<>();
        String query = "SELECT * FROM Consulta WHERE nombreMedico = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, nombreMedico);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                consultasdeunmedico.add(new Consulta(rs.getString("numeroConsulta"),
                        rs.getString("fecha"),
                        rs.getString("nombreMedico"),
                        rs.getString("deinpr"),
                        rs.getString("procedencia")
                ));
            }
        } catch (SQLException e) {
            consultasdeunmedico = null;
        }
        return consultasdeunmedico;
    }

    @Override
    public List<Consulta> obtenerTodasConsultasDeUnaProcedencia(Connection conexion, String procedencia) {
        List<Consulta> consultasdeunaprocedencia = new ArrayList<>();
        String query = "SELECT * FROM Consulta WHERE procedencia = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, procedencia);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                consultasdeunaprocedencia.add(new Consulta(rs.getString("numeroConsulta"),
                        rs.getString("fecha"),
                        rs.getString("nombreMedico"),
                        rs.getString("deinpr"),
                        rs.getString("procedencia")
                ));
            }
        } catch (SQLException e) {
            consultasdeunaprocedencia = null;
        }
        return consultasdeunaprocedencia;
    }

}
