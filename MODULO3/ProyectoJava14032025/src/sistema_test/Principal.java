package sistema_test;

import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Principal {
    static List<Pregunta> preguntas = DBPreguntas.obtenerTodasPreguntas();
    static int[] respuestasUsuario; //Declaración
    public static void main(String[] args) throws UnsupportedEncodingException {
        // Configurar la codificación de salida a UTF-8
        System.setOut(new PrintStream(System.out, true, "UTF-8"));
        Scanner sc = new Scanner(System.in);
        
        respuestasUsuario = new int[preguntas.size()]; //Crear
        String respuesta = "";
        String patron = "[01234]";
       
        for(int i=0; i<preguntas.size(); i++) {
            Pregunta p = preguntas.get(i);
            System.out.println("("+p.getIdPregunta()+") "+p.getTextoPregunta());
            String[] opciones = p.getOpciones();
            for(int j=0; j<opciones.length; j++) {
                System.out.println(+(j+1)+". " + opciones[j]);
            }
            do {
                System.out.print("Ingrese su respuesta 1-4 sin contestar 0? ");
                respuesta = sc.next();
                if(!respuesta.matches(patron)) {
                   System.out.println("Entrada Incorrecta");
                }
            }while(!respuesta.matches(patron));
            
            respuestasUsuario[i] = Integer.parseInt(respuesta)-1;
        }
        analizarRespuestas();
    }
    
    public static void analizarRespuestas() {
        double puntaje = 0;
        int contadorNoRespondidas = 0;
        int contadorCorrectas = 0;
        int contadorIncorrectas = 0;
        List<Integer> preguntasSinResponder = new ArrayList<>();
        for(int i=0; i<respuestasUsuario.length; i++) {
           Pregunta p = preguntas.get(i);
           String[] opciones = p.getOpciones();
           if(respuestasUsuario[i] == p.getRespuestaPregunta()) {
              puntaje = puntaje + 1;
              contadorCorrectas++;
           }else if(respuestasUsuario[i] == -1) {
              contadorNoRespondidas++;
              preguntasSinResponder.add(i);
           }else if(respuestasUsuario[i] != p.getRespuestaPregunta()) {
              puntaje = puntaje - 0.25;
              contadorIncorrectas++;
              System.out.println("La pregunta " + (i+1) + " opción correcta es: " + opciones[p.getRespuestaPregunta()]);
           }
       }
       System.out.println("Puntaje: " + puntaje);
       System.out.println("Preguntas sin responder: " + contadorNoRespondidas);
       System.out.println("Preguntas correctas: " + contadorCorrectas);
       System.out.println("Preguntas incorrectas: " + contadorIncorrectas);
    
       repreguntar(preguntasSinResponder);
       System.out.println("Tamaño: " + preguntasSinResponder.size());
       
    }
    
    public static void repreguntar(List<Integer> preguntasSinResponder) {
        String patron = "[01234]";
        Scanner sc = new Scanner(System.in);
        String respuesta = "";
        for(int i=0; i<preguntasSinResponder.size(); i++) {
            int n = preguntasSinResponder.get(i);
            Pregunta p = preguntas.get(n);
            System.out.println("("+p.getIdPregunta()+") "+p.getTextoPregunta());
            String[] opciones = p.getOpciones();
            for(int j=0; j<opciones.length; j++) {
                System.out.println(+(j+1)+". " + opciones[j]);
            }
            do {
                System.out.print("Ingrese su respuesta 1-4 sin contestar 0? ");
                respuesta = sc.next();
                if(!respuesta.matches(patron)) {
                   System.out.println("Entrada Incorrecta");
                }
            }while(!respuesta.matches(patron));
        }
    }
}
