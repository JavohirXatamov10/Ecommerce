package org.example.ecommerse456.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.ecommerse456.config.ConnectionPoolManager;
import org.example.ecommerse456.repo.CategoryRepo;
import org.example.ecommerse456.repo.ProductRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderProduct {
    private Integer id;
    private Integer orderId;
    private Integer productId;
    private Integer amount;

    public String getProductName(){
        Product byId = ProductRepo.findById(productId);
        return byId.getName();
    }



        public int getProductCount(){
            String sql = "select sum(op.amount) as count from orders as o join public.orderproduct op on o.id = op.order_id join public.product p on p.id = op.product_id where o.id = ?";
            try (
                    Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ) {
                preparedStatement.setInt(1,id);

                ResultSet resultSet = preparedStatement.executeQuery();

                resultSet.next();

                return resultSet.getInt("count");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

}
