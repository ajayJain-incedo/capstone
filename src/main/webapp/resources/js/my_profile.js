function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if ((charCode < 48 || charCode > 57))
            return false;

        return true;
    }
    function refresh() {
    console.log("refreshed");
            window .location.reload();
        }
    $(".btn-submit").click(function(){
          $("#msg").html("");
    })

    $(document).ready(function(){
        $(".btn-delete-account").click(function(){
            var f=$(this).serialize();
            if(confirm("Do you really want to delete your account?") == true){
                var uid = $(".btn-delete-account").attr("id");
                console.log(uid)
                $.ajax({
                url: "/Capstone/DeleteUser?id="+uid,
                data: f,
                type: "GET",
                success: function(data, textStatus, jqXHR){
                    if(data.trim() === "errorDeleteUser"){
                        $("#msg").css("color", "red");
                        $("#msg").html("Unable to delete account");
                    }
                    else {
                         window.location.href = '../../index.jsp';
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    $("#msg").css("color", "red");
                    $("#msg").html("Sorry! Something went wrong.......")

                }
            })
            }
        })


        $("#user-details-form").hide();
        $(".edit-icon").on("click", function(){
            $(".alert").hide();
            $(".user-info").hide();
            $("#user-details-form").show();
        })
        $("#user-details-form").on("submit", function(e){
        $("#msg").html("");
            if(confirm("Confirm the details") == false){
                e.preventDefault();
            }else{
            $("#msg").html("");
            e.preventDefault();
            var f=$(this).serialize();
            $(".loader").css('display', 'flex');

            $.ajax({
                url: "/Capstone/UpdateUserInfo",
                data: f,
                type: "POST",
                success: function(data, textStatus, jqXHR){
                    $(".loader").hide();
                    if(data.trim() === "updated successfully"){
                        $("#msg").css("color", "green");
                        $("#msg").html("Details updated successfully");
                            window.setInterval('refresh()', 1000);
                    }
                    else if(data.trim() === "error"){
                    $("#msg").css("color", "red");
                        $("#msg").html("Sorry! something went wrong..");
                    }
                    else if(data.trim() ==="emailAlreadyExist"){
                        $("#msg").css("color", "red");
                        $("#msg").html("This email is associated with a different account!");
                    }
                    else if(data.trim() ==="noChange"){
                        $("#msg").css("color", "green");
                         $("#msg").html("Nothing to update!");
                    }

                    else{
                    $("#msg").css("color", "red");
                    $("#msg").html("Sorry! something went wrong");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    $(".loader").hide();
                    $("#msg").css("color", "red");
                    $("#msg").html("Sorry! Something went wrong.......")

                }
            })
            }
        })
    })