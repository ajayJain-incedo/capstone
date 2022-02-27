<!doctype html>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/header.css">
    <title>CapStone</title>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light blue-bg-color white-border">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-center" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class=" hvr nav-item nav-link  white-color" href="DisplayProduct">Top Deals </a>
            <a class="hvr nav-item nav-link  white-color" href="CategoryProduct?category=Mobiles">Mobiles</a>
            <a class="hvr nav-item nav-link  white-color" href="CategoryProduct?category=Electronics">Electronics</a>
            <a class="hvr nav-item nav-link  white-color" href="CategoryProduct?category=Appliances">Appliances</a>
            <a class="hvr nav-item nav-link  white-color" href="CategoryProduct?category=Home">Home</a>
            <a class="hvr nav-item nav-link  white-color" href="CategoryProduct?category=Fashion">Fashion</a>
            <a class="hvr nav-item nav-link  white-color" href="CategoryProduct?category=Kids">Kids</a>
            <a class="hvr nav-item nav-link  white-color" href="CategoryProduct?category=Health&Beauty">Health & Beauty</a>
            <a class="hvr nav-item nav-link  white-color" href="CategoryProduct?category=Books">Books</a>
            <a class="hvr nav-item nav-link  white-color" href="CategoryProduct?category=Sports">Sports</a>
<!--            <a class="hvr nav-item nav-link  white-color" href="DisplayProduct">More</a>-->
        </div>
    </div>
</nav>
</body>
</html>