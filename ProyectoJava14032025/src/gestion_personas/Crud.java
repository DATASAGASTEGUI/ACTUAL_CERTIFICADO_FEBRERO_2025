package gestion_personas;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.swing.JOptionPane;

public class Crud { //Create(Insert) Read(Select) Update, Delete
   // CONSTANTES
   public static final int INSERT_SI = 1;
   public static final int INSERT_NO = 0;
   public static final int INSERT_ERROR = -1;
   
   public static final int DELETE_SI = 1;
   public static final int DELETE_NO = 0;
   public static final int DELETE_ERROR = -1;
   
   public static final int UPDATE_SI = 1;
   public static final int UPDATE_NO = 0;
   public static final int UPDATE_ERROR = -1; 
   
   // VARIABLES DE INSTANCIA
   Connection conexion;
   // CONSTRUCTOR
   public Crud(Connection conexion) {
      this.conexion = conexion; 
   } 
   // METODOS
   
   public List<Personas> select() {
       String query = "SELECT * FROM Personas";
       List<Personas> personas_al = new ArrayList<Personas>();
       
       try {
           PreparedStatement ps = this.conexion.prepareStatement(query);
           ResultSet rs = ps.executeQuery();
           while(rs.next()) {
              int id = rs.getInt("id");
              String nombre = rs.getString("nombre");
              String apellido = rs.getString("apellido");
              int edad = rs.getInt("edad");
              Timestamp fechaRegistro = rs.getTimestamp("fecha_registro");
              
              Personas p = new Personas(id,nombre,apellido,edad,fechaRegistro);
              personas_al.add(p);
           }
       }catch(SQLException e) {
           personas_al = null;
       }
       return personas_al;
   }
   
   public int insert(Personas persona) {
       String query = "INSERT INTO Personas(nombre,apellido,edad) VALUES(?,?,?)";
       try {
           PreparedStatement ps = conexion.prepareStatement(query);
           ps.setString(1, persona.getNombre());
           ps.setString(2, persona.getApellido());
           ps.setInt(3, persona.getEdad());
           int filaAfectadas = ps.executeUpdate();
           return filaAfectadas == 1 ? INSERT_SI : INSERT_NO; //1 0
       }catch(SQLException e) {
           return INSERT_ERROR; //-1
       }
   }
   
   public int delete(int id) {
       String query = "DELETE FROM Personas WHERE id = ?";
       try {
           PreparedStatement ps = conexion.prepareStatement(query);
           ps.setInt(1, id);
           int filaAfectadas = ps.executeUpdate();
           return filaAfectadas == 1 ? DELETE_SI : DELETE_NO; //1 0
       }catch(SQLException e) {
           return DELETE_ERROR; //-1
       }
   }
   
   public int update(Personas persona) {
       String query = "UPDATE Personas SET nombre = ?, apellido = ?, edad = ? WHERE id = ?";
       try {
           PreparedStatement ps = conexion.prepareStatement(query);
           ps.setString(1, persona.getNombre());
           ps.setString(2, persona.getApellido());
           ps.setInt(3, persona.getEdad());
           ps.setInt(4, persona.getId());
           int filaAfectada = ps.executeUpdate();
           return filaAfectada == 1 ? UPDATE_SI : UPDATE_NO; //1  0
       }catch(SQLException e) {
           return UPDATE_ERROR; //-1
       }
   }
   
   public boolean validarUsuario(String login, String clave) {
       String query = "SELECT * FROM USUARIOS WHERE login = ? AND clave = ?";
       boolean valido = false;
       try {
           PreparedStatement ps = conexion.prepareStatement(query);
           ps.setString(1, login);
           ps.setString(2, clave);
           ResultSet rs = ps.executeQuery();
           /*
           if(rs.next()) {
              if(login.equals(rs.getString("login")) && clave.equals(rs.getString("clave"))) {
                 valido = true;
              }
           }
           */
           
           if(rs.next()) {
              valido = true;
           }

       }catch(SQLException e) {
	   JOptionPane.showMessageDialog(null, "Se produjo un error grave en la query select", "Error", 
           JOptionPane.ERROR_MESSAGE);
       }
       return valido;
   }
   

}
