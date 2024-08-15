<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 07/07/2024
  Time: 04:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Importar iconos -->
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="bootstrap" viewBox="0 0 118 94">
        <title>Bootstrap</title>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
    </symbol>
    <symbol id="home" viewBox="0 0 16 16" FILL="black">
        <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
    </symbol>
    <symbol id="grid" viewBox="0 0 16 16">
        <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5z"/>
        <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z"/>
        <path d="M10 7a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0zm-6 4a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0zm4-3a1 1 0 0 0-1 1v3a1 1 0 1 0 2 0V9a1 1 0 0 0-1-1"/>
    </symbol>
    <symbol id="table" viewBox="0 0 16 16">
        <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2zm3.564 1.426L5.596 5 8 5.961 14.154 3.5zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464z"/>
    </symbol>
    <symbol id="add" width="20" height="20" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M12.5 16C14.433 16 16 14.433 16 12.5C16 10.567 14.433 9 12.5 9C10.567 9 9 10.567 9 12.5C9 14.433 10.567 16 12.5 16ZM13 11V12H14C14.2761 12 14.5 12.2239 14.5 12.5C14.5 12.7761 14.2761 13 14 13H13V14C13 14.2761 12.7761 14.5 12.5 14.5C12.2239 14.5 12 14.2761 12 14V13H11C10.7239 13 10.5 12.7761 10.5 12.5C10.5 12.2239 10.7239 12 11 12H12V11C12 10.7239 12.2239 10.5 12.5 10.5C12.7761 10.5 13 10.7239 13 11Z" fill="black"/>
        <path d="M11 5C11 6.65685 9.65685 8 8 8C6.34315 8 5 6.65685 5 5C5 3.34315 6.34315 2 8 2C9.65685 2 11 3.34315 11 5ZM8 7C9.10457 7 10 6.10457 10 5C10 3.89543 9.10457 3 8 3C6.89543 3 6 3.89543 6 5C6 6.10457 6.89543 7 8 7Z" fill="black"/>
        <path d="M8.25606 14C8.14314 13.6805 8.06527 13.3445 8.02708 12.9965H3C3.00142 12.7497 3.15375 12.0104 3.8321 11.3321C4.48435 10.6798 5.71088 10 7.99999 10C8.26049 10 8.50723 10.0088 8.74092 10.0254C8.96608 9.68403 9.23648 9.37517 9.54358 9.10733C9.07708 9.03817 8.56399 9 8 9C3 9 2 12 2 13C2 14 3 14 3 14H8.25606Z" fill="black"/>
    </symbol>
    <symbol id="people-circle" viewBox="0 0 16 16">
        <path d="M15 14C15 14 16 14 16 13C16 12 15 9 11 9C7 9 6 12 6 13C6 14 7 14 7 14H15ZM7.02235 13C7.01888 12.9996 7.01403 12.999 7.00815 12.998C7.00538 12.9975 7.00266 12.997 7.00001 12.9965C7.00146 12.7325 7.16687 11.9669 7.75926 11.2758C8.31334 10.6294 9.28269 10 11 10C12.7173 10 13.6867 10.6294 14.2407 11.2758C14.8331 11.9669 14.9985 12.7325 15 12.9965C14.9973 12.997 14.9946 12.9975 14.9919 12.998C14.986 12.999 14.9811 12.9996 14.9777 13H7.02235Z" fill="black"/>
        <path d="M11 7C12.1046 7 13 6.10457 13 5C13 3.89543 12.1046 3 11 3C9.89543 3 9 3.89543 9 5C9 6.10457 9.89543 7 11 7ZM14 5C14 6.65685 12.6569 8 11 8C9.34315 8 8 6.65685 8 5C8 3.34315 9.34315 2 11 2C12.6569 2 14 3.34315 14 5Z" fill="black"/>
        <path d="M6.93593 9.27996C6.56813 9.16232 6.15954 9.07679 5.70628 9.03306C5.48195 9.01141 5.24668 9 5 9C1 9 0 12 0 13C0 13.6667 0.333333 14 1 14H5.21636C5.07556 13.7159 5 13.3791 5 13C5 11.9897 5.37724 10.958 6.08982 10.0962C6.33327 9.80174 6.61587 9.52713 6.93593 9.27996ZM4.92004 10.0005C4.32256 10.9136 4 11.9547 4 13H1C1 12.7393 1.16424 11.97 1.75926 11.2758C2.30468 10.6395 3.25249 10.0197 4.92004 10.0005Z" fill="black"/>
        <path d="M1.5 5.5C1.5 3.84315 2.84315 2.5 4.5 2.5C6.15685 2.5 7.5 3.84315 7.5 5.5C7.5 7.15685 6.15685 8.5 4.5 8.5C2.84315 8.5 1.5 7.15685 1.5 5.5ZM4.5 3.5C3.39543 3.5 2.5 4.39543 2.5 5.5C2.5 6.60457 3.39543 7.5 4.5 7.5C5.60457 7.5 6.5 6.60457 6.5 5.5C6.5 4.39543 5.60457 3.5 4.5 3.5Z" fill="black"/>
    </symbol>
    <symbol id="truck" viewBox="0 0 16 16">
        <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5zm1.294 7.456A2 2 0 0 1 4.732 11h5.536a2 2 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456M12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
    </symbol>
    <symbol id="leave" width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M15.625 5.46875C15.625 5.03728 15.2752 4.6875 14.8437 4.6875L2.34375 4.6875C1.91228 4.6875 1.5625 5.03728 1.5625 5.46875L1.5625 19.5312C1.5625 19.9627 1.91228 20.3125 2.34375 20.3125H14.8438C15.2752 20.3125 15.625 19.9627 15.625 19.5312L15.625 16.4062C15.625 15.9748 15.9748 15.625 16.4062 15.625C16.8377 15.625 17.1875 15.9748 17.1875 16.4062V19.5312C17.1875 20.8257 16.1382 21.875 14.8438 21.875H2.34375C1.04933 21.875 0 20.8257 0 19.5312V5.46875C0 4.17433 1.04933 3.125 2.34375 3.125L14.8437 3.125C16.1382 3.125 17.1875 4.17433 17.1875 5.46875V8.59375C17.1875 9.02522 16.8377 9.375 16.4062 9.375C15.9748 9.375 15.625 9.02522 15.625 8.59375V5.46875Z" fill="black"/>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M6.47882 13.0524C6.17373 12.7473 6.17373 12.2527 6.47882 11.9476L11.1663 7.26007C11.4714 6.95498 11.9661 6.95498 12.2712 7.26007C12.5763 7.56517 12.5763 8.05983 12.2712 8.36493L8.91735 11.7188H22.6562C23.0877 11.7188 23.4375 12.0685 23.4375 12.5C23.4375 12.9315 23.0877 13.2812 22.6562 13.2812H8.91735L12.2712 16.6351C12.5763 16.9402 12.5763 17.4348 12.2712 17.7399C11.9661 18.045 11.4714 18.045 11.1663 17.7399L6.47882 13.0524Z" fill="black"/>
    </symbol>
    <symbol id="cata" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M13 6.5C13 6.22386 12.7761 6 12.5 6H7.5C7.22386 6 7 6.22386 7 6.5C7 6.77614 7.22386 7 7.5 7H12.5C12.7761 7 13 6.77614 13 6.5Z" fill="black"/>
        <path d="M13 9.5C13 9.22386 12.7761 9 12.5 9H7.5C7.22386 9 7 9.22386 7 9.5C7 9.77614 7.22386 10 7.5 10H12.5C12.7761 10 13 9.77614 13 9.5Z" fill="black"/>
        <path d="M12.5 12C12.7761 12 13 12.2239 13 12.5C13 12.7761 12.7761 13 12.5 13H7.5C7.22386 13 7 12.7761 7 12.5C7 12.2239 7.22386 12 7.5 12H12.5Z" fill="black"/>
        <path d="M14 0C15.1046 0 16 0.895431 16 2V14C16 15.1046 15.1046 16 14 16H2C0.895431 16 0 15.1046 0 14V2C0 0.895431 0.895431 0 2 0H14ZM2 1C1.44772 1 1 1.44772 1 2V3H15V2C15 1.44772 14.5523 1 14 1H2ZM1 4V14C1 14.5523 1.44772 15 2 15H4V4H1ZM5 4V15H14C14.5523 15 15 14.5523 15 14V4H5Z" fill="black"/>
    </symbol>
