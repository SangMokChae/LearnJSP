<%@page import="vo.FileValue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %> <!-- import부분은 복붙해서 자주 사용하자 -->
<%
	String uploadPath = application.getRealPath("/upload");
	int size = 10*1024*1024;
	
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
			new DefaultFileRenamePolicy());
	
	String name = multi.getParameter("name");
	String subject = multi.getParameter("subject");
		
	ArrayList<FileValue> list = new ArrayList<>(); //FileValue를 담기 위한 arraylist 생성;
	Enumeration files = multi.getFileNames();//모든 파일이 다넘어오기 위해 사용
	while(files.hasMoreElements()) {
		//정확한 태그 값을 알기 어렵다. 그래서 fileValue class를 만들어 준다.
		FileValue fv = new FileValue();
		String file = (String)files.nextElement(); //파일을 받는다. 형변화 필수
		fv.setFileName(multi.getFilesystemName(file));
		fv.setOrigfileName(multi.getOriginalFileName(file));
		list.add(fv);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<form action="multiFileCheck.jsp" name="filecheck" method="post">
		<input type="hidden" name="name" value="<%=name %>" >
		<input type="hidden" name="subject" value="<%=subject %>" >
	<% for(int i=0; i < list.size(); i++) { %>
		<input type="hidden" name="filename1" value="<%= list.get(i).getFileName()%>" >
		<input type="hidden" name="origfilename1" value="<%= list.get(i).getOrigfileName() %>" >
	<% } %>
	
	<%-- while(files.hasMoreElements()) { 
		String file = (String)files.nextElement();
	%>
		<input type="hidden" name="filename1" value="<%= multi.getFilesystemName(file) %>">
		<input type="hidden" name="origfilename1" value="<%= multi.getOriginalFileName(file) %>">
	<%} --%>	
	</form>
	<a href="#" onclick="filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>