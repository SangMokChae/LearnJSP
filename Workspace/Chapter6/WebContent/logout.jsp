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
		session.invalidate(); //session을 초기화 한다.
		//session.removeAttribute("id");
		
		//response.sendRedirect("template.jsp"); 경고없이 로그아웃하기
		out.println("<script src='javascript/logout.js'> </script>");
	%>
</body>
</html>