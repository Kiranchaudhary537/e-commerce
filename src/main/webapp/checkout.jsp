<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("error_message", "You are Not Logged In!! Login First to checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>

        <style>
            #messageBox {
                display: none; /* hide the message box by default */
                padding: 20px;
                background-color: #ff9933;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-top: 10px;
                font-size: 18px;
                text-align: center;
            }
        </style>

        <script>
            function showMessage() {
                var messageBox = document.getElementById("messageBox");
                messageBox.style.display = "block";
                messageBox.innerHTML = "Your order is successfully received!";
            }
        </script>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div id="messageBox"></div>

        <div class="container">
            <div class="row mt-3">

                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3">Your selected items</h3>
                            <div class="cart-body"></div>
                        </div>
                    </div> 
                </div>

                <div class="col-md-6">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3">Your details for order</h3>
                            <form>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input value="<%= user.getUserName()%>" type="name" class="form-control" id="name" placeholder="Enter your name">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email address</label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="email" placeholder="Enter your email">
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Contact Number</label>
                                    <input value="<%= user.getUserPhone()%>" type="number" class="form-control" id="phone" placeholder="Enter your phone number">
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <textarea value="<%= user.getUserAddress()%>" class="form-control" id="address" rows="3" placeholder="Enter your address"></textarea>
                                </div>

                            </form>

                            <div class="container text-center">
                                <button class="btn btn-outline-success" onclick="showMessage()">Order Now</button>
                                <button class="btn btn-outline-primary" onclick="window.location = 'index.jsp'">Continue Shopping</button>
                            </div>

                        </div>
                    </div> 
                </div>

            </div>
        </div>
                                
                                
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
