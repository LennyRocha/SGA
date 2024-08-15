<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 19/06/2024
  Time: 08:54 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Inicio</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleLogin.css">
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body>
<jsp:include page="/Templates/Header.jsp" />
<main>
    <div class="container-fluid">
        <div class="col"></div>
        <div class="col-8 offset-2">
            <div class="container-fluid border-top" id="contInicio">
                <div class="container-sm">
                    <p style="font-size: 5vw;">MENÚ DEL ALMACÉN</p>
                </div>
                <br>
                <div class="row">
                    <div class="col">
                        <img class="img-fluid" src="IMG/Btn3_Admin.png" alt="Gesionar usuarios">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3 w-100 btn btn-sm" id="btnAdmin" onclick="location.href='gestionUsuario.jsp'">USUARIOS</button>
                    </div>
                    <div class="col">
                        <img class="img-fluid" src="IMG/Btn2_Admin.png" alt="ver historial">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3 w-100 btn btn-sm" id="btnAdmin" onclick="location.href='menuHist.jsp'">HISTORIAL</button>
                    </div>
                    <div class="col">
                        <img class="img-fluid" src="IMG/Btn1_Admin.png" alt="ver almacen">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3 w-100 btn btn-sm" id="btnAdmin" onclick="location.href='almacen.jsp'">ALMACÉN</button>
                    </div>
                    <br>
                    <br>
                    <center><div class="row" id="theRow">
                        <a class="btn btn-info mt- mb-1" id="exit" href="Index.jsp">SALIR</a>
                    </div></center>
                </div>
                <br>
            </div>
        </div>
        <div class="col"></div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
</body>
</html>
