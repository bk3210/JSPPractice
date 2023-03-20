<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="myform" action="/Dec30_Myhome2/jsp/receive1.jsp">
		userid : <input type="text" name="userid"	/><br/>
		password : <input type="password" name="password"	/><br/>
		<input type="submit" value="전송">
	</form>
	
	<!-- submit 버튼으로 서버로 정보를 전송하는 form태그의 action 속성이 처리를 담당할 페이지 url을 전달해야 함
	submit 버튼이 아닌 일반 버튼의 경우에는 서버로 정보 전송을 하지 못함(자기 페이지를 다시 불러옴)
	이런 경우에는 자바스크립트를 이용해 서버로 정보를 전송할 수 있다 -->
	

</body>
</html>