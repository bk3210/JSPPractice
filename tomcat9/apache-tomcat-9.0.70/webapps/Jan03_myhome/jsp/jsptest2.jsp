<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- http://localhost:9000/Jan03_myhome/jsp/jsptest2.jsp?limit=5 -->
<%
	String sLimit = request.getParameter("limit");
	int i;
	int limit=Integer.parseInt(sLimit);
	for(i=1; i<=limit; i++){
		out.print("i="+i+"<br/>");		
	}
%>
</body>
</html>