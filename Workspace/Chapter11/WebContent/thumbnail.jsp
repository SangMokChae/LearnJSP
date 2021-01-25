<%@page import="javax.media.jai.RenderedOp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.awt.Graphics2D" %>
<%@ page import="java.awt.image.renderable.ParameterBlock" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.media.jai.JAI" %>
<%@ page import="javax.media.jai.RenderableOp" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	ServletContext context = request.getServletContext();
	String imagePath = context.getRealPath("image");
	int size = 1*1024*1024;
	String filename = "";
	
	try {
		MultipartRequest multi = new MultipartRequest(request, imagePath, size, "UTF-8", new DefaultFileRenamePolicy()); // img업로드됨
		
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement();
		filename = multi.getFilesystemName(file);
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	ParameterBlock pb = new ParameterBlock();
	pb.add(imagePath +"/" +filename); //image업로드 경로
	RenderedOp rOp = JAI.create("fileload", pb); // fileload = option 
	
	BufferedImage bi = rOp.getAsBufferedImage(); //bufferedimage 임시 이미지
	BufferedImage thumb = new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);  //썸네일 이미지 크기
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi, 0, 0, 100, 100, null); //bi를 가져와서 크기에 맞춰서 생성
	File file = new File(imagePath +"/sm_" +filename);
	ImageIO.write(thumb, "jpg", file);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 썸네일 예제</title>
</head>
<body>
	-원본 이미지- <br />
	<img src="image/<%=filename %>"><p />
	-썸네일 이미지- <br />
	<img src="image/sm_<%=filename %>" />
</body>
</html>