<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bookInfo" class="mall.BookInfo" scope="request" />
<jsp:setProperty property="*" name="bookInfo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Information</title>
</head>
<body>
	<h3>책 정보가 저장되었습니다.</h3>
	<p>--------------------------------</p>
	
	<%--
	<h1>제품 정보</h1>
	<span>코드 : </span><%=bookInfo.getCode() %> <br />
	<span>제품명 : </span><%=bookInfo.getName() %> <br />
	<span>가격 : </span><%=bookInfo.getPrice() %> <br />
	<span>페이지수 : </span><%=bookInfo.getPage() %> <br />
	<span>저자 : </span><%=bookInfo.getWriter() %> <br />
	--%>
	
	<%--
	<span>코드 : </span><b> ${param.code } </b><br />
	<span>제품명 : </span><b> ${param.name } </b><br />
	<span>가격 : </span><b> ${param.price } </b><br /> --%>
	
	<h1>제품 정보</h1>
	<jsp:include page="productInfo.jsp" />
	<span>페이지수 : </span><b> ${param.page } </b><br />
	<span>저자 : </span><b> ${param.writer } </b><br />


</body>
</html>