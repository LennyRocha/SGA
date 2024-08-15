<%@ page import="mx.edu.utez.integradora.Dao.ProductoDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Model.Producto" %><%--
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
<%
    HttpSession sesion = (HttpSession) request.getSession();
    int type = (int) sesion.getAttribute("type");
    String ruta = "";
    if (type == 1){
        ruta = "Inicio.jsp";
%>
<jsp:include page="/Templates/Header.jsp" />
<script>
    document.body.style.backgroundColor = "#F1FAEE";
</script>
<%} else if (type == 2) {
    ruta = "InicioAlmacenista.jsp";
%>
<jsp:include page="/Templates/Header2.jsp" />
<script>
    document.body.style.backgroundColor = "#F2E9E4";
</script>
<%}%>
<span data-bs-toggle="tooltip" data-bs-placement="top" title="Regresar">
    <button id="back" onclick="location.href='<%=ruta%>'" class="btn btn-outline-primary btn-lg" style="margin-left: 10px"><img src="IMG/Back.png" class="img-fluid" width="40" height="40"></button>
</span>
<div class="container-sm" style="max-width: 960px">
    <center><p style="font-size: 5vw;">CATÁLOGO</p></center>
<%
    String mensaje = (String) sesion.getAttribute("mensaje");
    String mensaje2 = (String) sesion.getAttribute("mensaje2");

    ProductoDao dao = new ProductoDao();
    ArrayList<Producto> lista = dao.verCatalogo();
    for(Producto p : lista){
%>
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=p.getProducto_nombre()%></h5>
                        <p class="card-text">Precio: <%=p.getProducto_precio()%> MXN</p>
                        <p class="card-text">Cantidad: <%=p.getProducto_cantidad()%></p>
                        <a href="#" class="btn btn-primary" style="pointer-events: none;">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=p.getProducto_nombre()%></h5>
                        <p class="card-text">Precio: <%=p.getProducto_precio()%> MXN</p>
                        <p class="card-text">Cantidad: <%=p.getProducto_cantidad()%></p>
                        <a href="#" class="btn btn-primary" style="pointer-events: none;">Ver</a>
                    </div>
                </div>
            </div>
        </div>
        <br>
    <%}%>
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Gansito Marinela</h5>
                        <p class="card-text">Precio: $20</p>
                        <p class="card-text">Cantidad: 5</p>
                        <a href="#" class="btn btn-primary" style="pointer-events: none;">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Pinguinos Marinela</h5>
                        <p class="card-text">Precio: $25</p>
                        <p class="card-text">Cantidad: 2</p>
                        <a href="#" class="btn btn-primary" style="pointer-events: none;">Ver</a>
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
                        <a href="#" class="btn btn-primary" style="pointer-events: none;">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Nito Bimbo</h5>
                        <p class="card-text">Precio: $19</p>
                        <p class="card-text">Cantidad: 1</p>
                        <a href="#" class="btn btn-primary" style="pointer-events: none;">Ver</a>
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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    });
</script>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
</body>
</html>
