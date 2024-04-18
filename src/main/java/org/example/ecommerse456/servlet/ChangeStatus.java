package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.ecommerse456.entity.OrderStatus;
import org.example.ecommerse456.repo.OrderRepo;

import java.io.IOException;

@WebServlet(name = "changeStatus", value = "/admin/change-order-status")
public class ChangeStatus extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderId = Integer.parseInt(req.getParameter("order_id"));
        OrderStatus toStatus = OrderStatus.valueOf(req.getParameter("status"));

        OrderRepo.changeStatus(orderId,toStatus);

        resp.sendRedirect("/admin/controlOrders.jsp");
    }
    }

