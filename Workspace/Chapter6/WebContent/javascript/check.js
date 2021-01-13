function init() {
	let j = document.forms["j_form"];
	
	
	if(j.id.value.trim()=="" || j.id.value==null) {
		alert("아이디를 입력하세요!");
		j.id.focus();
		return false;
	} else if(j.passwd.value.trim()=="" || j.passwd.value==null) {
		alert("비밀번호를 입력하세요!");
		j.passwd.focus();
		return false;
	} else if(j.name.value.trim()=="" || j.name.value==null) {
		alert("이름을 입력하세요!");
		j.name.focus();
		return false;
	} else if (j.tel.value.trim()=="" || j.tel.value==null) {
		alert("전화번호를 입력하세요");
		j.tel.focus();
		return false;
	}else {
		alert("저장되었습니다.");
		location.href="template.jsp?page=login";
	}
}


init();