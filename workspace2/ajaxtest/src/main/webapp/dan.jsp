<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<%
		String xValue=request.getParameter("xValue");
		int x = Integer.parseInt(xValue);

		for(int i = 1; i < 10; i++) {
		%>
	<%=
		String.format("%d x %d = %d", x, i, x*i)
	%>
	<br/>
		<%} %>