<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("error_message", "You are Not Logged In!! Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("error_message", "You are Not an Admin!!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
    
    
    
    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
    List<Product> list = dao.getAllProducts();
  
            
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> clist = cdao.getcategories();
    
    int numRows = 0;

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel/Edit Page</title>

        <%@include file="components/common_css_js.jsp" %>

        <style>
            body{
                background: #e2e2e2;
            }
        </style>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container text-center mt-3">
            <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                <div class="card-body">
                    <table class="table">
                        <thead class='thead-light'>
                           
                            <tr>
                                <th>#</th>
                                <th>Item Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total Price</th>
                                <th>Action</th>
                            </tr>
                            <% int count =1; %>
                            <% for (Product p : list) {
                                   %>
                            <tr>
                                <th><%= count++ %> </th>
                                <td><%= p.getpName()%></td>
                                <td><%= p.getpPrice()%></td>
                                <td><%= p.getpQuantity()%></td>
                                <td><%= p.getPriceAfterDiscount()%></td> 
                                <td><button class='btn btn-warning btn-sm'>Update</button></td>
                            </tr>
                            <% }%>
                            
                        </thead>
                    </table>
                </div>
            </div>

            <button class="btn btn-primary btn-lg mt-3" onclick="window.history.back()">Go Back</button>
        </div>




        <!--add product modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!--form start-->

                        <form action="ProductOperationServlet" method="POST" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>
                            <!--product title-->
                            <div class="form-group mt-2">
                                <input type='text' class="form-control" placeholder="Update title of Product" name="pName" required/>
                            </div>

                            <!--product description-->
                            <div class="form-group mt-2">
                                <textarea style="height: 80px;" class="form-control" placeholder="Update product desription" name="pDesc" required></textarea>
                            </div>

                            <!--product price-->
                            <div class="form-group mt-2">
                                <input type='number' class="form-control" placeholder="Update price of Product" name="pPrice" required/>
                            </div>

                            <!--product discount-->
                            <div class="form-group mt-2">
                                <input type='number' class="form-control" placeholder="Update product discount" name="pDiscount" required/>
                            </div>

                            <!--product quantity-->
                            <div class="form-group mt-2">
                                <input type='number' class="form-control" placeholder="Update product quantity" name="pQuantity" required/>
                            </div>

                            <!--product category-->

                            <div class="form-group mt-2">
                                <select name="catId" class="form-control" id="">

                                    <%                                        for (Category c : clist) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <!--product file photo-->
                            <div class="form-group mt-2">
                                <label for="pPic">Select Picture of Product</label><br/>
                                <input type="file" name="pPic" id="pPic" required/>
                            </div>

                            <!--submit button-->
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>

                        </form>
                        <!--end form-->
                    </div>

                </div>
            </div>
        </div>

        <!--end add product modal-->

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
