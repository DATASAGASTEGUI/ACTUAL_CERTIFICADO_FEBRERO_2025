package herencia_conexion_1;

public class Principal {

    public static void main(String[] args) {
        conexionMysql();
        conexionPostgresql();

    }

    public static void conexionMysql() {
        ConexionMySql cm = new ConexionMySql("jdbc:mysql",
                "com.mysql.cj.jdbc.Driver",
                "localhost",
                "root",
                "12345678",
                3307,
                "tienda"
        );
        if (cm.getConexion() != null) {
            System.out.println("OK: CONEXION MYSQL");
        } else {
            System.out.println("ERROR: CONEXION MYSQL");
        }
    }
    
    public static void conexionPostgresql() {
        ConexionMySql cm = new ConexionMySql("jdbc:postgresql",
                "org.postgresql.Driver",
                "localhost",
                "postgres",
                "12345678",
                5432,
                "tienda"
        );
        if (cm.getConexion() != null) {
            System.out.println("OK: CONEXION POSTGRESQL");
        } else {
            System.out.println("ERROR: CONEXION POSTGRESQL");
        }
    }    

}
