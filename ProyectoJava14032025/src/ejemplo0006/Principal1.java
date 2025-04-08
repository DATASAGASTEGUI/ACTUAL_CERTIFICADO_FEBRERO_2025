package ejemplo0006;

import java.io.BufferedReader;
import java.io.InputStreamReader;


public class Principal1 {
    public static void main(String[] args) {
        String comando = "ipconfig";  // Puedes cambiarlo por otro comando como "tasklist"
        
        try {
            ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c", comando);
            builder.redirectErrorStream(true);  // Captura errores junto con la salida estándar
            Process process = builder.start();

            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println(linea);
            }

            process.waitFor(); // Espera a que el proceso termine
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

