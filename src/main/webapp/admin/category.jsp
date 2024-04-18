<%@ page import="org.example.ecommerse456.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommerse456.repo.CategoryRepo" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/9/2024
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Category</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<%
    List<Category> categories = CategoryRepo.findAll();

%>


<div class="row">
    <div class="col-3 border-right p-4">
        <ul class="list-group">
            <a href="category.jsp"><li class="list-group-item bg-info text-white">Category</li></a>
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
                <a href="addCategory.jsp" class="btn btn-dark text-white "> Add category</a>
            </div>
        </div>
        <div class="p-4">
            <table class="table table-striped">
                <thead>
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Function</td>
                    <td></td>
                </tr>
                </thead>
                <tbody>

                    <% for (Category category : categories) {%>
                        <tr>
                        <td><%=category.getId()%></td>
                        <td><%=category.getName()%></td>
                        <td>
                            <a  href="editCategory.jsp?categoryId=<%=category.getId()%>" class="btn btn-info">Edit</a>
                            <a class="btn btn-dark" href="http://localhost:8080/category/delete?ID=<%= category.getId()%>">delete</a>
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
