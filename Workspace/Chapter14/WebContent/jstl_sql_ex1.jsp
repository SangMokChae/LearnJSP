<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL sql 라이브러리 사용 예제</title>
</head>
<body>
	<sql:setDataSource var="conn" dataSource="jdbc/OracleDB"/>

	<sql:update dataSource="${conn }" sql="insert into test (num, name) values (?, ?)">
		<sql:param value="5" />
		<sql:param value="홍길동" />
	</sql:update>
	
	<sql:update dataSource="${conn }"> insert into test (num, name) values(6, '조준동') </sql:update>
	<sql:update dataSource="${conn }"> insert into test (num, name) values(7, '홍길동') </sql:update>
	<sql:update dataSource="${conn }"> insert into test (num, name) values(8, '밥아씨') </sql:update>
	
	<sql:query var="rs" dataSource="${conn }">
		select * from test where name = ?
		<sql:param>홍길동</sql:param>
	</sql:query>
	
	<c:forEach var="data" items="${rs.rows}"> <!-- <rs.rows -> 1줄이다. -->
		<c:out value="${data['num']}"/>
		<c:out value="${data['name']}"/>
		<br />
	</c:forEach>
	
	<!-- 가능한 class 파일이나 설정파일(xml)등을 실행 시킬때 재구동을 시켜주는 것이 좋다. -->
</body>
</html>