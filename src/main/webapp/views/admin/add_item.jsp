<%@ page import="com.service.VerifySession" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html>
<head>
    <title>Add Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../../resources/css/add_item.css" rel="stylesheet">
    <link href="../../resources/css/user.css" rel="stylesheet">
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
<%
if(VerifySession.verifySessionForAdmin(request, response)){
return;
}
%>
<a href="update_item.jsp">
    <img style="height: 40px; width: 40px" border="0" alt="HomePage Icon" src="../../resources/static/images/admin_home_page.jpg" width="100" height="100">
</a>
<h2 style = "text-align: center"> <b><u> ADD ITEM PAGE </u></b></h2>
<div class = "container d-flex inline-padding">
    <form action = "../../AddItemServlet" method = "post" name = "form" id = "form" enctype = "multipart/form-data">
        <div class="card">
        <div class="card text-center">
            <div class="card-header">DETAILS
            </div>
            <div class="card-body">
                <table>
                    <tr>
                        <td>Enter Product Name:</td>
                        <td><Input type = "text" name ="pname" placeholder ="Enter here" id = "pname" required></td>
                    </tr>
                    <tr>
                        <td>Enter Description:</td>
                        <td><textarea type = "text" name ="pdesc" placeholder ="Enter here" rows="2" id = "pdesc" required></textarea></td>
                    </tr>
                    <tr>
                        <td>Enter Price:</td>
                        <td><Input type = "number" name ="price" placeholder ="Enter here" id = "price" value ="0" required></td>
                    </tr>

                    <tr>
                        <td>Enter Category:</td>
                        <td><select name = "category" >
                                <option value = "Mobiles"> Mobiles</option>
                                <option value = "Electronics"> Electronics</option>
                                <option value = "Appliances"> Appliances</option>
                                <option value = "Home"> Home</option>
                                <option value = "Fashion"> Fashion</option>
                                <option value = "Kids"> Kids</option>
                                <option value = "Health & Beauty"> Health & Beauty</option>
                                <option value = "Books"> Books</option>
                                <option value = "Sports"> Sports</option>
                                <option value = "More"> More</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Enter Discount Percent:</td>
                        <td><Input type = "number" name ="discount_percent" placeholder ="Enter here" min="0" max="100"  value = "0" id = "discount_percent" required ></td>
                    </tr>

                    <tr>
                        <td>Enter Quantity:</td>
                        <td><Input type = "number" name ="available_quantity" placeholder ="Enter here" value = "1" id = "available_quantity" required ></td>
                    </tr>
                    <tr>
                        <td>Enter Image of the Product:</td>
                        <td><input class="form-control form-control-sm" type="file" name = "pimage"  ></td>
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
                            <div class="d-flex">
                            <button  onclick="myFunction()" type = "submit" class="btn btn-success " style="margin-right: 10px">SUBMIT</button>
                            <button type = "reset" class = "btn btn-warning"> Reset </button>
                            </div>
                        </td>

                    </tr>
                </table>
            </div>
        </div>
        </div>
    </form>
</div>

<script>

    function myFunction()
    {
    alert("Item successfully added.")
    }

</script>

</body>
</html>
