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
<h3>로그인</h3>
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
        <th>패스워드</td>
        <td>
        	 <div class="input-group">
			    <input type="password" class="form-control" 
			    placeholder="패스워드를 입력하세요"
			    name="m_password" id="m_password">
			 </div>
        </td>
      </tr>

 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" onclick="goLogin()">로그인</button>
 </div>
</form>
</body>
</html>
<script>
	function goLogin(){
		let xhttp = new XMLHttpRequest();
		let url = "/mvc1/member.do?cmd=member_login_proc&m_userid="
				+document.getElementById("m_userid").value
				+"&m_password="+document.getElementById("m_password").value;
		console.log(url);
		xhttp.onload=function(){
			console.log(this.responseText);
			let data=JSON.parse(this.responseText);
			if(data.result == "success"){
				// alert("로그인 되었습니다.");
				location.href="<%=CONTEXT%>/index.jsp";
			}else{
				alert("아이디나 비밀번호를 다시 확인해 주세요.");
			}
		}		
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	

</script>