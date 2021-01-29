<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "insert into student (num, name) values(51, '홍길동')";
	String sql2 = "select * from student where num = 50";
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection(); // 여기서 넘어가면 connection 객체가 null이 아니게 된다.
		
		conn.setAutoCommit(false); // transaction 사용을 위해서 입력
		
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(sql2);
		pstmt.executeUpdate(); // px 중복 에러를 일으킴
		
		if(!rs.next()) { // 값이 없으면 = false
			conn.rollback(); // 값 50이 없으면
			out.println("<h3>데이터 삽입에 문제가 발생하여 롤백하였습니다.</h3>");
		} else {
			conn.commit();
			out.println("<h3>데이터 삽입이 모두 완료되었습니다.</h3>");
		}
		conn.setAutoCommit(true); // 딱히 필요 없음 / 객체를 만들면 기본 true로 되있기 때문에 여기서는 적을 필요가 없다. 
	} catch (Exception e) {
		out.println("<h3>데이터 삽입에 실패하였습니다.</h3>"); // 여기에도 rollback을 넣어 줘도 됨
		e.printStackTrace();
	} finally {
		try {
			if(rs != null){			
				rs.close();
			}
			if(pstmt != null) {			
				pstmt.close();
			}
			if(conn != null) {				
				conn.close();
			}
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