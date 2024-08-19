<!DOCTYPE html>
<html lang="es-MX">
<title>Error 404</title>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/bootstrap.css'>
<link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/CSS/StyleLogin.css'>
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
    } else if (type == 2) {
        ruta = "InicioAlmacenista.jsp";
    }
%>
<header class="container-fluid bg-gradient">
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <p class="container-fluid" id="tituloLogin" style="color: white">
                <img src="IMG/cajaIcon.png" alt="Logo" width="60" height="60">
                ERROR 404
            </p>
        </div>
    </nav>
</header>
<div class="container-sm">
    <center>
        <img src="IMG/404.gif" class="img-fluid" width="400" height="400" alt="Imagen de error">
        <br>
        <h1 id="tituloLogin">¡PAGINA NO ENCONTRADA!</h1>
        <br>
    </center>
</div>
<center><h6><a href="<%=ruta%>">VOLVER AL MENU PRINCIPAL</a> <a href="InicioAlmacenista.jsp">CRERRAR SESION</a></h6></center>
</body>
</html>