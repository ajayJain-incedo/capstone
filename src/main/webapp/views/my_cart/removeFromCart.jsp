<%@ page import="com.dao.ProductDao, com.dao.UserDao, com.model.User, com.model.Product, com.service.*" %>
<%@page import="java.sql.*,com.service.VerifySession"%>
<%
if(VerifySession.verifySession(request, response)){
    return;
}
String id=request.getParameter("id");
String incdec = request.getParameter("quantity");
double price=0;
String pidd = request.getParameter("pid");
int pid = Integer.parseInt(pidd);

try
{
    Connection con = ConnectionProvider.getConnection();
    UserDao userDao = new UserDao(con);
    int cartItem=Integer.parseInt(request.getParameter("cartItem"));
    User user = userDao.getUserByEmail(StoreUser.getUser().getEmail());
    cartItem=user.getCartItem()-cartItem;
    userDao.updateCartItem(cartItem);

    String query="delete from cart_item where user_id=? and product_id=?";
    PreparedStatement st = con.prepareStatement(query);
    st.setString(1,id);
    st.setInt(2,pid);
    st.executeUpdate();
    response.sendRedirect("myCart.jsp?msg=removed");
}

catch(Exception e){
    System.out.println(e);
}
%>