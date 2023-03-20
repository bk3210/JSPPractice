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
<h3>비밀번호 찾기</h3>
   <table class="table">
   	<colgroup>
   		<col width="30%">
   		<col width="*">
   	</colgroup>
    <tbody>
      <tr>
        <th>아이디</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" 
			    placeholder="아이디를 입력하세요"
			    name="m_userid" id="m_userid">
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
	<button type="button" class="btn btn-primary" onclick="goFindPassword()">비밀번호 찾기</button>
 </div>
</form>
</body>
</html>
<script>
	function goFindPassword(){
		let xhttp = new XMLHttpRequest();
		let url = "/mvc1/member.do?cmd=member_find_password_proc&m_userid="
				+document.getElementById("m_userid").value
				+"&m_email="+document.getElementById("m_email").value;
		console.log(url);
		xhttp.onload=function(){
			console.log(this.responseText);
			let data=JSON.parse(this.responseText);
			if(data.result == "success"){
				alert("찾으시는 비밀번호는 " + data.m_password + "입니다.");
				location.href="<%=CONTEXT%>/index.jsp";
			}else{
				alert("아이디와 이메일 주소를 다시 확인해 주세요.");
			}
		}		
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	
</script>