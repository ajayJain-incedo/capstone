<!doctype html>
<%@ page import="com.service.VerifySession" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/color.css">
    <title>Document</title>
</head>
<body>
<%
if(VerifySession.verifySessionForAdmin(request, response)){
return;
}
%>
<ul class=" navbar-nav mr-auto inline-list-padding">
    <li class="nav-item">
        <a href="add_item.jsp" class="white-color nav-link">ADD ITEM</a>
    </li>
    <li class="nav-item">
        <a href="/Capstone/Logout" class="white-color nav-link">Logout</a>
    </li>
</ul>

</body>
</html>
