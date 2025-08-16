<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login en Cibertec</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="css/structure.css" rel="stylesheet" type="text/css"/>
</head>
<body class="page-wrapper">

<div class="login-box">
    <form action="usuario" method="post">
        <input type="hidden" name="accion" value="LOGIN"/>

        <fieldset class="boxBody">
            <label>Usuario</label>
            <input type="text" name="usuario" required>

            <label>Password</label>
            <input type="password" name="password" required>
        </fieldset>

        <footer>
            <input type="submit" class="btnLogin" value="Ingresar al Sistema">
        </footer>
    </form>

    <%-- Mostrar error si existe --%>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
    <p class="error-message"><%= error %></p>
    <%
        }
    %>
</div>

</body>
</html>
