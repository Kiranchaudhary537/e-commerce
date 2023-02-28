<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%= message%></strong> 
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>   
<%
        session.removeAttribute("message");
    }
%>


<%
    String message1 = (String) session.getAttribute("message1");
    if (message1 != null) {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong><%= message1%></strong> 
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>   
<%
        session.removeAttribute("message1");
    }
%>


<%
    String error_message = (String) session.getAttribute("error_message");
    if (error_message != null) {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong><%= error_message%></strong> 
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>   
<%
        session.removeAttribute("error_message");
    }
%>

