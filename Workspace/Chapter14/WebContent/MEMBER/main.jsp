<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 한글을 사용할 경우에 fmt를 사용해서 초기화 시켜준다. -->
<fmt:requestEncoding value="utf-8"/>
<c:if test="${id eq null }">
	<script>
		alert('로그인 하세요!!');
		location.href='loginForm.jsp';
	</script>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 메인 페이지</title>
</head>
<body>
	<h1>${id }님이 로그인 하셨습니다.</h1> <!-- {userId} 대신 {id}를 사용 가능 하다. -->
	<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;
	<a href="member_mod.jsp">회원 정보 수정</a>
	<c:choose>
		<c:when test="${id ne null and id eq 'admin' }">
			<a href="member_list.jsp">관리자모드 접속(회원 목록 보기)</a>
		</c:when>
		<c:when test="${id ne null }">
			<a href="member_info.jsp?id='${id }'"></a>
		</c:when>
	</c:choose>
</body>
</html>