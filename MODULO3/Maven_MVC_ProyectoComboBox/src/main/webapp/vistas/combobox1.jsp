<%-- 
    Document   : index
    Created on : 23 jul 2025, 17:02:59
    Author     : Walter Ismael Sagástegui Lescano
--%>
<%@page import="java.util.List"%>
<%@page import="modelo.Alumno"%>
<%
    List<Alumno> alumnos = (List<Alumno>) request.getAttribute("alumnos");
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista Alumnos</h1>
        <form action="" method="post">
            Seleccione alumno:
            <select name="cboAlumno">
            <%
                if(alumnos != null) {
                    if(alumnos.size() >= 0) {
                       out.println("entro");
                       for(Alumno alumno: alumnos) {
                %>
                <option value="<%=alumno.getIdAlumno()%>"><%=alumno.getNombre()%></option>
                <%
                       }
                    }else {
                       out.print("LISTA VACIA");
                    }
                }else {
                       out.print("LISTA NULA");
                }
                %>
            </select>
        </form>
    </body>
</html>
