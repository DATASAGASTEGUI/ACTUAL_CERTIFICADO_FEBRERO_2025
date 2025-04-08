package gestion_personas;

import java.sql.Connection;
import java.util.List;

public class Principal {

    public static void main(String[] args) {
       Connection conexion = Conexion.getConexion();
       if(conexion != null) {
          System.out.println("OK: CONEXION");
          Crud crud = new Crud(conexion);
          List<Personas> personas_al = crud.select();
          if(personas_al != null) {
            for(Personas p: personas_al) {
                System.out.println(p);
            }
          }else {
            System.out.println("Lista Vacia");
          }
       }else {
          System.out.println("ERROR:CONEXION");
       }
       
       double x = Math.PI * 2;
    }
}
