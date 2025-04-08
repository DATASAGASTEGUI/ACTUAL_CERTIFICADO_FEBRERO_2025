package misrc.modelo;

import java.sql.Connection;
import java.util.List;

public interface AlumnoDAO {
    public List<Alumno> obtenerTodosAlumnos(Connection conexion); 
}
