<%@page import="java.net.CookieStore"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "";
	String value = "";
	String cookie = request.getHeader("Cookie");
	
	if(cookie != null) {
		Cookie cookies[] = request.getCookies();
		
		for(int i = 0; i < cookies.length; i++) {
			// if(cookies[i].getName().equals("name")) {			
				// name = cookies[i].getName();
				// value = cookies[i].getValue();
			// }
			out.println("<h2>쿠키 이름 = <b>" +cookies[i].getName()+"</b></h2>");
			out.println("<h2>쿠키 값 = <b>" +cookies[i].getValue()+"</b></h2>");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Test</title>
</head>
<body>
	<%-- <h2>쿠키 이름 = <%=name %></h2>
	<h2>쿠키 값 = <%=value %></h2> --%>
	<form action="cookieModify.jsp" name="fix" method="get">
		<span>쿠키 선택 : </span>
		<select name="cname">
			<%for(int i=0; i < cookies.length; i++) {
				if(!cookies[i].getName().equals("JSESSIONID")) {%>
				<!-- jsessionID는 내가 변경이 불가능 한 값이다.   -->
			<option value="<%=cookies[i].getName() %>"><%=cookies[i].getName() %></option>
			<%}}%>
		</select>
		<span>변경 값 : </span>
		<input type="text" name="cvalue" /><br />
		<input type="submit" value="쿠키 수정하기" />
		<input type="submit" value="쿠키 삭제하기" onclick="fix.action='cookieDel.jsp';fix.submit();">
	</form>
	<br />
	<a href="javascript:fix.submit();">name에 쿠키 값 수정하기</a> <!-- form의 자바스크립트 -->
	<a href="javascript:fix.action='cookieDel.jsp';fix.submit();">쿠키 삭제하기</a>
	<!-- javascript action으로 처리한다. -->
<%} %>
</body>
</html>