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

        int counter = Integer.parseInt(request.getParameter("contador"));
        System.out.println(counter);
        String action = request.getParameter("action");

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
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        String nombre1 = request.getParameter("producto");
        double precio = Double.parseDouble(request.getParameter("Precio"));
        int cantidad = Integer.parseInt(request.getParameter("Cantidad"));

        String[] productNames = new String[cantidad];
        Double[] productPrices = new Double[cantidad];
        int [] productQuantities = new int[cantidad];

        List<Producto> productList = new ArrayList<>();
        ArrayList<Producto> listProd = productoDao.getAll();
        Producto prod = new Producto();

        productNames[0] = nombre1;
        productPrices[0] = precio;
        productQuantities[0] = cantidad;

        prod.setProducto_nombre(productNames[0]);
        prod.setProducto_precio(productPrices[0]);
        prod.setProducto_cantidad(productQuantities[0]);

        productList.add(prod);

        for(int i = 1; i <= cantidad; i++){

            productNames[i] = request.getParameter("producto" + i);
            productPrices[i] = Double.valueOf(request.getParameter("Precio"+i));
            productQuantities[i] = Integer.parseInt(request.getParameter("Cantidad"+i));

            prod.setProducto_nombre(productNames[i]);
            prod.setProducto_precio(productPrices[i]);
            prod.setProducto_cantidad(productQuantities[i]);

            productList.add(prod);
        }

        if (entradasDao.insertEntrada(entrada)) {
            for (int i = 0; i < productList.size(); i++) {
                for (Producto p : listProd) {
                    if (p.getProducto_nombre().equals(productNames[i])) {
                        p.setProducto_cantidad(p.getProducto_cantidad()+1);
                        if(productoDao.anadirProducto(p.getProducto_nombre(),p.getProducto_cantidad())){
                            session.setAttribute("Exito", "Producto modificado exitosamente");
                        }else{
                            session.setAttribute("Fallo", "Producto modificado no exitosamente");
                        }
                    }else{
                        if (productoDao.insertProducto(productList.get(i))){
                            session.setAttribute("Exito", "Producto insertado exitosamente");
                        }else{
                            session.setAttribute("Fallo", "Producto insertado no exitosamente");
                        }
                    }
                }
            }
            session.setAttribute("mensaje2", "Entrada exitosamente");
        }else{
            session.setAttribute("mensaje", "No se puede insertar la entrada");
        }
            System.out.println(action);
            // Lógica para modificar los productos
        //Desde aqui se cambiará
        if (Objects.equals(action, "finalizar")) {
            System.out.println(action);
            entrada.setEstado("exitoso");
            if (entradasDao.insertEntrada(entrada)) {
                session.setAttribute("mensaje2", "Entrada confirmada exitosamente.");
            } else {
                session.setAttribute("mensaje", "Error al confirmar la entrada.");
            }
        } else if (Objects.equals(action, "cancelar")) {
            System.out.println(action);
            if (entradasDao.deleteEntrada(entrada.getEntrada_id())) {
                session.setAttribute("mensaje2", "Entrada cancelada exitosamente.");
            } else {
                session.setAttribute("mensaje", "Error al cancelar la entrada.");
            }
        }

        response.sendRedirect(request.getContextPath() + "/Entrada1.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        EntradasDao eDao = new EntradasDao();
        String ruta = "";
        String action = req.getParameter("operacion");

        Entradas entrada = new Entradas();
        UsuarioDao usuarioDao = new UsuarioDao();
        ProveedorDao proveedorDao = new ProveedorDao();
        EntradasDao entradasDao = new EntradasDao();
        ProductoDao productoDao = new ProductoDao();

        try {
            String folio = req.getParameter("folio");
            Date fecha = Date.valueOf(req.getParameter("fecha"));
            System.out.println(fecha);
            String empleado = req.getParameter("employees");
            String proveedor = req.getParameter("suppliers");
            int folioFact = Integer.parseInt(req.getParameter("fact"));

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

        String[] productNames = req.getParameterValues("producto");
        String[] productPrices = req.getParameterValues("Precio");
        String[] productQuantities = req.getParameterValues("Cantidad");

        List<Producto> productList = new ArrayList<>();
        ArrayList<Producto> listProd = productoDao.getAll();

        if(action.equals("terminar")){
            int id = Integer.parseInt(req.getParameter("idEnt"));
            Entradas ent = eDao.getOne(id);
            session.setAttribute("entrada", ent);
            resp.sendRedirect(req.getContextPath() + "/Entrada1.jsp");
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

        if (Objects.equals(action, "guardar")) {
            System.out.println(action);
            entrada.setEstado("pendiente");
            if (entradasDao.insertEntrada(entrada)) {
                session.setAttribute("mensaje2", "Entrada guardada exitosamente.");
            } else {
                session.setAttribute("mensaje", "Error al guardar la entrada.");
            }
        }
    }
}