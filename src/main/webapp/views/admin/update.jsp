<!doctype html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import = "com.dao.ProductDao"%>
<%@page import = "com.model.Product "%>
<%@page import = "com.service.ConnectionProvider"%>
<%@ page import="com.service.VerifySession" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>

<html lang="en">
<title>Edit Item</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="../../resources/css/color.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
    .container
    {
    width: 30%;
    margin:auto;
    padding: 20px;
    }
    .br-21{
    border-radius:19px !important;
    }
    .bs{
    box-shadow: 1px 1px 10px;
    }
    .back:hover
    {
        transform:scale(1.9, 1.9);
    }

    </style>
<%
        String id = request.getParameter("id");
        try
        {
        Connection connection = ConnectionProvider.getConnection();
        String sql ="Select pid, pname, pdesc, price, category, discount_percent, available_quantity, pimage from product where pid="+id;
        PreparedStatement statement=connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        while(rs.next())
        {
%>
<body class="light-bg-color">
<%
if(VerifySession.verifySessionForAdmin(request, response)){
return;
}
%>
<a class = "back" href="update_item.jsp">
    <img style="height: 3.5rem; width: 3.5rem" border="0" alt="HomePage Icon" src="../../resources/static/images/admin_home_page.jpg" width="100" height="100">
</a>

<!--<main class="d-flex align-items-center my-background clip" style="height: 85vh; ">-->

    <div class="container " style="width: 100%;">

        <div class="col-md-4 offset-md-4 lc ">
            <div class="card bs br-21"  >
                <div class="card-header text-center card-header-background{" style ="height: 50px; ">
                    <i class="	fa fa-user-circle-o fa-2x "></i>
                    <p><strong>Update Item Details</strong></p>

                </div>
                <div class="card-body" style = "text-align: center">
                    <form  action="../../UpdateItemServlet" method="post">
                        <input type="hidden" name="id" value="<%=rs.getString(1) %>">
                        Product Name:
                        <p> <input type="text" name="pname" value="<%=rs.getString(2) %>"></p>
                        Product Description:
                        <textarea type = "text" name="pdesc" value="<%=rs.getString(3) %>"   class="form-control" rows="2"><%=rs.getString(3) %> </textarea>

                        Price:
                        <p><input type="number" name="price" value="<%=rs.getString(4) %>"></p>
                        Category:
                        <p><input  readonly type="text" name="category" value="<%=rs.getString(5) %>"></p>

<!--                        Discount Percentage:-->
<!--                        <p><input type="number" name="discount_percent" value="<%=rs.getString(6) %>" min="0" max="100"></p>-->

                        Available Quantity:
                        <p><input type="number" name="available_quantity" value="<%=rs.getString(7) %>"></p>
                        <input type="hidden" name="pimage" value="<%=rs.getString(8) %>">

                        <button type="submit" value="DETAILS" class = "btn btn-primary">SUBMIT</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</main>


<!--<div class = "container">-->
<!--<div class="card" style = "text-align: center">-->
<!--    <div class="card-body">-->
<!--        <h5 class="card-title"><u>UPDATE PRODUCT DETAILS</u></h5>-->
<!--        <form  action="../../UpdateItemServlet" method="post">-->
<!--            <input type="hidden" name="id" value="<%=rs.getString(1) %>">-->
<!--            Product Name:-->
<!--            <p> <input type="text" name="pname" value="<%=rs.getString(2) %>"></p>-->
<!--            Product Description:-->
<!--            <textarea type = "text" name="pdesc" value="<%=rs.getString(3) %>"   class="form-control" rows="2"><%=rs.getString(3) %> </textarea>-->

<!--            Price:-->
<!--            <p><input type="number" name="price" value="<%=rs.getString(4) %>"></p>-->
<!--            Category:-->
<!--            <p><input  readonly type="text" name="category" value="<%=rs.getString(5) %>"></p>-->

<!--            Discount Percentage:-->
<!--            <p><input type="number" name="discount_percent" value="<%=rs.getString(6) %>" min="0" max="100"></p>-->

<!--            Available Quantity:-->
<!--            <p><input type="number" name="available_quantity" value="<%=rs.getString(7) %>"></p>-->
<!--            <input type="hidden" name="pimage" value="<%=rs.getString(8) %>">-->

<!--            <button type="submit" value="DETAILS" class = "btn btn-primary">SUBMIT</button>-->
<!--        </form>-->
<!--    </div>-->
<!--</div>-->
<!--</div>-->
<%
    }
    //connection.close();
    } catch (Exception e)
    {
    e.printStackTrace();
    out.println("Unable to connect to database.(update.jsp)");
    }
%>
</body>
</html>