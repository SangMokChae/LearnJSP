<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 메인 페이지</title>
</head>
<body>
	<h1>${id }님이 로그인 하셨습니다.</h1>
	<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;
	<a href="member_mod.jsp">회원 정보 수정</a>
	<c:if test="${id ne null and id eq 'admin' }">
		<a href="member_list.jsp">관리자모드 접속(회원 목록 보기)</a>
	</c:if>
</body>
</html>