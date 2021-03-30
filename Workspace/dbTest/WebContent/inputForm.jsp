<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="inputReg.jsp" method="post">
		<table border="1">
			<tr>
				<td>회원 ID</td>
				<td><input type="text" name="mem_id"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="mem_name"/></td>
			</tr>
			<tr>
				<td>전화</td>
				<td><input type="text" name="tel"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address"/></td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="hobby" value="독서"/>독서&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="드라이브"/>드라이브&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="영화"/>영화&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="요리"/>요리&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="여행"/>여행&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="운동"/>운동
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>