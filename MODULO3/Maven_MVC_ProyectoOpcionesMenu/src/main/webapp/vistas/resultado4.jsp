<%-- 
    Document   : resultado4
    Created on : 24 jul 2025, 17:56:38
    Author     : RYZEN
--%>

<%@page import="modelo.Consulta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            List<Consulta> consultasdeunmedico = (List<Consulta>) request.getAttribute("consultasdeunmedico");
            for(Consulta consulta: consultasdeunmedico) {
                out.print(consulta.miToString2());
            
            }          

            %>
        <a href="index.jsp">Ir al inicio</a>
    </body>
</html>
