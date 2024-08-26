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

@WebServlet(name = "SalidaServlet", value = "/salida")
public class SalidaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Salidas salida = new Salidas();
        UsuarioDao usuarioDao = new UsuarioDao();
        SalidaDao salidaDao = new SalidaDao();
        Producto producto = new Producto();
        ProductoDao productoDao = new ProductoDao();
        DetalleSalidaDao dsDao = new DetalleSalidaDao();
        DetalleSalida salidaDetalle = new DetalleSalida();
        UnidMed unidmed = new UnidMed();
        UnidadDao unidadDao = new UnidadDao();
        Area areas = new Area();
        AreaDao areaDao = new AreaDao();


        String ruta ="/Salida2.jsp";
        String action = request.getParameter("action");
        System.out.println("La accion elegida es: "+action);

        String[] productNames = request.getParameterValues("producto[]");
        String[] productPrices = request.getParameterValues("Precio[]");
        String[] productQuantities = request.getParameterValues("Cantidad[]");
        String[] productUnity = request.getParameterValues("Unidad[]");

        ArrayList<Producto> productList = new ArrayList<>();
        ArrayList<DetalleSalida> salidaList = new ArrayList<>();
        ArrayList<Producto> listProd = productoDao.getAll();

        if (Objects.equals(action, "registrar")){
            try {
                String folio = request.getParameter("folio");
                System.out.println(folio);
                String area = request.getParameter("area");
                System.out.println(area);
                Date fecha = Date.valueOf(request.getParameter("fecha"));
                System.out.println(fecha);
                String empleado = request.getParameter("empleado");
                System.out.println(empleado);
                String unidad = request.getParameter("unidades");
                System.out.println(unidad);

                Usuario usuario = usuarioDao.getOne(empleado);
                Area AreaObj = areaDao.getOne2(area);
                UnidMed unidmedObj = unidadDao.getOne(Integer.parseInt(unidad));

                salida.setSalida_folio(folio);
                salida.setAreas(AreaObj);
                salida.setSalida_fecha(fecha);
                salida.setUsuarios(usuario);
                salida.setSalida_estado("exito");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            if (productNames != null) {
                int sumCant = 0;
                double sumPrec = 0;
                double sumAll = 0;
                Producto pr = new Producto();
                UnidMed um = new UnidMed();
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
                    um.setUnidad_nombre(productUnity[i]);
                }
                sumAll = sumCant * sumPrec;
                salidaDetalle.setSalidas(salida);
                salidaDetalle.setCantidad(sumCant);
                salidaDetalle.setProductos_salida(pr);
                salidaDetalle.setUnidad_medida(um);
                salidaDetalle.setValor_salida(sumAll);
                salidaList.add(salidaDetalle);
            } else {
                System.out.println("No se recibieron productos.");
            }
            salida.setDetalleSalida(salidaList);

            if(salida.getDetalleSalida() != null) {
                System.out.println("Arraylist lleno");
            }else{
                System.out.println("Arraylist vacio");
            }

            //if (Objects.equals(action, "finalizar")){
            if (salidaDao.insertSalida(salida)) {
                boolean confirma = false;
                System.out.println("Si se insertó");
                for (int i = 0; i < Objects.requireNonNull(productNames).length; i++) {
                    boolean productoEncontrado = false;

                    for (Producto p : listProd) {
                        if ((p.getProducto_nombre()).equalsIgnoreCase(productNames[i])){
                            p.setProducto_cantidad(p.getProducto_cantidad() - Integer.parseInt(productQuantities[i]));
                            if (productoDao.restarProducto(p.getProducto_nombre(), p.getProducto_cantidad())) {
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
                            session.setAttribute("Exito", "Producto restado exitosamente");
                        } else {
                            session.setAttribute("Fallo", "Producto restado no exitosamente");
                        }
                    }
                }

                if(confirma && !productList.isEmpty()){
                    for(Producto prop : productList){
                        salidaDetalle.setSalidas(salida);
                        salidaDetalle.setCantidad(prop.getProducto_cantidad());
                        salidaDetalle.setProductos_salida(prop);
                        salidaDetalle.setValor_salida(prop.getProducto_cantidad() * prop.getProducto_precio());
                        salidaList.add(salidaDetalle);
                        if(dsDao.insertDetalleSalida(salidaDetalle)){
                            System.out.println(salidaList.size());
                            System.out.println("Detalle insertado del producto: "+salidaDetalle.getProductos_salida().getProducto_nombre());
                        }
                    }
                }
                session.setAttribute("mensaje2", "Salida guardada exitosamente");
                ruta = "/Salida2.jsp?alert=si";
            }else{
                System.out.println("No se insertó");
                session.setAttribute("mensaje", "No se puede insertar la salida");
            }
        }


        if (Objects.equals(action, "guardar")) {
            int salidaNumero = 0;

            try {
                String folio = request.getParameter("folio");
                System.out.println(folio);
                String fecha = request.getParameter("fecha");
                System.out.println(fecha);
                String empleado = request.getParameter("employees");
                System.out.println(empleado);
                salidaNumero = folio.charAt(2);
                Usuario usuario = usuarioDao.getOne(empleado);

                salida.setSalida_folio(folio);
                salida.setSalida_fecha(Date.valueOf(fecha));
                salida.setUsuarios(usuario);

                salida.setSalida_estado("pendiente");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            if(salidaDao.insertSalida(salida)){
                for (int i = 1; i < Objects.requireNonNull(productNames).length; i++) {

                    producto.setProducto_nombre(productNames[i]);
                    producto.setProducto_precio(Double.parseDouble(productPrices[i]));
                    producto.setProducto_cantidad(Integer.parseInt(productQuantities[i]));

                    productList.add(producto);
                }
                System.out.println(action);
                session.setAttribute("mensaje2", "Salida exitosamente guardada");
                session.setAttribute("salidaNumero", salidaNumero);
                session.setAttribute("listaPend"+salidaNumero, productList);

                ruta = "/Salida2.jsp?alert=chi";
                salidaNumero ++;
            }else{
                session.setAttribute("mensaje", "No se puede guardar la salida");
            }
        }

        if(Objects.equals(action, "terminar")){
            session.setAttribute(action,"terminar");
            response.sendRedirect("salida");
        }

        if(Objects.equals(action, "quitar")){
            session.setAttribute(action,"quitar");
            response.sendRedirect("salida");
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
        SalidaDao sDao = new SalidaDao();
        String ruta = "/Salida2.jsp";
        String action1 = (String) session.getAttribute("action1");
        System.out.println("La accion es: "+action1);
        String action2 = (String) session.getAttribute("action2");
        System.out.println("La accion es: "+action2);
        int salidaNumero = 0;
        Salidas salidas = new Salidas();
        UsuarioDao usuarioDao = new UsuarioDao();
        SalidaDao salidaDao = new SalidaDao();
        ProductoDao productoDao = new ProductoDao();
        DetalleSalidaDao dsDao = new DetalleSalidaDao();
        DetalleSalida salidaDetalle = new DetalleSalida();


        if(Objects.equals(action1, "continuar")){
            String folio = session.getAttribute("folioS").toString();
            System.out.println("El folio es: "+folio);
            Salidas sal = salidaDao.getOne(folio);
            session.setAttribute("salida", sal);
            resp.sendRedirect(req.getContextPath() + "/Salida2.jsp?alert=sucessfull");
            session.removeAttribute("action");
        }
        if(Objects.equals(action2, "quitar")){
            int id = (int) session.getAttribute("Sid");
            System.out.println("El id es: "+id);
            if(salidaDao.deleteSalida(id)){
                session.setAttribute("mensaje2", "Salida eliminada exitosamente.");
                session.removeAttribute("salidaNumero");
                session.removeAttribute("listaPend"+salidaNumero);
                resp.sendRedirect(req.getContextPath()+"/pendientes.jsp?alert=succes");
            }else{
                session.setAttribute("mensaje", "Error al eliminar la salida.");
                resp.sendRedirect(req.getContextPath()+"/pendientes.jsp");
            }
            session.removeAttribute("action");
        }
    }
}