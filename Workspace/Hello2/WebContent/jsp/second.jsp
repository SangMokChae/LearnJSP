<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 현업에서는  -->
	<h1>이 페이지는 서블릿을 통해 전달받은 페이지 입니다. </h1>
	<h1> 이름 : ${name } </h1> <!-- EL형식이다. -->
	<h1> 패스워드 : ${passwd } </h1>
	
	<!-- 배운 대로  -->
	<h5>이름 : <%= request.getAttribute("name") %></h5>
	<h5>비번 : <%= request.getAttribute("passwd") %></h5>	
</body>
</html>