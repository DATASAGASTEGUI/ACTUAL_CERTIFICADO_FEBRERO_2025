package herencia_conexion;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import librerias_crud.Operaciones;


public class Principal {

    public static void main(String[] args) {
        try {
            //conexionMysql();
            //conexionPostgresql();
            insertar();
        } catch (SQLException ex) {
            Logger.getLogger(Principal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void conexionMysql() {
        ConexionMySql cm = new ConexionMySql("tienda");
        if (cm.getConexion() != null) {
            System.out.println("OK: CONEXION MYSQL");
            Operaciones crud = new OperacionesCrudMysql(cm.getConexion());
            if (crud.crearTabla()) {
                System.out.println("OK: CREAR TABLA MYSQL");
            } else {
                System.out.println("ERROR: CREAR TABLA MYSQL");
            }
        } else {
            System.out.println("ERROR: CONEXION MYSQL");
        }

    }

    public static void conexionPostgresql() {
        ConexionPostgreSql cp = new ConexionPostgreSql("tienda");
        if (cp.getConexion() != null) {
            System.out.println("OK: CONEXION POSTGRESQL");
            Operaciones crud = new OperacionesCrudPostgresql(cp.getConexion());
            if (crud.crearTabla()) {
                System.out.println("OK: CREAR TABLA POSTGRESQL");
            } else {
                System.out.println("ERROR: CREAR TABLA POSTGRESQL");
            }
        } else {
            System.out.println("ERROR: CONEXION POSTGRESQL");
        }
    }

    public static void insertar() throws SQLException {
        List<Conexion> conexiones = new ArrayList<>();
        conexiones.add(new ConexionMySql("tienda"));
        conexiones.add(new ConexionPostgreSql("tienda"));
        for (Conexion c : conexiones) {
            Connection conexion = c.getConexion();
            if (conexion != null) {
                System.out.println("OK: CONEXION " + conexion.getMetaData().getURL());
            } else {
                System.out.println("ERROR: CONEXION " + conexion.getMetaData().getURL());
            }

            if (c instanceof ConexionMySql) {
                OperacionesCrudMysql crud = new OperacionesCrudMysql(conexion);
                if (crud.insertarRegistro("Arturo")) {
                    System.out.println("OK: INSERT " + conexion.getMetaData().getURL());
                }
            }
            if (c instanceof ConexionPostgreSql) {
                OperacionesCrudMysql crud = new OperacionesCrudMysql(conexion);
                if (crud.insertarRegistro("Ramón")) {
                    System.out.println("OK: INSERT " + conexion.getMetaData().getURL());
                }
            }

        }
    }

}
