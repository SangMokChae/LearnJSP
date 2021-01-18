<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page" /> <!-- jsp 파일 호출 -->
<jsp:setProperty property="name" name="beantest" value="BeanTest!"/>
<!-- value를 통해 name=(jsp:usebean id="beantest")의 속성값을 BeanTest!로 변경 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaBean Test</title>
</head>
<body>
	<b>자바빈 사용 예제</b>
	<h3><%=beantest.getName() %></h3>
	
	<h3>${beantest.name}</h3>
	<!-- ${beantest.name} 은 위의 id값=beantest를 받아와서 그안에서의 name을 호출하는 형식이다. / spring에서 주로 사용하는 방식 -->
</body>
</html>