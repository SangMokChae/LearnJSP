<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String[] num = request.getParameterValues("num"); //배열로 받을때
	String[] name = request.getParameterValues("name");
	
	Connection conn = null;
	String sql ="insert into student values(?, ?)"; // ?를 사용해서 임의값으로 설정 / 무조건 data값 대신에 ?
	PreparedStatement pstmt = null;
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		
		for (int i = 0; i < num.length; i++) {
			pstmt.setInt(1, Integer.parseInt(num[i])); 
			pstmt.setString(2, name[i]); // 위치에 값을 넣기
			if(pstmt.executeUpdate() != 0) {
				out.println("<h3>" +num[i] +"번 레코드를 등록하였습니다.</h3>");
			}
		}
	} catch(Exception e) {
		out.println("<h3>레코드 등록에 실패하였습니다.</h3>");
		e.printStackTrace();
	}
	finally {
		try {
			pstmt.close();
			conn.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	System.out.println(name);
	System.out.println(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB check</title>
</head>
<body>
</body>
</html>