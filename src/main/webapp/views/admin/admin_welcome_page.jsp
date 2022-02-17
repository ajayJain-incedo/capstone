<html>
<head>
    <title>ADMIN PAGE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../resources/css/admin_welcome_page.css" rel="stylesheet">
</head>
<body>
<h2> <b><u>WELCOME TO THE ADMIN PAGE</u></b></h2>
<div class="card-group" >
    <div class="card " style = "width: 18rem;" >
        <img class="card-img-top" src="../../resources/static/images/add_item_img.jpg" class="img-fluid" alt="Add Item image cap">
        <div class="card-body">
            <h5 class="card-title">ADD ITEM TO THE INVENTORY</h5>
            <a href="add_item.jsp" class="btn btn-success">ADD ITEM</a>
        </div>
    </div>
    <div class="card " style = "width: 18rem;"><br>
        <img class="card-img-top" src="../../resources/static/images/update_item_img.jpg" alt="Update Card image cap">
        <div class="card-body"><br>
            <h5 class="card-title">UPDATE ITEM TO THE INVENTORY</h5>
            <a href="update_item.jsp" class="btn btn-info">UPDATE ITEM</a>
        </div>
    </div>
    <div class="card " style = "width: 18rem;"><br><br><br>
        <img class="card-img-top" src="../../resources/static/images/remove_item_img.jpg" alt="Remove Card image cap">
        <div class="card-body"><br><br><br>
            <h5 class="card-title">REMOVE ITEM FROM THE INVENTORY</h5>
            <a href="remove_item.jsp" class="btn btn-danger">REMOVE ITEM</a>
        </div>
    </div>
</div>
<div>
    &nbsp;&nbsp;&nbsp;&nbsp;
</div>
<div class = "col text-center">
<a href="../../index.jsp" class="btn btn-warning" >LOG OUT</a>
</div>
</body>
</html>