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

@WebServlet(name="VerAlmacenServlet", value="/ver")
public class VerAlmacenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sesion = req.getSession();

        ProductoDao pDao = new ProductoDao();
        DetalleEntradaDao eDao = new DetalleEntradaDao();
        DetalleSalidaDao sDao = new DetalleSalidaDao();
        DetalleEntrada entradas = new DetalleEntrada();
        DetalleSalida salidas = new DetalleSalida();


        Producto producto = pDao.verAlmacen();
        double totalValorEntradas = eDao.getTotalIngresos();
        double totalValorSalidas = sDao.getTotalEgresos();

        sesion.setAttribute("datosAlmacen", producto);
        sesion.setAttribute("totalEntrada", totalValorEntradas);
        sesion.setAttribute("totalSalida", totalValorSalidas);

        resp.sendRedirect(req.getContextPath()+"/VerAlmacen.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //
    }
}
