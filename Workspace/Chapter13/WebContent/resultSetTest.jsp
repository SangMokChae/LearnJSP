<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String sel = ""; //초기값 설정 / 빈값일경우 발생하는 오류때문
	if(request.getParameter("sel") != null) {
		sel = request.getParameter("sel");
	}
	String input = "";
	if(request.getParameter("input") != null) {
		input = request.getParameter("input") +"%"; // 가능하면 앞에 %로 시작하지 말것 / input +%는 앞자리에 시작하는 것을 검색할 수있는 조건이다. 
	}
	
	Connection conn = null;
	
	// String sql = "select * from student where num = ?"; // ? --> num을 기준으로 한 qurry문
	String sql = "select * from student where " +sel +" like ?"; //sel대신 ?는 사용할 수 없다.
	PreparedStatement pstmt = null;
	ResultSet rs = null; // select 사용시에 꼭 이게 필요하다.
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection(); //DB연결 식은 거의 이거와 같다.
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, input); // ?를 1로 잡고 ?에다 값을 대입하는 문구  --> num을 기준
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			out.println("<h3>" +rs.getInt(1) +"," +rs.getString(2) +"</h3>");
		}
	} catch (Exception e) {
		out.println("<h3>데이터 가져오기에 실패하엿습니다.</h3>");
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) {				
				rs.close();
			}
			if(pstmt != null) {			
				pstmt.close();
			}
			if(conn != null) {				
				conn.close();
			} //값이 없을때의 문제를 위해서 null이 아닐 경우를 가정하기
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Oracle은 내부적으로 transaction 이들어 있어서 commit을 해야 확실히 저장이 된다.
	// OracleDB에 값을 입력하고 바로 불러오고 싶다면 commit을 추가로 작성해서 확인 저장을 해야한다.
	// 1.선언 -> 2.입력 -> 3.처리 -> 4.닫기
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