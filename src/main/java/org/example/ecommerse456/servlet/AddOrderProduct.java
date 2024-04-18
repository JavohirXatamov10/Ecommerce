package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.ecommerse456.entity.User;
import org.example.ecommerse456.entity.UserRole;
import org.example.ecommerse456.payload.Basket;
import org.example.ecommerse456.repo.OrderProductRepo;
import org.example.ecommerse456.repo.OrderRepo;

import java.io.IOException;

@WebServlet(name = "makeOrder",value ="/add/orderProduct" )
public class AddOrderProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object basketObj = session.getAttribute("basket");
        Object currentUser = session.getAttribute("currentUser");
        User user = (User) currentUser;
        Basket basket = (Basket) basketObj;


        if (user != null && user.getRole().equals(UserRole.USER)) {
            if (basket.basketProduct != null) {
                OrderRepo.makeOrder(basket, user);
                basket.basketProduct.clear();
                session.setAttribute("basket", basket);
                resp.sendRedirect("/sale/orderCompleted.jsp");
            } else {
                //session.setAttribute("basket",null);
                resp.sendRedirect("/index.jsp");
            }
        } else{
                session.setAttribute("currentUser",null);
                resp.sendRedirect("/auth/login.jsp");
        }

    }
}