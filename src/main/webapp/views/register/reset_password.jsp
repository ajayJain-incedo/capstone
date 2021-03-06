<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../resources/css/reset_password.css" rel="stylesheet">
</head>
<body>
<main class="clip my-background" style="padding: 60px 0px; height: 80vh;">
    <div class="container">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header text-center card-header-background">
                    <span class="fa fa-3x fa-user-plus"></span>
                    <br>
                    <p id="label">Otp has been sent to your email!</p>
                    <div class="loader" >
                        <div class="d-flex align-items-center ">
                            <strong>Loading...</strong>
                            <div class="spinner-border ml-auto" role="status" aria-hidden="true"></div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <form method="post" id="otp-form">
                        <div class="mb-3">
                            <label for="otp" class="form-label" >Enter Otp</label>
                            <input autofocus type="number" required class="form-control" id="otp" aria-describedby="emailHelp" name="otp">
                            <p id="failure-message" style="color:red;"></p>
                            <div class="text-center">

                            <button type="submit" class="btn btn-dark" style="background-color:#34515e;">Verify Otp</button>
                            </div>
                        </div>

                    </form>
                    <form method="post" style="display:none" id="password-form">
                        <div class="mb-3">
                            <label for="password1" class="form-label">Type a new password</label>
                            <input required minlength="8" type="password" class="form-control" id="password1" name="password1">
                        </div>

                        <div class="mb-3">
                            <label for="password2" class="form-label">Re-type your password</label>
                            <input required minlength="8" type="password" class="form-control"  id="password2" name="password2">
                            <p id="match-password"></p>
                        </div>
                        <div class="text-center">
                        <button type="submit" class="btn btn-dark" style="background-color:#34515e;">Submit</button>
                            <p id="redirect-message" style="margin-top:3px;"></p>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</main>
<%--Javascript--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="../../resources/js/reset_password.js"></script>

</body>
</html>