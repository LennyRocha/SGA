<%@ page import="mx.edu.utez.integradora.Model.Usuario" %>
<%@ page import="mx.edu.utez.integradora.Dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.integradora.Model.Areas" %>
<%@ page import="mx.edu.utez.integradora.Dao.AreaDao" %>
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
<jsp:include page="/Templates/Header2.jsp" />
<%
    UsuarioDao dao = new UsuarioDao();
    AreaDao aDao = new AreaDao();
    ArrayList<Usuario> list = dao.getSome();
    ArrayList<Areas> listA = aDao.getAll();
    HttpSession sesion = (HttpSession) request.getSession();
    String name = (String) sesion.getAttribute("name");
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
                            <input type="text" class="form-control" placeholder="Folio" readonly style="background-color: #D9D9D9;">
                            <label>Área de salida:*</label>
                            <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar area de salida">
                              <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" id="addArea">+</button>
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
                            <input type="text" class="form-control" id="empleado" value="<%=name%>" readonly style="background-color: #D9D9D9;">
                        </div>
                    </div>
                <br>
                <hr>
                <br>
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
                                <input type="text" class="form-control" placeholder="Producto 1" id="producto1" required maxlength="50">
                            </div>
                            <div class="col-sm">
                                <label>CANTIDAD</label>
                                <br>
                                <input type="number" class="form-control" placeholder="Cantidad 1" id="cantidad1" min="0">
                            </div>
                            <div class="col-sm">
                                <label>PREC UNIT</label>
                                <br>
                                <input type="tel" class="form-control" placeholder="Precio 1" oninput="validarNumero(this)" min="0" step="0.01" maxlength="10" id="precio1">
                            </div>
                            <div class="col-sm">
                                <label>U. MED</label>
                                <span data-bs-toggle="tooltip" data-bs-placement="top" title="Agregar unidad de medida">
                                  <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" id="addUnid">+</button>
                                </span>
                                <br>
                                <input type="text" class="form-control" placeholder="Unidad 1" id="unidad1">
                            </div>
                            <div class="col-sm">
                                <label>PREC TOTAL</label>
                                <br>
                                <input type="text" class="form-control" placeholder="Precio Total 1" id="precioT1" readonly>
                            </div>
                            <div class="col-sm">
                                <label>--</label>
                                <br>
                                <a class="btn btn-outline-success" type="button" id="nuevo">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8 2C8.27614 2 8.5 2.22386 8.5 2.5V7.5H13.5C13.7761 7.5 14 7.72386 14 8C14 8.27614 13.7761 8.5 13.5 8.5H8.5V13.5C8.5 13.7761 8.27614 14 8 14C7.72386 14 7.5 13.7761 7.5 13.5V8.5H2.5C2.22386 8.5 2 8.27614 2 8C2 7.72386 2.22386 7.5 2.5 7.5H7.5V2.5C7.5 2.22386 7.72386 2 8 2Z" fill="black"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div id="nuevos" class="container-sm"></div>
                    <br>
                    <div class="row">
                        <div class="col"><label for="prodFin">Total de productos:</label></div>
                        <div class="col"><input type="text" class="form-control" placeholder="Productos totales" id="prodFin" readonly></div>
                        <div class="col"><label for="precFin">Monto total:</label></div>
                        <div class="col"><input type="text" class="form-control" placeholder="Monto total" id="precFin" readonly></div>
                    </div>
                    <br>
                    <center><button class="btn btn-outline-primary btn-lg mr-2" id="save" type="submit">Finalizar</button>
                        <button type="button" id="guardar" class="btn btn-outline-success btn-lg" onclick="location.href='InicioAlmacenista.jsp'">Guardar</button>
                        <button type="button" id="cancelar" class="btn btn-outline-warning btn-lg" onclick="location.href='InicioAlmacenista.jsp'">Cancelar</button></center>
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
<script src="${pageContext.request.contextPath}/JS/Script2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/popper.min.js"></script>
<script src='${pageContext.request.contextPath}/JS/bootstrap.js'></script>
</body>
</html>
