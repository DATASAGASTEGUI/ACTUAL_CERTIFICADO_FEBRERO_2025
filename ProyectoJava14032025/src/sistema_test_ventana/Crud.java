package sistema_test_ventana;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class Crud {
    
    private Connection conexion;

    public Crud(Connection conexion) {
        this.conexion = conexion;
    }
    
    public List<Pregunta> obtenerTodasPreguntas() {
        List<Pregunta> preguntas = new ArrayList<>();
        String query1 = "SELECT * FROM Preguntas";
        String query2 = "SELECT * FROM Opciones WHERE id_pregunta = ?";
        PreparedStatement ps1, ps2;
        ResultSet rs1, rs2;
        try {
            ps1 = conexion.prepareStatement(query1);
            rs1 = ps1.executeQuery(); 
            while(rs1.next()) {
                int idPregunta = rs1.getInt("id_pregunta");
                String textoPregunta = rs1.getString("texto_pregunta");
                int respuestaCorrecta = rs1.getInt("respuesta_correcta");
                String[] opciones = new String[4];
                
                ps2 = conexion.prepareStatement(query2);
                ps2.setInt(1,idPregunta);
                rs2 = ps2.executeQuery();
                int i = 0;
                while(rs2.next()) {
                    String textoOpcion = rs2.getString("texto_opcion");
                    opciones[i++] = textoOpcion;
                    System.out.println(textoOpcion);
                }
                Pregunta p = new Pregunta(idPregunta, textoPregunta, respuestaCorrecta, opciones);
                preguntas.add(p);
            }
        }catch(SQLException e) {
            System.out.println(e.getMessage()); 
        }
        return preguntas;
    }
    
    public List<Pregunta> obtenerTodasPreguntasAleatorias(Set<Integer> idspreguntas) {
        List<Pregunta> preguntas = new ArrayList<>();
        String query1 = "SELECT * FROM Preguntas WHERE id_pregunta = ?";
        String query2 = "SELECT * FROM Opciones WHERE id_pregunta = ?";
        PreparedStatement ps1, ps2;
        ResultSet rs1, rs2;
        for(Integer x : idspreguntas) {
            try {
                ps1 = conexion.prepareStatement(query1);
                ps1.setInt(1, x);
                rs1 = ps1.executeQuery();
                while(rs1.next()) {
                    int idPregunta = rs1.getInt("id_pregunta");
                    String textoPregunta = rs1.getString("texto_pregunta");
                    int respuestaCorrecta = rs1.getInt("respuesta_correcta");
                    String[] opciones = new String[4];

                    ps2 = conexion.prepareStatement(query2);
                    ps2.setInt(1,idPregunta);
                    rs2 = ps2.executeQuery();
                    int i = 0;
                    while(rs2.next()) {
                        String textoOpcion = rs2.getString("texto_opcion");
                        opciones[i++] = textoOpcion;
                        System.out.println(textoOpcion);
                    }
                    Pregunta p = new Pregunta(idPregunta, textoPregunta, respuestaCorrecta, opciones);
                    preguntas.add(p);
                }
            }catch(SQLException e) {
                System.out.println(e.getMessage()); 
            }
        }
        return preguntas;
    }    
}
