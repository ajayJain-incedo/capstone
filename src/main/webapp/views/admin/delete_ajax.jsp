<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*, com.service.ConnectionProvider " %>

<%
    String id=request.getParameter("id");
try
{

    Connection conn = ConnectionProvider.getConnection();
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
