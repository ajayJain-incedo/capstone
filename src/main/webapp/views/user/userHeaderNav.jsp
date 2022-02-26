<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="/resources/css/color.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Document</title>
</head>
<body>
<ul class=" navbar-nav mr-auto inline-list-padding">
    <li class="nav-item d-flex align-items-center text-white mr-16">
        <a class="white-color nav-link hover-oscillate" href="views/user/my_profile.jsp">My Profile</a>
        <i class="fa fa-user-circle-o icon"></i>
    </li>
    <li class="nav-item d-flex align-items-center text-white mr-16">
        <a class="white-color nav-link hover-oscillate" href="views/my_cart/myCart.jsp">Go to Cart</a>
        <i class=" fa fa-shopping-cart icon"></i>
    </li>
    <li class="nav-item d-flex align-items-center text-white mr-16">
        <a class="white-color nav-link hover-oscillate" href="/Capstone/Logout">Logout</a>
        <i class="fa fa-sign-out icon"></i>
    </li>
</ul>
</body>
</html>

