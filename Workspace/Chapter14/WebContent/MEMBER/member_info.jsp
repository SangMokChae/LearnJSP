<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<c:if test="${id eq null or id ne 'admin' }">
	<script>
		alert('관리자로 로그인하세요!!');
		location.href='loginForm.jsp';
	</script>
</c:if>

<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
<sql:query var="rs" dataSource="${con }">
	select * from member where id = ?
	<sql:param>${param.id }</sql:param>
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 관리자모드 (회원 정보 보기)</title>
<style>
	table{
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
</style>
</head>
<body>
	<!--  forEach 문을 사용해서 rs의 값을 불러와야 한다. -->
	<!-- forEach를 사용하지 않으면 rs.rows의 값이 배열로 넘어온다고 봐야한다. -->
	<c:set var="info" value="${rs.rows[0] }"/> <!-- (반복을 사용하지 않는 형태에서의) 첫번째 값이다. [배열이다. 0은 배열의 1번째 값 >>> 1개의  열밖에 없기때문] -->
	<c:forEach var="row" items="${rs.rows}">
		<table>
				<tr>
					<td>아이디 : </td>
					<td>${row.id }<%-- ${info.id } --%></td>
				</tr>
				<tr>
					<td>비밀번호 : </td>
					<td>${row.password }</td>
				</tr>
				<tr>
					<td>이름 : </td>
					<td>${row.name }</td>
				</tr>
				<tr>
					<td>나이 : </td>
					<td>${row.age }</td>
				</tr>
				<tr>
					<td>성별 : </td>
					<td>${row.gender }</td>
				</tr>
				<tr>
					<td>이메일 주소 : </td>
					<td>${row.email }</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:choose>
							<c:when test="${id eq 'admin'}">
								<a href="member_list.jsp">리스트로 돌아가기</a>
							</c:when>
							<c:otherwise>
								<a href="main.jsp">메인으로 돌아가기</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
		</table>
	</c:forEach>
</body>
</html>