<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");

%>

<nav class="navbar navbar-expand-lg custom-bg">
    <div class="container">
        <a class="navbar-brand linkcolor" href="index.jsp">MyCart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link active linkcolor" aria-current="page" href="index.jsp">Home</a>
                </li>

               

                <li class="nav-item">
                    <a class="nav-link disabled linkcolor"></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                
                <li class="nav-item active">
                    <a class="nav-link linkcolor" href="#!" data-bs-toggle="modal" data-bs-target="#cart"><i class="fa-solid fa-cart-shopping" style="font-size: 20px;"></i><span class="cart-items" style="font-size: 20px;">(0)</span></a>
                </li> 
                
                <%                if (user1 == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link active linkcolor" aria-current="page" href="login.jsp">Login</a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link active linkcolor" aria-current="page" href="register.jsp">Register</a>
                </li> 
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link active linkcolor" aria-current="page" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp" %>"><%= user1.getUserName() %></a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link active linkcolor" aria-current="page" href="LogoutServlet">Logout</a>
                </li> 
                <%
                    }
                %>

            </ul>
        </div>
    </div>
</nav>
