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
		String passwd = (String)session.getAttribute("passwd");
		String name = (String)session.getAttribute("name");
		String tel = (String)session.getAttribute("tel");
	%>
	
	<span>아이디: <%=id %></span><br />
	<span>패스워드: <%=passwd %></span><br />
	<span>이름: <%=name %></span><br />
	<span>전화번호: <%=tel %></span><br />
	<a href="#">저장</a>
</body>
</html>