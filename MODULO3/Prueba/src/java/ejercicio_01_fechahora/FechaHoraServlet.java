package ejercicio_01_fechahora;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;

public class FechaHoraServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String fechaHora = "";
        String year = "";
        String mes = "";
        String dia = "", dia1 = "";
        String hora = "";
        String minutos = "";
        String horaMinutos = "";
        String nombre = "";
        String mensaje = "";

        if (request.getParameter("enviar") != null) {
            fechaHora = request.getParameter("txtFechaHora");
            nombre = request.getParameter("txtNombre");
            
            out.println(fechaHora + "<br>");
            String[] parte = fechaHora.split("-");
            year = parte[0];
            mes = parte[1];
            dia = parte[2];
            String[] parte1 = dia.split("T");
            dia1 = parte1[0];
            horaMinutos = parte1[1];
            String[] parte2 = horaMinutos.split(":");
            
            Connection conexion = ConexionMysql.obtenerConexion();
            if (Crud.buscarCita(fechaHora, conexion) == false) {
               
                Crud.insertarCita(nombre, fechaHora, conexion);
                mensaje = "CITA REGISTRADA CORRECTAMENTE";
            } else {
               mensaje = "CITA YA ESTA SELECCIONADA. BUSQUE OTRA";
            }


            /*
           out.print("Fecha:" + dia1 + "/" + mes + "/" + year + "<br>");
           out.print("Hora:    " + parte2[0] + "<br>");
           out.print("Minutos: " + parte2[1] + "<br>");
             */

            String fechaHora2 = dia1 + "/" + mes + "/" + year;

            request.setAttribute("fechaHoraCompleta", fechaHora);
            request.setAttribute("fechaHora", fechaHora2);
            request.setAttribute("hora", parte2[0]);
            request.setAttribute(("minutos"), parte2[1]);
            request.setAttribute("mensaje", mensaje);
            request.getRequestDispatcher("ejercicio_01_fechahora/seleccione_fecha_hora.jsp").forward(request, response);

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
