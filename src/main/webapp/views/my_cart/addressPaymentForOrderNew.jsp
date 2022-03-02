<!DOCTYPE html>
<%@ page import="com.service.ConnectionProvider" %>
<%@page import="java.sql.*,java.util.*, com.model.User, com.service.StoreUser, com.service.VerifySession"%>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html>
<link rel="stylesheet" href="../../resources/css/header.css">
<link rel="stylesheet" href="../../resources/css/color.css">
<link rel="stylesheet" href="../../resources/css/my_profile.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="../../resources/css/product.css">
<link rel="stylesheet" href="../../resources/css/color.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    .card-group-my{
        display: flex;
        justify-content: center;
        width: 85%;
        margin: 0px 7%;
        align-items:flex-start;
    }
    .card-my{
        background-color:white;
        margin:4% 6%;
        box-shadow: 2px 2px 13px;
        border-radius: 18px;
        min-height:61vh;
    }
    body{
        background-color: rgb(252 238 238) !important;
    }
    .color-blue{
        color:#0d6efd !important;
    }
    .user-details{
        font-weight:500;
    }
    .payment-methods{
        float:right;
    }
    .payment-methods-box{
        transition: .3s;
    }
    .payment-methods-box:hover{
        background-color:#e1f1ff;
       border-radius:6px;
        transform: scale(1.1,1.1);
    }
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-light blue-bg-color">
    <a class="navbar-brand inline-margin-start white-color" ><img style="width:5.5rem;" src="../../resources/static/images/icon.png"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

</nav>

<%
if(VerifySession.verifySession(request, response)){
return;
}
User user = StoreUser.getUser();

%>


<div class="card-group-my">
    <div class="card-my">
        <div class="card-body">
            <div class="text-center mb-4">
            <h5 class="card-title color-blue"><u><b>Customer Details</b></u></h5>
            </div>
            <p>First Name: <span class="user-details"><%=user.getFirstName()%> </span></p>
            <p>Last Name: <span class="user-details"><%=user.getLastName()%></span></p>
            <p>Mobile: <span class="user-details"><%=user.getMobile()%></span></p>
            <p>Email: <span class="user-details"><%=user.getEmail()%></span></p>
            <p> Address: <span class="user-details"><%=user.getAddress()%></span></p>


        </div>

    </div>
    
    <div class="card-my">
        <div class="card-body">
            <div class="text-center mb-4">
            <h5 class="card-title color-blue"><u><b>Payment Options</b></u></h5>
            </div>
            <p class="payment-methods-box"><a href="billMy.jsp" style = "text-decoration:none;">UPI:
            <img class="payment-methods" src = "../../resources/static/images/upi.png"  alt = "upi_image" width = "40" height = "50">  </a></p>
            <p class="payment-methods-box"><a href="billMy.jsp " style = "text-decoration:none;" > Credit Card:
                <img class="payment-methods" src = "../../resources/static/images/credit_card.png"  alt = "creditcard_image" width = "40" height = "50">  </a></p>
            <p class="payment-methods-box"><a href="billMy.jsp" style = "text-decoration:none;">Debit Card:
                <img class="payment-methods" src = "../../resources/static/images/debit_card.png"  alt = "debitcard_image" width = "40" height = "50">  </a></p>
            <p class="payment-methods-box"><a href="billMy.jsp" style = "text-decoration:none;" >COD:
                <img class="payment-methods" src = "../../resources/static/images/cash_on_delivery.png"  alt = "cashOnDelivery_image" width = "40" height = "50">  </a></p>
        </div>

    </div>
</div>




</body>
</html>