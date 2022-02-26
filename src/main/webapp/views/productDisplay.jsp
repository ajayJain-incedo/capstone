<!doctype html>
<%@ page import="com.dao.ProductDao, com.model.Product, com.service.SearchProducts" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.sql.*, com.service.VerifySession" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/product.css">
    <link rel="stylesheet" href="resources/css/color.css">
    <link rel="stylesheet" href="resources/css/stickyCart.css">

    <title>Document</title>
</head>
<body class="light-bg-color" style="background-color: rgb(252 238 238) !important">
    <%
    if(VerifySession.verifySession(request, response)){
    return;
    }
        HashSet<Product> products = (HashSet<Product>)request.getAttribute("list");

        for(Product p : products){
            String path = "resources/static/product_images/" +p.getPimage();
        %>
        <div class='card card-size white-border'>
            <div class="card-img-top card-image">
                <img class="card-image-size" src=<%=path%> alt=<%=p.getPimage()%>>
            </div>
            <div class='card-body card-body-size' >
                <h5 class='card-title' style="margin-top:10px;"> <%= p.getPname() %> </h5 >
                <h5 class='card-title' > <%= p.getCategory() %> </h5 >
                <h5 class='card-title' > &#8377;<%= p.getPrice() %> </h5 >
                <p class='card-text' > <%= p.getPdesc() %> </p >
                <a class="btn btn-primary" id="AddToCart" href="AddToCart?pid=<%= p.getId() %>&price=<%= p.getPrice() %>"  >Add to Cart</a >
                <%  StoreUser store= new StoreUser();
                    User user = store.getUser();
                %>
                <div class="sticky-cart"> <%=user.getCartItem()%>  </div>
            </div >
        </div >
        <% } %>

</body>
</html>