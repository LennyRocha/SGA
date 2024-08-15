package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.integradora.Dao.*;
import mx.edu.utez.integradora.Model.DetalleSalida;
import mx.edu.utez.integradora.Model.Producto;
import mx.edu.utez.integradora.Model.DetalleEntrada;
import mx.edu.utez.integradora.Model.Usuario;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name="VerAlmacenServlet", value="/ver")
public class VerAlmacenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sesion = req.getSession();

        ProductoDao pDao = new ProductoDao();
        DetalleEntradaDao eDao = new DetalleEntradaDao();
        DetalleSalidaDao sDao = new DetalleSalidaDao();


        Producto producto = pDao.verAlmacen();
        double totalValorEntradas = eDao.getTotalIngresos();
        double totalValorSalidas = sDao.getTotal();

        int totalProd = producto.getProducto_cantidad();
        double totalPrec = producto.getProducto_precio();
        double totEntrada = entradas.getEntrada_valor_total();
        double totSalida = salidas.getSalida_valor_total();

        sesion.setAttribute("totalProd", totalProd);
        sesion.setAttribute("totalPrec", totalPrec);
        sesion.setAttribute("totalEntrada", totEntrada);
        sesion.setAttribute("totalSalida", totSalida);

        resp.sendRedirect(req.getContextPath()+"/almacen.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //
    }
}
