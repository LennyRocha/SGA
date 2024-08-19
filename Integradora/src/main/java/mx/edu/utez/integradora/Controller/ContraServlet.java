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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

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
            String header = makeHeader();
            String footer = makeFooter();
            StringBuilder htmlContent = new StringBuilder();
            if (dao.insertCod(rands,correo)){
                Usuario u = dao.getEmail(correo);
                String name = u.getNombre_usuario();
                htmlContent.append("<br>")
                        .append("<H1 style='color:#1D3557;'>HOLA ")
                        .append(u.getNombre_usuario().toUpperCase())
                        .append("</H1>")
                        .append("<H3>Se ha confirmado tu correo electrónico, aqui tienes tu codigo de confirmación:</H3>")
                        .append("<CENTER><H2>")
                        .append(rands)
                        .append("</H2></CENTER>")
                        .append("<center><a href=\"http://localhost:8080/Integradora_war_exploded/recuContra?codigo=")
                        .append(rands)
                        .append("\" style=\"color:#E63946;text-decoration:underline;\">RECUPERAR MI CONTRASEÑA</a></center>")
                        .append("<br>");
                try {
                    GmailSender mail = new GmailSender();
                    mail.sendMail(correo,"Recuperación de contraseña",
                            header + htmlContent + footer);
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
        String header = makeHeader();
        String footer = makeFooter();
        resp.getWriter().write(header + "\n" + footer);

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

    public String makeHeader() {
        StringBuilder headerBuilder = new StringBuilder();
        try (InputStream inputStream = getServletContext().getResourceAsStream("/WEB-INF/Templates/HeadCorreo.html")) {
            if (inputStream == null) {
                System.err.println("File not found in classpath: /WEB-INF/Templates/HeadCorreo.html");
                return "";
            }
            try (BufferedReader in = new BufferedReader(new InputStreamReader(inputStream))) {
                String str;
                while ((str = in.readLine()) != null) {
                    headerBuilder.append(str);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return headerBuilder.toString();
    }

    public String makeFooter() {
        StringBuilder footerBuilder = new StringBuilder();
        try (InputStream inputStr = getServletContext().getResourceAsStream("/WEB-INF/Templates/FootCorreo.html")) {
            if (inputStr == null) {
                System.err.println("File not found in classpath: /WEB-INF/Templates/FootCorreo.html");
                return "";
            }else{
                try (BufferedReader in = new BufferedReader(new InputStreamReader(inputStr))) {
                    String str;
                    while ((str = in.readLine()) != null) {
                        footerBuilder.append(str);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return footerBuilder.toString();
    }
}
