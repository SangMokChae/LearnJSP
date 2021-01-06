<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h1 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 400px;
		border: 1px solid red;
		border-collapse: collapse;
	}
</style>
<body>
	<h1>헤더정보 예제</h1>
	<table border="1">
		<tr>
			<td>헤더이름</td>
			<td>헤더값</td>
		</tr>
		<%
		Enumeration e = request.getHeaderNames();
		while(e.hasMoreElements()) {
			String headerName = (String)e.nextElement();
		%>
		<tr>
			<td><%=headerName %></td>
			<td><%=request.getHeader(headerName) %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>