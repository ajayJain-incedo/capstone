<%@page import="com.service.ConnectionProvider, com.service.VerifySession"%>
<%@page import="java.sql.* , com.service.StoreUser, com.model.User"%>
<%@include file="footer.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
    <title>Home</title>
    <link rel="stylesheet" href="../../resources/css/header.css">
    <link rel="stylesheet" href="../../resources/css/color.css">
    <link rel="stylesheet" href="../../resources/css/my_profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/home-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="../../resources/css/product.css">
    <link rel="stylesheet" href="../../resources/css/color.css">
    <link rel="stylesheet" href="../../resources/css/stickyCart.css">
</head>

<body style="background-color: rgb(252 238 238) !important;">
<nav class="navbar navbar-expand-lg navbar-light blue-bg-color">
    <a class="navbar-brand inline-margin-start white-color" href="/Capstone/DisplayProduct"><img style="width:5.5rem;" src="../../resources/static/images/icon.png"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div style="margin-left: 59%;">
        <ul class=" navbar-nav mr-auto inline-list-padding" >
            <li class="nav-item d-flex align-items-center text-white mr-16">
                <a class="white-color nav-link hover-oscillate" href="../my_cart/myCart.jsp">Cart</a>
                <i class="fa fa-shopping-cart icon"></i>
            </li>
            <li class="nav-item d-flex align-items-center text-white mr-16">
                <a class="white-color nav-link hover-oscillate" href="../user/my_profile.jsp">Profile</a>
                <i class=" far fa-user-circle icon"></i>
            </li>
            <li class="nav-item d-flex align-items-center text-white mr-16">
                <a class="white-color nav-link hover-oscillate" href="/Capstone/Logout">Logout</a>
                <i class="fas fa-sign-out-alt icon" style="font-size:1.1rem"></i>
            </li>
        </ul>
    </div>
</nav>
<div style="color: black; text-align: center; font-size: 30px; margin-top:10px;">My Orders <i class='fab fa-elementor'></i></div>
<br>
<table>
    <thead>
    <tr>
        <th scope="col">S.No</th>
        <th scope="col"> Order Id</th>
        <th scope="col">Product Name</th>
        <th scope="col">category</th>
        <th scope="col"><i class="fa fa-inr"></i>  Price</th>
        <th scope="col">Quantity</th>
        <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>

    </tr>
    </thead>
    <tbody>
    <%

    try
    {

        User user = StoreUser.getUser();
        Connection con = ConnectionProvider.getConnection();
        java.sql.PreparedStatement st = con.prepareStatement("select order_id, pname, category, price, product_quantity, pay_amount from order_history, product where order_history.user_id=? and product.pid=order_history.product_id");
        //st.setInt(1, user.getId());
       // PreparedStatement st = con.prepareStatement("select pname, category, product_price,  product_id, quantity, product_id ,amount,  product_id from cart_item, product where user_id = ? and cart_item.product_id = product.pid");

        st.setInt(1, user.getId());
        int total=0;
        int sno=0;
        ResultSet rs1=st.executeQuery();
        while(rs1.next())
        {

            total +=rs1.getDouble("pay_amount");
    %>
    <tr>
        <%sno=sno+1; %>
        <td><%=sno %></td>
        <td><%=rs1.getInt("order_id") %></td>
        <td><%=rs1.getString("pname") %></td>
        <td><%=rs1.getString("category") %></td>
        <td><i class="fa fa-inr"></i> <%=rs1.getDouble("price") %></td>
        <td> <%=rs1.getInt("product_quantity") %></td>
        <td><i class="fa fa-inr"></i> <%=rs1.getDouble("pay_amount") %></td>
    </tr>
    <%
    }
    }
    catch(Exception e)
    {
    System.out.println(e);
    }%>
    </tbody>
</table>
<br>
<br>
<br>

</body>
</html>