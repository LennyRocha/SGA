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
    <title>Inicio</title>
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
        <div class="col"></div>
        <div class="col-8 offset-2">
            <div class="container-fluid" id="contIniciox">
                <div class="container-sm">
                    <p style="font-size: 5vw;">VER HISTORIAL</p>
                </div>
                <div class="row">
                    <div class="col">
                        <img class="img-fluid" class="img-thumbnail" src="IMG/Btn1_Hist.png" alt="Gesionar usuarios">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3 w-100 btn btn-md" id="btnAdmin">ENTRADAS</button>
                    </div>
                    <div class="col">
                        <img class="img-fluid" class="img-thumbnail" src="IMG/Btn2_Hist.png" alt="ver historial">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3 w-100 btn btn-md" id="btnAdmin">SALIDAS</button>
                    </div>
                    <br>
                    <br>
                </div>
                <div class="row" id="theRow">
                    <a class="btn btn-info mt- mb-1" id="exit" href="<%=ruta%>">VOLVER</a>
                </div>
            </div>
            <br>
            <br>
        </div>
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
