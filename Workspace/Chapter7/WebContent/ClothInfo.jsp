<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="clothInfo" class="mall.ClothInfo" scope="request" />
<jsp:setProperty property="*" name="clothInfo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cloth Information</title>
</head>
<body>
	<h3>옷 정보가 저장되었습니다.</h3>
	<p>--------------------------------</p>
	
	<h1>제품 정보</h1>
	<span>코드 : </span><%=clothInfo.getCode() %><br />
	<span>제품명 : </span><%=clothInfo.getName() %><br />
	<span>가격 : </span><%=clothInfo.getPrice() %><br />
	<span>사이즈 : </span><%=clothInfo.getSize() %><br />
	<span>색상 : </span><%=clothInfo.getColor() %><br />
</body>
</html>