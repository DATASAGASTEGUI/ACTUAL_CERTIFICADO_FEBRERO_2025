package misrc.modelo;

import java.sql.Connection;
import java.util.List;

public interface ConsultaDAO {
    List<Consulta> obtenerTodosObjetosConsulta(Connection conexion);
}
