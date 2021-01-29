<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;
	String sql = "select * from student";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		//커서 임의 조정
		pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); //커서를 움직이기 위해서는 이게 필요하다. / 뒤의 값은 변경 가능하다.
		rs = pstmt.executeQuery();
		
		// next()없이 사용
		rs.last();
		out.println(rs.getInt(1) +"," +rs.getString(2) +"<br />");
		rs.first();
		out.println(rs.getInt(1) +"," +rs.getString(2) +"<br />");
		rs.absolute(3);
		out.println(rs.getInt(1) +"," +rs.getString(2) +"<br />");		
	} catch (Exception e) {
		out.println("<h3>데이터 가져오기에 실패하였습니다.</h3>");
		e.printStackTrace();
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>