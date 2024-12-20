<%@ page import="mx.edu.utez.integradora.Dao.ProductoDao" %>
<%@ page import="mx.edu.utez.integradora.Model.Producto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %><%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 15/08/2024
  Time: 12:02 p. m.
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
    //String estadoUsuario = (String) sesion.getAttribute("tipoUsuario");
    LocalDate fechaActual = LocalDate.now();
    Producto prod = (Producto) sesion.getAttribute("datosAlmacen");
    double totEnt = (double) sesion.getAttribute("totalEntrada");
    double totSal = (double) sesion.getAttribute("totalSalida");
%>
<jsp:include page="/Templates/Header.jsp" />
<div class="container">
    <main>
        <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="IMG/cajaIcon.png" alt="" width="85" height="85">
            <h2>MI ALMACEN</h2>
            <p class="lead">Consulta el estado del almacén desde la última fecha de corte.</p>
        </div>

        <div class="row g-5">
            <div class="col-md-5 col-lg-4 order-md-last">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-success">RESUMEN</span>
                    <span data-bs-toggle="tooltip" data-bs-placement="top" title="La siguiente lista muestra los ultimos movimientos dentro del almacén">
                        <span class="badge bg-success rounded-pill">i</span>
                    </span>
                </h4>
                <ul class="list-group mb-3">
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Total de productos</h6>
                            <small class="text-muted">Productos disponibles</small>
                        </div>
                        <span class="text-muted"><%=prod.getProducto_cantidad()%></span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Ingresos</h6>
                            <small class="text-muted">En entradas</small>
                        </div>
                        <span class="text-muted"><%=totEnt%> MXN</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Egresos</h6>
                            <small class="text-muted">En salidas</small>
                        </div>
                        <span class="text-muted"><%=totSal%> MXN</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Fecha de corte</h6>
                            <small class="text-muted">Más reciente</small>
                        </div>
                        <span class="text-muted"><%=fechaActual%></span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between text-success">
                        <span>Total (MXN)</span>
                        <strong class="text-success"><%=prod.getProducto_precio()%></strong>
                    </li>
                </ul>

                <form class="card p-2">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Buscar por nombre" id="miInput">
                        <button type="button" class="btn btn-secondary" id="miBoton">Borrar</button>
                    </div>
                </form>
            </div>
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">PRODUCTOS ALMACENADOS</h4>
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="overflow-scroll">
                        <table class="table table-striped table-hover" id="miTabla">
                            <thead class="table-dark">
                            <th>Nombre del producto</th>
                            <th>Precio Unitario</th>
                            <th>Unidades disp</th>
                            </thead>
                            <tbody>
                            <%
                                ProductoDao dao = new ProductoDao();
                                ArrayList<Producto> lista = dao.getAll();
                                if(lista.isEmpty()){%>
                            <h1>NO HAY PRODUCTOS DISPONIBLES EN EL CATÁLOGO</h1>
                            <%}else{
                                for(Producto pr : lista){
                            %>
                            <tr>
                                <td><%=pr.getProducto_nombre()%></td>
                                <td><%=pr.getProducto_precio()%></td>
                                <td><%=pr.getProducto_cantidad()%></td>
                            </tr>
                            <%}
                            }%>
                            </tbody>
                        </table>
                        </div>

                        <hr class="my-4">

                        <a class="w-100 btn btn-outline-warning btn-lg" id="salir" href="Inicio.jsp">VOLVER</a>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
<br>
<br>
<footer class="footer mt-auto py-3 text-white-50 bg-gradient" style="background-color: #1D3557;">
    <div class="container">
        <span class="text-white">Patrocinado por: <strong><a href="http://www.utez.edu.mx/" class="text-white">© UTEZ</a></strong></span>
    </div>
</footer>
<%
    sesion.removeAttribute("datosAlmacen");
%>
<script src="${pageContext.request.contextPath}/JS/verAlmacen.js"></script>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>
