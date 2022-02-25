  $(".loader").hide();
        $("#password2").keyup(function(){
            $("#redirect-message").html("");
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
       $(".loader").show();
             $("#failure-message").html("")
            e.preventDefault();
            var f=$(this).serialize();
            $.ajax({
                url: "/Capstone/VerifyOtp",
                data: f,
                type: "POST",
                success: function(data, textStatus, jqXHR){

                    if(data.trim()==="done"){
                    $(".loader").hide();
                    $("#label").html("Reset Password");
                         $("#otp-form").css("display", "none");
                        $("#password-form").css("display", "block");

                    }
                    else{
                    $(".loader").hide();
                        $("#failure-message").html("Otp entered is wrong!");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    $(".loader").hide();
                    $("#failure-message").html("Sorry! Something went wrong.");

                }
            })
       })
      $("#password-form").on("submit", function(e){
      $(".loader").show();
      console.log("form submitted")
             $("#failure-message2").html("")
            e.preventDefault();
            var f=$(this).serialize();
            $.ajax({
                url: "/Capstone/ResetPassword",
                data: f,
                type: "POST",
                success: function(data, textStatus, jqXHR){
                $(".loader").hide();
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
                $(".loader").hide();
                    $("#failure-message2").html("Sorry! Something went wrong.")

                }
            })
       })
    })