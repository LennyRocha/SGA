package mx.edu.utez.integradora.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.integradora.Dao.UsuarioDao;
import mx.edu.utez.integradora.Model.Usuario;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="RegistrarUsuarioServlet", value="/sign_in")
public class RegistrarUsuarioServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Registro de usuario
        String operacion = req.getParameter("operacion");
        String ruta = req.getContextPath()+"/index.jsp";
        if (operacion.equals("registrar")) {
            String nombre_user = req.getParameter("nombre_usuario");
            String contra1_user = req.getParameter("pass1");
            String contra2_user = req.getParameter("pass2");
            String correo_user = req.getParameter("correo");
            boolean status_user = Boolean.parseBoolean(req.getParameter("status"));
            int tipo_usuario = Integer.parseInt(req.getParameter("tipo_usuario"));
                //2) conectarme a la base de datos y buscar al usuario segun
                // las credenciales del form
                Usuario u = new Usuario();
                u.setNombre_usuario(nombre_user);
                System.out.println(nombre_user);
                u.setContra(contra1_user);
                u.setCorreo(correo_user);
                u.setTipo_usuario(tipo_usuario);
                u.setEstado(status_user);
                UsuarioDao dao = new UsuarioDao();
                boolean disponible = false;
                int i = 0;
                //Mandar una respuesta
                ArrayList<Usuario> correos = dao.getCorreos();
                for(Usuario usu : correos){
                    if(usu.getCorreo().equals(correo_user)){
                        req.getSession().setAttribute("mensaje","Ese correo ya existe");
                        ruta = "registrarUsuario.jsp";
                        break;
                    }else{
                        i ++;
                    }
                }
                if(i == correos.size()){
                    disponible = true;
                    i = 0;
                }
                if(disponible){
                    if (dao.insertUsuario(u)) {
                        //Mandar al usuario al inicio de sesión
                        req.getSession().setAttribute("mensaje2","Usuario registrado");
                        //System.out.println("<p style=\"color: red;\">Usuario Registrado</p>");
                        ruta = req.getContextPath()+"/gestionUsuario.jsp?alert=success";
                    } else {
                        //Mandar un mensaje de errror y regesar al formulario de registro
                        req.getSession().setAttribute("mensaje","No se pudo registrar");
                        ruta = req.getContextPath()+"/registrarUsuario.jsp";
                        //System.out.println(nombre_user);
                        //System.out.println(contra1_user);
                        //System.out.println(correo_user);
                        //System.out.println(tipo_usuario);
                        //System.out.println(status_user);
                        //System.out.println("<p style=\"color: red;\">No se pudo, UnU</p>");
                    }
                }
        }else if (operacion.equals("actualizar")){
            //Actualizar usuario
            String nombre_usuario = req.getParameter("nombre_usuario");
            String pass = req.getParameter("pass");
            String correo = req.getParameter("correo");
            int tipo_usuario = Integer.parseInt(req.getParameter("tipo_usuario"));
            int id = Integer.parseInt(req.getParameter("id"));
            boolean status = Boolean.parseBoolean(req.getParameter("status"));
            Usuario u = new Usuario();
            u.setNombre_usuario(nombre_usuario);
            u.setContra(pass);
            u.setCorreo(correo);
            u.setTipo_usuario(tipo_usuario);
            u.setId(id);
            u.setEstado(status);

            UsuarioDao dao = new UsuarioDao();
            if(dao.update(u)){
                //Si se hizo el update
                ruta = req.getContextPath()+"/gestionUsuario.jsp";
                req.getSession().setAttribute("mensaje2","Usuario Actualizado");
            }else{
                //pues no y mando un error
                req.getSession().setAttribute("mensaje","No se pudo actualizar");
                ruta = req.getContextPath()+"/registrarUsuario.jsp";
            }
        }
        resp.sendRedirect(ruta);
    }
}