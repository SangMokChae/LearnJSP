<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)request.getAttribute("name");
%>
	<form action="fileCheck.jsp" name="filecheck" method="post">
		<input type="hidden" name="name" value="<%=name %>" >
		<input type="hidden" name="subject" value="${subject }" >
		<input type="hidden" name="filename1" value="${ filename1 }" >
		<input type="hidden" name="filename2" value="${ filename2 }" >
		<input type="hidden" name="origfilename1" value="${ origfilename1 }" >
		<input type="hidden" name="origfilename2" value="${ origfilename2 }" >
	</form>
	<a href="#" onclick="filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
	<!-- C:\Jsp\Workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Chapter10\upload -->
</body>
</html>