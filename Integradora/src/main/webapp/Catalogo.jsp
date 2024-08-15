<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 14/08/2024
  Time: 11:05 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Ver almacen</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.min.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleVerAlmacen.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleLogin.css">
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body>
<jsp:include page="/Templates/Header.jsp" />
    <div class="container-sm" style="max-width: 960px">
        <center><h1>CATÁLOGO</h1></center>
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Gansito Marinela</h5>
                        <p class="card-text">Precio: $20</p>
                        <p class="card-text">Cantidad: 5</p>
                        <a href="#" class="btn btn-primary" disabled="true">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Pinguinos Marinela</h5>
                        <p class="card-text">Precio: $25</p>
                        <p class="card-text">Cantidad: 2</p>
                        <a href="#" class="btn btn-primary" disabled="true">Ver</a>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Rebanadas Bimbo</h5>
                        <p class="card-text">Precio: $10</p>
                        <p class="card-text">Cantidad: 8</p>
                        <a href="#" class="btn btn-primary" disabled="true">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Nito Bimbo</h5>
                        <p class="card-text">Precio: $19</p>
                        <p class="card-text">Cantidad: 1</p>
                        <a href="#" class="btn btn-primary" disabled="true">Ver</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<br>
<footer class="footer mt-auto py-3 text-white-50" style="background-color: #1D3557;">
    <div class="container">
        <span class="text-muted">Cover template for <a href="https://getbootstrap.com/" class="text-white">Bootstrap</a>, by <a href="https://twitter.com/mdo" class="text-white">@mdo</a>.</span>
    </div>
</footer>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
</body>
</html>
