<%-- 
    Document   : listas_consultas
    Created on : 9 sept 2025, 19:43:39
    Author     : Curso Tarde
--%>

<%@page import="java.util.List"%>
<%@page import="misrc.modelo.Consulta"%>
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
            List<Consulta> consultas = (List<Consulta>)request.getAttribute("consultas");
            if(consultas != null && consultas.size() > 0) {
        %>
            <table border="1">
                <thead>
                    <tr>
                        <th>Numero Consulta</th>
                        <th>Nombre Medico</th>
                        <th>fecha</th>
                        <th>Deinpr</th>
                        <th>Procedencia</th>
                    </tr>  
                </thead>
                <tbody>
                    <%
                       for(Consulta consulta: consultas) {
                    %>   
                    <tr>
                        <td><%=consulta.getNumeroConsulta()%></td>
                        <td><%=consulta.getNombreMedico()%></td>
                        <td><%=consulta.getFecha()%></td>
                        <td><%=consulta.getDeinpr()%></td>
                        <td><%=consulta.getProcedencia()%></td>
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
