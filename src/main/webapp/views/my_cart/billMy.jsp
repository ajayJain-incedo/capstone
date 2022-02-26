<%@page import="com.service.ConnectionProvider, com.service.VerifySession"%>
<%@page import="java.sql.*, com.service.StoreUser, com.model.User"%>
<%@include file="footer.jsp" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <title>Home</title>
    <script>
if(window.history.forward(1) !=null)
	window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
    <thead>
    <%
    StoreUser store = new StoreUser();
    User user = store.getUser();
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
    <tr>
        <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
        <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %> </th>
    </tr>
    </thead>
    <thead>
    <tr>
        <th scope="col">S.No</th>
        <th scope="col">Product Name</th>
        <th scope="col">Category</th>
        <th scope="col"><i class="fa fa-inr"></i> price</th>
        <th scope="col">Quantity</th>
        <th scope="col">Sub Total</th>
    </tr>
    </thead>
    <tbody>
    <%

    try
    {
    Connection con = ConnectionProvider.getConnection();
    PreparedStatement st = con.prepareStatement("select pname, category, product_price,  product_id, quantity, product_id ,amount,  product_id from cart_item, product where user_id = ? and cart_item.product_id = product.pid");

    st.setInt(1, user.getId());

    ResultSet rs3=st.executeQuery();
    while(rs3.next())
    {
    total +=rs3.getInt("amount");

    %>

    <tr>
        <%sno=sno+1; %>
        <td><%=sno %></td>
        <td><%=rs3.getString("pname") %></td>
        <td><%=rs3.getString("category") %></td>
        <td><i class="fa fa-inr"></i> <%=rs3.getString("product_price") %></td>
        <td> <%=rs3.getInt("quantity") %></td>
        <td><i class="fa fa-inr"></i> <%=rs3.getInt("amount") %></td>
    </tr>
    <%
    }

    %>

    </tbody>



</table>

<hr style="width: 100%">


    <h3 >Total: <%out.println(total/2); %></h3>
    <a href="addressPaymentForOrderNew.jsp"><button class="button left-button">Proceed For Payment</button></a>
    <a onclick="window.print();"><button class="button right-button">Print</button></a>

<%

}
catch(Exception e)
{
System.out.println(e);
}
finally{
System.out.println("Finally Block Executed");}%>
<br>
<br>
<br>
<br>
<br>
<br>





</body>
</html>