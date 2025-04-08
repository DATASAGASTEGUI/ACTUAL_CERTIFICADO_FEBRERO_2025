****************
***   0001   ***   ComboBox
****************

conexion.jsp

<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/CAMPUSFP";
    String usuario = "root";
    String clave = "tu_contraseña";  // Cambia esto

    Connection conexion = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(url, usuario, clave);
    } catch (Exception e) {
        out.println("Error de conexión: " + e.getMessage());
    }
%>

index.jsp

<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<html>
<head>
    <title>ComboBox desde BD</title>
</head>
<body>
    <h2>Selecciona un alumno:</h2>
    <form action="procesar.jsp" method="post">
        <select name="alumnoSeleccionado">
            <%
                if (conexion != null) {
                    String sql = "SELECT idAlumno, nombre FROM Alumno";
                    Statement stmt = conexion.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        String id = rs.getString("idAlumno");
                        String nombre = rs.getString("nombre");
            %>
                        <option value="<%=id%>"><%=nombre%></option>
            <%
                    }
                    rs.close();
                    stmt.close();
                    conexion.close();
                }
            %>
        </select>
        <input type="submit" value="Enviar">
    </form>
</body>
</html>

procesar.jsp

<%
    String idAlumno = request.getParameter("alumnoSeleccionado");
%>
<p>Has seleccionado el alumno con ID: <%= idAlumno %></p>

****************
***   0002   ***   ComboBox
****************

-----------------------
Estructura del Proyecto
-----------------------

/MiProyectoWeb
├── src/
│   └── controlador/
│       └── AlumnoServlet.java
├── WebContent/
│   ├── combo.jsp         // Vista
│   └── WEB-INF/
│       └── lib/          // Agrega aquí el conector MySQL (mysql-connector-java.jar)


----------------------------
1. Modelo: Clase Alumno.java
----------------------------

package modelo;

public class Alumno {
    private int idAlumno;
    private String nombre;

    public Alumno(int idAlumno, String nombre) {
        this.idAlumno = idAlumno;
        this.nombre = nombre;
    }

    public int getIdAlumno() {
        return idAlumno;
    }

    public String getNombre() {
        return nombre;
    }
}

------------------------------------------
2. Controlador: Servlet AlumnoServlet.java
------------------------------------------

package controlador;

import modelo.Alumno;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

public class AlumnoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Alumno> listaAlumnos = new ArrayList<>();

        String url = "jdbc:mysql://localhost:3306/CAMPUSFP";
        String usuario = "root";
        String clave = "tu_contraseña";  // cámbiala

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(url, usuario, clave);
            String sql = "SELECT idAlumno, nombre FROM Alumno";
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("idAlumno");
                String nombre = rs.getString("nombre");
                listaAlumnos.add(new Alumno(id, nombre));
            }

            rs.close();
            stmt.close();
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("alumnos", listaAlumnos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("combo.jsp");
        dispatcher.forward(request, response);
    }
}

------------------------------
3. Vista: Página JSP combo.jsp
------------------------------

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.Alumno" %>
<html>
<head>
    <title>ComboBox desde Base de Datos</title>
</head>
<body>
    <h2>Selecciona un alumno:</h2>
    <form action="procesar.jsp" method="post">
        <select name="alumnoSeleccionado">
            <%
                List<Alumno> alumnos = (List<Alumno>) request.getAttribute("alumnos");
                if (alumnos != null) {
                    for (Alumno a : alumnos) {
            %>
                        <option value="<%=a.getIdAlumno()%>"><%=a.getNombre()%></option>
            <%
                    }
                }
            %>
        </select>
        <input type="submit" value="Enviar">
    </form>
</body>
</html>

procesar.jsp

<%
    String idAlumno = request.getParameter("alumnoSeleccionado");
%>
<p>Has seleccionado el alumno con ID: <%= idAlumno %></p>

PROYECTO MAVEN: MODELO VISTA CONTROLADOR

modelo:      tabla(clase)    --->   Base de Datos

controlador: servlet

vista:       index.jsp

--------------------------------------------------------------------------------
ComboBoxApp/
├── pom.xml
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── controlador/
│   │   │   │   └── AlumnoServlet.java
│   │   │   └── modelo/
│   │   │       └── Alumno.java
│   │   │           Conexion.java
│	│	│			AlumnoDAO.java               //Interface
│	│	│			AlumnoDAOImpl.java           //
│   │   ├── resources/
│   │   └── webapp/
│   │       ├── vistas/
│   │       │   └── combobox.jsp
│   │       ├── index.jsp
│   │       └── WEB-INF/
│   │           └── web.xml
--------------------------------------------------------------------------------

RequestDispatcher rd = request.getRequestDispatcher("index.jsp");


DROP DATABASE IF EXISTS CAMPUSFP;
CREATE DATABASE IF NOT EXISTS CAMPUSFP;
USE CAMPUSFP;

CREATE TABLE IF NOT EXISTS Alumno (
    idAlumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO Alumno (nombre) VALUES
('Ana Martínez'),
('Carlos Pérez'),
('Lucía Gómez'),
('Pedro Sánchez'),
('María López');


<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Elige una opción</title></head>
<body>
    <h2>Selecciona una opción</h2>
    <ul>
        <li><a href="OpcionServlet?opcion=opcion1">Opción 1</a></li>
        <li><a href="OpcionServlet?opcion=opcion2">Opción 2</a></li>
        <li><a href="OpcionServlet?opcion=opcion3">Opción 3</a></li>
    </ul>
</body>
</html>

package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/OpcionServlet")
public class OpcionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {

        String opcion = request.getParameter("opcion");

        if (opcion == null) {
            response.sendRedirect("opciones.jsp");
            return;
        }

        switch(opcion) {
            case "opcion1":
                request.getRequestDispatcher("resultado1.jsp").forward(request, response);
                break;
            case "opcion2":
                request.getRequestDispatcher("resultado2.jsp").forward(request, response);
                break;
            case "opcion3":
                request.getRequestDispatcher("resultado3.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("opciones.jsp");
        }
    }
}
-------------------------------------------------------------------------
Maven_MVC_Proyecto/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── controlador/
│       │       └── OpcionServlet.java      ← Controlador (Controller)
│       │
│       │   └── modelo/
│       │       └── Consulta.java           ← Modelo (si lo necesitas) (model)
│       │
│       └── webapp/
│           ├── index.jsp                ← Vista (views)
│           ├── resultado1.jsp              ← Vista
│           ├── resultado2.jsp
│           ├── resultado3.jsp
│           └── WEB-INF/
│               └── web.xml                 ← Config opcional
│
├── pom.xml                                 ← Configuración del proyecto Maven
---------------------------------------------------------------------------
MVC

MODELO
CONTROLADOR
VISTA

index.jsp (1 2 3 4) ---> OpcionServlet ---> 1 resultado1.jsp
                                            2 resultado2.jsp
										    3 resultado3.jsp                ---> Opcion3Servlet ---> resultado4.jsp
										    4 resultado5.jsp (Botón Enviar) ---> Opcion4Servlet ---> resultado6.jsp








