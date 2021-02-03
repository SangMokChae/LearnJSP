<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 선행처리
	if(session.getAttribute("id") == null || (!((String)session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("alert('관리자로 로그인 하세요.')");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	String mod_id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age") == null ||
			request.getParameter("age").trim().equals("") ?  "0" : request.getParameter("age").trim()); // 값이 없거나 null 일 경우에는 0의 값을 대입한다. /ex) 빈값을 넣었을때는 비밀번호는 0이 된다.
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "update member set password=?, name=?, age=?, gender=?, email=? where id = ?";
	// +" email=? where id = ?";
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		// transaction 사용
		conn.setAutoCommit(false); // transaction 실행		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pass);
		pstmt.setString(2, name);
		pstmt.setInt(3, age);
		pstmt.setString(4, gender);
		pstmt.setString(5, email);
		pstmt.setString(6, mod_id);
		
		int result = pstmt.executeUpdate(); // sql값을 위의 값을 대입하여 업데이트 시켜주는 역활
		
		if(result > 0) {
			conn.commit(); // 위에서 autoCommit을 여기서 다시금 활성화 시켜 준다 / 값이 참일 경우 
			out.println("<script>");
			out.println("alert('정보가 수정되었습니다.')");
			out.println("location.href='member_info.jsp?id=" +mod_id +"'");
			out.println("</script>");
		}else {
			conn.rollback();
			out.println("<script>");
			out.println("alert('정보 수정이 실패하였습니다. 다시 시도해 보세요.')");
			out.println("history.back();");
			out.println("</script>");			
		}
	} catch (Exception e) {
		e.printStackTrace();
		if(conn != null) {
			conn.rollback();
			out.println("<script>");
			out.println("alert('오류가 발생하였습니다. 다시 시도해 보세요.')");
			out.println("history.back();");
			out.println("</script>");			
		}
	} finally {
		try {
			if (pstmt != null) {				
				pstmt.close();
			}
			if (conn != null) {			
				conn.close();
			}
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