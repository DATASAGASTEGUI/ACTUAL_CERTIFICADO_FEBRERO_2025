package modelo;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AlumnoDAOImpl implements AlumnoDAO {

    @Override
    public List<Alumno> obtenerListaAlumnos(Connection conexion) {
        List<Alumno> alumnos = new ArrayList<>();
        String query = "SELECT * FROM Alumno";
        try {
             PreparedStatement ps = conexion.prepareStatement(query);
             ResultSet rs = ps.executeQuery(query);
             while(rs.next()) {
                 alumnos.add(new Alumno(rs.getInt("idAlumno"), 
                                        rs.getString("nombre")));
             }
        }catch(SQLException e) {
            alumnos = null;
        }
        return alumnos;
    }
    
}
