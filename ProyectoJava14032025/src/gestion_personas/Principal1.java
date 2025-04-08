package gestion_personas;
import java.sql.Connection;
import java.util.List;
public class Principal1 {

    public static void main(String[] args) {
         Connection conexion = Conexion.getConexion();
         Crud crud = new Crud(conexion);
         List<Personas> personas_al = crud.select();
         
         
         personas_al.forEach(x -> System.out.println(x));
         
         for(Personas p: personas_al) {
            System.out.println(p);
         }
         
    }
    
}
