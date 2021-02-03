<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String openInit = "false"; // 기본 id값이 넘오도록 도움
	if(request.getParameter("openInit") != null) {
		openInit = "true";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function init() {
		if(<%= openInit%>) { //초기에만 사용  넘어오는 값 처리
			document.getElementById("id").value=opener.document.getElementById("id").value;
			// opener새창을 열도록 도와준 기존의 창
		}
	}
	function ok(v) {
		opener.idcheck = v.trim();
		opener.document.getElementById("id").value=v;
		opener.chkId = true; //joinForm.jsp 의 아이디 중복확인을 찾기 위해서 사용
		window.close();
	}
</script>
</head>
<body onload="init()"> <!-- 페이지가 열릴때 init()함수를 호출 -->
	<form action="idCheckProcess.jsp" method="post" name="f">
		<input type="text" name="id" id="id"/>
		<input type="submit" value="중복확인" />
	</form>
	<% // id체크를 했을경우에 표시하는 값
		if(request.getParameter("chk_id") != null) {
			String chk_id = request.getParameter("chk_id");
			String useble = request.getParameter("useble");
			out.print("<hr>");
			if(useble.equals("yes")) {
				out.print("<h3>" +chk_id +"는 사용 가능한 아이디입니다.");
				out.print("<a href='#' onclick=\"ok('" +chk_id +"')\">사용하기</a></h3>"); // \는 "를 단순 문자로 취급하기 위해 사용
			} else {
				out.println("<h3>" +chk_id +" 는 사용 불가능한 아이디입니다. 다시 검색하세요 </h3>");
			}
		}
	%>
</body>
</html>