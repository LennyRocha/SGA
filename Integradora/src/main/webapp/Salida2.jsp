<%@ page import="mx.edu.utez.integradora.Model.Usuario" %>
<%@ page import="mx.edu.utez.integradora.Dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Model.Area" %>
<%@ page import="mx.edu.utez.integradora.Dao.AreaDao" %>
<%@ page import="mx.edu.utez.integradora.Model.Area" %>
<%@ page import="mx.edu.utez.integradora.Model.UnidMed" %>
<%@ page import="mx.edu.utez.integradora.Dao.UnidadDao" %>
<%@ page import="mx.edu.utez.integradora.Model.Salidas" %>
<%@ page import="mx.edu.utez.integradora.Dao.SalidaDao" %>
<%@ page import="mx.edu.utez.integradora.Dao.ProductoDao" %>
<%@ page import="mx.edu.utez.integradora.Model.Producto" %>

<%@ page import="java.time.LocalDate" %>
<%@ page import="com.google.gson.Gson" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 13/08/2024
  Time: 11:44 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Registrar salida</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/Otro2.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleHeader.css">
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body>
<style>
    body{
        background-color: #F2E9E4;
    }
</style>
<script>
    function calculateTotal(element,index) {
        const cantidad = document.getElementById('Cantidad'+index).value;
        const precio = document.getElementById('Precio'+index).value;
        const precioTotal = document.getElementById('PrecioT'+index);

        precioTotal.value = cantidad * precio;

        document.getElementById('precFin').value = precioTotal;

        updateTotals();
    }

    function validarNumero(input) {
        input.value = input.value.replace(/[^0-9.]/g, '');
    }

    function updateTotals() {
        const cantidadInputs = document.querySelectorAll('[name="Cantidad[]"]');
        const precioTotalInputs = document.querySelectorAll('[name="PrecioT[]"]');
        let totalProductos = 0;
        let montoTotal = 0;

        cantidadInputs.forEach(input => {
            totalProductos += parseFloat(input.value) || 0;
        });

        precioTotalInputs.forEach(input => {
            montoTotal += parseFloat(input.value) || 0;
        });

        document.getElementById('prodFin').value = totalProductos;
        document.getElementById('precFin').value = montoTotal;
    }
</script>
<jsp:include page="/Templates/Header2.jsp" />
<%
    HttpSession sesion = (HttpSession) request.getSession();
    String mensaje = (String) sesion.getAttribute("mensaje");
    String mensaje2 = (String) sesion.getAttribute("mensaje2");
    String error = (String) sesion.getAttribute("error");
    String exito = (String) sesion.getAttribute("exito");
    String alertProv = (String) sesion.getAttribute("alertProv");
    String alertProv2 = (String) sesion.getAttribute("alertProv2");
    UsuarioDao dao = new UsuarioDao();
    AreaDao aDao = new AreaDao();
    UnidadDao uDao = new UnidadDao();
    ArrayList<Usuario> list = dao.getSome();
    ArrayList<Area> listA = aDao.getAll();
    ArrayList<UnidMed> listU = uDao.getAll();
    ProductoDao pDao = new ProductoDao();
    ArrayList<Producto> listP = pDao.getAll();
    String name = (String) sesion.getAttribute("name");
    SalidaDao sDao = new SalidaDao();
    Salidas salida = sDao.getRecent();
    LocalDate fecha = LocalDate.now();
    String folio = "";
    int idSal = 0;
    if(salida != null) {
        idSal =salida.getSalida_id();
    }else{
        folio = "ID01"+fecha+"S";
    }
    idSal = idSal+1;
    folio = "ID"+idSal+fecha+"S";

    Gson gson = new Gson();
    String json = gson.toJson(listP);
    String jsons = gson.toJson(listU);
    System.out.println(json);
    System.out.println(jsons);
%>
<script>
    var arrayList = JSON.parse('<%= json.replaceAll("\"", "\\\\\"") %>');
    var arrayListU = JSON.parse('<%= jsons.replaceAll("\"", "\\\\\"") %>');
</script>
<span data-bs-toggle="tooltip" data-bs-placement="top" title="Regresar">
    <button id="back" onclick="location.href='InicioAlmacenista.jsp'" class="btn btn-outline-primary btn-lg" style="margin-left: 10px"><img src="IMG/Back.png" class="img-fluid" width="40" height="40"></button>
