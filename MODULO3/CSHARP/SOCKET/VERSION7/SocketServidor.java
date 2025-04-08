import java.io.*;
import java.net.*;

public class SocketServidor {
    public static void main(String args[]) throws Exception {
            String mensajeESC = "<SERVIDOR> Hola cliente";//Mensaje que envia el servidor al cliente
            
            ServerSocket servidor = new ServerSocket (8765);//Crea el socket servidor
            
            System.out.println("<<< SOY SERVIDOR >>>");
            
            Socket cliente = servidor.accept();//Espera que un cliente se conecte
            
			InputStream is = cliente.getInputStream();
			ObjectInputStream in = new ObjectInputStream(is);
			Usuario rs = (Usuario) in.readObject();
			
			if(rs.getLogin().equals("walter") && rs.getPassword().equals("1234")) {
			  System.out.println("CLIENTE CORRECTO");
			  System.out.println("LOGIN = "+rs.getLogin());
			  System.out.println("PASSWROD = "+rs.getPassword());
			}
			else System.out.println("CLIENTE INCORRECTO");
			
      		System.out.print("PRESIONE UNA TECLA PARA TERMINAR...");
 	    	String s = Entrada.readStr();
			
			cliente.close();          
            servidor.close();
     }
}
