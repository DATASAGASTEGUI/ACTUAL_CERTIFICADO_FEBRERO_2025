package gestion_personas_mongodb;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

public class Conexion {
    static String url = "mongodb://localhost:27017";
    static String nombreBaseDatos = "gestion_personas";
    static String coleccion = "Persona";
    
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
