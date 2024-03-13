<%@page import="com.entity.User"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_component/allCss.jsp" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.*" %>
<%@page import="com.DB.DBConnect" %>

<%@page import="com.entity.*" %>
</head>
<body style="background-image: url('img/view1.jpg'); background-size: cover;">

<% User u = (User)session.getAttribute("userObj");
   if (u == null) {
       // Handle the case where user is not logged in
       response.sendRedirect("login.jsp");
       return;
   }
%>
<%@include file="all_component/navbar.jsp" %>
<%
   int bid = Integer.parseInt(request.getParameter("bid"));
   BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
   BookDetails b = dao.getBookById(bid);
%>
<div class="container p-3">
    <div class="row">
        <div class="col-md-6 p-5 border text-center" style="background-color: rgba(255, 255, 255, 0.7);">
            <h4 class="mt-3">Book Name: <span class="text-success"><%= b.getBookName() %></span></h4>
            <h4>Author Name: <span class="text-success"> <%= b.getAuthor() %></span></h4>
            <h4> Category: <span class="text-success"> <%= b.getBookCategory() %></span> </h4>
            <h4> ReferenceId: <span class="text-success"> <%= b.getRefId() %></span> </h4>
        </div>
        <div class="col-md-6 p-5 border text-center" style="background-color: rgba(255, 255, 255, 0.7);">
            <h2 style="color: green;"><%= b.getBookName() %></h2>
            <% if ("Old".equals(b.getBookCategory())) { %>
                <h5 class="text-primary text-center"> Contact To Seller</h5>
                <h5 class="text-primary text-center"><i class="fa-solid fa-envelope"></i> Email: <%=b.getEmail() %></h5>
            <% } %>
            <div class="row">
                <div class="col-md-4 text-danger p-2 text-center">						
                    <i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
                    <h3> Cash On Delivery </h3>
                </div>
                <div class="col-md-4 text-danger p-2 text-center">					
                    <i class="fa-solid fa-rotate-left fa-2x"></i>
                    <h3> Return Available </h3>
                </div>
                <div class="col-md-4 text-danger p-2 text-center">
                    <i class="fa-solid fa-truck fa-2x"></i>
                    <h3> Free Shipping </h3>						
                </div>
            </div>
            <% if(b.getBookCategory().equals("Old") && (b.getEmail() != null && !b.getEmail().equals("admin"))) { %>
                <div class="text-center p-3">
                    <a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-plus"></i> Continue Shopping</a>
                    <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
                </div>
            <% } else { %>
                <div class="text-center p-3">
                    <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
                    <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
                </div>
            <% } %>
        </div>
    </div>
</div>

</body>
</html>
