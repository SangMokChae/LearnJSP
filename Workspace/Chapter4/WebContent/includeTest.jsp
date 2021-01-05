<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 테스트</title>
<style>
	h1 {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 15px 0;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h1>includeTest.jsp 파일입니다.</h1>
	<%@ include file="footer.jsp" %>
</body>
</html>