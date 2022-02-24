<!doctype html>
<%@ page import="com.service.VerifySession" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<%@ page import="com.dao.UserDao, com.model.User, com.service.StoreUser" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/user.css">
    <title>Capstone</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

</head>
<body>
<%
if(VerifySession.verifySession(request, response)){
return;
}%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand inline-margin-start" href="DisplayProduct">Capstone</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-around inline-margin" id="navbarSupportedContent">
        <form class="form-inline my-2 my-lg-0 inline-list" action="SearchProduct" method="post">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="pname">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
    <% StoreUser store= new StoreUser();
        User user = store.getUser();
        System.out.println(user.getId());
        char type=user.getUserType();
        System.out.println(type);

    pageContext.setAttribute("type", type);
    %>

       <%@ include file="user/userHeaderNav.jsp" %>



</nav>
</body>
</html>