</svg>
<%
    HttpSession sesion = (HttpSession) request.getSession();
    String name = (String) sesion.getAttribute("name");
%>
<header>
    <!-- Header -->
    <div class="navbar-expand-lg">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a id="botoncito" class="content" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                <svg class="img-fluid" width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect y="34.7727" width="45" height="10.2273" rx="5.11364" fill="white"/>
                    <rect y="17.3864" width="45" height="10.2273" rx="5.11364" fill="white"/>
                    <rect width="45" height="10.2273" rx="5.11364" fill="white"/>
                </svg>
            </a>

            <p id="tituloLogin" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto" style="color: white; margin-left: auto;  margin-right: auto">
                <img src="IMG/cajaIcon.png" alt="Logo" width="50" height="50">
                ALMACENNOVA
            </p>

            <div class="col-md-3 text-end">
                <div class="dropstart" id="w">
                    <a class="content" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                        <svg id="bt" width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect y="23.1818" width="30" height="6.81818" rx="3.40909" fill="white"/>
                            <rect y="11.5909" width="30" height="6.81818" rx="3.40909" fill="white"/>
                            <rect width="30" height="6.81818" rx="3.40909" fill="white"/>
                        </svg>
                    </a>
                    <a class="btn btn-outline-warning" href="index.jsp" id="salir">
                        CERRAR SESIÓN
                    </a>
                </div>
            </div>
        </header>
        <!-- Offcanvas -->
    </div>
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <svg class="img-fluid" width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg" id="cursor"
                 data-bs-dismiss="offcanvas">
                <rect y="34.7727" width="45" height="10.2273" rx="5.11364" fill="#FFDF8E"/>
                <rect y="17.3864" width="45" height="10.2273" rx="5.11364" fill="#FFDF8E"/>
                <rect width="45" height="10.2273" rx="5.11364" fill="#FFDF8E"/>
            </svg>
        </div>
        <!-- si --><div class="offcanvas-body">
        <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <rect width="40" height="40" fill="url(#pattern0_115_142)"/>
                <defs>
                    <pattern id="pattern0_115_142" patternContentUnits="objectBoundingBox" width="1" height="1">
                        <use xlink:href="#image0_115_142" transform="scale(0.0111111)"/>
                    </pattern>
                    <image id="image0_115_142" width="90" height="90" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAACXBIWXMAAAsTAAALEwEAmpwYAAACjElEQVR4nO2csWoUURSGP1FimsDWKlZaxC42PoLaaKudlZWa0tbO5BGshOgLaOUTqGmMlY2VYmKpMRACikcGZkAHd7PZnJlz5u7/wd/ssCz349+7c7jLgBBCCCGE+JdFYB3YAb4Ca/VrwpEzwFvAWnkHnJdpH1aAT/+R3GQbuCLZx+MWsD9BcpMD4I5kH52T9R5sR8wT4NQMnzeXLAEvZpDc5BUwil5Edi4AH44huclHYDl6MVm5CnxzkNzkB3AjelHZuAv8dJTc5BfwMHpxGVgENjoQ3M7GFMPNwl8DUfv2ca2+PtghZLMHyU02688cx2F3OdX14oYQ6yg7E4abdpPbqcb+QXF7yiGkq4wbbqZ5b9FDiHWU9nBThOgl4GUCuZOGm8GLvug0hHSVZrgZtOjrwPcEMg/LtINSSlbrgcEKSipOA08TSLGSRY87CbFCkoLLwOcEMqxk0dFDiJUuOtsQYiWKHtU3/DZHGfUtOfsQYh0ON5f6knzN+STEBpbq5OZm15JLHEJshvwGHgEnvAVXpwvPEyzQkuWZ98nL4wSLsqSp3LixnWBBljTVyYxE073oL56i52koscitY6GWrS2EmL8h2JwljOiFm0THSzE1mnBh2jrIHe3RSPRg2qdGI9Hhe6ap0RLtSnRrTY2WaFeiW2tqtES7Et1aU6Ml2pXo1poaLdGuRLfW1GiJdiW6taZGS7Qr0a01NVqiXYluranREu1KdGtNjZZoV6Jba2q0RLsS3VpL/i2RaCSa6NambPRegsVbT9mNFN3nAwItOG8iRT9IIMB6yr3ox/q8TyDBOs5WhmeTnitc9hZwliRUzb5f72Ml/EDuAa/r7SK8yUIIIYQQQgghhBAk4w9m9qGhd3r3SQAAAABJRU5ErkJggg=="/>
                </defs>
            </svg>
            <span class="fs-4" id="saludo"><strong>¡Hola <%=name%>!</strong></span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="Inicio.jsp" id="a" class="nav-link text-white" style="text-align: left;" aria-current="page">
                    <svg class="bi pe-none me-2" width="20" height="20" fill="black"><use xlink:href="#home"/></svg>
                     Menu principal
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="gestionUsuario.jsp" id="b" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20" fill="black"><use xlink:href="#people-circle"/></svg>
                     Usuarios
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="registrarUsuario.jsp" id="c" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20" fill="black"><use xlink:href="#add"/></svg>
                     Agregar usuarios
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="almacen.jsp" id="d" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20" fill="black"><use xlink:href="#table" fill="black"/></svg>
                     Revisar almacen
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="menuHist.jsp" id="e" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20" fill="black"><use xlink:href="#grid" fill="black"/></svg>
                     Consultar historial
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="Catalogo.jsp" id="f" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20"><use xlink:href="#cata"/></svg>
                    Ver Catalogo
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="index.jsp" id="g" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20"><use xlink:href="#leave"/></svg>
                     Salir
                </a>
            </li>
        </ul>
        <hr>
        <p id="copy">© 2024 ALMACENNOVA</p>
        </div>
    </div> <!-- si -->
