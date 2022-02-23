<!doctype html>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Verify Email</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../resources/css/forgot_password.css" rel="stylesheet">
</head>
<body>
<main class="my-background clip" style="height: 100vh;">
    <div class="container">
        <div class="col-md-6 offset-md-3 p-5">
            <div class="card">
                <div class="card-header text-center card-header-background" >
                    <span class="fa fa-3x fa-user-plus"></span>
                    <br>
                    <p id="label">Verify your email</p>
                    <div class="loader" >
                        <div class="d-flex align-items-center ">
                            <strong>Loading...</strong>
                            <div class="spinner-border ml-auto" role="status" aria-hidden="true"></div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
        <form action="/capstone/ForgotPassword" method="post" id="email-form">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Enter your email:</label>
            <input required name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="example@email.com">
        </div>
            <div class="text-center">

        <button type="submit" class="btn btn-dark" style="background-color:#34515e;">Submit</button>
                <p id="message"style="margin-top:15px"></p>
            </div>
        </form>
                    </div>
                </div>
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function(){
        $(".loader").hide();
        $("#message").html("");
       $("#email-form").on("submit", function(e){
            $(".loader").show();
            e.preventDefault();
            var f=$(this).serialize();
            $.ajax({
                url: "/capstone/ForgotPassword",
                data: f,
                type: "POST",
                success: function(data, textStatus, jqXHR){

                    if(data.trim()==="done"){
                    $(".loader").hide();

                            $("#message").css("color", "green");
                        $("#message").html("Otp sent successfully enter otp on next page")
                        setTimeout(function(){
                            window.location.href = 'reset_password.jsp';
                        }, 2000);

                    }else if(data.trim()==="invalid user"){
                    $(".loader").hide();
                    $("#message").css("color", "red");
                    $("#message").html("This email id is not registered, please sign up.");}
                    else{
                    $(".loader").hide();
                    $("#message").css("color", "red");
                        $("#message").html("Sorry! Something went wrong.");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                $(".loader").hide();
                    $("#message").css("color", "red");
                    $("#message").html("Sorry! Something went wrong.");

                }
            })
       })
       })
</script>
</body>
</html>