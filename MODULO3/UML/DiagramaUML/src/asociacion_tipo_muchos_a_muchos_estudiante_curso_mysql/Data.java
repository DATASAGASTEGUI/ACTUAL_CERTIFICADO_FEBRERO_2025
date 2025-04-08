package asociacion_tipo_muchos_a_muchos_estudiante_curso_mysql;

import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Data {
    
    private Connection conexion;

    public Data(Connection conexion) {
        this.conexion = conexion;
    }
    
    

    public void getEstudiantesCursosInscripciones(List<Estudiante> estudiantes, List<Curso> cursos, List<Inscripcion> inscripciones) {
        estudiantes.clear();
        cursos.clear();
        inscripciones.clear();
        
        cargarListaEstudiantes(estudiantes);
        cargarListaCursos(cursos);
        cargarListaInscripciones(inscripciones, estudiantes, cursos);

    }
    
    // READ
    public void cargarListaEstudiantes(List<Estudiante> estudiantes) {
        String query = "SELECT * FROM estudiantes";
        try {
             PreparedStatement ps = conexion.prepareStatement(query);
             ResultSet rs = ps.executeQuery();
             while(rs.next()) {
                 Estudiante estudiante = new Estudiante(
                          rs.getString("id_estudiante"), //1
                          rs.getString("nombre") //2
                 );
                 estudiantes.add(estudiante);
             }
            
        }catch(SQLException e) {
            System.out.println("Error: Query Select Estudiantes");
            //Principal.pause();
        }
    }
    
    // READ
    public void cargarListaCursos(List<Curso> cursos) {
        String query = "SELECT * FROM cursos";
        try {
             PreparedStatement ps = conexion.prepareStatement(query);
             ResultSet rs = ps.executeQuery();
             while(rs.next()) {
                 Curso curso = new Curso(
                          rs.getString("id_curso"), //1
                          rs.getString("nombre") //2
                 );
                 cursos.add(curso);
             }
            
        }catch(SQLException e) {
            System.out.println("Error: Query Select Cursos");
            //Principal.pause();
        }
    }  
    
    // READ
    public void cargarListaInscripciones(List<Inscripcion> inscripciones, List<Estudiante> estudiantes, List<Curso> cursos) {
        String query = "SELECT * FROM inscripciones";
        try {
             PreparedStatement ps = conexion.prepareStatement(query);
             ResultSet rs = ps.executeQuery();
             while(rs.next()) {
                 String idEstudiante = rs.getString("id_estudiante");
                 String idCurso = rs.getString("id_curso");
                 GestionMatricula gm = new GestionMatricula(estudiantes, cursos);
                 
                 Estudiante estudiante = gm.buscarObjetoEstudiante(idEstudiante);
                 Curso curso = gm.buscarObjetoCurso(idCurso);
                 
                 
                 Inscripcion inscripcion = new Inscripcion(
                          estudiante, curso, rs.getDate("fecha_inscripcion").toString()
                          
                 );
                 inscripciones.add(inscripcion);
             }
            
        }catch(SQLException e) {
            System.out.println("Error: Query Select Cursos");
            //Principal.pause();
        }
    }
    
    // CREATE
    public void insertarInscripcion(String idEstudiante, String idCurso, String fechaInscripcion) throws ParseException {
        String query = "INSERT INTO Inscripciones(id_estudiante, id_curso, fecha_inscripcion) VALUES (?,?,?)";
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date dateutil = formato.parse(fechaInscripcion);
        java.sql.Date datesql = new java.sql.Date(dateutil.getTime());
        try {
              PreparedStatement ps = conexion.prepareStatement(query);
              ps.setString(1, idEstudiante);
              ps.setString(2, idCurso);
              ps.setDate(3, datesql);
              ps.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Error: Quere Insert Inscripcion");
        }
    }
    
    // UPDATE
    public void actualizarNombreEstudiante(String idEstudiante, String nombreNuevo) {
        String query = "UPDATE estudiantes SET nombre = ? WHERE id_estudiante = ?";
        try {
              PreparedStatement ps = conexion.prepareStatement(query);
              ps.setString(1, nombreNuevo);
              ps.setString(2, idEstudiante);
              ps.executeUpdate();
        }catch(SQLException e) {
            System.out.println("Error: Query Update Estudiantes");
        }
    }

    // DELETE
    public void eliminarEstudiante(String idEstudiante) {
        String query = "DELETE FROM estudiantes WHERE id_estudiante = ?";
        try {
              //conexion.setAutoCommit(false);
              PreparedStatement ps = conexion.prepareStatement(query);
              ps.setString(1, idEstudiante);
              ps.executeUpdate();
              //conexion.commit();
        }catch(SQLException e) {
            System.out.println("Error: Query Delete Estudiantes" + e.getMessage());
        }
    }    

}
