package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.ecommerse456.entity.Category;
import org.example.ecommerse456.repo.CategoryRepo;

import java.io.IOException;

@WebServlet (name = "addCategory", value = "/2category/add")
public class AddCategory extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("id");
        Category category=new Category();
        if (!name.isEmpty()){
            category.setName(name);
        CategoryRepo.save(category);
        }
        resp.sendRedirect("/admin/addCategory.jsp");

    }

}
