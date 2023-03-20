<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.kosa.mvc1.guestbook.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%
	// forward로 페이지 이동 작업을 수행할 때는 이전 페이지에서 받았던 데이터도 함께 가져온다
	String cmd = request.getParameter("cmd");
	String seq = request.getParameter("seq");
	GuestbookDTO dto = (GuestbookDTO)request.getAttribute("dto");
	// write와 modify를 둘 다 이 jsp에서 수행함
	if(dto == null) {	// cmd=list -> cmd=write로 온 경우에는 dto가 없다
			dto = new GuestbookDTO();	// 비어있는 객체 생성
	}
%>

	<%@include file="/include/navbar.jsp" %>
	<!-- 메뉴 -->
<form name = "myform" id="myform" method="post" enctype="multipart/form-data">
	<!-- 처리할 작업 두개, 파라미터 두 개, 전달하는 태그도 두 개 -->
	<!--  ajax는 id로만 접근할 수 있으므로 form 태그에 아이디 부여	-->
	<input type="hidden" name="cmd" id="cmd" value="<%=cmd%>">
	<input type="hidden" name="seq" id = "seq" value="<%=seq %>">


<div class="container mt-3">
  <h3>게시판</h3>
  

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
			    name="title" id="title" value="<%=dto.getTitle()%>">
			 </div>
        </td>
      </tr>
      <tr>
        <th>작성자</td>
        <td>
        	 <div class="input-group">
        	 	<input type="hidden" name="writer" id="writer" value="<%=session.getAttribute("m_userid")%>">
			    <input type="text" class="form-control" placeholder="이름을 입력하세요"
			    name="m_name" id="m_name" value="<%=session.getAttribute("m_name")%>">
			 </div>
        </td>
      </tr>
      <tr>
        <th>내용</td>
        <td>
        	 <div class="input-group">
			    <textarea class="form-control" placeholder="내용 입력하세요"
			    name="contents" id="contents" rows="5"><%=dto.getContents()%></textarea>
			 </div>
        </td>
      </tr>
      <tr>
        <th>이미지</td>
        <td>
        	 <div class="input-group">
			    <input type="file" class="form-control" placeholder="이미지를 선택하세요" name="image" id="image">
			 </div>
        </td>
      </tr>
    </tbody>
  </table>
 </div>

 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" id="btnSave">글쓰기</button>
 </div>
</form>
</body>
</html>
<script>
$(()=>{
	$("#btnSave").click(()=>{
		// JSON 객체 생성할 때 url, data:{m_id:"test1", password:"1234..."}일일이 써주는걸 한번에 해결하는 방법
		// 서버로 전송할 파라미터를 읽어와서 data를 자동으로 만들어줌
		//		1. 직렬화 : 객체를 네트워크나 파일로 그대로 전송하는 것
		//		2. FormData 객체 사용
		
		// ajax는 id로만 접근할 수 있으므로 form 태그에 id 부여
		// 또, serialize 함수는 id로 접근하므로 form 태그에 id 부여
		// serialize 함수는 파일 첨부가 불가능하다
		let param=$("#myform").serialize();	
		// Ajax 통신에 맞춰 새 커맨드 메소드를 추가해야 한다(기존 cmd 부여 메소드가 적용되지 않음)
		$("#cmd").val("save2");
		console.log(param);
		// const formData = new FormData($("#myform")[0]);		//form 객체 배열로 가져오기 때문에 인덱스 지정(ajax로 넘길때 사용)
		// console.log(formData);		
		
		const formData = new FormData(document.myform);	// ajax 아닌걸로 넘길 때 사용(둘 다 같은 결과)
		console.log(formData);
		
		// 정보를 저장할 때, 키+값의 형태로 저장함
		// formData 내부의 keys() 메소드는 키값만 배열 형태로 가져옴
		// of 연산자는 객체 배열로부터 객체를 하나씩 가져오는 연산자
		for(key of formData.keys()){
			console.log(key, formData.get(key));	// key 안에 어떤 데이터가 저장되어 있는지 확인
		}
			
		$.ajax({
			url:"<%=CONTEXT%>/gallery.do",
			data:formData,
			dataType:"JSON",	// 받아오는 데이터 타입이 JSON이라는 뜻(보내는 게 아님)
			type:"POST",	// 파일 전송은 반드시 POST 형식
			enctype:"multipart/form-data",	// 파일 전송 타입으로 데이터를 보냄(controller에서도 multipart 타입으로 데이터를 받아야 함)
			processData:false,
			contentType:false
		})
		.done((response)=>{
			console.log(response);
			if(response.result=="success"){
				alert("새 글이 등록되었습니다.");
				location.href="<%=CONTEXT%>/gallery.do?cmd=list&pg=0";
			}
		})
		.fail((response, status, error)=>{
			console.log(status);
		})
	})
}) 


</script>