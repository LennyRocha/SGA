<%@ page import="mx.edu.utez.integradora.Dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Model.Usuario" %>
<%@ page import="mx.edu.utez.integradora.Dao.EntradasDao" %>
<%@ page import="mx.edu.utez.integradora.Model.Entradas" %>
<%@ page import="mx.edu.utez.integradora.Dao.SalidaDao" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="mx.edu.utez.integradora.Model.Salidas" %><%--
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
<%
    HttpSession sesion = (HttpSession) request.getSession();

    EntradasDao eDao = new EntradasDao();
    ArrayList<Entradas> ent = eDao.getAllUnfinished();

    SalidaDao sDao = new SalidaDao();
    ArrayList<Salidas> sal = sDao.getAllUnfinished();
%>
<span data-bs-toggle="tooltip" data-bs-placement="top" title="Regresar">
    <button id="back" onclick="location.href='InicioAlmacenista.jsp'" class="btn btn-outline-primary"><img src="IMG/Back.png" class="img-fluid" width="40" height="40"></button>
</span>
<main class="main-content">
    <h2>REGISTROS PENDIENTES</h2>
    <br>
    <nav aria-label="breadcrumb">
        <h5><ul class="breadcrumb">
            <li data-value="1"><a href="#" onclick="selectBreadcrumb(this)">Entradas</a><input type="hidden" value="1" id="1"></li>
            <li data-value="2"><a href="#" onclick="selectBreadcrumb(this)">Salidas</a><input type="hidden" value="2" id="2"></li>
        </ul></h5>
    </nav>
    <br>
    <!--<input type="text" id="selectedBreadcrumbValue" value="" name="selector" readonly/>-->
    <br>
    <div class="overflow-auto" style="display: none" id="entradas">
        <% if(ent.isEmpty()){%>
        <h1 class="text-success">¡NO HAY ENTRADAS PENDIENTES!</h1>
        <%}else{
            for(Entradas e : ent) { %>
        <div class="register-card">
            <div class="register-info">
                <p>Folio: <%=e.getEntrada_folio()%></p>
                <p>Última modificación: <%=e.getEntrada_fecha()%></p>
            </div>
            <button class="continue-button button-sm">Continuar registro</button>
            <div class="dropdown">
                <span class="options" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">&#8942;</span>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="#">BORRAR</a></li>
                </ul>
            </div>
        </div>
        <%}
        }%>
    </div>
    <div class="overflow-auto" style="display: none" id="salidas">
        <% if(sal.isEmpty()){%>
        <h1 class="text-success">¡NO HAY SALIDAS PENDIENTES!</h1>
        <%}else{
            for(Salidas s : sal) { %>
        <div class="register-card">
            <div class="register-info">
                <p>Folio: <%=s.getSalida_folio()%></p>
                <p>Última modificación: <%=s.getSalida_fecha()%></p>
            </div>
            <button class="continue-button button-sm">Continuar registro</button>
            <div class="dropdown">
                <span class="options" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">&#8942;</span>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="#">BORRAR</a></li>
                </ul>
            </div>
        </div>
        <%}
        }%>
    </div>
</main>
<%
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("mensaje");
    sesion.removeAttribute("mensaje2");
%>
<script src="${pageContext.request.contextPath}/JS/pendientes.js"></script>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<jsp:include page="/Templates/Footer.jsp" />
</body>
</html>
