<%@page import="com.service.ConnectionProvider"%>
<%@ page import="com.dao.ProductDao, com.model.Product, com.service.SearchProducts" %>
<%@ page import="java.util.HashSet" %>
<%@page import="com.service.ConnectionProvider, com.service.VerifySession, com.dao.ProductDao"%>
<%@page import="java.sql.*"%>
<%@ page import="com.service.StoreUser,com.dao.CartDao" %>
<%@page import = "com.model.User" %>
<%--<%@include file ="header.jsp" %>--%>
<%@include file="footer.jsp" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html >
<head>
    <link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>My Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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

    <style>
.alert
{
	color: blue;
	text-align: center;
}
</style>
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
            <a class="white-color nav-link hover-oscillate" href="../my_cart/myOrders.jsp">My Orders</a>
            <i class="fa fa-archive icon"></i>
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
    <%
    if(VerifySession.verifySession(request, response)){
        return;
    }

    Connection con = ConnectionProvider.getConnection();
    User user = StoreUser.getUser();
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
%>
<div style="color: black; text-align: center; font-size: 30px;margin-top:11px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
if("inc".equals(msg))
{
%>
<h5 class="alert">Quantity  Increased Successfully!</h5>
<%} %>
<%
if("dec".equals(msg))
{
%>
<h5 class="alert" style="color:red !important;">Quantity  Decreased Successfully!</h5>
<%} %>
<%
if("removed".equals(msg))
{
%>
<h5 class="alert" style="color:red !important;">Product Successfully Removed!</h5>
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
    String query ="select pname, category, product_price,  product_id, quantity, product_id ,amount,  product_id from cart_item, product where user_id = ? and cart_item.product_id = product.pid";

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
        <td><a style="color:red;" href="removeFromCart.jsp?id=<%=user.getId()%>&pid=<%=rs.getInt(4)%>&cartItem=<%=rs.getInt(5) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
    </tr>
    <%
    }
    }
    catch(Exception e)
    {e.printStackTrace();}
    %>

    <%if(total>0){ %>

    </tbody>
</table>
<div style="text-align: right; width:100%; padding:0;">
    <a class="btn btn-primary text-right" href="addressPaymentForOrderNew.jsp">Proceed to order</a><%} %>
</div>
<br>
<br>
<br>

</body>
</html>