package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.ecommerse456.entity.Category;
import org.example.ecommerse456.repo.CategoryRepo;

import java.io.IOException;

@WebServlet(name = "editCategory", value = "/category/edit")
public class EditCategoryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        Category category=new Category( id,name);
        CategoryRepo.save(category);
        resp.sendRedirect("/admin/category.jsp");



    }
}
