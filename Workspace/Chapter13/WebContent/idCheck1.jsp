<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String openInit = "false"; // 기본 id값이 넘오도록 도움
	if(request.getParameter("openInit") != null) {
		openInit = "true";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<body onload="init()"> <!-- 페이지가 열릴때 init()함수를 호출 -->
	<form action="idCheck1.jsp" method="post" name="f">
		<input type="text" name="id" id="id"/>
		<input type="submit" value="중복확인" />
	</form>
	
	<script>
	function init() {
		if(<%= openInit%>) { //초기에만 사용  넘어오는 값 처리
			document.getElementById("id").value=opener.document.getElementById("id").value;
			// opener새창을 열도록 도와준 기존의 창
		}
	}
	function ok(v) {
		opener.idcheck = v.trim();
		opener.document.getElementById("id").value=v;
		opener.chkId = true; //joinForm.jsp 의 아이디 중복확인을 찾기 위해서 사용
		window.close();
	}
</script>

<%
	if(request.getParameter("id") != null && !request.getParameter("id").trim().equals("")) { //id의 값이 null인지 비었는지 확인
	
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
				out.print("<h3>" +chk_id +"를 사용하실수 없습니다.</h3>");						
			} else {
				out.print("<h3>" +chk_id +"를 사용하실수 있습니다. </h3>");
				out.print("<a href='#' onclick=\"ok('" +chk_id +"')\">사용하기</a></h3>");
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
	}
%>
</body>
</html>