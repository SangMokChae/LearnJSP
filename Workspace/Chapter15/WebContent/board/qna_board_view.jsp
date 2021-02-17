<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardBean" %>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
	if(nowPage == null) nowPage = "1"; // nowPage값이 안넘어 올 경우에 기준 1 page로 지정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style>
	#articleForm {
		width: 500px;
		height: 500px;
		border: 1px solid red;
		margin: auto;
		padding: 10px;
	}
	
	h2 {
		text-align: center;
	}
	
	#basicInfoArea {
		height: 40px;
		text-align: center;
	}
	
	#articleContentArea {
		background: rgba(255,165,0, 0.21);
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto;
	}
	
	#commandList {
		margin: auto;
		width: 500px;
		text-align: center;
	}
</style>
</head>
<body>
	<!-- 게시판 수정 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제목 : <%=article.getBoard_subject() %>
			첨부파일 : <%if(!(article.getBoard_file() == null)) { %>
				<a href="file_down?downFile=<%=article.getBoard_file() %>"> <%=article.getBoard_file() %></a>
				<%} %>
		</section>
		<section id="articleContentArea">
			<%=article.getBoard_content() %>
		</section>
	</section>
	<section id="commandList">
		<a href="boardReplyForm.bo?board_num=<%=article.getBoard_num() %>&page=<%=nowPage %>">[답변]</a>&nbsp;
		<a href="boardModifyForm.bo?board_num=<%=article.getBoard_num() %>&page=<%=nowPage %>">[수정]</a>&nbsp;
		<a href="boardDeleteForm.bo?board_num=<%=article.getBoard_num() %>">[삭제]</a>&nbsp;
		<a href="boardList.bo?page=<%=nowPage %>">[목록]</a>&nbsp;&nbsp;
	</section>
</body>
</html>