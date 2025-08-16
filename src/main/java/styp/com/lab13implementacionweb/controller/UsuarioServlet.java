package styp.com.lab13implementacionweb.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import styp.com.lab13implementacionweb.dao.UsuarioDAOImpl;
import styp.com.lab13implementacionweb.dto.UsuarioDTO;

@WebServlet(name = "usuarioServlet", value = "/usuario")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        String pagina = "index.jsp";
        UsuarioDTO usuarioDTO = null;

        if (usuario != null && password != null) {
            UsuarioDAOImpl userDAO = new UsuarioDAOImpl();
            usuarioDTO = userDAO.login(usuario, password); // ✅ aquí usamos login

            if (usuarioDTO != null) {
                // Usuario válido
                pagina = "mensaje.jsp";
                request.setAttribute("usuario", usuarioDTO);
            } else {
                // Usuario o contraseña incorrectos
                request.setAttribute("error", "Usuario o contraseña incorrectos");
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(pagina);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirige al formulario de login
        response.sendRedirect("index.jsp");
    }
}
