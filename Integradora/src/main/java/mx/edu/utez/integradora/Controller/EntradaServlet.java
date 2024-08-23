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
import java.sql.Date;
import java.util.ArrayList;
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
        DetalleEntradaDao deDao = new DetalleEntradaDao();
        DetalleEntrada entradaDetalle = new DetalleEntrada();
        Producto producto = new Producto();

        String ruta = "/Entrada1.jsp";
        String action = request.getParameter("action");
        System.out.println("La accion elegida es: " + action);

        String[] productNames = request.getParameterValues("producto[]");
        String[] productPrices = request.getParameterValues("Precio[]");
        String[] productQuantities = request.getParameterValues("Cantidad[]");

        ArrayList<Producto> productList = new ArrayList<>();
        ArrayList<DetalleEntrada> entradList = new ArrayList<>();
        ArrayList<Producto> listProd = productoDao.getAll();

        if (Objects.equals(action, "registrar")) {
            try {
                String folio = request.getParameter("folio");
                System.out.println(folio);
                Date fecha = Date.valueOf(request.getParameter("fecha"));
                System.out.println(fecha);
                String empleado = request.getParameter("employees");
                System.out.println(empleado);
                String proveedor = request.getParameter("suppliers");
                System.out.println(proveedor);
                int folioFact = Integer.parseInt(request.getParameter("fact"));
                System.out.println(folioFact);

                Usuario usuario = usuarioDao.getOne(empleado);
                Proveedor proveedorObj = proveedorDao.getOne(proveedor);

                entrada.setEntrada_folio(folio);
                entrada.setEntrada_fecha(fecha);
                entrada.setUsuario(usuario);
                entrada.setProveedor(proveedorObj);
                entrada.setEntrada_folio_factura(folioFact);
                entrada.setEstado("exito");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            if (productNames != null) {
                int sumCant = 0;
                double sumPrec = 0;
                double sumAll = 0;
                System.out.println("Número de productos: " + productNames.length);
                for (int i = 0; i < productNames.length; i++) {
                    System.out.println("Producto: " + productNames[i]);
                    System.out.println("Cantidad: " + productQuantities[i]);
                    System.out.println("Precio: " + productPrices[i]);

                    sumCant += Integer.parseInt(productQuantities[i]);
                    sumPrec += Double.parseDouble(productPrices[i]);
                }
            } else {
                System.out.println("No se recibieron productos.");
            }
            entrada.setDetalles(entradList);

            if (entrada.getDetalles() != null) {
                System.out.println("Arraylist lleno");
                System.out.println(entradList.size());
            } else {
                System.out.println("Arraylist vacio");
            }

            //if (Objects.equals(action, "finalizar")){
            if (entradasDao.insertEntrada(entrada)) {
                boolean confirma = false;
                System.out.println("Si se insertó");
                for (int i = 0; i < Objects.requireNonNull(productNames).length; i++) {
                    boolean productoEncontrado = false;

                    for (Producto p : listProd) {
                        if ((p.getProducto_nombre()).equalsIgnoreCase(productNames[i])) {
                            p.setProducto_cantidad(p.getProducto_cantidad() + Integer.parseInt(productQuantities[i]));
                            if (productoDao.anadirProducto(p.getProducto_nombre(), p.getProducto_cantidad())) {
                                confirma = true;
                                productList.add(p);
                                session.setAttribute("Exito", "Producto modificado exitosamente");
                            } else {
                                session.setAttribute("Fallo", "Producto modificado no exitosamente");
                            }
                            productoEncontrado = true;
                            break;
                        }
                    }

                    if (!productoEncontrado) {
                        Producto prods = new Producto();
                        prods.setProducto_nombre(productNames[i]);
                        prods.setProducto_precio(Double.parseDouble(productPrices[i]));
                        prods.setProducto_cantidad(Integer.parseInt(productQuantities[i]));

                        if (productoDao.insertProducto(prods)) {
                            confirma = true;
                            productList.add(productoDao.getOne(prods.getProducto_nombre()));
                            session.setAttribute("Exito", "Producto insertado exitosamente");
                        } else {
                            session.setAttribute("Fallo", "Producto insertado no exitosamente");
                        }
                    }
                }

                if (confirma && !productList.isEmpty()) {
                    for (Producto prop : productList) {
                        entradaDetalle.setEntradas(entrada);
                        entradaDetalle.setCantidad(prop.getProducto_cantidad());
                        entradaDetalle.setProductos(prop);
                        entradaDetalle.setValor_total(prop.getProducto_cantidad() * prop.getProducto_precio());
                        entradList.add(entradaDetalle);
                        if (deDao.insertDetalleEntrada(entradaDetalle)) {
                            System.out.println(entradList.size());
                            System.out.println("Detalle insertado del producto: " + entradaDetalle.getProductos().getProducto_nombre());
                        }
                    }
                }
                session.setAttribute("mensaje2", "Entrada guardada exitosamente");
                ruta = "/Entrada1.jsp?alert=si";
            } else {
                System.out.println("No se insertó");
                session.setAttribute("mensaje", "No se puede insertar la entrada");
            }
        }
        if (Objects.equals(action, "guardar")) {
            int entradaNumero = 0;

            try {
                String folio = request.getParameter("folio");
                System.out.println(folio);
                String fecha = request.getParameter("fecha");
                System.out.println(fecha);
                String empleado = request.getParameter("employees");
                System.out.println(empleado);
                String proveedor = request.getParameter("suppliers");
                System.out.println(proveedor);
                int folioFact = Integer.parseInt(request.getParameter("fact"));
                System.out.println(folioFact);
                entradaNumero = folio.charAt(2);

                Usuario usuario = usuarioDao.getOne(empleado);
                Proveedor proveedorObj = proveedorDao.getOne(proveedor);

                entrada.setEntrada_folio(folio);
                entrada.setEntrada_fecha(Date.valueOf(fecha));
                entrada.setUsuario(usuario);
                entrada.setProveedor(proveedorObj);
                entrada.setEntrada_folio_factura(folioFact);
                entrada.setEstado("pendiente");
                System.out.println("Entrada estado: "+entrada.getEstado());
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            if (entradasDao.insertEntrada(entrada)) {
                boolean confirma = false;
                for (int i = 0; i < Objects.requireNonNull(productNames).length; i++) {
                    boolean productoEncontrado = false;

                    for (Producto p : listProd) {
                        if ((p.getProducto_nombre()).equalsIgnoreCase(productNames[i])) {
                            p.setProducto_cantidad(p.getProducto_cantidad() + Integer.parseInt(productQuantities[i]));
                            if (productoDao.anadirProducto(p.getProducto_nombre(), p.getProducto_cantidad())) {
                                confirma = true;
                                productList.add(p);
                                session.setAttribute("Exito", "Producto modificado exitosamente");
                            } else {
                                session.setAttribute("Fallo", "Producto modificado no exitosamente");
                            }
                            productoEncontrado = true;
                            break;
                        }
                    }

                    if (!productoEncontrado) {
                        Producto prods = new Producto();
                        prods.setProducto_nombre(productNames[i]);
                        prods.setProducto_precio(Double.parseDouble(productPrices[i]));
                        prods.setProducto_cantidad(Integer.parseInt(productQuantities[i]));

                        if (productoDao.insertProducto(prods)){
                            confirma = true;
                            productList.add(productoDao.getOne(prods.getProducto_nombre()));
                            session.setAttribute("Exito", "Producto insertado exitosamente");
                        } else {
                            session.setAttribute("Fallo", "Producto insertado no exitosamente");
                        }
                    }
                }
                System.out.println("Entrada guardada exitosamente");

                if (confirma && !productList.isEmpty()) {
                    for (Producto propi : productList) {
                        entradaDetalle.setEntradas(entrada);
                        entradaDetalle.setCantidad(propi.getProducto_cantidad());
                        entradaDetalle.setProductos(propi);
                        entradaDetalle.setValor_total(propi.getProducto_cantidad() * propi.getProducto_precio());
                        entradList.add(entradaDetalle);

                        if (deDao.insertDetalleEntrada(entradaDetalle)) {
                            System.out.println(entradList.size());
                            System.out.println("Detalle guardado del producto: " + entradaDetalle.getProductos().getProducto_nombre());
                            System.out.println("Detalle guardado del producto: " + entradaDetalle.getEntradas().getEntrada_folio());
                        }else{
                            System.out.println("Detalle guardado no exitosamente");
                        }
                    }
                }
                System.out.println(action);
                session.setAttribute("mensaje2", "Entrada exitosamente guardada");
                session.setAttribute("entradList", entradList);
                session.setAttribute("listaPend", productList);

                ruta = "/Entrada1.jsp?alert=chi";
            } else {
                session.setAttribute("mensaje", "No se puede guardar la entrada");
            }
        }

        if (Objects.equals(action, "terminar")) {
            try {
                String folio = request.getParameter("folio");
                System.out.println(folio);
                Date fecha = Date.valueOf(request.getParameter("fecha"));
                System.out.println(fecha);
                String empleado = request.getParameter("employees");
                System.out.println(empleado);
                String proveedor = request.getParameter("suppliers");
                System.out.println(proveedor);
                int folioFact = Integer.parseInt(request.getParameter("fact"));
                System.out.println(folioFact);

                Usuario usuario = usuarioDao.getOne(empleado);
                Proveedor proveedorObj = proveedorDao.getOne(proveedor);

                entrada.setEntrada_folio(folio);
                entrada.setEntrada_fecha(fecha);
                entrada.setUsuario(usuario);
                entrada.setProveedor(proveedorObj);
                entrada.setEntrada_folio_factura(folioFact);
                entrada.setEstado("exito");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            if (productNames != null) {
                int sumCant = 0;
                double sumPrec = 0;
                double sumAll = 0;
                System.out.println("Número de productos: " + productNames.length);
                for (int i = 0; i < productNames.length; i++) {
                    System.out.println("Producto: " + productNames[i]);
                    System.out.println("Cantidad: " + productQuantities[i]);
                    System.out.println("Precio: " + productPrices[i]);

                    sumCant += Integer.parseInt(productQuantities[i]);
                    sumPrec += Double.parseDouble(productPrices[i]);
                }
            } else {
                System.out.println("No se recibieron productos.");
            }
            entrada.setDetalles(entradList);

            if (entrada.getDetalles() != null) {
                System.out.println("Arraylist lleno");
                System.out.println(entradList.size());
            } else {
                System.out.println("Arraylist vacio");
            }

            if (entradasDao.updateEntrada(entrada)) {
                boolean confirma = false;
                System.out.println("Si se cambió");
                for (int i = 0; i < Objects.requireNonNull(productNames).length; i++) {
                    boolean productoEncontrado = false;

                    for (Producto p : listProd) {
                        if ((p.getProducto_nombre()).equalsIgnoreCase(productNames[i])) {
                            p.setProducto_cantidad(p.getProducto_cantidad() + Integer.parseInt(productQuantities[i]));
                            if (productoDao.anadirProducto(p.getProducto_nombre(), p.getProducto_cantidad())) {
                                confirma = true;
                                productList.add(p);
                                session.setAttribute("Exito", "Producto modificado exitosamente");
                            } else {
                                session.setAttribute("Fallo", "Producto modificado no exitosamente");
                            }
                            productoEncontrado = true;
                            break;
                        }
                    }

                    if (!productoEncontrado) {
                        Producto prods = new Producto();
                        prods.setProducto_nombre(productNames[i]);
                        prods.setProducto_precio(Double.parseDouble(productPrices[i]));
                        prods.setProducto_cantidad(Integer.parseInt(productQuantities[i]));

                        if (productoDao.insertProducto(prods)) {
                            confirma = true;
                            productList.add(productoDao.getOne(prods.getProducto_nombre()));
                            session.setAttribute("Exito", "Producto insertado exitosamente");
                        } else {
                            session.setAttribute("Fallo", "Producto insertado no exitosamente");
                        }
                    }
                }

                if (confirma && !productList.isEmpty()) {
                    for (Producto prop : productList) {
                        entradaDetalle.setEntradas(entrada);
                        entradaDetalle.setCantidad(prop.getProducto_cantidad());
                        entradaDetalle.setProductos(prop);
                        entradaDetalle.setValor_total(prop.getProducto_cantidad() * prop.getProducto_precio());
                        entradList.add(entradaDetalle);
                        if (deDao.updateDetalleEntrada(entradaDetalle)) {
                            System.out.println(entradList.size());
                            System.out.println("Detalle insertado del producto: " + entradaDetalle.getProductos().getProducto_nombre());
                        }
                    }
                }
                session.setAttribute("mensaje2", "Entrada actualizada exitosamente");
                ruta = "/Entrada1.jsp?alert=si";
            } else {
                System.out.println("No se cambió");
                session.setAttribute("mensaje", "No se puede actualizar la entrada");
            }
        }

        // Lógica para modificar los productos

        response.sendRedirect(request.getContextPath() + ruta);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        EntradasDao eDao = new EntradasDao();
        String action = req.getParameter("action");
        System.out.println("La accion2 es: " + action);
        DetalleEntradaDao deDao = new DetalleEntradaDao();

        if (Objects.equals(action, "continuar")) {
            String folio = req.getParameter("FolioE");
            System.out.println("El folio es: " + folio);
            Entradas ent = eDao.getOne(folio);
            session.setAttribute("entrada", ent);
            session.setAttribute("folioTerminar", folio);
            ArrayList<DetalleEntrada> detEn = deDao.getAllByEntradaFolio(folio);
            System.out.println(detEn.size());

            ArrayList<Producto> Enters = new ArrayList<>();

            ArrayList<DetalleEntrada> Details = new ArrayList<>(detEn);

            Producto p1 = Details.get(0).getProductos();
            System.out.println(p1.getProducto_nombre());

            for(int i = 1; i < Details.size(); i ++){
                Producto papu = new Producto(Details.get(i).getProductos().getProducto_id(), Details.get(i).getProductos().getProducto_nombre(), Details.get(i).getProductos().getProducto_precio(), Details.get(i).getProductos().getProducto_cantidad());
                Enters.add(papu);
                System.out.println(papu.getProducto_nombre());
                System.out.println(papu.getProducto_cantidad());
            }

            session.setAttribute("PrimerProd", p1);
            session.setAttribute("Productos", Enters);

            resp.sendRedirect(req.getContextPath()+"/EntradaLlena.jsp?alert=sucessfull");
            session.removeAttribute("action");
        }

        if (Objects.equals(action, "quitar")) {
            int id = Integer.parseInt(req.getParameter("idEnt"));
            System.out.println("El  id es: " + id);
            if (eDao.deleteEntrada(id)) {
                session.setAttribute("mensaje2", "Entrada eliminada exitosamente.");
                session.removeAttribute("entradList");
                session.removeAttribute("listaPend");
                resp.sendRedirect(req.getContextPath() + "/pendientes.jsp?alert=success");
            } else {
                session.setAttribute("mensaje", "Error al eliminar la entrada.");
                resp.sendRedirect(req.getContextPath() + "/pendientes.jsp");
            }
            session.removeAttribute("action");
        }
    }
}