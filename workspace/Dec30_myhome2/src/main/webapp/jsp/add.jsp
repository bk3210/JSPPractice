<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="myform">
		x : <input type="text" name="xvalue"/><br/>
		y : <input type="text" name="yvalue"/><br/>
		<!-- onclick : 클릭시 발생하는 이벤트를 정하는 속성 -->
		<button type="button" onclick="goSend()">더하기</button>
	</form>
</body>
</html>
<!-- 자바스크립트는 html이 아니라서 <script></script> 사이에 코드를 두어야 함 -->
<script>
// 함수 만들기 : 자바스크립트의 모든 함수는 function으로 시작함
// 자바스크립트는 변수를 선언하지 않아도 함수 사용이 가능하다
// var or let 변수명 : 변수선언
function goSend()
{
	// form 객체에 대한 참조를 가져온다
	var frm = document.myform;		// document.form의 name속성
	frm.action = "/Dec30_Myhome2/jsp/result1.jsp";
	frm.method="POST";	// post 방식으로 데이터를 전송(안쓰면 걍 get방식이 default), 주소창에 정보가 노출되지 않는다
	frm.submit();	// 서버로 정보 전달
	}
</script>