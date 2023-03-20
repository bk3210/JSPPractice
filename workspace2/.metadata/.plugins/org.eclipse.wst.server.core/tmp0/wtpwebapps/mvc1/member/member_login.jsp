<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kosa.mvc1.guestbook.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery로 로그인하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
	<button type="button" class="btn btn-primary" onclick="goFindId()">아이디 찾기</button>
	<button type="button" class="btn btn-primary" onclick="goFindPassword()">패스워드 찾기</button>
 </div>
</form>
</body>
</html>
<script>
	function goLogin(){
		let m_userid = document.getElementById("m_userid").value;
		let m_password = document.getElementById("m_password").value;
		$.ajax({
			url:"<%=CONTEXT%>/member.do",
			data:{cmd:"member_login_proc", m_userid:m_userid, m_password:m_password},
			dataType:"JSON",
			method:"POST"
		})
		.done((response)=>{
			console.log(response);
			if(response.result=="success"){
				alert("로그인에 성공하셨습니다.");
				location.href="<%=CONTEXT%>/index.jsp";
			}else{
				alert("아이디와 비밀번호를 다시 확인하세요.");
				}
		})
		.fail((response, status, error)=>{
			console.log(status);
		});
	}
	
	function goFindId(){
		location.href="<%=CONTEXT%>/member.do?cmd=member_find_id";
	}
	
	function goFindPassword(){
		location.href="<%=CONTEXT%>/member.do?cmd=member_find_password";
	}
	
	<%-- 
	function goLogon()
	{
		data={
			cmd:"member_login_proc", 
			m_userid:$("#m_userid").val(),
			m_password:$("#m_password").val()
		}
		
		$.ajax({
			url:"<%=CONTEXT%>/member.do",
			data:data,
			dataType:"JSON",
			method:"POST"
		})
		.done( (response)=>{
			if(response.result=="success")
			{
				alert("로그인 성공");
				location.href="<%=CONTEXT%>/index.jsp"; 
			}
			else
			{
				alert("아이디나 비밀번호가 일치하지 않습니다");
			}
		})
		.fail( (response, status)=>{
			console.log(status);
		})
	} 
	--%>
</script>