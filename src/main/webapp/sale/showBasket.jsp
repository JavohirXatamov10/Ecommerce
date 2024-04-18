<%@ page import="org.example.ecommerse456.entity.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.example.ecommerse456.entity.Product" %>
<%@ page import="org.example.ecommerse456.payload.Basket" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/11/2024
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ShowBasket</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>





        <%
        Object currentUserObj = session.getAttribute("currentUser");
    User user=null;
    Boolean isLogin = false;
    if (currentUserObj!=null){
        user=(User) currentUserObj;
        isLogin=true;
    }

//    List<BasketProduct> basketProducts=new ArrayList<>();


        Object baskettObj = session.getAttribute("basket");
//        if (baskettObj!=null){
//            Map<Product,Integer> basket=(Map<Product, Integer>) baskettObj;

//            if (isLogin){
//                basketProducts=BasketProductRepo.findAll();
//            }else {
//                for (Map.Entry<UUID,Integer> entry : basket.entrySet()) {
//                    basketProducts.add(new BasketProduct(
//                            -1,
//                            entry.getKey(),
//                            -1,
//                            entry.getValue()
//                    ));
//                }
//            }
      //  }


        Object basketobj = session.getAttribute("basket");
        Basket basket=(Basket) basketobj;
%>
        <nav class="navbar bg-body-tertiary btn-dark">
            <div class="container-fluid">
                <a class="navbar-brand text-white" href="#">OlmaMarket</a>

            </div>
        </nav>

        <%if(basket!=null){%>
                <%
                  basket.basketProduct.entrySet().size();
                %>

                <div class="row">
                    <div class="col-12 p-3">
                        <div class="row">
                            <div class="col-2 offset-10 p-3">
                                <a href="http://localhost:8080/add/orderProduct" class="btn btn-dark text-white "> Make order</a>
                            </div>
                        </div>
                    </div>
                </div>

                   <div class="col-12 p-4">
                    <table class="table table-striped">
                        <thead>
                        <tr>

                            <th>Name</th>
                            <th>Price</th>
                            <th>Category</th>
                            <th>Amount</th>
                            <th>Summa</th>
                            <th>Function</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for (Map.Entry<Product, Integer> entry: basket.basketProduct.entrySet()) {%>

                        <tr>
                            <td><%= entry.getKey().getName()%></td>
                            <td><%=entry.getKey().getPrice()%></td>
                            <td><%=entry.getKey().getCategoryName()%></td>
                            <td>
                                <div class="row">
                                    <div class="row col=3">
                                        <div class="col-4">
                                            <a href="http://localhost:8080/basket/decrease-product?productId=<%=entry.getKey().getId()%>">
                                                <button>-</button>
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <%=entry.getValue()%>
                                        </div>
                                        <div class="col-4">
                                            <a href="http://localhost:8080/basket/increase-product?productId=<%=entry.getKey().getId()%>">
                                                <button>+</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td><%= entry.getKey().getPrice()* entry.getValue()%></td>
                            <td>
                                <a class="btn btn-dark"
                                   href="http://localhost:8080/basketProduct/delete?productId=<%=entry.getKey().getId()%>">Delete</a>
                            </td>
                        </tr>
                        <% }%>
                        </tbody>
                    </table>
                </div>
        <%}else {%>

            <div >
                <div class="col-6 offset-3 mt-auto">
                    <ul class="list-group">
                        <h1 style="" class="text-center">Basket is empty </h1>
                        <a href="/index.jsp" class="btn btn-success ">Back home</a>
                    </ul>
                </div>
            </div>

        <%}%>










<%--&lt;%&ndash;        <%if(!basketProducts.isEmpty()){%>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="row">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="col-9 border-left p-3">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="row">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="col-2 offset-10 p-3">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <a href="/add/order?basketId=1" class="btn btn-dark text-white "> Add to Order</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--    <div class="col-12 p-4">--%>
<%--        <table class="table table-striped">--%>
<%--            <thead>--%>
<%--            <tr>--%>

<%--                <th>Product Name</th>--%>
<%--                <th>Category name</th>--%>
<%--                <th>Amount</th>--%>
<%--                <th>Function</th>--%>

<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <%for (BasketProduct basketProduct : basketProducts) {%>--%>
<%--            <%--%>
<%--                Product product = ProductRepo.findById(basketProduct.getProductId());--%>
<%--            %>--%>
<%--            <tr>--%>
<%--                <td><%= product.getName()%>--%>
<%--                </td>--%>
<%--                <td><%=product.getCategoryName()%>--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    <div class="row">--%>
<%--                        <div class="row col=3">--%>
<%--                            <div class="col-4">--%>
<%--                                <a href="http://localhost:8080/basket/decrease-product?product_id=<%=product.getId()%>&basket_id=1">--%>
<%--                                    <button>-</button>--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="col-4">--%>
<%--                                <%=basketProduct.getAmount()%>--%>
<%--                            </div>--%>
<%--                            <div class="col-4">--%>
<%--                                <a href="http://localhost:8080/basket/increase-product?product_id=<%=product.getId()%>&basket_id=1">--%>
<%--                                    <button>+</button>--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="col-9"></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    <a class="btn btn-dark"--%>
<%--                       href="http://localhost:8080/basketProduct/deleteNotLogin?productId=<%=basketProduct.getProductId()%>">Delete</a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <% }%>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--        <%}else {%>--%>


<%--    <div class="row">--%>
<%--        <div class="col-6 offset-3">--%>
<%--            <ul class="list-group">--%>
<%--                <h1 style="">Basket empty </h1>--%>
<%--                <a href="http://localhost:8080/back/menu" class="btn btn-success">Back home</a>--%>

<%--            </ul>--%>
<%--        </div>--%>

<%--            <%}%>--%>


</body>
</html>
