<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>

<%
	String fileName = request.getParameter("file_name"); //이 이름으로 넘겨줌

	String savePath = "upload";
	ServletContext context = getServletContext();
	String sDownloadPath = context.getRealPath(savePath); // <-가능한 이렇게 적자 || application.getRealPath(); 
	String sFilePath = sDownloadPath + "\\" +fileName;
	byte b[] = new byte[4096];
	FileInputStream in = new FileInputStream(sFilePath);
	String sMimetype = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType>>>" +sMimetype); //생략 가능 / 위치로 나오는 구간은 tomcat의 임시 보관소 같은 기능이다
	
	if (sMimetype == null) {
		sMimetype = "application/octet-stream";
	}
	
	response.setContentType(sMimetype);
	String agent = request.getHeader("User-Agent"); //브라우저 정보가 들어있다.
	boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);
	
	if (ieBrowser) { //익스플로러 브라우저인지 확인
		fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	} else {
		fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
	}
	
	response.setHeader("content-Disposition", "attachment; filename= " +fileName);
	
	ServletOutputStream out2 = response.getOutputStream(); //내장객체와의 충돌방지용 2이름
	int numRead;
	
	while ((numRead = in.read(b, 0, b.length)) != -1) {  //크기 확인
		out2.write(b, 0, numRead);
	}
	out2.flush(); 
	out2.close(); // 꼭 닫아 줘야 한다.
	in.close();
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