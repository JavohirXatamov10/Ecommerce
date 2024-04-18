<%@ page import="org.example.ecommerse456.repo.OrderProductRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommerse456.entity.OrderProduct" %>
<%@ page import="org.example.ecommerse456.entity.Product" %>
<%@ page import="org.example.ecommerse456.repo.ProductRepo" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/12/2024
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    int orderId = Integer.parseInt(request.getParameter("orderId"));

    List<OrderProduct> orderProducts=OrderProductRepo.findBYId(orderId);

%>
<div class="col-12">
    <div class="row">
        <%

            for (OrderProduct product : orderProducts) {%>
        <%          Product findProduct = ProductRepo.findById(product.getProductId()); %>

        <div class="col-3">
            <div class="card p-3" style=" margin-top: 5px">
                <h5><%="Poduct: "+ product.getProductName() %>
                </h5>
                <p><%="Amount: " + product.getAmount()%>
                <p><%="Pice: " + findProduct.getPrice()*product.getAmount()%>
            </div>
        </div>
        <%}%>
    </div>
</div>
<a href="/admin/order.jsp" class="btn btn-info my-3 mx-3">Back</a>





</body>
</html>
