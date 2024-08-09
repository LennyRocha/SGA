<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 28/07/2024
  Time: 04:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
<header class="container-fluid">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <p class="container-fluid" id="tituloLogin" style="color: white">
                <img src="IMG/cajaIcon.png" alt="Logo" width="60" height="60">
                GESTIÓN DE ALMACÉN
            </p>
        </div>
    </nav>
</header>
    <div class="container-sm">
        <center>
        <img src="IMG/Denegao.png" class="img-fluid" width="300" height="300" alt="Imagen de error">
        <br>
        <p style="font-size: 4vw;">ERROR 403</p>
        <br>
        <h1 id="tituloLogin">¡YOU, SHALL NOT PASS!</h1>
        <br>
        <h5>Se te ha bloqueado el acceso a esta página</h5>
        </center>
    </div>
    <center><h6><a href="InicioAlmacenista.jsp">PULSA AQUI PARA REGRESAR AL MENÚ PRINCIPAL</a></h6></center>
</body>
</html>