</span>
<main>
    <div class="container-fluid">
        <div class="col"></div>
        <div class="col">
            <br>
            <div class="container-fluid" id="contInicio">
                <form action="salida" method="post" id="salida">
                    <div class="container-sm">
                        <h1 id="tit">REGISTRAR SALIDA</h1>
                    </div>
                    <!-- Inicio de columna -->
                    <div class="row">
                        <div class="col">
                            <label>Folio:<strong style="color: darkred">*</strong></label>
                            <input type="text" class="form-control" placeholder="Folio" value="<%=folio%>" readonly style="background-color: #D9D9D9; color: #75778C" name="folio">
                            <label>Área de salida:<strong style="color: darkred">*</strong></label>
                            <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar area de salida">
                              <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" id="addArea">+</button>
                            </span>
                            <br>
                            <select class="form-select form-control" id="area" name="area" style="color: #75778C" required>
                                <option value="" disabled selected>Selecciona un area</option>
                                <% for(Area a : listA){ %>
                                <option value="<%=a.getArea_id()%>"><%=a.getArea_identidad()%> - <%=a.getArea_nombre()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="col">
                            <label>Fecha:<strong style="color: darkred">*</strong></label>
                            <input type="date" class="form-control" id="fecha" name="fecha" aria-placeholder="Fecha actual" required>
                            <label>Empleado:<strong style="color: darkred">*</strong></label>
                            <input type="text" class="form-control" id="empleado" name="empleado" value="<%=name%>" readonly style="background-color: #D9D9D9;">
                        </div>
                    </div>
                <br>
                <hr>
                <br>
                    <div class="container-sm" id="calc">
                        <div class="row">
                            <div class="col-auto">
                                <label>#</label>
                                <br>
                                <label id="numero">1</label>
                            </div>
                            <div class="col-sm">
                                <label>PRODUCTO<strong style="color: darkred">*</strong></label>
                                <br>
                                <select class="form-select form-control" name="types" id="Producto1" name="producto[]" style="color: #75778C" onchange="actualizarMaximo(1)" required>
                                    <option value="" disabled selected>Producto 1</option>
                                    <% for(Producto p : listP){ %>
                                    <option value="<%=p.getProducto_nombre()%>" data-stock="<%=p.getProducto_cantidad()%>"><%=p.getProducto_nombre()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="col-sm">
                                <label>CANTIDAD<strong style="color: darkred">*</strong></label>
                                <br>
                                <input type="number" class="form-control" placeholder="Cantidad 1" id="Cantidad1" min="0" oninput="calculateTotal(this,1)" name="Cantidad[]" required>
                            </div>
                            <div class="col-sm">
                                <label>PREC UNIT<strong style="color: darkred">*</strong></label>
                                <br>
                                <input type="tel" class="form-control" placeholder="Precio 1" oninput="validarNumero(this); calculateTotal(this,1)" min="0" step="0.01" maxlength="10" id="Precio1" name="Precio[]" required>
                            </div>
                            <div class="col-sm">
                                <label>U. MED<strong style="color: darkred">*</strong></label>
                                <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar unidad de medida">
                                  <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2" id="addUnid">+</button>
                                </span>
                                <br>
                                <select class="form-select form-control" name="types" id="unidad" name="Unidad[]" style="color: #75778C" required>
                                    <option value="" disabled selected>Unidad 1</option>
                                    <% for(UnidMed u : listU){ %>
                                    <option value="<%=u.getUnidad_id()%>"><%=u.getUnidad_nombre()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="col-sm">
                                <label>PREC TOTAL</label>
                                <br>
                                <input type="text" class="form-control" placeholder="Precio Total 1" id="PrecioT1" readonly name="PrecioT[]">
                            </div>
                            <div class="col-sm">
                                <label>--</label>
                                <br>
                                <a class="btn btn-outline-success" type="button" id="nuevoz3">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8 2C8.27614 2 8.5 2.22386 8.5 2.5V7.5H13.5C13.7761 7.5 14 7.72386 14 8C14 8.27614 13.7761 8.5 13.5 8.5H8.5V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V8.5H2.5C2.22386 8.5 2 8.27614 2 8C2 7.72386 2.22386 7.5 2.5 7.5H7.5V2.5C7.5 2.22386 7.72386 2 8 2Z" fill="black"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="nuevosz3" class="container-sm"></div>
                    <input type="hidden" value="" name="action" id="validator">
                    <br>
                    <div class="row">
                        <div class="col"><label for="prodFin">Total de productos:</label></div>
                        <div class="col"><input type="text" class="form-control" placeholder="Productos totales" id="prodFin" readonly></div>
                        <div class="col"><label for="precFin">Monto total:</label></div>
                        <div class="col"><input type="text" class="form-control" placeholder="Monto total" id="precFin" readonly></div>
                    </div>
                    <br>
                    <center>
                    <strong class="text-muted">* Obligatorio</strong>
                    <br>
                    <a class="btn btn-outline-primary btn-lg mr-2" id="save" onclick="enviar('registrar')">Finalizar</a>
                    <a type="button" id="guardar" class="btn btn-outline-success btn-lg" onclick="enviarSolicitud('guardar')">Guardar</a>
                    <a type="button" id="cancelar" class="btn btn-outline-warning btn-lg" href="InicioAlmacenista.jsp?alert=cancel">Cancelar</a>
                    </center>
                </form>
            </div>
            <br>
        </div>
        <br><!-- Inicio de columna -->
    </div>
    <div class="col"></div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="area" method="post" id="areasalidaz">
                    <div class="modal-header" style="background-color: #1D3557">
                        <img src="IMG/cajaIcon.png" alt="logito" width="30" height="30">
                        <h5 class="modal-title text-white" id="exampleModalLabel">GESTIÓN DE AREAS DE SALIDA</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h6 class="align-content-center" id="titModal">SELECCIONA UNA OPCIÓN</h6>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="add">
                            <label class="form-check-label" for="exampleRadios1">
                                Agregar
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="edit">
                            <label class="form-check-label" for="exampleRadios2">
                                Modificar
                            </label>
                        </div>
                        <br>
                        <div class="mb-3" id="nvaArea" style="display: none;">
                            <label for="newArea" class="col-form-label">Nueva area de salida:</label>
                            <input type="text" class="form-control" id="newArea" name="nombre_area">
                            <label for="newArea" class="col-form-label">Nueva letra asociada:</label>
                            <input type="text" class="form-control" id="newArea1" name="letra_area">
                        </div>
                        <div id="editA" style="display: none;">
                            <div class="mb-3" id="viejaArea">
                                <%Area area = new Area();%>
                                <select class="form-select form-control" id="types" required name="id_area">
                                    <option value="" disabled selected>Selecciona una area</option>
                                    <% for(Area a : listA){ %>
                                    <option value="<%=a.getArea_id()%>"><%=a.getArea_identidad()%> - <%=a.getArea_nombre()%></option>
                                    <%}%>
                                </select>
                                <div class="mb-3">
                                    <label for="nuevoName" class="col-form-label"><strong style="color: darkred">*</strong>Nuevo nombre:</label>
                                    <input type="text" class="form-control" id="nuevoName" name="nombre_area_nueva">
                                    <label for="nuevoName" class="col-form-label"><strong style="color: darkred">*</strong>Nueva letra de asociación:</label>
                                    <input type="text" class="form-control" id="nuevaIdent" name="identidad_area_nueva">
                                    <input type="hidden" value="" name="operacion" id="op">
                                    <br>
                                    <strong class="text-muted" style="font-style: italic">* Ambos son obligatorios, en caso de no querer modificar alguno, selecciona el valor anterior.</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="background-color: #EB616B">
                        <button type="submit" class="btn btn-success" id="saveChanges">Guardar</button>
                        <button type="button" class="btn btn-warning" id="close" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </form>
                <script>
                    let operationSelected = false;

                    document.getElementById('exampleRadios1').addEventListener('click', function() {
                        document.getElementById("titModal").style.display = "none";
                        document.getElementById("editA").style.display = "none";
                        document.getElementById("nvaArea").style.display = "block";
                        document.getElementById("op").value = "add";
                        operationSelected = true;
                    });

                    document.getElementById('exampleRadios2').addEventListener('click', function() {
                        document.getElementById("titModal").style.display = "none";
                        document.getElementById("nvaArea").style.display = "none";
                        document.getElementById("editA").style.display = "block";
                        document.getElementById("op").value = "edit";
                        operationSelected = true;
                    });


                    document.getElementById('saveChanges').addEventListener('click', function() {
                        const radios = document.querySelectorAll('.form-check-input[type="radio"]');

                        if (operationSelected) {
                            document.getElementById("areasalidaz").submit();

                            // Restablecer el formulario y los elementos del modal
                            setTimeout(function() {
                                document.getElementById("areasalidaz").reset();
                                document.getElementById("titModal").style.display = "block";
                                document.getElementById("nvaArea").style.display = "none";
                                document.getElementById("editA").style.display = "none";
                                // Si es necesario, restablecer el valor de los radios
                                radios.forEach(radio => radio.checked = false);
                            }, 500);
                        } else {
                            alert("Por favor, selecciona una operación.");
                        }
                    });
                </script>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="unidad" method="post" id="unidadmedidaz">
                    <div class="modal-header" style="background-color: #1D3557">
                        <img src="IMG/cajaIcon.png" alt="logito" width="30" height="30">
                        <h5 class="modal-title text-white" id="exampleModalLabel2">GESTIÓN DE UNIDADES DE MEDIDA</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h6 class="align-content-center" id="titModal2">SELECCIONA UNA OPCIÓN</h6>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios1_2" value="add">
                            <label class="form-check-label" for="exampleRadios1_2">
                                Agregar
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios2_2" value="edit">
                            <label class="form-check-label" for="exampleRadios2_2">
                                Modificar
                            </label>
                        </div>
                        <br>
                        <div class="mb-3" id="nvaUni" style="display: none;">
                            <label for="newUni" class="col-form-label">Nueva unidad de medida:</label>
                            <input type="text" class="form-control" id="newUni" name="nombre_unidad">
                        </div>
                        <div id="editU" style="display: none;">
                            <div class="mb-3" id="viejaUni">
                                <%UnidMed unidMed = new UnidMed();%>
                                <select class="form-select form-control" id="types2" required name="id_unidad">
                                    <option value="" disabled selected>Selecciona una unidad de medida</option>
                                    <% for(UnidMed u : listU){ %>
                                    <option value="<%=u.getUnidad_id()%>"><%=u.getUnidad_nombre()%></option>
                                    <%}%>
                                </select>
                                <div class="mb-3">
                                    <label for="nuevoName2" class="col-form-label">Nuevo nombre:</label>
                                    <input type="text" class="form-control" id="nuevoName2" name="nombre_unidad_nueva">
                                    <input type="hidden" value="" name="operacion" id="op2">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="background-color: #EB616B">
                        <button type="submit" class="btn btn-success" id="saveChanges2">Guardar</button>
                        <button type="button" class="btn btn-warning" id="close2" data-bs-dismiss="modal">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        let operationSelected2 = false;

        document.getElementById('exampleRadios1_2').addEventListener('click', function() {
            document.getElementById("titModal2").style.display = "none";
            document.getElementById("editU").style.display = "none";
            document.getElementById("nvaUni").style.display = "block";
            document.getElementById("op2").value = "add";
            operationSelected2 = true;
        });

        document.getElementById('exampleRadios2_2').addEventListener('click', function() {
            document.getElementById("titModal2").style.display = "none";
            document.getElementById("nvaUni").style.display = "none";
            document.getElementById("editU").style.display = "block";
            document.getElementById("op2").value = "edit";
            operationSelected2 = true;
        });

        document.getElementById('saveChanges2').addEventListener('click', function() {
            const radios2 = document.querySelectorAll('.form-check-input[type="radio"]');

            if (operationSelected2) {
                document.getElementById("unidadmedidaz").submit();

                // Restablecer el formulario y los elementos del modal
                setTimeout(function() {
                    document.getElementById("unidadmedidaz").reset();
                    document.getElementById("titModal2").style.display = "block";
                    document.getElementById("nvaUni").style.display = "none";
                    document.getElementById("editU").style.display = "none";
                    radios2.forEach(radio => radio.checked = false);
                }, 500);
            } else {
                alert("Por favor, selecciona una operación.");
            }
        });
    </script>

</main>
<%
    if(mensaje2!=null){%>
<div class="alert alert-success d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
    <div>
        <%=mensaje2%>
    </div>
</div>
<br>
<script>
    Swal.fire({
        title: '!Exito!',
        text: '<%=mensaje2%>',
        icon: 'success',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#4A4E69',
        confirmButtonBorderColor: '#4A4E69'
    });
</script>
<% } %>
<%if(mensaje!=null){ %>
<div class="alert alert-danger d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        <%=mensaje%>
    </div>
</div>
<% } %>
<%if(error!=null){ %>
<div class="alert alert-warning d-flex align-items-center" role="alert">
    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
    <div>
        <%=error%>
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
<%
    sesion.removeAttribute("usuario");
    sesion.removeAttribute("mensaje");
    sesion.removeAttribute("mensaje2");
    sesion.removeAttribute("error");
    sesion.removeAttribute("ent");
%>
<script src="${pageContext.request.contextPath}/JS/Scripts2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
</body>
</html>
