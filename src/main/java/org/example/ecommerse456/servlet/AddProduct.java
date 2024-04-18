package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.example.ecommerse456.entity.Product;
import org.example.ecommerse456.repo.ProductRepo;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

@WebServlet(name = "addProduct",value = "/product/add")
@MultipartConfig
public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        int price = Integer.parseInt(req.getParameter("price"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));




        Part photo = req.getPart("photo");
        String photoName = UUID.randomUUID() + "_" + photo.getSubmittedFileName();
        InputStream inputStream=photo.getInputStream();
        OutputStream outputStream=new FileOutputStream("C:\\Users\\User\\pictureseCommerse\\%s".formatted(photoName));
        outputStream.write(inputStream.readAllBytes());

        Product product=new Product(
                null,name,price,categoryId,photoName
        );
        ProductRepo.save(product);
        resp.sendRedirect("/admin/product.jsp");
    }
}
