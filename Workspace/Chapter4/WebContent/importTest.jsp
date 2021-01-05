<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.text.SimpleDateFormat, java.util.*" %>
<%-- = <%@page import="java.text.SimpleDateFormat"%>
	   <%@page import="java.util.*"%>  --%>
<html>
<head>
<meta charset="UTF-8">
<title>import 속성 테스트</title>
</head>
<body>
	<h1>현재 시간은 <%=new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초").format(new Date())%>입니다.</h1>
</body>
</html>