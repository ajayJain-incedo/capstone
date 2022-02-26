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
<html >
<head>
    <link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>My Cart</title>
    <style>
h3
{
	color: #E74C3C;
	text-align: center;
}
</style>
</head>
<body>
    <%
    if(VerifySession.verifySession(request, response)){
        return;
    }
    StoreUser store = new StoreUser();
    Connection con = ConnectionProvider.getConnection();
    User user = store.getUser();
    int uid = user.getId();
    String back = request.getParameter("back");
    int oid = 0;

    if(back!=null && back.equals("true")){

    String queryToGetOrderId="select oid from orders where user_id =? and payment_status ='Pending'";
    PreparedStatement pstmt = con.prepareStatement(queryToGetOrderId);
    pstmt.setInt(1, uid);
    ResultSet rsOrderId = pstmt.executeQuery();
    while(rsOrderId.next()){
        oid=rsOrderId.getInt("oid");

    }


    String callQuery = "call remove_order(?, ?)";
    try{
    CallableStatement cstmt = con.prepareCall(callQuery);
    cstmt.setInt(1,oid);
    cstmt.setInt(2, uid);
    cstmt.execute();
    }catch(Exception e){e.printStackTrace();}
    }
    String msg=request.getParameter("msg");
    if("notPossible".equals(msg))
    {
%>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<h3 class="alert" style="color:red">There is only one Quantity! So click on remove!</h3>
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
        //Connection con = ConnectionProvider.getConnection();
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
    //System.out.println(user.getId());
    String query ="select pname, category, round(amount/quantity, 1) as price,  product_id, quantity, product_id ,amount,  product_id from cart_item, product where user_id = ? and cart_item.product_id = product.pid";

    PreparedStatement pstmt =con.prepareStatement(query);
    pstmt.setInt(1, user.getId());
   // pstmt.setString(1, String.valueOf(current_user.getId()));
    ResultSet rs=pstmt.executeQuery();
    while(rs.next())
    {
    %>
    <tr>
        <%sno=sno+1; %>
        <td><%=sno %></td>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><i class="fa fa-inr"></i> <%=rs.getString(3) %></td>
        <td><a href='incDecQuantityAction.jsp?id=<%=user.getId()%>&quantity=inc&pid=<%=rs.getInt(4) %>'><i class='fas fa-plus-circle'></i></a> <%=rs.getInt(5) %> <a href='incDecQuantityAction.jsp?id=<%=user.getId()%>&quantity=dec&pid=<%=rs.getInt(6) %>'><i class='fas fa-minus-circle'></i></a></td>
        <td><i class="fa fa-inr"></i> <%=rs.getInt(7) %> </td>
        <td><a href="removeFromCart.jsp?id=<%=user.getId()%>&pid=<%=rs.getInt(4) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
    </tr>
    <%
    }
    }
    catch(Exception e)
    {e.printStackTrace();}
    %>

    <%if(total>0){ %>
    <div style="text-align: right; width:100%; padding:0;">
    <th scope="col"><a class="btn text-right" href="addressPaymentForOrderNew.jsp">Proceed to order</a></th><%} %>
    </div>
    </tbody>
</table>
<br>
<br>
<br>

</body>
</html>