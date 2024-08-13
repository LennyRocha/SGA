<%@ page import="mx.edu.utez.integradora.Model.Usuario" %>
<%@ page import="mx.edu.utez.integradora.Dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Model.Areas" %>
<%@ page import="mx.edu.utez.integradora.Dao.AreaDao" %><%--
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
    <title>Registrar salida</title>
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
        AreaDao aDao = new AreaDao();
        ArrayList<Usuario> list = dao.getSome();
        ArrayList<Areas> listA = aDao.getAll();
    %>
    <main>
        <div class="container-fluid">
            <div class="col"></div>
            <div class="col">
                <br>
                <div class="container-fluid" id="contInicio">
                    <form action="#" method="post" id="entrada">
                        <div class="container-sm">
                            <h1 id="tit">REGISTRAR SALIDA</h1>
                        </div>
                        <!-- Inicio de columna -->
                        <div class="row">
                            <div class="col">
                                <label>Folio:*</label>
                                <input type="text" class="form-control" placeholder="Folio" maxlength="7">
                                <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar area de salida">
                              <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Area de salida:*</a>
                              </span>
                                <br>
                                <select class="form-select form-control" name="types" id="areas">
                                    <option value="" disabled selected>Selecciona un area</option>
                                    <% for(Areas a : listA){ %>
                                    <option value="<%=a.getArea_identidad()%>"><%=a.getArea_nombre()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="col">
                                <label>Fecha:*</label>
                                <input type="date" class="form-control" id="fecha" aria-placeholder="Fecha actual">
                                <label>Empleado:*</label>
                                <br>
                                <select class="form-select form-control" name="empleados" id="empleados">
                                    <option value="" disabled selected>Selecciona un usuario</option>
                                    <% for(Usuario u : list){ %>
                                    <option value="<%=u.getNombre_usuario()%>"><%=u.getNombre_usuario()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                    </form>
                    <br>
                    <hr>
                    <br>
                    <form action="salida" method="post" id="producto">
                        <!--<div class="row container-sm">
                            <div class="col-auto"><label>No.</label></div>
                            <div class="col"><label>PRODUCTO</label></div>
                            <div class="col"><label>CANTIDAD</label></div>
                            <div class="col"><label>PRECIO UNIT</label></div>
                            <div class="col">
                          <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar unidad de medida">
                            <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">U. MEDIDA</a>
                          </span>
                            </div>
                            <div class="col"><label>PRECIO TOTAL</label></div>
                            <div class="col"><label>--</label></div>
                        </div>-->
                        <div class="container-sm">
                            <div class="row">
                                <div class="col-auto">
                                    <label>#</label>
                                    <br>
                                    <label id="numero">1</label>
                                </div>
                                <div class="col-sm">
                                    <label>PRODUCTO</label>
                                    <br>
                                    <input type="text" class="form-control" placeholder="Producto 1" id="producto1" required>
                                </div>
                                <div class="col-sm">
                                    <label>CANTIDAD</label>
                                    <br>
                                    <input type="number" class="form-control" placeholder="Cantidad 1" id="cantidad1" min="0">
                                </div>
                                <div class="col-sm">
                                    <label>PREC UNIT</label>
                                    <br>
                                    <input type="text" class="form-control" placeholder="Precio 1" id="precio1">
                                </div>
                                <div class="col-sm">
                            <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar unidad de medida">
                              <a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">A. SALIDA</a>
                            </span>
                                    <br>
                                    <input type="text" class="form-control" placeholder="Area 1" id="area1">
                                </div>
                                <div class="col-sm">
                                    <label>PREC TOT</label>
                                    <br>
                                    <input type="text" class="form-control" placeholder="Precio Total 1" id="precioT1" readonly>
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
                        <div id="nuevosz" class="container-sm"></div>
                        <br>
                        <div class="row">
                            <div class="col"><label for="prodFin">Total de productos:</label></div>
                            <div class="col"><input type="text" class="form-control" placeholder="Productos totales" id="prodFin" readonly></div>
                            <div class="col"><label for="precFin">Monto total:</label></div>
                            <div class="col"><input type="number" class="form-control" placeholder="Monto total" id="precFin" readonly min="0"></div>
                        </div>
                        <br>
                        <center><button class="btn btn-outline-primary btn-lg mr-2" id="save" onclick="subir()">Finalizar</button>
                            <button type="button" id="cancelar" class="btn btn-outline-warning btn-lg" onclick="location.href='InicioAlmacenista.jsp'">Cancelar</button></center>
                    </form>
                </div>
                <br>
            </div><!-- Inicio de columna -->
        </div>
        <div class="col"></div>
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
    <script>
        function subir(){
            const form1 = document.getElementById("entrada");
            const form2 = document.getElementById("producto");
            form1.sumbit();
            form2.sumbit();
            console.log("Entrada exitosa");
        }
    </script>
    <script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/JS/ScriptSalidaP.js"></script>
    <script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
</body>
</html>
