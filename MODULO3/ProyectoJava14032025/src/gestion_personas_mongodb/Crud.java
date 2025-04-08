package gestion_personas_mongodb;

import com.google.gson.Gson;
import com.mongodb.client.MongoCollection;
import java.util.ArrayList;
import java.util.List;
import mibiblioteca.Libro;
import org.bson.Document;

public class Crud {
    Gson gson = new Gson();
    
   public static final int INSERT_SI = 1;
   public static final int INSERT_NO = 0;
   public static final int INSERT_ERROR = -1;
    
    // VARIABLE DE INSTANCIA
    MongoCollection<Document> coleccion;
    
    public Crud( MongoCollection<Document> coleccion) {
        this.coleccion = coleccion;
    }
    
    // 1. CREATE
    public int crearDocumento(Persona persona) {
        int n = 0;
        try {
            String stringjson = gson.toJson(persona); //Convierte el objeto java en un texto json
            Document documento = Document.parse(stringjson);
            coleccion.insertOne(documento); 
            n = 1;
        }catch(Exception e) {
            n = -1;
        }
        return n;
    }
    
    // 2. READ
    public List<Persona> obtenerTodosDocumentos() {
       List<Persona> personas = coleccion.find()
                .map(d -> gson.fromJson(d.toJson(), Persona.class))
                .into(new ArrayList<>());
       return personas;
        
    }
    
    
    
    // 3. UPDATE
    
    // 4. DELETE
}
