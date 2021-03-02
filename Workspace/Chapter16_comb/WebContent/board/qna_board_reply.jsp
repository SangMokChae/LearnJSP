<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardBean" %>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style>
	#registForm {
		width: 500px;
		height: 610px;
		border: 1px solid red;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 450px;
	}
	
	.td_left {
		width: 150px;
		background: orange;
	}
	
	.td_right {
		width: 300px;
		background: skyblue;
	}
	
	#commandCell {
		text-align: center;
	}
	
	input[type="text"],
	input[type="password"] {
		width: 295px;
	}
</style>
</head>
<body>
	<!-- 게시판 답변 -->
	<section id="writeForm">
		<h2>답변 글 등록</h2>
		<form action="boardReplyPro.bo" method="post" name="boardform">
			<input type="hidden" name="page" value="<%=nowPage %>" />
			<input type="hidden" name="board_num" value="<%=article.getBoard_num() %>" />
			<input type="hidden" name="board_re_ref" value="<%=article.getBoard_re_ref() %>" /> <%-- 해당글이 참조하고 있는 글번호, 부모 번호 ( 자기 자신일 경우 자신의 글 번호 ) --%>
			<input type="hidden" name="board_re_lev" value="<%=article.getBoard_re_lev() %>" /> <%-- 부모 게시글에 소속된 게시글의 순서 --%>
			<input type="hidden" name="board_re_seq" value="<%=article.getBoard_re_seq() %>" /> <%-- 순서 (최신글을 맨위로 올리기) 확인 /  답글에 답글일 수록 커지는 값 ( 부모:1, 부모에 대한 답글:2, 답글에 대한 답글:3 ) --%>
			<table>
				<tr>
					<td class="td_left">
						<label for="board_name">글쓴이</label>
					</td>
					<td class="td_right">
						<input type="text" name="board_name" id="board_name" />
					</td>
				</tr>
				<tr>
					<td class="td_left">
						<label for="board_pass">비밀번호</label>
					</td>
					<td class="td_right">
						<input type="password" name="board_pass" id="board_pass" />					
					</td>
				</tr>
				<tr>
					<td class="td_left">
						<label for="board_subject">제 목</label>
					</td>
					<td class="td_right">
						<input type="text" name="board_subject" id="board_subject" />					
					</td>
				</tr>
				<tr>
					<td class="td_left">
						<label for="board_content">내 용</label>
					</td>
					<td class="td_right">
						<textarea id="board_content" name="board_content" cols="40" rows="15"></textarea>				
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="답변 글 등록" />&nbsp;
				<input type="reset" value="다시 작성" />
			</section>
		</form>
	</section>
</body>
</html>