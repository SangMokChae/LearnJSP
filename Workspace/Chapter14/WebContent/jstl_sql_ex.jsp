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
	<sql:setDataSource var="conn" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:XE" user="java" password="java"/>
	<!-- 직접 db연결 -->
	<!-- contextfile 사용법 sql:setDataSource var="conn" dataSource="jdbc/OracleDB"/> -->
		
	<sql:update dataSource="${conn }"> insert into test (num, name) values(1, '홍길동') </sql:update>
	<sql:update dataSource="${conn }"> insert into test (num, name) values(2, '조준동') </sql:update>
	<sql:update dataSource="${conn }"> insert into test (num, name) values(3, '홍길동') </sql:update>
	<sql:update dataSource="${conn }"> insert into test (num, name) values(4, '홍길순') </sql:update>
	
	<sql:query var="rs" dataSource="${conn }">
		select * from test where name = ?
		<sql:param>홍길동</sql:param>
	</sql:query>
	
	<c:forEach var="data" items="${rs.rows}">
		<c:out value="${data['num']}"/>
		<c:out value="${data['name']}"/>
		<br />
	</c:forEach>
</body>
</html>