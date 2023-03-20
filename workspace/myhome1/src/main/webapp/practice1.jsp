<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int i;
		for(i=1; i<=10; i++){
			out.println(i);
			// System.out.println - 콘솔창에 출력되는 것, 주로 디버깅용으로 사용
			// out.println - 브라우저에 출력되는 것
		}
	%>
</body>
</html>