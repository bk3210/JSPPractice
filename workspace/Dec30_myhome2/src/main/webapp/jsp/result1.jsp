<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 값을 받는 곳 -->
<%
	int x = Integer.parseInt(request.getParameter("xvalue").toString());
	int y = Integer.parseInt(request.getParameter("yvalue").toString());
%>
<h1><%=x%>+<%=y %>=<%=x+y %></h1>

</body>
</html>