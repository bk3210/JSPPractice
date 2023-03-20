<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.kosa.mvc1.gallery.*" %>
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
String seq = request.getParameter("seq");
%>

<form name="myform">
	<input type="hidden" name="seq" value="<%=seq%>">
	<input type="hidden" name="cmd">

<!-- 메뉴 -->

<%@include file="/include/navbar.jsp" %>
<div class="container mt-3">
 <h3>게시판 상세보기</h3>
 <p></p>
    <%
    	GalleryDTO dto = (GalleryDTO)request.getAttribute("dto");
    %>
   <table class="table">
   	<colgroup>
   		<col width="15%">
   		<col width="18%">
   		<col width="15%">
   		<col width="18%">
   		<col width="15%">
   		<col width="18%">
   	</colgroup>
    <tbody>
      <tr>
        <th>제목</td>
        <td>
        	<%=dto.getTitle() %>
        </td>
        <th>작성자</td>
        <td  colspan="5">
        	<%=dto.getM_name() %>
        </td>
        </tr>
      <tr>
        <th>작성일</td>
        <td>
        	<%=dto.getWdate() %>
        </td>
        <th>조회수</td>
        <td colspan="10">
        	<%=dto.getHit() %>
        </td>
      </tr>
      <tr>
        <th colspan="10">내용</th>
      </tr>
      <tr>
        <!-- 칸 깨지지 않게 하기 -->
        <td colspan="10" style="word-break:break-all">
        	<img src="<%=CONTEXT%>/upload/gallery/<%=dto.getImage()%>"  style="width:100%">
	        </td>   
		</tr>
		<tr>
	        <td colspan="10" style="word-break:brea-all">
        	 <%=dto.getContents().replaceAll("\n", "<br/>") %>
        </td>
        </tr>

    </tbody>
  </table>
 </div>


 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" id="btnList">글목록</button>&nbsp;
	<%if(dto.getWriter().equals(session.getAttribute("m_userid"))) { %>
	<!-- session.getAttribute의 값이 null이면 equals 호출을 할 수 없기 때문에 dto.getWriter()가 앞으로 와야 함
	해당 글을 쓴 회원이 아닐 경우 수정, 삭제를 할 수 없도록 -->
	<!-- 만약 이 동작이 수행된다면 button 객체가 생성되지 않아 아래 자바 스크립트에 에러가 발생할 수 있으므로
	밑에서도 addEventListener 메소드에 if문을 적용시켜줘야 한다 -->
	<button type="button" class="btn btn-primary" id="btnModify">글수정</button>&nbsp;
	<button type="button" class="btn btn-primary" id="btnDelete">글삭제</button>
	<%} %>
 </div> 
</form>

</body>
</html>
<script>
	window.onload=()=>{
		let btnList = document.getElementById("btnList");
		btnList.addEventListener("click", ()=>{
			var frm = document.myform;
			frm.action = "<%=CONTEXT%>/gallery.do";
			frm.cmd.value="list";
			frm.submit();
		});
		
		<%if(dto.getWriter().equals(session.getAttribute("m_userid"))) { %>
		let btnModify = document.getElementById("btnModify");
		btnModify.addEventListener("click", ()=>{
			var frm = document.myform;
			frm.action = "<%=CONTEXT%>/gallery.do";
			frm.cmd.value="modify";
			frm.submit();
		});
		<%} %>
		
		<%if(dto.getWriter().equals(session.getAttribute("m_userid"))) { %>
		let btnDelete = document.getElementById("btnDelete");
		btnDelete.addEventListener("click", ()=>{
			var frm = document.myform;
			frm.action = "<%=CONTEXT%>/gallery.do";
			frm.cmd.value="delete";
			frm.submit();
		});	
		<%} %>
	}
	
</script>