package modelo;

import java.sql.Connection;
import java.util.List;

public interface AlumnoDAO {
    public List<Alumno> obtenerListaAlumnos(Connection conexion);
}
