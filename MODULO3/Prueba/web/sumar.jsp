<%-- 
    Document   : sumar
    Created on : 18 jul 2025, 16:08:33
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
        <h1>SUMAR DOS NUMEROS</h1>
        <%-- COMPONENTE JAVA --%>
        <%
                // ENTRADA
                String numero1 = "";
                String numero2 = "";
                // SALIDA
                String suma = "";
                // ACCION
                if (request.getParameter("cmdSumar") != null) {
                    String patron = "([0-9]*\\.[0-9]*)|[0-9]*";
                    numero1 = request.getParameter("txtN1");
                    numero2 = request.getParameter("txtN2");
                    if (numero1.matches(patron) && numero2.matches(patron)) {
                        double resultado = Double.parseDouble(numero1) + Double.parseDouble(numero2);
                        suma = resultado + "";
                    } else {
                        numero1 = "";
                        numero2 = "";
                        suma = "";
                        out.print("<script>alert(\"Entrada incorrecta\")</script>");
                    }
                }
        %>
        <%-- COMPONENTE VISTA (HTML) --%>
        <form action="sumar.jsp" method="post">
            <%-- ENTRADA --%>
            Ingrese número 1? <input type="text" name="txtN1" value="<%=numero1%>"/><br>
            Ingrese número 1? <input type="text" name="txtN2" value="<%=numero2%>"/><br>
            <%-- SALIDA --%>
            Suma: <input type="text" name="txtSuma" readonly value="<%=suma%>"/><br>
            <%-- ACCION --%>
            <input type="submit" name="cmdSumar" value="Sumar" />
            <input type="submit" name="cmdNuevo" value="Nuevo" /><br>
        </form>
    </body>
</html>
