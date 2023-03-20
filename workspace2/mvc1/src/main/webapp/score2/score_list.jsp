<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.kosa.mvc1.score.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Score 실습</h1>
	
	<%
	List<ScoreDTO> list = (List<ScoreDTO>)request.getAttribute("list");
	%>
	
	<table>
	<%
	for(ScoreDTO dto : list){
	%>
	<tr>
	<td>
		<a href="/mvc1/score.do?cmd=view&seq=<%=dto.getSeq()%>"><%=dto.getName()%></a></td>
		<td><%=dto.getKor()%></td>
		<td><%=dto.getMat()%></td>
		<td><%=dto.getEng()%></td>
		<td><%=dto.getWdate()%></td>
		
		<%
	}
		%>
	</table>
</body>
</html>