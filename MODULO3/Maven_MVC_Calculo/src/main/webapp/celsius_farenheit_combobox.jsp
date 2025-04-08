<%-- 
    Document   : celsius_farenheit_combobox
    Created on : 4 sept 2025, 18:48:55
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
        <h1>CONVERTIR TEMPERATURA CELSIUS-FARENHEIT (COMBOBOX)</h1>
        <%
            String temperatura = request.getAttribute("temperatura") != null ? (String)request.getAttribute("temperatura"):"";
            String opcion = request.getAttribute("opcion") != null ? (String)request.getAttribute("opcion"):"";
            String resultado = request.getAttribute("resultado") != null ? (String)request.getAttribute("resultado"):"";
        %>
        
        <form action="http://localhost:8092/Maven_MVC_Calculo/ConvierteComboboxServlet" method="post">
            <!-- ENTRADA -->
            <label for="temperatura">Ingrese Temperatura:</label>
            <input type="number" id="temperatura" name="txt_temperatura" step="0.01" required value="<%=temperatura%>"><br>
            <!-- OPCIONES -->
            <label for="opcion">Seleccione la conversión:</label>
            <select name="cbo_opcion" id="opcion" required>
                <option>-- Seleccione --</option>
                <option value="c_to_f" <%="c_to_f".equals(opcion) ? "selected" : ""%>>Celsius To Fahrenheit</option>
                <option value="f_to_c" <%="f_to_c".equals(opcion) ? "selected" : ""%>>Fahrenheit To Celsius</option>
            </select><br>
            <!-- SALIDA -->
            <label for="resultado">Resultado:</label>
            <input type="txt" id="resultado" name="txt_resultado" value="<%=resultado%>" redonly><br>
            <!-- ACCION -->
            <input type="submit" name="btnConvertir" value="Convertir">
            <input type="submit" name="btnNuevo" value="Nuevo">
        </form>
            
            
    </body>
</html>
