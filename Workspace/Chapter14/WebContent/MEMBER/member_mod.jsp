<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");

	if((session.getAttribute("id") == null) || (!((String)session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("alert('관리자로 로그인하세요!!')");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	String mod_id = request.getParameter("id");
		
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("select * from member where id=?");
		pstmt.setString(1, mod_id);
		rs = pstmt.executeQuery();
					
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
	<form action="modifyProcess.jsp" name="modform" method="post">
		<table border=1>
			<tr>
				<td colspan="2" class="td_title">회원 정보 수정 페이지</td>
			</tr>
			<%
				if(rs.next()) {
			%>
			<tr>
				<td>아이디 : </td>
				<td><input type="hidden" name="id" value='<%=rs.getString("id") %>'><%=rs.getString("id") %></td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type="text" name="pass" id="pass" value='<%=rs.getString("password")%>'></td> <%-- jsp부분을 큰따옴표 /바깥부분을 작은따옴표를 사용해야한다. --%>
			</tr>
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name" id="name" value='<%= rs.getString("name")%>'></td>
			</tr>
			<tr>
				<td>나이 : </td>
				<td><input type="text" name="age" id="age" value='<%=rs.getInt("age")%>'></td>
			</tr>
			<tr>
				<td>성별 : </td>
				<td>
					<input type="radio" name="gender" id="gender1" value="남" <%=rs.getString("gender").equals("남") ? "checked" : "" %>/>남 
					<input type="radio" name="gender" id="gender2" value="여" <%=rs.getString("gender").equals("여") ? "checked" : "" %>/>여
				</td>
			</tr>
			<tr>
				<td>이메일 주소 : </td>
				<td><input type="text" name="email" id="email" value='<%=rs.getString("email")%>'></td>
			</tr>
			<tr>
				<td colspan=2>
					<a href="javascript:modform.submit()">수정하기</a>			
					<a href="javascript:modform.reset()">초기화</a>			
					<a href="member_list.jsp">뒤로가기</a>		
				</td>	
			</tr>
			<%} else { %>
				<tr>
					<td colspan=2>정보가 없습니다.</td>	
				</tr>
			<%}  %>
		</table>
	</form>
</body>
</html>

<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) {				
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();				
			}
			if(conn != null) {				
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>