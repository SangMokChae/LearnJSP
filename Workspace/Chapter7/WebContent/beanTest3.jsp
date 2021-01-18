<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page" /> <!-- jsp 파일 호출 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBean Test</title>
</head>
<body>
	<b>자바빈 사용 예제</b>
	<h3><%=beantest.getName() %></h3>
	
	<h3>${param.name}</h3>
	<!-- param.name 하면 html의 input값을 가져와서 바로 적용한다. -->
</body>
</html>