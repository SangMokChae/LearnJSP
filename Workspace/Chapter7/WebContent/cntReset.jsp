<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty property="cnt" name="testsession" value="0" /> <!-- set을 사용하여 값을 재할당한다. / sessionScope의 testsession을 불러온 것 -->
	<script>
		location.href="<%=request.getParameter("page") %>.jsp";
	</script>
</body>
</html>