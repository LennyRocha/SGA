<%@ page import="mx.edu.utez.integradora.Model.Usuario" %>
<%@ page import="mx.edu.utez.integradora.Dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Model.Proveedor" %>
<%@ page import="mx.edu.utez.integradora.Dao.ProveedorDao" %><%--
  Created by IntelliJ IDEA.
  User: Lenny
  Date: 01/08/2024
  Time: 04:56 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Registrar entrada</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/bootstrap.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleHeader.css">
    <link rel="stylesheet" type='text/css' media='screen' href="${pageContext.request.contextPath}/CSS/StyleProducto.css">
    <link rel="icon" type="image/png" sizes="32x32" href="ICONOS/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="ICONOS/favicon-16x16.png">
    <link rel="manifest" href="ICONOS/site.webmanifest">
</head>
<body>
    <jsp:include page="/Templates/Header2.jsp" />
    <%
        UsuarioDao dao = new UsuarioDao();
        ProveedorDao pDao = new ProveedorDao();
        ArrayList<Usuario> list = dao.getSome();
        ArrayList<Proveedor> listP = pDao.getAll();
    %>
    <main>
        <div class="container-fluid">
            <div class="col"></div>
            <div class="col">
                    <br>
                        <form action="entrada" method="post" id="entrada">
                            <div class="container-fluid" id="contInicio">
                                <div class="container-sm">
                                    <h1 id="tit">REGISTRAR ENTRADA</h1>
                                </div>
                                <!-- Inicio de columna -->
                                <div class="row">
                                    <div class="col">
                                        <label>Folio:*</label>
                                        <input type="text" name="folio" class="form-control" placeholder="Folio" maxlength="7">
                                        <label>Fecha:*</label>
                                        <input type="date" name="fecha" class="form-control" id="fecha" placeholder="Fecha actual">
                                        <label>Empleado:*</label>
                                        <br>
                                        <select class="form-select form-control" name="employees" id="types">
                                            <option value="" disabled selected>Selecciona un usuario</option>
                                            <% for(Usuario u : list){ %>
                                            <option value="<%=u.getNombre_usuario()%>"><%=u.getNombre_usuario()%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="col">
                                    <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar proveedor">
                                    <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Proveedor:*</a>
                                    </span>
                                        <br>
                                        <select class="form-select form-control" name="suppliers" id="suppliers">
                                            <option value="" disabled selected>Selecciona un Proveedor</option>
                                            <% for(Proveedor p : listP){ %>
                                            <option value="<%=p.getProveedor_nombre()%>"><%=p.getProveedor_nombre()%></option>
                                            <% } %>
                                        </select>
                                        <label>Folio de factura:*</label>
                                        <input type="text" class="form-control" name="fact" maxlength="32" placeholder="Ingresa el folio de factura">
                                        </div>
                                    </div>
                                    <br>
                                    <hr class="dropdown-divider">
                                    <br>
                                    <div class="container-sm">
                                    <div class="row">
                                        <div class="col-auto"><label>No.</label></div>
                                        <div class="col"><label>PRODUCTO</label></div>
                                        <div class="col"><label>CANTIDAD</label></div>
                                        <div class="col"><label>PRECIO UNIT</label></div>
                                        <div class="col">
                                      <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar unidad de medida">
                                        <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">U. MEDIDA</a>
                                      </span>
                                        </div>
                                        <div class="col"><label>--</label></div>
                                    </div>
                                    </div>
                                    <div class="container-sm">
                                    <div class="row">
                                        <div class="col-auto"><label id="numero">1</label></div>
                                        <div class="col"><input type="text" class="form-control" placeholder="Producto 1" required></div>
                                        <div class="col"><input type="number" class="form-control" placeholder="Cantidad 1"></div>
                                        <div class="col"><input type="text" class="form-control" placeholder="Precio 1"></div>
                                        <div class="col"><input type="text" class="form-control" placeholder="Unidad 1"></div>
                                        <div class="col"><a class="btn btn-outline-success" type="button" id="nuevo">
                                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M8 2C8.27614 2 8.5 2.22386 8.5 2.5V7.5H13.5C13.7761 7.5 14 7.72386 14 8C14 8.27614 13.7761 8.5 13.5 8.5H8.5V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V8.5H2.5C2.22386 8.5 2 8.27614 2 8C2 7.72386 2.22386 7.5 2.5 7.5H7.5V2.5C7.5 2.22386 7.72386 2 8 2Z" fill="black"/>
                                            </svg>
                                        </a></div>
                                    </div>
                                    </div>
                                    <br>
                                    <div id="nuevos" class="container-sm"></div>
                                    <center><button class="btn btn-outline-primary btn-lg mr-2" id="save" type="submit">Guardar</button> <button type="button" id="leave" class="btn btn-outline-warning btn-lg" onclick="location.href='InicioAlmacenista.jsp'">Cancelar</button></center>
                        </div>
                        </form>
            </div><!-- Inicio de columna -->
        </div>
        <div class="col"></div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Se registro correctamente</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/JS/ScriptEntradaP.js"></script>
    <script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
</body>
</html>
