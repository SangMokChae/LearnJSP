<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	session.setAttribute("test", "Session Test");
--%>
${sessionScope.test="Session Test" } <!-- 입력과 동시에 출력도 같이 된다. /화면에 나온다. / 입력과 출력을 따로 하고 싶으면 jstl을 사용해야 한다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 객체 사용 예제</title>
<style>
	table {
		width: 600px;
		margin: auto;
		border: 1px solid gray;
		text-align: center;
	}
</style>
</head>
<body>
	<form action="el_test2.jsp" method="post">
		<table>
			<tr>
				<td>이름  : </td>
				<td><input type="text" name="name" value="홍길동"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="입력"></td>
			</tr>
		</table>
	</form>
</body>
</html>