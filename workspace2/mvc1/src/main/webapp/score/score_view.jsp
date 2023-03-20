<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.lang.*" %>
<%@ page import = "com.kosa.mvc1.score.*" %>
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

<form name="myform">
	<input type="hidden" name="seq" value="<%=seq %>">
	<input type="hidden" name="cmd">

<%@include file="/include/navbar.jsp" %>
<div class="container mt-3">
  <h3>점수 상세보기</h3>
  <p></p>
	<%
		ScoreDTO dto = (ScoreDTO)request.getAttribute("dto");
	%>  

   <table class="table">
   	<colgroup>
   		<col width="30%">
   		<col width="15%">
   		<col width="15%">
   		<col width="15%">
   		<col width="15%">
   		<col width="15%">
   		<col width="15%">
   	</colgroup>
    <tbody>
      <tr>
        <th>이름</td>
        <td>
        	<%=dto.getName() %>
        </td>
      </tr>
      <tr>
        <th>국어</td>
        <td>
        	<%=dto.getKor() %>
        </td>
      </tr>
      <tr>
        <th>수학</td>
        <td>
        	<%=dto.getMat() %>
        </td>
      </tr>
      <tr>
        <th>영어</td>
        <td>
        	<%=dto.getEng() %>
        </td>
      </tr>
      <tr>
        <th>시험일</td>
        <td>
        	<%=dto.getWdate() %>
        </td>
      </tr>

    </tbody>
  </table>
 </div>

 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" id="btnList">학생목록</button>&nbsp;
	<button type="button" class="btn btn-primary" id="btnModify">점수수정</button>&nbsp;
	<button type="button" class="btn btn-primary" id="btnDelete">점수삭제</button>
 </div>

</form>
</body>
</html>
<script>
	window.onload=()=>{
		let btnlist = document.getElementById("btnList");
		btnList.addEventListener("click", ()=>{
			let frm=document.myform;
			frm.action="<%=CONTEXT%>/score.do";
			frm.cmd.value="list";
			frm.submit();
		});
		
		let btnModify = document.getElementById("btnModify");
		btnModify.addEventListener("click", ()=>{
			let frm=document.myform;
			frm.action="<%=CONTEXT%>/score.do";
			frm.cmd.value="modify";
			frm.submit();
		});
	}

</script>