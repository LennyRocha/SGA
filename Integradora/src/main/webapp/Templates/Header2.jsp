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
    <symbol id="home" viewBox="0 0 17 17">
        <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
    </symbol>
    <symbol id="minus" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M5.5 10C5.5 9.72386 5.72386 9.5 6 9.5H10C10.2761 9.5 10.5 9.72386 10.5 10C10.5 10.2761 10.2761 10.5 10 10.5H6C5.72386 10.5 5.5 10.2761 5.5 10Z" fill="black"/>
        <path d="M8 1C9.38071 1 10.5 2.11929 10.5 3.5V4H5.5V3.5C5.5 2.11929 6.61929 1 8 1ZM11.5 4V3.5C11.5 1.567 9.933 0 8 0C6.067 0 4.5 1.567 4.5 3.5V4H1V14C1 15.1046 1.89543 16 3 16H13C14.1046 16 15 15.1046 15 14V4H11.5ZM2 5H14V14C14 14.5523 13.5523 15 13 15H3C2.44772 15 2 14.5523 2 14V5Z" fill="black"/>
    </symbol>
    <symbol id="plus" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M5.5 10C5.5 9.72386 5.72386 9.5 6 9.5H10C10.2761 9.5 10.5 9.72386 10.5 10C10.5 10.2761 10.2761 10.5 10 10.5H6C5.72386 10.5 5.5 10.2761 5.5 10Z" fill="black"/>
        <path d="M8 1C9.38071 1 10.5 2.11929 10.5 3.5V4H5.5V3.5C5.5 2.11929 6.61929 1 8 1ZM11.5 4V3.5C11.5 1.567 9.933 0 8 0C6.067 0 4.5 1.567 4.5 3.5V4H1V14C1 15.1046 1.89543 16 3 16H13C14.1046 16 15 15.1046 15 14V4H11.5ZM2 5H14V14C14 14.5523 13.5523 15 13 15H3C2.44772 15 2 14.5523 2 14V5Z" fill="black"/>
    </symbol>
    <symbol id="grid" viewBox="0 0 16 16">
        <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5z"/>
        <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z"/>
        <path d="M10 7a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0zm-6 4a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0zm4-3a1 1 0 0 0-1 1v3a1 1 0 1 0 2 0V9a1 1 0 0 0-1-1"/>
    </symbol>
    <symbol id="clock" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M8.51496 1.01896C8.34401 1.00635 8.17225 1 8 1V0C8.19685 0 8.39314 0.00726199 8.58852 0.0216722L8.51496 1.01896ZM10.5193 1.46905C10.1985 1.34533 9.86912 1.2454 9.53371 1.17008L9.75282 0.194382C10.1361 0.280463 10.5126 0.394665 10.8792 0.536055L10.5193 1.46905ZM11.889 2.17971C11.7458 2.08402 11.5994 1.99388 11.4503 1.90939L11.9432 1.0393C12.1136 1.13586 12.2809 1.23888 12.4446 1.34824C12.6082 1.4576 12.7674 1.5727 12.9219 1.69322L12.3066 2.48158C12.1715 2.37612 12.0322 2.27541 11.889 2.17971ZM13.7231 3.96934C13.5252 3.68829 13.3068 3.42218 13.0697 3.17321L13.794 2.48368C14.0649 2.76821 14.3145 3.07233 14.5407 3.39353L13.7231 3.96934ZM14.4672 5.32122C14.4012 5.16208 14.3296 5.00583 14.2526 4.85271L15.1458 4.40311C15.2339 4.5781 15.3157 4.75667 15.391 4.93853C15.4664 5.12039 15.5348 5.30453 15.5962 5.49054L14.6467 5.80423C14.5929 5.64147 14.5331 5.48035 14.4672 5.32122ZM14.9979 7.82822C14.9895 7.48455 14.9557 7.14197 14.8969 6.80326L15.8822 6.63231C15.9494 7.01939 15.988 7.41092 15.9976 7.80367L14.9979 7.82822ZM14.8655 9.36563C14.8991 9.1967 14.9264 9.02699 14.9474 8.85687L15.9398 8.97929C15.9159 9.17372 15.8847 9.36766 15.8463 9.56072C15.8079 9.75378 15.7625 9.94489 15.7102 10.1337L14.7464 9.867C14.7922 9.70179 14.8319 9.53457 14.8655 9.36563ZM13.914 11.745C14.0979 11.4546 14.2602 11.151 14.3995 10.8367L15.3137 11.2419C15.1545 11.6011 14.969 11.9481 14.7588 12.28L13.914 11.745ZM12.9497 12.9497C13.0715 12.828 13.1885 12.702 13.3005 12.5722L14.0577 13.2254C13.9297 13.3737 13.796 13.5177 13.6569 13.6569L12.9497 12.9497Z" fill="black"/>
        <path d="M8 1C6.84885 1 5.71545 1.2839 4.70022 1.82655C3.68499 2.3692 2.81926 3.15386 2.17971 4.11101C1.54017 5.06816 1.14654 6.16827 1.03371 7.31388C0.920876 8.45949 1.09232 9.61525 1.53285 10.6788C1.97337 11.7423 2.66939 12.6808 3.55925 13.4111C4.44911 14.1414 5.50533 14.6409 6.63437 14.8655C7.76341 15.0901 8.93041 15.0327 10.032 14.6986C11.1336 14.3644 12.1358 13.7637 12.9497 12.9497L13.6569 13.6569C12.7266 14.5871 11.5812 15.2736 10.3223 15.6555C9.06332 16.0374 7.72961 16.1029 6.43928 15.8463C5.14895 15.5896 3.94183 15.0187 2.92486 14.1841C1.90788 13.3495 1.11243 12.2769 0.608966 11.0615C0.105504 9.846 -0.0904279 8.52514 0.0385242 7.21586C0.167476 5.90659 0.617333 4.64933 1.34825 3.55544C2.07916 2.46155 3.06857 1.5648 4.22883 0.94463C5.38909 0.324457 6.68439 0 8 0V1Z" fill="black"/>
        <path d="M7.5 3C7.77614 3 8 3.22386 8 3.5V8.70984L11.2481 10.5659C11.4878 10.7029 11.5711 11.0083 11.4341 11.2481C11.2971 11.4878 10.9917 11.5711 10.7519 11.4341L7.25193 9.43412C7.09615 9.3451 7 9.17943 7 9V3.5C7 3.22386 7.22386 3 7.5 3Z" fill="black"/>
    </symbol>
    <symbol id="leave" width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M15.625 5.46875C15.625 5.03728 15.2752 4.6875 14.8437 4.6875L2.34375 4.6875C1.91228 4.6875 1.5625 5.03728 1.5625 5.46875L1.5625 19.5312C1.5625 19.9627 1.91228 20.3125 2.34375 20.3125H14.8438C15.2752 20.3125 15.625 19.9627 15.625 19.5312L15.625 16.4062C15.625 15.9748 15.9748 15.625 16.4062 15.625C16.8377 15.625 17.1875 15.9748 17.1875 16.4062V19.5312C17.1875 20.8257 16.1382 21.875 14.8438 21.875H2.34375C1.04933 21.875 0 20.8257 0 19.5312V5.46875C0 4.17433 1.04933 3.125 2.34375 3.125L14.8437 3.125C16.1382 3.125 17.1875 4.17433 17.1875 5.46875V8.59375C17.1875 9.02522 16.8377 9.375 16.4062 9.375C15.9748 9.375 15.625 9.02522 15.625 8.59375V5.46875Z" fill="black"/>
        <path fill-rule="evenodd" clip-rule="evenodd" d="M6.47882 13.0524C6.17373 12.7473 6.17373 12.2527 6.47882 11.9476L11.1663 7.26007C11.4714 6.95498 11.9661 6.95498 12.2712 7.26007C12.5763 7.56517 12.5763 8.05983 12.2712 8.36493L8.91735 11.7188H22.6562C23.0877 11.7188 23.4375 12.0685 23.4375 12.5C23.4375 12.9315 23.0877 13.2812 22.6562 13.2812H8.91735L12.2712 16.6351C12.5763 16.9402 12.5763 17.4348 12.2712 17.7399C11.9661 18.045 11.4714 18.045 11.1663 17.7399L6.47882 13.0524Z" fill="black"/>
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
            <a id="botoncito" type="button" class="content" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
                <svg class="img-fluid" width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect y="34.7727" width="45" height="10.2273" rx="5.11364" fill="white"/>
                    <rect y="17.3864" width="45" height="10.2273" rx="5.11364" fill="white"/>
                    <rect width="45" height="10.2273" rx="5.11364" fill="white"/>
                </svg>
            </a>

            <p id="tituloLogin" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto" style="color: white; margin-left: auto">
                <img src="IMG/cajaIcon.png" alt="Logo" width="50" height="50">
                GESTIÓN DE ALMACÉN
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
            <svg class="img-fluid" width="45" height="45" viewBox="0 0 45 45" fill="none" xmlns="http://www.w3.org/2000/svg"
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
                <a href="InicioAlmacenista.jsp" id="a" class="nav-link text-white" style="text-align: left;" aria-current="page">
                    <svg class="bi pe-none me-2" width="22" height="22"><use xlink:href="#home"/></svg>
                    Menu principal
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="registrarEntrada.jsp" id="b" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20"><use xlink:href="#plus"/></svg>
                    Registrar entrada
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="registrarSalida.jsp" id="c" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20"><use xlink:href="#minus" fill="black"/></svg>
                    Registrar salida
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="menuHist.jsp" id="d" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20" fill="black"><use xlink:href="#grid" fill="black"/></svg>
                    Consultar historial
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="pendientes.jsp" id="e" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20"><use xlink:href="#clock"/></svg>
                    Pendientes
                </a>
            </li>
            <li><hr class="nav-divider"></li>
            <li class="nav-item">
                <a href="index.jsp" id="f" class="nav-link text-white" style="text-align: left;">
                    <svg class="bi pe-none me-2" width="20" height="20"><use xlink:href="#leave"/></svg>
                    Salir
                </a>
            </li>
        </ul>
        <hr>
        <p id="copy">© 2024 SGA</p>
        </div>
    </div> <!-- si -->
</header>
<style>
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

    body{
        background-color: #F2E9E4;
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

    #saludo{
        font-size: larger;
    }

    /*Aqui terminan*/
</style>
<!--  Antes de añadir el header, recuerda que solo se cierra dicha etiqueta, body y html NO-->