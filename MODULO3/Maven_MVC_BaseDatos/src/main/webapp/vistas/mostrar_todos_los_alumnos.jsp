<%-- 
    Document   : mostrar_todos_los_alumnos
    Created on : 5 sept 2025, 16:18:32
    Author     : RYZEN
--%>

<%@page import="java.util.List"%>
<%@page import="misrc.modelo.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>[1] Mostrar todos los alumnos</h1>
        
        <%
            List<Alumno> alumnos = (List<Alumno>)request.getAttribute("alumnos");
            if(alumnos != null && alumnos.size() > 0) {
        %>
            <table border="1">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Dirección</th>
                        <th>Estatura</th>
                    </tr>  
                </thead>
                <tbody>
                    <%
                       for(Alumno alumno: alumnos) {
                    %>   
                    <tr>
                        <td><%=alumno.getId()%></td>
                        <td><%=alumno.getNombre()%></td>
                        <td><%=alumno.getDireccion()%></td>
                        <td><%=alumno.getEstatura()%></td>
                    </tr>
                    <%
                       }
                    %>
                </tbody>
            </table>
        <%
            }else {
               out.println("Lista nula o vacia");
            }
        %>
        
    </body>
</html>
