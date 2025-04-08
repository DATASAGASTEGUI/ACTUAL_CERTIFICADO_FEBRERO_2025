package mongodb;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import org.bson.Document;

public class Principal {

    public static void main(String[] args) {
        String nombreBaseDatos = "mitienda";
        String nombreServidor = "localhost"; //127.0.0.1
        int puerto = 27017;

        //Conexion con el servidor mongodb
        MongoClient mc = new MongoClient(nombreServidor, puerto);

        // Obtener la base de datos
        MongoDatabase database = mc.getDatabase(nombreBaseDatos);

        System.out.println("OK: CONEXION");

        // Obtener la colección "producto"
        MongoCollection<Document> producto = database.getCollection("producto");

        // OBTENER EL NUMERO DE DOCUMENTOS DE LA COLECCION
        long cantidadDocumentos = producto.countDocuments();
        System.out.println("Cantidad Documentos: " + cantidadDocumentos);

        // MOSTRAR TODOS LOS DOCUMENTO DE UNA COLECCION
        MongoCursor<Document> cursor = producto.find().iterator();
        while (cursor.hasNext()) {
            Document d = cursor.next();
            System.out.println(d.toJson());
        }

        // INSERTAR UN DOCUMENTO
        /*
        Document d = new Document();
        d.append("_id", 32);
        d.append("title", "Teclado");
        d.append("Category", "Informática");
        producto.insertOne(d);
*/

        // MOSTRAR TODOS LOS DOCUMENTO DE UNA COLECCION
        MongoCursor<Document> cursor1 = producto.find().iterator();
        while (cursor1.hasNext()) {
            Document d1 = cursor1.next();
            System.out.println(d1.toJson());
        }

        // MOSTRAR UN DOCUMENTO CON FILTRO
        Document documento = producto.find(Filters.eq("id", 20)).first();
        if (documento != null) {
            System.out.println("Titulo: " + documento.getString("title"));
            System.out.println("Categoria: " + documento.getString("category"));

        }

    }

}
