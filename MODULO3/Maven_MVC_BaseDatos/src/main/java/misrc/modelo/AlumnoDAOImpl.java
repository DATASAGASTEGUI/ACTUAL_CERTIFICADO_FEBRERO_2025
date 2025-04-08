package misrc.modelo;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AlumnoDAOImpl implements AlumnoDAO {

    @Override
    public List<Alumno> obtenerTodosAlumnos(Connection conexion) {
        List<Alumno> alumnos = new ArrayList<>();
        String query = "SELECT * FROM Alumno";
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String direccion = rs.getString("direccion");
                double estatura = rs.getDouble("estatura");
                Alumno alumno = new Alumno(id,nombre,direccion,estatura);
                alumnos.add(alumno);
            }
        }catch(SQLException e) {
            alumnos = null;
        }
        return alumnos;       
    }
}
