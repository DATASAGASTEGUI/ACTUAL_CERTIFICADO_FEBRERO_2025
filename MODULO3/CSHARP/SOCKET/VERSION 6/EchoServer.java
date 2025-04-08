import java.net.*;
import java.io.*;
import java.lang.*;
import java.util.*;

/*
La clase EchoServer utiliza la clase ServerSocket para  crear un servicio,
en este caso la función de eco, y de este modo permanecer a la  escucha de 
un determinado puerto por donde recibir las  peticiones  de  servicio  por
parte de los clientes. 

Una vez recibida una petición, el servidor crea una instancia de la  clase 
BufferedReader y PrintWriter asociadas al Socket que se acaba de abrir con 
la nueva petición. Seguidamente se realiza la operatoria del  servicio  de 
eco hasta que el cliente da por finalizada la sesión. 

Si en el transcurso de la sesión de atención a un  determinado  cliente se 
realizara la petición por parte de otro cliente,  este último  permanecerá 
desatendido hasta que el anterior concluya, momento  en el que el servidor 
pasará de nuevo a escuchar el puerto de peticiones de servicio.
*/



public class EchoServer {
	public static void main(String args[]) {
		/*puerto = args[0] = "8765";*/
		System.out.println("<<< SOY SERVIDOR >>>");
		String puerto = "8765";
		try {
		    ServerSocket servidor = new ServerSocket(Integer.valueOf(puerto).intValue());
		    while(true) {
		    	Socket cliente = servidor.accept();
			    try { 
			       /*"formateo" de la información de los flujos de entrada 
			       y salida asociados a un Socket. */

			       DataInputStream in = new DataInputStream(cliente.getInputStream());
				   PrintWriter out = new PrintWriter(cliente.getOutputStream(),true);
				   boolean finalizar = false;
				   while(!finalizar) {
				   	   String mensajeRSC = in.readLine();
			  	       if(mensajeRSC.equals("final")) finalizar = true;
			  	       System.out.println(mensajeRSC);
			  	       out.println(mensajeRSC);
				   }
			    }catch(Exception e) {System.out.println("Error1 " + e.toString()); }
			}
	    }catch(Exception e) {System.out.println("Error2 - " + e.toString());}
	}
}
