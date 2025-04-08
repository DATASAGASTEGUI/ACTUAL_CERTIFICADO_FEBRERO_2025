package function_mysql;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.Scanner;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PrincipalMenu {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (true) {
            System.out.println("MENU");
            System.out.println("[1] Función con parametros: Sumar dos numeros");
            System.out.println("[2] Función sin parametros: Devuelve cantidad clientes y cantidad pedidos");
            System.out.println("[3] Query que hace uso de una función");

            System.out.println("[4] Salir");

            System.out.print("Ingrese opción? ");
            String opcion = sc.next();

            switch (opcion) {
                case "1":
                    System.out.println("[1] Función con parametros");
                    opcion1();
                    break;
                case "2":
                    System.out.println("[2] Función sin parametros");
                    opcion2();
                    break;
                case "3":
                    System.out.println("[3] Query que hace uso de una función");
                    opcion3();
                    break;
                case "4":
                    System.exit(0);
            }
        }

    }

    public static Connection obtenerConexion() {
        String url = "jdbc:mysql://127.0.0.1:3307/factoria";
        String usuario = "root";
        String clave = "12345678";
        Connection conexion;
        try {
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException e) {
            conexion = null;
        }
        return conexion;
    }

    public static void opcion1() {
        String funcion = "{? = CALL sumar_dos_numeros(?,?)}";
        CallableStatement cs;

        Connection conexion = obtenerConexion();
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            try {
                cs = conexion.prepareCall(funcion);
                cs.setInt(2, 5); //Entrada
                cs.setInt(3, 1); //Entrada
                cs.registerOutParameter(1, Types.INTEGER); //Salida
                cs.execute();
                // Recuperar lo que devuelve la función
                int suma = cs.getInt(1);
                System.out.println("Suma: " + suma);
            } catch (SQLException ex) {
                System.out.println("ERROR: FUNCTION");
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static void opcion2() {
        String funcion = "{? = CALL contar_numero_registros_tabla_cliente_pedidos()}";
        CallableStatement cs;

        Connection conexion = obtenerConexion();
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            try {
                cs = conexion.prepareCall(funcion);
                cs.registerOutParameter(1, Types.VARCHAR); //Salida
                cs.execute();
                // Recuperamos la salida
                String salida = cs.getString(1);
                System.out.println("Salida: " + salida);
                String p[] = salida.split(",");
                System.out.println("Cantidad Clientes: " + p[0]);
                System.out.println("Cantidad Pedidos: " + p[1]);
            } catch (SQLException e) {
                System.out.println("ERROR: FUNCTION " + e.getMessage());
            }
        } else {
            System.out.println("ERROR: CONEXION");
        }
    }

    public static void opcion3() {
        String query = "SELECT idPedido, pe.idFabrica, pe.idProducto, descripcion, cantidad, precio, calcular_importe(cantidad,precio) AS ImporteCalculo, importe \n"
                + "FROM Producto pr\n"
                + "JOIN Pedido pe ON pr.idFabrica = pe.idFabrica AND pr.idProducto = pe.idProducto;";

        Connection conexion = obtenerConexion();
        PreparedStatement ps = null;
        if (conexion != null) {
            System.out.println("OK: CONEXION");
            try {
                ps = conexion.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int idPedido = rs.getInt(1);
                    String idFabrica = rs.getString(2);
                    String idProducto = rs.getString(3);
                    String descripcion = rs.getString(4);
                    int cantidad = rs.getInt(5);
                    double precio = rs.getDouble(6);
                    double importeCalculo = rs.getDouble(7);
                    double importe = rs.getDouble(8);
                    if(!(importeCalculo == importe))
                       System.out.println(idPedido + "\t" + importeCalculo + "\t" + importe);
                }
            } catch (SQLException ex) {
                System.out.println("ERROR: QUERY");
            }

        } else {
            System.out.println("ERROR: CONEXION");
        }

    }

}
