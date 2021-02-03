<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String chk_id = request.getParameter("id");
	
	//DB객체 생성
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // 결과 확인 객체 // select문 사용시에만 넣고 아니면 빼도 됨
	
	String sql = "select * from member where id=?";
	
	try {
		DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection(); 
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, chk_id);
		rs = pstmt.executeQuery(); //select값이라서 rs값으로 한다. update같은 경우는 .setstring 등등을 쓰면 된다.
		
		if(rs.next()) { // rs.next() 값이 no이면 db에 같은 아이디가 존재한다. // yes면 db에 같은 id가 존재하지 않는다.
			response.sendRedirect("idCheck.jsp?chk_id="+chk_id+"&useble=no");
		} else {
			response.sendRedirect("idCheck.jsp?chk_id="+chk_id+"&useble=yes");			
		}
	} catch (Exception e) {
		e.printStackTrace(); // 에러가 안떠서 답답하게 된다.
	} finally {
		try {
			if(rs != null) { rs.close(); }
			if(pstmt != null) { pstmt.close(); }
			if(conn != null) { conn.close(); }
		} catch (Exception e) {
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