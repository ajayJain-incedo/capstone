<!doctype html>
<%@ page import="com.dao.ProductDao, com.model.Product, com.service.SearchProducts" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.sql.*, com.service.VerifySession" %>
<%@page import = "com.service.ConnectionProvider"%>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Search Page</title>
</head>

<style>
    .container
    {
    width: 30%;
    margin:auto;
    padding: 20px;
    }
    body
    {
    background-color: #34515e !important;
    }
    </style>
<body>
<%@ include file= "SearchHeader.jsp" %>
<!--<nav>-->

<!--    <form class="form-inline my-2 my-lg-0 inline-list" action="SearchAdmin" method="post">-->
<!--        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="pname">-->
<!--        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>-->
<!--    </form>-->
<!--</nav>-->

<h1 style = "text-align: center" ><u><b>ALL THE ITEMS IN THE DATABASE</b></u></h1>

<h5 id = "msg" class ="center-align"> </h5>

<table align="center" cellpadding="15" style="background-color: white; text-align: center; border-radius: 15px; border:none;
  border-collapse: collapse;"  >
    <tr>
        <th>
            Product ID
        </th>
        <th>
            Product Name
        </th>
        <th>
            Description
        </th>
        <th>
            Price
        </th>
        <th>
            Category
        </th>
        <th>
            Discount %
        </th>
        <th>
            Available Quantity
        </th>
        <th>
            UPDATE
        </th>
        <th>
            REMOVE
        </th>
    </tr>
    <%
    HashSet<Product> products = (HashSet<Product>)request.getAttribute("list");
    for(Product p : products){
    %>
    <TR>

        <TD><%=p.getId()%></TD>
        <TD><%=p.getPname()%></TD>
        <TD><%=p.getPdesc()%></TD>
        <TD><%=p.getPrice()%></TD>
        <TD><%=p.getCategory()%></TD>
        <TD><%=p.getDiscount_percent()%></TD>
        <TD><%=p.getAvailable_quantity()%></TD>

        <td><a href="views/admin/update.jsp?id=<%=p.getId()%>" class="btn btn-dark">UPDATE</a></td>
        <% System.out.println(p.getId()); %>
        <td><button type="button" id ="<%=p.getId()%>"  class="delete btn btn-danger"  >REMOVE</button></td>
    </TR>
    <% } %>


</table>
&nbsp;&nbsp;

<%--Javascripts--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
    console.log("page is ready...");
    $(".delete").click(function() {
    let text = "Are you sure you want to delete the item? \n Either OK or Cancel.";
  if (confirm(text) == false) {
    text = "You pressed cancelled!";
    console.log(text);
  } else {
    text = "You pressed okay!";
    console.log(text);

    var id = +this.id;
    $.ajax({
    url: "views/admin/delete_ajax.jsp",
    type: "post",
    data: {
    id : id,
    },
        success : function(data){
        location.reload();
    }
    });
    }
    });
    });
</script>
</body>
</html>
