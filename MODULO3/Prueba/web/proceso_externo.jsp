<%-- 
    Document   : proceso_externo
    Created on : 18 jul 2025, 17:46:32
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
        <h1>Procesar Externo</h1>
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
                        out.print("Número 1: " + numero1 + "<br>");
                        out.print("Número 2: " + numero2 + "<br>");
                        out.print("Suma:" + suma + "<br>");
                        
                        
                    } else {
                        numero1 = "";
                        numero2 = "";
                        suma = "";
                        out.print("<script>alert(\"Entrada incorrecta\")</script>");
                    }
                }
        %>


    </body>
</html>
