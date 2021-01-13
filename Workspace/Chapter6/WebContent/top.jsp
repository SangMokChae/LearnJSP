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
		String id = (String)session.getAttribute("id");
	%>
	<%
		if(id == null) {
	%>
	<a href="template.jsp?page=login">Log in</a>&nbsp;
	<a href="template.jsp?page=join">Join</a>
	<%} else { %>
		<font color="green">&nbsp; <%=id %>님 환영합니다.&nbsp; </font>
	<a href="logout.jsp">Log out</a>
	<%} %>
</body>
</html>