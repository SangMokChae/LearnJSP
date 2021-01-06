<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% session.setMaxInactiveInterval(10); %>
	<h2>세션 테스트</h2>
	isNew(): <%=session.isNew() %><br>
	생성시간: <%=session.getCreationTime() %><br>
	최정 접속 시간: <%=session.getLastAccessedTime() %><br>
	세션ID:<%=session.getId() %><br>
</body>
</html>