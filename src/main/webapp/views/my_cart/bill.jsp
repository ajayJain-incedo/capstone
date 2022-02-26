<%@page import="com.service.ConnectionProvider, com.service.VerifySession"%>
<%@page import="java.sql.* , com.service.StoreUser, com.model.User"%>
<%@include file="footer.jsp" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="css/bill.css">
    <title>Bill</title>
</head>
<body>
<%
    StoreUser store = new StoreUser();
    User user = store.getUser();

    try
    {
        int total=0;
        int sno=0;
        Connection con = ConnectionProvider.getConnection();
        java.sql.PreparedStatement st = con.prepareStatement("select * from cart_item where user_id=? ");
        st.setInt(1, user.getId());

        ResultSet rs1=st.executeQuery();
        while(rs1.next())
        {
        total +=rs1.getInt("amount");
        }

        //ResultSet rs2 = st.executeQuery("select * from users inner join cart where cart.email='"+email"' and cart.status='bill'");
       // while(rs2.next())
        //{
    }
    catch(Exception e )     {System.out.println(e);}
%>
<h3>Online shopping Bill </h3>
<hr>
<div class="left-div"><h3>Name: <%=user.getFirstName()%> </h3></div>
<div class="right-div-right"><h3>Email: <%=user.getEmail()%> </h3></div>
<div class="right-div"><h3>Mobile Number: <%=user.getMobile()%> </h3></div>

<div class="left-div"><h3>Order Date: <%= (new java.util.Date()).toLocaleString()%> </h3></div>
<div class="left-div"><h3>Expected Delivery Date: <%= (new java.util.Date()).toLocaleString()%> </h3></div>

<div class="right-div"><h3>Address: <%=user.getAddress()%> </h3></div>

<hr>
<%break;%>
<%
    //StoreUser store = new StoreUser();
    //User user = store.getUser();
    int total=0;
    int sno=0;
    try
    {
        Connection con = ConnectionProvider.getConnection();
        java.sql.PreparedStatement st = con.prepareStatement("select * from cart_item where user_id=? ");
        st.setInt(1, user.getId());

        ResultSet rs1=st.executeQuery();
        while(rs1.next())
        {
            total +=rs1.getInt("amount");
        }
    }
    catch(Exception e ){System.out.println(e);}
%>

<br>

<table id="customers">
    <h3>Product Details</h3>
    <tr>
        <th>S.No</th>
        <th>Product Name</th>
        <th>category</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Sub Total</th>
    </tr>
    <%
    try
    {
    Connection con = ConnectionProvider.getConnection();
    PreparedStatement st = con.prepareStatement("select pname, category, product_price,  product_id, quantity, product_id ,amount,  product_id from cart_item, product where user_id = ? and cart_item.product_id = product.pid");

    st.setInt(1, user.getId());

    ResultSet rs3=st.executeQuery();
    //int sno=0;
    //int total=0;
    while(rs3.next())
    {
        total +=rs3.getInt("amount");
        %>
        <tr>
            <%sno=sno+1; %>
            <td><%=sno %></td>
            <td><%=rs3.getString("pname") %></td>
            <td><%=rs3.getString("category") %></td>
            <td><%=rs3.getString("product_price") %></td>
            <td><%=rs3.getInt("quantity") %></td>
            <td><%=rs3.getInt("amount") %></td>
        </tr>
        <tr>
            <%} %>
</table>
<h3>Total: <%out.println(total); %></h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
}
catch(Exception e)
{
    System.out.println(e);
}
finally{
System.out.println("Finally Block Executed");
%>
</body>
</html>