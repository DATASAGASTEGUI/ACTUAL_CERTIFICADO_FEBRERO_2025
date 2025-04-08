<%-- 
    Document   : tabla_multiplicar_etiqueta_expresion
    Created on : 18 jul 2025, 18:40:55
    Author     : RYZEN
--%>
<%
    int n = 6;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilo.css" rel="stylesheet" type="text/css" >
        <title>JSP Page</title>
    </head>
    <body>
        <div class="div_titulo">TABLA DE MULTIPLICAR DEL <%=n%></div>

        <table class='table_cuerpo' border="1">
            <tbody>

                <%
                    for (int i = 1; i <= 12; i++) {
                %>
                <tr>
                    <td><%=i%></td>
                    <td>*</td>
                    <td><%=n%></td>
                    <td>=</td>
                    <td><%=(i * n)%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
