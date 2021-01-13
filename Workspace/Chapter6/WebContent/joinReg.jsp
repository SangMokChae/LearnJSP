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
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		session.setAttribute("id", id);
		session.setAttribute("passwd", passwd);
		session.setAttribute("name", name);
		session.setAttribute("tel", tel);
		
		response.sendRedirect("output.jsp");
		
		out.println("<script src='javascript/check.js'> </script>");
	%>
</body>
</html>