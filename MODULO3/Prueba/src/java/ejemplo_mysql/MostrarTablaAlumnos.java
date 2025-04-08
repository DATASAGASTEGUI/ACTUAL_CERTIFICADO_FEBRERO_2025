package ejemplo_mysql;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MostrarTablaAlumnos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection conexion = null;
        try (PrintWriter out = response.getWriter()) {

            try {
                conexion = ConexionMysql.obtenerConexion();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(MostrarTablaAlumnos.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (conexion != null) {
                out.println("OK CONEXION");
                List<Alumno> alumnos = Crud.obtenerListaAlumnos(conexion);

                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet MostrarTablaAlumnos</title>");
                out.println("</head>");
                out.println("<body>");

                out.println("<table border='1'>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>IDALUMNO</th>");
                out.println("<th>NOMBRE</th>");
                out.println("<th>APELLIDOS</th>");
                out.println("<th>GRUPO</th>");
                out.println("<th>NACIMIENTO</th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");
                if (alumnos.size() > 0) {
                    for (Alumno alumno : alumnos) {
                        out.println("ENTRO");
                        out.println("<tr>");
                        out.println("<td>" + alumno.getIdAlumno() + "</td>");
                        out.println("<td>" + alumno.getNombre() + "</td>");
                        out.println("<td>" + alumno.getApellidos() + "</td>");
                        out.println("<td>" + alumno.getGrupo() + "</td>");
                        
                        SimpleDateFormat formatoSalida = new SimpleDateFormat("dd/MM/yyyy");
                        String fechaFormateada = formatoSalida.format(alumno.getFechaNacimiento());
                        
                        out.println("<td>" + fechaFormateada + "</td>");
                        out.println("</tr>");
                    }
                } else {
                    out.println("LISTA VACIA");
                }
                out.println("</tbody>");
                out.println("</table>");

                out.println("</body>");
                out.println("</html>");

            } else {
                out.println("ERROR CONEXION");
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
