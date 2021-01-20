<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String pw = request.getParameter("pw");
	String id  = request.getParameter("id");
	String msg = null;
	
	if(id.equals("park") && pw.equals("1234")) {
		msg = "park 님 환영합니다.";
	} else {
		msg = id + "님 존재하지 않는 아이디 입니다.";
	}
%>

	<h1><%= msg %></h1>
</body>
</html>