</header>
<style>
    #cursor{
        cursor: pointer;
    }

    .offcanvas-header{
        background-color: #1E1E1E;
    }

    hr, strong{
        color: #ffffff;
    }

    .offcanvas-body{
        background-color: #3C3C3C;
    }

    #copy{
        color: #D2D2D2;
        font-style: italic;
        text-align: center;
    }

    @media (min-width: 577px) {
        #textheader2{
            text-align: center;
            align-items: center;
            justify-content: center;
        }
        #bt{
            display: none;
        }
        #botoncito{
            margin-left: 10px;
        }
        #perfil
        {
            margin-right: 10px;
        }
    }
    @media (max-width: 576px) {
        #bt{
            display: inline;
        }
        #botoncito{
            display: none;
        }
    }

    .dropdown-divider{
        color: black;
    }
    .dropdown-item:active{
        background-color: #E63946;
    }

    #salir{
        font-style: "inter";
        margin-right: 10px;
        font-weight: bold;
    }

    #salir:hover{
        color: white;
    }

    .dropdown-item{
        font-size: larger;
    }

    /*Enlaces del header*/
    #a{
        background-color: #3C3C3C;
        font-size: larger;
    }

    #a:active{
        background-color: #E63946;
    }

    #a:hover{
        transform: scale(1.1);
        transition: 0.2s;
    }

    #b{
        background-color: #3C3C3C;
        font-size: larger;
    }

    #b:active{
        background-color: #E63946;
    }

    #b:hover{
        transform: scale(1.1);
        transition: 0.2s;
    }

    #c{
        background-color: #3C3C3C;
        font-size: larger;
    }

    #c:active{
        background-color: #E63946;
    }

    #c:hover{
        transform: scale(1.1);
        transition: 0.2s;
    }

    #d{
        background-color: #3C3C3C;
        font-size: larger;
    }

    #d:active{
        background-color: #E63946;
    }

    #d:hover{
        transform: scale(1.1);
        transition: 0.2s;
    }

    #e{
        background-color: #3C3C3C;
        font-size: larger;
    }

    #e:active{
        background-color: #E63946;
    }

    #e:hover{
        transform: scale(1.1);
        transition: 0.2s;
    }

    #f{
        background-color: #3C3C3C;
        font-size: larger;
    }

    #f:active{
        background-color: #E63946;
    }

    #f:hover{
        transform: scale(1.1);
        transition: 0.2s;
    }

    #g{
        background-color: #3C3C3C;
        font-size: larger;
    }

    #g:active{
        background-color: #E63946;
    }

    #g:hover{
        transform: scale(1.1);
        transition: 0.2s;
    }

    #saludo{
        font-size: larger;
    }
    /*Aqui terminan*/
</style>
<!--  Antes de añadir el header, recuerda que solo se cierra dicha etiqueta, body y html NO-->