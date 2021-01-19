<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% session.setAttribute("name", "Session Test!"); %>
<% response.sendRedirect("sessionTest.jsp"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		// location.href="sessionTest.jsp";
	</script>
</body>
</html>