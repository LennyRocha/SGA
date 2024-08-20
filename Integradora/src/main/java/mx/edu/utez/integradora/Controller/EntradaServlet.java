package mx.edu.utez.integradora.Controller;

import com.google.protobuf.TextFormat;
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
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        DetalleEntradaDao deDao = new DetalleEntradaDao();
        DetalleEntrada entradaDetalle = new DetalleEntrada();

        String ruta ="/Entrada1.jsp";
        String action = request.getParameter("action");
        System.out.println("La accion elegida es: "+action);

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

        /*String nombre1 = request.getParameter("producto");
        double precio = Double.parseDouble(request.getParameter("Precio"));
        int cantidad = Integer.parseInt(request.getParameter("Cantidad"));*/

        String[] productNames = request.getParameterValues("producto[]");
        String[] productPrices = request.getParameterValues("Precio[]");
        String[] productQuantities = request.getParameterValues("Cantidad[]");

        ArrayList<Producto> productList = new ArrayList<>();
        ArrayList<DetalleEntrada> entradList = new ArrayList<>();
        ArrayList<Producto> listProd = productoDao.getAll();

        if (productNames != null) {
            int sumCant = 0;
            double sumPrec = 0;
            double sumAll = 0;
            Producto pr = new Producto();
            System.out.println("Número de productos: " + productNames.length);
            for (int i = 0; i < productNames.length; i++) {
                System.out.println("Producto: " + productNames[i]);
                System.out.println("Cantidad: " + productQuantities[i]);
                System.out.println("Precio: " + productPrices[i]);

                sumCant += Integer.parseInt(productQuantities[i]);
                sumPrec += Double.parseDouble(productPrices[i]);

                pr.setProducto_nombre(productNames[i]);
                pr.setProducto_cantidad(Integer.parseInt(productQuantities[i]));
                pr.setProducto_precio(Double.parseDouble(productPrices[i]));
            }
            sumAll = sumCant * sumPrec;
            entradaDetalle.setEntradas(entrada);
            entradaDetalle.setCantidad(sumCant);
            entradaDetalle.setProductos(pr);
            entradaDetalle.setValor_total(sumAll);
            entradList.add(entradaDetalle);
            entrada.setDetalles(entradList);
        } else {
            System.out.println("No se recibieron productos.");
        }

        //if (Objects.equals(action, "finalizar")){
        if (entradasDao.insertEntrada(entrada)) {
            System.out.println("Si se insertó");
            for (int i = 0; i < Objects.requireNonNull(productNames).length; i++) {
                boolean productoEncontrado = false;

                for (Producto p : listProd) {
                    System.out.println("producto: " + p.getProducto_nombre());
                    System.out.println("productNames: " + productNames[i]);

                    if (p.getProducto_nombre().equals(productNames[i])) {
                        p.setProducto_cantidad(p.getProducto_cantidad() + Integer.parseInt(productQuantities[i]));
                        if (productoDao.anadirProducto(p.getProducto_nombre(), p.getProducto_cantidad())) {
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
                        session.setAttribute("Exito", "Producto insertado exitosamente");
                    } else {
                        session.setAttribute("Fallo", "Producto insertado no exitosamente");
                    }
                }
            }
            session.setAttribute("mensaje2", "Entrada exitosamente");
            ruta = "/Entrada1.jsp?alert=si";
        }else{
            System.out.println("No se insertó");
            session.setAttribute("mensaje", "No se puede insertar la entrada");
        }
            System.out.println(action);
        //}
            // Lógica para modificar los productos
        //Desde aqui se cambiará

        response.sendRedirect(request.getContextPath() + ruta);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        EntradasDao eDao = new EntradasDao();
        String ruta = "/Entrada1.jsp";
        String action = req.getParameter("action");
        int entradaNumero = 0;

        if (Objects.equals(action, "guardar")) {
            Entradas entrada = new Entradas();
            UsuarioDao usuarioDao = new UsuarioDao();
            ProveedorDao proveedorDao = new ProveedorDao();
            EntradasDao entradasDao = new EntradasDao();
            ProductoDao productoDao = new ProductoDao();

            try {
                String folio = req.getParameter("folio");
                System.out.println(folio);
                Date fecha = Date.valueOf(req.getParameter("fecha"));
                System.out.println(fecha);
                String empleado = req.getParameter("employees");
                System.out.println(empleado);
                String proveedor = req.getParameter("suppliers");
                System.out.println(proveedor);
                int folioFact = Integer.parseInt(req.getParameter("fact"));
                System.out.println(folioFact);
                entradaNumero = folio.charAt(2);

                Usuario usuario = usuarioDao.getOne(empleado);
                Proveedor proveedorObj = proveedorDao.getOne(proveedor);

                entrada.setEntrada_folio(folio);
                entrada.setEntrada_fecha(fecha);
                entrada.setUsuario(usuario);
                entrada.setProveedor(proveedorObj);
                entrada.setEntrada_folio_factura(folioFact);
                entrada.setEstado("pendiente");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            String nombre1 = req.getParameter("producto");
            double precio = Double.parseDouble(req.getParameter("Precio"));
            int cantidad = Integer.parseInt(req.getParameter("Cantidad"));

            String[] productNames = new String[cantidad];
            Double[] productPrices = new Double[cantidad];
            int[] productQuantities = new int[cantidad];

            List<Producto> productList = new ArrayList<>();
            ArrayList<Producto> listProd = productoDao.getAll();
            Producto prod = new Producto();

            productNames[0] = nombre1;
            productPrices[0] = precio;
            productQuantities[0] = cantidad;

            prod.setProducto_nombre(productNames[0]);
            prod.setProducto_precio(productPrices[0]);
            prod.setProducto_cantidad(productQuantities[0]);

            if(entradasDao.insertEntrada(entrada)){
                for (int i = 1; i <= cantidad; i++) {

                    productNames[i] = req.getParameter("producto" + i);
                    productPrices[i] = Double.valueOf(req.getParameter("Precio" + i));
                    productQuantities[i] = Integer.parseInt(req.getParameter("Cantidad" + i));

                    prod.setProducto_nombre(productNames[i]);
                    prod.setProducto_precio(productPrices[i]);
                    prod.setProducto_cantidad(productQuantities[i]);

                    productList.add(prod);
                }
                System.out.println(action);
                session.setAttribute("mensaje2", "Entrada exitosamente guardada");
                session.setAttribute("entradaNumero", entradaNumero);
                session.setAttribute("listaPend"+entradaNumero, productList);

                ruta = "/entrada1.jsp?alert=chi";
                entradaNumero ++;
            }else{
                session.setAttribute("mensaje", "No se puede guardar la entrada");
            }
            resp.sendRedirect(req.getContextPath() + ruta);
        }

        if(action.equals("terminar")){
            int id = Integer.parseInt(req.getParameter("idEnt"));
            Entradas ent = eDao.getOne(id);
            session.setAttribute("entrada", ent);
            resp.sendRedirect(req.getContextPath() + "/Entrada1.jsp?alert=sucessfull");
        }
        if(action.equals("quitar")){
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