<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kosa.mvc1.guestbook.*"%>
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
<form>
	<input type="text" name="idcheck" id="idcheck" value="N">
<!-- 메뉴 -->
<%@include file="/include/navbar.jsp" %>
<div class="container mt-3">
<h3>아이디 찾기</h3>
   <table class="table">
   	<colgroup>
   		<col width="30%">
   		<col width="*">
   	</colgroup>
    <tbody>
      <tr>
        <th>이름</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" 
			    placeholder="이름을 입력하세요"
			    name="m_name" id="m_name">
			 </div>
        </td>
      </tr>
      <tr>
        <th>이메일</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" 
			    placeholder="가입시 입력했던 이메일을 입력하세요"
			    name="m_email" id="m_email">
			 </div>
        </td>
      </tr>

 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" onclick="goFindId()">아이디 찾기</button>
 </div>
</form>
</body>
</html>
<script>
	function goFindId(){
		let xhttp = new XMLHttpRequest();
		let url = "/mvc1/member.do?cmd=member_find_id_proc&m_name="
				+document.getElementById("m_name").value
				+"&m_email="+document.getElementById("m_email").value;
		console.log(url);
		xhttp.onload=function(){
			console.log(this.responseText);
			let data=JSON.parse(this.responseText);
			if(data.result == "success"){
				alert("찾으시는 아이디는 " + data.m_userid + "입니다.");
				location.href="<%=CONTEXT%>/index.jsp";
			}else{
				alert("이름과 이메일 주소를 다시 확인해 주세요.");
			}
		}		
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	

</script>