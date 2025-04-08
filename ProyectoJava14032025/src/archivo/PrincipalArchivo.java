package archivo;

import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;

public class PrincipalArchivo {

    public static void main(String[] args) {
       File f;
       FileReader fr;
       BufferedReader br;
       
       String linea;
       
       try {
           f = new File("C:\\Users\\Curso Tarde\\Documents\\datos.txt");
           if(f.exists()) {
              fr = new FileReader(f);
              br = new BufferedReader(fr);
              while((linea = br.readLine()) != null) {
                  System.out.println(linea);
              }
           }
/*
           if(f.delete()) {
              System.out.println("Arhivo Borrado");
           }else {
              System.out.println("Archivo no se pudo borrar");
           }
*/
       }catch(Exception e) {
           System.out.println(e.getMessage());
       }
    }
}
