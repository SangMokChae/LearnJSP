<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<c:set var="age" value="${param.age eq null or fn:trim(param.age) eq '' ? '0' : param.age}"/>

<c:catch var="err">
	<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
		
	<sql:update var="result" dataSource="${con }" sql="insert into member values(?,?,?,?,?,?)">
		<sql:param>${param.id }</sql:param>
		<sql:param>${param.pass }</sql:param>
		<sql:param>${param.name }</sql:param>
		<sql:param>${age }</sql:param>
		<sql:param>${param.gender }</sql:param>
		<sql:param>${param.email }</sql:param>
	</sql:update>
	
	<c:choose>
		<c:when test="${err ne null }">
			<script>
				alert('회원 가입에 오류가 발생했습니다. 계속 오류가 발생시 관리자에 문의하세요.')
				location.href='loginForm.jsp';
			</script>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${result > 0}">
					<script>
						alert('회원가입이 완료되었습니다.');
						location.href='joinForm.jsp';
					</script>
				</c:when>
				<c:otherwise>
					<script>
						alert('회원가입이 완료되지 않았습니다. 다시작성하세요');
						history.back();
					</script>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</c:catch>