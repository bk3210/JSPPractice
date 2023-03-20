<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.lang.*" %>
<%@ page import = "com.kosa.mvc1.score.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ScoreDTO dto = (ScoreDTO)request.getAttribute("dto");
%>
<ul>
	<li><%=dto.getName() %></li>
	<li><%=dto.getKor() %></li>
	<li><%=dto.getMat() %></li>
	<li><%=dto.getEng() %></li>
	<li><%=dto.getWdate() %></li>
</ul>

</body>
</html>