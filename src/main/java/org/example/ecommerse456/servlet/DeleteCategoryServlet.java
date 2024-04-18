package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.ecommerse456.repo.CategoryRepo;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "deleteCategory", value = "/category/delete")
public class DeleteCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int deletingCategoryId = Integer.parseInt(req.getParameter("ID"));
        CategoryRepo.deleteById(deletingCategoryId);
        resp.sendRedirect("/admin/category.jsp");
    }
}
