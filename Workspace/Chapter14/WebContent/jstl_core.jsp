<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% test.BeanTest2 ts=new test.BeanTest2(); %>
<jsp:useBean id="bt" class="test.BeanTest2" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>라이브러리 사용예제 1</title>
</head>
<body>
	<c:set target="${bt }" property="name" value="홍길동" /> <!-- useBean(javaBean)을 가져온다. -->
	<c:set var="tsTarget" value="<%=ts %>" />
	<c:set target="${tsTarget }" property="name" value="Hello" />
	<%=bt.getName() %> &nbsp; ${bt.name } <!-- bt.getName() = bt.name get/set 설정이 필요하다. -->	
	<h3>ts.name : ${ts.name}</h3> <!-- ts를 사용하기 위해서 useBean을 사용해야한다. -->
	<h3>tsTarget.name : ${tsTarget.name }</h3>
	tsTarget.name : 	<c:out value="${tsTarget.name }" />
	<br />
	<c:set var="t" value="<script>alert();</script>" />
	${t }
	escapeXml true : <c:out value="${t }" escapeXml="true" /><br /> <!-- true면 출력 / false면 노출력 / 둘다 alert실행` -->
	escapeXml false : <c:out value="${t }" escapeXml="false" />
</body>
</html>