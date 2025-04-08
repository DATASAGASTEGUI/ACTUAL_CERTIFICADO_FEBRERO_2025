<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="">
            <p>1. Campo de texto normal: <input type="text" name="txtNombre" /></p>

            <p>2. Campo de texto secreto: <input type="password" name="pasClave" /></p>

            <p>3. Boton radio de selección simple:        
                <input type="radio" name="radGenero" value="M" /> Male
                <input type="radio" name="radGenero" value="F" /> Female</p>

            <p>4. Caja check de selección simple:
                <input type="checkbox" name="chbAceptar" />Autoriza acceder a sus datos personales?</p>

            <p>5. Caja check de selección multiple:
                <input type="checkbox" name="chbPasatiempo" value="Ajedrez" /> Ajedrez
                <input type="checkbox" name="chbPasatiempo" value="Televisión" /> Televisión
                <input type="checkbox" name="chbPasatiempo" value="Cine" /> Cine
                <input type="checkbox" name="chbPasatiempo" value="Lectura" /> Lectura</p>

            <p>6. Combo de selección simple:
                <select name="cboCodigoPais" size="1">
                    <option selected>Seleccionar</option>
                    <option value="CL">Chile</option>
                    <option value="PE">Perú</option>
                    <option value="ES">España</option>
                    <option value="MX">Mexico</option>
                    <option value="UK">Inglaterra</option>
                </select></p>

            <p>7. Lista de selección multiple:
                <select name="lstMascota" multiple="true" size="3">
                    <option value="Gato">Gato</option>
                    <option value="Perro">Perro</option>
                    <option value="Cobaya">Cobaya</option>
                    <option value="Hamster">Hamster</option>
                    <option value="Cerdo">Cerdo</option>
                </select></p>

            <p>8. Area de texto: <textarea name="txaMensaje"></textarea></p>

            <p>9. Submit button: <input type="submit" name="accion" value="Enviar" /></p>
        </form>
    </body>
</html>


<%
    if (request.getParameter("accion") != null) {
        String nombre = request.getParameter("txtNombre");
        if (nombre.length() > 0) {
            out.println("1. Nombre: " + nombre + "</br>");
        } else {
            out.println("1. Campo texto nombre vacio" + "</br>");
        }

        String password = request.getParameter("pasClave");
        if (password.length() > 0) {
            out.println("2. Password: " + password + "</br>");
        } else {
            out.println("2. Campo password vacio" + "</br>");
        }

        String genero = request.getParameter("radGenero");
        if (genero == null) {
            out.println("3. Boton radio genero no seleccionado" + "</br>");
        } else {
            out.println("3. Genero: " + genero + "</br>");
        }

        String aceptar = request.getParameter("chbAceptar");
        if (aceptar == null) {
            out.println("4. CheckBox aceptar no seleccionado" + "</br>");
        } else {
            out.println("4. Aceptar: " + aceptar + "</br>");
        }

        String[] pasatiempo = request.getParameterValues("chbPasatiempo");
        if (pasatiempo != null) {
            for (int i = 0; i < pasatiempo.length; i++) {
                out.print("5. Pasatiempo: " + pasatiempo[i] + "</br>");
            }
        } else {
            out.println("5. CheckBox pasatiempo no seleccionado" + "</br>");
        }

        String codigoPais = request.getParameter("cboCodigoPais");
        if (codigoPais.equalsIgnoreCase("Seleccionar")) {
            out.println("5. ComboBox codigo de pais no seleccionado" + "</br>");
        } else {
            out.println("5. Código de pais: " + codigoPais + "</br>");
        }

        String[] mascota = request.getParameterValues("lstMascota");
        if (mascota != null) {
            for (int i = 0; i < mascota.length; i++) {
                out.println("6. Mascota: " + mascota[i] + "</br>");
            }
        } else {
            out.println("6. Lista de mascotas no seleccionado" + "</br>");
        }

        String mensaje = request.getParameter("txaMensaje");
        if (mensaje.length() > 0) {
            out.println("7. Mensaje: " + mensaje + "</br>");
        } else {
            out.println("7. Area de texto mensaje vacio" + "</br>");
        }

        String accion = request.getParameter("accion");
        if (accion != null) {
            out.println("8. Acción: " + accion + "</br>");
        } else {
            out.println("8. Botón enviar no presionado" + "</br>");
        }
    }
%>


