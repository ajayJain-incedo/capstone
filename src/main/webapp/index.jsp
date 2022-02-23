<%@ page errorPage="../error_pages/error_page1.jsp" %>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="resources/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
    <%
    Cookie[] cookies = request.getCookies();
    Character userType;
    if(cookies!=null){
        for(Cookie c: cookies){
            String cookieName = c.getName();
            if(cookieName.equals("userType")){
                userType=c.getValue().charAt(0);
                if(userType=='A'){
                    response.sendRedirect("views/admin/admin_welcome_page.jsp");
                }else if(userType == 'C'){
                    response.sendRedirect("DisplayProduct");
                }

            }
        }
    }
    %>

    <main class="d-flex align-items-center my-background clip" style="height: 85vh; ">

        <div class="container" style="width: 35%;">

                <div class="col-md-4 offset-md-4 lc">
                    <div class="card">
                        <div class="card-header text-center card-header-background{">
                            <i class="	fa fa-user-circle-o fa-2x "></i>
                            <p>Login Here</p>
                            <p id="failuremessage" style="color: red;"></p>
                            <div class="loader" >

                                <div class="d-flex align-items-center">
                                    <strong>Loading...</strong>
                                    <div class="spinner-border ml-auto" role="status" aria-hidden="true"></div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form action="LoginServlet" method="post" id="loginform">
                              <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="example@gmail.com">

                              </div>
                              <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input name="password" required type="password" class="form-control" id="exampleInputPassword1" >
                              </div>
                              <div class="mb-3 ">
                                <a class="forget-password " href="views/register/forgot_password.jsp">Forgot Password?</a> <span ><a class="register" href="views/register/register.jsp">Sign Up </a></span>

                              </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-dark" style="background-color:#34515e;">Submit</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

        </div>
    </main>



<%--Javascripts--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script>
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
                            window.location.href = 'views/admin/admin_welcome_page.jsp';
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
</script>
</body>
</html>
