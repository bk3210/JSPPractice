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
			    <a href="#none" onclick="goIDCheck()"><span class="input-group-text">아이디중복체크</span></a>
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
      <tr>
        <th>패스워드확인</td>
        <td>
        	 <div class="input-group">
			    <input type="password" class="form-control" 
			    placeholder="패스워드를 입력하세요"
			    name="m_password2" id="m_password2">
			 </div>
        </td>
      </tr>
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
			    <input type="email" class="form-control" 
			    placeholder="이름을 입력하세요"
			    name="m_email" id="m_email">
			 </div>
        </td>
      </tr>
      <tr>
        <th>전화번호</td>
        <td>
        	 <div class="input-group">
			    <input type="tel" class="form-control" 
			    placeholder="전화번호를 입력하세요"
			    name="m_phone" id="m_phone">
			 </div>
        </td>
      </tr>
    </tbody>
  </table>
 </div>


 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" onclick="goSave()">등록</button>
 </div>
</form>
</body>
</html>
<script>
	function goIDCheck(){
		let xhttp = new XMLHttpRequest();
		let url = "/mvc1/member.do?cmd=idcheck&m_userid="
				+document.getElementById("m_userid").value;
		
		xhttp.onload=function(){
			console.log(this.responseText);
			let data = JSON.parse(this.responseText);
			if(data.result == "success"){
				alert("사용 가능한 아이디입니다.");
				document.getElementById("idcheck").value="Y";
				document.getElementById("m_userid").disabled=true;	// 중복체크 이후에는 더이상 m_userid를 입력할 수 없도록 비활성화
			}else{
				alert("이미 사용중인 아이디입니다.");
			}
		}		
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	
	// goSave는 POST방식으로 보내야 함
	function goSave(){
		if(document.getElementById("idcheck").value != 'Y'){	// id 중복체크를 하지 않았을 때
			alert("아이디 중복체크를 하세요");
			doument.getElementById("m_userid").focus();
			return false;
		}
		let xhttp = new XMLHttpRequest();
		xhttp.onload=function(){
			let data = JSON.parse(this.responseText);		// 데이터를 JSON형식으로 바꿈
			console.log(this.responseText);
			if(data.result == "success"){
				alert("회원가입이 완료되었습니다.");
				location.href="<%=CONTEXT%>/index.jsp";	// 메인페이지로 이동
				// 자바스크립트로 페이지 이동 기능 처리
			} else{
				alert("회원가입에 실패하셨습니다");
		}
		}
		
		// 파라미터 만들기
		let params = "cmd=member_save"	// 읽어올 게 없으니까 그냥
		+ "&m_userid=" + document.getElementById("m_userid").value
		+"&m_name=" + document.getElementById("m_name").value
		+"&m_password=" + document.getElementById("m_password").value
		+"&m_email=" + document.getElementById("m_email").value
		+"&m_phone=" + document.getElementById("m_phone").value;
		
		console.log(params);
		// POST일 때 처리방법
		// GET일 땐 그냥 xhttp.send()로 보냈었음
		xhttp.open("POST", "/mvc1/member.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send(params);
		// 파일을 전송할 땐 다른 방식을 쓴다
	}

</script>