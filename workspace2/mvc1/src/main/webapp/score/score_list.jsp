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
<form name="myform">
	<input type="hidden" name="cmd"	/>
	
<!-- 메뉴 -->

<%@include file="/include/navbar.jsp" %>
<div class="container mt-3">
  <h3>Score 실습</h3>
   <table class="table">
   <colgroup>
   	<col style="*">
   	<col style="15%">
   	<col style="15%">
   	<col style="15%">
   	<col style="15%">
   </colgroup>
    <thead class="table-dark">
      <tr>
      	<th>번호</th>
        <th>이름</th>
        <th>국어</th>
        <th>수학</th>
        <th>영어</th>
        <th>시험일</th>
      </tr>
    </thead>
    <tbody>
    <%
    List<ScoreDTO> list = (List<ScoreDTO>)request.getAttribute("list");
    for(ScoreDTO dto : list){
    String url=CONTEXT + "/score.do?cmd=view&seq=" + dto.getSeq();
    %>
      <tr>
      	<td><%=dto.getSeq() %></td>
        <td><a href="<%=url%>"><%=dto.getName() %></a></td>
      	<td><%=dto.getKor() %></td>
      	<td><%=dto.getMat() %></td>
      	<td><%=dto.getEng() %></td>
      	<td><%=dto.getWdate() %></td>
      </tr>
    <%
    }
    %>
    </tbody>
  </table>
 </div>
 <div class="container" style="text-align:right">
  <ul class="pagination justify-content-center">
  	<li class="page-item"><a class="page-link" href="#">first</a></li>
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item"><a class="page-link" href="#">6</a></li>
    <li class="page-item"><a class="page-link" href="#">7</a></li>
    <li class="page-item"><a class="page-link" href="#">8</a></li>
    <li class="page-item"><a class="page-link" href="#">9</a></li>
    <li class="page-item"><a class="page-link" href="#">10</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
    <li class="page-item"><a class="page-link" href="#">last</a></li>
  </ul>
</div>

 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" id="btnWrite">글쓰기</button>
 </div>
</form>
</body>
</html>
<script>
	window.onload=()=>{
		let btnWrite = document.getElementById("btnWrite");
		btnWrite.addEventListener("click", ()=>{
			let frm = document.myform;
			frm.action = "<%=CONTEXT%>/score.do";
			frm.cmd.value = "write";
			frm.submit();
		});
	}

</script>