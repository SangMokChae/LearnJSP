<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name;
	if(session.getAttribute("name") != null) {
		name = (String)session.getAttribute("name");
	} else {
		name = "세션 값 없음.";
	}
	session.setMaxInactiveInterval(60*60*24);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Test</title>
</head>
<body>
	<h2>세션 테스트</h2>
	<input type="button" onclick="location.href='sessionSet.jsp'" value="세션 값 저장">
	<input type="button" onclick="location.href='sessionDel.jsp'" value="세션 값 삭제">
	<input type="button" onclick="location.href='sessionInvalidate.jsp'" value="세션 초기화">
	<h3><%=name %></h3>
	<h4><%=session.getId() %></h4>
	<h4>세션 유지기간 : <%=session.getMaxInactiveInterval() %>초</h4>
</body>
</html>