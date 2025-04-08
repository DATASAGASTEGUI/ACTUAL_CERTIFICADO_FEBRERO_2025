<%-- 
    Document   : celsius_farenheit
    Created on : 4 sept 2025, 18:45:13
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
        <h1>CONVERTIR TEMPERATURA CELSIUS-FARENHEIT (RADIOBUTTON)</h1>
        
        <%
            String temperatura = request.getAttribute("temperatura") != null ? (String)request.getAttribute("temperatura"):"";
            String opcion = request.getAttribute("opcion") != null ? (String)request.getAttribute("opcion"):"";
            String resultado = request.getAttribute("resultado") != null ? (String)request.getAttribute("resultado"):"";
        %>
        
        <form action="http://localhost:8092/Maven_MVC_Calculo/ConvierteServlet" method="post">
            <!-- ENTRADA -->
            <label for="temperatura">Ingrese Temperatura:</label>
            <input type="number" id="temperatura" name="txt_temperatura" step="0.01" required value="<%=temperatura%>"><br>
            <!-- OPCIONES -->
            <input type="radio" name="rdo_opcion" value="c_to_f" <%="c_to_f".equals(opcion) ? "checked" : ""%>/>Celsius To Fahrenheit<br>
            <input type="radio" name="rdo_opcion" value="f_to_c" <%="f_to_c".equals(opcion) ? "checked" : ""%>/>Fahrenheit To Celsius<br>
            <!-- SALIDA -->
            <label for="resultado">Ingrese Temperatura:</label>
            <input type="txt" id="resultado" name="txt_resultado" value="<%=resultado%>" redonly><br>
            <!-- ACCION -->
            <input type="submit" name="btnConvertir" value="Convertir">
            <input type="submit" name="btnNuevo" value="Nuevo">
        </form>
        
    </body>
</html>
