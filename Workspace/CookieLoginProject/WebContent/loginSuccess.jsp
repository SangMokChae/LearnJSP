<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	String email = request.getParameter("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인에 성공한 사용자 정보</h1>
	
	<p>이름 : <%=name %></p>
	<p>주소 : <%=addr %></p>
	<p>이메일 : <%=email %></p>
	<p>나이 : <%=age %></p>
</body>
</html>