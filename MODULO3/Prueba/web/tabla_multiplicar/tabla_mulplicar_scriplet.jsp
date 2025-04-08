<%-- 
    Document   : tabla_mulplicar_scriplet
    Created on : 18 jul 2025, 18:40:24
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
        <title>JSP</title>
    </head>
    <body>
        <div class="div_titulo">TABLA DE MULTIPLICAR DEL <%=n%></div>
        <%
            out.println("<table class='table_cuerpo' border='1' cellpadding='10' cellspacing='10'>");
            for (int i = 1; i <= 12; i++) {
                //out.println(i + " * " + n + " = " + (i*n) + "<br>");
                out.println("<tr>");
                out.println("<td>" + i + "</td>");
                out.println("<td>*</td>");
                out.println("<td>" + n + "</td>");
                out.println("<td>=</td>");
                out.println("<td>" + (i * n) + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        %>

        <!--
                out.println("<table>");
                out.println("<tr>");
                out.println("<td>" + i + "</td>");
                out.println("<td>*</td>");
                out.println("<td>" + n + "</td>");
                out.println("<td>=</td>");
                out.println("<td>" + (i*n) + "</td>");
                out.println("</tr>");
                out.println("</table>");
        <!--


    </body>
</html>
