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

<sql:setDataSource var="con" dataSource="jdbc/OracleDB"/>
<sql:query var="rs" dataSource="${con }">
	select * from member where id = ?
	<sql:param>${param.id }</sql:param>
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지</title>
<style>
	table{
		margin: auto;
		width: 400px;
		border: 1px solid gray;
		text-align: center;
	}
	.td_title {
		font-weight: bold; 
		font-size: x-large;
	}
	td:nth-child(2) {
		text-align: left;
	}
</style>
</head>
<body>
	<form action="modifyProcess.jsp" name="modform" method="post">
		<table border=1>
			<tr>
				<td colspan="2" class="td_title">회원 정보 수정 페이지</td>
			</tr>
		<c:choose>
			<c:when test="${rs.rows[0] ne null}">	
			<tr>
				<td>아이디 : </td>
				<td><input type="hidden" name="id" value=${rs.rows[0].id }>${rs.rows[0].id }</td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type="text" name="pass" id="pass" value=${rs.rows[0].password }></td> <%-- jsp부분을 큰따옴표 /바깥부분을 작은따옴표를 사용해야한다. --%>
			</tr>
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name" id="name" value=${rs.rows[0].name }></td>
			</tr>
			<tr>
				<td>나이 : </td>
				<td><input type="text" name="age" id="age" value=${rs.rows[0].age }></td>
			</tr>
			<tr>
				<td>성별 : </td>
				<td>
					<input type="radio" name="gender" id="gender1" value="남" ${row.rows[0].gender eq '남' ?  :}/>남 
					<input type="radio" name="gender" id="gender2" value="여" ${row.rows[0].gender eq '여' ?  :}/>여
				</td>
			</tr>
			<tr>
				<td>이메일 주소 : </td>
				<td><input type="text" name="email" id="email" value=${rs.rows[0].email }></td>
			</tr>
			<tr>
				<td colspan=2>
					<a href="javascript:modform.submit()">수정하기</a>			
					<a href="javascript:modform.reset()">초기화</a>			
					<a href="member_list.jsp">뒤로가기</a>		
				</td>	
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan=2>정보가 없습니다.</td>	
			</tr>
		</c:otherwise>
		</c:choose>
		</table>
	</form>
</body>
</html>