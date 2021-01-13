<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 가입</h1>
	<form action="joinReg.jsp" name="j_form" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="text" name="passwd"><br>
		이름 : <input type="text" name="name"><br>
		전화번호 : <input type="text" name="tel"><br>
		<input type="submit" value="저장" id="save"/>
	</form>
	
	<script src="javascript/check.js"></script>
	<script src="javascript/saveAlim.js"></script>
</body>
</html>