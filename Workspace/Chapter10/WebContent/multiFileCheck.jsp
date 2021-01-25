<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String[] filename = request.getParameterValues("filename1"); //배열로 받을때는 parameterValues
	String[] origfilename = request.getParameterValues("origfilename1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	올린 사람 : <%=name %><br />
	제목 : <%=subject %><br />
	<% for(int i = 0; i < filename.length; i++) { %> <!-- 모든 파일이 filename이라는 이름이라서 for 문을 사용한다. -->
	파일명 : <a href="file_down.jsp?file_name=<%=filename[i]%>"><%=origfilename[i] %></a><br />
	<% } %>
</body>
</html>