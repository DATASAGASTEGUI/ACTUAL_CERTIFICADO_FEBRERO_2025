<%-- 
    Document   : resultado
    Created on : 11 mar 2025, 19:13:38
    Author     : Curso Tarde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>RESULTADO SUMAR DOS NUMEROS</h1>
        <%
            String n1 = request.getParameter("txtNumero1");
            String n2 = request.getParameter("txtNumero2");
            double r = Double.parseDouble(n1) + Double.parseDouble(n2);
            out.print(r);
        %>



    </body>
</html>
