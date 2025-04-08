package ejemplo05;

import java.sql.Connection;
import java.util.List;

public class Main1 {

    public static void main(String[] args) {
        Conexion1 c = new Conexion1(true, "salud");
        Connection conexion = c.getConexion();
        OperacionesCrud ocrud = new OperacionesCrud(conexion);
        Ventana v = new Ventana("Salida");
        v.setVisible(true);
        List<Consulta> consultas_al = ocrud.obtenerTodasLasConsultas();
        if (consultas_al != null) {
            for (int i = 0; i < consultas_al.size(); i++) {
                Consulta consulta = consultas_al.get(i);
                v.escribir(consulta.toString());
                //System.out.println(consulta);
            }
        } else {
            System.out.println("Error: ArrayLista de consultas vacio");
        }
    }

}


