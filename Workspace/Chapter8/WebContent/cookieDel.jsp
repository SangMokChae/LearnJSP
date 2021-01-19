<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	String name = request.getParameter("cname");

	if(cookies != null) {
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals(name)) {
				cookies[i].setMaxAge(0); //cookie의 시간을 0으로 한다.
				response.addCookie(cookies[i]); //응답 헤더에 추가
			}
		}
	} / 모든 쿠키 삭제 */ 
	
	// 특정 쿠키 삭제 덮어쓰기 같은 기능
	String name = request.getParameter("cname");
	Cookie cookie;
	
	if(name != null) {		
		cookie = new Cookie(name, null);
		cookie.setMaxAge(0);
	} else {
		cookie = new Cookie("name", "홍길동");				
	}
		response.addCookie(cookie);
		response.sendRedirect("cookieTest2.jsp");
		
	/* 
		String name = request.getParameter("cname");
		
		if(name != null) {
			Cookie cookie = new Cookie(name, "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
	*/
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