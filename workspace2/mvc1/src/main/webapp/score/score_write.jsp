<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, com.kosa.mvc1.score.*" %>
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
	String cmd = request.getParameter("cmd");
	String seq = request.getParameter("seq");
	ScoreDTO dto = (ScoreDTO)request.getAttribute("dto");
	//seq는 modify에 필요한 파라메터
	if(dto == null){
		dto = new ScoreDTO();
	}

%>
	<%@include file="/include/navbar.jsp" %>
<!-- 메뉴 -->
<form name = "myform" method = "post">
	<input type="hidden" name="cmd">
	<input type="hidden" name="seq">

<div class="container mt-3">
  <h3>학생 점수 입력</h3>
 
   <table class="table">
   	<colgroup>
   		<col width="30%">
   		<col width="30%">
   		<col width="30%">
   		<col width="30%">
   	</colgroup>
    <tbody>
      <tr>
        <th>이름</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" placeholder="이름을 입력하세요"
			    name="name" id="name" value="<%=dto.getName() %>">
			 </div>
        </td>
      </tr>
      <tr>
        <th>국어점수</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" placeholder="국어점수를 입력하세요"
			    name="korean" id="korean" value="<%=dto.getKor()%>">
			 </div>
        </td>
      </tr>
      <tr>
        <th>수학점수</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" placeholder="수학점수를 입력하세요"
			    name="math" id="math" value="<%=dto.getMat()%>">
			 </div>
        </td>
      </tr>
      <tr>
        <th>영어점수</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" placeholder="영어점수를 입력하세요"
			    name="english" id="english" value="<%=dto.getEng()%>">
			 </div>
        </td>
      </tr>
     
      
    </tbody>
  </table>
 </div>


 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" id="btnSave">저장하기</button>
 </div>

</form>
</body>
</html>
<script>
	window.onload=()=>{
		let btnSave = document.getElementById("btnSave");
		btnSave.addEventListener("click", ()=>{
			let frm=document.myform;
			frm.action = "<%=CONTEXT%>/score.do";
			<%if(cmd.equals("write")){%>
				frm.cmd.value="save";
			<%}else{%>
				frm.cmd.value="update";
			<%}%>
			frm.submit();
			})
	}
</script>