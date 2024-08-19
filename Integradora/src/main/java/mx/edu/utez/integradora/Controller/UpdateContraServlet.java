package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.integradora.Dao.UsuarioDao;
import mx.edu.utez.integradora.Model.Usuario;
import mx.edu.utez.integradora.Utils.GmailSender;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

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
        /*System.out.println("recibio:");
        System.out.println(correo);
        System.out.println(name);
        System.out.println(codigo);
        System.out.println(contra2);*/
        Usuario u = new Usuario();
        u.setCorreo(correo);
        u.setNombre_usuario(name);
        u.setCodigo_usuario(codigo);
        u.setContra(contra2);
        UsuarioDao dao = new UsuarioDao();
        StringBuilder htmlContent = new StringBuilder();
        if(dao.updatePass(contra2,codigo)){
            String header = makeHeader();
            String footer = makeFooter();
            htmlContent.append("<br>")
                    .append("<H1 style='color:#1D3557;'>HOLA ")
                    .append(name.toUpperCase())
                    .append("</H1>")
                    .append("<H2>La recuperación de tu contraseña fue exitosa, el cambio debe verse reflejado la proxmia vez que inicies sesión</H2>")
                    .append("<center><a href=http://localhost:8080/Integradora_war_exploded/index.js")
                    .append("\" style=\"color:#E63946;text-decoration:underline;\">Volver</a></center>")
                    .append("<br>");
            try {
                GmailSender mail = new GmailSender();
                mail.sendMail(correo,"Recuperación exitosa",
                        header + htmlContent + footer);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            req.getSession().setAttribute("mensaje2","¡Contraseña corregida!");
            req.getSession().setAttribute("exito","true");
        }else{
            req.getSession().setAttribute("mensaje","No se pudo actualizar la contraseña");
        }
        resp.sendRedirect(req.getContextPath()+"/index.jsp");
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
