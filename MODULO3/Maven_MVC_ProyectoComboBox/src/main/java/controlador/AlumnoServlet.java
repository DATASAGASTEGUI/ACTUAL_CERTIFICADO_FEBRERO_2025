package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Alumno;
import modelo.AlumnoDAOImpl;
import modelo.Conexion;

public class AlumnoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        AlumnoDAOImpl dao = null;
        List<Alumno> alumnos = null;
        Connection conexion = Conexion.obtenerConexionMysql();
        if (conexion != null) {
            dao = new AlumnoDAOImpl();
            alumnos = dao.obtenerListaAlumnos(conexion);
        }else {
            out.println("ERROR CONEXION");
        }

        request.setAttribute("alumnos", alumnos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("vistas/combobox.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
