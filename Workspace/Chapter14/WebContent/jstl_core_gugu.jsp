<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="test" begin="1" end="9" step="1">
		<c:forEach var="test1" begin="1" end="9" step="1" >
			<b>${test} * ${test1} = ${test * test1}</b>&nbsp;
		</c:forEach><br />
	</c:forEach>
</body>
</html>