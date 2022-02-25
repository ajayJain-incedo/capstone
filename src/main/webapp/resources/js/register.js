 function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if ((charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    $(document).ready(function(){

       $("#register-form").on("submit", function(e){
             $("#failuremessage").html("")
             $("#failuremessage-mobile").html("");
             $("#failuremessage-email").html("");
             $("#failuremessage-password").html("");
            e.preventDefault();
            var f=$(this).serialize();
            $(".loader").css("display", "flex");
            $.ajax({
                url: "../../RegisterServlet",
                data: f,
                type: "POST",
                success: function(data, textStatus, jqXHR){
                    $(".loader").css("display", "none");
                    if(data.trim()==="done"){
                    $("#submit-button").hide();
                    $("#login-button").hide();
                    var mob=$("#mobile").val();
                        $("#failuremessage").css("color", "green");
                        $("#failuremessage").html("Successfully Registered, Redirecting to login page in ");
                        var seconds=5;
                        setInterval(function() {
                            $("#failuremessage").html("Successfully Registered, Redirecting to login page in "+seconds);
                            seconds-=1;
                        }, 1000);

                        setTimeout(function(){
                            window.location.href = '../../index.jsp';
                        }, 5000);

                    }else if(data.trim()==="mobileError"){
                         $("#failuremessage-mobile").html("Please enter correct mobile number!");
                    }else if(data.trim()==="emailDuplicate"){
                        $("#failuremessage-email").html("Email already exist!");
                    }else if(data.trim()==="passwordNotMatching"){
                        $("#failuremessage-password").html("Passwords not matching!");
                    }else if(data.trim()==="tooLong"){
                        $("#failuremessage").html("Maximum character limit exceeded!");
                    }
                    else{
                        $("#failuremessage").html("Sorry, something went wrong");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    $(".loader").css("display", "none");
                    $("#failuremessage").html("Sorry! Something went wrong.")

                }
            })
       })
    })