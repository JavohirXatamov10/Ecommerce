package org.example.ecommerse456.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.ecommerse456.config.ConnectionPoolManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer id;
    private LocalDateTime dateTime;
    private UUID userId;
    private OrderStatus status=OrderStatus.OPEN;


    public int getProductCount() {
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


    public int getPrice() {
        String sql = "select sum(p.price) as price from orders as o join public.orderproduct op on o.id = op.order_id join public.product p on p.id = op.product_id where o.id = ?";
        int count = 0;
        try (
                Connection connection = ConnectionPoolManager.getDataSource().getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ) {
            preparedStatement.setInt(1,id);

            ResultSet resultSet = preparedStatement.executeQuery();

            resultSet.next();

            count = resultSet.getInt("price");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return count;
    }
}



