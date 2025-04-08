package cadenas;

import java.util.Arrays;
import java.util.Date;

public class Principal1 {

    public static void main(String[] args) {
        String texto = "En un puerto";
        
        for(int i=0; i<texto.length(); i++) {
            System.out.println(texto.charAt(i));
        }
        
        System.out.println("Hola Mundo".charAt(0));
        
        String[] registros = {
            "A1;Lapiz;2.3;3     ",
            "A2;Cuaderno;1.2   ;4   "
        };
        
        //Formatos Archivos Texto: csv, xml, json
        
        double total = sumarPrecios(registros);
        System.out.println("Total: " + total);
        
        int totalCantidad = sumarCantidad(registros);
        System.out.println("Total: " + totalCantidad);
        
        String fecha = new Date().toString();
        String[] partes = fecha.split(" ");//Thu Apr 10 19:16:55 CEST 2025
        System.out.println(partes[3]);
        System.out.println("Hora   : " + partes[3].substring(0,2));
        System.out.println("Minutos: " + partes[3].substring(3,5));
        
        char[] vectorletras = partes[1].toCharArray();
        System.out.println(Arrays.toString(vectorletras));
        
        String hora = partes[3].substring(0,2);
        String minutos = partes[3].substring(3,5);
        String segundos = partes[3].substring(6,8);
        String mihora = hora.concat("-").
                        concat(minutos).
                        concat("-").
                        concat(segundos);
        String mihora1 = hora + "-" + minutos + "-" + segundos;
        String mihora2 = String.format("%s%s%s%s%s", hora,"-",minutos,"-",segundos);
        System.out.println(mihora);
    }
    
    public static double sumarPrecios(String[] registros) {
       double s = 0;
       for(int i=0; i<registros.length; i++) {
           String registro = registros[i];
           String vector[] = registro.split(";");//{"A1","Lapiz","2.3","3    "}
           s = s + Double.parseDouble(vector[2]);
       }
       return s; 
    }
    
    public static int sumarCantidad(String[] registros) {
       int s = 0;
       for(int i=0; i<registros.length; i++) {
           String registro = registros[i];
           String vector[] = registro.split(";");//{"A1","Lapiz","2.3","3"}
           s = s + Integer.parseInt(vector[3].trim());
       }
       return s;  
        
    }
  
}
