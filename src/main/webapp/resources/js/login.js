$(document).ready(function(){
        $("#loginform").on("submit", function(e){
            $("#failuremessage").html("");
            e.preventDefault();
            var f=$(this).serialize();
            $(".loader").css('display', 'flex');
            $(".loader").show();
            $.ajax({
                url: "LoginServlet",
                data: f,
                type: "POST",
                success: function(data, textStatus, jqXHR){
                    $(".loader").hide();
                    if(data.trim() === "Invalid details, try again."){
                        $("#failuremessage").html("Invalid credentials, try again...");
                    }else{
                        if(data.trim() === "customer"){
                            window.location.href = 'DisplayProduct';
                        }else{
                            window.location.href = 'views/admin/update_item.jsp';
                        }
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    $(".loader").hide();
                    $("#failuremessage").html("Sorry! Something went wrong.")

                }
            })
        })

    })