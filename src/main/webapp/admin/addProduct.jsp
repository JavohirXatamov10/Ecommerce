<%@ page import="org.example.ecommerse456.repo.CategoryRepo" %>
<%@ page import="org.example.ecommerse456.entity.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/10/2024
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>

<%
    List<Category> categoryList = CategoryRepo.findAll();
%>
<div class="row mt-4">
    <div class="col-4 offset-4">
        <div class="card p-2">
            <form  enctype="multipart/form-data" action="http://localhost:8080/product/add" method="post" >
                <h1>Add Product</h1>
                <input name="name" class="form-control my-3"  type="text" placeholder="Name">
                <input name="price" class="form-control my-3"  type="number" placeholder="Price">
                <select name="categoryId">
                    <%for (Category category : categoryList) {%>
                    <option value="<%=category.getId()%>"><%=category.getName()%></option>
                    <%
                        }
                    %>

                </select>
                <input name="photo" class="form-control my-3"  type="file">
                <div class="text-center">
                    <button class="btn btn-dark text-white w-100">save</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>



</body>
</html>
