package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.ecommerse456.repo.CategoryRepo;
import org.example.ecommerse456.repo.ProductRepo;

import java.io.IOException;

@WebServlet(name = "deleteProduct", value = "/product/delete")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int deleteinProdcutid = Integer.parseInt(req.getParameter("ID"));
        ProductRepo.deleteById(deleteinProdcutid);
        resp.sendRedirect("/admin/product.jsp");
    }
}
