<%-- 
    Document   : resultado2
    Created on : 23 jul 2025, 19:20:28
    Author     : Curso Tarde
--%>

<%@page import="modelo.Consulta"%>
<%@page import="java.util.List"%>
<%
    List<Consulta> consultaspormedico = (List<Consulta>) request.getAttribute("consultaspormedico");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>[2] Mostrar el número de consultas por cada médico</h1>
        <%
            if (consultaspormedico != null) {
                for (Consulta consulta : consultaspormedico) {
                    out.print(consulta.miToString() + "<br>");
                }
            }else {
                out.println("LISTA VACIA");
            }
        %>

       <a href="index.jsp">Ir al inicio</a>
    </body>
</html>
