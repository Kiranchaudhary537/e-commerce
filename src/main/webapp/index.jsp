<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.entities.Product"%>
<%@page import="com.mycompany.mycart.dao.ProductDao"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart - Home</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>

        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%  
                    String cat = request.getParameter("category");
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    
                    //category wise data conditions
                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    }else{
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getcategories();
                %>

                <!--show categories-->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active catColor" aria-current="true">
                            All Categories
                        </a>

                        <%
                            for (Category c : clist) {
                        %>
                           <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>

                <!--show products-->
                <div class="col-md-10">
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <% for (Product p : list) {%>

                        <div class="col">
                            <div class="card product-card">
                                <div class="container text-center">
                                    <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt="<%= p.getpName()%>">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpName()%></h5>
                                    <p class="card-text"><%= Helper.get10Words(p.getpDesc())%></p>
                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn btn-primary text-white" onclick="add_to_cart(<%= p.getpId() %>,'<%= p.getpName() %>',<%= p.getPriceAfterDiscount() %>)">Add to Cart</button>
                                    <button class="btn btn-outline-success"> &#8377; <%= p.getPriceAfterDiscount() %>/- <span class="text-secondary discount-label"> &#8377; <%= p.getpPrice() %>,<%= p.getpDiscount() %>% off</span></button>
                                </div>
                            </div>
                        </div>

                        <% }
                            if(list.size() == 0){
                                out.println("<h3>No Item in this Category</h3>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
                        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
