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
    <th scope="col" style="background-color: yellow; ">Total: <i class="fa fa-inr"></i> <%out.println(total); %> </th>

</table>

<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">

    <div class="left-div">
        <h3>Select way of Payment</h3>
        <select class="input-style" name="paymentMethod">
            <option value="Cash on delivery(COD)">Cash on delivery(COD)</option>
            <option value="Online Payment">Incedo Pay</option>
            <option value="Online Payment">GPay</option>
            <option value="Online Payment">Paytm</option>
            <option value="Online Payment">Amazon Pay</option>
            <option value="Online Payment">Bharat Pay</option>
            <option value="Online Payment">Phone Pay</option>
        </select>
    </div>

    <div class="right-div">
        <h3>Please Enter The UPI ID</h3>
        <input class ="input-style" type="text" name="transactionId" placeholder="Enter Transaction ID">
        <h3 style="color: red">*Leave Blank Incase Of "COD"</h3>
    </div>
    <hr style="width: 100%">


    <div class="right-div">
        <button class="button" type="submit">Procced to Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>

    </div>
</form>
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