<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*, com.kosa.mvc1.guestbook.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
<%
String seq = request.getParameter("seq");
%>
<form name="myform" >
	<input type="hidden" name="seq" value="<%=seq%>">
	<input type="hidden" name="cmd">
	
<!-- 메뉴 -->

<%@include file="/include/navbar.jsp" %>



<div class="container mt-3">
  <h3>게시판 상세보기</h3>
  <p></p>
  
  <%
  GuestbookDTO dto = (GuestbookDTO)request.getAttribute("dto");
  %>
   <table class="table">
   	<colgroup>
   		<col width="15%">
   		<col width="18%">
   		<col width="15%">
   		<col width="18%">
   		<col width="15%">
   		<col width="18%">
   	</colgroup>
    <tbody>
      <tr>
        <th>제목</td>
        <td colspan="5">
        	 <%=dto.getTitle()%>
        </td>
      </tr>
      <tr>
        <th>작성자</td>
        <td>
        	<%=dto.getM_name()%>
        </td>
        <th>작성일</td>
        <td>
        	<%=dto.getWdate()%>
        </td>
         <th>조회수</td>
        <td>
        	<%=dto.getHit()%>
        </td>
      </tr>
      <tr>
        <th>내용</td>
        <td colspan="5" style="word-break:breake-all">
        	 <%=dto.getContents().replaceAll("\n", "<br/>")%>
        	 
        </td>
      </tr>
      
      
    </tbody>
  </table>
 </div>


 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" id="btnList">목록</button>&nbsp;&nbsp;
	<%if(dto.getWriter().equals(session.getAttribute("m_userid"))){%>
	<button type="button" class="btn btn-primary" id="btnModify">수정</button>&nbsp;&nbsp;
	<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
	<%}%>
 </div>

 </form>
  
</body>
</html>

<script>
window.onload=()=>{
	let btnList = document.getElementById("btnList");
	btnList.addEventListener("click", ()=>{
		var frm = document.myform;
		frm.action="<%=CONTEXT%>/guestbook.do";
		frm.cmd.value="list";
		frm.submit();
	});
	
	<%if(dto.getWriter().equals(session.getAttribute("m_userid"))){%>
	let btnModify = document.getElementById("btnModify");
	btnModify.addEventListener("click", ()=>{
		var frm = document.myform;
		frm.action="<%=CONTEXT%>/guestbook.do";
		frm.cmd.value="modify";
		frm.submit();
	});
	<%}%>
}
</script>

