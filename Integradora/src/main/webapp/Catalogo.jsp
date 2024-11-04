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
    <title>Ver catalogo</title>
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
    <div class="container-sm">
        <center><h1 style="letter-spacing: .5em;">CATÁLOGO DE PRODUCTOS</h1></center>
    </div>
    <br>
    <%
        String mensaje = (String) sesion.getAttribute("mensaje");
        String mensaje2 = (String) sesion.getAttribute("mensaje2");

        ProductoDao dao = new ProductoDao();
        ArrayList<Producto> lista = dao.verCatalogo();
        int count = 0;
    %>
    <div class="container">
        <div class="overflow-auto">
        <div class="row">
            <% for(Producto p : lista) { %>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=p.getProducto_nombre()%></h5>
                        <p class="card-text">Precio: <%=p.getProducto_precio()%> MXN</p>
                        <p class="card-text">Cantidad: <%=p.getProducto_cantidad()%></p>
                        <%if(p.getProducto_cantidad() == 0){%>
                            <span class="badge bg-danger">No diponible por el momento</span>
                        <%}else{%>
                            <span class="badge bg-primary">Disponible</span>
                        <%}%>
                    </div>
                </div>
            </div>
            <style>
                @media (max-width: 575px) {
                    .card{
                        <%if (count == 1){%>
                           margin-bottom: 60px;
                        <%}%>
                    }
                }
            </style>
            <%
                count++;
                if(count % 2 == 0) {
            %>
        </div><br><div class="row">
        <%
                }
            }
        %>
        </div>
        </div>
    </div>
</div>
<br>
<footer class="footer mt-auto py-3 text-white-50 bg-gradient" style="background-color: #1D3557;">
    <div class="container">
        <span class="text-white">Patrocinado por: <strong><a href="http://www.utez.edu.mx/" class="text-white">© UTEZ</a></strong></span>
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
