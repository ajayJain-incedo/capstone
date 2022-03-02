<!DOCTYPE html>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../resources/css/register.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <main class="clip-path background">
        <div class="container my-background clip" >
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header text-center card-header-background">
                        <span class="fa fa-2x fa-user-plus"></span>
                        <br>
                        <p>Register Here</p>
                    </div>
                    <div class="card-body">
                        <form action="../../RegisterServlet" method="POST" id="register-form">
                            <div class="mb-3">
                                <label for="first_name" class="form-label">First Name</label>
                                <input name="first_name" required type="text" class="form-control" id="first_name" aria-describedby="emailHelp" placeholder="Enter first name*">
                            </div>

                            <div class="mb-3">
                                <label for="last_name" class="form-label">Last Name</label>
                                <input name="last_name" required type="text" class="form-control" id="last_name" aria-describedby="emailHelp" placeholder="Enter last name*">
                            </div>

                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email address*">
                                <p id="failuremessage-email" style="color:red;"></p>
                            </div>

                            <div class="mb-3">
                                <label for="mobile" class="form-label">Mobile number</label>
                                <input maxlength="10" minlength="10" name="mobile" required type="text"  class="form-control" id="mobile" aria-describedby="emailHelp" placeholder="Enter mobile number*" onkeypress="return isNumberKey(event)">
                                <p id="failuremessage-mobile" style="color:red;"></p>
                            </div>

                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <textarea rows="3" minlength="10" name="address" required type="text" class="form-control" id="address" aria-describedby="emailHelp" placeholder="Enter address*"></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="password1" class="form-label">Set new password</label>
                                <input name="password1" minlength="8" required type="password" class="form-control" id="password1" placeholder="Enter new password*">
                            </div>

                            <div class="mb-3">
                                <label for="password2" class="form-label">Enter password again</label>
                                <input name="password2" minlength="8" required type="password" class="form-control" id="password2" placeholder="Re-enter your password*">
                                <p id="failuremessage-password" style="color:red;"></p>
                            </div>
                            <div class="text-center">
                            <button style="background-color:#34515e;" type="submit" class="btn btn-dark" id="submit-button">Submit</button>
                            <a style="background-color:#34515e;" href="../../index.jsp" class="btn btn-dark" id="login-button">Go to login</a>
                                <div class="loader mt-4" >
                                    <div class="d-flex align-items-center">
                                        <strong>Loading...</strong>
                                        <div class="spinner-border ml-auto" role="status" aria-hidden="true"></div>
                                    </div>
                                </div>
                                <p class="mt-3" id="failuremessage" style="color: red;"></p>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </main>
<%--Javascripts--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="../../resources/js/register.js"></script>
</body>
</html>