package ejemplo_mysql;

import java.util.List;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Crud {
    // READ
    public static List<Alumno> obtenerListaAlumnos(Connection conexion) {
        List<Alumno> alumnos = new ArrayList<>();
        String query = "SELECT * FROM ALUMNO;";
        try {
              PreparedStatement ps = conexion.prepareStatement(query);
              ResultSet rs = ps.executeQuery();
              
              while(rs.next()) {
                  Alumno a = new Alumno(rs.getInt("idAlumno"),
                                        rs.getString("nombre"),
                                        rs.getString("apellidos"),
                                        rs.getString("grupo"),
                                        rs.getDate("fechaNacimiento")
                                        );
                  a.setNombre(rs.getString("nombre"));
                  System.out.println();
                  alumnos.add(a);
              }
              
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        }
        
        return alumnos;
    }
}
