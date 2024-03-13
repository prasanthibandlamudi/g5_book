<%@page import="com.entity.BookDetails"%>
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
<style type=text/css>
	.back-img{
		height: 53vh;
		width: 100%;
		overflow: hidden;
	}
	.carousel-content {
	  position: absolute;
	  top: 20%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  z-index: 20;
	  color: white;
	  text-shadow: 0 1px 2px rgba(0,0,0,.6);
	}
	.card-ho{
		width: 250px;
	}
	.card-ho:hover{
		background-color: #fcf7f7;
	}
	::-webkit-scrollbar {
    display: none;
	}
</style>

</head>
<!-- <body style="background-color: #f7f7f7;"> -->
<body style="background-image: url('img/order10.jpg'); background-size: cover;">
<%User u = (User)session.getAttribute("userObj"); %>

	<%@include file="all_component/navbar.jsp" %>
	
	<div class="container text-center mt-3">
	
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<!-- <h1>Thank You</h1> -->
		<!-- <h2>Your order is successfully placed</h2> -->
		<!-- <h5>Your product will be delivered to your address within a week</h5> -->
		 <h1 style="margin-top: 175px;">Thank You</h1>
   <!--  <h1 style="margin-bottom: 40px;">Your product will be delivered to your address within a week</h1> -->
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
		<a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
		
	</div>
	
</body>
</html>
