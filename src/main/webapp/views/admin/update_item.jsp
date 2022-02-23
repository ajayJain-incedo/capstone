<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@page import = "com.service.ConnectionProvider"%>
<%@ page import="com.service.VerifySession" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>EDIT PRODUCT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../resources/css/update_item.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/update_item.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
    .container
    {
    width: 30%;
    margin:auto;
    padding: 20px;
    }
    body
    {
    background-color: #78909C !important;
    }
    </style>
</head>
<body>
<%
if(VerifySession.verifySessionForAdmin(request, response)){
return;
}
%>
<%@ include file= "AdminHeader.jsp" %>



<h1 style = "text-align: center" ><u><b>ALL THE ITEMS IN THE DATABASE</b></u></h1>

<h5 id = "msg" class ="center-align"> </h5>
<%
int start =0, recordCount = 3;
int total = 0;
try{
    int pgno = request.getParameter("pgno")==null ?0: Integer.parseInt(request.getParameter("pgno"));
    start = pgno * recordCount;
    Connection con = ConnectionProvider.getConnection();
    String QueryString = "Select pid, pname, pdesc, price, category, discount_percent, available_quantity, pid, pid from product limit ?,?";
    PreparedStatement statement = con.prepareStatement(QueryString);
    statement.setInt(1, start);
    statement.setInt(2,recordCount);
    ResultSet rs = statement.executeQuery();
%>
<table align="center" cellpadding="15" style="background-color: white; text-align: center; border-radius: 15px; border:none;
  border-collapse: collapse;"  >
    <tr>
        <th>
            Product ID
        </th>
        <th>
            Product Name
        </th>
        <th>
            Description
        </th>
        <th>
            Price
        </th>
        <th>
            Category
        </th>
        <th>
            Discount %
        </th>
        <th>
            Available Quantity
        </th>
        <th>
            UPDATE
        </th>
        <th>
            REMOVE
        </th>


    </tr>
    <%
    while (rs.next()) {
    %>
    <TR>
        <TD><%=rs.getInt(1)%></TD>
        <TD><%=rs.getString(2)%></TD>
        <TD><%=rs.getString(3)%></TD>
        <TD><%=rs.getDouble(4)%></TD>
        <TD><%=rs.getString(5)%></TD>
        <TD><%=rs.getDouble(6)%></TD>
        <TD><%=rs.getInt(7)%></TD>
<!--        <td><button type="button"  class=" btn btn-dark"  >-->
<!--            <a href="update.jsp?id=<%=rs.getString(8)%>" style= "text-decoration:none" >UPDATE</a></button></td>-->
        <td><a href="update.jsp?id=<%=rs.getInt(8)%>" class="btn btn-dark">UPDATE</a></td>
        <td><button type="button" id ="<%=rs.getInt(9)%>"  class="delete btn btn-danger"  >REMOVE</button></td>
    </TR>
    <% }
        String sql1 = " select count(*) from product";
        PreparedStatement smt2 = con.prepareStatement(sql1);
        ResultSet rs2 = smt2.executeQuery();
        if(rs2.next())
    {
        total = rs2.getInt(1);
    }
    // close all the connections.
    statement.close();
    } catch (Exception ex)
        {
        ex.printStackTrace();
        out.println("Unable to connect to database.(update_item.jsp)");
        }
        %>

    <tr>
        <th colspan = "9">
            <table width = "100%">
                <tr>
            total records: <%= total%>
            <% for (int i =0; i<=total/recordCount; i++) {%>
            <td><a href= "update_item.jsp?pgno=<%=i%>" class = "btn btn-dark "> Page<%=i+1%> </a></td>
            <%}%>
                </tr>
            </table>
        </th>
    </tr>
</table>
&nbsp;&nbsp;

<%--Javascripts--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
    console.log("page is ready...");
    $(".delete").click(function() {
    let text = "Are you sure you want to delete the item? \n Either OK or Cancel.";
  if (confirm(text) == false) {
    text = "You pressed cancelled!";
    console.log(text);
  } else {
    text = "You pressed okay!";
    console.log(text);

    var id = +this.id;
    $.ajax({
    url: "delete_ajax.jsp",
    type: "post",
    data: {
    id : id,
    },
        success : function(data){
        location.reload();
    }
    });
    }
    });
    });
</script>
</body>
</html>