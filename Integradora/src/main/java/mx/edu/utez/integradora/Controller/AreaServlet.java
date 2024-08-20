package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.integradora.Dao.AreaDao;
import mx.edu.utez.integradora.Model.Area;

import java.io.IOException;

@WebServlet(name="AreaServlet", value="/area")
public class AreaServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");
        String ruta = req.getContextPath()+"/registrarEntrada.jsp";
        HttpSession session = req.getSession();
        AreaDao asDao = new AreaDao();
        switch (operacion){
            case "get":
                int areaId = Integer.parseInt(req.getParameter("id_area"));
                Area as = asDao.getOne(areaId);
                session.setAttribute("area", as);
                resp.sendRedirect(ruta);
                break;
            case "delete":
                Area asa = new Area();
                asa.setArea_id(Integer.parseInt(req.getParameter("id_area")));
                session.setAttribute("area", asa);
                if (asDao.deleteArea(asa)){
                    req.getSession().setAttribute("mensaje2","Area de salida eliminada");
                    System.out.println("<p style=\"color: red;\">Usuario Eliminado</p>");
                } else {
                    //Mandar un mensaje de errror y regesar al formulario de registro
                    req.getSession().setAttribute("mensaje","No se pudo eliminar la area");
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
        Area as = new Area();
        AreaDao asDao = new AreaDao();
        switch (operacion){
            case "add":
                String nombre_area = req.getParameter("nombre_area");
                char letra_area = req.getParameter("letra_area").charAt(0);
                as.setArea_nombre(nombre_area);
                as.setArea_identidad(String.valueOf(letra_area));
                if (asDao.insertArea(as)) {
                    req.getSession().setAttribute("mensaje2","Area registrada");
                    req.getSession().setAttribute("nomArea",nombre_area);
                    req.getSession().setAttribute("letArea",letra_area);
                    System.out.println("<p style=\"color: red;\">Area Registrada</p>");
                } else {
                    req.getSession().setAttribute("mensaje","No se pudo registrar la area");
                    System.out.println(nombre_area);
                    System.out.println(letra_area);
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                }
                resp.sendRedirect(ruta);
                break;
            case "edit":
                String new_nombre_area = req.getParameter("nombre_proveedor");
                int id_area = Integer.parseInt(req.getParameter("id_area"));
                char new_letra_area = req.getParameter("letra_area").charAt(0);
                as.setArea_nombre(new_nombre_area);
                as.setArea_id(id_area);
                as.setArea_identidad(String.valueOf(new_letra_area));
                if (asDao.updateArea(as)) {
                    //Mandar al usuario al inicio de sesión
                    req.getSession().setAttribute("mensaje2","Area actualizada");
                    req.getSession().setAttribute("nomArea", new_nombre_area);
                    System.out.println("<p style=\"color: red;\">Area Registrada</p>");
                } else {
                    //Mandar un mensaje de errror y regesar al formulario de registro
                    req.getSession().setAttribute("mensaje","No se pudo actualizar la area");
                    System.out.println(new_nombre_area);
                    System.out.println(id_area);
                    System.out.println(new_letra_area);
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                }
                resp.sendRedirect(ruta);
                break;
            //resp.sendRedirect(ruta);
        }
    }
}
