<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String name = request.getParameter("cname");
	String value = request.getParameter("cvalue");
	// 가장먼저 parameter로 값을 가져오는 것을 우선으로 해야한다.
	
	//Cookie cookie = new Cookie(name, value);
	// 쿠키생성하고 변수로 위의 name과 value를 지정한다.
	
	Cookie cookie;
	
	if(name != null && value != null) {
		cookie = new Cookie(name, value);
	} else {
		cookie = new Cookie("name", "홍길동");
	}
	
	response.addCookie(cookie);
	response.sendRedirect("cookieTest2.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		location.href="cookieTest2.jsp";
	</script>
</body>
</html>