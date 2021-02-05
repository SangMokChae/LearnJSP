<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 캑체 사용 예제</title>
</head>
<body>
	<h3>${sessionScope.test }</h3>
	<!--
	 pageScope.test = 'a' / 1순위 -- 장바구니
	 requestScope.test = 'b' / 2순위
	 sessionScope.test = 'c' / 3순위
	 
	 {test} 했을때 출력 순위가 존재한다. / 알고 사용하자!!! -영역 객체.값
	 -->
	<h3>${test }</h3>
	<h3>${param.name }</h3>
	<h3>${name }</h3> <!-- 값이 없음 그러나 error가 안뜬다. -->
</body>
</html>