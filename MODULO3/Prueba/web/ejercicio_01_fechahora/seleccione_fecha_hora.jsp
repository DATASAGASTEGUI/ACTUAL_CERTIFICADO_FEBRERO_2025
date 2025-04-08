<%-- 
    Document   : seleccione_fecha_hora
    Created on : 22 jul 2025, 16:09:20
    Author     : Curso Tarde
--%>

<%
   String fechaHora = (String)request.getAttribute("fechaHora");
   String hora = (String)request.getAttribute("hora");
   String minutos = (String)request.getAttribute("minutos");
   String fechaHoraCompleta = (String)request.getAttribute("fechaHoraCompleta");
   String mensaje = (String)request.getAttribute("mensaje");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
  
    <body>
        <form action="http://localhost:8080/BASEDATOS/FechaHoraServlet" method="post">
            <%-- ENTRADA --%>
            <label for="txtNombre">Ingrese Nombre?</label>
            <input type="text" id="txtNombre" name="txtNombre" required /><br><br>
            
            <label for="lblFechaHora">Elija una fecha, hora y minutos para su cita:</label>
            <input type="datetime-local" id="lblFechaHora" name="txtFechaHora" value="<%=fechaHoraCompleta%>" required=""><br><br>
            <%-- ACCION --%>
            <input type="submit" value="Enviar" name="enviar">
            <input type="reset" value="Resetear" name="resetear">
            <%-- SALIDA --%>
            <input type="text" name="txtFecha" value="<%=fechaHora%>" />
            <input type="text" name="txtHora" value="<%=hora%>" />
            <input type="text" name="txtMinutos" value="<%=minutos%>" />
            <input type="text" name="txtMensaje" value="<%=mensaje%>" />
        </form>
    </body>
</html>
