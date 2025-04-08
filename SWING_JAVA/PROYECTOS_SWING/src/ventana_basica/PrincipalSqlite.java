package ventana_basica;

import java.sql.*;

public class PrincipalSqlite {

    public static void main(String[] args) {
        Connection conexion = obtenerConexionSqLite();
	if(conexion != null) {
	   System.out.println("OK: CONEXION");
           String query = "SELECT numeroConsulta, nombreMedico FROM Consulta";
           try {
               PreparedStatement ps = conexion.prepareStatement(query);
               ResultSet rs = ps.executeQuery();
               while(rs.next()) {
                   int nc = rs.getInt(1);
                   String nm = rs.getString(2);
                   System.out.println(nc + "\t" + nm);
               }
           }catch(SQLException e) {
           }
	}else {
	   System.out.println("ERROR: CONEXION");
	}
    }
    
    public static Connection obtenerConexionSqLite() {
        String url = "jdbc:sqlite:C:/CERTIFICADO_27022025_MODULO1/BASE_DATOS/SQLITE/hospital.sqlite";
        String usuario = "";
        String clave = "";
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
            //System.out.println("Error: Conexion");
        }
        return conexion;
    }
	
	
    
}
