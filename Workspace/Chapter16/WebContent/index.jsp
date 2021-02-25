<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.Member" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	Member member = (Member)session.getAttribute("member");
	//System.out.println(member.getAddr());
	if(id == null) {
	%>
		<a href="loginForm.jsp">로그인</a>
	<%} else { %>
		[등급 : <%= grade != null && grade.equals("S") ? "관리자" : "일반"%>]<br/> ${id}님 환영합니다.
		<a href="logout">로그아웃</a>
	<%} %>
</body>
</html>