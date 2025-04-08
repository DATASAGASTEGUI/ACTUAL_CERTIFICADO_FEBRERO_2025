****************
***   0001   ***
****************

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link REL="StyleSheet" HREF="<%=request.getContextPath()%>/estilo.css" TYPE="text/css"> <!-- /JSP05102022/ejemplo013/estilo.css -->
        <title>POLAR</title>

    </head>
    <body>
        <div class='div_titulo'>CONVERTIR UNA COORDENADA CARTESIANA A UNA COORDENADA POLAR USANDO UN JSP-SERVLET</div><br/>

        <%
            String x = "";
            String y = "";
            String r = "";
            String a = "";
            String m = "";

            if ((m = (String) request.getAttribute("m")) != null) {
                x = (String) request.getAttribute("x");
                y = (String) request.getAttribute("y");
                r = (String) request.getAttribute("r");
                a = (String) request.getAttribute("a");
            } else {
                m = "";
            }
        %>

        <!-- FORMULARIO -->
    <center>
        <form action='http://env-5261656.es-1.axarnet.cloud:8080/MiServlet'>
            <!-- ENTRADA -->
            <input type='text' name='txtX' value='<%=x%>' placeholder='X'/>
            <input type='text' name='txtY' value='<%=y%>' placeholder='Y'/>
            <!-- SALIDA -->
            <input type='text' name='txtR' value='<%=r%>' placeholder='RADIO' disabled="" />
            <input type='text' name='txtA' value='<%=a%>' placeholder='ANGULO' disabled="" />
            <input style='width: 155px' type='text' name='txtM' value='<%=m%>' placeholder='MENSAJE' disabled="" />
            <!-- BOTON -->
            <input type='submit' name='cmdCalcular' value='CALCULAR' />
            <input type='submit' name='cmdNuevo' value='NUEVO' />
        </form>
    </center>        
</body>
</html>

****************
***   0002   ***
****************

<%-- 
    Document   : suma
    Created on : 4 sept 2024, 12:55:32
    Author     : Walter Ismael Sagástegui Lescano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- COMPONENTE JAVA --%>
        <%
            //ENTRADA 
            String numero1 = "";
            String numero2 = "";
            //SALIDA
            String resultado = "";
            //ACCION
            if (request.getParameter("cmdSumar") != null) {
                numero1 = request.getParameter("txtNumero1");
                numero2 = request.getParameter("txtNumero2");
                try {
                    double suma = Double.parseDouble(numero1)
                            + Double.parseDouble(numero2);
                    resultado = suma + "";
                } catch (Exception e) {
                    numero1 = "";
                    numero2 = "";
                    resultado = "";
                }
            }

        %>


        <%-- COMPONENTE VISTA (HTML) --%>
        <form action="suma.jsp" method="post">
            <!-- ENTRADA -->
            Ingrese Número 1? <input type="text" name="txtNumero1" value="<%=numero1%>"/><br><br>
            Ingrese Número 2? <input type="text" name="txtNumero2" value="<%=numero2%>"/><br><br>
            <!-- SALIDA -->
            Resultado: <input type="text" name="txtResultado" value="<%=resultado%>" readonly/><br><br>
            <!-- ACCION(PROCESO) -->
            <input type="submit" value="SUMAR" name="cmdSumar" />
            <input type="submit" value="NUEVO" name="cmdNuevo" />
        </form>
    </body>
</html>


