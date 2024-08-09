<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 08/08/2024
  Time: 05:20 p. m.
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
    <div class="container">
        <main>
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="IMG/cajaIcon.png" alt="" width="75" height="60">
                <h2>MI ALMACEN</h2>
                <p class="lead">Consulta el estado del almacén desde la última fecha de corte.</p>
            </div>

            <div class="row g-5">
                <div class="col-md-5 col-lg-4 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-success">RESUMEN</span>
                        <span class="badge bg-success rounded-pill">i</span>
                    </h4>
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Total de productos</h6>
                                <small class="text-muted">Productos disponibles</small>
                            </div>
                            <span class="text-muted">15</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Ingresos</h6>
                                <small class="text-muted">En entradas</small>
                            </div>
                            <span class="text-muted">$8</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Egresos</h6>
                                <small class="text-muted">En salidas</small>
                            </div>
                            <span class="text-muted">$5</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">Fecha de corte</h6>
                                <small class="text-muted">Más reciente</small>
                            </div>
                            <span class="text-muted">08/08/24</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between text-success">
                            <span>Total (MXN)</span>
                            <strong class="text-success">$220</strong>
                        </li>
                    </ul>

                    <div>
                        <form class="card p-2">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Buscar por fecha"/>
                                <input type="submit" class="btn btn-secondary" value="Buscar"/>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-7 col-lg-8">
                    <h4 class="mb-3">PRODUCTOS ALMACENADOS</h4>
                    <form class="needs-validation" novalidate>
                        <div class="row g-3">
                            <table class="table table-striped table-hover">
                                <thead class="table-dark">
                                <th>Nombre del producto</th>
                                <th>Precio Unitario</th>
                                <th>Unidades disp</th>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>Gansito</td>
                                    <td>20 MXN</td>
                                    <td>5</td>
                                </tr>
                                <tr>
                                    <td>Pinguinos marinela</td>
                                    <td>25 MXN</td>
                                    <td>2</td>
                                </tr>
                                <tr>
                                    <td>Rebanadas bimbo</td>
                                    <td>10 MXN</td>
                                    <td>8</td>
                                </tr>
                                </tbody>
                            </table>

                            <hr class="my-4">

                            <button class="w-100 btn btn-outline-warning btn-lg" id="salir">GENERAR REPORTE</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
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
