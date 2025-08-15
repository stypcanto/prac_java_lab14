package styp.com.lab13implementacionweb.controller;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class UsuarioServlet extends HttpServlet {
    private String message;

    public void init()
    {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void destroy()
    {
    }
}