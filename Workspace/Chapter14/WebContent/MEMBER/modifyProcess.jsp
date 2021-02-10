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
	<sql:setDataSource var="con" dataSource="jdbc/OracleDB" />
	<sql:update var="result" dataSource="${con }">
		update member set password=?, name=?, age=?, gender=?, email=? where id = ?
		<sql:param>${param.pass }</sql:param>
		<sql:param>${param.name }</sql:param>
		<sql:param>${param.age }</sql:param>
		<sql:param>${param.gender }</sql:param>
		<sql:param>${param.email }</sql:param>
		<sql:param>${param.id }</sql:param>
	</sql:update>
</c:catch>

<c:choose>
	<c:when test="${result > 0 }">
		<c:choose>
			<c:when test="${result > 0 }">
				<script>
					alert("정보가 수정되었습니다.");
					location.href='member_info.jsp?id=${param.id}'
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("정보 수정이 실패하였습니다. 다시 시도해 보세요");
					history.back();
				</script>
			</c:otherwise>
		</c:choose>		
	</c:when>
	<c:otherwise>
		<script>
			alert("오류가 발생하였습니다. 다시시도해 보세요");
			history.back();
		</script>
	</c:otherwise>
</c:choose>