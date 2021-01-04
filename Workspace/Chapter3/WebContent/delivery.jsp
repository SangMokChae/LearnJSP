<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#deliveryFormArea {
		text-align: center;
		width: 250px;
		margin: auto;
		border: 1px solid red;
	}
</style>
</head>
<body>
	<h1>배송지</h1>
	<section id="deliveryFormArea">
		<form action="delivery" method="post">
			<label>배송지</label><br>
			<label for="addr">받을 주소 :</label> <input type="text" name="addr" id="addr" /><br/>
			<label for="name">받는 사람 :</label> <input type="text" name="name" id="id" /><br/>
			<input type="submit" value="post방식 전송">
		</form><br>
		<label>전화</label><br>
		<form action="delivery" method="get">
			<label for="tel">전화번호 : </label> <input type="text" name="tel" id="tel" placeholder="-도 입력하세요!" /> <br />
			<input type="submit" value="Get방식 전송">
		</form>
	</section>
</body>
</html>