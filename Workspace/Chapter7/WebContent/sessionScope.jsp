<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="testsession" class="scope.Counter" scope="application" /> 
<!-- scope: session 부분이 접속자값이 지속해서 올라가게 만들어주는 역활이다. 
	session은 브라우저가 닫기전까지 방문자 수가 이어진다.
	application은 서버가 종료되기 전까지 방문자 수가 이어진다. -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자바빈 session scope 테스트</title>
</head>
<body>
	<span>현재 방문자 수 </span>
	<jsp:getProperty property="cnt" name="testsession" />
	<input type="button" value="초기화" onclick="location.href='cntReset.jsp?page=sessionScope';" />
</body>
</html>