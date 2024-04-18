package org.example.ecommerse456.repo;

import org.example.ecommerse456.config.ConnectionPoolManager;
import org.example.ecommerse456.entity.Product;
import org.example.ecommerse456.entity.User;
import org.example.ecommerse456.entity.UserRole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;

public class UserRepo {
    public static User findByUsername(String username) {
        String query = "select * from users where username=?";
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
        ) {
            preparedStatement.setString(1,username);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){

                return new User(
                        UUID.fromString(resultSet.getString("id")),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        UserRole.valueOf(resultSet.getString("role").toUpperCase()));

            } return null;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
