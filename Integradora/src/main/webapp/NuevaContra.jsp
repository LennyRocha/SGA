<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 13/07/2024
  Time: 06:45 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Nueva contraseña</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleRecupera.css">
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body>
<%
    HttpSession sesion = (HttpSession) request.getSession();
    String codigo = (String) sesion.getAttribute("codigo");
    String nomUsu = (String) sesion.getAttribute("name");
    String correo = (String) sesion.getAttribute("correo");
%>
<body>
<!-- Quitar despues -->
<header class="container-fluid">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <p class="container-fluid" id="textheader2">
                <img src="IMG/cajaIcon.png" alt="Logo" width="60" height="60">
                GESTIÓN DE ALMACÉN
            </p>
        </div>
    </nav>
</header>
<!-- Quitar despues -->
<main>
    <br>
    <div class="wrapper">
        <!--<div class="row">-->
        <div class="col"><div class="container-fluid"></div></div>
        <div class="col-5 col-xs-6 offset-2 col-sm-4 offset-2 col-md-4 offset-2 col-lg-8 offset-2 col-xl-4 offset-4"><!--form-->
            <center>
                <div class="container-fluid"><img src="IMG/cajaIcon.png" alt="Logo provisional" width="120" height="120" id="logos"></div>
            </center>
            <div class=" form-container sign-in-container">
                <form action="updateContra" method="post" id="miFormulario">
                    <label id="textheader3" class=" d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                        <img src="IMG/Cajon.png" alt="Logo" width="100" height="100" id="logo">
                        NUEVA CONTRASEÑA
                    </label>
                    <div class="row">
                        <h5 class="mt-4">Se ha comprobado tu correo electrónico <strong><%=nomUsu%></strong>, para finalizar, ingresa tu nueva contraseña:</h5>
                    </div>
                    <div class="form-group mt-3 mb-2">
                        <label for="correo">Nueva contraseña:* </label>
                        <div class="">
                            <input class="form-control" id="correo" type="password" name="nuevaContra" required placeholder="Ingresa tu nueva contraseña">
                            <input type="hidden" name="nombre" value="<%=nomUsu%>">
                            <input type="hidden" name="codigo" value="<%=codigo%>">
                            <input type="hidden" name="correo" value="<%=correo%>">
                        </div>
                        <br>
                        <center><input type="hidden" class="btn btn-info mt-2 mb-0" href="../EjemplosIntegra.html" id="enter" value="CANCELAR" /><input class="btn btn-info mt-2 mb-0" type="submit" id="enter" value="CAMBIAR"/></center>
                    </div>
                </form>
            </div>
        </div>
        <div class="col"><div class="container-fluid"></div></div>
        <!--</div>-->
    </div>
</main>
<%
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("codigo");
    sesion.removeAttribute("name");
    sesion.removeAttribute("correo");
%>
<br>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
</body>
</html>
