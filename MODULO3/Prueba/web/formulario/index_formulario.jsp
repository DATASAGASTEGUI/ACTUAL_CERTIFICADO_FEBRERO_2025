<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action="">

    <%-- CORREO --%>
    <label for="lblCorreo">(1) Ingrese correo del usuario:</label>

    <input type="email" name="txtCorreo" id="txtCorreo" pattern=".+@hotmail.com" size="18" 
           placeholder="usuario@hotmail.com" minlength="18" maxlength="18" 
           list="listaEmailsPorDefecto" required>

    <datalist id="listaEmailsPorDefecto">
        <option value="luis@hotmail.com">
        <option value="walter@hotmail.com">
        <option value="miguel@hotmail.com">
        <option value="carlos@hotmail.com">
        <option value="maría@hotmail.com">
    </datalist>

    </br></br>

    <%-- TELEFONO --%>
    <label for="lblTelefono">(2) Ingrese teléfono del usuario:</label>

    <input type="tel" name="txtTelefono" id="txtTelefono" pattern="[0-9]{8,8}" size="8" 
           placeholder="xxxxxxxx" minlength="8" maxlength="8" 
           list="listaTelefonosPorDefecto" required>

    <datalist id="listaTelefonosPorDefecto">
        <option value="11111111">
        <option value="22222222">
        <option value="33333333">
        <option value="44444444">
        <option value="55555555">
    </datalist>

    </br></br>

    <%-- HORA --%>
    <label for="lblReunion">(3) Elija una hora para su reunión entre 9:00 y 18:00 horas:</label>

    <input type="time" name="txtHora" id="txtHora" min="09:00" max="18:00" required>

    </br></br>

    <%-- FECHA Y HORA --%>
    <label for="lblFechaHora">(4) Elija una fecha, hora y minutos para su cita:</label>

    <input type="datetime-local" id="txtFechaHora" name="txtFechaHora">

    </br></br>

    <%-- FECHA --%>
    <label for="lblFecha">(5) Ingrese la fecha de su nacimiento:</label>

    <input type="date" id="txtFecha" name="txtFecha">

    </br></br>

    <%-- NUMERO --%>
    <label for="lblEdad">(6) Ingrese su edad:</label>

    <input type="number" id="txtEdad" name="txtEdad" min="0" max="100" step="1">

    </br></br>

    <%-- ENVIAR --%>
    <input type="submit" value="Enviar" name="accion">
    <input type="reset" value="Resetear" name="subResetear">
</form>

<%
    String correo = "";
    String telefono = "";
    String hora = "";
    String fechahora = "";
    String fecha = "";
    String edad = "";
    if (request.getParameter("accion") != null) {
%>
<h1>SALIDA</h1>
<%
    correo = request.getParameter("txtCorreo");
    telefono = request.getParameter("txtTelefono");
    hora = request.getParameter("txtHora");
    fechahora = request.getParameter("txtFechaHora");
    fecha = request.getParameter("txtFecha");
    edad = request.getParameter("txtEdad");

    String registro = correo + "," + telefono + "," + hora + "," + fechahora + "," + fecha + "," + edad;
%>  
Mensaje: <%="OK SE GRABO CORRECTAMENTE"%></br>
Correo : <%= correo%> </br>
Telefono : <%= telefono%> </br>
Hora : <%= hora%> </br>
Fecha-Hora : <%= fechahora%> </br>
Fecha : <%= fecha%> </br>
Edad : <%= edad%> </br>
<%
    }
%>
