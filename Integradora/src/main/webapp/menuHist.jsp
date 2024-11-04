<%@ page import="mx.edu.utez.integradora.Model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 06/08/2024
  Time: 10:16 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Menú historial</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleSmall.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleLogin.css">
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/StyleFooter.css'>
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
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
<main>
    <div class="container-fluid">
        <div class="flex-column mx-auto" style="max-width: 718px">
            <div class="container-fluid" id="contIniciox">
                <div class="container-sm">
                    <p class="fs-1">VER HISTORIAL</p>
                </div>
                <div class="row mx-auto">
                    <div class="card text-center" style="width: 18rem; border: none">
                        <img src="IMG/Btn1_Hist.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <a href="HistEntrada.jsp" class="btn btn-primary" style="color:#000; background-color: #D9D9D9; border-color:#D9D9D9;">ENTRADAS</a>
                        </div>
                    </div>
                    <div class="card" style="width: 18rem; border: none">
                        <img src="IMG/Btn2_Hist.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <a class="btn btn-primary" style="color:#000; background-color: #D9D9D9; border-color:#D9D9D9;" href="HistSalida.jsp">SALIDAS</a>
                        </div>
                    </div>
                </div>
                </div>
            <br>
            <br>
                <div class="row" id="theRow">
                    <a class="btn btn-info mt- mb-1" id="exit" href="<%=ruta%>">VOLVER</a>
                </div>
            </div>
            <br>
            <br>
        </div>
</main>
<br>
<br>
<br>
<jsp:include page="/Templates/Footer.jsp" />
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
</body>
</html>
