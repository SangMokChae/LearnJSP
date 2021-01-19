<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie ("name", "hongkildong");
	response.addCookie(cookie);
	cookie = new Cookie("gender", "male");
	response.addCookie(cookie);
	cookie = new Cookie("age", "20");
	cookie.setMaxAge(600);
	//아래의 시간을 10분으로 설정해준다. 시간설정이 없으면 보내버리고 적용되지 않는다.
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Test</title>
</head>
<body>
	<h2><%=cookie.getName() %></h2>
	<h2><%=cookie.getValue() %></h2>
	<h2><%=cookie.getMaxAge() %></h2>
	<a href="cookieTest2.jsp">쿠키 값 불러오기</a>
</body>
</html>