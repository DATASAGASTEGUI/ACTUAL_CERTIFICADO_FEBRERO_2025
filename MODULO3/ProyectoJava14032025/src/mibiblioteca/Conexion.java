package mibiblioteca;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;



/*
Puerto         : 27017
Nombre Servidor: localhost/127.0.0.1 

*/
public class Conexion {
    static String url = "mongodb://localhost:27017";
    static String nombreBaseDatos = "mibiblioteca";
    static String coleccion = "libros";
    
    public static MongoCollection<Document> obtenerConexionColeccion() {
        MongoClient mongoClient;
        MongoDatabase database;
        MongoCollection<Document> collection = null;

        try {
             mongoClient = MongoClients.create(url); //DriverManager
             database = mongoClient.getDatabase(nombreBaseDatos);
             collection = database.getCollection(coleccion);

        }catch(Exception e) {
             collection = null;
        }
        return collection;
    }
}
    
    

