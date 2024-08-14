<%@ page import="mx.edu.utez.integradora.Dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Model.Usuario" %><%--
<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 01/08/2024
  Time: 03:24 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Registros pendientes</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/pendientes.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleHeader.css">
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body>
<jsp:include page="/Templates/Header2.jsp" />
<button id="back" onclick="location.href='InicioAlmacenista.jsp'" class="btn btn-outline-primary"><img src="IMG/Back.png" class="img-fluid" width="40" height="40"></button>
<main class="main-content">
    <h2 style="background-color: #BABABA;">REGISTROS PENDIENTES</h2>
    <br>
    <div class="register-card">
        <div class="register-info">
            <p>Folio: XXXXXXX</p>
            <p>Última modificación: xx/xx/xxxx</p>
            <p>Tipo: xxxxx</p>
        </div>
        <button class="continue-button button-sm">Continuar registro</button>
        <span class="options">&#8942;</span>
    </div>
    <div class="register-card">
        <div class="register-info">
            <p>Folio: XXXXXXX</p>
            <p>Última modificación: xx/xx/xxxx</p>
            <p>Tipo: xxxxx</p>
        </div>
        <button class="continue-button button-sm">Continuar registro</button>
        <span class="options">&#8942;</span>
    </div>
    <div class="register-card">
        <div class="register-info">
            <p>Folio: XXXXXXX</p>
            <p>Última modificación: xx/xx/xxxx</p>
            <p>Tipo: xxxxx</p>
        </div>
        <button class="continue-button button-sm">Continuar registro</button>
        <span class="options">&#8942;</span>
    </div>
    <br>
</main>
<%
    //Poner arriba más tarde
    HttpSession sesion = (HttpSession) request.getSession();

    sesion.removeAttribute("usuario");
    sesion.removeAttribute("mensaje");
    sesion.removeAttribute("mensaje2");
%>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
<jsp:include page="/Templates/Footer.jsp" />
</body>
</html>
