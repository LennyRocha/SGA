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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

    String mensaje = (String) sesion.getAttribute("mensaje");
    String mensaje2 = (String) sesion.getAttribute("mensaje2");

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
    <center><div style="display: none; width: 100%;" id="entradas">
        <% if(ent.isEmpty()){%>
        <center><h1 class="text-success">¡NO HAY ENTRADAS PENDIENTES!</h1></center>
        <%}else{
            for(Entradas e : ent) { %>
        <%int uniqueID = e.getEntrada_id();%>
        <form action="entrada" method="get" id="pendienteE_<%=uniqueID%>">
        <input type="hidden" value="" name="action" id="validator_<%=uniqueID%>">
        <div class="register-card">
            <div class="register-info">
                <p id="fol">Folio: <%=e.getEntrada_folio()%></p>
                <p id="fech">Última modificación: <%=e.getEntrada_fecha()%></p>
            </div>
            <button class="continue-button button-sm" onclick="enviarFormulario('continuar',<%=uniqueID%>)">Continuar registro</button>
            <div class="dropdown">
                <span class="options" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">&#8942;</span>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" onclick="enviarFormulario('quitar',<%=uniqueID%>)">BORRAR</a></li>
                </ul>
            </div>
            <input type="hidden" id="F_<%=uniqueID%>" value="<%=e.getEntrada_folio()%>" name="FolioE">
            <input type="hidden" id="Id_<%=uniqueID%>" value="<%=e.getEntrada_id()%>" name="idEnt">
        </div>
        </form>
        <%}
        }%>
    </div></center>
    <center><div class="align-content-center" style="display: none; width: 100%;" id="salidas">
        <% if(sal.isEmpty()){%>
        <center><h1 class="text-success">¡NO HAY SALIDAS PENDIENTES!</h1></center>
        <%}else{
            for(Salidas s : sal) { %>
        <div class="register-card">
            <div class="register-info">
                <p name="folioS">Folio: <%=s.getSalida_folio()%></p>
                <p name="fechaS">Última modificación: <%=s.getSalida_fecha()%></p>
            </div>
            <button class="continue-button button-sm" onclick="enviarFormularioSalida('continuar')">Continuar registro</button>
            <div class="dropdown">
                <span class="options" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">&#8942;</span>
                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" onclick="quitarFormularioSalida('quitar')">BORRAR</a></li>
                </ul>
            </div>
            <input type="hidden" value="<%=s.getSalida_id()%>" name="idSal">
        </div>
        <%}
        }%>
    </div></center><!---->
    <br>
    <%
        if(mensaje2!=null){%>
    <div class="alert alert-success d-flex align-items-center" role="alert">
        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
        <div>
            <%=mensaje2%>
        </div>
    </div>
    <script>
        Swal.fire({
            title: '¡Exito!',
            text: 'Pendiente eliminado, huevon.',
            icon: 'success',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: '#4A4E69',
            confirmButtonBorderColor: '#4A4E69',
        });
    </script>
    <br>
    <% } %>
    <%if(mensaje!=null){ %>
    <div class="alert alert-danger d-flex align-items-center" role="alert">
        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
        <div>
            <%=mensaje%>
        </div>
    </div>
    <% } %>
    <svg>
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>
</main>
<%
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("mensaje");
    sesion.removeAttribute("mensaje2");
    //sesion.removeAttribute("action");
%>
<script src="${pageContext.request.contextPath}/JS/pendientes.js"></script>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<jsp:include page="/Templates/Footer.jsp" />
</body>
</html>
