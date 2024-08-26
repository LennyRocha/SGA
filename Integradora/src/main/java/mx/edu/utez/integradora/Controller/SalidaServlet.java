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
        System.out.println("La accion elegida es: " + action);

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
                salidaDetalle.setUnidad_medida(String.valueOf(um));
                salidaDetalle.setValor_salida(sumAll);
                salidaList.add(salidaDetalle);
            } else {
                System.out.println("No se recibieron productos.");
            }
            salida.setDetalleSalida(salidaList);

            if(salida.getDetalleSalida() != null) {
                System.out.println("Arraylist lleno");
                System.out.println(salidaList.size());
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
                        salidaDetalle.setUnidad_medida(String.valueOf(unidmed));
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
                String area = request.getParameter("area");
                System.out.println(area);
                String empleado = request.getParameter("employees");
                System.out.println(empleado);
                salidaNumero = folio.charAt(2);
                Usuario usuario = usuarioDao.getOne(empleado);

                salida.setSalida_folio(folio);
                salida.setSalida_fecha(Date.valueOf(fecha));
                salida.setUsuarios(usuario);
                salida.setSalida_estado("pendiente");
                System.out.println("Entrada estado: "+salida.getSalida_estado());
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            if(salidaDao.insertSalida(salida)){
                boolean confirma = false;
                for (int i = 1; i < Objects.requireNonNull(productNames).length; i++) {
                    boolean productoEncontrado = false;

                    for (Producto p : listProd) {
                        if ((p.getProducto_nombre()).equalsIgnoreCase(productNames[i])) {
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
                }
                System.out.println(action);
                session.setAttribute("mensaje2", "Salida exitosamente guardada");

                if (confirma && !productList.isEmpty()) {
                    for (Producto propi : productList) {
                        salidaDetalle.setSalidas(salida);
                        salidaDetalle.setCantidad(propi.getProducto_cantidad());
                        salidaDetalle.setProductos_salida(propi);
                        salidaDetalle.setValor_salida(propi.getProducto_cantidad() * propi.getProducto_precio());
                        salidaList.add(salidaDetalle);
                        salidaDetalle.setUnidad_medida(String.valueOf(unidmed));
                        if (dsDao.insertDetalleSalida(salidaDetalle)) {
                            System.out.println(salidaList.size());
                            System.out.println("Detalle guardado del producto: " + salidaDetalle.getProductos_salida().getProducto_nombre());
                            System.out.println("Detalle guardado del producto: " + salidaDetalle.getSalidas().getSalida_folio());
                            System.out.println("Detalle guardado del producto: " + salidaDetalle.getUnidad_medida().getUnidad_nombre());
                        }else{
                            System.out.println("Detalle guardado no exitosamente");
                        }
                    }
                }
                System.out.println(action);
                session.setAttribute("mensaje2", "Salida exitosamente guardada");
                session.setAttribute("salidaList", salidaList);
                session.setAttribute("listaPend", productList);

                ruta = "/Salida2.jsp?alert=chi";
                salidaNumero ++;
            }else{
                session.setAttribute("mensaje", "No se puede guardar la salida");
            }
        }

        if(Objects.equals(action, "terminar")){
            try {
                String folio = request.getParameter("folio");
                System.out.println(folio);
                Date fecha = Date.valueOf(request.getParameter("fecha"));
                System.out.println(fecha);
                String empleado = request.getParameter("employees");
                System.out.println(empleado);
                String area = request.getParameter("area");
                System.out.println(area);
                String unidad = request.getParameter("unidad");
                System.out.println(unidad);

                Usuario usuario = usuarioDao.getOne(empleado);
                Area AreaObj = areaDao.getOne(Integer.parseInt(area));

                salida.setSalida_folio(folio);
                salida.setSalida_fecha(fecha);
                salida.setUsuarios(usuario);
                salida.setAreas(AreaObj);
                salidaDetalle.setUnidad_medida(unidad);
                salida.setSalida_estado("exito");
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
            salida.setDetalleSalida(salidaList);

            if (salida.getDetalleSalida() != null) {
                System.out.println("Arraylist lleno");
                System.out.println(salidaList.size());
            } else {
                System.out.println("Arraylist vacio");
            }

            if (salidaDao.updateSalida(salida)) {
                boolean confirma = false;
                System.out.println("Si se cambió");
                for (int i = 0; i < Objects.requireNonNull(productNames).length; i++) {
                    boolean productoEncontrado = false;

                    for (Producto p : listProd) {
                        if ((p.getProducto_nombre()).equalsIgnoreCase(productNames[i])) {
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

                }

                if (confirma && !productList.isEmpty()) {
                    for (Producto prop : productList) {
                        salidaDetalle.setSalidas(salida);
                        salidaDetalle.setCantidad(prop.getProducto_cantidad());
                        salidaDetalle.setProductos_salida(prop);
                        salidaDetalle.setValor_salida(prop.getProducto_cantidad() * prop.getProducto_precio());
                        salidaList.add(salidaDetalle);
                        if (dsDao.updateDetalleSalida(salidaDetalle)) {
                            System.out.println(salidaList.size());
                            System.out.println("Detalle insertado del producto: " + salidaDetalle.getProductos_salida().getProducto_nombre());
                        }
                    }
                }
                session.setAttribute("mensaje2", "Salida actualizada exitosamente");
                ruta = "/Salida2.jsp?alert=si";
            } else {
                System.out.println("No se cambió");
                session.setAttribute("mensaje", "No se puede actualizar la salida");
            }
        }
        response.sendRedirect(request.getContextPath() + ruta);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        SalidaDao sDao = new SalidaDao();
        String action = req.getParameter("action");
        System.out.println("La accion2 es: " + action);
        DetalleSalidaDao dsDao = new DetalleSalidaDao();

        if (Objects.equals(action, "continuar")) {
            String folio = req.getParameter("FolioS");
            System.out.println("El folio es: " + folio);
            Salidas sal = sDao.getOne(folio);
            session.setAttribute("salida", sal);
            session.setAttribute("folioTerminar", folio);
            ArrayList<DetalleSalida> detSa = dsDao.getAllBySalidaFoio(folio);
            System.out.println(detSa.size());

            ArrayList<Producto> Sald = new ArrayList<>();

            ArrayList<DetalleSalida> Details = new ArrayList<>(detSa);

            Producto p1 = Details.get(0).getProductos_salida();
            System.out.println(p1.getProducto_nombre());

            for(int i = 1; i < Details.size(); i ++){
                Producto papu = new Producto(Details.get(i).getProductos_salida().getProducto_id(), Details.get(i).getProductos_salida().getProducto_nombre(), Details.get(i).getProductos_salida().getProducto_precio(), Details.get(i).getProductos_salida().getProducto_cantidad());
                Sald.add(papu);
                System.out.println(papu.getProducto_nombre());
                System.out.println(papu.getProducto_cantidad());
            }

            session.setAttribute("PrimerProd", p1);
            session.setAttribute("Productos", Sald);

            resp.sendRedirect(req.getContextPath()+"/SalidaLlena.jsp?alert=sucessfull");
            session.removeAttribute("action");
        }

        if (Objects.equals(action, "quitar")) {
            int id = Integer.parseInt(req.getParameter("idSal"));
            System.out.println("El  id es: " + id);
            if (sDao.deleteSalida(id)) {
                session.setAttribute("mensaje2", "Salida eliminada exitosamente.");
                session.removeAttribute("salidaList");
                session.removeAttribute("listaPend");
                resp.sendRedirect(req.getContextPath() + "/pendientes.jsp?alert=success");
            } else {
                session.setAttribute("mensaje", "Error al eliminar la salida.");
                resp.sendRedirect(req.getContextPath() + "/pendientes.jsp");
            }
            session.removeAttribute("action");
        }
    }
}