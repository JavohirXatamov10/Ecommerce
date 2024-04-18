package org.example.ecommerse456.repo;

import org.example.ecommerse456.config.ConnectionPoolManager;
import org.example.ecommerse456.entity.Order;
import org.example.ecommerse456.entity.OrderProduct;
import org.example.ecommerse456.entity.Product;
import org.example.ecommerse456.entity.User;
import org.example.ecommerse456.payload.Basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderProductRepo {


    public static List<OrderProduct> findBYId(int orderId) {
        String query = "select * from orderproduct where order_id=?";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            preparedStatement.setObject(1, orderId);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<OrderProduct> products = new ArrayList<>();
            while (resultSet.next()) {
                products.add(new OrderProduct(
                        resultSet.getInt("id"),
                        resultSet.getInt("order_id"),
                        resultSet.getInt("product_id"),
                        resultSet.getInt("amount")
                ));
            }
            return products;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }




    public static List<OrderProduct>findAll() {
        String query = "select * from orderproduct ";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            List<OrderProduct> products = new ArrayList<>();
            while (resultSet.next()) {
                products.add(new OrderProduct(
                        resultSet.getInt("id"),
                        resultSet.getInt("order_id"),
                        resultSet.getInt("product_id"),
                        resultSet.getInt("amount")
                ));
            }
            return products;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
