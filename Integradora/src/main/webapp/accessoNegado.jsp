<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 16/08/2024
  Time: 12:14 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <title>Error</title>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/bootstrap.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/StyleLogin.css'>
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body>
<header class="container-fluid bg-gradient">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <p class="container-fluid" id="tituloLogin" style="color: white">
                <img src="IMG/cajaIcon.png" alt="Logo" width="60" height="60">
                ERROR 401
            </p>
        </div>
    </nav>
</header>
<div class="container-sm">
    <center>
        <img src="IMG/Denegao.png" class="img-fluid" width="400" height="400" alt="Imagen de error">
        <br>
        <h1 id="tituloLogin">¡SE LE HA NEGADO EL ACCESO!</h1>
        <br>
        <p>No posee las credenciales para acceder a esta página</p>
        <br>
    </center>
</div>
<center><h6><a href="index.jsp">PULSA AQUI PARA SALIR</a></h6></center>
</body>
</html>

