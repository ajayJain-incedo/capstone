<!doctype html>
<%@ page import="com.service.VerifySession" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<%@ page import="com.dao.UserDao, com.model.User, com.service.StoreUser" %>
<%@ page import="java.util.*" %>

<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/user.css">
    <title>Capstone</title>
</head>
<body>
<%
if(VerifySession.verifySession(request, response)){
return;
}%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style = "height: 10vh;">
    <a class="navbar-brand inline-margin-start" href="update_item.jsp">ICON</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-around inline-margin" id="navbarSupportedContent">
        <form class="form-inline my-2 my-lg-0 inline-list" action="/Capstone/SearchAdmin" method="post">
            <div class = "d-flex">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="pname">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </div>
        </form>
    </div>
    <nav class="navbar navbar-light bg-light">
        <form class="form-inline" >
            <a href="add_item.jsp" class="btn btn-success">ADD ITEM</a>
            <a href="/Capstone/Logout" class="btn btn-warning">LOG OUT</a>
        </form>
    </nav>

</nav>
</body>
</html>