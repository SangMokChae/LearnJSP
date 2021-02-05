<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자 사용 예제</title>
</head>
<body>
	<!-- \ 는 문자 취급을 한다. \${5+7} => str(${5+7})  -->
	<h3>\${5+7} = ${5+7}</h3>
	<h3>\${8-3} = ${8-3}</h3>
	<h3>\${6*3} = ${6*3}</h3>
	<h3>\${9/3} = ${9/3}</h3>
	<h3>\${10%3} = ${10%3}</h3>
	<h3>\${10 mod 3} = ${10 mod 3}</h3>
	<h3>\${10==9} = ${10==9}</h3>
	<h3>\${10 eq 9} = ${10 eq 9}</h3>
	<h3>\${7<8} = ${7<8}</h3>
	<h3>\${7 it 8} = ${7 lt 8}</h3>
	<h3>\${8>8} = ${8>8}</h3>
	<h3>\${8 gt 8} = ${8 gt 8}</h3>
	<h3>\${15 <= 9} = ${15 <= 9}</h3>
	<h3>\${15 le 9} = ${15 le 9}</h3>
	<h3>\${7>=2} = ${7>=2}</h3>
	<h3>\${7 ge 2} = ${7 ge 2}</h3>
	<h3>\${5+3==8 ? 8 : 10} = ${5+3==8 ? 8 : 10}</h3>
</body>
</html>