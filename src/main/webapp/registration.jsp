<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: Register</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<!-- <body style="background-color: #f0f1f2;"> -->
<body style="background-image: url('img/register.webp'); background-size: cover; background-position: center;">
<%@include file="all_component/navbar.jsp" %>
	<div class="container p-3"  style="margin-left: -250px;">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card" style="background-color: rgba(173, 216, 230, 0.5);">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>
						
						<c:if test="${ not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${ not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session"/>
						</c:if>
						
						<form action="register" method="POST">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Enter Full Name</label>
						    <input type="text" name="fname" class="form-control" required="required"  id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
						  </div>
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						    <small id="emailHelp" required="required"  class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						 <div class="form-group">
                            <label for="exampleInputEmail1">Phone Number</label>
                            <input type="tel" pattern="[0-9]{10}" name="phno" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone Number (10 digits)">
                            <small id="phoneHelp" class="form-text text-muted">Please enter a 10-digit phone number.</small>
                            </div>

							<script>
								function validatePhoneNumber() {
									var phoneNumber = document
											.getElementById("exampleInputEmail1").value;
									if (phoneNumber.length !== 10
											|| isNaN(phoneNumber)) {
										alert("Please enter a valid 10-digit phone number.");
										return false;
									}
									return true;
								}

								document
										.querySelector("form")
										.addEventListener(
												"submit",
												function(event) {
													if (!validatePhoneNumber()) {
														event.preventDefault();
													}
												});
							</script>

							<div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" name="password" required="required" minlength="5" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
                          </div>
							<div class="form-check">
								<!--  <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Agree Terms & Condition</label> -->
								<label class="form-check-label" for="exampleCheck1"> <input
									type="checkbox" id="exampleCheck1"></label>
								<!-- Link to terms.jsp -->
								<a href="terms.jsp">Agree Terms & Conditions</a>
							</div>


							<div class="text-center">
						  	<button type="submit" class="btn btn-primary">Register</button>
						  </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="all_component/footer.jsp" %>
</body>
</html>
