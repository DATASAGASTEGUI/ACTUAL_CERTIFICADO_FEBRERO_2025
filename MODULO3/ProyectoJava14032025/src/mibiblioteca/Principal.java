package mibiblioteca;

import com.google.gson.Gson;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.mysql.cj.x.protobuf.MysqlxCrud.Update;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.bson.Document;
import org.bson.conversions.Bson;
import sistema_test_ventana.Pregunta;

public class Principal {

    static Gson gson = new Gson();

    public static void main(String[] args) {
        MongoCollection<Document> coleccion = Conexion.obtenerConexionColeccion();
        if (coleccion != null) {
            System.out.println("OK: CONEXION");
            //crear(coleccion);
            //List<Libro> libros = leer(coleccion);
            //libros.forEach(x -> System.out.println(x));
            //prueba(coleccion);
            //Libro libro = buscar("El Principito", coleccion);
            //System.out.println(libro);
            //actualizarOne("Noche de soledad", 30, coleccion);
            /*
            int n = (int)actualizarMany("Noche de soledad xxx", 50, coleccion);
            if(n > 0) {
               System.out.println("Se actualizao " + n + " documentos");
            }else {
               System.out.println("No se encontro ningun documento con el titulo");
            }
             */
 /*
            int n = (int)eliminarOne("Noche de soledad",coleccion);
            if(n > 0) {
              System.out.println("Elimino " +n+" documento" );
            }else {
              System.out.println("No se encontro ningun documento con el titulo");  
            }
             */

            Map<String, Libro> libros = leerHashMap(coleccion);
            /*
            for (Map.Entry<String, Libro> elemento : libros.entrySet()) {
                System.out.println(elemento.getKey() + "-" + elemento.getValue());
            }
            */
            System.out.println(libros.get("El Principito"));

        } else {
            System.out.println("ERROR: CONEXION");
        }

        //System.out.println("Cantidad Documentos: " + cantidadDocumentos(coleccion));
    }

    // 1. CREATE (INSERT EN SQL)
    public static void crear(MongoCollection<Document> coleccion) {
        Libro libro = new Libro("Noche de soledad",
                "Arturo Garazón",
                2025,
                Arrays.asList("Comedio", "Novela"),
                23.34
        );
        String stringjson = gson.toJson(libro); //Convierte el objeto java en un texto json
        Document documento = Document.parse(stringjson);
        coleccion.insertOne(documento);
        System.out.println("Insercion del documento correcto");
    }

    // 2. READ (SELECT EN SQL)
    public static List<Libro> leer(MongoCollection<Document> coleccion) {
        return coleccion.find()
                .map(d -> gson.fromJson(d.toJson(), Libro.class))
                .into(new ArrayList<>());
    }

    // 3. READ(BUSCAR>) (SELECT * FROM Libro WHERE id_libro = 1)
    public static Libro buscar(String tituloBuscar, MongoCollection<Document> coleccion) {
        Document documento = coleccion.find(Filters.eq("titulo", tituloBuscar)).first();
        Libro libro = gson.fromJson(documento.toJson(), Libro.class);
        return libro;
    }

    public static void prueba(MongoCollection<Document> coleccion) {
        FindIterable<Document> resultado = coleccion.find();
        for (Document d : resultado) {
            System.out.println(d.toJson());
        }
    }

    // 4. UPDATE
    public static int actualizarOne(String tituloBuscar, double nuevoPrecio, MongoCollection<Document> coleccion) {
        Bson filtro = Filters.eq("titulo", tituloBuscar);
        Bson actualizar = Updates.set("precio", nuevoPrecio);
        UpdateResult ur = coleccion.updateOne(filtro, actualizar);
        System.out.println("Actualizacion correcta");
        return (int) ur.getModifiedCount();
    }

    public static long actualizarMany(String tituloBuscar, double nuevoPrecio, MongoCollection<Document> coleccion) {
        Bson filtro = Filters.eq("titulo", tituloBuscar);
        Bson actualizar = Updates.set("precio", nuevoPrecio);
        UpdateResult resultado = coleccion.updateMany(filtro, actualizar);
        return resultado.getModifiedCount();
    }

    // 5. DELETE
    // deleteOne
    public static long eliminarOne(String tituloBuscarEliminar, MongoCollection<Document> coleccion) {
        Bson filtro = Filters.eq("titulo", tituloBuscarEliminar);
        DeleteResult dr = coleccion.deleteOne(filtro);
        return dr.getDeletedCount();
    }

    public static long eliminarMany(String tituloBuscarEliminar, MongoCollection<Document> coleccion) {
        Bson filtro = Filters.eq("titulo", tituloBuscarEliminar);
        DeleteResult dr = coleccion.deleteMany(filtro);
        return dr.getDeletedCount();
    }

    // deleteMany
    public static int cantidadDocumentos(MongoCollection<Document> coleccion) {
        coleccion.drop();
        return (int) coleccion.countDocuments();
    }

    public static Map<String, Libro> leerHashMap(MongoCollection<Document> coleccion) {
        Map<String, Libro> libros = new HashMap<String, Libro>();

        FindIterable<Document> x = coleccion.find();
        for (Document d : x) {
            Libro libro = gson.fromJson(d.toJson(), Libro.class);
            libros.put(libro.getTitulo(), libro);
        }
        return libros;
    }

}

// new Ventana().setViseble(true);
// Ventana v = new Ventana();
// v.setVisible(true);
