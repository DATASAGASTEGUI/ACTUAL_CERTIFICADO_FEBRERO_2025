<%-- 
    Document   : sumar
    Created on : 11 mar 2025, 19:13:18
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
        <h1>FORMULARIO SUMAR DOS NUMEROS</h1>
        <form action="resultado.jsp">
            <%-- ENTRADA NUMERO 1--%> 
            <label for="txtNumero1">Número 1:</label>
            <input type="text" name="txtNumero1" id="txtNumero1"/>
            <%-- ENTRADA NUMERO 2--%>
            <label for="txtNumero2">Número 2:</label>
            <input type="text" name="txtNumero2" id="txtNumero2"/>
            <%-- ACCION SUMAR--%>
            <button type="submit">Sumar</button>
        </form>
    </body>
</html>
