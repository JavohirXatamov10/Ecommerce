package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.ecommerse456.entity.Product;
import org.example.ecommerse456.entity.User;
import org.example.ecommerse456.payload.Basket;
import org.example.ecommerse456.repo.ProductRepo;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "addBasketLogin", value = "/add/basket")
public class AddToBasketLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        Product product= ProductRepo.findById(productId);
        HttpSession session = req.getSession();
        Object basketObj = session.getAttribute("basket");
        Basket basket;
        if(basketObj==null){
             basket=new Basket();
        }else {
            basket = (Basket) basketObj;
        }
            basket.basketProduct.put(product,1);
            session.setAttribute("basket",basket);
            resp.sendRedirect("/?categoryId="+product.getCategoryId());

    }
}
