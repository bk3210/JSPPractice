<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="myform" action="/Jan03_myhome/weekpay">
		이름 : <input type="text" name="name"><br />
		주당 근무시간 : <input type="text" name="time"><br />
		시급 : <input type="text" name="money"><br />
		<button type="button" id="result">결과확인</button>

	</form>

</body>
</html>
<script>
	window.onload=()=>{
		let btnResult=document.getElementById("result");

	
	btnResult.addEventListener("click", (e)=>{
		let frm=document.myform;
		if(frm.name.value.trim()==""){
			alert("이름은 필수입니다");
			frm.name.focus();
			return false;
		}
		
		if(frm.time.value.trim()==""){
			alert("근무시간은 필수입니다");
			frm.time.focus();
			return false;
		}
			
		if(frm.money.value.trim()==""){
			alert("시급은 필수입니다");
			frm.money.focus();
			return false;
			
		}
			frm.submit();
	});
		}
</script>