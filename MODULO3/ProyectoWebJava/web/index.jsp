<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="persona" class="modelo.Persona" scope="request" />
<jsp:setProperty name="persona" property="nombre" value="Lucía" />
<jsp:setProperty name="persona" property="edad" value="17" />

<html>
<head><title>Index JSP</title></head>
<body>
    <h2>Bienvenida</h2>
    <p>Nombre: <jsp:getProperty name="persona" property="nombre" /></p>
    <p>Edad: <jsp:getProperty name="persona" property="edad" /></p>

    <c:if test="${persona.edad >= 18}">
        <p>Eres mayor de edad.</p>
    </c:if>
    <c:if test="${persona.edad < 18}">
        <p>Eres menor de edad.</p>
    </c:if>

    <c:set var="lenguajes" value="${['Java', 'Python', 'C#']}" />
    <ul>
    <c:forEach var="lang" items="${lenguajes}">
        <li>${lang}</li>
    </c:forEach>
    </ul>
</body>
</html>
