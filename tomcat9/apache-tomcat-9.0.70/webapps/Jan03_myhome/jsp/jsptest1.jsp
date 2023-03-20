<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- /webapp/jsp/jsptest1.jsp/
	http://localhost:9000/myhome4
	src/main/webapp이 폴더와 매핑된다
	
	
	http://localhost:9000/Jan03_myhome/jsp/jsptest1.jsp -->

<%
	// 이 안에서 자바코드 작성 가능
	for(int i=1; i<=10; i++){
		out.println("i=" + i + "<br/>");
	}

	// 이 구간에서는 메서드나 클래스 선언이 불가능하다(제어구조만 사용 가능)
%>
</body>
</html>