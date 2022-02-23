<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import = "com.dao.ProductDao"%>
<%@page import = "com.model.Product "%>
<%@page import = "com.service.ConnectionProvider"%>
<%@ page import="com.service.VerifySession" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>

<html xmlns="http://www.w3.org/1999/html">
<title>UPDATE ITEM DETAILS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
    .container
    {
    width: 30%;
    margin:auto;
    padding: 20px;
    }
    </style>
<%
        String id = request.getParameter("id");
        String pname = request.getParameter("pname");
        if(id == null)
        {
            ProductDao pd = new ProductDao(ConnectionProvider.getConnection());
            Product p = pd.getProductDetailByName(pname);
            if(p == null)
            {
                out.println("<h1>ITEM DOESN'T EXIST IN THE DATABASE!!</h1>");
                return;
            }
%>
<body>
<%
if(VerifySession.verifySessionForAdmin(request, response)){
return;
}
%>
<div class = "container">
    <div class="card" style = "text-align: center">
        <div class="card-body">
            <h5 class="card-title"><u>UPDATE PRODUCT DETAILS</u></h5>
            <form  action="../../UpdateItemServlet" method="post">
                <input type="hidden" name="id" value="<%=p.getId() %>">
                Product Name:
                <p> <input type="text" name="pname" value="<%=p.getPname() %>"></p>
                Product Description:
                <textarea type = "text" name="pdesc" value="<%=p.getPdesc() %>"   class="form-control" rows="2"><%=p.getPdesc() %> </textarea>

                Price:
                <p><input type="number" name="price" value="<%=p.getPrice() %>"></p>
                Category:
                <p><input readonly type="text" name="category" value="<%=p.getCategory() %>"></p>

                Discount Percentage:
                <p><input type="number" name="discount_percent" value="<%=p.getDiscount_percent() %>" min="0" max="100"></p>

                Available Quantity:
                <p><input type="number" name="available_quantity" value="<%=p.getAvailable_quantity() %>"></p>

                <button type="submit" value="DETAILS" class = "btn btn-primary">SUBMIT</button>
            </form>
        </div>
    </div>
</div>
</body>

        <%
        }
        else
        {
        try
        {
        Connection connection = ConnectionProvider.getConnection();
        Statement statement=connection.createStatement();
        String sql ="Select pid, pname, pdesc, price, category, discount_percent, available_quantity from product where pid="+id;
        ResultSet rs = statement.executeQuery(sql);
        while(rs.next())
        {
%>

<body>

<div class = "container">
<div class="card" style = "text-align: center">
    <div class="card-body">
        <h5 class="card-title"><u>UPDATE PRODUCT DETAILS</u></h5>
        <form  action="../../UpdateItemServlet" method="post">
            <input type="hidden" name="id" value="<%=rs.getString(1) %>">
<!--            <input type="text" name="id" value="<%=rs.getString(1) %>">-->
<!--            &nbsp;&nbsp;-->
            Product Name:
            <p> <input type="text" name="pname" value="<%=rs.getString(2) %>"></p>
            Product Description:
            <textarea type = "text" name="pdesc" value="<%=rs.getString(3) %>"   class="form-control" rows="2"><%=rs.getString(3) %> </textarea>

            Price:
            <p><input type="number" name="price" value="<%=rs.getString(4) %>"></p>
            Category:
            <p><input readonly type="text" name="category" placeholder="<%=rs.getString(5) %>"></p>

            Discount Percentage:
            <p><input type="number" name="discount_percent" value="<%=rs.getString(6) %>" min="0" max="100"></p>

            Available Quantity:
            <p><input type="number" name="available_quantity" value="<%=rs.getString(7) %>"></p>

            <button type="submit" value="DETAILS" class = "btn btn-primary">SUBMIT</button>
        </form>
    </div>
</div>
</div>
<%
    }
    //connection.close();
    } catch (Exception e)
    {
    e.printStackTrace();
    out.println("Unable to connect to database.(update.jsp)");
    }
}
%>
</body>
</html>