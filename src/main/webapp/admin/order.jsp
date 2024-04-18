<%@ page import="org.example.ecommerse456.repo.OrderProductRepo" %>
<%@ page import="org.example.ecommerse456.entity.OrderProduct" %>
<%@ page import="org.example.ecommerse456.repo.OrderRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommerse456.entity.Order" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/9/2024
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
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
                    <a href="order.jsp"><li class="list-group-item bg-info text-white">Order</li></a>
                    <a href="controlOrders.jsp"><li class="list-group-item">Status orders</li></a>
                    <a href="archived.jsp"><li class="list-group-item">Archived</li></a>

                </ul>
            </div>
            <div class="col-9 border-left">

                <div class="col-9 border-left p-3">
                    <div class="row">
                        <div class="col-2 offset-10">
                            <a href="http://localhost:8080/logout" class="btn btn-dark text-white ">Logout</a>
                        </div>
                    </div>
                    <div class="p-4">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <td>Order id</td>
                                <td>Order time</td>
                                <td>User id</td>
                                <td>Order status</td>
                                <td>Product</td>
<%--                                <td>Change status</td>--%>
<%--                                <td>Archived product</td>--%>
                                <td></td>
                            </tr>
                            </thead>
                            <tbody>

                            <% for (Order order: orders) {%>
                            <tr>
                                <td><%=order.getId()%></td>
                                <td><%=order.getDateTime()%></td>
                                <td><%=order.getUserId()%></td>
                                <td><%=order.getStatus()%></td>
                                <td>
                                    <a  href="/admin/orderProduct.jsp?orderId=<%=order.getId()%>" class="btn btn-info">Products</a>
                                </td>
<%--                                <td>--%>
<%--                                    <a  href="http://localhost:8080/change/status?orderId=<%=order.getId()%>" class="btn btn-info"> >>>> </a>--%>
<%--                                </td><td>--%>
<%--                                    <a  href="archived/jsp?orderId=<%=order.getId()%>" class="btn btn-info"> >>>> </a>--%>
<%--                                </td>--%>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
    </div>
</body>
</html>
