<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
        <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <%@include file="components/message.jsp" %>
                    
                    <div class="card-body px-3">
                        <div class="container text-center">
                            <img src="img/register.jpg" style="max-width: 100px;" class="img-fluid" alt="">
                        </div>
                        <h3 class="text-center">Sign Up Here</h3>
                        <form action="RegisterServlet" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">User Name</label>
                                <input type="text" class="form-control" name="user_name" id="name" placeholder="Enter Here" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">User Email</label>
                                <input type="email" class="form-control" name="user_email" id="email" placeholder="Enter Email" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">User Password</label>
                                <input type="password" class="form-control" name="user_password" id="password" placeholder="Enter Password" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">User Phone</label>
                                <input type="number" class="form-control" name="user_phone" id="phone" placeholder="Enter Contact Number" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">User Address</label>
                                <textarea name="user_address" style="height:200px;" class="form-control" placeholder="Enter Your Address"></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-warning">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        </div>
    </body>
</html>
