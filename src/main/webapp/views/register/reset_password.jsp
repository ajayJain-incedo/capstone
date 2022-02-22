<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<main class="clip-path background" style="padding: 60px 0px;">
    <div class="container my-background clip" style="z-index:88;">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header text-center">
                    <span class="fa fa-3x fa-user-plus"></span>
                    <br>
                    <p id="label">Otp has been sent to your email!</p>

                </div>
                <div class="card-body">
                    <form method="post" id="otp-form">
                        <div class="mb-3">
                            <label for="otp" class="form-label" >Enter Otp</label>
                            <input  type="number" required class="form-control" id="otp" aria-describedby="emailHelp" name="otp">
                            <p id="failure-message" style="color:red;"></p>
                            <div class="text-center">

                            <button type="submit" class="btn btn-dark">Verify Otp</button>
                            </div>
                        </div>

                    </form>
                    <form method="post" style="display:none" id="password-form">
                        <div class="mb-3">
                            <label for="password1" class="form-label">Type a new password</label>
                            <input type="password" class="form-control" id="password1" name="password1">
                        </div>

                        <div class="mb-3">
                            <label for="password2" class="form-label">Re-type your password</label>
                            <input type="password" class="form-control"  id="password2" name="password2">
                            <p id="match-password"></p>
                        </div>
                        <div class="text-center">
                        <button type="submit" class="btn btn-dark">Submit</button>
                            <p id="redirect-message"></p>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</main>
<%--Javascript--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
        $("#password2").keyup(function(){

            if($("#password1").val() === $("#password2").val()){
                $("#match-password").html("");
                }else{
                $("#match-password").css("color", "red")
                $("#match-password").html("password not matching");
                }
        });
$(document).ready(function(){
        $("#redirect-message").html("")
       $("#otp-form").on("submit", function(e){
             $("#failure-message").html("")
            e.preventDefault();
            var f=$(this).serialize();
            $.ajax({
                url: "/capstone/VerifyOtp",
                data: f,
                type: "POST",
                success: function(data, textStatus, jqXHR){

                    if(data.trim()==="done"){
                    $("#label").html("Reset Password");
                         $("#otp-form").css("display", "none");
                        $("#password-form").css("display", "block");

                    }
                    else{
                        $("#failure-message").html("Otp entered is wrong!");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){

                    $("#failure-message").html("Sorry! Something went wrong.");

                }
            })
       })
      $("#password-form").on("submit", function(e){
      console.log("form submitted")
             $("#failure-message2").html("")
            e.preventDefault();
            var f=$(this).serialize();
            $.ajax({
                url: "/capstone/ResetPassword",
                data: f,
                type: "POST",
                success: function(data, textStatus, jqXHR){
                    if(data.trim()==="done"){
                    $("#redirect-message").css("color", "green");
                        $("#redirect-message").html("Password Reset Successfully redirecting to login page in ")
                        var seconds=5;
                        setInterval(function() {
                            $("#redirect-message").html("Password Reset Successfully redirecting to login page in "+seconds);
                            seconds-=1;
                        }, 1000);

                        setTimeout(function(){
                            window.location.href = '../../index.jsp';
                        }, 5000);
                    }
                    else if(data.trim()==="wrong password"){
                    $("#redirect-message").css("color", "red");
                        $("#redirect-message").html("Please enter same password in both fields!");
                    }else if("sqlerror"){
                        $("#redirect-message").html("Sql error");
                        console.log("YOYOYO")
                    }
                    else{
                    $("#redirect-message").css("color", "red");
                        $("#redirect-message").html("Something went wrong");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    $("#failure-message2").html("Sorry! Something went wrong.")

                }
            })
       })
    })
</script>

</body>
</html>