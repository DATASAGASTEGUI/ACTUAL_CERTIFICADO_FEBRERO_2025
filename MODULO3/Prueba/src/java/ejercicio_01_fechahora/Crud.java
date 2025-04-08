package ejercicio_01_fechahora;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Crud {
    public static void insertarCita(String nombre, String fechaHora, Connection conexion) {
        String query = "INSERT INTO RegistroCitas(nombre, fecha_hora) VALUES(?,?)";
        String formatoNuevo = "";
        try {
             formatoNuevo = modificarFechaHora(fechaHora);
            
             PreparedStatement ps = conexion.prepareStatement(query);
             ps.setString(1, nombre);
             ps.setString(2, formatoNuevo);
             ps.executeUpdate();
             System.out.println("OK INSERT");
        }catch(SQLException e) {
           System.out.println("ERROR INSERT");
        }
    }
    
    public static boolean buscarCita(String fechaHora, Connection conexion) {
        String formatoNuevo = modificarFechaHora(fechaHora);
        String query = "SELECT * FROM RegistroCitas WHERE fecha_hora = ?";
        boolean bandera = false;
        try {
            PreparedStatement ps = conexion.prepareStatement(query);
            ps.setString(1, formatoNuevo);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                bandera = true;
            }else {
                bandera = false;
            }         
            
        }catch(SQLException e) {
            System.out.println();
            
        }
        return bandera;
    }
    
    public static String modificarFechaHora(String fechaHora) {
         String[] parte = fechaHora.split("-");
         String year = parte[0];
         String mes = parte[1];
         String dia = parte[2];
         String[] parte1 = dia.split("T");
         String dia1 = parte1[0];
         String   horaMinutos = parte1[1];
         String[] parte2 = horaMinutos.split(":");
         String formatoNuevo = "";
         if(Integer.parseInt(parte2[1]) < 31) {
            formatoNuevo = year+"-"+mes+"-"+dia1 + "T" + parte2[0] +
                                  ":" + "0";
         }else {
            formatoNuevo = year+"-"+mes+"-"+dia1 + "T" + parte2[0] +
                                  ":" + "30";
         }
         return formatoNuevo;
    }
    
}
