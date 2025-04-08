<%@page import="modelo.Alumno"%>
<%@page import="java.util.List"%>
<%
    List<Alumno> alumnos = (List<Alumno>) request.getAttribute("alumnos");
    String idSeleccionado = request.getParameter("cboAlumno");
    Alumno alumnoSeleccionado = null;

    if (idSeleccionado != null && alumnos != null) {
        for (Alumno a : alumnos) {
            if (String.valueOf(a.getIdAlumno()).equals(idSeleccionado)) {
                alumnoSeleccionado = a;
                break;
            }
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alumnos</title>
</head>
<body>
    <h1>Lista Alumnos</h1>

    <form method="post" action="">
        Seleccione alumno:
        <select name="cboAlumno" onchange="this.form.submit()">
            <option value="">-- Seleccione --</option>
            <% if (alumnos != null) {
                for (Alumno alumno : alumnos) {
                    String selected = (idSeleccionado != null && idSeleccionado.equals(String.valueOf(alumno.getIdAlumno()))) ? "selected" : "";
            %>
            <option value="<%= alumno.getIdAlumno() %>" <%= selected %>>
                <%= alumno.getNombre() %>
            </option>
            <% }
            } %>
        </select>
    </form>

    <hr>

    <% if (alumnoSeleccionado != null) { %>
        <h3>Datos del alumno seleccionado:</h3>
        <p><strong>ID:</strong> <%= alumnoSeleccionado.getIdAlumno() %></p>
        <p><strong>Nombre:</strong> <%= alumnoSeleccionado.getNombre() %></p>
        <%-- Agrega aquí más campos si tu clase Alumno los tiene, por ejemplo: --%>
        <%-- <p><strong>Grupo:</strong> <%= alumnoSeleccionado.getGrupo() %></p> --%>
    <% } %>
</body>
</html>

