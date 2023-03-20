<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>계산기</h1>
	<form name="myform"><!-- html 요소는 폼태그 안에 들어가 있지 않으면 데이터를 전송할 수 없음 -->
	<!-- 정보를 담을 수 있는 태그는 input, select, textarea 태그 -->
	<!-- 받아온 정보는 javascript 메서드로 처리함 -->

	<input type="hidden" name="operator"/>	<!-- 값이 전달되는 것을 숨김 -->
		x : <input type="text" name="xvalue"/><br/>
		y : <input type="text" name="yvalue"/><br/>
		
		<button type="button" onclick="goSend('1')">더하기</button>&nbsp;
		<button type="button" onclick="goSend('2')">빼기</button>&nbsp;
		<button type="button" onclick="goSend('3')">곱하기</button>&nbsp;
		<button type="button" onclick="goSend('4')">나누기</button>&nbsp;
		<br/>
	</form>
</body>
</html>

<script>
	function goSend(oper)
	{
		var frm=document.myform;	//myform 정보를 담아서 저장하고 있는 객체 frm
		frm.operator.value = oper;
		frm.action="<%=request.getContextPath()%>/jsp/result2.jsp";
		frm.method="POST";
		frm.submit();
	}
</script>