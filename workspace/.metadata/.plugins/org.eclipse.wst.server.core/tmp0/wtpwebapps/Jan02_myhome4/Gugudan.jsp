<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	몇 단? <br/>
	<input type="text" name="wdan" id="wdan">
	<button id="btnPress" type="button">구구단</button>
	
	<div id="result"></div>

</body>
</html>
<script type="text/javascript">
// 자바스크립트는 scanner, println이 없으니까
window.onload=()=>{
	var btnPress=document.getElementById("btnPress");
	btnPress.addEventListener("click", ()=>{
		console.log("얌");
		result="";
		var dan=document.getElementById("wdan").value;
		for(i=1; i<10; i++){
			result += dan + "X" + i + "=" + (dan*i) + "<br/>";
		}
		document.getElementById("result").innerHTML = result;
	})
}
	/* function gugudan() {
		var dan = document.getElementById("wdan");
			for(i=1; i<10; i++){
				console.log(dan * i);
		}
	} */
</script>