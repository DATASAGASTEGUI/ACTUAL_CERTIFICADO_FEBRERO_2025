<%-- 
    Document   : resultado1
    Created on : 23 jul 2025, 19:20:16
    Author     : Curso Tarde
--%>
<%@page import="java.util.List"%>
<%
    List<String> medicos = (List<String>) request.getAttribute("medicos");
    String ruta = (String)request.getAttribute("ruta");
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>[1] Mostrar los nombres de todos los médicos</h1>
        <%
            out.print(ruta + "<br>");
            
            if (medicos != null) {
                int c = 1;
                for (String medico : medicos) {
                    out.println( c++ + ". " + medico + "<br>");
                }
            } else {
                out.println("LISTA VACIA");
            }
        %>
        <a href="index.jsp">Ir al inicio</a>
    </body>
</html>
