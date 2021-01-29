<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="resultSetTest.jsp" method="post">
		<select name="sel">
			<option value="num">번호</option>
			<option value="name">이름</option>
		</select>
			<input type="text" name="input" id="input">
			<input type="submit" value="검색">
	</form>
</body>
</html>