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
//forward  로 페이지 이동이 되면 이전 페이지에서 받았던 파라미터도 가져온다 
String cmd=request.getParameter("cmd");
String seq=request.getParameter("seq");
GuestbookDTO DTO = (GuestbookDTO)request.getAttribute("DTO");
if(DTO==null) //cmd=list -> cmd=write 로 온경우에는  DTO 가 없다.
{
	DTO=new GuestbookDTO(); //비어있는 개체를 하나 만든다. 
}

%>
<form name="myform" method="post">
	<input type="hidden" name="cmd">
	<input type="hidden" name="seq" value="<%=seq%>">
	
<!-- 메뉴 -->

<%@include file="/include/navbar.jsp" %>


<div class="container mt-3">
  <h3>게시판</h3>
  <p></p>
  

   <table class="table">
   	<colgroup>
   		<col width="30%">
   		<col width="*">
   	</colgroup>
    <tbody>
      <tr>
        <th>제목</td>
        <td>
        	 <div class="input-group">
        	
			    <input type="text" class="form-control" placeholder="제목을 입력하세요"
			    name="title" id="title" value="<%=DTO.getTitle()%>">
			 </div>
        </td>
      </tr>
      <tr>
        <th>작성자</td>
        <td>
        	 <div class="input-group">
        	 	<input type="hidden" name="writer" id="writer"
        	 	 value="<%=session.getAttribute("m_userid")%>"
        	 	>
			    <input type="text" class="form-control" placeholder="이름을 입력하세요"
			    name="m_name" id="m_name" readonly 
			    value="<%=session.getAttribute("m_name")%>" >
			    
			 </div>
        </td>
      </tr>
      <tr>
        <th>내용</td>
        <td>
        	 <div class="input-group">
			    <textarea class="form-control" placeholder="내용을 입력하세요"
			    name="contents" id="contents" rows="5"><%=DTO.getContents()%></textarea>
			 </div>
        </td>
      </tr>
      
      
    </tbody>
  </table>
 </div>


 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary"
	id="btnSave">저장</button>
 </div>

 </form>
  
</body>
</html>
<script>
window.onload=()=>{
	let btnSave = document.getElementById("btnSave");
	btnSave.addEventListener("click", ()=>{
		var frm = document.myform;
		frm.action="<%=CONTEXT%>/guestbook.do";
		<%if(cmd.equals("write")){%>
		frm.cmd.value="save";
		<%}else{%>
		frm.cmd.value="update";
		<%}%>
		frm.submit();
	})
}
</script>
