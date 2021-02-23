<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.MemberBean" %>
<%
	MemberBean member = (MemberBean)request.getAttribute("member");
%>
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
	<form action="memberModPro.mem" name="modform" method="post">
		<table border=1>
		
		<%if (member != null) { %>
			<tr>
				<td colspan="2" class="td_title">회원 정보 수정 페이지</td>
			</tr>
			<tr>
				<td>아이디 : </td>
				<td><input type="hidden" name="id" value='<%=member.getId() %>'><%=member.getId() %></td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type="text" name="pass" id="pass" value='<%=member.getPass()%>'></td> <%-- jsp부분을 큰따옴표 /바깥부분을 작은따옴표를 사용해야한다. --%>
			</tr>
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name" id="name" value='<%=member.getName()%>'></td>
			</tr>
			<tr>
				<td>나이 : </td>
				<td><input type="text" name="age" id="age" value='<%=member.getAge()%>'></td>
			</tr>
			<tr>
				<td>성별 : </td>
			<%if(member.getGender().equals("남")) {%>
				<td>
					<input type="radio" name="gender" id="gender1" value="남" <%=member.getGender() %> checked/>남 
					<input type="radio" name="gender" id="gender2" value="여" <%=member.getGender() %>/>여
				</td>
			<%} else { %>
				<td>
					<input type="radio" name="gender" id="gender1" value="남" <%=member.getGender() %>/>남 
					<input type="radio" name="gender" id="gender2" value="여" <%=member.getGender() %> checked/>여
				</td>
			<%} %>
			</tr>
			<tr>
				<td>이메일 주소 : </td>
				<td><input type="text" name="email" id="email" value='<%=member.getEmail()%>'></td>
			</tr>
			<tr>
				<td colspan=2>
					<a href="javascript:modform.submit()">수정하기</a>			
					<a href="javascript:modform.reset()">초기화</a>			
					<a href="javascript:history.back()">뒤로가기</a>		
				</td>	
			</tr>
			
			<%} else { %>
			<tr>
				<td colspan='2'>정보가 없습니다.</td>
			</tr>
			<%} %>
		</table>
	</form>
</body>
</html>
