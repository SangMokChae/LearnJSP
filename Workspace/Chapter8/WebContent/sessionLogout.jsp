<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%session.removeAttribute("id"); %>
<%-- session.invalidate(); / 다 날려 버리기 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <h3>로그아웃 되었습니다.</h3>
	<a href="sessionLogin1.jsp">로그인 페이지로 이동</a> -->
	
	<script>
		alert("로그아웃 되었습니다.");
		location.href="sessionLogin1.jsp"; //로그인 페이지나 메인 페이지 등으로 자동 이동
	</script>
</body>
</html>