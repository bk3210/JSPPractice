<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String xValue = request.getParameter("xValue");
String yValue = request.getParameter("yValue");
int x = Integer.parseInt(xValue);
int y = Integer.parseInt(yValue);
%>
<%=
String.format("%d + %d = %d", x, y, x+y)
%>