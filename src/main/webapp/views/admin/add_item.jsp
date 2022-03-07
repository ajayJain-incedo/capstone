<%@ page import="com.service.VerifySession" %>
<%@ page errorPage="../error_pages/error_page1.jsp" %>
<html xmlns="http://www.w3.org/1999/html">
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
    .br-21{
    border-radius:19px !important;
    }
    .bs{
    box-shadow: 1px 1px 10px;
    }
    .back:hover
    {
        transform:scale(1.9, 1.9);
    }

    </style>
</head>
<body style = "background-color: rgb(252 238 238) !important;">
<%
if(VerifySession.verifySessionForAdmin(request, response)){
return;
}
%>
<div class="ml-2">
<a href="update_item.jsp">
    <img style="height: 3rem; width: 3rem" border="0" alt="HomePage Icon" src="../../resources/static/images/admin_home_page.jpg" width="100" height="100">
</a>
</div>
<!--<h2 style = "text-align: center"> <b><u> ADD ITEM PAGE </u></b></h2>-->
<!--<div class = "container d-flex inline-padding">-->
<!--&lt;!&ndash;    <form action = "../../AddItemServlet" method = "post" name = "form" id = "form" enctype = "multipart/form-data" onsubmit = "return checkforblank()">&ndash;&gt;-->
<!--        <div class="card">-->
<!--        <div class="card text-center">-->
<!--            <div class="card-header">DETAILS-->
<!--            </div>-->
<!--            <div class="card-body">-->
<!--                <table>-->
<!--                    <tr>-->
<!--                        <td>Enter Product Name:</td>-->
<!--                        <td><Input type = "text" name ="pname" placeholder ="Enter here" id = "pname" required ></td>-->
<!--                    </tr>-->
<!--                    <tr>-->
<!--                        <td>Enter Description:</td>-->
<!--                        <td><textarea type = "text" name ="pdesc" placeholder ="Enter here" rows="2" id = "pdesc" required ></textarea></td>-->
<!--                    </tr>-->
<!--                    <tr>-->
<!--                        <td>Enter Price:</td>-->
<!--                        <td><Input type = "number" name ="price" placeholder ="Enter here" id = "price"  required></td>-->
<!--                    </tr>-->

<!--                    <tr>-->
<!--                        <td>Enter Category:</td>-->
<!--                        <td><select name = "category" >-->
<!--                                <option value = "Mobiles"> Mobiles</option>-->
<!--                                <option value = "Electronics"> Electronics</option>-->
<!--                                <option value = "Appliances"> Appliances</option>-->
<!--                                <option value = "Home"> Home</option>-->
<!--                                <option value = "Fashion"> Fashion</option>-->
<!--                                <option value = "Kids"> Kids</option>-->
<!--                                <option value = "Health & Beauty"> Health & Beauty</option>-->
<!--                                <option value = "Books"> Books</option>-->
<!--                                <option value = "Sports"> Sports</option>-->
<!--                                <option value = "More"> More</option>-->
<!--                            </select>-->
<!--                        </td>-->
<!--                    </tr>-->
<!--&lt;!&ndash;                    <tr>&ndash;&gt;-->
<!--&lt;!&ndash;                        <td>Enter Discount Percent:</td>&ndash;&gt;-->
<!--&lt;!&ndash;                        <td><Input type = "number" step = ".01"  name ="discount_percent" placeholder ="Enter here" min="0" max="100"  id = "discount_percent" value ="0.0" required  ></td>&ndash;&gt;-->
<!--&lt;!&ndash;                    </tr>&ndash;&gt;-->

<!--                    <tr>-->
<!--                        <td>Enter Quantity:</td>-->
<!--                        <td><Input type = "number" name ="available_quantity" placeholder ="Enter here"  id = "available_quantity" required  ></td>-->
<!--                    </tr>-->
<!--                    <tr>-->
<!--                        <td>Enter Image of the Product:</td>-->
<!--                        <td><input class="form-control form-control-sm" type="file" name = "pimage"  required ></td>-->
<!--                    </tr>-->

