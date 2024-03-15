
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file='allCss.jsp' %>
</head>
<!-- <body style="background-color: #f0f2f2;"> -->
<body style="background-image: url('../img/book.jpg'); background-size: cover; background-position: center; background-attachment: fixed; background-color: #f7f7f7;">
<%@include file="navbar.jsp" %>

	<c:if test="${empty userObj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-6">
				<div class="card m-3" style="background-color: rgba(173, 216, 230, 0.5);">
					<div class="card-body">
						<h4 class="text-center text-success">Add Books</h4>
						
						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						
						<form action="../addBooks" method="post" enctype="multipart/form-data">
						   <div class="form-group">
								<label for="exampleInputEmail1">Reference Id*</label> 
								<input name="referenceId" type="number" class="form-control" id="exampleInputEmail1" aria-describedly="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> 
								<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedly="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> 
								<input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedly="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> 
								<input name="price" type="number" class="form-control" id="exampleInputEmail1" aria-describedly="emailHelp">
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label>
								<select id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select> 
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Book Status</label> 
								<select id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
<!--  					<div class="form-group">
								<label for="exampleFormControlFile1">Reference Id</label> 
								<input name="reference id" type="number" class="form-control-file" id="exampleFormControlFile1">
							</div> -->
							
							
							
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="container-fluid" style="margin-top: 15px;">
	<%-- <%@include file="footer.jsp" %> --%>
	<%@include file="../all_component/footer.jsp" %>
</div>
</body>
</html>
