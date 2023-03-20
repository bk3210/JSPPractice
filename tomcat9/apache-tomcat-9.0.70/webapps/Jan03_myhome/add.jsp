    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 태그로 정보를 서블릿에 전달하기</title>
</head>
<body>
<!-- 보낼 정보에 대한 값이 form 안에 들어있어야 input이 동작해서 정보가 전달됨 -->
	<form name="myform">
	<input type="hidden" name="operator" id="operator">
		x : <input type="text" name="x"><br/>
		y : <input type="text" name="y"><br/>
	
		<button type = "button" id="btnAdd">더하기</button><br/>
		<button type = "button" id="btnSub">빼기</button><br/>
		<button type = "button" id="btnMul">곱하기</button><br/>
		<button type = "button" id="btnDiv">나누기</button><br/>
	</form>

</body>
</html>
<script>
	window.onload=()=>{
		let btnAdd=document.getElementById("btnAdd");
		btnAdd.addEventListener("click", goSend);
		btnSub.addEventListener("click", goSend);
		btnMul.addEventListener("click", goSend);
		btnDiv.addEventListener("click", goSend);
		
	}
	
	function goSend(e){
		console.log(e.target);
		if(e.target==btnAdd){
			document.getElementById("operator").value="1";
		}	
		else if(e.target==btnSub){
			document.getElementById("operator").value="2";
		}	
		else if(e.target==btnMul){
			document.getElementById("operator").value="3";
		}	
		else{
			document.getElementById("operator").value="4";
		}	
	
			// e.preventDefault();	// target의 기본 이벤트 동작을 막는다
		let frm = document.myform;
			
		// 입력값이 없을 때를 걸러내기 위한 예외처리
		if(frm.x.value.trim()==""){	//trim 함수 : 데이터 양쪽의 공백을 없앰
			alert("숫자를 입력하세요.");
			frm.x.focus();	// x칸으로 커서를 이동시킨다
			return false;
		}
			
		if(frm.y.value.trim()==""){
			alert("숫자를 입력하세요.");
			frm.y.focus();	// y칸으로 커서를 이동시킨다
			return false;
		}
						
		frm.method="get";
		frm.action="/Jan03_myhome/add";	// 여기서 보낸 요청을 응답할 서블릿 url
		frm.submit();	// 서버로 전송
		// action에 쓴 url이 받아서 get방식으로 전송 처리하겠다는 뜻
	}

</script>