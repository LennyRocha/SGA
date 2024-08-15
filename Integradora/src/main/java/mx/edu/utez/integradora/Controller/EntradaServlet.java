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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static java.lang.System.err;

@WebServlet(name="EntradaServlet", value="/entrada")
public class EntradaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Entradas entrada = new Entradas();
        UsuarioDao dao = new UsuarioDao();
        ProveedorDao pdao = new ProveedorDao();
        EntradasDao eDao = new EntradasDao();

        try{
            int folio = Integer.parseInt(request.getParameter("folio"));
            Timestamp fecha = Timestamp.valueOf(request.getParameter("fecha"));
            String empleado = request.getParameter("employees");
            String proveedor  = request.getParameter("suppliers");
            int folioFact = Integer.parseInt(request.getParameter("fact"));

            Usuario u = dao.getOne(empleado);
            Proveedor pr = pdao.getOne(proveedor);

            entrada.setEntrada_folio(folio);
            entrada.setEntrada_fecha(fecha);
            entrada.setUsuario(u);
            entrada.setProveedor(pr);
            entrada.setEntrada_folio_factura(folioFact);
        }catch (NumberFormatException e){
            e.printStackTrace();
        }

        String[] productNames = request.getParameterValues("producto");
        String[] productPrices = request.getParameterValues("Cantidad");
        String[] productQuantities = request.getParameterValues("Precio");
        String[] productUnities = request.getParameterValues("Unidad");

        UnidadDao uniDao = new UnidadDao();
        ProductoDao prodDao = new ProductoDao();

        List<Producto> productList = new ArrayList<>();

        ArrayList<Producto> listProd = prodDao.getAll();

        for (int i = 0; i < productNames.length; i++) {
            for(Producto p : listProd){
                if(Objects.equals(productNames[i], p.getProducto_nombre())){
                    p.setProducto_cantidad(p.getProducto_cantidad() + 1);
                    if(prodDao.anadirProducto(productNames[i],p.getProducto_cantidad())){
                        session.setAttribute("exito","Se agregó otro producto "+p.getProducto_nombre());
                    }else{
                        session.setAttribute("error","No se puede agregar producto: "+err);
                    }
                }else{
                    String name = productNames[i];
                    String priceStr = productPrices[i];
                    String quantityStr = productQuantities[i];
                    String unityStr = productUnities[i];

                    if (name != null && !name.trim().isEmpty() && priceStr != null && !priceStr.trim().isEmpty() && quantityStr != null && !quantityStr.trim().isEmpty()) {

                        try {
                            int unity = Integer.parseInt(unityStr);
                            UnidMed uMed = uniDao.getOne(unity);

                            double price = Double.parseDouble(priceStr);
                            int quantity = Integer.parseInt(quantityStr);

                            productList.add(new Producto(name,price,uMed,quantity));

                            if(prodDao.insertProducto(new Producto(name,price,uMed,quantity))){
                                p.setProducto_Lista_medida(productList);
                            }
                        } catch (NumberFormatException e) {
                            // Manejar la excepción si los valores de precio o cantidad no son válidos números
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        entrada.setEstado("completado");
        if(eDao.insertEntrada(entrada)){
            session.setAttribute("mensaje","Entrada exitosa");
        }else{
            session.setAttribute("mensaje2","Error al realizar la entrada: "+err);
        }

        if (!productList.isEmpty()) {
            response.getWriter().write("Productos guardados exitosamente.");
        } else {
            response.getWriter().write("No se encontraron productos válidos para guardar.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //
    }
}
