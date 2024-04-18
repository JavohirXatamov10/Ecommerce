package org.example.ecommerse456.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.ecommerse456.entity.Product;
import org.example.ecommerse456.payload.Basket;
import org.example.ecommerse456.repo.ProductRepo;

import java.io.IOException;

@WebServlet(name = "decreaseProductAmount", value ="/basket/decrease-product" )
public class DecreaseProductAmountFromSession extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("productId"));
        Product product= ProductRepo.findById(productId);
        HttpSession session = req.getSession();
        Object basketObj = session.getAttribute("basket");
        Basket basket = (Basket) basketObj;
        Integer OldValue = basket.basketProduct.get(product);
        basket.basketProduct.replace(product,OldValue,OldValue-1);
        Integer newValue = basket.basketProduct.get(product);
        if (newValue>0){
        session.setAttribute("basket",basket);
        }else {
            basket.basketProduct.replace(product,newValue,1);
            session.setAttribute("basket",basket);
        }

        resp.sendRedirect("/?categoryId="+product.getCategoryId());

    }
    }
