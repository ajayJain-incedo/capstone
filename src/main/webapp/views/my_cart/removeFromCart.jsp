<%@page import="com.service.ConnectionProvider"%>
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
System.out.println("product id is "+pid);
System.out.println("id is" + id);
double total=0;
int quantity=0;
int final_total=0;

try
{
    Connection con = ConnectionProvider.getConnection();
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