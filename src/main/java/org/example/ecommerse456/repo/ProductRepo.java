package org.example.ecommerse456.repo;

import org.example.ecommerse456.config.ConnectionPoolManager;
import org.example.ecommerse456.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class ProductRepo {
    public static void save(Product product) {
        String query = "insert into product(name,price,category_id,photo) values (?,?,?,?)";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setInt(3, product.getCategoryId());
            preparedStatement.setString(4, product.getPhoto());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static List<Product> findAll() {
        String query = "select * from product";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Product> products  = new ArrayList<>();
            while (resultSet.next()) {
                products.add(new Product(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getInt("price"),
                        resultSet.getInt("category_id"),
                        resultSet.getString("photo")
                ));
            }
            return products;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static Product findById(int productId) {

        String query = "select * from product where id=?";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            preparedStatement.setInt(1,productId);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            return new Product(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getInt("price"),
                    resultSet.getInt("category_id"),
                    resultSet.getString("photo"));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteById(int deleteinProdcutid) {
        String query = "delete from product where id=?";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            preparedStatement.setObject(1, deleteinProdcutid);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void edit(Product product) {
        String query = "update product set name=?,price=?,category_id=?,photo=? where id=?";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {

            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setInt(3, product.getCategoryId());
            preparedStatement.setString(4, product.getPhoto());
            preparedStatement.setInt(5, product.getId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static List<Product> findAllByCategoryId(int categoryId) {
        String query = "select * from product where category_id=?";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            preparedStatement.setObject(1, categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Product> products = new ArrayList<>();
            while (resultSet.next()) {
                products.add(new Product(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getInt("price"),
                        resultSet.getInt("category_id"),
                        resultSet.getString("photo")
                ));
            }
            return products;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}