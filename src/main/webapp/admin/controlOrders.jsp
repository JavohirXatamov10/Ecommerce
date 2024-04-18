<%@ page import="org.example.ecommerse456.entity.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.ecommerse456.repo.OrderRepo" %>
<%@ page import="org.example.ecommerse456.entity.OrderStatus" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ManageProduct</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>

 <div class="row">
    <div class="col-3 border-right p-4">
        <ul class="list-group">
            <a href="category.jsp"><li class="list-group-item">Category</li></a>
            <a href="product.jsp"><li class="list-group-item ">Product</li></a>
            <a href="order.jsp"><li class="list-group-item ">Order</li></a>
            <a href="controlOrders.jsp"><li class="list-group-item bg-info text-white">Status orders</li></a>
            <a href="archived.jsp"><li class="list-group-item">Archived</li></a>
        </ul>
    </div>
        <% List<Order> orders = OrderRepo.findAll(); %>

    <div class="col-3 p-2">
        <h2>Open</h2>
        <table class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Product Count</th>
                <th>Price</th>
                <th>#</th>
            </tr>
            </thead>
            <tbody>
            <% List<Order> openOrders = orders.stream()
                    .filter(item -> item.getStatus().equals(OrderStatus.OPEN))
                    .toList();
            %>
            <% for (Order order : openOrders) { %>
            <tr>
                <td><%=order.getId()%>
                </td>
                <td><%=order.getProductCount()%>
                </td>
                <td><%=order.getPrice()%>
                </td>
                <td><a href="change-order-status?order_id=<%=order.getId()%>&status=<%=OrderStatus.IN_PROGRESS%>">
                    <button>In Progress</button>
                </a></td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>


     <div class="col-3 p-2">
         <h2>Complete</h2>
         <table class="table">
             <thead>
             <tr>
                 <th>Id</th>
                 <th>Product Count</th>
                 <th>Price</th>
                 <th>#</th>
             </tr>
             </thead>
             <tbody>
             <% List<Order> inPorgressOrders = orders.stream()
                     .filter(item -> item.getStatus().equals(OrderStatus.IN_PROGRESS))
                     .toList();
             %>
             <% for (Order order : inPorgressOrders) { %>
             <tr>
                 <td><%=order.getId()%>
                 </td>
                 <td><%=order.getProductCount()%>
                 </td>
                 <td><%=order.getPrice()%>
                 </td>
                 <td><a href="change-order-status?order_id=<%=order.getId()%>&status=<%=OrderStatus.COMPLETED%>">
                     <button>Completed</button>
                 </a></td>
             </tr>
             <%}%>
             </tbody>
         </table>
     </div>

     <div class="col-3 p-2">
         <h2>Archive</h2>
         <table class="table">
             <thead>
             <tr>
                 <th>Id</th>
                 <th>Product Count</th>
                 <th>Price</th>
                 <th>#</th>
             </tr>
             </thead>
             <tbody>
             <% List<Order> CompletedOrders = orders.stream()
                     .filter(item -> item.getStatus().equals(OrderStatus.COMPLETED))
                     .toList();
             %>
             <% for (Order order : CompletedOrders) { %>
             <tr>
                 <td><%=order.getId()%>
                 </td>
                 <td><%=order.getProductCount()%>
                 </td>
                 <td><%=order.getPrice()%>
                 </td>
                 <td><a href="change-order-status?order_id=<%=order.getId()%>&status=<%=OrderStatus.ARCHIVE%>">
                     <button>Archived</button>
                 </a></td>
             </tr>
             <%}%>
             </tbody>
         </table>
     </div>
 </div>


     <div class="col-3 offset-6">
         <a href="http://localhost:8080/logout" class="btn btn-dark text-white ">Logout</a>
     </div>








</body>
</html>
