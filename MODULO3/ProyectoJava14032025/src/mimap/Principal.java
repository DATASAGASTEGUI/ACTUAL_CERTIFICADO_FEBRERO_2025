package mimap;

import java.util.HashMap;
import java.util.Map;


public class Principal {


    public static void main(String[] args) {
        Map<String, String> coleccion = new HashMap();
        coleccion.put("one","uno");//clave,valor
        coleccion.put("start","inicio");
        coleccion.put("stop","parar");
        coleccion.put("stop","detener");
        String clave = "stop";
        System.out.print(coleccion.get(clave));
    }
    
}
