<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#uploadFormArea {
		margin: auto;
		width: 400px;
		border: 1px solid black;
	}
	.td_title {
		font-size: xx-Large;
		text-align: cneter;
	}
</style>
<script>
	var cnt = 1;
	var oTb1; //Row추가
	
	function insRow() {
		cnt++;
		oTb1 = document.getElementById("addTable");
		var oRow = oTb1.insertRow(); // 행을 삽입하는 js코드
		oRow.onmouseover = function() {
			oTb1.clickedRowIndex = this.rowIndex
		}; // clickedRowIndex - 클릭한 Row의 위치를 확인
		var oCell1 = oRow.insertCell(); // table 안에 열(Row)을 추가하는 js 코드
		var oCell2 = oRow.insertCell(); 
		//삽일될 Form Tag		
		var frmTag1 = "<label for='fileName" +cnt +"'>파일명 : </label>";
		var frmTag2 = "<input type='file' name='fileName" +cnt +"' id='fileName" +cnt +"'>";
		frmTag2 += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
		oCell1.innerHTML = frmTag1 //입력창 추가를 누르면 tag가 생성되는 것처럼 보이는 것
		oCell2.innerHTML = frmTag2
	}
	// Row 삭제
	function removeRow() {
		oTb1.deleteRow(oTb1.clickedRowIndex); //this.rowIndex를 잡아 주는 부분
	}
	
	function frmCheck() {
		var frm = document.f;
		for(var i = 0; i <= frm.elements.length - 1; i++) {
			if(frm.elements[i].name.indexOf("fileName") > -1) {
				if(!frm.elements[i].value) {
					alert("업로드 할 파일을 선택하세요");
					frm.elements[i].focus();
					return false;
				}
			}
		}
	}
</script>
<title>파일 업로드 폼</title>
</head>
<body>
	<section id="uploadFormArea">
		<form action="multiFileUpload.jsp" name="f" method="post" enctype="multipart/form-data" onsubmit="return frmCheck()">
			<table width="100%">
				<tr>
					<td colspan="2" class="td_title">파일 업로드 폼</td>
				</tr>
				<tr>
					<td><label for="name">올린 사람 : </label></td>
					<td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td><label for="subject">제목 : </label></td>
					<td><input type="text" name="subject" id="subject"></td>
				</tr>
				<tr>
					<td colspan="2">
						<table id="addTable" border="1">
							<tr>
								<td><label for="fileName1">파일명 : </label></td>
								<td><input type="file" name="fileName1" id="fileName1"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="업로드">
					</td>
				</tr>
			</table>
		</form>
		<input type="button" name="addButton" style="cursor:pointer" onClick="insRow()" value="입력창 추가">
	</section>
</body>
</html>