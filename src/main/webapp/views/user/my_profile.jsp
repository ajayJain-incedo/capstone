<!doctype html>
<html lang="en">


<%@ page import="com.service.ConnectionProvider, com.dao.UserDao, com.service.VerifySession, com.service.StoreUser, com.model.User" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../../resources/css/header.css">
    <link rel="stylesheet" href="../../resources/css/color.css">
    <link rel="stylesheet" href="../../resources/css/my_profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>

</style>
<body class="light-bg-color">

<nav class="navbar navbar-expand-lg navbar-light blue-bg-color">
    <a class="navbar-brand inline-margin-start white-color" href="DisplayProduct">CapStone</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

<%@ include file="userHeaderNav.jsp" %>
</nav>
<br><br>
<%
if(VerifySession.verifySession(request, response)){
return;
}
String msg = request.getParameter("msg");
if(msg!=null){
if(msg.equals("errorDeleteUser")){

%>
<div class="text-center">

<p class="alert" style="color:red">Sorry! Something went wrong while deleting your account.</p>
</div>
<%} }%>
<main class="d-flex align-items-center">

    <div class="container">

        <div class="col-md-4 offset-md-4 ">
            <div class="card">
                <div class="card-header text-white card-header-color text-center">
                    <i class="fa fa-user-circle-o fa-2x "></i>
                    <p>My details</p>

                    <div class="loader" style="justify-content:center;display:none;">
                        <div class="d-flex align-items-center">
                            <strong>Loading...</strong>
                            <div class="spinner-border ml-auto" role="status" aria-hidden="true"></div>
                        </div>
                    </div>
                </div>
                <%

                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                Cookie[] cookies = request.getCookies();
                for(Cookie c: cookies){
                    if(c.getName().equals("userEmail")){
                        User user = dao.getUserByEmail(c.getValue());
                        StoreUser.storeUser(user);
                    }
                }

                   StoreUser store = new StoreUser();
                    User user = store.getUser();
                    int id =user.getId();
                    String firstName = user.getFirstName();
                    String lastName = user.getLastName();
                    String email = user.getEmail();
                    String address = user.getAddress();
                    String mobile = user.getMobile();
                %>
                <div class="card-body">
                    <div class="text-center"> <p id="msg" ></p></div>
                    <div class="user-info">
                    <div class="full-name inline-flex-my">
                        <p>Full Name: &nbsp;</p><p class="bold"><%=firstName %></p> &nbsp;<p class="bold"><%=lastName %></p>

                    </div>
                    <div class="show-email inline-flex-my">
                        <p>Email: &nbsp;</p><p class="bold"><%=email %></p>
                    </div>
                    <div class="show-mobile inline-flex-my">
                        <p>Mobile: &nbsp;</p><p class="bold"><%=mobile %></p>
                    </div>
                    <div class="show-mobile inline-flex-my">
                        <p>Address: &nbsp;</p><p class="bold"><%=address %></p>
                    </div>
                    <div class="edit-icon">
                       <button class="btn-edit"><i class="fa fa-edit fa-2x"></i></button>
                    </div>
                    </div>
                    <form method="post" id="user-details-form">
                        <div class="mb-3" >
                            <label for="first_name" class="form-label">First Name</label>
                            <input maxlength="15" autofocus name="first_name" required type="text" class="form-control" id="first_name" aria-describedby="emailHelp" value="<%=firstName %>">

                        </div>
                        <div class="mb-3" >
                            <label for="last_name" class="form-label">Last Name</label>
                            <input maxlength="15" autofocus name="last_name" required type="text" class="form-control" id="last_name" value="<%=lastName %>">

                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input name="email" required type="email" class="form-control" id="email" value="<%=email %>">
                        </div>
                        <div class="mb-3">
                            <label for="mobile" class="form-label">Mobile Number</label>
                            <input maxlength="10" minlength="10"  name="mobile" required type="text" class="form-control" id="mobile" value="<%=mobile %>" onkeypress="return isNumberKey(event)">
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Delivery Address</label>
                            <textarea minlength="5" maxlength="60"  name="address" required rows="2" class="form-control" id="address"><%=address %></textarea>
                        </div>
                        <div class="container text-center">
                            <span>
                                <button type="submit" class="btn btn-submit">Submit</button>
                            </span>
                        </div>
                        <div class="delete-account text-center mt-3" >
                            <a id="<%=id %>" class="btn-delete-account text-red " >delete my account</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="../../resources/js/my_profile.js"></script>
</body>
</html>