
package com.mycompany.proyectojavamaven;

import java.sql.Connection;


public class Principal {


    public static void main(String[] args) {
        Connection conexion = ConexionMySql.getConexion();
        if(conexion != null) {
            System.out.println("OK CONEXION");
        }else {
            System.out.println("ERROR CONEXION");
        }
    }
    
}
