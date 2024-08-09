package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.integradora.Dao.UsuarioDao;
import mx.edu.utez.integradora.Model.Usuario;
import mx.edu.utez.integradora.Utils.GmailSender;

import java.io.IOException;

@WebServlet(name="UpdateContraServlet", value="/updateContra")
public class UpdateContraServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String correo = req.getParameter("correo");
        String name = req.getParameter("nombre");
        String codigo = req.getParameter("codigo");
        String contra2 = req.getParameter("nuevaContra");
        System.out.println("recibio:");
        System.out.println(correo);
        System.out.println(name);
        System.out.println(codigo);
        System.out.println(contra2);
        Usuario u = new Usuario();
        u.setCorreo(correo);
        u.setNombre_usuario(name);
        u.setCodigo_usuario(codigo);
        u.setContra(contra2);
        UsuarioDao dao = new UsuarioDao();
        if(dao.updatePass(contra2,codigo)){
            try {
                GmailSender mail = new GmailSender();
                mail.sendMail(correo,"Recuperación exitosa","<H1>HOLA "+ name.toUpperCase()+"</H1>"+
                        "<H2>La recuperación de tu contraseña fue exitosa, el cambio debe verse reflejado la proxmia vez que inicies sesión</H2>"+
                        "<center><a href=http://localhost:8080/Integradora_war_exploded/index.jsp>Volver</a></center>"
                );
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            req.getSession().setAttribute("mensaje2","¡Contraseña corregida!");
        }else{
            req.getSession().setAttribute("mensaje","No se pudo actualizar la contra");
            System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
        }
        resp.sendRedirect(req.getContextPath()+"/index.jsp");
    }
}
