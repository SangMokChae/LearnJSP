<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <h2><%=checkStr() %></h2> -->
	<h2><%= hello %></h2>
	<h1><%=getStr()  %></h1>
	<%! int hello = 10;
	private String getStr() {
		str += "테스트입니다.";
		return str;
	}
	private String str="선언문 ";
	private String str1;/*= "JSP 스터디"*/
			
	public String checkStr() {
		if(str1==null) {
			return "no";
		} else {
			return "ok";
		}
	}
	%>
	<%=checkStr() %>
</body>
</html>