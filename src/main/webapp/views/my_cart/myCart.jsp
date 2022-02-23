<%@page import="com.service.ConnectionProvider"%>
<%@ page import="com.dao.ProductDao, com.model.Product, com.service.SearchProducts" %>
<%@ page import="java.util.HashSet" %>
<%@page import="com.service.ConnectionProvider, com.service.VerifySession, com.dao.ProductDao"%>
<%@page import="java.sql.*"%>
<%@ page import="com.service.StoreUser,com.dao.CartDao" %>
<%@page import = "com.model.User" %>
<%@include file ="header.jsp" %>
<%@include file="footer.jsp" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
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
<%
if(VerifySession.verifySession(request, response)){
return;
}
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
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
    java.sql.PreparedStatement st = con.prepareStatement("select * from cart_item where user_id=?");
    st.setInt(1, user.getId());
    ResultSet rs1=st.executeQuery();
    while(rs1.next())
    {
    total +=rs1.getInt("amount");
    }
    %>
    <tr>
        <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
        <%if(total>0){ %><th scope="col"><a href="addressPaymentForOrderNew.jsp">Proceed to order</a></th><%} %>
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
    System.out.println(user.getId());
    SearchProducts search = new SearchProducts();
    HashSet<Product> product = search.searchAllProductInCart(user.getId());
        double amount=0;
    for(Product p: product)
    {
        amount +=p.getPrice();
    %>
    <tr>
        <%sno=sno+1; %>
        <td><%=sno %></td>
        <td><%=p.getPname() %></td>
        <td><%=p.getCategory() %></td>
        <td><i class="fa fa-inr"></i> <%=p.getPrice() %></td>

        <td><i class="fa fa-inr"></i>  </td>

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