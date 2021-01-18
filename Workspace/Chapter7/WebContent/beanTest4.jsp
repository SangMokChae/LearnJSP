<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8"); //한글 변환
%>
<jsp:useBean id="beantest" class="test.BeanTest2" scope="page" />
<%--<jsp:setProperty property="*" name="beantest" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBean Test</title>
</head>
<body>
	<%-- <h1>자바빈 속성 값 출력</h1>
	<b>이름 : </b><%=beantest.getName() %><br />
	<b>주소 : </b><%=beantest.getAddr() %><br />
	<b>이메일 주소 : </b><%=beantest.getEmail() %><br />
	<b>생년월일 : </b><%=beantest.getBirthday() %><br /> --%>
	
	<b>이름 : </b><span>${param.name }</span><br />
	<b>주소 : </b><span>${param.addr }</span><br />
	<b>이메일 주소 : </b><span>${param.email }</span><br />
	<b>생년월일 : </b><span>${param.birthday }</span><br />
</body>
</html>