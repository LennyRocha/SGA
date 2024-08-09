package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.integradora.Dao.UnidadDao;
import mx.edu.utez.integradora.Model.UnidMed;

import java.io.IOException;

@WebServlet(name="UnidadServlet", value="/unidad")
public class UnidadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");
        String ruta = req.getContextPath()+"/registrarEntrada.jsp";
        HttpSession session = req.getSession();
        UnidadDao umDao = new UnidadDao();
        switch (operacion){
            case "get":
                int provId = Integer.parseInt(req.getParameter("id_unidad"));
                UnidMed ume = umDao.getOne(provId);
                session.setAttribute("unidad", ume);
                resp.sendRedirect(ruta);
                break;
            case "delete":
                UnidMed umed = new UnidMed();
                umed.setUnidad_id(Integer.parseInt(req.getParameter("id_unidad")));
                session.setAttribute("unidad", umed);
                if (umDao.deleteUnidad(umed)){
                    req.getSession().setAttribute("mensaje2","Unidad de medida eliminada");
                    System.out.println("<p style=\"color: red;\">Usuario Eliminado</p>");
                } else {
                    //Mandar un mensaje de errror y regesar al formulario de registro
                    req.getSession().setAttribute("mensaje","No se pudo eliminar la unidad de medida");
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU, XD</p>");
                }
                resp.sendRedirect(ruta);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");
        String ruta = req.getContextPath()+"/registrarEntrada.jsp";
        UnidMed ume = new UnidMed();
        UnidadDao uDao = new UnidadDao();
        switch (operacion){
            case "add":
                String nombre_area = req.getParameter("nombre_unidad");
                ume.setUnidad_nombre(nombre_area);
                if (uDao.insertUnidad(ume)) {
                    req.getSession().setAttribute("mensaje2","Unidad registrada");
                    req.getSession().setAttribute("nomUnid",nombre_area);
                    System.out.println("<p style=\"color: red;\">Unidad Registrada</p>");
                } else {
                    req.getSession().setAttribute("mensaje","No se pudo registrar la unidad de medida");
                    System.out.println(nombre_area);
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                }
                resp.sendRedirect(ruta);
                break;
            case "edit":
                String new_nombre_unidad = req.getParameter("nombre_unidad");
                int id_unidad = Integer.parseInt(req.getParameter("id_unidad"));
                ume.setUnidad_nombre(new_nombre_unidad);
                ume.setUnidad_id(id_unidad);
                if (uDao.updateUnidad(ume)) {
                    req.getSession().setAttribute("mensaje2","Unidad actualizada");
                    req.getSession().setAttribute("nomUnid",new_nombre_unidad);
                    System.out.println("<p style=\"color: red;\">Unidad Registrada</p>");
                } else {
                    //Mandar un mensaje de errror y regesar al formulario de registro
                    req.getSession().setAttribute("mensaje","No se pudo actualizar la unidad");
                    System.out.println(new_nombre_unidad);
                    System.out.println(id_unidad);
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                }
                resp.sendRedirect(ruta);
                break;
        }
    }
}
