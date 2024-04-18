package org.example.ecommerse456.repo;

import org.example.ecommerse456.config.ConnectionPoolManager;
import org.example.ecommerse456.entity.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CategoryRepo {
    public static Category findById(Integer categoryId) {

        String query = "select * from category where id=?";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            preparedStatement.setInt(1, categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            Category category = new Category();
            category.setId((resultSet.getInt("id")));
            category.setName(resultSet.getString("name"));
            return category;


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

        public static List<Category> findAll() {
        String query = "select * from category";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Category> categories = new ArrayList<>();
            while (resultSet.next()) {
                categories.add(new Category(
                        resultSet.getInt("id"),
                        resultSet.getString("name")
                ));
            }
            return categories;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void save(Category category) {
        String query = "insert into category(name) values (?)";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            preparedStatement.setString(1, category.getName());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteById(int deletingCategoryId) {
        String query = "delete from category where id=?";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            preparedStatement.setObject(1, deletingCategoryId);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
}
