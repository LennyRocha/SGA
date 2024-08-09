<%@ page import="mx.edu.utez.integradora.Model.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Iniciar sesión</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/bootstrap.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/StyleLogin.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/StyleFooter.css'>
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
<script>const laAlerta = document.getElementById("alertaa");</script>
<main>
    <div class="wrapper">
        <!--<div class="row">-->
        <div class="col"><div class="container-fluid"></div></div>
        <div class="col-4 offset-4 col-xs-8 offset-2"><!--form-->
            <center>
                <div class="container-fluid" id="logito"><img src="${pageContext.request.contextPath}/IMG/cajaIcon.png" alt="Logo provisional" width="120" height="120"></div>
            </center>
            <div class=" form-container sign-in-container">
                <form action="log_in" method="post" id="miFormulario">
                    <h1 id="tituloLogin">INICIAR SESIÓN AHORA</h1>
                    <div class="form-group mt-3 mb-2">
                        <label for="correo">Correo electrónico:* </label>
                        <div class="">
                            <input class="form-control" id="correo" type="email" name="correo" required placeholder="Ingresa el correo electrónico">
                        </div>
                        <label for="contra">Contraseña:* </label>
                        <div class="">
                            <input class="form-control" id="contra" type="password" name="contra" required placeholder="Ingresa tu contraseña">
                        </div>
                        <a href="RecuperaPass.jsp">¿Olvidaste tu contraseña?</a>
                        <br>
                        <center><p><input class="w-100 btn btn-lg btn btn-info mt-3 mb-0" type="submit" id="enter" value="INICIAR SESIÓN" /></p></center>
                    </div>
                </form>
            </div>
            <br>
            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
            <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
            </symbol>
            <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
            </symbol>
            </svg>
            <%
                HttpSession sesion = request.getSession();
                String mensaje = (String) sesion.getAttribute("mensaje");
                String mensaje2 = (String) sesion.getAttribute("mensaje2");

                if(mensaje!=null){
                    System.out.println(mensaje);%>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                <div>
                    <%=mensaje%>
                </div>
            </div>
            <script>
                const mail = document.getElementById("correo");
                const contra = document.getElementById("contra");
                mail.style.border = '2px solid #E63946';
                mail.style.color = '#E63946';
                contra.style.border = '2px solid #E63946';
                contra.style.color = '#E63946';
            </script>
            <%
                sesion.removeAttribute("mensaje");
                } %>
            <%
                if(mensaje2!=null){
                    System.out.println(mensaje2);%>
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                <div>
                    <%=mensaje2%>
                </div>
            </div>

            <% } %>
        </div>
        <div class="col"><div class="container-fluid"></div></div>
        <!--</div>-->
    </div>
</main>
<br>
<br>
<%
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("mensaje");
    sesion.removeAttribute("mensaje2");
%>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
<jsp:include page="/Templates/Footer.jsp" />
</body>
</html>