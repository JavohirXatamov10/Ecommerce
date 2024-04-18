<%@ page import="org.example.ecommerse456.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommerse456.repo.OrderRepo" %>
<%@ page import="org.example.ecommerse456.entity.OrderStatus" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/12/2024
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Archived product</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
  List<Order> orders= OrderRepo.findAll();
%>

<div class="row">

    <div class="col-3 border-right p-4">
        <ul class="list-group">
            <a href="category.jsp"><li class="list-group-item">Category</li></a>
            <a href="product.jsp"><li class="list-group-item ">Product</li></a>
            <a href="order.jsp"><li class="list-group-item ">Order</li></a>
            <a href="controlOrders.jsp"><li class="list-group-item">Status orders</li></a>
            <a href="archived.jsp.jsp"><li class="list-group-item bg-info text-white">Archived</li></a>
        </ul>
    </div>


    <div class="col-9 p-2">
    <div class="row">
        <div class="col-2 offset-10">
            <a href="http://localhost:8080/logout" class="btn btn-dark text-white ">Logout</a>
        </div>
    </div>
        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Product Count</th>
                <th>Price</th>
            </tr>
            </thead>
            <tbody>
            <% List<Order> archiveOrder = orders.stream()
                    .filter(item -> item.getStatus().equals(OrderStatus.ARCHIVE))
                    .toList();
            %>

            <% for (Order order : archiveOrder) { %>
            <tr>
                <td><%=order.getId()%></td>
                <td><%=order.getProductCount()%></td>
                <td><%=order.getPrice()%></td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>

</div>

</body>
</html>
