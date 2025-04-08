import java.net.*;
import java.io.*;
/*La clase EchoClient, la cual realiza la petición de conexión con el servidor.*/
public class EchoClient {

	Socket          cliente;
	DataInputStream in;
	PrintWriter     out;
	String          mensajeECS;
	String          mensajeRCS;

	EchoClient(String puerto) {
		try {
			cliente = new Socket("localhost",Integer.valueOf(puerto).intValue());
		    in      = new DataInputStream(cliente.getInputStream());
		    out     = new PrintWriter(cliente.getOutputStream(),true);

		    boolean finalizar = false;
		
		    try {   
			   while(!finalizar) {
				  mensajeECS = Entrada.readStr();out.println(mensajeECS);
			      mensajeRCS = in.readLine();System.out.println(mensajeRCS);
			      if(mensajeECS.equals("final")) finalizar = true;
			   }
		    }catch(Exception e) {System.out.println("Error! "+e.toString());}

	    }catch(Exception e) {System.out.println("Error! "+e.toString());}

	    try {
	  	    cliente.close();
	    }catch(Exception e) {System.out.println("Error " + e.toString());}
	}

	public static void main(String args[]) {
		/*puerto = args[0] = "8765";*/
		System.out.println("<<< SOY CLIENTE >>>");
		String puerto = "8765";
		EchoClient cliente = new EchoClient(puerto);
	}
}