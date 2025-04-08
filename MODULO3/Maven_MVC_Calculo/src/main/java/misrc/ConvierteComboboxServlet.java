package misrc;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConvierteComboboxServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String resultado = "";
        String temperatura = "";
        String opcion = "";
        
        if(request.getParameter("btnConvertir") != null) {
           temperatura = request.getParameter("txt_temperatura");
           opcion = request.getParameter("cbo_opcion");

           if("c_to_f".equals(opcion)) {
              double temp = (Double.parseDouble(temperatura) * 9/5) + 32;
              resultado = String.format("%.2f", temp); 
              resultado = temperatura + "ºC" + "=" + resultado + "ºF";
           }else if("f_to_c".equals(opcion)) {
              double temp = (Double.parseDouble(temperatura) - 32) * 5/9;
              resultado = String.format("%.2f", temp); 
              resultado = temperatura + "ºF" + "=" + resultado + "ºC"; 
           }
           request.setAttribute("resultado", resultado);
           request.setAttribute("temperatura", temperatura);
           request.setAttribute("opcion", opcion);
        }else if(request.getParameter("btnNuevo") != null) {
            resultado = "";
            temperatura = "";
            opcion = "";
        }
        
        request.getRequestDispatcher("celsius_farenheit_combobox.jsp").forward(request, response);
        
        
        
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
