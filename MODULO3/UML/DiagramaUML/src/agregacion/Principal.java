package agregacion;

import java.util.ArrayList;
import java.util.List;

public class Principal {

    public static void main(String[] args) {
        Estudiante luis = new Estudiante("E1","Luis");
        Estudiante carlos = new Estudiante("E2","Carlos");
        List<Estudiante> estudiantes_upao = new ArrayList<>();
        estudiantes_upao.add(luis);
        estudiantes_upao.add(carlos);
        
        Universidad upao = new Universidad("U1","UPAO",estudiantes_upao);
        
        
    }
    
}
