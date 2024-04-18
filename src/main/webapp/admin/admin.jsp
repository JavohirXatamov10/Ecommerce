<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/9/2024
  Time: 12:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<nav class="navbar bg-body-tertiary btn-block">
    <div class="container-fluid">
        <a class="navbar-brand text-white " href="#" >OlmaMarket</a>
    </div>
</nav>

<div class="row">
    <div class="col-3 border-right p-4">
            <ul class="list-group">
                <a href="category.jsp"><li class="list-group-item">Category</li></a>
                <a href="product.jsp"><li class="list-group-item">Product</li></a>
                <a href="order.jsp"><li class="list-group-item">Order</li></a>
                <a href="controlOrders.jsp"><li class="list-group-item">Status Product</li></a>
                <a href="archived.jsp"><li class="list-group-item">Archived</li></a>
            </ul>
    </div>
    <div class="col-9 border-left p-3">
        <div class="row">
            <div class="col-2 offset-10">
                <a href="http://localhost:8080/logout" class="btn btn-dark text-white ">Logout</a>
            </div>
        </div>
    </div>

</div>

</body>
</html>
