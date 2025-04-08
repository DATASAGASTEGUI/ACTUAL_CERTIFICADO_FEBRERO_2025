package mibat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Principal {
    public static void main(String[] args) {
        // Ruta del archivo batch a ejecutar
        String rutaBatch = "C:\\CERTIFICADO_27022025_MODULO1\\A.bat";
        
        try {
            // Crear el proceso para ejecutar el archivo batch
            ProcessBuilder processBuilder = new ProcessBuilder(rutaBatch);
            
            // Opcional: Redirigir los flujos de error y salida
            processBuilder.redirectErrorStream(true);
            
            // Iniciar el proceso
            Process proceso = processBuilder.start();
            
            // Leer la salida del proceso (opcional)
            BufferedReader reader = new BufferedReader(
                new InputStreamReader(proceso.getInputStream()));
            
            String linea;
            while ((linea = reader.readLine()) != null) {
                System.out.println(linea);
            }
            
            // Esperar a que el proceso termine
            int exitCode = proceso.waitFor();
            System.out.println("El proceso terminó con código: " + exitCode);
            
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
