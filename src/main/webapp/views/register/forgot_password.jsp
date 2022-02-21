<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Password Reset</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../resources/css/forgot_password.css" rel="stylesheet">
</head>
<body>
<main class="my-background clip" style="height: 100vh;">
    <div class="container my-background clip">
        <div class="col-md-6 offset-md-3 p-5">
        <form action="/capstone/ForgotPassword" method="post">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Enter your email:</label>
            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="example@email.com">
        </div>
            <div class="text-center">

        <button type="submit" class="btn btn-dark">Submit</button>
            </div>
        </form>
        </div>
    </div>
</main>
</body>
</html>