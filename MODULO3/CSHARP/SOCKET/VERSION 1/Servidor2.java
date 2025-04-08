import java.io.*;
import java.net.*;

public class Servidor2 {
    public static void main(String args[]) throws Exception {
            String mensajeESC = "<SERVIDOR> Hola cliente como estas que haces";//Mensaje que envia el servidor al cliente
            
            ServerSocket servidor = new ServerSocket (8765);//Crea el socket servidor
            
            System.out.println("<<< SOY SERVIDOR >>>");
            
            Socket cliente = servidor.accept();//Espera que un cliente se conecte
            
            PrintWriter out = new PrintWriter(cliente.getOutputStream());
            out.println(mensajeESC);
            out.flush();
            
            servidor.close( );
     }
}
