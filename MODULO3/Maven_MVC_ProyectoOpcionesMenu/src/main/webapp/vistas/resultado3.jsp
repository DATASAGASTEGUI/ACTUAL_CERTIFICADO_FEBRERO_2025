<%-- 
    Document   : resultado3
    Created on : 24 jul 2025, 16:46:59
    Author     : RYZEN
--%>
<%@page import="modelo.Consulta"%>
<%@page import="java.util.List"%>
<%
    List<String> medicos = (List<String>) request.getAttribute("medicos");
    
    List<Consulta> consultasdeunmedico = null;
    if(request.getParameter("Mostrar") != null) {
       consultasdeunmedico = (List<Consulta>) request.getAttribute("consultasdeunmedico");
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>[3] Mostrar toda la información de un medico seleccionado</h1>

        <form action="http://localhost:8092/Maven_MVC_ProyectoOpcionesMenu/Opcion3Servlet">
            <select name="cboNombreMedico">
                <option value="">-- SELECCIONE MEDICO --</option>
                <%
                    if (medicos != null) {
                        for (String nombre : medicos) {
                %>

                <option value="<%=nombre%>"><%=nombre%></option>

                <%
                        }
                    } else {
                         out.print("LISTA VACIA");
                    }
                %>
            </select>

            <input type="submit" value="Mostrar" />
        </form>

        <%
            if (consultasdeunmedico != null) {
                for (Consulta consulta : consultasdeunmedico) {
                    out.print(consulta.miToString2());
                }

            }else {
               out.print("LISTA VACIA 1");
            }


        %>


    </body>
</html>
