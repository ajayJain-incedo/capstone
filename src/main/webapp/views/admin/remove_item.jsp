<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Index</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../resources/css/remove_item.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
    .container
    {
    width: 30%;
    margin:auto;
    padding: 20px;
    }
    </style>
</head>
<body>
<h2 style = "text-align: center"> <b><u> REMOVE ITEM PAGE </u></b></h2>
<div class = "container">
<form action = "../../RemoveItemServlet" method = "post" >
    <div style = "text-align: center" class="card">
    <div class="card-body">
        <h5 class="card-title">ENTER PRODUCT NAME</h5>
        <div class="mb-3 row">
            <div class="col-sm-19" >
                <input type="text"  name ="pname" placeholder ="Enter here" >
            </div>
        </div>
        <button type ="submit" class="btn btn-primary">CONFIRM</button>
    </div>
</div>
</form>
</div>


<h1 style = "text-align: center" ><u><b>ALL THE ITEMS IN THE DATABASE</b></u></h1>

<h5 id = "msg" class ="center-align"> </h5>
<%
try{

    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "root");
    statement = connection.createStatement();
    String QueryString = "Select pid, pname, pdesc, price, category, discount_percent, available_quantity, pid from product";
    rs = statement.executeQuery(QueryString);
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
        <td><button type="button" id ="<%=rs.getInt(8) %>"  class="delete btn btn-danger"  >REMOVE</button></td>
    </TR>
    <%
        } %>
    <%
    // close all the connections.
    rs.close();
    statement.close();
    connection.close();
    } catch (Exception ex) {
    %>
    </font>
    <font size="+3" color="red"></b>
        <%
        out.println("Unable to connect to database.");
        }
        %>
    </font>
</table>
<!--<TABLE>
    <TR>
        <TD><FORM ACTION="welcome_to_database_query.jsp" method="get" >
            <button type="submit"><-- back</button></FORM></TD>

    </TR>
</TABLE>-->
</font>

&nbsp;&nbsp;

<%--Javascripts--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
    console.log("page is ready...");
    $(".delete").click(function() {
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
    });
    });
</script>
</body>
</html>