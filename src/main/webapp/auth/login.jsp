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
    <title>Login</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="row mt-4">
    <div class="col-4 offset-4">
        <div class="card p-2">
            <form action="http://localhost:8080/login" method="post">
                <h1>Login</h1>
                <input name="username" class="form-control my-3"  type="text" placeholder="Username">
                <input name="password" class="form-control my-3"  type="password" placeholder="Password">
                <div class="text-center">
                    <button class="btn btn-dark text-white w-100">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>


</body>
</html>
