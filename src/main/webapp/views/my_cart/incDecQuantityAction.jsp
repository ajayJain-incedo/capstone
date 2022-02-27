<%@ page import="com.dao.ProductDao, com.dao.UserDao, com.model.User, com.model.Product, com.service.*" %>
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

double total=0;
int quantity=0;
int final_total=0;
try{
    Connection con = ConnectionProvider.getConnection();
    UserDao userDao = new UserDao(con);
    User user = userDao.getUserByEmail(StoreUser.getUser().getEmail());
    int cartItem=user.getCartItem();
    if(incdec.equals("inc")){
        cartItem++;
    }else{
        cartItem--;
    }
    userDao.updateCartItem(cartItem, Integer.parseInt(id));

    String query="select user_id, category, round(amount/quantity, 1) as price, quantity, amount from cart_item, product where user_id ="+id+" and cart_item.product_id ="+pid;
    PreparedStatement st = con.prepareStatement(query);
    ResultSet rs = st.executeQuery();

while(rs.next()){
    price=rs.getDouble("price");
    total=rs.getDouble("amount");
    quantity=rs.getInt("quantity");

}
if(quantity==1 && incdec.equals("dec")){
    String query1 = "delete from cart_item where user_id=? and product_id=?";
    PreparedStatement st1 = con.prepareStatement(query1);
    st1.setString(1, id);
    st1.setInt(2, pid);
    st1.executeUpdate();
    response.sendRedirect("myCart.jsp?msg=removed");
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