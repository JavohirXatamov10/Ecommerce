<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/9/2024
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="row mt-4">
    <div class="col-4 offset-4">
        <div class="card p-2">
            <form action="http://localhost:8080/category/add" method="post">
                <h1>Add Category</h1>
                <input name="id" class="form-control my-3"  type="text" placeholder="Name">
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
