package herencia_conexion;

import java.sql.Connection;
import librerias_crud.Operaciones;

public class OperacionesCrudMysql extends Operaciones {

    public OperacionesCrudMysql() {
    }

    public OperacionesCrudMysql(Connection conexion) {
        super(conexion);
    }
    
}
