<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .redondo {
        width: 200px;
        height: 200px;
        border: 2px solid black;
        border-radius: 100px; 
    }

    input[type=text] {
        text-align: center;
        width: 300px;
        border: 2px dotted #ff0000;
        background : rgba(0,0,0,.1);
        color: red;
    }
</style>

<%
    String mensaje_gui = "";
    String ruta_gui = "";
    String nombre_gui = "";

    int salida1 = 0;
    int salida2 = 0;
%>

<%@include file="combobox.txt"%>

<!--SALIDA 1 -->
<%    if (salida1 == 1) {
%> 

<center><img class="redondo" src="<%=ruta_gui%>"><br/><%=nombre_gui%></center>

<%
    }
%>

<!--SALIDA 2 -->
<%
    if (salida2 == 1) {
%> 

<center><input type="text" value="<%=mensaje_gui%>" /></center>

<%
    }
%>
