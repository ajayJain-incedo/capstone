<%@page import="com.service.ConnectionProvider"%>
<%@page import="java.sql.*, com.service.VerifySession"%>
<%--<%@ page errorPage="../error_pages/error_page1.jsp" %>--%>
<%
if(VerifySession.verifySession(request, response)){
return;
}

String id=request.getParameter("id");
String incdec = request.getParameter("quantity");
double price=0;
String pidd = request.getParameter("pid");
int pid = Integer.parseInt(pidd);
System.out.println("product id is "+pid);
double total=0;
int quantity=0;
int final_total=0;
try{
    Connection con = ConnectionProvider.getConnection();
    String query="select user_id, category, round(amount/quantity, 1) as price, quantity, amount from cart_item, product where user_id ="+id+" and cart_item.product_id ="+pid;
    PreparedStatement st = con.prepareStatement(query);
    ResultSet rs = st.executeQuery();
    if(rs.next()){
        System.out.println(rs.getString(2));
}
while(rs.next()){
    price=rs.getDouble("price");
    total=rs.getDouble("amount");
    quantity=rs.getInt("quantity");
    System.out.println("Quantity is "+quantity);
}
if(quantity==1 && incdec.equals("dec")){
    response.sendRedirect("myCart.jsp?msg=notPossible");
}
else if(quantity !=1 && incdec.equals("dec"))
{
total=total-price;
quantity=quantity-1;

st.executeUpdate("update cart_item set amount="+total+",quantity="+quantity+" where user_id="+id +" and product_id="+pid);
response.sendRedirect("myCart.jsp?msg=dec");
}
else
{

total=total+price;
quantity=quantity+1;
st.executeUpdate("update cart_item set amount="+total+",quantity="+quantity+" where user_id="+id +" and product_id="+pid);
response.sendRedirect("myCart.jsp?msg=inc");
}
}
catch(Exception e)
{
System.out.println(e);
}
%>