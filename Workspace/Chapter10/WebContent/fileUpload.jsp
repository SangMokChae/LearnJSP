<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	// request.getServletContext().getReaPath("/upload"); 형식으로 바뀜 // servlet에서 이렇게 사용
	String uploadPath = request.getRealPath("/upload");
	//String uploadPath = application.getRealPath("/upload") -> 자바 9 이후 버전부터 이렇게 사용해야 한다.
	
	int size = 10*1024*1024; // 10mb 의 파일 크기 설정
	String name = "";
	String subject = "";
	String filename1 = "";
	String filename2 = "";
	String origfilename1 = "";
	String origfilename2 = "";
	
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		//MultipartRequest 객체가 생성 될때 파일이 업로드 하기 시작한다 / request포함
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		Enumeration files = multi.getFileNames(); // 파일이 1개 이상일때 이름을 알기 위해
		//Enumeration은 컬렉션이다. +hasmoreElement를 써서 확인하고 쓰는게 좋다. (+while)
		// files.hasMoreElements(); 사용하고 나서 작업을 이어나가는 것이 좋다.
		
		String file1 = (String)files.nextElement(); //return type이 Object라서 형변환을 해주어야 한다.
		filename1 = multi.getFilesystemName(file1);
		origfilename1 = multi.getOriginalFileName(file1);
		
		String file2 = (String)files.nextElement();
		filename2 = multi.getFilesystemName(file2);
		origfilename2 = multi.getOriginalFileName(file2);
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="fileCheck.jsp" name="filecheck" method="post">
		<input type="hidden" name="name" value="<%=name %>" >
		<input type="hidden" name="subject" value="<%=subject %>" >
		<input type="hidden" name="filename1" value="<%=filename1 %>" >
		<input type="hidden" name="filename2" value="<%=filename2 %>" >
		<input type="hidden" name="origfilename1" value="<%=origfilename1 %>" >
		<input type="hidden" name="origfilename2" value="<%=origfilename2 %>" >
	</form>
	<a href="#" onclick="filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
	<!-- onclick에 자바스크립트를 제거하고 [C:\Jsp\Workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Chapter10]위치에 upload폴더를 설치해야한다.  -->
</body>
</html>