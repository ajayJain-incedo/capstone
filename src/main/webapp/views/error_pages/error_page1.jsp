<!doctype html>
<%@page isErrorPage="true" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sorry! something went wrong</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container text-center">
    <img class="img-fluid" src="../../resources/static/images/dizzy-robot.png" alt="Error Image" style="width: 40%;">
    <h3 class="display-3">Sorry! Something went wrong..</h3>
    <p> <%= exception %> </p>
    <a href="/Capstone/index.jsp" class="btn btn-lg mt-2 btn-dark">Go to home</a>
</div>

</body>
</html>