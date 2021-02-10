<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<fmt:requestEncoding value="utf-8"/>

<c:if test="${id eq null or id ne 'admin' }">
	<script>
		alert('관리자로 로그인하세요!!');
		location.href='loginForm.jsp';
	</script>
</c:if>

<c:catch var="err">
	<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
	<sql:update var="result" dataSource="${con }">
		delete from member where id = ?
		<sql:param>${param.id }</sql:param>
	</sql:update>
</c:catch> 
<c:choose>
	<c:when test="${err eq null }"> <!-- error 가 없는 경우 -->
		<c:choose>
			<c:when test="${result > 0 }">
				<script>
					alert("${param.id }님이 삭제되었습니다.");
					location.href='member_list.jsp';
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert('회원정보가 삭제되지 않았습니다.');
					history.back();
				</script>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<script>
			alert('데이터 삭제에 오류가 발생했습니다.');
			location.href='member_list.jsp';
		</script>
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>