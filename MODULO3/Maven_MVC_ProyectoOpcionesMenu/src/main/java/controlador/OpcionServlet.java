package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Conexion;
import modelo.Consulta;
import modelo.ConsultaDAOImpl;

public class OpcionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // *********************************************************************
        String rutaAbsolutaBD = getServletContext().getRealPath("hospital.sqlite");
        Connection conexion = Conexion.obtenerConexionSqlite(rutaAbsolutaBD);
        if(conexion != null) {
            ConsultaDAOImpl dao = new ConsultaDAOImpl();
            String opcion = request.getParameter("opcion");
            switch(opcion) {
                case "1": List<String> medicos = dao.obtenerNombresMedicos(conexion);
                          request.setAttribute("ruta", rutaAbsolutaBD);
                          request.setAttribute("medicos", medicos);
                          request.getRequestDispatcher("vistas/resultado1.jsp").forward(request, response);
                          break;
                case "2": List<Consulta> consultaspormedico = dao.obtenerCantidadConsultasPorMedico(conexion);
                          request.setAttribute("consultaspormedico", consultaspormedico);
                          request.getRequestDispatcher("vistas/resultado2.jsp").forward(request, response);
                          break; 
                case "3": List<String> medicos1 = dao.obtenerNombresMedicos(conexion);
                           
                         
                          /*
                          List<Consulta> consultasdeunmedico = null;
                          if(request.getParameter("Mostrar") != null) {
                              String nombreMedico = request.getParameter("cboNombreMedico");
                              consultasdeunmedico = dao.obtenerTodasConsultasDeUnMedico(conexion, nombreMedico);
                              request.setAttribute("consultasdeunmedico", consultasdeunmedico);
                          }
                */
                          
                          request.setAttribute("medicos", medicos1);
                          request.getRequestDispatcher("vistas/resultado3.jsp").forward(request, response);
                          break;
                 case "4": request.getRequestDispatcher("vistas/resultado5.jsp").forward(request, response);
                           break;
            }
            
            
            
        }else {
            out.println("ERROR CONEXION");
        }
        // *********************************************************************
        
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
