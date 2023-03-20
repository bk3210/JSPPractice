<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kosa.mvc2.board.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>jQuery로 회원가입하기</title><meta name="viewport" content="width=device-width, initial-scale=1">
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
			    name="b_m_userid" id="b_m_userid">
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
			    name="b_m_password" id="b_m_password">
			 </div>
        </td>
      </tr>
      <tr>
        <th>패스워드확인</td>
        <td>
        	 <div class="input-group">
			    <input type="password" class="form-control" 
			    placeholder="패스워드를 입력하세요"
			    name="b_m_password2" id="b_m_password2">
			 </div>
        </td>
      </tr>
      <tr>
        <th>이름</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" 
			    placeholder="이름을 입력하세요"
			    name="b_m_name" id="b_m_name">
			 </div>
        </td>
      </tr>
      <tr>
        <th>이메일</td>
        <td>
        	 <div class="input-group">
			    <input type="email" class="form-control" 
			    placeholder="이름을 입력하세요"
			    name="b_m_email" id="b_m_email">
			 </div>
        </td>
      </tr>
      <tr>
        <th>전화번호</td>
        <td>
        	 <div class="input-group">
			    <input type="tel" class="form-control" 
			    placeholder="전화번호를 입력하세요"
			    name="b_m_phone" id="b_m_phone">
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
		let b_m_userid = document.getElementById("b_m_userid").value;
		// 체이닝기술, 객체().함수호출().함수호출()..... 이런 식으로 줄줄이 엮어가는 기법
		$.ajax({
			url:"<%=CONTEXT%>/member.do",
			data:{cmd:"idcheck", b_m_userid:b_m_userid},
			dataType:"JSON",
			method:"POST"
		})
		.done((response)=>{
			// response를 받아서 처리
			// 응답이 dataType:"JSON"으로 보내졌다면 JSON객체를 전달받는다(자동 parsing)
			console.log(response);
		if(response.result=="success"){
			alert("사용 가능한 아이디입니다.");
			$("#idcheck").val("Y");
			$("#b_m_userid").prop("disabled", true);
		}else{
			alert("이미 사용중인 아이디입니다.");
		}
		})	// 통신에 성공했을 때 처리할 메소드 전달
		.fail((request, status, error)=>{
			console.log(request);
			console.log(status);
			console.log(error);
		});			// 통신에 실패했을 때 처리할 메소드 전달
		// ajax는기본적으로 비동기 처리를 하기 때문에 return값이 없음
		// 동작을 수행하고 난 뒤에 성공시 done, 실패시 fail로 전달된 함수를 실행함
		
		// controller의 doIdCheck 메서드가 JSON형식의 데이터를 보내고 있어야 여기서 받을 수 있다
	}
	
	// goSave는 POST방식으로 보내야 함
	function goSave(){
		if($("#idcheck").val()=="N"){
			alert("아이디 중복체크를 하세요.");
			$("#b_m_userid").focus();
			return false;
		}
		let b_m_userid=$("#b_m_userid").val();
		let b_m_password=$("#b_m_password").val();
		let b_m_name=$("#b_m_name").val();
		let b_m_email=$("#b_m_email").val();
		let b_m_phone=$("#b_m_phone").val();
		$.ajax({	
				url:"<%=CONTEXT%>/member.do",
				data:{cmd:"member_save", b_m_userid:b_m_userid, b_m_email:b_m_email, b_m_password:b_m_password, b_m_name:b_m_name, b_m_phone:b_m_phone},
				dataType:"JSON",
				method:"POST"				
				})
		.done((response)=>{
			if(response.result=="success"){
				alert("회원가입 되었습니다.");
				location.href="<%=CONTEXT%>/board.do";
			}else{
			alert("회원가입에 실패하였습니다.");
			}
		})
		.fail((response, status, error)=>{
			console.log(status);
		});
	}

</script>