<%-- 
    Document   : resultado5
    Created on : 24 jul 2025, 19:23:46
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
        <h1>[4] Mostrar consultas por tipo de procedencia</h1>
        <form action="http://localhost:8092/Maven_MVC_ProyectoOpcionesMenu/Opcion4Servlet" >
            <input type="radio" name="procedencia" value="URGENCIAS">Urgencia 
            <input type="radio" name="procedencia" value="PLANTA">Planta 
            <input type="radio" name="procedencia" value="CONSULTA">Consulta 
            <input type ="submit" value="Enviar">
        </form>
        
        
    </body>
</html>
