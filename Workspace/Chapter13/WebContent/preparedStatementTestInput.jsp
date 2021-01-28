<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script language="javascript">
	var oTb1;
	
	function insRow() {
		oTb1 = document.getElementById("addTable");
		var oRow = oTb1.insertRow();
		oRow.onmouseover = function() {
			oTb1.clickedRowIndex = this.rowIndex
		};
		var oCell = oRow.insertCell();

		var frmTag = " 번호 : <input type=text name=num id=num>";
		frmTag += " 이름 : <input type=text name=name id=name>";
		frmTag += " <input type=button value=삭제  onClick=removeRow() style=cursor:hand> ";
		oCell.innerHTML = frmTag;
	}
	
	function removeRow() {
		oTb1.deleteRow(oTb1.clickedRowIndex);
	}
	
	function frmCheck(f) {
		for(var i = 0; i <= f.elements.length - 1; i++) {
			if(f.elements[i].name == "num") {
				if (f.elements[i].value == "") {
					alert("업로드 할 파일을 선택하세요");
					f.elements[i].focus();
					return false;
				}
			}
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<form action="preparedStatementTest.jsp" method="post" onsubmit="return frmCheck(this);">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="#ffffff" height="25" align="left">
					<input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="입력창 추가" >
				</td>
			</tr>
			<tr>
				<td height="25">
					<table id="addTable" cellspacing="0" cellpadding="0" bgcolor="#ffffff" border="0">
						<tr>
							<td>
								번호 : <input type="text" name="num" id="num">
								이름 : <input type="text" name="name" id="name">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" name="button" value="전송" ></td>
			</tr>
		</table>
	</form>
</body>
</html>