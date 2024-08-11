package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.integradora.Dao.EntradasDao;
import mx.edu.utez.integradora.Dao.ProductoDao;
import mx.edu.utez.integradora.Dao.SalidaDao;
import mx.edu.utez.integradora.Dao.UsuarioDao;
import mx.edu.utez.integradora.Model.Entradas;
import mx.edu.utez.integradora.Model.Producto;
import mx.edu.utez.integradora.Model.Salidas;
import mx.edu.utez.integradora.Model.Usuario;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name="VerAlmacenServlet", value="/ver")
public class VerAlmacenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sesion = req.getSession();

        ProductoDao pDao = new ProductoDao();
        EntradasDao eDao = new EntradasDao();
        SalidaDao sDao = new SalidaDao();


        Producto producto = pDao.verAlmacen();
        Entradas entradas = eDao.getTotal();
        Salidas salidas = sDao.getTotal();

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
