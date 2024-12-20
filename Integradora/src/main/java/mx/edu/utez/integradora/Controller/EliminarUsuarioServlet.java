package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.integradora.Dao.UsuarioDao;
import mx.edu.utez.integradora.Model.Usuario;
import mx.edu.utez.integradora.Utils.GmailSender;

import java.io.IOException;

@WebServlet(name="EliminarUsuarioServlet", value="/delete")
public class EliminarUsuarioServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String ruta = "";
            Usuario u = new Usuario();
            u.setId(Integer.parseInt(req.getParameter("id")));
            u.setCorreo(req.getParameter("correo"));
            HttpSession session = req.getSession();
            //session.setAttribute("usuario", u);
            UsuarioDao dao = new UsuarioDao();
            Usuario u2 = dao.getOne(u.getId());
            String correo = u2.getCorreo();
            String name = u2.getNombre_usuario();
            int contador = dao.getCounter();
            if(contador > 3){
                    session.setAttribute("mensaje", "Haz rebasado el límite de inhabilitación de usuarios diario, intentalo nuevamente mañana");
                    ruta = req.getContextPath()+"/gestionUsuario.jsp";
            }else{
                    if (dao.disable(u)){
                            dao.insertCorreo(correo);
                            req.getSession().setAttribute("mensaje2","Usuario inhabilitado");
                            System.out.println("<p style=\"color: red;\">Usuario Eliminado</p>");
                            ruta = req.getContextPath()+"/gestionUsuario.jsp";
                            //session.removeAttribute("usuario");
                            /*try {
                            GmailSender mail = new GmailSender();
                            mail.sendMail(correo,"Aviso de inhabilitación","<H1>HOLA "+ name.toUpperCase()+"</H1>"+
                                    "<H2>La recuperación de tu contraseña fue exitosa, el cambio debe verse reflejado la proxmia vez que inicies sesión</H2>"+
                                    "<center><a href=http://localhost:8080/Integradora_war_exploded/index.jsp>Volver</a></center>"
                            );
                            } catch (Exception e) {
                                throw new RuntimeException(e);
                            }
                            req.getSession().setAttribute("mensaje2","¡Contraseña corregida!");*/
                    } else {
                            //Mandar un mensaje de errror y regesar al formulario de registro
                            req.getSession().setAttribute("mensaje","No se pudo inhabilitar el usuario");
                            ruta = req.getContextPath()+"/gestionUsuario.jsp";
                            //out.println("<p style=\"color: red;\">No se pudo, UnU, XD</p>");
                            //session.removeAttribute("usuario");
                    }
            }
            resp.sendRedirect(ruta);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //
    }
}
