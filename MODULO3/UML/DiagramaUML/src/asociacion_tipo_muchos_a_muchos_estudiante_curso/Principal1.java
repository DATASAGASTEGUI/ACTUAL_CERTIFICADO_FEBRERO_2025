package asociacion_tipo_muchos_a_muchos_estudiante_curso;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author RYZEN
 */
public class Principal1 {

    public static void main(String[] args) {
       Map<String, Estudiante> estudiantes = new HashMap();
       Data.getEstudiantesCursosInscripciones1(estudiantes);
       Estudiante estudiante = estudiantes.get("E1");
       System.out.println(estudiante);
    }
    
}
