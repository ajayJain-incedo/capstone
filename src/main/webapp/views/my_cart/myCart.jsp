<%@page import="com.service.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="com.service.StoreUser" %>
<%@page import = "com.model.User" %>
<%@include file ="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>My Cart</title>
    <style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<%
if("removed".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
    <thead>
    <%
    int total=0;
    int sno=0;
    try
    {
    Connection con = ConnectionProvider.getConnection();
    java.sql.PreparedStatement st = con.prepareStatement("select * from cart_item where user_id=1002");
    ResultSet rs1=st.executeQuery();
    while(rs1.next())
    {
    total +=rs1.getInt("amount");
    }
    %>
    <tr>
        <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
        <%if(total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
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
        <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
    </tr>
    </thead>
    <tbody>
    <%

    StoreUser store = new StoreUser();
    User current_user = store.getUser();

    System.out.println(current_user.getId());
    String query ="select pname, category, round(amount/quantity) as price, quantity, amount from cart_item, product where user_id = 1002 and cart_item.product_id = product.pid";
    PreparedStatement pstmt =con.prepareStatement(query);
   // pstmt.setString(1, String.valueOf(current_user.getId()));
    ResultSet rs=pstmt.executeQuery();
    while(rs.next())
    {
    System.out.println(rs);
    %>
    <tr>
        <%sno=sno+1; %>
        <td><%=sno %></td>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><i class="fa fa-inr"></i> <%=rs.getString(3) %></td>
        <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getInt(4) %> <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
        <td><i class="fa fa-inr"></i> <%=rs.getInt(5) %> </td>
        <td><a href="removeFromCart.jsp?id<%=rs.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
    </tr>
    <%
    }
    }
    catch(Exception e)
    {}
    %>
    </tbody>
</table>
<br>
<br>
<br>

</body>
</html>