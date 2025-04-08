package com.mycompany.proyectojavamaven;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMySql {

    private static final String URL = "jdbc:mysql://localhost:3307/gestion_matriculas";
    private static final String USER = "root";
    private static final String PASSWORD = "12345678";

    public static Connection getConexion() {
        Connection conexion;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(URL, USER, PASSWORD);
            return conexion;
        } catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    }
}
