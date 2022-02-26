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
    } catch(Exception e ){System.out.println(e);}

    %>
    <tr>
        <th scope="col"><a href="myCart.jsp?back=true"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
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
    int uid=0;
    try
    {
    Connection con = ConnectionProvider.getConnection();

    PreparedStatement st = con.prepareStatement("select  p.pname, p.category, c.product_price,  c.product_id, c.quantity, c.user_id, c.amount from cart_item c, product p where user_id = ? and c.product_id = p.pid");

    st.setInt(1, user.getId());

    ResultSet rs3=st.executeQuery();
    while(rs3.next())
    {
    uid=rs3.getInt("user_id");
    total +=rs3.getInt("amount");

    %>

    <tr>
        <%sno=sno+1; %>
        <td><%=sno %></td>
        <td><%=rs3.getString("pname") %></td>
        <td><%=rs3.getString("category") %></td>
        <td><i class="fa fa-inr"></i> <%=rs3.getDouble("product_price") %></td>
        <td> <%=rs3.getInt("quantity") %></td>
        <td><i class="fa fa-inr"></i> <%=rs3.getDouble("amount") %></td>
    </tr>
    <%
    }

    %>

    </tbody>



</table>

<hr style="width: 100%">

<div style="text-align:center; ">
    <h3> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total: <%out.println(total/2); %></h3>
</div>
    <div class="" style="text-align:center;">
    <a onclick='doPrint()'><button class="button right-button">Place Order & Get Invoice</button></a>
    </div>
<%

}
catch(Exception e)
{
System.out.println(e);
}
%>
<br>
<br>
<br>
<br>
<br>
<br>
<script>
function doPrint() {
    window.print();
    document.location.href = "PaymentSuccesfull.jsp";
}
</script>




</body>
</html>