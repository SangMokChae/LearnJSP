<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = null;

	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	} else {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 메인 페이지</title>
</head>
<body>
	<h3><%=id %> 로 로그인 하셨습니다.</h3>
	<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;
	<a href="member_mod.jsp">회원 정보 수정</a>
	<%if (id!= null && id.equals("admin")) {%>
		<a href="member_list.jsp">관리자모드 접속(회원 목록 보기)</a>
	<%} else if(id != null) {%>
		<a href="membe5r_info.jsp?id='<%=(String) session.getAttribute("id") %>'"></a>
	<%} %>
</body>
</html>