<!--                    <tr>-->
<!--                        <td>-->
<!--                        </td>-->
<!--                    </tr>-->
<!--                    <tr>-->
<!--                        <td>-->
<!--                        </td>-->
<!--                    </tr>-->
<!--                    <tr>-->
<!--                        <td>-->
<!--                        </td>-->
<!--                    </tr>-->

<!--                    <tr>-->
<!--                        <td>-->
<!--                            <div class="d-flex">-->
<!--                            <button   type = "submit" class="btn btn-primary " style="margin-right: 10px">SUBMIT</button>-->
<!--                            <button type = "reset" class = "btn btn-danger"> Reset </button>-->
<!--                            </div>-->
<!--                        </td>-->

<!--                    </tr>-->
<!--                </table>-->
<!--            </div>-->
<!--        </div>-->
<!--        </div>-->
<!--    </form>-->
<!--</div>-->

<div class="container " style="width: 100%;">

    <div class="col-md-4 offset-md-4 lc ">
        <div class="card bs br-21"  >
            <div class="card-header text-center card-header-background{" style ="height: 50px; ">
                <i class="	fa fa-user-circle-o fa-2x "></i>
                <p><strong>Add Item</strong></p>

            </div>
            <div class="card-body" style = "text-align: center">
                <form action = "../../AddItemServlet" method = "post" name = "form" id = "form" enctype = "multipart/form-data" onsubmit = "return checkforblank()">

                    Enter Product Name:
                    <p><Input type = "text" name ="pname" placeholder ="Enter here" id = "pname" required></p>
                    Enter Product Description:
                    <p><textarea type = "text" name ="pdesc" placeholder ="Enter here" rows="2" cols="50" id = "pdesc" required></textarea></p>

                    Enter Price:
                    <p><Input type = "number" name ="price" placeholder ="Enter here" id = "price"  required></p>
                    Enter Category:
                    <p><select name = "category" >
                        <option value = "Mobiles"> Mobiles</option>-->
                        <option value = "Electronics"> Electronics</option>
                        <option value = "Appliances"> Appliances</option>
                        <option value = "Home"> Home</option>
                        <option value = "Fashion"> Fashion</option>
                        <option value = "Kids"> Kids</option>
                        <option value = "Health & Beauty"> Health & Beauty</option>
                        <option value = "Books"> Books</option>
                        <option value = "Sports"> Sports</option>
                        <option value = "More"> More</option>
                    </select></p>

                    Enter Available Quantity:
                    <p><Input type = "number" name ="available_quantity" placeholder ="Enter here"  id = "available_quantity" required></p>

                    Enter Image of the Product:
                    <p><Input class="form-control form-control-sm" type="file" name = "pimage"  required></p>

                    <div class=" text-center">
                        <button   type = "submit" class="btn btn-primary " style="margin-right: 10px">Submit</button>
                        <button type = "reset" class = "btn btn-danger"> Reset </button>
                    </div>
<!--                    button type="submit" value="DETAILS" class = "btn btn-primary">SUBMIT</button>-->
                </form>
            </div>
        </div>
    </div>

</div>

<script>

    function checkforblank()
    {
        if (document.getElementById('pname').value == "")
        {
            alert('please enter the name of the product');
            return false;
        }
        if (document.getElementById('pdesc').value == "")
        {
            alert('please enter the description of the product');
            return false;
        }
        if (document.getElementById('price').value == 0)
        {
            alert('please enter the price of the product');
            return false;
        }
        if (document.getElementById('available_quantity').value == 0)
        {
            alert('please enter the available quantity of the product');
            return false;
        }
        else
        {
            alert('ITEM ADDED TO THE DATABASE!!');
        }
    }

</script>
</body>
</html>
