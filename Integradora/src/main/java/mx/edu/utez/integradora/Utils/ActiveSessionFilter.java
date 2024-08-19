package mx.edu.utez.integradora.Utils;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter(urlPatterns = {
        //colocar aqui todo despues
        "/Inicio.jsp",
        "/InicioAlmacenista.jsp",
        //Comentar, descomentar solo cuando ya esté
        //Admin
        /*"/sign_in",
        "/delete",
        "/revive",
        "/ver",
        "/gestionUsuario.jsp",
        "/registrarUsuario.jsp",
        "/verAlmacen.jsp",
        //Almacenista
        "/area",
        "/entrada",
        "/salida",
        "/proveedor",
        "/unidad",
        "/Entrada1.jsp",
        "/Salida2.jsp",
        "/pendientes.jsp",
        //Ambos
        "/recuContra",
        "/updateContra",
        "/log_in",
        "/Catalogo.jsp",
        "/menuHist.jsp",
        "/recuperaPass.jsp",
        "/NuevaContra.jsp",*/
})

public class ActiveSessionFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        // Obtener la sesión
        HttpSession session = httpRequest.getSession(false);
        // Checar si la sesión tiene un atributo “estado” con valor “activa” (convertido a booleano en este caso)
        boolean isActive = false;
        if(session != null){
            isActive = session.getAttribute("estadoUsuario").equals("activo");
        }
        if (isActive) {//Si es administrador la siguiente línea otorga acceso al recurso solicitado
            chain.doFilter(request, response);
        } else {// Si no lo redirigimos a una página de acceso denegado
            httpResponse.sendRedirect("accessoNegado.jsp");
        }
    }
}
