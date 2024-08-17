package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.integradora.Dao.UsuarioDao;
import mx.edu.utez.integradora.Model.Usuario;

import java.io.IOException;

@WebServlet(name="UsuarioServlet", value="/log_in")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UsuarioDao uDao = new UsuarioDao();
        Usuario U = uDao.getOne(id);
        HttpSession session = req.getSession();
        session.setAttribute("usuario", U);
        resp.sendRedirect(req.getContextPath()+"/registrarUsuario.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1) Obtener la información del formulario
        HttpSession sesion = req.getSession();
        String correo = req.getParameter("correo");
        String contra = req.getParameter("contra");
        String ruta = req.getContextPath()+"/index.jsp";

        //2) conectarme a la base de datos y buscar al usuario segun
        // las credenciales del form
        UsuarioDao dao = new UsuarioDao();
        Usuario u = dao.getOne(correo,contra);
        boolean estadou = u.isEstado();

        if(u.getCorreo() == null){
            //No existe el usuario en la base de datos
            sesion.setAttribute("mensaje","Usuario o contraseña invalidos, intentalo nuevamente");
            resp.sendRedirect(ruta);
        }else{
            if(estadou){
                System.out.println(estadou);
                if(u.getTipo_usuario() == 1){
                    ruta=req.getContextPath()+"/Inicio.jsp";
                    sesion.setAttribute("tipoSesion","admin");
                } else if (u.getTipo_usuario() == 2) {
                    ruta=req.getContextPath()+"/InicioAlmacenista.jsp";
                    sesion.setAttribute("tipoSesion","employee");
                }
                sesion.setAttribute("estadoUsuario", "activo");
                //Si existe el usuario
                sesion.setAttribute("name",u.getNombre_usuario());
                sesion.setAttribute("type",u.getTipo_usuario());
                sesion.setAttribute("estadoU",u.isEstado());
                sesion.setAttribute("usuario",u);
            }else {
                System.out.println(estadou);
                sesion.setAttribute("estadoUsuario", "inactivo");
                if(u.getTipo_usuario() == 1){
                    ruta=req.getContextPath()+"/Inicio.jsp";
                    sesion.setAttribute("tipoSesion","admin");
                } else if (u.getTipo_usuario() == 2) {
                    ruta=req.getContextPath()+"/InicioAlmacenista.jsp";
                    sesion.setAttribute("tipoSesion","employee");
                }
            }
            resp.sendRedirect(ruta);
        }
    }
}
