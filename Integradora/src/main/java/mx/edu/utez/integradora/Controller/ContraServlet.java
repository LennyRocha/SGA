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

import static mx.edu.utez.integradora.Utils.SimpleRandomStringGenerator.generateRandomString;

@WebServlet(name="ContraServlet", value="/recuContra")
public class ContraServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1) Obtener la información del formulario
        String correo = req.getParameter("correo");
        String ruta = req.getContextPath()+"/RecuperaPass.jsp";
        UsuarioDao dao = new UsuarioDao();
        HttpSession sesion = req.getSession();

        if(dao.getEmail(correo) == null){
            //No existe el usuario en la base de datos
            sesion.setAttribute("mensaje","El correo no es valido");
        }else{
            //Si existe el usuario
            String rands = generateRandomString(10);
            if (dao.insertCod(rands,correo)){
                Usuario u = dao.getEmail(correo);
                System.out.println(u.getNombre_usuario());
                System.out.println(u.getCorreo());
                String name = u.getNombre_usuario();
                try {
                    GmailSender mail = new GmailSender();
                    mail.sendMail(correo,"Recuperación de contraseña","<H1>HOLA "+u.getNombre_usuario()+"</H1>"+
                            "<H2>Se ha confirmado tu correo electrónico, aqui tienes tu codigo de confirmación:</H2>"+
                            "<CENTER>"+rands+"</CENTER>"+
                            "<center><a href=http://localhost:8080/Integradora_war_exploded/recuContra?codigo="+rands+">RECUPERAR MI CONTRASEÑA</a></center>"
                    );
                    sesion.setAttribute("mensaje2","Se ha enviado un correo electrónico de verificación");
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                sesion.setAttribute("codigo",rands);
                sesion.setAttribute("name",name);
                sesion.setAttribute("correo",correo);
            }
        }
        resp.sendRedirect(ruta);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sesion = req.getSession();
        String codigoR = (String) sesion.getAttribute("codigo");
        String ruta = req.getContextPath()+"/NuevaContra.jsp";
        if(codigoR == null)
        {
            //No existe el codigo
            sesion.setAttribute("mensaje","El codigo no existe");
        }else{
            UsuarioDao dao = new UsuarioDao();
            if(dao.findCodigo(codigoR))
            {
                ruta=req.getContextPath()+"/NuevaContra.jsp";
            }
            else
            {
                //No coincide el código
                sesion.setAttribute("mensaje","El codigo no coincide");
            }
        }
        resp.sendRedirect(ruta);
    }
}
