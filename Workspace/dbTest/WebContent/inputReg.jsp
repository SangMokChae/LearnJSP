<%@page import="db.JdbcUtil"%>
<%@page import="java.sql.*, javax.sql.*, db.JdbcUtil.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); 
	
	String id = request.getParameter("mem_id");
	String name = request.getParameter("mem_name");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String[] hobby = request.getParameterValues("hobby");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		con = JdbcUtil.getConnection();
		con.setAutoCommit(false); // start transaction - 트랜잭션 실행
		String sql = "insert into mem values(?, ?, ?, ?)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, tel);
		pstmt.setString(4, address);
		
		int insertResult = pstmt.executeUpdate();
		
		if(insertResult > 0) {
			String sql_h = "insert into mem_hobby values(?, ?, ?)";
			
			for(int i = 0; i < hobby.length; i++) {
				int no = 1;
				pstmt = con.prepareStatement("select max(no) from mem_hobby");
				// select m.mem_id, mem_name, tel, address, hobby from mem m left join mem_hobby h on m.mem_id = h.mem_id;
				rs = pstmt.executeQuery();
				
				if(rs.next())no = rs.getInt(1) + 1;
			
				pstmt = con.prepareStatement(sql_h);
				pstmt.setInt(1, no);
				pstmt.setString(2, id);
				pstmt.setString(3, hobby[i]);
				
				pstmt.executeUpdate();
			}
			con.commit();
%>
		<script>
			alert('데이터 입력 되었습니다.');
			location.href="result.jsp";
		</script>
<%
		} else {
			con.rollback();			
%>
		<script>
			alert('데이터 입력 실패');
			history.back();
		</script>
<%
		}
		
	} catch(Exception e) {
		e.printStackTrace();
		if(con != null) con.rollback();
%>
		<script>
			alert('데이터 입력 오류');
			history.back();
		</script>
<%
	} finally {
		if(pstmt != null) { pstmt.close(); }
		if(con != null) { con.close(); }
	}
%>
	<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>전화</td>
		<td>주소</td>
		<td>취미</td>
	</tr>
	<tr>
		<td><p>${param.mem_id }</p></td>
		<td><p>${param.mem_name }</p></td>
		<td><p>${param.tel }</p></td>
		<td><p>${param.address }</p></td>
		<td>
			<p>${paramValues.hobby[0] },
			${paramValues.hobby[1] },
			${paramValues.hobby[2] },
			${paramValues.hobby[3] },
			${paramValues.hobby[4] },
			${paramValues.hobby[5] }</p>
		</td>
	</tr>
	</table>
</body>
</html>