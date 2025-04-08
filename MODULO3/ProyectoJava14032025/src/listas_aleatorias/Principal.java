package listas_aleatorias;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.util.List;
import sistema_test_ventana.Conexion;
import sistema_test_ventana.Pregunta;
import java.util.List;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import sistema_test_ventana.Crud;
import sistema_test_ventana.VentanaPreguntas;

public class Principal {

    public static void main(String[] args) {
        ejemplo3();
    }

    // LISTAS ALEATORIAS
    public static void ejemplo1() {
        Connection conexion = Conexion.getConexion();
        Crud crud = new Crud(conexion);
        List<Pregunta> preguntas = crud.obtenerTodasPreguntas();
        Collections.shuffle(preguntas);
        List<Pregunta> preguntasAleatorias = preguntas.subList(0, 10);
        preguntasAleatorias.forEach(x -> System.out.println(x));
    }

    // COLECION MAP (DICCIONARIAS: CLAVE - VALOR) List-ArrayList, Set-TreeSet
    public static void ejemplo2() {
        List<String> lista = new ArrayList<>();
        Map<Integer, String> listaNombres = new HashMap<>();
        Set<Integer> listasinduplicados = new TreeSet<>(); //Solo por elemento

        Connection conexion = Conexion.getConexion();
        Crud crud = new Crud(conexion);
        List<Pregunta> preguntas = crud.obtenerTodasPreguntas();
        Map<Integer, Pregunta> preguntasmap = new HashMap<>();
        for (int i = 0; i < preguntas.size(); i++) {
            Pregunta p = preguntas.get(i);
            preguntasmap.put(i, p);
        }

        Set<Integer> claves = preguntasmap.keySet();

        Collection<Pregunta> valores = preguntasmap.values();

        for (Pregunta p : valores) {
            System.out.println(p);
        }

        for (Map.Entry<Integer, Pregunta> elemento : preguntasmap.entrySet()) {
            System.out.println(elemento.getKey() + "-" + elemento.getValue());
        }
    }

    /*
        ID NOMBRE EDA
        
        ID     - 1
        NOMBRE - "Arturo"
        EDAD   - 23
        
        
        RESOLUCION - 2048
        TIPOLETRA  - Arial
     */
    // BIBLIOTECA GSON PARA MANEJOR ESTRUCTURAS JSON
    public static void ejemplo3() {
        Connection conexion = Conexion.getConexion();
        Crud crud = new Crud(conexion);
        
        VentanaPreguntas vp = new VentanaPreguntas();
        Set<Integer> lista = vp.idPreguntasAleatorias(5);
        
        // CONVERTIR UNA LISTA DE OBJETOS JAVA A UNA ESTRUCTURA JSON
        List<Pregunta> preguntas = crud.obtenerTodasPreguntasAleatorias(lista);
        Gson gson = new Gson();
        String stringjson = gson.toJson(preguntas);
        System.out.println(stringjson);
        
        // CONVERTIR UN JSON A UNA LISTA DE OBJETOS JAVA
        String json = "[{\n" +
"        \"idPregunta\": 21,\n" +
"        \"textoPregunta\": \"¿Qué significa DML?\",\n" +
"        \"respuestaCorrecta\": 3,\n" +
"        \"opciones\": [\"Data Management Language\", \"Data Migration Language\", \"Data Manipulation Language\", \"Database Management Layer\"]\n" +
"    }, {\n" +
"        \"idPregunta\": 44,\n" +
"        \"textoPregunta\": \"¿Cuál es el formato de fecha por defecto en Oracle?\",\n" +
"        \"respuestaCorrecta\": 3,\n" +
"        \"opciones\": [\"DD-MM-YYYY\", \"MM/DD/YYYY\", \"DD-MON-YY\", \"YYYY-MM-DD\"]\n" +
"    }]";
        
        List<Pregunta> listapreguntas = gson.fromJson(json, new TypeToken<List<Pregunta>>(){}.getType());
        for(Pregunta p: listapreguntas) {
            System.out.println(p);
        }
    }
}
