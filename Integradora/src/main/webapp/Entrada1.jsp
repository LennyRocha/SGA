<%@ page import="mx.edu.utez.integradora.Dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Dao.ProveedorDao" %>
<%@ page import="mx.edu.utez.integradora.Dao.EntradasDao" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="mx.edu.utez.integradora.Dao.DetalleEntradaDao" %>
<%@ page import="mx.edu.utez.integradora.Model.*" %><%--
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
    <title>Registrar entrada</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleHeader.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/Otro.css">
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
    String error = (String) sesion.getAttribute("error");

    int uno = 1;

    DetalleEntradaDao deDao = new DetalleEntradaDao();
    EntradasDao eDao = new EntradasDao();
    UsuarioDao dao = new UsuarioDao();
    ProveedorDao pDao = new ProveedorDao();
    String name = (String) sesion.getAttribute("name");
    Entradas entrada = eDao.getRecent();
    LocalDate fecha = LocalDate.now();
    String folio = "";
    int idEnt = 0;
        if(entrada != null) {
            idEnt = entrada.getEntrada_id();
        }else{
            folio = "ID01"+fecha+"E";
        }
    idEnt = idEnt+1;
    folio = "ID"+idEnt+fecha+"E";
    Entradas ent = (Entradas) sesion.getAttribute("ent");
    ArrayList<Proveedor> listP = pDao.getAll();
    ArrayList<Producto> listProd = new ArrayList<>();
    ArrayList<DetalleEntrada> listEnt = deDao.getAllByEntradaFolio(ent.getEntrada_folio());
    Entradas detEnt = listEnt.getFirst().getEntradas();

    for(DetalleEntrada dE : listEnt){
        Producto prod = dE.getProductos();
        listProd.add(prod);
    }
%>
<span data-bs-toggle="tooltip" data-bs-placement="top" title="Regresar">
    <button id="back" onclick="location.href='InicioAlmacenista.jsp'" class="btn btn-outline-primary btn-lg" style="margin-left: 10px"><img src="IMG/Back.png" class="img-fluid" width="40" height="40"></button>
