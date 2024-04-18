<%@ page import="org.example.ecommerse456.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommerse456.repo.CategoryRepo" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/9/2024
  Time: 6:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Edit Category</title>
      <link rel="stylesheet" href="/static/bootstrap.min.css">
  </head>
  <body>
  <%
      int categoryId = Integer.parseInt(request.getParameter("categoryId"));
      Category category=CategoryRepo.findById(categoryId);
  %>

  <br>
  <br>
  <br>
  <div class="row mt-6">
      <div class="col-4 offset-4">
          <div class="card p-2">
              <h2 class="text-center text-muted">Edit Product</h2>
              <form action="http://localhost:8080/category/edit" method="post">
                  <input value="<%=category.getId()%>" name="id" type="hidden">
                  <input value="<%=category.getName()%>" name="name" class="form-control my-3" type="text" placeholder="Name">
                  <button class="btn btn-dark w-100">Edit</button>
              </form>
          </div>
      </div>
  </div>





  </div>


  </body>
</html>
