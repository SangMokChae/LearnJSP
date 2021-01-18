<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="join" class="join.JoinBean" />
<%--<jsp:setProperty property="*" name="join"/>--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 입력 정보 확인 페이지</title>
<style>
	table {
		width: 400px;
	}
	h1 {
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td><b>아이디 : </b></td>
			<td>${param.id}</td>
		</tr>
		<tr>
			<td><b>비밀번호 : </b></td>
			<td>${param.password}</td>
		</tr>
		<tr>
			<td><b>이름 : </b></td>
			<td>${param.name}</td>
		</tr>
		<tr>
			<td><b>성별 : </b></td>
			<td>${param.sex}</td>
		</tr>
		<tr>
			<td><b>나이 : </b></td>
			<td>${param.age}</td>
		</tr>
		<tr>
			<td><b>이메일주소 : </b></td>
			<td>${param.email}</td>
		</tr>
	
	
		<%--<tr>
			<td><b>아이디 : </b></td>
			<td><jsp:getProperty property="id" name="join" /></td>
		</tr>
		<tr>
			<td><b>비밀번호 : </b></td>
			<td><jsp:getProperty property="pass" name="join" /></td>
		</tr>
		<tr>
			<td><b>이름 : </b></td>
			<td><jsp:getProperty property="name" name="join" /></td>
		</tr>
		<tr>
			<td><b>성별 : </b></td>
			<td><jsp:getProperty property="sex" name="join" /></td>
		</tr>
		<tr>
			<td><b>나이 : </b></td>
			<td><jsp:getProperty property="age" name="join" /></td>
		</tr>
		<tr>
			<td><b>이메일주소 : </b></td>
			<td><jsp:getProperty property="email" name="join" /></td>
		</tr> --%>
	</table>
</body>
</html>