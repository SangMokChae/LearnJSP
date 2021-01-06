<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 400px;
		border: 1px solid red;
	}
</style>
</head>
<body>
	<h1>Request 예제입니다.</h1>
	
	<%-- <%Enumeration<String> e = request.getParameterNames();
		while(e.hasMoreElements()) {
			out.print(e.nextElement()+"<br>");
		}
	--%>
	
	<table>
		<tr>
			<td>이름</td>
			<td><%= request.getParameter("name") %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<%-- <%if (request.getParameter("gender") != null) --%>
				<%if (request.getParameter("gender").equals("male")) {%> 남자 <%} else {%> 여자<%} %>
				<%//String gender=request.getParameter("gender").equals("male")?"남자":"여자" %>
			</td>
		</tr>
		<tr>
			<td>취미</td>
			<td>
				<%
					String[] hobby = request.getParameterValues("hobby");
					if(hobby != null)
					for(int i=0; i<hobby.length; i++) {
				%>
				<%=hobby[i] %>&nbsp;&nbsp;
				<%} %>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="이전" onclick="location.href='requestTest1_Form.jsp'" id="back">
			</td>				
		</tr>
	</table>
</body>
</html>