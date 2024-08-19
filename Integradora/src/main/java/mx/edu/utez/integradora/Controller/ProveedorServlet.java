package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.integradora.Dao.ProveedorDao;
import mx.edu.utez.integradora.Model.Proveedor;

import java.io.IOException;

@WebServlet(name="ProveedorServlet", value="/proveedor")
public class ProveedorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");
        String ruta = req.getContextPath()+"/registrarEntrada.jsp";
        HttpSession session = req.getSession();
        ProveedorDao pDao = new ProveedorDao();
        switch (operacion){
            case "get":
                int provId = Integer.parseInt(req.getParameter("id_proveedor"));
                Proveedor P = pDao.getOne(provId);
                session.setAttribute("proveedor", P);
                resp.sendRedirect(ruta);
            break;
            case "delete":
                Proveedor p = new Proveedor();
                p.setProveedor_id(Integer.parseInt(req.getParameter("id_proveedor")));
                session.setAttribute("proveedor", p);
                if (pDao.deleteProveedor(p)){
                    req.getSession().setAttribute("mensaje2","Proveedor eliminado");
                    //System.out.println("<p style=\"color: red;\">Usuario Eliminado</p>");
                } else {
                    //Mandar un mensaje de errror y regesar al formulario de registro
                    req.getSession().setAttribute("mensaje","No se pudo eliminar al proveedor");
                    //System.out.println("<p style=\"color: red;\">No se pudo, UnU, XD</p>");
                }
                resp.sendRedirect(ruta);
            break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String operacion = req.getParameter("operacion");
        String ruta = req.getContextPath()+"/registrarEntrada.jsp";
        Proveedor p = new Proveedor();
        ProveedorDao pDao = new ProveedorDao();
        switch (operacion){
            case "add":
                String nombre_proveedor = req.getParameter("nombre_proveedor");
                p.setProveedor_nombre(nombre_proveedor);
                if (pDao.insertProveedor(p)) {
                    req.getSession().setAttribute("mensaje2","Proveedor registrado");
                    req.getSession().setAttribute("nomProv",nombre_proveedor);
                    System.out.println("<p style=\"color: red;\">Proveedor Registrado</p>");
                } else {
                    req.getSession().setAttribute("mensaje","No se pudo registrar al proveedor");
                    System.out.println(nombre_proveedor);
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                }
                resp.sendRedirect(ruta);
            break;
            case "edit":
                String new_nombre_proveedor = req.getParameter("nombre_proveedor");
                int id_proveedor = Integer.parseInt(req.getParameter("id_proveedor"));
                p.setProveedor_nombre(new_nombre_proveedor);
                p.setProveedor_id(id_proveedor);
                if (pDao.updateProveedor(p)) {
                    //Mandar al usuario al inicio de sesión
                    req.getSession().setAttribute("mensaje2","Proveedor actualizado");
                    req.getSession().setAttribute("nomProv",new_nombre_proveedor);
                    System.out.println("<p style=\"color: red;\">Proveedor Registrado</p>");
                } else {
                    //Mandar un mensaje de errror y regesar al formulario de registro
                    req.getSession().setAttribute("mensaje","No se pudo actualizar al proveedor");
                    System.out.println(new_nombre_proveedor);
                    System.out.println(id_proveedor);
                    System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                }
                resp.sendRedirect(ruta);
            break;
            //resp.sendRedirect(ruta);
        }
    }
}
