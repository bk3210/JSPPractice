<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kosa.mvc2.board.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery로 아이디 찾기</title>
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
 </tbody>
 </table>
 </div>

 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" onclick="goFindId()">아이디 찾기</button>
 </div>
 <div class="container" id="findid" style="text-align:center">
 </div>
 </form>
</body>
</html>
<script>
	function goFindId(){
		// data에 들어갈 parameter들을 JSON 객체로 묶어서 저장
		data={	
				cmd:"member_find_id_proc",
				m_name:$("#b_m_name").val(),
				m_email:$("#b_m_email").val()
		}
		
		$.ajax({
			url:"<%=CONTEXT%>/member.do",
			data:data,
			dataType:"JSON",
			method:"POST"
		})
		.done((response)=>{
			if(response.result=="success"){
				$("#findid").html("찾으시는 아이디는 "+response.b_m_userid+"입니다.");
			}else{
				alert("일치하는 정보가 없습니다.");
			}
		})
		.fail((response, status)=>{
			console.log(status);
		})
	}

</script>