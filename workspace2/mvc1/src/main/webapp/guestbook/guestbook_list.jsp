<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kosa.mvc1.guestbook.*, com.kosa.mvc1.common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
<%
String pg = request.getParameter("pg");
String searchOpt = request.getParameter("searchOpt");
String searchKey = request.getParameter("searchKey");
if(pg==null || pg.equals("")){
	pg="0";
}
if(searchOpt==null || searchOpt.equals("")){
	searchOpt="";
}
if(searchKey==null || searchKey.equals("")){
	searchKey="";
}


%>
<form name="myform" id="myform">
	<input type="hidden" name="cmd" id="cmd"	/>
	<input type="hidden" name="pg" id="pg"	value="<%=pg%>"/>
	<input type="hidden" name="searchOpt" id="searchOpt" value="<%=searchOpt %>"	/>
<!-- 이 페이지에서 넘길 파라미터는 cmd(실행동작지정)와 pg(페이지처리), searchOpt(검색조건구분) -->

<!-- 메뉴 -->
<%@include file="/include/navbar.jsp" %>
<div class="container mt-3">
  <h3>게시판</h3>
  
   <div class="input-group mt-3 mb-3">
	  <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
	  <span id="select">선택하세요</span>
	  </button>
	  <ul class="dropdown-menu">
	    <li><a class="dropdown-item" href="#none" onclick="goSelect('1')">제목</a></li>
	    <li><a class="dropdown-item" href="#none" onclick="goSelect('2')">내용</a></li>
	    <li><a class="dropdown-item" href="#none" onclick="goSelect('3')">제목+내용</a></li>
	  </ul>
	  <!-- 서버로 키값을 넘기는 input 태그 -->
	  <input type="text" class="form-control" placeholder="검색어를 입력하세요"
	  name="searchKey" id="searchKey" value="<%=searchKey%>">
	  
	  <div class="input-group-append">
	  	<button class="btn btn-primary" type="button" onclick="goSearch()">GO</button>
	  </div>
	</div>

   <table class="table">
   <!-- 테이블 열별로 공통 스타일을 적용하고자 할 때 colgroup 사용, 각 컬럼의 크기 지정에 많이 사용됨 -->
   <colgroup>
   	<col style="width:8%">
   	<col style="width:*">
   	<col style="width:12%">
   	<col style="width:16%">
   	<col style="width:12%">
   </colgroup>
    <thead class="table-dark">
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    <%
    int totalCnt = (int)request.getAttribute("totalCnt");
    // 다운캐스팅
    List<GuestbookDTO> list = (List<GuestbookDTO>)request.getAttribute("list");
    for(GuestbookDTO dto : list){
    	String url=CONTEXT+"/guestbook.do?cmd=view&seq="+dto.getSeq();
    %>
      <tr>
        <td><%=totalCnt-dto.getRnum()+1%></td>		<!-- sequence를 직접적으로 노출하지 않는다 -->
        <td><a href="<%=url%>"><%=dto.getTitle() %></a></td>
        <td><%=dto.getM_name() %></td>
        <td><%=dto.getWdate() %></td>
        <td><%=dto.getHit() %></td>
      </tr>
      <%
    }
      %>
    </tbody>
  </table>
 </div>
 <div class="container" style="text-align:right">
  <%=Pager.makeTag(request, totalCnt, 10)%>
</div>

 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" id="btnWrite">글쓰기</button>
 </div>
  
</form>
</body>
</html>
<script>
	let titles=["선택하세요", "제목", "내용", "제목+내용"];
	window.onload=()=>{
		// 자바스크립트에서 자바 코드 접근 가능
		let sel = '<%=searchOpt%>';
		console.log(sel);
		if(sel==""){
			sel=0;			
		}

		let btnWrite = document.getElementById("btnWrite");
			btnWrite.addEventListener("click", ()=>{
			$("#select").html(titles[sel]);			
			let m_userid = '<%=session.getAttribute("m_userid")%>';
			console.log(m_userid);
			if(m_userid=="null"||m_userid==""){
				alert("로그인이 필요합니다.");
				location.href="<%=CONTEXT%>/member.do?cmd=member_login";
				// 로그인 페이지로 이동하기
				return;
			}
			let frm = document.myform;
			frm.action = "<%=CONTEXT%>/guestbook.do";
			frm.cmd.value="write";
			frm.submit();
		});
	}
	
	function goPage(page){		// page는 page 번호
		var frm = document.myform;
		frm.pg.value = page;		// 어느 페이지로 이동할지에 대한 패러미터값이 담긴 page
		frm.cmd.value="list";
		frm.action="<%=CONTEXT%>/guestbook.do";
		frm.submit();
	}	
		
	function goSelect(sel){	// 검색 조건 카테고리를 지정해주는 메소드
		$("#searchOpt").val(sel);	// 여기서 sel은 onclick="goSelect('1')"의 '1'
		$("#select").html(titles[sel]);
		// li태그에는 value가 없어서 서버로 값을 보낼 수 없기 때문에 hidden 태그에 값을 저장
		
	}
	
	function goSearch(){
		var frm = document.myform;
		frm.pg.value=0;			// 검색을 할 때 현재 페이지 위치가 32페이지인데 결과값이 5페이지밖에 안 된다면 문제가 발생하므로, 검색을 하면 무조건 1페이지로 이동하도록
		frm.cmd.value="list";
		frm.action="<%=CONTEXT%>/guestbook.do";
		frm.submit();
	}		
	
</script>