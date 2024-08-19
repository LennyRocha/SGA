package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.integradora.Dao.*;
import mx.edu.utez.integradora.Model.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "EntradaServlet", value = "/entrada")
public class EntradaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Entradas entrada = new Entradas();
        UsuarioDao usuarioDao = new UsuarioDao();
        ProveedorDao proveedorDao = new ProveedorDao();
        EntradasDao entradasDao = new EntradasDao();
        ProductoDao productoDao = new ProductoDao();

        try {
            String folio = String.valueOf(Integer.parseInt(request.getParameter("folio")));
            Timestamp fecha = Timestamp.valueOf(request.getParameter("fecha"));
            String empleado = request.getParameter("employees");
            String proveedor = request.getParameter("suppliers");
            int folioFact = Integer.parseInt(request.getParameter("fact"));

            Usuario usuario = usuarioDao.getOne(empleado);
            Proveedor proveedorObj = proveedorDao.getOne(proveedor);

            entrada.setEntrada_folio(folio);
            entrada.setEntrada_fecha(fecha);
            entrada.setUsuario(usuario);
            entrada.setProveedor(proveedorObj);
            entrada.setEntrada_folio_factura(folioFact);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        String[] productNames = request.getParameterValues("producto");
        String[] productPrices = request.getParameterValues("Precio");
        String[] productQuantities = request.getParameterValues("Cantidad");

        List<Producto> productList = new ArrayList<>();
        ArrayList<Producto> listProd = productoDao.getAll();

        String action = request.getParameter("action");
        if ("modificar".equalsIgnoreCase(action)) {
            // Lógica para modificar los productos
            for (int i = 0; i < productNames.length; i++) {
                for (Producto p : listProd) {
                    if (Objects.equals(productNames[i], p.getProducto_nombre())) {
                        try {
                            double price = Double.parseDouble(productPrices[i]);
                            int quantity = Integer.parseInt(productQuantities[i]);

                            p.setProducto_precio(price);
                            p.setProducto_cantidad(quantity);

                            if (productoDao.anadirProducto(p.getProducto_nombre(),p.getProducto_cantidad())) {
                                session.setAttribute("exito", "Producto insertado: " + p.getProducto_nombre());
                            } else {
                                session.setAttribute("error", "No se pudo insertar el producto: " + p.getProducto_nombre());
                            }
                        } catch (NumberFormatException e) {
                            e.printStackTrace();
                            session.setAttribute("error", "Error al actualizar producto: formato inválido.");
                        }
                    }else{
                        try {
                            String name = productNames[i];
                            double price = Double.parseDouble(productPrices[i]);
                            int quantity = Integer.parseInt(productQuantities[i]);

                            p.setProducto_nombre(name);
                            p.setProducto_precio(price);
                            p.setProducto_cantidad(quantity);

                            if (productoDao.insertProducto(p)) {
                                session.setAttribute("exito", "Producto actualizado: " + p.getProducto_nombre());
                            } else {
                                session.setAttribute("error", "No se pudo actualizar el producto: " + p.getProducto_nombre());
                            }
                        } catch (NumberFormatException e) {
                            e.printStackTrace();
                            session.setAttribute("error", "Error al actualizar producto: formato inválido.");
                        }
                    }
                }
            }
        } else if ("guardar".equalsIgnoreCase(action)) {
            entrada.setEstado("pendiente");
            int contador = 0;
            if (entradasDao.insertEntrada(entrada)) {
                for (Producto p : listProd) {

                }
                session.setAttribute("mensaje2", "Entrada guardada exitosamente.");
            } else {
                session.setAttribute("mensaje", "Error al guardar la entrada.");
            }
        } else if ("confirmar".equalsIgnoreCase(action)) {
            entrada.setEstado("exitoso");
            if (entradasDao.insertEntrada(entrada)) {
                session.setAttribute("mensaje2", "Entrada confirmada exitosamente.");
            } else {
                session.setAttribute("mensaje", "Error al confirmar la entrada.");
            }
        } else if ("cancelar".equalsIgnoreCase(action)) {
            if (entradasDao.deleteEntrada(entrada.getEntrada_id())) {
                session.setAttribute("mensaje2", "Entrada cancelada exitosamente.");
            } else {
                session.setAttribute("mensaje", "Error al cancelar la entrada.");
            }
        }

        response.sendRedirect(request.getContextPath() + "/InicioAlmacenista.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        EntradasDao eDao = new EntradasDao();
        String ruta = "";
        String operacion = req.getParameter("operacion");
        if(operacion.equals("terminar")){
            int id = Integer.parseInt(req.getParameter("idEnt"));
            Entradas ent = eDao.getOne(id);
            session.setAttribute("entrada", ent);
            resp.sendRedirect(req.getContextPath() + "/Entrada1.jsp");
        }
        if(operacion.equals("quitar")){
            int id = Integer.parseInt(req.getParameter("idEnt"));
            if(eDao.deleteEntrada(id)){
                session.setAttribute("mensaje", "Entrada eliminada exitosamente.");
                ruta = "/pendientes.jsp?alert=succes";
            }else{
                session.setAttribute("mensaje2", "Error al eliminar la entrada.");
                ruta = "/pendientes.jsp";
            }
            resp.sendRedirect(req.getContextPath()+ruta);
        }
    }
}