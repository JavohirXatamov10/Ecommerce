package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.ecommerse456.entity.Product;
import org.example.ecommerse456.repo.ProductRepo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet(name = "productPhoto", value = "/product/download_photo")

public class DownloadProductPhoto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        Product product= ProductRepo.findById(productId);
        System.out.println(product);
        ServletOutputStream outputStream=resp.getOutputStream();
        outputStream.write(Files.readAllBytes((Path.of("C:\\Users\\User\\pictureseCommerse\\%s".formatted(product.getPhoto())))));
    }
}