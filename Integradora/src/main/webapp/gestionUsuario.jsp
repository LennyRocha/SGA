<%@ page import="mx.edu.utez.integradora.Dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 21/06/2024
  Time: 02:47 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Usuarios</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/datatables.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleLogin.css">
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/StyleUser.css'>
    <link rel="apple-touch-icon" sizes="180x180" href="ICONOS/android-chrome-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body bgcolor="#F1FAEE">
<jsp:include page="/Templates/Header.jsp" />
<%
    HttpSession sesion = (HttpSession) request.getSession();
    String mensaje = (String) sesion.getAttribute("mensaje");
    String mensaje2 = (String) sesion.getAttribute("mensaje2");
%>
<div class="overflow-auto">
<table id="example" class="table table-striped table-hover table-bordered table-responsive-sm" style="width: 100%">
    <thead id="theadx" style="background-color:  #595959;  align-items: center; color: white;">
    <tr>
        <th>id</th>
        <th>nombre</th>
        <!--<th>contraseña</th>-->
        <th>correo</th>
        <th>tipo</th>
        <th>estado</th>
        <th>actualizar</th>
        <th>eliminar</th>
    </tr>
    </thead>
    <tbody>
    <%
        String puesto = "";
        String statuss = "";
        UsuarioDao dao = new UsuarioDao();
        ArrayList<Usuario> lista = dao.getAll();
        for(Usuario u : lista){
            //Su tipo
            if (u.getTipo_usuario() == 1){
                puesto = "Administrador";
            } else if (u.getTipo_usuario() == 2) {
                puesto = "Almacenista";
            }
            //Su estatus
            if (u.isEstado()){
                statuss = "Activo";
            }
            else{
                statuss = "Inactivo";
            }
    %>
    <tr>
        <td><%=u.getId()%></td>
        <td><%=u.getNombre_usuario()%></td>
        <!--<td><%=u.getContra()%></td>-->
        <td><%=u.getCorreo()%></td>
        <td><%=puesto%></td>
        <td><%=statuss%></td>
        <!-- Tipo <td><%=u.getTipo_usuario()%></td>-->
        <!-- Estado <td><%=u.isEstado()%></td>-->
        <td><a class="btn btn-outline-warning" id="modificarA<%=u.getNombre_usuario()%>" href="log_in?id=<%=u.getId()%>">Modificar</a></td>
        <% if (statuss == "Activo"){ %>
            <td><a class="btn btn-outline-danger" id="deshabilitarA<%=u.getNombre_usuario()%>" href="delete?id=<%=u.getId()%>">Deshabilitar</a></td>
        <%} else {%>
            <td><a class="btn btn-outline-success" id="rehabilitarA<%=u.getNombre_usuario()%>" href="revive?id=<%=u.getId()%>">Rehabilitar</a></td>
        <%}%>
    </tr>
    <% } %>
    </tbody>
</table>
</div>
<br>
<center><h1 class="featurette-heading fw-normal lh-1" id="tit">
    MENÚ DE USUARIOS
    <br>
    <a href="registrarUsuario.jsp <%sesion.removeAttribute("usuario");%>" class="btn btn-outline-dark" id="addUser">Agregar usuario</a> <a href="Inicio.jsp" class="btn btn-outline-dark" id="getBack">Regresar</a>
</h1></center>
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
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const table = document.getElementById("example");
        new DataTable(table, {
            language: {
                url: '${pageContext.request.contextPath}/JS/es-MX.json'
            }
        })
    });
</script>
<%
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("mensaje");
    sesion.removeAttribute("mensaje2");
%>
<script src="${pageContext.request.contextPath}/JS/sweetAlert.js"></script>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/JS/dataTables.bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/JS/datatables.js"></script>
<script src="${pageContext.request.contextPath}/JS/es-MX.json"></script>
</body>
</html>