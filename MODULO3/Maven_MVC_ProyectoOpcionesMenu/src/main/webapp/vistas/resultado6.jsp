<%-- 
    Document   : resultado6
    Created on : 24 jul 2025, 19:42:52
    Author     : RYZEN
--%>

<%@page import="modelo.Consulta"%>
<%@page import="java.util.List"%>
<%
    List<Consulta> consultasdeunaprocedencia = (List<Consulta>) request.getAttribute("procedencia");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LISTA DE CONSULTAS POR PROCEDENCIA</h1>
        <%
            if (consultasdeunaprocedencia != null) {
                for(Consulta consulta: consultasdeunaprocedencia) {
                    out.print(consulta.miToString2());
                }
            } else {
                out.println("LISTA VACIA");
            }
        %>
        <a href="index.jsp">Ir al inicio</a>
    </body>
</html>
