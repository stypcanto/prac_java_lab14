<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mensaje del Sistema</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/structure.css" rel="stylesheet" type="text/css">
</head>
<body class="page-wrapper">

<div class="page-message">
    <h3>Mensaje del Sistema</h3>

    <h4>
        Bienvenido, ${usuario.username} 👋
    </h4>

    <p>
        <strong>ID Usuario:</strong> ${usuario.idUsuario}<br>
    </p>

    <p>
        <a href="index.jsp">Volver al inicio</a>
    </p>
</div>

</body>
</html>
