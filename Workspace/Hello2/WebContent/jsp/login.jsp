<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>로그인</h1>
			<form action="../login.do" id="frm" name="frm" method="post">
				<div>
					<table border="1">
						<tr>
							<th width="150">아이디</th>
							<td><input type="text" id="id" name="id"></td>
						</tr>
						<tr>
							<th width="150">패스워드</th>
							<td><input type="password" id="pw" name="pw"></td>
						</tr>
					</table>
				</div><br/>				
				<input type="submit" value="로그인" /> &nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소" />
			</form>
		</div>
	</div>
</body>
</html>