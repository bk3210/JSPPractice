<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.kosa.mvc1.guestbook.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Guestbook</h1>
	
	<%
	// System.out.println : 콘솔에 출력, 디버깅용
	// out.println : 브라우저에 출력
	List<GuestbookDTO> list = (List<GuestbookDTO>)request.getAttribute("list");
	%>
	
	<table>
	<% 
	for(GuestbookDTO dto : list){
	%>
	<tr>
		<td>
		<a href="/mvc1/guestbook.do?cmd=view&seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></td>
		<td><%=dto.getWriter()%></td>
		<td><%=dto.getContents()%></td>
		<td><%=dto.getWdate()%></td>
		<td><%=dto.getHit()%></td>
	<%
	}
	%>
	</table>
</body>
</html>