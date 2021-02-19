<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int board_num = (Integer)request.getAttribute("board_num"); // 만약 Controller에서 String 값으로 넘겨주면 (String) board_num = (String)request.getAttribute("board_num");으로 해야한다.
	String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style>
	#passForm {
		width: 400px;
		margin: auto;
		border: 1px solid orange;
	}
	
	table {
		width: 100%;
	}
	
	td {
		text-align: center;
	}
</style>
</head>
<body>
	<section id="passForm">
		<form name="deleteForm" action="boardDeletePro.bo?board_num=<%=board_num %>" method="post">
			<input type="hidden" name="page" value="<%=nowPage %>" />
			<table>
				<tr>
					<td><label>글 비밀번호 : </label></td>
					<td><input name="board_pass" type="password"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="삭제" />&nbsp;&nbsp;
						<input type="button" value="돌아가기" onClick="javascript:history.go(-1)" />
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>