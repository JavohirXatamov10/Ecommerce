<%@ page import="org.example.ecommerse456.repo.ProductRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommerse456.entity.Product" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/9/2024
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%List<Product>products=ProductRepo.findAll(); %>
<div class="row">
    <div class="col-3 border-right p-4">
        <ul class="list-group">
            <a href="category.jsp"><li class="list-group-item">Category</li></a>
            <a href="product.jsp"><li class="list-group-item bg-info text-white">Product</li></a>
            <a href="order.jsp"><li class="list-group-item ">Order</li></a>
            <a href="controlOrders.jsp"><li class="list-group-item">Status Product</li></a>
            <a href="archived.jsp"><li class="list-group-item">Archived</li></a>

        </ul>
    </div>
    <div class="col-9 border-left p-3">
        <div class="row">
            <div class="col-2 offset-10">
                <a href="http://localhost:8080/logout" class="btn btn-dark text-white ">Logout</a>
                <a href="addProduct.jsp" class="btn btn-dark p-2 ">Add Product</a>
            </div>
        </div>

        <div class="p-4">
            <table class="table table-striped">
                <thead>
                <tr>
                    <td>Name</td>
                    <td>Price</td>
                    <td>Category</td>
                    <td>Photo</td>
                    <td>Functions</td>
                </tr>
                </thead>
                <tbody>

                <% for (Product product : products) {%>
                <tr>
                    <td><%=product.getName()%></td>
                    <td><%=product.getPrice()%></td>
                    <td><%=product.getCategoryName()%></td>
                    <td>
                        <img src="/product/download_photo?productId=<%=product.getId()%>" width="5%" alt="Product Photo">
                    </td>
                    <td>
                        <a  href="editProduct.jsp?productId=<%=product.getId()%>" class="btn btn-info">Edit</a>
                        <a class="btn btn-dark" href="http://localhost:8080/product/delete?ID=<%= product.getId()%>">delete</a>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>






    </div>




</div>
</body>
</html>
