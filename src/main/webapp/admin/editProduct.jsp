<%@ page import="org.example.ecommerse456.repo.ProductRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommerse456.entity.Product" %>
<%@ page import="org.example.ecommerse456.entity.Category" %>
<%@ page import="org.example.ecommerse456.repo.CategoryRepo" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/9/2024
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    int productId = Integer.parseInt(request.getParameter("productId"));
    List<Category> categories = CategoryRepo.findAll();
    Product product=ProductRepo.findById(productId);
%>

<div class="row mt-6">
    <div class="col-4 offset-4">
        <div class="card p-2">
            <h2 class="text-center text-muted">Edit Product</h2>
            <form action="http://localhost:8080/edit/product" method="post" enctype="multipart/form-data">
                <input value="<%=product.getId()%>" name="id" type="hidden">
                <input value="<%=product.getName()%>" name="name" class="form-control my-3" type="text" placeholder="Name">
                <input value="<%=product.getPrice()%>" name="price" class="form-control my-3" type="number" placeholder="Price">
                <select name="categoryId" class="form-control mb-3">
                    <%for (Category category : categories) {
                        if((category.getId().equals(product.getCategoryId()))){%>
                    <option selected value="<%=category.getId()%>"><%=category.getName()%></option>
                    <% } else{%>
                    <option value="<%=category.getId()%>"><%=category.getName()%></option>
                    <%}%>
                    <% } %>
                </select>
                <input name="photo" class="form-control my-3" type="file">
                <button class="btn btn-dark w-100">Edit</button>
            </form>
        </div>
    </div>
</div>




</body>
</html>
