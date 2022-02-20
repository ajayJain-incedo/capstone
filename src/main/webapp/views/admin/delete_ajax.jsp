<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String id=request.getParameter("id");
try
{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "admin@1234");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("DELETE FROM product WHERE pid="+id);
    out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
    System.out.print(e);
    e.printStackTrace();
}
%>
