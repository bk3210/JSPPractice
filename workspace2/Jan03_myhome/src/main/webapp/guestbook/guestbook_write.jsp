<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	// seq파라미터값을 받아서 데이터 가져오기, 조회수 증가 두 가지 작업 수행함
	String seq = request.getParameter("seq");
	String mode = request.getParameter("mode");	// 수정 작업을 할 때는 파라미터를 하나 더 받는다

	String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc .jar파일 중에 드라이버를 얘가 사용하려고 불러오고 있음
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; // jdbc에 연결할 것이다, thin 방식으로, @이하는 접속할 DB서버의 ip주소, 
	String userid = "user01";
	String pwd = "1234";
	// 근데 사실 이런식으로 코드에 정보를 노출시키면 안됨!!

	Class.forName(driver); //드라이브 파일 로딩, 얘는 객체 생성중
	// DB접속 연결 객체 conn 생성, 생성된 애는 객체를 생성하지 않고 DriverManager 클래스로 직접 접근하고 있음
	Connection conn = DriverManager.getConnection(url, userid, pwd);
	// String sql = "update tb_guestbook set hit=hit+1 where seq =" + seq;
	String sql = "";	// update 아니니까 쿼리 돌릴 필요 없음
	Statement stmt = conn.createStatement();
	// stmt.execute(sql);		// insert, update, delete를 처리하는 객체
	sql = "select * from tb_guestbook where seq=" + seq;
	ResultSet rs = stmt.executeQuery(sql); // executeQuery가 DB로 가서 정보를 가져옴 -> 그걸 가져오는 애가 resultSet 객체
	
	String title = "";
	String writer = "";
	String contents = "";
	String hit = "";
	String wdate = "";
	if(rs.next()){
		title = rs.getString("title");
		writer = rs.getString("writer");
		contents = rs.getString("contents");
		hit = rs.getString("hit");
		wdate = rs.getString("wdate");
	}
	rs.close();
	stmt.close();
	conn.close();
	%>
	
<form name = "myform">
	<input type="hidden" name="seq" value="<%=seq %>">
	<input type="hidden" name="mode" value="<%=mode %>">	<!-- 두 개의 파라미터 -->
<!-- 메뉴 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="/myhome2/images/img_avatar1.png" alt="Avatar Logo" 
         style="width:40px;" class="rounded-pill"> 
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>  
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Dropdown</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Link</a></li>
            <li><a class="dropdown-item" href="#">Another link</a></li>
            <li><a class="dropdown-item" href="#">A third link</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>




<div class="container mt-3">
  <h3>Navbar With Dropdown</h3>
  <p>This example adds a dropdown menu in the navbar.</p>
  

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
			    name="title" id="title" value="<%=title %>">	<!-- value값을 줘서 수정할 때 seq에 딸려서 전달 -->
			 </div>
        </td>
      </tr>
      <tr>
        <th>작성자</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" placeholder="이름을 입력하세요"
			    name="writer" id="writer" value="<%=writer%>">
			 </div>
        </td>
      </tr>
      <tr>
        <th>내용</td>
        <td>
        	 <div class="input-group">
			    <textarea class="form-control" placeholder="내용을 입력하세요"
			    name="contents" id="contents" rows="5"><%=contents%></textarea>	<!--  textarea 태그에는 value속성이 없음 -->
			 </div>
        </td>
      </tr>
      
      
    </tbody>
  </table>
 </div>


 <div class="container" style="text-align:right">	<!-- 글쓰기/글수정에 따라 버튼 경로를 다르게 지정 -->
 <%if(mode.equals("insert")){%>
	 <button type=button class="btn btn-primary" id="btnSend">글쓰기</button>
	
 <%}else{%>
	<button type="button" class="btn btn-primary" id="btnModify">수정</button>

 <%}%>
 <button type="button" class="btn btn-primary" id="btnList">글목록</button>
 </div>
 </form>
</body>
</html>
<script>
	window.onload =()=>{
		// 1. 글쓰기 버튼에 대한 참조를 가져옴
		let btnSend = document.getElementById("btnSend");
		let btnModify = document.getElementById("btnModify");
		let btnDelete = document.getElementById("btnDelete");
		// 2. 버튼 객체에 이벤트 핸들러를 연결
		<%if(mode.equals("insert")){%>
		btnSend.addEventListener("click", (e)=>{
			e.preventDefault();
			let frm = document.myform;
			frm.action="guestbook_proc.jsp";
			frm.method="post";
			frm.submit();	// 서버 전송
		})
		<%}else{%>
		btnModify.addEventListener("click", (e)=>{
			e.preventDefault();
			let frm = document.myform;
			frm.action="guestbook_proc.jsp";
			frm.method="post";
			frm.submit();	// 서버 전송
		})
		<%}%>		
		btnList.addEventListener("click", (e)=>{
			e.preventDefault();
			let frm = document.myform;
			frm.action="guestbook_list.jsp";
			frm.method="post";
			frm.submit();	// 서버 전송
		})

			}

</script>