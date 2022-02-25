$(document).ready(function(){
        $(".loader").hide();

       $("#email-form").on("submit", function(e){
        $("#message").html("");
            $(".loader").show();
            e.preventDefault();
            var f=$(this).serialize();
            $.ajax({
                url: "/Capstone/ForgotPassword",
                data: f,
                type: "POST",
                success: function(data, textStatus, jqXHR){

                    if(data.trim()==="done"){
                    $(".loader").hide();

                            $("#message").css("color", "green");
                            $("#submit-btn").hide();
                        $("#message").html("Otp sent successfully enter otp on next page");
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