<%@ page import="mx.edu.utez.integradora.Model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 13/07/2024
  Time: 06:36 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Recuperacion</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleRecupera.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleFooter.css">
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body>
<%
    Usuario u = new Usuario();
%>
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
                <form action="recuContra" method="post" id="miFormulario">
                    <label id="textheader" class=" d-flex align-items-center mb-3 mb-md-0 me-md-auto">
                        <img src="IMG/Cajon.png" alt="Logo" width="90" height="90" id="logo">
                        RECUPERA TU CONTRASEÑA
                    </label>
                    <div class="row">
                        <h5 class="mt-4">Podemos ayudarte a reestablecer tu contraseña.</h5>
                        <h5>Primero ingresa tu correo electrónico:</h5>
                    </div>
                    <div class="form-group mt-3 mb-2">
                        <label for="correo">Correo electrónico:* </label>
                        <div class="">
                            <input class="form-control" id="correo" type="email" name="correo" required placeholder="Ingresa el correo electrónico">
                            <input type="hidden" name="nombre" value="<%=u.getNombre_usuario()%>" required>
                        </div>
                        <br>
                        <center><input type="button" class="btn btn-info mt-2 mb-0" onclick="location.href='index.jsp'" id="enter" value="CANCELAR" /><input class="btn btn-info mt-2 mb-0" type="submit" id="enter" value="SIGUIENTE"/></center>
                    </div>
                </form>
                <br>
            </div>
            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </symbol>
                <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                </symbol>
                <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                </symbol>
            </svg>
            <br>
            <%
                HttpSession sesion = (HttpSession) request.getSession();
                String mensaje = (String) sesion.getAttribute("mensaje");
                String mensaje2 = (String) sesion.getAttribute("mensaje2");

                if(mensaje!=null){ %>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                <div>
                    <%=mensaje%>
                </div>
            </div>
            <% } %>
            <%if(mensaje2!=null){ %>
            <div class="alert alert-primary d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg>
                <div>
                    <%=mensaje2%><strong><a href="https://mail.google.com/">Ir a gmail</a></strong>
                </div>
            </div>
            <% } %>
            <div class="col"><div class="container-fluid"></div></div>
        </div>
        <!--</div>-->
    </div>
    <%
        sesion.removeAttribute("usuario");
        sesion.removeAttribute("mensaje");
        sesion.removeAttribute("mensaje2");
    %>
</main>
<br>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
<jsp:include page="/Templates/Footer.jsp" />
</body>
</html>
