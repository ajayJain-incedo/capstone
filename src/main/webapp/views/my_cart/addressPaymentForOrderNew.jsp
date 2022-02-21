<!DOCTYPE html>
<%@ page import="com.service.ConnectionProvider" %>
<%@page import="java.sql.*,java.util.*, com.model.User, com.service.StoreUser"%>

<html>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body style = "background-color: #78909C;">
<br>
<br>
<%
    Connection con = ConnectionProvider.getConnection();
    StoreUser store = new StoreUser();
    User user = store.getUser();

%>

<div class="card-group">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"><u><b>USER DETAILS</b></u></h5>
            <p>First Name: <%=user.getFirstName()%> </p>
            <p>Last Name: <%=user.getLastName()%></p>
            <p>Mobile: <%=user.getMobile()%></p>
            <p>Email: <%=user.getEmail()%></p>
            <p> Address: <%=user.getAddress()%></p>

        </div>

    </div>
    
    <div class="card">
        <div class="card-body">
            <h5 class="card-title"><u><b>PAYMENT DETAILS</b></u></h5>
            <p><a href="PaymentSuccesfull.jsp" style = "text-decoration:none;">UPI: &nbsp;
            <img src = "../../resources/static/images/upi.png"  alt = "upi_image" width = "40" height = "50">  </a></p>
            <p><a href="PaymentSuccesfull.jsp " style = "text-decoration:none;" > Credit Card: &nbsp;
                <img src = "../../resources/static/images/credit_card.png"  alt = "creditcard_image" width = "40" height = "50">  </a></p>
            <p><a href="PaymentSuccesfull.jsp" style = "text-decoration:none;">Debit Card: &nbsp;
                <img src = "../../resources/static/images/debit_card.jpg"  alt = "debitcard_image" width = "40" height = "50">  </a></p>
            <p><a href="PaymentSuccesfull.jsp" style = "text-decoration:none;" >Cash On Delivery: &nbsp;
                <img src = "../../resources/static/images/cash_on_delivery.jpg"  alt = "cashOnDelivery_image" width = "40" height = "50">  </a></p>
        </div>

    </div>
</div>




</body>
</html>