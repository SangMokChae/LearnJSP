<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>단일 파일 업로드 테스트</h1>
	<form action="partUploadPro2" method="post" enctype="multipart/form-data"> <!-- enctype 띄워쓰기 금지  / action="partUploadPro가 servlet-webServlet안에 들어가야 된다.-->
		<label for="writer">작성자 : </label>
		<input type="text" name="writer" id="writer"><br />
		<label for="partFile1">업로드 파일1 : </label>
		<input type="file" name="partFile1" id="partFile1"><br />
		<label for="partFile1">업로드 파일2 : </label>
		<input type="file" name="partFile2" id="partFile2"><br />
		<input type="submit" value="단일업로드" />
	</form>
</body>
</html>