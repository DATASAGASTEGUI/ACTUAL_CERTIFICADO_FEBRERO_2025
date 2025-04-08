package modelo;

import java.sql.Connection;
import java.util.List;


public interface ConsultaDAO {
    public List<String> obtenerNombresMedicos(Connection conexion);
    public List<Consulta> obtenerCantidadConsultasPorMedico(Connection conexion);
    public List<Consulta> obtenerTodasConsultasDeUnMedico(Connection conexion, String nombreMedico);
    public List<Consulta> obtenerTodasConsultasDeUnaProcedencia(Connection conexion, String procedencia);
}
