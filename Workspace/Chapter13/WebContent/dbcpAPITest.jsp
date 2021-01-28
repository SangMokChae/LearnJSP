<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); // jdbc/OracleDB: xml파일의 name과 이름이 같아야 한다.
		conn = ds.getConnection(); //connection 객체 생성
		out.println("<h3>연결되었습니다.</h3>");
		conn.close();
	} catch(Exception e) {
		out.println("<h3>연결에 실패하였습니다.</h3>");
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API Test</title>
</head>
<body>

</body>
</html>