<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="req" class="scope.RequestScopeBean" scope="request" />
<jsp:setProperty property="*" name="req" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>request scope</title>
</head>
<body>
	<!-- 머릿말 -->
	<jsp:include page="scope/header.jsp" />
	
	<hr />
	<h1>머릿말과 꼬릿말을 직접 입력을 해서 설정</h1>
	<form action="requestScope.jsp" method="post">
		머릿말에 들어갈 내용 : <br />
		<textarea rows="2" cols="60" name="header"></textarea><p />
		꼬릿말에 들어갈 내용 : <br />
		<textarea rows="2" cols="60" name="footer"></textarea><p />
		<input type="submit" value="새로고침" />
	</form>
	<hr />
	
	<!-- 꼬리말 -->
	<jsp:include page="scope/footer.jsp" />
</body>
</html>