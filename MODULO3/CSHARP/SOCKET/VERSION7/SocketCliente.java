import  java.net.*;
import  java.io.*;

class SocketCliente {
    public static void main(String args[]) throws Exception {
       
        Socket  cliente = new Socket("127.0.0.1", 8765);
        System.out.println("<<< SOY CLIENTE >>>");

        OutputStream os = cliente.getOutputStream();
		ObjectOutputStream out = new ObjectOutputStream(os);
		Usuario ps = new Usuario("walter","1234");
		out.writeObject(ps);
		
		System.out.print("PRESIONE UNA TECLA PARA TERMINAR...");
		String s = Entrada.readStr();
        
        cliente.close( );
    }
}
