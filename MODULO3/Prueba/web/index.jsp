<%-- 
    Document   : index
    Created on : 18 jul 2025, 16:07:53
    Author     : RYZEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hola Mundo!</h1>
        <%
           String cadena = "Hola Mundo desde Java";
           out.println("<h2 style='color: red;'>" + cadena + "</h2>");
           out.println("<input type='text' value='Ingrese aquí' />");
           out.println("<input type=\"text\" value=\"Ingrese aquí\" />");
        %>
        
        <input type="text" value="Ingrese aquí" /> 
        <input type="text" value="<%="Resultado" + cadena%>" /> 
        
    </body>
</html>
