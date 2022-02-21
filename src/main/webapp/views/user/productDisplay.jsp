<!doctype html>
<%@ page import="com.dao.ProductDao, com.model.Product, com.service.SearchProducts" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.sql.*" %>




<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/user.css">
    <title>Document</title>
</head>
<body>
    <%
        HashSet<Product> products = (HashSet<Product>)request.getAttribute("list");
        for(Product p : products){
        %>
        <div class='card' style='width: 18rem;'>
            <div class='card-body' >
                <h5 class='card-title' > <%= p.getPname() %> </h5 >
                <h5 class='card-title' > <%= p.getCategory() %> </h5 >
                <h5 class='card-title' > <%= p.getPrice() %> </h5 >
                <p class='card-text' > <%= p.getPdesc() %> </p >
                <a class="btn btn-primary" href="AddToCart?pid=<%= p.getId() %>&price=<%= p.getPrice() %>" >Add to Cart</a >
<!--                ../my_cart/myCart.jsp?pid=<%= p.getId() %>-->
                </div >
            </div >
        <% } %>

</body>
</html>