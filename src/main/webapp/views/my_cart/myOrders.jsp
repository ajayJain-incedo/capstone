<%@page import="com.service.ConnectionProvider, com.service.VerifySession"%>
<%@page import="java.sql.* , com.service.StoreUser, com.model.User"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
    <title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<br>
<table>
    <thead>
    <tr>
        <th scope="col">S.No</th>
        <th scope="col"> Order Number</th>
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