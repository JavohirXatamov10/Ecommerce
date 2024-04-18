<%@ page import="org.example.ecommerse456.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommerse456.repo.CategoryRepo" %>
<%@ page import="org.example.ecommerse456.entity.Product" %>
<%@ page import="org.example.ecommerse456.repo.ProductRepo" %>
<%@ page import="org.example.ecommerse456.entity.User" %>
<%@ page import="org.example.ecommerse456.payload.Basket" %>
<%@ page import="org.example.ecommerse456.entity.UserRole" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Olma Market</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">

</head>
<body>
<%
    //    String categoryIdStr = request.getParameter("categoryId");
//    Integer categoryId;
//    List<Product> products;
//    if (categoryIdStr!=null){
//        categoryId=Integer.parseInt(categoryIdStr);
//    products= ProductRepo.findAll().stream().filter(item->item.getCategoryId().equals(categoryId)).toList();
//    }
//    else {
//        categoryId = 0;
//        products=ProductRepo.findAll();
//    }
//    List<Category> categories = CategoryRepo.findAll();


    Object currentUserObj = session.getAttribute("currentUser");
    User user = null;
    Boolean isLogin = false;
    if (currentUserObj != null) {
        user = (User) currentUserObj;
        isLogin = true;
    }


    Basket basket = new Basket();
    Object object = session.getAttribute("basket");
    if (object != null) {
        basket = (Basket) object;
    }


    List<Category> categories = CategoryRepo.findAll();
    List<Product> products;
    String categoryIdObj = request.getParameter("categoryId");
    if (categoryIdObj != null) {
        int categoryId = Integer.parseInt(categoryIdObj);
        products = ProductRepo.findAllByCategoryId(categoryId);
    } else {
        products = ProductRepo.findAll();
    }
%>





<nav class="navbar bg-body-tertiary btn-dark">
    <div class="container-fluid">
        <a class="navbar-brand text-white " href="#">OlmaMarket</a>
        <a class="btn btn-success text-white" href="/sale/showBasket.jsp">Basket(<%=basket.basketProduct.size()%>)</a>
        <%if (user==null){%>
        <a class="btn btn-success text-white" href="auth/login.jsp">Login</a>
        <%}else {%>
        <a class="btn btn-success text-white" href="http://localhost:8080/logout">Log out</a>
        <%}%>
        <%--        <a class="btn btn-success text-white" href="admin/admin.jsp">Admin </a>--%>
    </div>
</nav>

<div class="row">
    <div class="col-3 p-3">
        <ul>
            <a href="?">
                <li class="list-group-item">All
                </li>
            </a>
            <%for (Category category : categories) {%>
            <a href="?categoryId=<%=category.getId()%>">
                <li class="list-group-item"><%=category.getName()%>
                </li>
            </a>
            <% }%>
        </ul>
    </div>
    <div class="col-9">
        <div class="row">
            <%
                for (Product product : products) {%>
            <div class="col-3">

                <div class="card p-3" style=" margin-top: 5px">
                    <img src="/product/download_photo?productId=<%=product.getId()%>" style="aspect-ratio: 1/1" width="100px" alt="Product Photo">
                    <%--                    <img class="mt-2" src="" height="50%" alt="">--%>
                    <h5><%="Name: " + product.getName()%>
                    </h5>
                    <p><%="Price: " + product.getPrice()%>
                    </p>
                    <p><%=product.getCategoryName()%>
                    </p>

                    <% if (basket.basketProduct.containsKey(product)) {%>
                    <button class="btn btn-success"> added</button>
                    <%} else {%>


                    <%if (categoryIdObj != null) {%>
                    <%if (isLogin) {%>
                            <form  action="/add/basket" method="post">
                                <input type="hidden" name="productId" value="<%=product.getId()%>">
                                <button class="disabled btn-link btn btn-dark">Add to Basket</button>
                            </form>

                    <% } else {%>
                    <form action="/add/basketNotLogin" method="post">
                        <input type="hidden" name="productId" value="<%=product.getId()%>">
                        <button class="disabled btn-link btn btn-dark">Add to Basket</button>
                    </form>
                    <%          }
                            }
                        }
                    %>
                </div>
            </div>
            <% }%>
        </div>
    </div>
</div>

</div>




</body>
</html>