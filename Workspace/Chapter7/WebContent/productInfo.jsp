<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pinfo" class="mall.ProductInfo" scope="request" />
<jsp:setProperty property="*" name="pinfo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span>코드 : </span><b><jsp:getProperty property="code" name="pinfo"/></b><br />
	<span>제품명 : </span><b><jsp:getProperty property="name" name="pinfo"/></b><br />
	<span>가격 : </span><b><jsp:getProperty property="price" name="pinfo"/></b><br />
</body>
</html>