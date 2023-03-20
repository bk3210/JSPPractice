<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<%	// 이 칸 안에서만 자바 코드를 쓸 수 있다
	String hello = "안녕하세요 JSP입니다.";
%>
<h1><%=hello%></h1>
<a href="<%=request.getContextPath()%>/practice1.jsp">practice1</a>
</body>
</html>