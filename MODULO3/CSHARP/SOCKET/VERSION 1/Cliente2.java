import  java.net.*;
import  java.io.*;

class Cliente2 {
    public static void main(String args[]) throws Exception {
       
        String mensajeRCS = "\0"; //Mensaje que recibe el cliente del servidor
     
        Socket  cliente = new Socket("127.0.0.1", 8765);//Utiliza la direccion de la computadora local (loop-back)
        System.out.println("<<< SOY CLIENTE >>>");

        DataInputStream in = new DataInputStream(cliente.getInputStream());
        mensajeRCS = in.readLine();//Obtener un texto del servidor
        System.out.println(mensajeRCS);//Desplegar el mensaje
        
        cliente.close( );
    }
}
