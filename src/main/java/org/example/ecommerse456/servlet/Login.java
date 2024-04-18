package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.ecommerse456.entity.User;
import org.example.ecommerse456.entity.UserRole;
import org.example.ecommerse456.repo.UserRepo;

import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = UserRepo.findByUsername(username);
        if (user != null) {

            if (user.getPassword().equals(password)) {
                if (user.getRole().equals(UserRole.ADMIN)) {
                    req.getSession().setAttribute("currentUser",user);
                    resp.sendRedirect("/admin/admin.jsp");
                    return;

                } else {
                    req.getSession().setAttribute("currentUser",user);
                    resp.sendRedirect("/index.jsp");
                }
                return;
            }
        }
        resp.sendRedirect("/404");

    }
}
