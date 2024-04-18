package org.example.ecommerse456.repo;

import org.example.ecommerse456.config.ConnectionPoolManager;
import org.example.ecommerse456.entity.*;
import org.example.ecommerse456.payload.Basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class OrderRepo {


    public static void makeOrder(Basket basket, User user) {
        Integer orderId=createOrder(user);
        for (Map.Entry<Product, Integer> entry : basket.basketProduct.entrySet()) {
            String query = "insert into orderproduct(order_id,product_id,amount) values (?,?,?)";
            try (
                    Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
            ) {
                preparedStatement.setInt(1, orderId);
                preparedStatement.setInt(2, entry.getKey().getId());
                preparedStatement.setInt(3, entry.getValue());
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }




        }
    }
    private static Order createNewOrder() {
        String sql = "insert into orders(userid) values(1) returning *;";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();

            resultSet.next();

            return new Order(
                    resultSet.getInt("id"),
                    resultSet.getTimestamp("datetime").toLocalDateTime(),
                    UUID.fromString(resultSet.getString("userId")),
                    OrderStatus.valueOf(      resultSet.getObject("status").toString().toUpperCase())
            );
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }












    public static Integer createOrder(User user) {
        String sql = "insert into orders(userid) values(?) returning id";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {
            preparedStatement.setObject(1,user.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            Integer orderId=null;
            if (resultSet.next()) {
               orderId =  resultSet.getInt("id");
            }
            return orderId;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


        public static List<Order> findAll() {
            String query = "select * from orders";
            try (
                    Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
            ) {
                ResultSet resultSet = preparedStatement.executeQuery();
                List<Order> orders   = new ArrayList<>();
                while (resultSet.next()) {
                    orders.add(new Order(
                            resultSet.getInt("id"),
                            resultSet.getTimestamp("time").toLocalDateTime(),
                            UUID.fromString(resultSet.getString("userid")),
                            OrderStatus.valueOf(resultSet.getString("status").toUpperCase()))
                    );
                }
                return orders;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

    public static void changeStatus(int orderId, OrderStatus toStatus) {
        String sql = "update orders set status = ? where id = ?";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {
            preparedStatement.setString(1, toStatus.name());
            preparedStatement.setInt(2, orderId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
