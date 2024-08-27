<%@ page import="mx.edu.utez.integradora.Model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 27/07/2024
  Time: 07:57 p. m.
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
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleIndexAlma.css">
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body>
<jsp:include page="/Templates/Header2.jsp" />
<main>
    <div class="container-fluid">
        <div class="col"></div>
        <div class="col-8 offset-2">
            <div class="container-sm">
                <center><p style="font-size: 4vw;">BIENVENIDO ALMACENISTA</p></center>
            </div>
            <div class="container-fluid" id="contInicio">
                <br>
                <div class="row">
                    <div class="col">
                        <img class="img-fluid" id="btns" src="IMG/Btn1_Almacen.png" alt="Gesionar usuarios">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3" id="btnAlma" onclick="location.href='Entrada1.jsp'">ENTRADAS</button>
                    </div>
                    <div class="col">
                        <img class="img-fluid" id="btns" src="IMG/Btn2_Almacen.png" alt="ver historial">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3" id="btnAlma" onclick="location.href='menuHist.jsp'">HISTORIAL</button>
                    </div>
                    <div class="col">
                        <img class="img-fluid" id="btns" src="IMG/Btn3_Almacen.png" alt="ver almacen">
                        <button class="btn btn-secondary.btn-sm mt-2 mb-3" id="btnAlma" onclick="location.href='Salida2.jsp'">SALIDAS</button>
                    </div>
                    <div class="col">
                        <img class="img-fluid" id="btns" src="IMG/Btn4_Almacen.png" alt="ver almacen">
                        <button class="btn btn-secondary.btn-block mt-2 mb-2" id="btnAlma" onclick="location.href='pendientes.jsp'">PENDIENTES</button>
                    </div>
                    <br>
                </div>
                <br>
                <!-- <div class="row" id="theRow">
                    <a class="btn btn-info mt- mb-1" id="exit" href="#">SALIR</a>
                </div> -->
            </div>
        </div>
        <div class="col"></div>
    </div>
</main>
<script>
    document.getElementById('exit').addEventListener('click', function() {
        Swal.fire({
            title: "¡Salir!",
            titleColor: '#1D3557',
            text: "¿Deseas cerrar sesión?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#198754",
            cancelButtonColor: "#E63946",
            confirmButtonText: "Si",
            cancelButtonText: "No",
        }).then((result) => {
            if(result.isConfirmed){
                window.location.href='index.jsp?alert=success';
            }
        });
    });

    function getQueryParams() {
        const params = {};
        window.location.search.substring(1).split('&').forEach(param => {
            const [key, value] = param.split('=');
            params[key] = value;
        });
        return params;
    }

    const params = getQueryParams();

    if (params.alert === 'cancel') {
        Swal.fire({
            title: '¡Cancelado!',
            text: 'Entrada cancelada.',
            icon: 'error',
            confirmButtonText: 'Aceptar',
            confirmButtonColor: '#4A4E69',
            confirmButtonBorderColor: '#4A4E69',
        });
    }
</script>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.js"></script>
</body>
</html>