</span>
<main>
    <div class="container-fluid">
        <div class="col"></div>
        <div class="col">
            <br>
            <% if(!listEnt.isEmpty()){%>
            <div class="container-fluid" id="contInicio">
                <form action="entrada" method="post" id="entrada">
                    <div class="container-sm">
                        <h1 id="tit">REGISTRAR ENTRADA</h1>
                    </div>
                    <br>
                    <!-- Inicio de columna -->
                    <div class="row">
                        <div class="col">
                            <label>Folio:*</label>
                            <input type="text" class="form-control" id="folio" placeholder="Folio" readonly style="background-color: #D9D9D9;" value="<%=detEnt.getEntrada_folio()%>" name="folio">
                            <label>Fecha:*</label>
                            <input type="date" class="form-control" id="fecha" aria-placeholder="Fecha actual" name="fecha" pattern="yyyy-MM-dd" required value="<%=detEnt.getEntrada_fecha()%>">
                            <label>Empleado:*</label>
                            <input type="text" class="form-control" id="empleado" value="<%=name%>" readonly style="background-color: #D9D9D9;" name="employees">
                        </div>
                        <div class="col">
                            <label>Proveedor:*</label>
                            <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar proveedor">
                            <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" id="addProv">+</button>
                            </span>
                            <br>
                            <select class="form-select form-control" name="suppliers" id="types" required>
                                <option value="" disabled>Selecciona un proveedor</option>
                                <% for(Proveedor pr : listP){
                                    if(pr.getProveedor_nombre().toUpperCase() == detEnt.getProveedorNombre().toUpperCase()){ %>
                                <option value="<%=detEnt.getProveedorNombre()%>" selected><%detEnt.getProveedorNombre();%></option>
                                    <% }else{%>
                                <option value="<%=pr.getProveedor_nombre()%>"><%=pr.getProveedor_nombre()%></option>
                                <% } }%>
                            </select>
                            <label>Folio de factura:*</label>
                            <input type="text" class="form-control" maxlength="32" placeholder="Ingresa el folio de factura" name="fact" required max="10" value="<%=detEnt.getEntrada_folio_factura()%>">
                        </div>
                    </div>
                    <br>
                    <hr>
                    <br>
                    <%Producto prop = listProd.getFirst();%>
                    <div class="container-fluid" id="CF">
                        <div class="row">
                            <div class="col-auto">
                                <label>#</label>
                                <br>
                                <label id="Numeroo">1</label>
                            </div>
                            <div class="col-sm">
                                <label>PRODUCTO</label>
                                <br>
                                <input type="text" class="form-control" placeholder="Producto 1" id="productoo1" required maxlength="50" name="producto[]" required value="<%=prop.getProducto_nombre()%>">
                            </div>
                            <div class="col-sm">
                                <label>CANTIDAD</label>
                                <br>
                                <input type="number" class="form-control" placeholder="Cantidad 1" id="cantidaad1" min="0" name="Cantidad[]" required value="<%=prop.getProducto_cantidad()%>>
                            </div>
                            <div class="col-sm">
                                <label>PRECIO UNIT</label>
                                <br>
                                <input type="tel" class="form-control" placeholder="Precio 1" oninput="validarNumero(this)" min="0" step="0.01" maxlength="10" id="precioo1" name="Precio[]" required value="<%=prop.getProducto_precio()%>">
                            </div>
                            <div class="col-sm">
                                <label>--</label>
                                <br>
                                <a class="btn btn-outline-success" type="button" id="nuevoz2">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8 2C8.27614 2 8.5 2.22386 8.5 2.5V7.5H13.5C13.7761 7.5 14 7.72386 14 8C14 8.27614 13.7761 8.5 13.5 8.5H8.5V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V8.5H2.5C2.22386 8.5 2 8.27614 2 8C2 7.72386 2.22386 7.5 2.5 7.5H7.5V2.5C7.5 2.22386 7.72386 2 8 2Z" fill="black"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div id="nuevosz" class="container-fluid">
                        <%for(Producto p :  listProd){%>
                        <div class="row">
                            <div class="col-auto">
                                <label>#</label>
                                <br>
                                <label id="Numeroo"><%=uno%></label>
                            </div>
                            <div class="col-sm">
                                <label>PRODUCTO</label>
                                <br>
                                <input type="text" class="form-control" placeholder="Producto 1" id="productoo1" required maxlength="50" name="producto[]" required value="<%=p.getProducto_nombre()%>">
                            </div>
                            <div class="col-sm">
                                <label>CANTIDAD</label>
                                <br>
                                <input type="number" class="form-control" placeholder="Cantidad 1" id="cantidaad1" min="0" name="Cantidad[]" required value="<%=p.getProducto_cantidad()%>>
                            </div>
                            <div class="col-sm">
                                <label>PRECIO UNIT</label>
                                <br>
                                <input type="tel" class="form-control" placeholder="Precio 1" oninput="validarNumero(this)" min="0" step="0.01" maxlength="10" id="precioo1" name="Precio[]" required value="<%=p.getProducto_precio()%>">
                            </div>
                            <div class="col-sm">
                                <label>--</label>
                                <br>
                                <a class="btn btn-outline-success" type="button" id="nuevoz2">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8 2C8.27614 2 8.5 2.22386 8.5 2.5V7.5H13.5C13.7761 7.5 14 7.72386 14 8C14 8.27614 13.7761 8.5 13.5 8.5H8.5V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V8.5H2.5C2.22386 8.5 2 8.27614 2 8C2 7.72386 2.22386 7.5 2.5 7.5H7.5V2.5C7.5 2.22386 7.72386 2 8 2Z" fill="black"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <input type="hidden" value="" name="action" id="validator">
                    <center>
                        <a class="btn btn-outline-primary btn-lg mr-2" id="save" onclick="enviar('registrar')">Finalizar</a>
                        <a type="button" id="guardar" class="btn btn-outline-success btn-lg" onclick="enviarSolicitud('guardar')">Guardar</a>
                        <a type="button" id="cancelar" class="btn btn-outline-warning btn-lg" href="InicioAlmacenista.jsp?alert=cancel">Cancelar</a>
                    </center>
                </form>
            </div>
            <% } %>
            <!-- Aqui -->
            <div class="container-fluid" id="contInicio">
                <form action="entrada" method="post" id="entrada">
                    <div class="container-sm">
                        <h1 id="tit">REGISTRAR ENTRADA</h1>
                    </div>
                    <br>
                    <!-- Inicio de columna -->
                    <div class="row">
                        <div class="col">
                            <label>Folio:*</label>
                            <input type="text" class="form-control" id="folio" placeholder="Folio" readonly style="background-color: #D9D9D9;" value="<%=folio%>" name="folio">
                            <label>Fecha:*</label>
                            <input type="date" class="form-control" id="fecha" aria-placeholder="Fecha actual" name="fecha" pattern="yyyy-MM-dd" required>
                            <label>Empleado:*</label>
                            <input type="text" class="form-control" id="empleado" value="<%=name%>" readonly style="background-color: #D9D9D9;" name="employees">
                        </div>
                        <div class="col">
                            <label>Proveedor:*</label>
                            <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar proveedor">
                            <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" id="addProv">+</button>
                            </span>
                            <br>
                            <select class="form-select form-control" name="suppliers" id="types" required>
                                <option value="" disabled selected>Selecciona un proveedor</option>
                                <% for(Proveedor p : listP){ %>
                                <option value="<%=p.getProveedor_nombre()%>"><%=p.getProveedor_nombre()%></option>
                                <% } %>
                            </select>
                            <label>Folio de factura:*</label>
                            <input type="text" class="form-control" maxlength="32" placeholder="Ingresa el folio de factura" name="fact" required max="10">
                        </div>
                    </div>
                <br>
                <hr>
                <br>
                    <div class="container-fluid" id="cf">
                        <div class="row">
                            <div class="col-auto">
                                <label>#</label>
                                <br>
                                <label id="numero">1</label>
                            </div>
                            <div class="col-sm">
                                <label>PRODUCTO</label>
                                <br>
                                <input type="text" class="form-control" placeholder="Producto 1" id="producto1" required maxlength="50" name="producto[]" required>
                            </div>
                            <div class="col-sm">
                                <label>CANTIDAD</label>
                                <br>
                                <input type="number" class="form-control" placeholder="Cantidad 1" id="cantidad1" min="0" name="Cantidad[]" required>
                            </div>
                            <div class="col-sm">
                                <label>PRECIO UNIT</label>
                                <br>
                                <input type="tel" class="form-control" placeholder="Precio 1" oninput="validarNumero(this)" min="0" step="0.01" maxlength="10" id="precio1" name="Precio[]" required>
                            </div>
                            <div class="col-sm">
                                <label>--</label>
                                <br>
                                <a class="btn btn-outline-success" type="button" id="nuevoz">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8 2C8.27614 2 8.5 2.22386 8.5 2.5V7.5H13.5C13.7761 7.5 14 7.72386 14 8C14 8.27614 13.7761 8.5 13.5 8.5H8.5V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V8.5H2.5C2.22386 8.5 2 8.27614 2 8C2 7.72386 2.22386 7.5 2.5 7.5H7.5V2.5C7.5 2.22386 7.72386 2 8 2Z" fill="black"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div id="nuevosz" class="container-fluid"></div>
                    <input type="hidden" value="" name="action" id="validator">
                    <center>
                        <a class="btn btn-outline-primary btn-lg mr-2" id="save" onclick="enviar('registrar')">Finalizar</a>
                        <a type="button" id="guardar" class="btn btn-outline-success btn-lg" onclick="enviarSolicitud('guardar')">Guardar</a>
                        <a type="button" id="cancelar" class="btn btn-outline-warning btn-lg" href="InicioAlmacenista.jsp?alert=cancel">Cancelar</a>
                    </center>
                </form>
            </div><!-- Aqui -->
        </div>
        <br><!-- Inicio de columna -->
    </div>
    <div class="col"></div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">Recipient:</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="message-text"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary"  id="close" onclick="exit()">Exit</button>
                </div>
            </div>
        </div>
    </div>
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
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/ScriptEntrada.js"></script>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
</body>
</html>
