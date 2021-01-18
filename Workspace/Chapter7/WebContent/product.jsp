<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="BookInfo.jsp" method="get">
		<table border=1>
			<tr>
				<td colspan="2" align="center">책정보</td><tr />
			</tr>
			<tr>
				<td>코드명</td>
				<td><input type="text" name="code" required></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" required></td>
			</tr>
			<tr>
				<td>페이지수</td>
				<td><input type="text" name="page"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
	<br />
	<br />
	<form action="ClothInfo.jsp" method="get">
		<table border=1>
			<tr>
				<td colspan="2" align="center">옷정보</td><tr />
			</tr>
			<tr>
				<td>코드명</td>
				<td><input type="text" name="code" required></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" required></td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td><input type="text" name="size"></td>
			</tr>
			<tr>
				<td>색상</td>
				<td><input type="text" name="color"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>