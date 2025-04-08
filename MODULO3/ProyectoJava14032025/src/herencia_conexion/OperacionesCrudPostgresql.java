package herencia_conexion;

import java.sql.Connection;
import librerias_crud.Operaciones;

public class OperacionesCrudPostgresql extends Operaciones {

    public OperacionesCrudPostgresql() {
    }

    public OperacionesCrudPostgresql(Connection conexion) {
        super(conexion);
    }
    
    
    
}
