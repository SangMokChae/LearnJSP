<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardBean" %>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
%>
<%-- nullpoint.. 에러에서 C:\Jsp\Workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\Chapter15\org\apache\jsp\board 여기에 modify를 봐야한다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<script type="text/javascript">
	function modifyboard() {
		modifyform.submit();
	}
</script>
<style>
	#registForm {
		width: 500px;
		height: 600px;
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
	<!-- 게시판 등록 -->
	<section id="writeForm">
		<h2>게시판글수정</h2>
		<form action="boardModifyPro.bo" method="post" name="modifyform">
			<input type="hidden" name="board_num" value="<%=article.getBoard_num() %>" />
			<table>
				<tr>
					<td class="td_left">					
						<label for="board_name">글쓴이</label>
					</td>
					<td class="td_right">
						<input type="text" name="board_name" id="board_name" value="<%=article.getBoard_name() %>" />
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
						<label for="board_subject">제목</label>
					</td>
					<td class="td_right">
						<input type="text" name="board_subject" id="board_subject" value="<%=article.getBoard_subject() %>" />
					</td>
				</tr>
				<tr>
					<td class="td_left">
						<label for="board_content">내용</label>
					</td>
					<td class="td_right">
						<textarea id="board_content" name="board_content" cols="40" rows="15"><%=article.getBoard_content() %></textarea>
					</td>
				</tr>
			</table>
			
			<section id="commandCell">
				<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
				<a href="javascript:history.go(-1)">[뒤로]</a>
			</section>
			<input type="hidden" name="page" value="<%=nowPage %>" /> <%-- nowPage대신 el ${} 사용가능 --%>
		</form>
	</section>
</body>
</html>