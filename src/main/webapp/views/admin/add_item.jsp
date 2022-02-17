<html>
<head>
    <title>Add Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../resources/css/add_item.css" rel="stylesheet">
    <style>
    .container
    {
    width: 30%;
    margin:auto;
    padding: 20px;
    }
    </style>
</head>
<body>
<h2 style = "text-align: center"> <b><u> ADD ITEM PAGE </u></b></h2>
<div class = "container">
    <form action = "../../AddItemServlet" method = "post">
        <div class="card w-150">
        <div class="card text-center">
            <div class="card-header">DETAILS
            </div>
            <div class="card-body">
                <table>
                    <tr>
                        <td>Enter Product Name:</td>
                        <td><Input type = "text" name ="pname" placeholder ="Enter here" required/></td>
                    </tr>
                    <tr>
                        <td>Enter Description:</td>
                        <td><Input type = "text" name ="pdesc" placeholder ="Enter here" /></td>
                    </tr>
                    <tr>
                        <td>Enter Price:</td>
                        <td><Input type = "number" name ="price" placeholder ="Enter here"/></td>
                    </tr>

                    <tr>
                        <td>Enter Category:</td>
                        <td><Input type = "text" name ="category" placeholder ="Enter here"/></td>
                    </tr>
                    <tr>
                        <td>Enter Discount Percent:</td>
                        <td><Input type = "number" name ="discount_percent" placeholder ="Enter here" min="0" max="100" /></td>
                    </tr>

                    <tr>
                        <td>Enter Quantity:</td>
                        <td><Input type = "number" name ="available_quantity" placeholder ="Enter here"/></td>
                    </tr>
                    <!--<tr>
                        <td>Enter Image:</td>
                        <td><Input type = "image" name ="pimage" /></td>
                    </tr>-->
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <button type= "submit" class="btn btn-success">SUBMIT</button>
                            <button type = "reset" class = "btn btn-warning"> Reset </button>
                        </td>

                    </tr>
                </table>
            </div>
        </div>
        </div>
    </form>
</div>
</body>
</html>
