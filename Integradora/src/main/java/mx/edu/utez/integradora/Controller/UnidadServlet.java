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
import java.util.ArrayList;

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
        String ruta = req.getContextPath()+"/Salida2.jsp";
        UnidMed ume = new UnidMed();
        UnidadDao uDao = new UnidadDao();
        switch (operacion) {
            case "add":
                String unidad_nombre = req.getParameter("nombre_unidad");
                ArrayList<UnidMed> unidmed = uDao.getAll();
                boolean mismaUnidad = false;
                for (UnidMed u : unidmed) {
                    if (u.getUnidad_nombre() == unidad_nombre) {
                        mismaUnidad = true;
                    }
                }
                if (!mismaUnidad) {
                    ume.setUnidad_nombre(unidad_nombre);
                    if (uDao.insertUnidad(ume)) {
                        req.getSession().setAttribute("mensaje2", "Unidad registrada");
                        req.getSession().setAttribute("nomUnidad", unidad_nombre);
                        System.out.println("<p style=\"color: red;\">Unidad Registrada</p>");
                    } else {
                        req.getSession().setAttribute("mensaje", "No se pudo registrar la unidad");
                        System.out.println(unidad_nombre);
                        System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                    }
                    resp.sendRedirect(ruta);
                }else{
                    req.getSession().setAttribute("mensaje", "La unidad ya existe");
                    resp.sendRedirect(ruta);
                }
                break;
            case "edit":
                String new_nombre_uni = req.getParameter("nombre_unidad_nueva");
                int unidad_id = Integer.parseInt(req.getParameter("id_unidad"));
                ume.setUnidad_nombre(new_nombre_uni);
                ume.setUnidad_id(unidad_id);
                if (uDao.updateUnidad(ume)) {
                    //Mandar al usuario al inicio de sesión
                    req.getSession().setAttribute("mensaje2", "Unidad actualizada");
                    req.getSession().setAttribute("nomArea", new_nombre_uni);
                    System.out.println("<p style=\"color: red;\">Unidad Registrada</p>");
                } else {
                    //Mandar un mensaje de errror y regesar al formulario de registro
                    req.getSession().setAttribute("mensaje", "No se pudo actualizar la unidad");
                    System.out.println(new_nombre_uni);
                    System.out.println(unidad_id);
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                }
                resp.sendRedirect(ruta);
                break;
            //resp.sendRedirect(ruta);
        }

    }
}
