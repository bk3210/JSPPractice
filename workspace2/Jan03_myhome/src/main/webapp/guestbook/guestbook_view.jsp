<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
	String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc .jar파일 중에 드라이버를 얘가 사용하려고 불러오고 있음
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; // jdbc에 연결할 것이다, thin 방식으로, @이하는 접속할 DB서버의 ip주소, 
	String userid = "user01";
	String pwd = "1234";
	// 근데 사실 이런식으로 코드에 정보를 노출시키면 안됨!!

	Class.forName(driver); //드라이브 파일 로딩, 얘는 객체 생성중
	// DB접속 연결 객체 conn 생성, 생성된 애는 객체를 생성하지 않고 DriverManager 클래스로 직접 접근하고 있음
	Connection conn = DriverManager.getConnection(url, userid, pwd);
	String sql = "update tb_guestbook set hit=hit+1 where seq =" + seq;
	Statement stmt = conn.createStatement();
	stmt.execute(sql);		// insert, update, delete를 처리하는 객체
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

<form name="myform" >
	<!-- 입력 필드를 숨기면 사용자가 보내지는 정보값을 볼 수 없음 - DB업데이트, 중요한 보안 토큰을 전달할 때 사용 -->
	<input type="hidden" name="mode" value="modify">
	<input type="hidden" name="seq" value="<%=seq %>"> <!-- 화면에 수정할 글 내용이 함께 전달되게 seq를 값으로 보냄 -->

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
   		<col width="20%">
   		<col width="30%">
   		<col width="20%">
   		<col width="30%">
   	</colgroup>
    <tbody>
      <tr>
        <th>제목</th>
        <td colspan = "3">
        	<%=title%> 
        </td>
      </tr>
      <tr>
        <th>작성자</th>
        	<td><%=writer%></td> 
        	<th>작성일</th>
        	<td><%=wdate%>(<%=hit%>)</td>
      </tr>
      <tr>
      <th>글 내용</th>
        <!-- word-break : textarea의 창 크기를 화면에 맞게 유지해주는 속성 -->
        <td colspan = "3" style="word-break:break-all">
        <!-- textarea태그에서는 엔터키를 \r\n로 인식하고, 화면에서 보기 위해서는 br로 바꿔준다 -->
        	<%=contents.replaceAll("\r\n", "<br/>")%> 
        	
        </td>
      </tr>
      
    </tbody>
  </table>
 </div>

 <div class="container" style="text-align:right">
	<button type="button" id="btnModify" class="btn btn-primary">수정</button>&nbsp;&nbsp;
	<button type="button" id="btnDelete" class="btn btn-primary">삭제</button>&nbsp;&nbsp;
	<button type="button" id="btnList" class="btn btn-primary">글목록</button>
 </div>
</form>
</body>
</html>
<script>
	window.onload=()=>{
		document.getElementById("btnModify").addEventListener("click",goModify);
		document.getElementById("btnDelete").addEventListener("click",goDelete);
		document.getElementById("btnList").addEventListener("click",goList);
	}
	
	function goModify(){
		let frm = document.myform;
		frm.action = "guestbook_write.jsp";
		frm.submit();
		// 수정할 때 seq값을 함께 보내줘야 수정할 수 있음(db에서 seq를 pk로 잡아서)
	}
	
	function goDelete(){
		if(confirm("삭제하시겠습니까?")){
			let frm = document.myform;
			frm.mode.value = "delete";
			frm.action = "guestbook_proc.jsp";
			frm.submit();
		}
	}
	
	function goList(){
		location.href = "/Jan03_myhome/guestbook/guestbook_list.jsp";
	}
</script>