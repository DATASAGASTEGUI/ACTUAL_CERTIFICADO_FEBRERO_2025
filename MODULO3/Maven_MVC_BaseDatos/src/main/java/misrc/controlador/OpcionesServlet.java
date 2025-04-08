package misrc.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import misrc.modelo.Alumno;
import misrc.modelo.AlumnoDAOImpl;
import misrc.modelo.ConexionSqlite;


public class OpcionesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String opcion = request.getParameter("opcion");
        Connection conexion = ConexionSqlite.obtenerConexion();
        AlumnoDAOImpl dao = new AlumnoDAOImpl();
        
        switch(opcion) {
            case "1": List<Alumno> alumnos = dao.obtenerTodosAlumnos(conexion);
                      request.setAttribute("alumnos", alumnos); //Diccionario
                      request.getRequestDispatcher("vistas/mostrar_todos_los_alumnos.jsp").forward(request,response);
                      break;
            case "2": break;
        }

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
