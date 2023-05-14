<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Home page</title>
		<!-- css animator -->
		<link
			rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
		/>
		<!-- tailwind with config  -->
		<script src="https://cdn.tailwindcss.com"></script>
		<script>
			tailwind.config = {
				theme: {
					extend: {
						colors: {
							primary: "#6339dc",
						},
					},
				},
			};
		</script>
		<!-- custom css  -->
		<style><%@include file="./style.css"%></style>
	</head>
	<body>
		<!-- banner  -->
	    <jsp:include page="components/Navbar.jsp" />
	    <% if(session.getAttribute("role").equals("teacher")) { %>
	    	<jsp:include page="components/Teacher.jsp" />
	    <% } %>
	    <% if(session.getAttribute("role").equals("student")) { %>
	    	<jsp:include page="components/Student.jsp" />
	    <% } %>
	    <% if(session.getAttribute("role").equals("admin")) { %>
	    	<jsp:include page="components/Admin.jsp" />
	    <% } %>
	    
	    <script><%@include file="./modal.js"%></script>
	    <script><%@include file="./showStudentModal.js"%></script>
  </body>
</html>
